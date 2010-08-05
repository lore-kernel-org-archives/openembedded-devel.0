Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Oh5o8-0005NO-JT
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 21:09:01 +0200
Received: by wwi17 with SMTP id 17so427300wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 12:08:40 -0700 (PDT)
Received: by 10.227.44.6 with SMTP id y6mr9146275wbe.17.1281035319750;
	Thu, 05 Aug 2010 12:08:39 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id e31sm460958wbe.23.2010.08.05.12.08.36
	(version=SSLv3 cipher=RC4-MD5); Thu, 05 Aug 2010 12:08:38 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 14:08:34 -0500
Message-Id: <1281035314-13509-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-uboot-scripts: fixed tests for revision
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
X-List-Received-Date: Thu, 05 Aug 2010 19:09:01 -0000

Tests in u-boot scripts require the 'test' function.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/angstrom/angstrom-uboot-scripts.bb         |    2 +-
 .../beagleboard-validation-boot.cmd                |    4 ++--
 .../beagleboard-validation-user.cmd                |    6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/recipes/angstrom/angstrom-uboot-scripts.bb b/recipes/angstrom/angstrom-uboot-scripts.bb
index 1be681a..2152f5d 100644
--- a/recipes/angstrom/angstrom-uboot-scripts.bb
+++ b/recipes/angstrom/angstrom-uboot-scripts.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Various uboot scripts"
 
-PR = "r7"
+PR = "r8"
 
 DEPENDS = "u-boot-mkimage-native"
 
diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
index 1d0f223..50a82a6 100644
--- a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
+++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
@@ -1,9 +1,9 @@
 setenv dvimode 'hd720'
 setenv vram '16M omapfb.vram=0:8M,1:4M,2:4M'
-if "${beaglerev}" = "AxBx"; then
+if test "${beaglerev}" = "AxBx"; then
 setenv mpurate 600
 setenv optargs 'mem=80M@0x80000000 musb_hdrc.fifomode=5'
-elif "${beaglerev}" = "Cx"; then
+elif test "${beaglerev}" = "Cx"; then
 setenv mpurate 720
 setenv optargs 'mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5'
 else
diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
index 0c32ae1..6488db4 100644
--- a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
+++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
@@ -1,8 +1,8 @@
-setenv console 'tty0 console=ttyS2,115200n8'
-if "${beaglerev}" = "AxBx"; then
+setenv console 'ttyS2,115200n8 console=tty0'
+if test "${beaglerev}" = "AxBx"; then
 setenv mpurate 600
 setenv optargs 'mem=80M@0x80000000 musb_hdrc.fifomode=5'
-elif "${beaglerev}" = "Cx"; then
+elif test "${beaglerev}" = "Cx"; then
 setenv mpurate 720
 setenv optargs 'mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5'
 else
-- 
1.5.6.4



