Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OiXSZ-0001PO-7n
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Aug 2010 20:52:33 +0200
Received: by qyk11 with SMTP id 11so2526422qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Aug 2010 11:52:21 -0700 (PDT)
Received: by 10.229.224.76 with SMTP id in12mr7617594qcb.81.1281379940859;
	Mon, 09 Aug 2010 11:52:20 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id w5sm6685489qcq.31.2010.08.09.11.52.19
	(version=SSLv3 cipher=RC4-MD5); Mon, 09 Aug 2010 11:52:20 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Aug 2010 13:52:18 -0500
Message-Id: <1281379938-24296-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-uboot-scripts: debugged beagleboard validation boot/user scripts
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
X-List-Received-Date: Mon, 09 Aug 2010 18:52:33 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/angstrom/angstrom-uboot-scripts.bb         |    2 +-
 .../beagleboard-validation-boot.cmd                |   15 +++++++--------
 .../beagleboard-validation-user.cmd                |   15 +++++++--------
 3 files changed, 15 insertions(+), 17 deletions(-)

diff --git a/recipes/angstrom/angstrom-uboot-scripts.bb b/recipes/angstrom/angstrom-uboot-scripts.bb
index 2152f5d..a478cb2 100644
--- a/recipes/angstrom/angstrom-uboot-scripts.bb
+++ b/recipes/angstrom/angstrom-uboot-scripts.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Various uboot scripts"
 
-PR = "r8"
+PR = "r9"
 
 DEPENDS = "u-boot-mkimage-native"
 
diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
index 50a82a6..71d314c 100644
--- a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
+++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-boot.cmd
@@ -1,14 +1,13 @@
-setenv dvimode 'hd720'
-setenv vram '16M omapfb.vram=0:8M,1:4M,2:4M'
+# On xM: bootargs=console=ttyS2,115200n8 mem=80M@0x80000000 mem=384M@0x88000000 mpurate=1000 buddy=none camera=lbcm3m1 vram=16M omapfb.vram=0:8M,1:4M,2:4M omapfb.mode=dvi:hd720 omapdss.def_disp=dvi root=/dev/mmcblk0p2 rw rootfstype=ext3 rootwait
+mmc init
+setenv dvimode hd720
+setenv vram 16M omapfb.vram=0:8M,1:4M,2:4M
 if test "${beaglerev}" = "AxBx"; then
-setenv mpurate 600
-setenv optargs 'mem=80M@0x80000000 musb_hdrc.fifomode=5'
+setenv optargs mem=80M@0x80000000 musb_hdrc.fifomode=5
 elif test "${beaglerev}" = "Cx"; then
-setenv mpurate 720
-setenv optargs 'mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5'
+setenv optargs mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5
 else
-setenv mpurate 1000
-setenv optargs 'mem=80M@0x80000000 mem=384M@0x88000000'
+setenv optargs mem=80M@0x80000000 mem=384M@0x88000000
 fi
 run loaduimage
 run mmcboot
diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
index 6488db4..7dbf69b 100644
--- a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
+++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
@@ -1,15 +1,14 @@
-setenv console 'ttyS2,115200n8 console=tty0'
+mmc init
+setenv rdaddr 0x81000000
+setenv ramroot /dev/ram0
 if test "${beaglerev}" = "AxBx"; then
-setenv mpurate 600
-setenv optargs 'mem=80M@0x80000000 musb_hdrc.fifomode=5'
+setenv optargs mem=80M@0x80000000 musb_hdrc.fifomode=5
 elif test "${beaglerev}" = "Cx"; then
-setenv mpurate 720
-setenv optargs 'mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5'
+setenv optargs mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5
 else
-setenv mpurate 1000
-setenv optargs 'mem=99M@0x80000000 mem=384M@0x88000000'
+setenv optargs mem=80M@0x80000000 mem=384M@0x88000000
 fi
-run loaduimage
 run loadramdisk
+run loaduimage
 run ramboot
 
-- 
1.5.6.4



