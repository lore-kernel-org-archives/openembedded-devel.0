Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id 2DEDB6D00C
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 23:00:32 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so2632247eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 12 Oct 2013 16:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dsWiz/MePCyVm2YhnffRG2oStjttrQi6mhiwM4MYsk0=;
	b=iAgEzbzCdrKgazP53yFCKl57zOcbxaSg10srwyV5VXNYkKtQ9bAfw6YwB3z8jRMbk7
	zpgrT2nCq12Lb0m2YW1nELpXtcLCrvxeAr11fuSca7W2Woj4YD36XjEM/VMfGR9fBlpG
	B1unbAHg+tp6vxJBgCSrghzyYQGv6Wj/63diOQ3FdNBNkcKoTflBF2Um63B+mbU1ewfT
	7HRCSW31AfjVRGmYzlnwADn4es35yGnNHBtgkP0rrRMhdDTw8typSo0lFvLH2p8bQAzS
	2UfE4U6tFqKRXkunYx53U+PcDyVvA8woqwuYe9BjEJGhnrvNCloS/zUd7rGNHMf1vuG4
	pZBQ==
X-Received: by 10.14.9.72 with SMTP id 48mr41334472ees.42.1381618834361;
	Sat, 12 Oct 2013 16:00:34 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id
	n48sm133204585eeg.17.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Oct 2013 16:00:33 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 13 Oct 2013 01:00:25 +0200
Message-Id: <1381618825-18766-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381618825-18766-1-git-send-email-andrea.adami@gmail.com>
References: <1381618825-18766-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] meta-handheld: remove obsolete refs to kernel26 MACHINE_FEATURE
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
X-List-Received-Date: Sat, 12 Oct 2013 23:00:33 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h1910.conf                    | 2 +-
 conf/machine/h1940.conf                    | 2 +-
 conf/machine/h2200.conf                    | 2 +-
 conf/machine/h3800.conf                    | 2 +-
 conf/machine/h3900.conf                    | 2 +-
 conf/machine/h4000.conf                    | 2 +-
 conf/machine/h5000.conf                    | 2 +-
 conf/machine/include/motorola-ezx-base.inc | 2 +-
 conf/machine/include/palm.inc              | 2 +-
 conf/machine/jornada6xx.conf               | 2 +-
 conf/machine/jornada7xx.conf               | 2 +-
 conf/machine/rokre2.conf                   | 2 +-
 conf/machine/rx1950.conf                   | 2 +-
 conf/machine/rx3000.conf                   | 2 +-
 conf/machine/simpad.conf                   | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/conf/machine/h1910.conf b/conf/machine/h1910.conf
index b7b79b1..e70690d 100644
--- a/conf/machine/h1910.conf
+++ b/conf/machine/h1910.conf
@@ -12,7 +12,7 @@ ROOT_FLASH_SIZE = "16"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index 3d430ce..84acd04 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -19,7 +19,7 @@ UBOOT_ENTRYPOINT = "0x30108000"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm bluetooth irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm bluetooth irda usbgadget screen vfat"
 
 # Some extra configuration
 VOLATILE_STORAGE_SIZE = "64"
diff --git a/conf/machine/h2200.conf b/conf/machine/h2200.conf
index d1d10b8..33ce737 100644
--- a/conf/machine/h2200.conf
+++ b/conf/machine/h2200.conf
@@ -14,7 +14,7 @@ ROOT_FLASH_SIZE = "32"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h3800.conf b/conf/machine/h3800.conf
index a13ed48..0319ce3 100644
--- a/conf/machine/h3800.conf
+++ b/conf/machine/h3800.conf
@@ -3,6 +3,6 @@
 #@DESCRIPTION: Machine configuration for the Compaq iPAQ 38xx devices
 
 #this machine will be primarily focussed on the 2.6 port
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat"
 
 require conf/machine/h3600.conf
diff --git a/conf/machine/h3900.conf b/conf/machine/h3900.conf
index a995ced..ceb5b05 100644
--- a/conf/machine/h3900.conf
+++ b/conf/machine/h3900.conf
@@ -12,7 +12,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth usbgadget screen vfat"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h4000.conf b/conf/machine/h4000.conf
index a5c13bd..3e048a2 100644
--- a/conf/machine/h4000.conf
+++ b/conf/machine/h4000.conf
@@ -12,7 +12,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h5000.conf b/conf/machine/h5000.conf
index bd84fc3..c30aa36 100644
--- a/conf/machine/h5000.conf
+++ b/conf/machine/h5000.conf
@@ -12,7 +12,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen vfat"
 
 #
 # Software/packages selection
