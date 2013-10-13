Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f171.google.com (mail-ea0-f171.google.com
	[209.85.215.171])
	by mail.openembedded.org (Postfix) with ESMTP id 468016CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 23:26:48 +0000 (UTC)
Received: by mail-ea0-f171.google.com with SMTP id n15so2999157ead.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 16:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=biL85MYbWg4xwFuSu3ZuKBW18uWqiukiQuCbw7u17lI=;
	b=Pn03nANJTDz6IvYxCygLmwJQYldbQqDI+O9x3Qo/fsxjNwcwZhV73BBQSWcPyMuuty
	6f4UIbmZjAQSbajJZac1jt2PEmC2F3YDSkW4LU31sApOcbXQYM/dQQ/AG/oLsuXbWgB2
	e6SFRqoxsknoLsnZbKN8uwFV5r1+uKgqy7gtNmhMn1TZ5/LdxLQf6J8SNMV+mHMlpAeB
	Hpye14UMOAjKUksvM7H08XHwmZ7xaPwEq7srZfys5ubGhEveSPTwMDu449cIujJp2tME
	eS4NBQFMdfSkX2z0WTolc+A4Ak6NtQuSNeKZnJ1U3gWYQEWvWvH5GCnRoi+H6w4eXHyY
	81cA==
X-Received: by 10.15.35.196 with SMTP id g44mr51563153eev.18.1381706808577;
	Sun, 13 Oct 2013 16:26:48 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	m54sm145933934eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 16:26:47 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 01:26:42 +0200
Message-Id: <1381706804-21803-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 1/3] meta-handheld: remove MACHINE_GUI* and MACHINE_DISPLAY* vars
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 13 Oct 2013 23:26:49 -0000

unused in oe-core and in meta-oe
while there remove LOGO_SIZE from zaurus.inc and ben-nanonote.conf

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/akita.conf                    | 6 ------
 conf/machine/ben-nanonote.conf             | 6 ------
 conf/machine/c7x0.conf                     | 6 ------
 conf/machine/collie.conf                   | 6 ------
 conf/machine/h1910.conf                    | 3 ---
 conf/machine/h1940.conf                    | 3 ---
 conf/machine/h2200.conf                    | 3 ---
 conf/machine/h3600.conf                    | 3 ---
 conf/machine/h3900.conf                    | 3 ---
 conf/machine/h4000.conf                    | 3 ---
 conf/machine/h5000.conf                    | 3 ---
 conf/machine/hx4700.conf                   | 5 -----
 conf/machine/include/motorola-ezx-base.inc | 5 -----
 conf/machine/include/zaurus.inc            | 3 ---
 conf/machine/jornada7xx.conf               | 5 -----
 conf/machine/palmld.conf                   | 3 ---
 conf/machine/palmt650.conf                 | 4 +---
 conf/machine/palmt680.conf                 | 2 --
 conf/machine/palmtc.conf                   | 3 ---
 conf/machine/palmtt.conf                   | 4 ----
 conf/machine/palmtt5.conf                  | 4 +---
 conf/machine/palmtx.conf                   | 3 ---
 conf/machine/palmz31.conf                  | 3 ---
 conf/machine/palmz72.conf                  | 3 ---
 conf/machine/poodle.conf                   | 6 ------
 conf/machine/rx1950.conf                   | 3 ---
 conf/machine/rx3000.conf                   | 3 ---
 conf/machine/simpad.conf                   | 3 ---
 conf/machine/spitz.conf                    | 6 ------
 conf/machine/tosa.conf                     | 6 ------
 30 files changed, 2 insertions(+), 117 deletions(-)

diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
index 282bb76..4f9bccd 100644
--- a/conf/machine/akita.conf
+++ b/conf/machine/akita.conf
@@ -10,9 +10,3 @@ MACHINE_FEATURES += "iwmmxt"
 
 # NAND factory-default
 # mtdparts=sharpsl-nand:7168k@0k(smf),59392k@7168k(root),-(home) 
-
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "640"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
-MACHINE_DISPLAY_ORIENTATION = "270"
-MACHINE_DISPLAY_PPI = "216"
diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
index 54b49df..926b050 100644
--- a/conf/machine/ben-nanonote.conf
+++ b/conf/machine/ben-nanonote.conf
@@ -10,10 +10,4 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben-nanonote"
 #KERNEL_IMAGETYPE = "uImage"
 KERNEL_IMAGETYPE = "vmlinux.bin"
 
-#ScreenInfo
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "320"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "240"
-LOGO_SIZE = "qvga"
-
 MACHINE_FEATURES_append_ben-nanonote = " qvga"
