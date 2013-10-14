Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f50.google.com (mail-ee0-f50.google.com [74.125.83.50])
	by mail.openembedded.org (Postfix) with ESMTP id E76786CE6C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 15:20:13 +0000 (UTC)
Received: by mail-ee0-f50.google.com with SMTP id d51so3423466eek.23
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 08:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=1j5IJcIR3zFhhg3wvyJyEW/KnRctFnPPWzobJqMlS1I=;
	b=pO/9YSROtiBjdNHK/G7JlIXnwz3QN8AG6gU3F353zzmPviBWettIWsosKh7GM+6udY
	szURS6wDRXtXoTqtyoJ4uNVjnXG2aGqevPU0yMK0rkDOOFN2uNMNuUol7ksClv0Qg70s
	pAvfmN5AOZz13UX6VVcdKUjn61SnWXhrgRRex1IfK337MUZoq/SLaxKuS/6ihDqjy20y
	RseyMAHz4k4bxeHwDWF2TrbY+Wm5CsahkQ1sjeeu3gJGGK959NkRsWGPmpxoDV8DNKs6
	/r7XYTF75r4S+vRy062jeJ4capTrf7wHfnuYjzKdnZk52tYsOHeHY55Yc6YZO1SHLCa9
	TBIw==
X-Received: by 10.15.64.1 with SMTP id n1mr57767579eex.15.1381764015107;
	Mon, 14 Oct 2013 08:20:15 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	x47sm154772532eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 08:20:14 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 17:20:11 +0200
Message-Id: <1381764011-3415-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] meta-handheld: remove deprecated ROOT_FLASH_SIZE and VOLATILE_STORAGE_SIZE
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
X-List-Received-Date: Mon, 14 Oct 2013 15:20:15 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h1910.conf                    | 2 --
 conf/machine/h1940.conf                    | 2 --
 conf/machine/h2200.conf                    | 2 --
 conf/machine/h3600.conf                    | 4 ----
 conf/machine/h3900.conf                    | 2 --
 conf/machine/h4000.conf                    | 2 --
 conf/machine/h5000.conf                    | 2 --
 conf/machine/hx4700.conf                   | 2 --
 conf/machine/include/motorola-ezx-base.inc | 1 -
 conf/machine/palmld.conf                   | 2 --
 conf/machine/palmt650.conf                 | 2 --
 conf/machine/palmt680.conf                 | 2 --
 conf/machine/palmtc.conf                   | 2 --
 conf/machine/palmtt3.conf                  | 2 --
 conf/machine/palmtt5.conf                  | 2 --
 conf/machine/palmtx.conf                   | 2 --
 conf/machine/palmz31.conf                  | 2 --
 conf/machine/palmz72.conf                  | 2 --
 conf/machine/rx1950.conf                   | 2 --
 conf/machine/rx3000.conf                   | 2 --
 conf/machine/simpad.conf                   | 1 -
 21 files changed, 42 deletions(-)

diff --git a/conf/machine/h1910.conf b/conf/machine/h1910.conf
index f2073be..56c560e 100644
--- a/conf/machine/h1910.conf
+++ b/conf/machine/h1910.conf
@@ -7,8 +7,6 @@
 #
 require conf/machine/include/tune-xscale.inc
 
-VOLATILE_STORAGE_SIZE = "64"
-ROOT_FLASH_SIZE = "16"
 MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index 5113f41..6bc0908 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -19,8 +19,6 @@ UBOOT_ENTRYPOINT = "0x30108000"
 MACHINE_FEATURES = "touchscreen apm bluetooth irda usbgadget screen vfat qvga"
 
 # Some extra configuration
-VOLATILE_STORAGE_SIZE = "64"
-ROOT_FLASH_SIZE = "32"
 SERIAL_CONSOLE = "115200 ttySAC2 vt100"
 USE_VT = "0"
 
diff --git a/conf/machine/h2200.conf b/conf/machine/h2200.conf
index b16f5aa..30c8a81 100644
--- a/conf/machine/h2200.conf
+++ b/conf/machine/h2200.conf
@@ -9,8 +9,6 @@
 require conf/machine/include/tune-xscale.inc
 
 #Set some hints for metadata  
