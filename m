Received: from mailout-de.gmx.net ([213.165.64.23])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <schnitzeltony@gmx.de>) id 1Pp5iE-0006dQ-MO
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 22:12:02 +0100
Received: (qmail invoked by alias); 14 Feb 2011 21:10:53 -0000
Received: from p4FE0F918.dip.t-dialin.net (EHLO
	localhost.localdomain.localdomain) [79.224.249.24]
	by mail.gmx.net (mp007) with SMTP; 14 Feb 2011 22:10:53 +0100
X-Authenticated: #62780362
X-Provags-ID: V01U2FsdGVkX18jSNVRoJcjBL+Ctq6r6yybigLgiEwzBQkmLxCh/o
	ZAfQopskJkBL9l
From: Andreas Mueller <schnitzeltony@gmx.de>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 22:06:48 +0100
Message-Id: <1297717608-30480-1-git-send-email-schnitzeltony@gmx.de>
X-Mailer: git-send-email 1.7.2.3
X-Y-GMX-Trusted: 0
Subject: [PATCH] Add a small helper script listing all recipes with QA errors.
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
X-List-Received-Date: Mon, 14 Feb 2011 21:12:02 -0000


Signed-off-by: Andreas Mueller <schnitzeltony@gmx.de>
---
 contrib/qa/collect-qa-errors.sh |   26 ++++++++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100755 contrib/qa/collect-qa-errors.sh

diff --git a/contrib/qa/collect-qa-errors.sh b/contrib/qa/collect-qa-errors.sh
new file mode 100755
index 0000000..45a7283
--- /dev/null
+++ b/contrib/qa/collect-qa-errors.sh
@@ -0,0 +1,26 @@
+#!/bin/bash
+
+# A little script outputting information on all recipes with QA errors
+
+bb_tmp_dir=$(bitbake -e | grep 'TMPDIR="' | sed -e s/TMPDIR=// \
+                                                -e s/\"//g)
+
+# each temp dir is checked
+for log_dir in ${bb_tmp_dir}/work/*/*/temp ; do
+	# checked only log files
+	for log_file in ${log_dir}/log.do_* ; do
+		if [ -e  $log_file ] ; then
+			qa_err=$(grep 'ERROR: QA' $log_file)
+			if [[ -n  $qa_err ]] ; then
+				# Bingo
+				str=${log_file%/*}
+				str=${str%/*}
+				echo $str
+				# output only one occurance per recipe
+				break
+			fi
+		fi
+	done
+done
+
+
-- 
1.7.2.3