diff --git a/conf/machine/c7x0.conf b/conf/machine/c7x0.conf
index 86b41f1..2f228a0 100644
--- a/conf/machine/c7x0.conf
+++ b/conf/machine/c7x0.conf
@@ -10,9 +10,3 @@ require conf/machine/include/tune-xscale.inc
 # SL-C750 (Shepherd) mtdparts=sharpsl-nand:7168k@0k(smf),25600k@7168k(root),-(home)
 # SL-C760 (Husky) mtdparts=sharpsl-nand:7168k@0k(smf),54272k@7168k(root),-(home)
 # SL-C860 (Boxer) mtdparts=sharpsl-nand:7168k@0k(smf),54272k@7168k(root),-(home)
-
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "640"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
-MACHINE_DISPLAY_ORIENTATION = "0"
-MACHINE_DISPLAY_PPI = "216"
diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index 2d191c7..660be96 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -4,9 +4,3 @@
 
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-strongarm1100.inc
-
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_DISPLAY_ORIENTATION = "270"
-MACHINE_DISPLAY_PPI = "114"
diff --git a/conf/machine/h1910.conf b/conf/machine/h1910.conf
index 8e35704..f2073be 100644
--- a/conf/machine/h1910.conf
+++ b/conf/machine/h1910.conf
@@ -9,9 +9,6 @@ require conf/machine/include/tune-xscale.inc
 
 VOLATILE_STORAGE_SIZE = "64"
 ROOT_FLASH_SIZE = "16"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index b08c576..5113f41 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -16,9 +16,6 @@ UBOOT_LOADADDRESS = "0x30108000"
 UBOOT_ENTRYPOINT = "0x30108000"
 
 # Set features for task-base
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm bluetooth irda usbgadget screen vfat qvga"
 
 # Some extra configuration
diff --git a/conf/machine/h2200.conf b/conf/machine/h2200.conf
index 1cafe9b..b16f5aa 100644
--- a/conf/machine/h2200.conf
+++ b/conf/machine/h2200.conf
@@ -11,9 +11,6 @@ require conf/machine/include/tune-xscale.inc
 #Set some hints for metadata  
 VOLATILE_STORAGE_SIZE = "64"
 ROOT_FLASH_SIZE = "32"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index 0875957..b95f53d 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -11,9 +11,6 @@ require conf/machine/include/tune-strongarm1100.inc
 ROOT_FLASH_SIZE = "16"
 # h3630 have 32Mb only, others should set this to 64
 VOLATILE_STORAGE_SIZE = "32"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat ext2 qvga"
 
 #
diff --git a/conf/machine/h3900.conf b/conf/machine/h3900.conf
index d21ca73..05696bf 100644
--- a/conf/machine/h3900.conf
+++ b/conf/machine/h3900.conf
@@ -9,9 +9,6 @@ require conf/machine/include/tune-xscale.inc
 
 ROOT_FLASH_SIZE = "32"
 VOLATILE_STORAGE_SIZE = "64"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/h4000.conf b/conf/machine/h4000.conf
index df49c37..448f92f 100644
--- a/conf/machine/h4000.conf
+++ b/conf/machine/h4000.conf
@@ -9,9 +9,6 @@ require conf/machine/include/tune-xscale.inc
 
 ROOT_FLASH_SIZE = "32"
 VOLATILE_STORAGE_SIZE = "64"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/h5000.conf b/conf/machine/h5000.conf
index 481e476..9b572c4 100644
--- a/conf/machine/h5000.conf
+++ b/conf/machine/h5000.conf
@@ -9,9 +9,6 @@ require conf/machine/include/tune-xscale.inc
 
 ROOT_FLASH_SIZE = "32"
 VOLATILE_STORAGE_SIZE = "64"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen vfat qvga"
 
 #
diff --git a/conf/machine/hx4700.conf b/conf/machine/hx4700.conf
index f8f5c7c..79ff384 100644
--- a/conf/machine/hx4700.conf
+++ b/conf/machine/hx4700.conf
@@ -12,11 +12,6 @@ PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
 ROOT_FLASH_SIZE = "80"
 VOLATILE_STORAGE_SIZE = "64"
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "480"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
-MACHINE_DISPLAY_ORIENTATION = "0"
-MACHINE_DISPLAY_PPI = "200"
 MACHINE_FEATURES = "alsa apm bluetooth irda pcmcia screen touchscreen usbgadget wifi vfat"
 
 #
diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 04ad337..1c0de7e 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -20,11 +20,6 @@ PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 #mtd3: 00020000 00020000 "Logo"
 
 ROOT_FLASH_SIZE = "24"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_DISPLAY_ORIENTATION = "0"
