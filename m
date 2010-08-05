Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jkridner@beagleboard.org>) id 1Oh5jI-0005Dm-Oa
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Aug 2010 21:03:49 +0200
Received: by wwi17 with SMTP id 17so422894wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Aug 2010 12:03:42 -0700 (PDT)
Received: by 10.216.0.85 with SMTP id 63mr2451010wea.29.1281035022715;
	Thu, 05 Aug 2010 12:03:42 -0700 (PDT)
Received: from localhost.localdomain
	(ec2-75-101-156-174.compute-1.amazonaws.com [75.101.156.174])
	by mx.google.com with ESMTPS id p45sm377504weq.21.2010.08.05.12.03.40
	(version=SSLv3 cipher=RC4-MD5); Thu, 05 Aug 2010 12:03:41 -0700 (PDT)
From: Jason Kridner <jkridner@beagleboard.org>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  5 Aug 2010 14:03:37 -0500
Message-Id: <1281035017-13217-1-git-send-email-jkridner@beagleboard.org>
X-Mailer: git-send-email 1.5.6.4
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: jkridner@beagleboard.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] u-boot: beagleboard: default 3MP camera support
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
X-List-Received-Date: Thu, 05 Aug 2010 19:03:49 -0000

This turns on the pull-ups so that the I2C will work by default as well
as sets the default camera type.  Currently, the kernel cannot probe for
I2C devices, but that should be the long term fix.  We put the change
here into the default environment, instead of the boot.scr, such that
there won't be a need to update your boot.scr in the future for the
default camera if we ever get the kernel fixed to probe for I2C devcies.

Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
---
 .../0045-BeagleBoard-Enable-pullups-on-i2c2.patch  |   46 ++++++++++++++++++
 ...eagleBoard-Add-camera-to-default-bootargs.patch |   50 ++++++++++++++++++++
 recipes/u-boot/u-boot_git.bb                       |    4 +-
 3 files changed, 99 insertions(+), 1 deletions(-)
 create mode 100644 recipes/u-boot/u-boot-git/beagleboard/0045-BeagleBoard-Enable-pullups-on-i2c2.patch
 create mode 100644 recipes/u-boot/u-boot-git/beagleboard/0046-BeagleBoard-Add-camera-to-default-bootargs.patch

