#1. 감성분석할 데이터를 수집

reviews <- c("다 좋았는데 마지막 전투신이 좀 허무했고 뭐지 싶을 정도로 빨리 끝남",
              "전작에 비해 아쉬움 ㅁㅁ",
              "믿고 보는 범죄의 도시! 계속된 재미",
             "저도 범죄의 도시 정주행중 ㅋㅋ 그냥 1편이나 2편이나 비슷하게 재미 있는 것 같음",
             "범죄의 도시 정주행중!! 마동석 멋져",
             "확실히 2편은 뭔가 약해..쩝",
             "1편보단 못하다... 처음이랑 끝에 밖에 액션신도 없고.. 기대보단 좀... 매력이 없다",
             "악당 리얼 최민식 닮음 나만 느낌???",
             "전작에 비해 아쉽지만 여전히 어벤져서 라인업 중 가장 세련된 시리즈",
             "추천순보고 재미없는 줄 알았네 ㅋㅋㅋ 엄청 재밌는데, 액션은 평범하지만 어벤져스 까지의 내용전개에 진짜 꼭 필요한 내용, 꿀잼")
reviews[1]
## 2. 사전 만들기
pos.words <- c("멋져", "재미", "믿고", "정주행중", "세련된", "꿀잼")
neg.words <- c("기대보단", "못하다", "아쉬움", "약해..쩝", "허무했고")

### 3. 극성평가
pos.cnt <- str_count(reviews[3], pos.words) #해당 문장중에 사전에 있는 문자가 몇개있는지 판단
pos.cnt
p<-sum(pos.cnt)
neg.cnt <- str_count(reviews[3], neg.words)
neg.cnt
n <- sum(neg.cnt)
if(p+n==0){
  polarity = 0
} else{
polarity <- (p-n)/(p+n)
}
polarity # +:긍정, -:부정
### 전체 리뷰 극성평가
m <- NULL #초기화
for(i in 1:length(reviews)){ #review를 긍정사전, 부정사전에 따라 문자 몇개있는지 카운트
  pos.cnt <- str_count(reviews[i], pos.words)
  p <- sum(pos.cnt)
  neg.cnt <- str_count(reviews[i], neg.words)
  n <- sum(neg.cnt)
  if(p+n==0){
    polarity = 0
  } else{
    polarity <- (p-n)/(p+n)
  }
  m <- c(m,polarity)
}
m #확인 - 첫번째 리뷰는 부정적, 두번째리뷰는 부정적, 세번째리뷰는 긍정적...