-MACHINE_DISPLAY_PPI = "180"
 MACHINE_FEATURES = "alsa apm bluetooth keyboard phone screen touchscreen usbgadget usbhost vfat qvga"
 MACHINE_FEATURES += " iwmmxt"
 
diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index a191fb8..fd8cc9e 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -77,9 +77,6 @@ KERNEL_IMAGETYPE ?= "zImage"
 # sane defaults for devices with only 32Mb RAM (see man xz)
 XZ_COMPRESSION_LEVEL = "-2e"
 
-# kernel bootlogo
-LOGO_SIZE = '${@base_conditional("MACHINE_GUI_CLASS", "bigscreen", "vga", "qvga", d)}'
-
 ################
 # machine tuning
 ################
diff --git a/conf/machine/jornada7xx.conf b/conf/machine/jornada7xx.conf
index d9f05df..b6f4696 100644
--- a/conf/machine/jornada7xx.conf
+++ b/conf/machine/jornada7xx.conf
@@ -8,9 +8,4 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada7xx"
 MACHINE_FEATURES = "apm alsa pcmcia irda keyboard touchscreen screen vfat"
 MACHINE_EXTRA_RDEPENDS = "kernel-modules bluez-dtl1-workaround"
 
-#screeninfo
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "640"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "240"
-
 SYSVINIT_ENABLED_GETTYS = "1 2 3 4 5 6"
diff --git a/conf/machine/palmld.conf b/conf/machine/palmld.conf
index bbeaf3a..ff27598 100644
--- a/conf/machine/palmld.conf
+++ b/conf/machine/palmld.conf
@@ -6,9 +6,6 @@ require conf/machine/include/palm.inc
 
 ROOT_FLASH_SIZE = "100"
 
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "320"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
 MACHINE_FEATURES += "pcmcia wifi"
 MACHINE_FEATURES += "iwmmxt"
 
diff --git a/conf/machine/palmt650.conf b/conf/machine/palmt650.conf
index 8deb3e5..deb3433 100644
--- a/conf/machine/palmt650.conf
+++ b/conf/machine/palmt650.conf
@@ -8,12 +8,10 @@ ROOT_FLASH_SIZE = "100"
 
 SERIAL_CONSOLE = "115200 ttyS1"
 
-MACHINE_GUI_CLASS = "bigscreen"
-
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-snd-pxa2xx-ac97 \
                            kernel-module-pxa27x-keyboard \
                            kernel-module-wm97xx-ts \
-			   "
+                           "
 
 MACHINE_EXTRA_RDEPENDS += "palmt650-keyboard-modmap"
 
diff --git a/conf/machine/palmt680.conf b/conf/machine/palmt680.conf
index a17aea3..e0b66c1 100644
--- a/conf/machine/palmt680.conf
+++ b/conf/machine/palmt680.conf
@@ -8,7 +8,5 @@ ROOT_FLASH_SIZE = "100"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-MACHINE_GUI_CLASS = "bigscreen"
-
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-pxa27x-keyboard \
                            kernel-module-wm97xx-ts"
diff --git a/conf/machine/palmtc.conf b/conf/machine/palmtc.conf
index 515ce4c..6cde594 100644
--- a/conf/machine/palmtc.conf
+++ b/conf/machine/palmtc.conf
@@ -9,6 +9,3 @@ MACHINE_FEATURES += "wifi"
 ROOT_FLASH_SIZE = "100"
 
 SERIAL_CONSOLE = "115200 ttyS0"
-
-MACHINE_GUI_CLASS = "bigscreen"
-
diff --git a/conf/machine/palmtt.conf b/conf/machine/palmtt.conf
index f80d511..0965c0e 100644
--- a/conf/machine/palmtt.conf
+++ b/conf/machine/palmtt.conf
@@ -2,10 +2,6 @@
 #@NAME: Palm Tungsten T
 #@DESCRIPTION: Machine configuration for Palm Tungsten T/T2
 
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "320"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-
 PREFERRED_PROVIDER_virtual/kernel = "linux-palm-omap1"
 
 SERIAL_CONSOLE ?= "115200 ttyS0"
diff --git a/conf/machine/palmtt5.conf b/conf/machine/palmtt5.conf
index fbf225a..299ef68 100644
--- a/conf/machine/palmtt5.conf
+++ b/conf/machine/palmtt5.conf
@@ -8,8 +8,6 @@ ROOT_FLASH_SIZE = "100"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
-MACHINE_GUI_CLASS = "bigscreen"
-
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-pxa27x-keyboard \
                            kernel-module-wm97xx-ts \
