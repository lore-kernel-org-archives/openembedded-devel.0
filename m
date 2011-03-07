Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Pwbmt-0004u1-FK
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 15:51:55 +0100
Received: (qmail invoked by alias); 07 Mar 2011 14:50:19 -0000
Received: from p5B0A0FCF.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [91.10.15.207]
	by mail.gmx.net (mp029) with SMTP; 07 Mar 2011 15:50:19 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX1/uPg82xuTuTsPNnO2dI+J5Dk3RTGoxnZJn/73TyY
	QBav2MoVWoMNVG
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  7 Mar 2011 15:43:30 +0100
Message-Id: <1299509010-971-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH] collect-qa-errors.sh: Simplify and make it work again
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Mar 2011 14:51:55 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 contrib/qa/collect-qa-errors.sh |   23 ++++++-----------------
 1 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/contrib/qa/collect-qa-errors.sh b/contrib/qa/collect-qa-errors.sh
index 45a7283..212e0cd 100755
--- a/contrib/qa/collect-qa-errors.sh
+++ b/contrib/qa/collect-qa-errors.sh
@@ -1,26 +1,15 @@
 #!/bin/bash
 
-# A little script outputting information on all recipes with QA errors
+# A little script outputting information on all recipes with QA issues
 
 bb_tmp_dir=$(bitbake -e | grep 'TMPDIR="' | sed -e s/TMPDIR=// \
                                                 -e s/\"//g)
 
-# each temp dir is checked
-for log_dir in ${bb_tmp_dir}/work/*/*/temp ; do
-	# checked only log files
-	for log_file in ${log_dir}/log.do_* ; do
-		if [ -e  $log_file ] ; then
-			qa_err=$(grep 'ERROR: QA' $log_file)
-			if [[ -n  $qa_err ]] ; then
-				# Bingo
-				str=${log_file%/*}
-				str=${str%/*}
-				echo $str
-				# output only one occurance per recipe
-				break
-			fi
-		fi
-	done
+# report each log.qa_package in temp dir
+for log_dir in ${bb_tmp_dir}/work/*/*/temp/log.qa_package ; do
+	str=${log_dir%/*}
+	str=${str%/*}
+	echo $str
 done
 
 
-- 
1.7.2.3



