Received: from mail-qy0-f182.google.com ([209.85.216.182])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OicFO-0001gh-1c
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 01:59:15 +0200
Received: by qyk32 with SMTP id 32so9837863qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 16:58:59 -0700 (PDT)
Received: by 10.229.224.82 with SMTP id in18mr7862851qcb.65.1281398338780;
	Mon, 09 Aug 2010 16:58:58 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id t18sm1412586qco.20.2010.08.09.16.58.57
	(version=SSLv3 cipher=RC4-MD5); Mon, 09 Aug 2010 16:58:57 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Aug 2010 18:58:56 -0500
Message-Id: <1281398336-1620-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.182
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-test-scripts: updated to latest
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
X-List-Received-Date: Mon, 09 Aug 2010 23:59:15 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 .../beagleboard/beagleboard-test-scripts_git.bb    |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipes/beagleboard/beagleboard-test-scripts_git.bb
index d3d5fde..ea3cafe 100644
--- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
+++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
@@ -1,24 +1,28 @@
+## Reminder:  The correct spacing for a variable is FOO = "BAR"  in : PR="r1"
 DESCRIPTION = "BeagleBoard test scripts"
 HOMEPAGE = "http://beagleboad.org/support"
+PR = "r1"
 
 SRC_URI = "git://gitorious.org/beagleboard-validation/scripts.git;protocol=git \
 "
 
-SRCREV = "4f4578e7423c5fb1f3364e1056d53dd3b792dc2a"
+SRCREV = "f009c731df5c410eb819fa90f199713ea60cea6a"
 S = "${WORKDIR}/git"
 
 do_install() {
   TEST_FILES=" \
-    testled \
-    testuserbtn \
     testaudio \
+    testcamera \
+    testedid \
+    testled \
     testsvideo \
-    readgpio \
+    testuserbtn \
     editbootscr \
+    edituserscr \
+    readgpio \
   "
   install -d ${D}/${bindir}
   for i in ${TEST_FILES}; do
     install -m 0755 ${S}/${i} ${D}/${bindir}
   done
 }
-
-- 
1.5.6.4



