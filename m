Received: from proxy.dresearch.de ([87.193.137.100] helo=mail.dresearch.de)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch.de>) id 1PnrOp-00051O-Qn
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 12:42:55 +0100
Received: from exchange.intern.dresearch.de (owa.xfer-intern.dresearch.de
	[192.168.32.16])
	by mail.dresearch.de (Postfix) with ESMTP id 4406E49128C
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Feb 2011 12:41:52 +0100 (CET)
Received: from fsc-480-012-88.intern.dresearch.de ([10.32.10.177]) by
	exchange.intern.dresearch.de with Microsoft SMTPSVC(6.0.3790.4675); 
	Fri, 11 Feb 2011 12:41:52 +0100
Received: by fsc-480-012-88.intern.dresearch.de (Postfix, from userid 10000)
	id 5A3F17208C; Fri, 11 Feb 2011 12:41:50 +0100 (CET)
From: Steffen Sledz <sledz@dresearch.de>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 Feb 2011 12:41:33 +0100
Message-Id: <1297424493-25116-1-git-send-email-sledz@dresearch.de>
X-Mailer: git-send-email 1.7.1
X-OriginalArrivalTime: 11 Feb 2011 11:41:52.0414 (UTC)
	FILETIME=[AD18EBE0:01CBC9E0]
Subject: [PATCH] testscript.sh: be able to use branches other that testing-next
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
X-List-Received-Date: Fri, 11 Feb 2011 11:42:56 -0000

Signed-off-by: Steffen Sledz <sledz@dresearch.de>
---
 contrib/testing/testscript.sh |   22 ++++++++++++++--------
 1 files changed, 14 insertions(+), 8 deletions(-)

diff --git a/contrib/testing/testscript.sh b/contrib/testing/testscript.sh
index 7ae2bd5..23c244b 100755
--- a/contrib/testing/testscript.sh
+++ b/contrib/testing/testscript.sh
@@ -1,21 +1,27 @@
 # this script can be used for testing purposes.
 # see also http://wiki.openembedded.net/index.php/TestingScript
 
-# you can define your machine/distro/recipe below (remove the #) 
-# or you can pick them up from the environment
-#MACHINE="beagleboard"
-#DISTRO="minimal"
-#TARGET_RECIPE="console-image"
+# you can set your machine/distro/recipe/branch in the environment
+# or use these defaults
+[ -n "${MACHINE}" ] || MACHINE="beagleboard"
+[ -n "${DISTRO}" ] || DISTRO="minimal"
+[ -n "${TARGET_RECIPE}" ] || TARGET_RECIPE="console-image"
+[ -n "${TESTING_BRANCH}" ] || TESTING_BRANCH="testing-next"
 
 # test if we have an openembedded dir, clone it if it does not exist
 if [ ! -d openembedded ]
 then
     (git clone git://git.openembedded.org/openembedded)
-    (cd openembedded; git checkout -b testing-next origin/testing-next)
+else
+    # fetch latest objects and refs
+    (cd openembedded; git fetch)
 fi
 
+# create local testing branch if it does not exist yet
+(cd openembedded; git branch --set-upstream ${TESTING_BRANCH} origin/${TESTING_BRANCH})
+
 # switch to the testing branch
-(cd openembedded; git checkout testing-next)
+(cd openembedded; git checkout ${TESTING_BRANCH})
 
 # test if bitbake exist; if not; fetch it and untar it
 if [ ! -d bitbake-1.10.2 ]
@@ -80,7 +86,7 @@ export BBPATH=${TOPDIR}/openembedded
 rm -rf ${TOPDIR}/tmp
 
 # add an echo about the vars so we can see what has been done in a log file
-echo $MACHINE $DISTRO $TARGET_RECIPE
+echo ${MACHINE} ${DISTRO} ${TARGET_RECIPE} ${TESTING_BRANCH} `(cd openembedded;git --no-pager log --max-count=1 --pretty=format:%H)`
 
 # and do the actual work.
 bitbake ${TARGET_RECIPE}
-- 
1.7.1



