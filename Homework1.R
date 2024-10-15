#introduce file
bonds <-read.csv('Homework1_Bonds.csv')

#Question 1:
table(bonds$Result)
prop.table(table(bonds$Type,bonds$Result))

#Question 2: 
bonds$Votes_Total <- bonds$VotesFor + bonds$VotesAgainst

max_row <- bonds[which.max(bonds$Votes_Total),]
max_row

#Question 3:
approvedAndBig <- bonds[bonds$Result=='Carried' & bonds$Votes_Total > 100 ,]

approvedAndBig$percentage <- (approvedAndBig$VotesFor)/(approvedAndBig$Votes_Total)

fivenum(approvedAndBig$percentage)
IQR(approvedAndBig$percentage)

boxplot(approvedAndBig$percentage,main='% of Votes in favor of approved bonds with over 100 Votes',
  xlab='',horizontal=TRUE, ylab='% that approve',pch=20)

#Question 4:
plot(approvedAndBig$percentage,approvedAndBig$Amount,main='Margin of Approval vs. Cost of Bonds',
  xlab='% of votes in favor of Bond',ylab='Cost of Bond ($)',pch=20)

cor(approvedAndBig$percentage, approvedAndBig$Amount)