-			   kernel-module-palmt5-battery"
+                           kernel-module-palmt5-battery"
diff --git a/conf/machine/palmtx.conf b/conf/machine/palmtx.conf
index e1991c8..f07f084 100644
--- a/conf/machine/palmtx.conf
+++ b/conf/machine/palmtx.conf
@@ -4,9 +4,6 @@
 
 require conf/machine/include/palm.inc
 
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "320"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
 MACHINE_FEATURES += "pcmcia wifi"
 
 ROOT_FLASH_SIZE = "100"
diff --git a/conf/machine/palmz31.conf b/conf/machine/palmz31.conf
index 9fb5f7e..4ac52fe 100644
--- a/conf/machine/palmz31.conf
+++ b/conf/machine/palmz31.conf
@@ -5,9 +5,6 @@
 require conf/machine/include/palm.inc
 
 ROOT_FLASH_SIZE = "16"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "160"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "160"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/conf/machine/palmz72.conf b/conf/machine/palmz72.conf
index 9766434..5d55867 100644
--- a/conf/machine/palmz72.conf
+++ b/conf/machine/palmz72.conf
@@ -5,9 +5,6 @@
 require conf/machine/include/palm.inc
 
 ROOT_FLASH_SIZE = "100"
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "320"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 
 SERIAL_CONSOLE = "115200 ttyS0"
 
diff --git a/conf/machine/poodle.conf b/conf/machine/poodle.conf
index befd4a6..f2b5cf9 100644
--- a/conf/machine/poodle.conf
+++ b/conf/machine/poodle.conf
@@ -4,9 +4,3 @@
 
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
-
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_DISPLAY_ORIENTATION = "270"
-MACHINE_DISPLAY_PPI = "114"
diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index 54dd444..fa3f585 100644
--- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -11,9 +11,6 @@ require conf/machine/include/tune-arm920t.inc
 
 ROOT_FLASH_SIZE = "64"
 VOLATILE_STORAGE_SIZE = "64"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm alsa irda wifi usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/rx3000.conf b/conf/machine/rx3000.conf
index 953d287..9a179ae 100644
--- a/conf/machine/rx3000.conf
+++ b/conf/machine/rx3000.conf
@@ -11,9 +11,6 @@ require conf/machine/include/tune-arm920t.inc
 
 ROOT_FLASH_SIZE = "32"
 VOLATILE_STORAGE_SIZE = "64"
-MACHINE_GUI_CLASS = "smallscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "240"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/simpad.conf b/conf/machine/simpad.conf
index 787dfb0..481ef47 100644
--- a/conf/machine/simpad.conf
+++ b/conf/machine/simpad.conf
@@ -11,8 +11,5 @@ require conf/machine/include/tune-strongarm1100.inc
 ROOT_FLASH_SIZE = "16"
 EXTRA_IMAGECMD_jffs2 = "--little-endian --eraseblock=0x20000"
 
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "800" 
-MACHINE_DISPLAY_HEIGHT_PIXELS= "600"
 SERIAL_CONSOLE = "ttySA0 115200 vt100"
 USE_VT = "0"
diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index 46ca3eb..0929029 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -12,9 +12,3 @@ PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 # SL-C3000 (spitz) mtdparts=sharpsl-nand:7168k@0k(smf),5120k@7168k(root),-(home)
 # SL-C3100 (borzoi) mtdparts=sharpsl-nand:7168k@0k(smf),32768k@7168k(root),-(home)
 # SL-C3200 (terrier) mtdparts=sharpsl-nand:7168k@0k(smf),44032k@7168k(root),-(home)
-
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "640"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "480"
-MACHINE_DISPLAY_ORIENTATION = "270"
-MACHINE_DISPLAY_PPI = "216"
diff --git a/conf/machine/tosa.conf b/conf/machine/tosa.conf
index 280e81f..70cfedd 100644
--- a/conf/machine/tosa.conf
+++ b/conf/machine/tosa.conf
@@ -7,9 +7,3 @@ require conf/machine/include/tune-xscale.inc
 
 # NAND factory-default
 # mtdparts=sharpsl-nand:7168k@0k(smf),28672k@7168k(root),-(home)
-
-MACHINE_GUI_CLASS = "bigscreen"
-MACHINE_DISPLAY_WIDTH_PIXELS = "480"
-MACHINE_DISPLAY_HEIGHT_PIXELS = "640"
-MACHINE_DISPLAY_ORIENTATION = "0"
-MACHINE_DISPLAY_PPI = "200"
-- 
1.8.1.5


