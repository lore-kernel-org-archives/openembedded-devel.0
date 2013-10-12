Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f44.google.com (mail-ee0-f44.google.com [74.125.83.44])
	by mail.openembedded.org (Postfix) with ESMTP id 2DDDE6CE62
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 23:00:28 +0000 (UTC)
Received: by mail-ee0-f44.google.com with SMTP id b47so2651872eek.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 16:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=FBILUvy1brXEkSdBtyg7T2BLtM0n2zWtdtQtJBpJ350=;
	b=pNX5zg3peRFr0vRKwyAbFO6a33K3zsPtQ2jlyAntmeeawD41VqQENGIwIx4Q+g9bE/
	7dG5zme0kttgWX3ho+Gxx9uiTiXFylNeR/lqX2VM6NnKTXl0NYfKY48x+Kv0g0h1ad1R
	6MH5dJzCnOPAoLiWbuufMM1mcJV8n5ZvcqsrG2OZGDHvWTdvTsnsH/rEJb27djImeS1O
	QyTbhrwAo5D8XDAKu3CsI4rxULV/k1GlD7jvaVLk/MlDNvq2qo14fY22cAEh+7nT8yx4
	6UpRFmvJ3Z7GWGHZ8H3KCMtv/tHwPGj1YUn4JeydZgtuDuAjVs51fzX/76/4pKDjPQVu
	X1VA==
X-Received: by 10.14.246.11 with SMTP id p11mr42367079eer.9.1381618829960;
	Sat, 12 Oct 2013 16:00:29 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	n48sm133204585eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 16:00:29 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:00:23 +0200
Message-Id: <1381618825-18766-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 1/3] meta-handheld: remove TARGET_ARCH from machine configurations
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
X-List-Received-Date: Sat, 12 Oct 2013 23:00:29 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h1910.conf       |  2 --
 conf/machine/h1940.conf       | 10 +++++-----
 conf/machine/h2200.conf       |  2 --
 conf/machine/h3900.conf       |  2 --
 conf/machine/h4000.conf       |  2 --
 conf/machine/h5000.conf       |  2 --
 conf/machine/include/palm.inc |  2 --
 conf/machine/jornada56x.conf  |  1 -
 conf/machine/jornada6xx.conf  |  2 --
 conf/machine/jornada7xx.conf  |  2 --
 conf/machine/palmtt.conf      |  2 --
 conf/machine/palmz71.conf     |  2 --
 conf/machine/rx1950.conf      |  1 -
 conf/machine/rx3000.conf      |  1 -
 conf/machine/simpad.conf      |  2 --
 15 files changed, 5 insertions(+), 30 deletions(-)

diff --git a/conf/machine/h1910.conf b/conf/machine/h1910.conf
index bd84cfb..59588dd 100644
--- a/conf/machine/h1910.conf
+++ b/conf/machine/h1910.conf
@@ -5,8 +5,6 @@
 #
 # Hardware-based properties
 #
-TARGET_ARCH = "arm"
-
 require conf/machine/include/tune-xscale.inc
 
 VOLATILE_STORAGE_SIZE = "64"
diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index 19e7662..9a1864e 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -2,7 +2,11 @@
 #@NAME: h1940
 #@DESCRIPTION: Machine configuration for the HP iPAQ h1930 and h1940
 
-TARGET_ARCH = "arm"
+#
+# Hardware-based properties
+#
+# tune for armv4t
+require conf/machine/include/tune-arm920t.inc
 
 # Set preferred providers
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
@@ -18,13 +22,9 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_FEATURES = "kernel26 touchscreen apm bluetooth irda usbgadget screen vfat"
 
-
 # Some extra configuration
 VOLATILE_STORAGE_SIZE = "64"
 ROOT_FLASH_SIZE = "32"
 SERIAL_CONSOLE = "115200 ttySAC2 vt100"
 USE_VT = "0"
 
-# tune for armv4t
-require conf/machine/include/tune-arm920t.inc
-
diff --git a/conf/machine/h2200.conf b/conf/machine/h2200.conf
index 7dbf4f1..d07b4bb 100644
--- a/conf/machine/h2200.conf
+++ b/conf/machine/h2200.conf
@@ -5,8 +5,6 @@
 #
 # Hardware-based properties
 #
-TARGET_ARCH = "arm"
-
 #Compile with armv5te optimizations, incompatible with armv4(t) cpus
 require conf/machine/include/tune-xscale.inc
 
diff --git a/conf/machine/h3900.conf b/conf/machine/h3900.conf
index 3b5107d..6b75888 100644
--- a/conf/machine/h3900.conf
+++ b/conf/machine/h3900.conf
@@ -5,8 +5,6 @@
 #
 # Hardware-based properties
 #
-TARGET_ARCH = "arm"
-
 require conf/machine/include/tune-xscale.inc
 
 ROOT_FLASH_SIZE = "32"
diff --git a/conf/machine/h4000.conf b/conf/machine/h4000.conf
index 937b626..2cd3e81 100644
--- a/conf/machine/h4000.conf
+++ b/conf/machine/h4000.conf
@@ -5,8 +5,6 @@
 #
 # Hardware-based properties
 #
