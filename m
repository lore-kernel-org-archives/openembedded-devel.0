Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1OjHh8-0006zE-Sr
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Aug 2010 22:14:40 +0200
Received: by qwi4 with SMTP id 4so136622qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Aug 2010 13:14:21 -0700 (PDT)
Received: by 10.224.96.144 with SMTP id h16mr10931193qan.372.1281557647402;
	Wed, 11 Aug 2010 13:14:07 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id e6sm658776qcr.17.2010.08.11.13.14.05
	(version=SSLv3 cipher=RC4-MD5); Wed, 11 Aug 2010 13:14:05 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 11 Aug 2010 15:14:03 -0500
Message-Id: <1281557643-24477-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot/angstrom-uboot-scripts: resize ramdisk
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
X-List-Received-Date: Wed, 11 Aug 2010 20:14:40 -0000


Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 recipes/angstrom/angstrom-uboot-scripts.bb         |    2 +-
 .../beagleboard-validation-user.cmd                |    7 +++-
 .../0001-BeagleBoard-move-ramdisk-parameters.patch |   38 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    3 +-
 4 files changed, 46 insertions(+), 4 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/beagleboard/0001-BeagleBoard-move-ramdisk-parameters.patch

diff --git a/recipes/angstrom/angstrom-uboot-scripts.bb b/recipes/angstrom/angstrom-uboot-scripts.bb
index a478cb2..020a7af 100644
--- a/recipes/angstrom/angstrom-uboot-scripts.bb
+++ b/recipes/angstrom/angstrom-uboot-scripts.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Various uboot scripts"
 
-PR = "r9"
+PR = "r10"
 
 DEPENDS = "u-boot-mkimage-native"
 
diff --git a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
index 7dbf69b..971b96e 100644
--- a/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
+++ b/recipes/angstrom/angstrom-uboot-scripts/beagleboard-validation-user.cmd
@@ -1,11 +1,14 @@
 mmc init
-setenv rdaddr 0x81000000
-setenv ramroot /dev/ram0
 if test "${beaglerev}" = "AxBx"; then
+setenv rdaddr 0x81000000
 setenv optargs mem=80M@0x80000000 musb_hdrc.fifomode=5
 elif test "${beaglerev}" = "Cx"; then
+setenv rdaddr 0x88000000
+setenv ramroot /dev/ram0 rw ramdisk_size=131072 initrd=${rdaddr},128M
 setenv optargs mem=80M@0x80000000 mem=128M@0x88000000 musb_hdrc.fifomode=5
 else
+setenv rdaddr 0x88000000
+setenv ramroot /dev/ram0 rw ramdisk_size=131072 initrd=${rdaddr},128M
 setenv optargs mem=80M@0x80000000 mem=384M@0x88000000
 fi
 run loadramdisk
diff --git a/recipes/u-boot/u-boot-git/beagleboard/0001-BeagleBoard-move-ramdisk-parameters.patch b/recipes/u-boot/u-boot-git/beagleboard/0001-BeagleBoard-move-ramdisk-parameters.patch
new file mode 100644
index 0000000..5d6e69d
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/beagleboard/0001-BeagleBoard-move-ramdisk-parameters.patch
@@ -0,0 +1,38 @@
+From c8d02f2a8500f06de39681aed60ea5c9894f8087 Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Wed, 11 Aug 2010 14:50:38 -0500
+Subject: [PATCH] BeagleBoard: move ramdisk parameters
+
+This will make it easier to reprogram the ramdisk size.
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ include/configs/omap3_beagle.h |    5 ++---
+ 1 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
+index 48ad805..4f5c1d4 100644
+--- a/include/configs/omap3_beagle.h
++++ b/include/configs/omap3_beagle.h
+@@ -217,7 +217,7 @@
+ 	"mmcrootfstype=ext3 rootwait\0" \
+ 	"nandroot=/dev/mtdblock4 rw\0" \
+ 	"nandrootfstype=jffs2\0" \
+-	"ramroot=/dev/ram0 rw\0" \
++	"ramroot=/dev/ram0 rw ramdisk_size=65536 initrd=${rdaddr},64M\0" \
+ 	"ramrootfstype=ext2\0" \
+ 	"mmcargs=setenv bootargs console=${console} " \
+ 		"${optargs} " \
+@@ -248,8 +248,7 @@
+ 		"vram=${vram} " \
+ 		"omapfb.mode=dvi:${dvimode} " \
+ 		"omapdss.def_disp=${defaultdisplay} " \
+-		"root=${ramroot} rw ramdisk_size=65536 " \
+-		"initrd=${rdaddr},64M " \
++		"root=${ramroot} " \
+ 		"rootfstype=${ramrootfstype}\0" \
+ 	"loadramdisk=fatload mmc ${mmcdev} ${rdaddr} ramdisk.gz\0" \
+ 	"bootscript=echo Running bootscript from mmc ...; " \
+-- 
+1.5.6.4
+
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index 7f26a87..19386fc 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r63"
+PR ="r64"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -71,6 +71,7 @@ SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
                        file://0044-Beagleboard-Adjust-boot.patch \
                        file://0045-BeagleBoard-Enable-pullups-on-i2c2.patch \
                        file://0046-BeagleBoard-Add-camera-to-default-bootargs.patch \
+		       file://0001-BeagleBoard-move-ramdisk-parameters.patch \
                        file://fw_env.config \
 "
 SRCREV_beagleboard = "ca6e1c136ddb720c3bb2cc043b99f7f06bc46c55"
-- 
1.5.6.4