diff --git a/recipes/u-boot/u-boot-git/beagleboard/0045-BeagleBoard-Enable-pullups-on-i2c2.patch b/recipes/u-boot/u-boot-git/beagleboard/0045-BeagleBoard-Enable-pullups-on-i2c2.patch
new file mode 100644
index 0000000..ea3ab74
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/beagleboard/0045-BeagleBoard-Enable-pullups-on-i2c2.patch
@@ -0,0 +1,46 @@
+From bf4b655c6c02bbf95bd6ebbf820e53dbd8eb4803 Mon Sep 17 00:00:00 2001
+From: Steve Kipisz <s-kipisz2@ti.com>
+Date: Thu, 5 Aug 2010 10:36:07 -0500
+Subject: [PATCH] BeagleBoard: Enable pullups on i2c2.
+
+---
+ board/ti/beagle/beagle.c           |    2 ++
+ include/asm-arm/arch-omap3/omap3.h |    9 +++++++++
+ 2 files changed, 11 insertions(+), 0 deletions(-)
+
+diff --git a/board/ti/beagle/beagle.c b/board/ti/beagle/beagle.c
+index cdba3dd..eeb37bc 100644
+--- a/board/ti/beagle/beagle.c
++++ b/board/ti/beagle/beagle.c
+@@ -163,6 +163,8 @@ int misc_init_r(void)
+ 	struct gpio *gpio5_base = (struct gpio *)OMAP34XX_GPIO5_BASE;
+ 	struct gpio *gpio6_base = (struct gpio *)OMAP34XX_GPIO6_BASE;
+ 
++	/* Enable i22 pullup resisters */
++	*(ulong *)(CONTROL_PROG_IO1) &= ~(PRG_I2C2_PULLUPRESX);
+ 	beagle_identify();
+ 
+ 	printf("\nProbing for expansion boards, if none are connected you'll see a harmless I2C error.\n\n");
+diff --git a/include/asm-arm/arch-omap3/omap3.h b/include/asm-arm/arch-omap3/omap3.h
+index 3957c79..1860dff 100644
+--- a/include/asm-arm/arch-omap3/omap3.h
++++ b/include/asm-arm/arch-omap3/omap3.h
+@@ -50,6 +50,15 @@
+ /* CONTROL */
+ #define OMAP34XX_CTRL_BASE		(OMAP34XX_L4_IO_BASE + 0x2000)
+ 
++/* Signal Integrity Parameter Control Registers */
++#define CONTROL_PROG_IO0		0x48002444
++#define CONTROL_PROG_IO1		0x48002448
++#define CONTROL_PROG_IO2		0x48002408
++#define CONTROL_PROG_IO_WKUP1		0x48002A80
++
++/* Bit definition for CONTROL_PROG_IO1 */
++#define PRG_I2C2_PULLUPRESX		0x00000001
++
+ /* UART */
+ #define OMAP34XX_UART1			(OMAP34XX_L4_IO_BASE + 0x6a000)
+ #define OMAP34XX_UART2			(OMAP34XX_L4_IO_BASE + 0x6c000)
+-- 
+1.6.6.1
+
diff --git a/recipes/u-boot/u-boot-git/beagleboard/0046-BeagleBoard-Add-camera-to-default-bootargs.patch b/recipes/u-boot/u-boot-git/beagleboard/0046-BeagleBoard-Add-camera-to-default-bootargs.patch
new file mode 100644
index 0000000..f999f7f
--- /dev/null
+++ b/recipes/u-boot/u-boot-git/beagleboard/0046-BeagleBoard-Add-camera-to-default-bootargs.patch
@@ -0,0 +1,50 @@
+From 519ecc8a8f441d30e55c7e4552c63e2363fa6dd5 Mon Sep 17 00:00:00 2001
+From: Jason Kridner <jkridner@beagleboard.org>
+Date: Thu, 5 Aug 2010 13:54:12 -0500
+Subject: [PATCH] BeagleBoard: Add camera to default bootargs
+
+
+Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
+---
+ include/configs/omap3_beagle.h |    4 ++++
+ 1 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/include/configs/omap3_beagle.h b/include/configs/omap3_beagle.h
+index 1a76004..48ad805 100644
+--- a/include/configs/omap3_beagle.h
++++ b/include/configs/omap3_beagle.h
+@@ -208,6 +208,7 @@
+ 	"bootscr=boot.scr\0" \
+ 	"mpurate=500\0" \
+ 	"buddy=none\0" \
++	"camera=lbcm3m1\0" \
+ 	"vram=12M\0" \
+ 	"dvimode=640x480MR-16@60\0" \
+ 	"defaultdisplay=dvi\0" \
+@@ -222,6 +223,7 @@
+ 		"${optargs} " \
+ 		"mpurate=${mpurate} " \
+ 		"buddy=${buddy} "\
++		"camera=${camera} "\
+ 		"vram=${vram} " \
+ 		"omapfb.mode=dvi:${dvimode} " \
+ 		"omapdss.def_disp=${defaultdisplay} " \
+@@ -231,6 +233,7 @@
+ 		"${optargs} " \
+ 		"mpurate=${mpurate} " \
+ 		"buddy=${buddy} "\
++		"camera=${camera} "\
+ 		"vram=${vram} " \
+ 		"omapfb.mode=dvi:${dvimode} " \
+ 		"omapdss.def_disp=${defaultdisplay} " \
+@@ -241,6 +244,7 @@
+ 		"${optargs} " \
+ 		"mpurate=${mpurate} " \
+ 		"buddy=${buddy} "\
++		"camera=${camera} "\
+ 		"vram=${vram} " \
+ 		"omapfb.mode=dvi:${dvimode} " \
+ 		"omapdss.def_disp=${defaultdisplay} " \
+-- 
+1.5.6.4
+
diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
index bc4ab19..79c2b95 100644
--- a/recipes/u-boot/u-boot_git.bb
+++ b/recipes/u-boot/u-boot_git.bb
@@ -1,5 +1,5 @@
 require u-boot.inc
-PR ="r59"
+PR ="r60"
 
 FILESPATHPKG =. "u-boot-git:"
 
@@ -69,6 +69,8 @@ SRC_URI_beagleboard = "git://www.denx.de/git/u-boot.git;protocol=git \
                        file://0042-BeagleBoard-New-command-for-status-of-USER-button.patch \
                        file://0043-BeagleBoard-Add-CONFIG_SYS_MEMTEST_SCRATCH.patch \
                        file://0044-Beagleboard-Adjust-boot.patch \
+                       file://0045-Beagleboard-Enable-pullups-on-i2c2.patch \
+                       file://0046-Beagleboard-Add-camera-to-default-bootargs.patch \
                        file://fw_env.config \
 "
 SRCREV_beagleboard = "ca6e1c136ddb720c3bb2cc043b99f7f06bc46c55"
-- 
1.5.6.4



