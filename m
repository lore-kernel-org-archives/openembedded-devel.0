Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id E34A76CE62
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 23:00:30 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z15so2623190ead.33
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 16:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=iJ5ObHa58DfhuPDgfMOLPw6Durb5AVhwAJaW3IUuKtQ=;
	b=rPxtjOGKtZIcaH3X7Xw+/vnFpkjG7qe2j8bUySFlAlKLS5ukayv9Gu1tV6c/0K+9wv
	RIRWf65kbh4nhwQHoneX82aOCvFWRnPX0bX3ucYkBz1cZ3F12oJPOadPdLTga+aCbuXU
	61TKcyGgtEW6TYs8nPJxSXPRW/FheWOQPXCrdJoj5urgat4uBUvYotHt188Fi1Ta/ekx
	ln5zTWefhV0fwJa+rZNH0lL/4mk+NJp8E2sciijMdzfTHoGUuaAnyc9V7ByCyr1Nd9XY
	ZewI49ZYo0vNqFty/PkMWiFq0iiAiAzhIuWty7LVjRmW31JbuhtslmIMb6FXAAwHLfj9
	gAfg==
X-Received: by 10.14.9.72 with SMTP id 48mr41334220ees.42.1381618832141;
	Sat, 12 Oct 2013 16:00:32 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	n48sm133204585eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 16:00:31 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:00:24 +0200
Message-Id: <1381618825-18766-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381618825-18766-1-git-send-email-andrea.adami@gmail.com>
References: <1381618825-18766-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] meta-handheld: remove obsolete refs to kdrive
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
X-List-Received-Date: Sat, 12 Oct 2013 23:00:31 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/ben-nanonote.conf             | 5 -----
 conf/machine/h1910.conf                    | 1 -
 conf/machine/h1940.conf                    | 1 -
 conf/machine/h2200.conf                    | 1 -
 conf/machine/h3900.conf                    | 1 -
 conf/machine/h4000.conf                    | 1 -
 conf/machine/h5000.conf                    | 1 -
 conf/machine/include/motorola-ezx-base.inc | 2 --
 conf/machine/include/palm.inc              | 2 --
 conf/machine/jornada56x.conf               | 1 -
 conf/machine/jornada6xx.conf               | 6 ------
 conf/machine/jornada7xx.conf               | 4 ----
 conf/machine/palmtt.conf                   | 1 -
 conf/machine/palmz71.conf                  | 1 -
 conf/machine/rx3000.conf                   | 1 -
 conf/machine/simpad.conf                   | 2 --
 16 files changed, 31 deletions(-)

diff --git a/conf/machine/ben-nanonote.conf b/conf/machine/ben-nanonote.conf
index 1ce5815..a66e996 100644
--- a/conf/machine/ben-nanonote.conf
+++ b/conf/machine/ben-nanonote.conf
@@ -10,11 +10,6 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-ben-nanonote"
 #KERNEL_IMAGETYPE = "uImage"
 KERNEL_IMAGETYPE = "vmlinux.bin"
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
-
-XSERVER = "xserver-kdrive-fbdev"
-
 #ScreenInfo
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "320"
diff --git a/conf/machine/h1910.conf b/conf/machine/h1910.conf
index 59588dd..b7b79b1 100644
--- a/conf/machine/h1910.conf
+++ b/conf/machine/h1910.conf
@@ -18,7 +18,6 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen vfat"
 # Software/packages selection
 #
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 EXTRA_IMAGECMD_h1910_jffs2 = "-e 0x4000 -p -n"
 
diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index 9a1864e..3d430ce 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -9,7 +9,6 @@
 require conf/machine/include/tune-arm920t.inc
 
 # Set preferred providers
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 
 KERNEL_IMAGETYPE = "uImage"
diff --git a/conf/machine/h2200.conf b/conf/machine/h2200.conf
index d07b4bb..d1d10b8 100644
--- a/conf/machine/h2200.conf
+++ b/conf/machine/h2200.conf
@@ -19,7 +19,6 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda usbgadge
 #
 # Software/packages selection
 #
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS = " kernel h2200-bootloader "
diff --git a/conf/machine/h3900.conf b/conf/machine/h3900.conf
index 6b75888..a995ced 100644
--- a/conf/machine/h3900.conf
+++ b/conf/machine/h3900.conf
@@ -18,7 +18,6 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth usbgadget scree
 # Software/packages selection
 #
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 MACHINE_EXTRA_RDEPENDS = "kernel ipaq-boot-params"
 
diff --git a/conf/machine/h4000.conf b/conf/machine/h4000.conf
index 2cd3e81..a5c13bd 100644
--- a/conf/machine/h4000.conf
+++ b/conf/machine/h4000.conf
@@ -18,7 +18,6 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget
 # Software/packages selection
 #
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 MACHINE_EXTRA_RDEPENDS = "tiinit acx-firmware ${PCMCIA_MANAGER}"
 MACHINE_EXTRA_RRECOMMENDS = "kernel-module-snd-h4000-audio \
diff --git a/conf/machine/h5000.conf b/conf/machine/h5000.conf
index b11670d..bd84fc3 100644
--- a/conf/machine/h5000.conf
+++ b/conf/machine/h5000.conf
@@ -18,7 +18,6 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda wifi usb
 # Software/packages selection
 #
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 EXTRA_IMAGECMD_jffs2 = "-e 0x40000 -p ; echo '${IMAGE_NAME}  ${IMAGE_NAME}.rootfs.jffs2 - root' >> ${DEPLOY_DIR_IMAGE}/reflash.ctl"
 
 # Ship complete set of modules ('kernel-modules') for easier debug purposes 
diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 1d5c8f8..665872d 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -33,8 +33,6 @@ MACHINE_FEATURES += " iwmmxt"
 #
 PREFERRED_PROVIDER_virtual/kernel ?= "openezx-kernel"
 MODUTILS = "26"
-XSERVER = "xserver-kdrive-fbdev"
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
 
 IMAGE_FSTYPES ?= "jffs2"
 EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=0x20000 -n"
diff --git a/conf/machine/include/palm.inc b/conf/machine/include/palm.inc
index f38e027..cf39391 100644
--- a/conf/machine/include/palm.inc
+++ b/conf/machine/include/palm.inc
@@ -15,8 +15,6 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa bluetooth irda usbgadget scree
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-hackndev-2.6"
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-
 module_autoload_sa1100-rtc = "sa1100-rtc"
 module_autoload_snd-ac97-bus = "snd-ac97-bus"
 module_autoload_apm_power = "apm_power"
diff --git a/conf/machine/jornada56x.conf b/conf/machine/jornada56x.conf
index da820d8..4258a51 100644
--- a/conf/machine/jornada56x.conf
+++ b/conf/machine/jornada56x.conf
@@ -2,7 +2,6 @@
 #@NAME: HP Jornada 56x
 #@DESCRIPTION: Machine configuration for the SA1100 based HP Jornada 56x palmtop computer
 
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
 BOOTSTRAP_EXTRA_RDEPENDS = "kernel kernel-modules module-init-tools" 
diff --git a/conf/machine/jornada6xx.conf b/conf/machine/jornada6xx.conf
index a11ad29..6b1fa68 100644
--- a/conf/machine/jornada6xx.conf
+++ b/conf/machine/jornada6xx.conf
@@ -10,10 +10,4 @@ MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada6xx"
 PREFERRED_VERSION_linux-jlime-jornada6xx = "2.6.17"
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
-
-XSERVER = "xserver-kdrive-fbdev"
-
-
 SYSVINIT_ENABLED_GETTYS = "1 2"
diff --git a/conf/machine/jornada7xx.conf b/conf/machine/jornada7xx.conf
index 22bd120..d07ffd6 100644
--- a/conf/machine/jornada7xx.conf
+++ b/conf/machine/jornada7xx.conf
@@ -8,10 +8,6 @@ PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada7xx"
 MACHINE_FEATURES = "kernel26 apm alsa pcmcia irda keyboard touchscreen screen vfat"
 MACHINE_EXTRA_RDEPENDS = "kernel-modules bluez-dtl1-workaround"
 
-PREFERRED_PROVIDER_virtual/xserver = "xserver-kdrive"
-PREFERRED_VERSION_xserver-kdrive = "1.3.0.0"
-XSERVER = "xserver-kdrive-fbdev"
-
 #screeninfo
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "640"
diff --git a/conf/machine/palmtt.conf b/conf/machine/palmtt.conf
index 3e99f5e..f80d511 100644
--- a/conf/machine/palmtt.conf
+++ b/conf/machine/palmtt.conf
@@ -6,7 +6,6 @@ MACHINE_GUI_CLASS = "bigscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "320"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel = "linux-palm-omap1"
 
 SERIAL_CONSOLE ?= "115200 ttyS0"
diff --git a/conf/machine/palmz71.conf b/conf/machine/palmz71.conf
index 5ac7be3..aa820c7 100644
--- a/conf/machine/palmz71.conf
+++ b/conf/machine/palmz71.conf
@@ -2,7 +2,6 @@
 #@NAME: Palm Zire 71
 #@DESCRIPTION: Machine configuration for Palm Zire 71
 
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 PREFERRED_PROVIDER_virtual/kernel = "linux-palm-omap1"
 PREFERRED_PROVIDERS += "virtual/${TARGET_PREFIX}depmod:module-init-tools-cross"
 
diff --git a/conf/machine/rx3000.conf b/conf/machine/rx3000.conf
index e1a4e70..1808038 100644
--- a/conf/machine/rx3000.conf
+++ b/conf/machine/rx3000.conf
@@ -20,7 +20,6 @@ MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget
 # Software/packages selection
 #
 PREFERRED_PROVIDER_virtual/kernel = "linux-handhelds-2.6"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
 
 MACHINE_EXTRA_RDEPENDS = "tiinit acx-firmware"
 MACHINE_EXTRA_RRECOMMENDS = "kernel-module-acx \
diff --git a/conf/machine/simpad.conf b/conf/machine/simpad.conf
index 373d95e..d3d7a1e 100644
--- a/conf/machine/simpad.conf
+++ b/conf/machine/simpad.conf
@@ -16,5 +16,3 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "800"
 MACHINE_DISPLAY_HEIGHT_PIXELS= "600"
 SERIAL_CONSOLE = "ttySA0 115200 vt100"
 USE_VT = "0"
-
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
-- 
1.8.1.5