-TARGET_ARCH = "arm"
-
 require conf/machine/include/tune-xscale.inc
 
 ROOT_FLASH_SIZE = "32"
diff --git a/conf/machine/h5000.conf b/conf/machine/h5000.conf
index 73fbf17..b11670d 100644
--- a/conf/machine/h5000.conf
+++ b/conf/machine/h5000.conf
@@ -5,8 +5,6 @@
 #
 # Hardware-based properties
 #
-TARGET_ARCH = "arm"
-
 require conf/machine/include/tune-xscale.inc
 
 ROOT_FLASH_SIZE = "32"
diff --git a/conf/machine/include/palm.inc b/conf/machine/include/palm.inc
index 5394855..f38e027 100644
--- a/conf/machine/include/palm.inc
+++ b/conf/machine/include/palm.inc
@@ -2,8 +2,6 @@
 # Hardware-based properties
 #
 
-TARGET_ARCH = "arm"
-
 SERIAL_CONSOLE = "115200 ttyS0"
 
 # Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
diff --git a/conf/machine/jornada56x.conf b/conf/machine/jornada56x.conf
index a42dd8c..da820d8 100644
--- a/conf/machine/jornada56x.conf
+++ b/conf/machine/jornada56x.conf
@@ -2,7 +2,6 @@
 #@NAME: HP Jornada 56x
 #@DESCRIPTION: Machine configuration for the SA1100 based HP Jornada 56x palmtop computer
 
-TARGET_ARCH = "arm"
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
diff --git a/conf/machine/jornada6xx.conf b/conf/machine/jornada6xx.conf
index 7070510..a11ad29 100644
--- a/conf/machine/jornada6xx.conf
+++ b/conf/machine/jornada6xx.conf
@@ -2,8 +2,6 @@
 #@NAME: HP Jornada 680
 #@DESCRIPTION: Machine configuration for the HITACHI SH3 based HP Jornada 6xx palmtop computer
 
-TARGET_ARCH = "sh3"
-
 require conf/machine/include/tune-sh3.inc
 
 MACHINE_FEATURES = "kernel26 alsa pcmcia irda keyboard touchscreen screen vfat"
diff --git a/conf/machine/jornada7xx.conf b/conf/machine/jornada7xx.conf
index ade334e..22bd120 100644
--- a/conf/machine/jornada7xx.conf
+++ b/conf/machine/jornada7xx.conf
@@ -2,8 +2,6 @@
 #@NAME: HP Jornada 7xx 
 #@DESCRIPTION: Machine configuration for the SA1110 based HP Jornada 7xx palmtop computer
 
-TARGET_ARCH = "arm"
-
 require conf/machine/include/tune-strongarm1100.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada7xx"
diff --git a/conf/machine/palmtt.conf b/conf/machine/palmtt.conf
index 4326af9..3e99f5e 100644
--- a/conf/machine/palmtt.conf
+++ b/conf/machine/palmtt.conf
@@ -2,8 +2,6 @@
 #@NAME: Palm Tungsten T
 #@DESCRIPTION: Machine configuration for Palm Tungsten T/T2
 
-TARGET_ARCH = "arm"
-
 MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "320"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
diff --git a/conf/machine/palmz71.conf b/conf/machine/palmz71.conf
index 0a7f274..5ac7be3 100644
--- a/conf/machine/palmz71.conf
+++ b/conf/machine/palmz71.conf
@@ -2,8 +2,6 @@
 #@NAME: Palm Zire 71
 #@DESCRIPTION: Machine configuration for Palm Zire 71
 
-TARGET_ARCH = "arm"
-
 PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel = "linux-palm-omap1"
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index a64dc27..5faf7e1 100644
--- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -5,7 +5,6 @@
 #
 # Hardware-based properties
 #
-TARGET_ARCH = "arm"
 
 # Samsung S3C2xxx CPU
 require conf/machine/include/tune-arm920t.inc
diff --git a/conf/machine/rx3000.conf b/conf/machine/rx3000.conf
index ab89fbf..e1a4e70 100644
--- a/conf/machine/rx3000.conf
+++ b/conf/machine/rx3000.conf
@@ -5,7 +5,6 @@
 #
 # Hardware-based properties
 #
-TARGET_ARCH = "arm"
 
 # Samsung S3C2xxx CPU
 require conf/machine/include/tune-arm920t.inc
diff --git a/conf/machine/simpad.conf b/conf/machine/simpad.conf
index 0c57554..373d95e 100644
--- a/conf/machine/simpad.conf
+++ b/conf/machine/simpad.conf
@@ -2,8 +2,6 @@
 #@NAME: SIEMENS SIMpad SL4, SIEMENS SIMpad CL4, SIEMENS SIMpad SLC, Telekom T-Sinus PAD
 #@DESCRIPTION: Machine configuration for the SA1100 based SIEMENS SIMpad and Telekom T-Sinus PAD devices
 
-TARGET_ARCH = "arm"
-
 MACHINE_FEATURES = "apm pcmcia irda screen touchscreen vfat kernel26"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
-- 
1.8.1.5


