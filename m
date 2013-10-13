Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f173.google.com (mail-ea0-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id BFDC96CCC9
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 22:36:35 +0000 (UTC)
Received: by mail-ea0-f173.google.com with SMTP id g10so3018183eak.18
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Oct 2013 15:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=kXzeYwnfZXGhQbhoAo1rLNQ7fr+vCnUeBqm4jMFte+4=;
	b=Cl8aWE996ieUQ9wzfXfZ6Fn35WA7XgYMA72w+KZ0AzI3iG6s3NG8Amun+mNX6yNK8Z
	TsWomBSnjauz8LpSt8ERYDKFxSd5MyYTZvtEMIKln8vnkxD009CbB92LQDINpT5CWe2Y
	BgnrIHcYiUO4I4xNnHKzwaN1nKob5LEeeSwaOGGV/FNGcvaQdnkywTm+zWOtChsYyHst
	1DVaHL3pjPeWvgXG8+XAG8q7KuVSRFobBZ9RJFUaZYX07d+SvZRIjv/LNuV+YUT0PDo8
	FoDxUdunRi+6FjxleGYbYi5D0xrv7++u41/IxYxxrY5jSjobvguO3zITQIme/iv8vFBU
	in5w==
X-Received: by 10.14.109.66 with SMTP id r42mr51106307eeg.43.1381703797127;
	Sun, 13 Oct 2013 15:36:37 -0700 (PDT)
Received: from mizar.localdomain
	(host121-51-dynamic.0-79-r.retail.telecomitalia.it. [79.0.51.121])
	by mx.google.com with ESMTPSA id a1sm145535666eem.1.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 13 Oct 2013 15:36:36 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 00:36:30 +0200
Message-Id: <1381703793-5661-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH 1/4] meta-handheld: ipaq: add qvga MACHINE_FEATURE
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
X-List-Received-Date: Sun, 13 Oct 2013 22:36:36 -0000

Used in oe-core in:
recipes-sato/gtk-engines/gtk-sato-engine_git.bb:
recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb:

EXTRA_OECONF adds '--with-mode=qvga'

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h1910.conf  | 2 +-
 conf/machine/h1940.conf  | 2 +-
 conf/machine/h2200.conf  | 2 +-
 conf/machine/h3600.conf  | 2 +-
 conf/machine/h3800.conf  | 2 +-
 conf/machine/h3900.conf  | 2 +-
 conf/machine/h4000.conf  | 2 +-
 conf/machine/h5000.conf  | 2 +-
 conf/machine/rx1950.conf | 2 +-
 conf/machine/rx3000.conf | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/conf/machine/h1910.conf b/conf/machine/h1910.conf
index e70690d..8e35704 100644
--- a/conf/machine/h1910.conf
+++ b/conf/machine/h1910.conf
@@ -12,7 +12,7 @@ ROOT_FLASH_SIZE = "16"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat qvga"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h1940.conf b/conf/machine/h1940.conf
index 84acd04..b08c576 100644
--- a/conf/machine/h1940.conf
+++ b/conf/machine/h1940.conf
@@ -19,7 +19,7 @@ UBOOT_ENTRYPOINT = "0x30108000"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm bluetooth irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm bluetooth irda usbgadget screen vfat qvga"
 
 # Some extra configuration
 VOLATILE_STORAGE_SIZE = "64"
diff --git a/conf/machine/h2200.conf b/conf/machine/h2200.conf
index 33ce737..1cafe9b 100644
--- a/conf/machine/h2200.conf
+++ b/conf/machine/h2200.conf
@@ -14,7 +14,7 @@ ROOT_FLASH_SIZE = "32"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat qvga"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index fea565c..0875957 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -14,7 +14,7 @@ VOLATILE_STORAGE_SIZE = "32"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat ext2"
+MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat ext2 qvga"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h3800.conf b/conf/machine/h3800.conf
index 0319ce3..0c3cf15 100644
--- a/conf/machine/h3800.conf
+++ b/conf/machine/h3800.conf
@@ -3,6 +3,6 @@
 #@DESCRIPTION: Machine configuration for the Compaq iPAQ 38xx devices
 
 #this machine will be primarily focussed on the 2.6 port
-MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda usbgadget screen vfat qvga"
 
 require conf/machine/h3600.conf
diff --git a/conf/machine/h3900.conf b/conf/machine/h3900.conf
index ceb5b05..d21ca73 100644
--- a/conf/machine/h3900.conf
+++ b/conf/machine/h3900.conf
@@ -12,7 +12,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth usbgadget screen vfat qvga"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h4000.conf b/conf/machine/h4000.conf
index 3e048a2..df49c37 100644
--- a/conf/machine/h4000.conf
+++ b/conf/machine/h4000.conf
@@ -12,7 +12,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat qvga"
 
 #
 # Software/packages selection
diff --git a/conf/machine/h5000.conf b/conf/machine/h5000.conf
index c30aa36..481e476 100644
--- a/conf/machine/h5000.conf
+++ b/conf/machine/h5000.conf
@@ -12,7 +12,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa pcmcia bluetooth irda wifi usbgadget usbhost screen vfat qvga"
 
 #
 # Software/packages selection
diff --git a/conf/machine/rx1950.conf b/conf/machine/rx1950.conf
index 8214e62..54dd444 100644
--- a/conf/machine/rx1950.conf
+++ b/conf/machine/rx1950.conf
@@ -14,7 +14,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm alsa irda wifi usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda wifi usbgadget screen vfat qvga"
 
 #
 # Software/packages selection
diff --git a/conf/machine/rx3000.conf b/conf/machine/rx3000.conf
index 2a41d87..953d287 100644
--- a/conf/machine/rx3000.conf
+++ b/conf/machine/rx3000.conf
@@ -14,7 +14,7 @@ VOLATILE_STORAGE_SIZE = "64"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda bluetooth wifi usbgadget screen vfat qvga"
 
 #
 # Software/packages selection
-- 
1.8.1.5


