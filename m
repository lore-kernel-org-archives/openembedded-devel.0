Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Oigub-0001Ra-Jj
	for openembedded-devel@lists.openembedded.org;
	Tue, 10 Aug 2010 06:58:06 +0200
Received: by vws13 with SMTP id 13so7513425vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 21:57:48 -0700 (PDT)
Received: by 10.220.60.204 with SMTP id q12mr9848629vch.160.1281416268458;
	Mon, 09 Aug 2010 21:57:48 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id w31sm3069662vbs.15.2010.08.09.21.57.47
	(version=SSLv3 cipher=RC4-MD5); Mon, 09 Aug 2010 21:57:47 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Aug 2010 23:57:46 -0500
Message-Id: <1281416266-10425-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] beagleboard-test-scripts: added new scripts
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
X-List-Received-Date: Tue, 10 Aug 2010 04:58:06 -0000

testneon: runs burn-neon for 10 seconds
testdsp: runs loopgpp dsplink example
testmem: runs memtester

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 .../beagleboard/beagleboard-test-scripts_git.bb    |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/recipes/beagleboard/beagleboard-test-scripts_git.bb b/recipes/beagleboard/beagleboard-test-scripts_git.bb
index ea3cafe..be0d059 100644
--- a/recipes/beagleboard/beagleboard-test-scripts_git.bb
+++ b/recipes/beagleboard/beagleboard-test-scripts_git.bb
@@ -1,20 +1,23 @@
 ## Reminder:  The correct spacing for a variable is FOO = "BAR"  in : PR="r1"
 DESCRIPTION = "BeagleBoard test scripts"
 HOMEPAGE = "http://beagleboad.org/support"
-PR = "r1"
+PR = "r2"
 
 SRC_URI = "git://gitorious.org/beagleboard-validation/scripts.git;protocol=git \
 "
 
-SRCREV = "f009c731df5c410eb819fa90f199713ea60cea6a"
+SRCREV = "473dd2ab20d866be6168c9f992c2c9e74e485c9d"
 S = "${WORKDIR}/git"
 
 do_install() {
   TEST_FILES=" \
     testaudio \
     testcamera \
+    testdsp \
     testedid \
     testled \
+    testmem \
+    testneon \
     testsvideo \
     testuserbtn \
     editbootscr \
-- 
1.5.6.4