diff --git a/conf/machine/include/motorola-ezx-base.inc b/conf/machine/include/motorola-ezx-base.inc
index 665872d..3931389 100644
--- a/conf/machine/include/motorola-ezx-base.inc
+++ b/conf/machine/include/motorola-ezx-base.inc
@@ -25,7 +25,7 @@ MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
 MACHINE_DISPLAY_ORIENTATION = "0"
 MACHINE_DISPLAY_PPI = "180"
-MACHINE_FEATURES = "alsa apm bluetooth kernel26 keyboard phone screen touchscreen usbgadget usbhost vfat"
+MACHINE_FEATURES = "alsa apm bluetooth keyboard phone screen touchscreen usbgadget usbhost vfat"
 MACHINE_FEATURES += " iwmmxt"
 
 #
diff --git a/conf/machine/include/palm.inc b/conf/machine/include/palm.inc
index cf39391..fee7493 100644
--- a/conf/machine/include/palm.inc
+++ b/conf/machine/include/palm.inc
@@ -7,7 +7,7 @@ SERIAL_CONSOLE = "115200 ttyS0"
 # Use tune-xscale per default. Machine independent feeds should be built with tune-strongarm.
 require conf/machine/include/tune-xscale.inc
 
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa bluetooth irda usbgadget screen ext2 vfat"
+MACHINE_FEATURES = "touchscreen apm alsa bluetooth irda usbgadget screen ext2 vfat"
 
 #
 # Software/packages selection
diff --git a/conf/machine/jornada6xx.conf b/conf/machine/jornada6xx.conf
index 6b1fa68..5afecbf 100644
--- a/conf/machine/jornada6xx.conf
+++ b/conf/machine/jornada6xx.conf
@@ -4,7 +4,7 @@
 
 require conf/machine/include/tune-sh3.inc
 
-MACHINE_FEATURES = "kernel26 alsa pcmcia irda keyboard touchscreen screen vfat"
+MACHINE_FEATURES = "alsa pcmcia irda keyboard touchscreen screen vfat"
 MACHINE_EXTRA_RRECOMMENDS = " kernel-modules"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada6xx"
diff --git a/conf/machine/jornada7xx.conf b/conf/machine/jornada7xx.conf
index d07ffd6..d9f05df 100644
--- a/conf/machine/jornada7xx.conf
+++ b/conf/machine/jornada7xx.conf
@@ -5,7 +5,7 @@
 require conf/machine/include/tune-strongarm1100.inc
 
 PREFERRED_PROVIDER_virtual/kernel = "linux-jlime-jornada7xx"
-MACHINE_FEATURES = "kernel26 apm alsa pcmcia irda keyboard touchscreen screen vfat"
+MACHINE_FEATURES = "apm alsa pcmcia irda keyboard touchscreen screen vfat"
 MACHINE_EXTRA_RDEPENDS = "kernel-modules bluez-dtl1-workaround"
 
 #screeninfo
diff --git a/conf/machine/rokre2.conf b/conf/machine/rokre2.conf
index 1a99c87..468924c 100644
--- a/conf/machine/rokre2.conf
+++ b/conf/machine/rokre2.conf
@@ -5,6 +5,6 @@
 require conf/machine/include/motorola-ezx-base.inc
 
 # there is no touchscreen
-MACHINE_FEATURES = "kernel26 apm alsa bluetooth usbgadget usbhost keyboard screen"
+MACHINE_FEATURES = "apm alsa bluetooth usbgadget usbhost keyboard screen"
 MACHINE_FEATURES += "iwmmxt"
 
diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index 5faf7e1..8214e62 100644
--- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -14,7 +14,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda wifi usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda wifi usbgadget screen vfat"
 
 #
 # Software/packages selection
diff --git a/conf/machine/rx3000.conf b/conf/machine/rx3000.conf
index 1808038..2a41d87 100644
--- a/conf/machine/rx3000.conf
+++ b/conf/machine/rx3000.conf
@@ -14,7 +14,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
 
 #
 # Software/packages selection
diff --git a/conf/machine/simpad.conf b/conf/machine/simpad.conf
index d3d7a1e..787dfb0 100644
--- a/conf/machine/simpad.conf
+++ b/conf/machine/simpad.conf
@@ -2,7 +2,7 @@
 #@NAME: SIEMENS SIMpad SL4, SIEMENS SIMpad CL4, SIEMENS SIMpad SLC, Telekom T-Sinus PAD
 #@DESCRIPTION: Machine configuration for the SA1100 based SIEMENS SIMpad and Telekom T-Sinus PAD devices
 
-MACHINE_FEATURES = "apm pcmcia irda screen touchscreen vfat kernel26"
+MACHINE_FEATURES = "apm pcmcia irda screen touchscreen vfat"
 
 PREFERRED_PROVIDER_virtual/kernel = "linux"
 
-- 
1.8.1.5