-VOLATILE_STORAGE_SIZE = "64"
-ROOT_FLASH_SIZE = "32"
 MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index b95f53d..adb354d 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -7,10 +7,6 @@
 #
 require conf/machine/include/tune-strongarm1100.inc
 
-# h3700, h3800 have 32, but let that be the bonus
-ROOT_FLASH_SIZE = "16"
-# h3630 have 32Mb only, others should set this to 64
-VOLATILE_STORAGE_SIZE = "32"
 MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat ext2 qvga"
 
 #
diff --git a/conf/machine/h3900.conf b/conf/machine/h3900.conf
index 05696bf..70868c6 100644
--- a/conf/machine/h3900.conf
+++ b/conf/machine/h3900.conf
@@ -7,8 +7,6 @@
 #
 require conf/machine/include/tune-xscale.inc
 
-ROOT_FLASH_SIZE = "32"
-VOLATILE_STORAGE_SIZE = "64"
 MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/h4000.conf b/conf/machine/h4000.conf
index 448f92f..aad667d 100644
--- a/conf/machine/h4000.conf
+++ b/conf/machine/h4000.conf
@@ -7,8 +7,6 @@
 #
 require conf/machine/include/tune-xscale.inc
 
-ROOT_FLASH_SIZE = "32"
-VOLATILE_STORAGE_SIZE = "64"
 MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/h5000.conf b/conf/machine/h5000.conf
index 9b572c4..2197520 100644
--- a/conf/machine/h5000.conf
+++ b/conf/machine/h5000.conf
@@ -7,8 +7,6 @@
 #
 require conf/machine/include/tune-xscale.inc
 
-ROOT_FLASH_SIZE = "32"
-VOLATILE_STORAGE_SIZE = "64"
 MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen vfat qvga"
 
 #
diff --git a/conf/machine/hx4700.conf b/conf/machine/hx4700.conf
index 79ff384..0099f8a 100644
--- a/conf/machine/hx4700.conf
+++ b/conf/machine/hx4700.conf
@@ -10,8 +10,6 @@ require conf/machine/include/tune-xscale.inc
 MACHINE_FEATURES += "iwmmxt"
 PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
-ROOT_FLASH_SIZE = "80"
-VOLATILE_STORAGE_SIZE = "64"
 MACHINE_FEATURES = "alsa apm bluetooth irda pcmcia screen touchscreen usbgadget wifi vfat"
 
 #
diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 1c0de7e..f5d11a5 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -19,7 +19,6 @@ PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 #mtd2: 00580000 00020000 "VFM_Filesystem"
 #mtd3: 00020000 00020000 "Logo"
 
-ROOT_FLASH_SIZE = "24"
 MACHINE_FEATURES = "alsa apm bluetooth keyboard phone screen touchscreen usbgadget usbhost vfat qvga"
 MACHINE_FEATURES += " iwmmxt"
 
diff --git a/conf/machine/palmld.conf b/conf/machine/palmld.conf
index ff27598..be730c0 100644
--- a/conf/machine/palmld.conf
+++ b/conf/machine/palmld.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/palm.inc
 
-ROOT_FLASH_SIZE = "100"
-
 MACHINE_FEATURES += "pcmcia wifi"
 MACHINE_FEATURES += "iwmmxt"
 
diff --git a/conf/machine/palmt650.conf b/conf/machine/palmt650.conf
index deb3433..1ed7303 100644
--- a/conf/machine/palmt650.conf
+++ b/conf/machine/palmt650.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/palm.inc
 
-ROOT_FLASH_SIZE = "100"
-
 SERIAL_CONSOLE = "115200 ttyS1"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-snd-pxa2xx-ac97 \
diff --git a/conf/machine/palmt680.conf b/conf/machine/palmt680.conf
index e0b66c1..b1b57c1 100644
--- a/conf/machine/palmt680.conf
+++ b/conf/machine/palmt680.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/palm.inc
 
-ROOT_FLASH_SIZE = "100"
-
 SERIAL_CONSOLE = "115200 ttyS0"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-pxa27x-keyboard \
diff --git a/conf/machine/palmtc.conf b/conf/machine/palmtc.conf
index 6cde594..2094354 100644
--- a/conf/machine/palmtc.conf
+++ b/conf/machine/palmtc.conf
@@ -6,6 +6,4 @@ require conf/machine/include/palm.inc
 
 MACHINE_FEATURES += "wifi"
 
-ROOT_FLASH_SIZE = "100"
-
 SERIAL_CONSOLE = "115200 ttyS0"
diff --git a/conf/machine/palmtt3.conf b/conf/machine/palmtt3.conf
index 3834feb..e39a7de 100644
--- a/conf/machine/palmtt3.conf
+++ b/conf/machine/palmtt3.conf
@@ -4,6 +4,4 @@
 
 require conf/machine/include/palm.inc
 
-ROOT_FLASH_SIZE = "100"
-
 SERIAL_CONSOLE = "115200 ttyS3"
diff --git a/conf/machine/palmtt5.conf b/conf/machine/palmtt5.conf
index 299ef68..3e7c52d 100644
--- a/conf/machine/palmtt5.conf
+++ b/conf/machine/palmtt5.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/palm.inc
 
-ROOT_FLASH_SIZE = "100"
-
 SERIAL_CONSOLE = "115200 ttyS0"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-pxa27x-keyboard \
diff --git a/conf/machine/palmtx.conf b/conf/machine/palmtx.conf
index f07f084..213c00b 100644
--- a/conf/machine/palmtx.conf
+++ b/conf/machine/palmtx.conf
@@ -6,8 +6,6 @@ require conf/machine/include/palm.inc
 
 MACHINE_FEATURES += "pcmcia wifi"
 
-ROOT_FLASH_SIZE = "100"
-
 SERIAL_CONSOLE = "115200 ttyS0"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-pxa27x-keyboard \
diff --git a/conf/machine/palmz31.conf b/conf/machine/palmz31.conf
index 4ac52fe..128e375 100644
--- a/conf/machine/palmz31.conf
+++ b/conf/machine/palmz31.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/palm.inc
 
-ROOT_FLASH_SIZE = "16"
-
 SERIAL_CONSOLE = "115200 ttyS0"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-i2c-pxa \
diff --git a/conf/machine/palmz72.conf b/conf/machine/palmz72.conf
index 5d55867..d221f31 100644
--- a/conf/machine/palmz72.conf
+++ b/conf/machine/palmz72.conf
@@ -4,8 +4,6 @@
 
 require conf/machine/include/palm.inc
 
-ROOT_FLASH_SIZE = "100"
-
 SERIAL_CONSOLE = "115200 ttyS0"
 
 MACHINE_EXTRA_RRECOMMENDS += "kernel-module-i2c-pxa \
diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index fa3f585..8b5da06 100644
--- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -9,8 +9,6 @@
 # Samsung S3C2xxx CPU
 require conf/machine/include/tune-arm920t.inc
 
-ROOT_FLASH_SIZE = "64"
-VOLATILE_STORAGE_SIZE = "64"
 MACHINE_FEATURES = "touchscreen apm alsa irda wifi usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/rx3000.conf b/conf/machine/rx3000.conf
index 9a179ae..cdacee6 100644
--- a/conf/machine/rx3000.conf
+++ b/conf/machine/rx3000.conf
@@ -9,8 +9,6 @@
 # Samsung S3C2xxx CPU
 require conf/machine/include/tune-arm920t.inc
 
-ROOT_FLASH_SIZE = "32"
-VOLATILE_STORAGE_SIZE = "64"
 MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat qvga"
 
 #
diff --git a/conf/machine/simpad.conf b/conf/machine/simpad.conf
index 481ef47..390c1c6 100644
--- a/conf/machine/simpad.conf
+++ b/conf/machine/simpad.conf
@@ -8,7 +8,6 @@ PREFERRED_PROVIDER_virtual/kernel = "linux"
 
 require conf/machine/include/tune-strongarm1100.inc
 
-ROOT_FLASH_SIZE = "16"
 EXTRA_IMAGECMD_jffs2 = "--little-endian --eraseblock=0x20000"
 
 SERIAL_CONSOLE = "ttySA0 115200 vt100"
-- 
1.8.1.5


