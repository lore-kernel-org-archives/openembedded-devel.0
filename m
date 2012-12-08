Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Th8D2-00056s-CA
	for openembedded-devel@lists.openembedded.org;
	Sat, 08 Dec 2012 01:24:00 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so592831eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Dec 2012 16:09:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=WkImm5XiU8cE+78KM2vCiV072RC4RtB/yVdsQh8BNlM=;
	b=mxj6Mz1+46/nyV7E4DzKdoxJRDTGWu89rEc1kNn8x04VFazSPMoXU1DpUg1grpHy6X
	+/h3cB3nkjVNpQh/hNv4Io6073Rcg5DN4m2Ju93Drt/g62QpE7Pcs1ave6r89XmzLHkf
	OyOx9er0KqQ+cda9IjJ7lPbA7e4BtGrgqdhZowu2R0fjH8SL2v2mD1EHErhBYKxKK4lF
	L2VrZHsfV5FwKUqjCmumO7+s9Z0M6+idRwDIXaDNK6GeH1DaeazLncd4XWuPihw4LKPf
	gowdKhTfbhDk4AZrcN8GtzC+6/r48qo/HcQleFgVaGWSbVDzmTPYG+LVFWxnQGSXSBnd
	QAQQ==
Received: by 10.14.176.66 with SMTP id a42mr22332315eem.34.1354925375437;
	Fri, 07 Dec 2012 16:09:35 -0800 (PST)
Received: from mizar.localdomain
	(host83-229-dynamic.58-82-r.retail.telecomitalia.it. [82.58.229.83])
	by mx.google.com with ESMTPS id f49sm25909089eep.12.2012.12.07.16.09.34
	(version=SSLv3 cipher=OTHER); Fri, 07 Dec 2012 16:09:34 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  8 Dec 2012 01:09:23 +0100
Message-Id: <1354925363-14602-4-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
In-Reply-To: <1354925363-14602-1-git-send-email-andrea.adami@gmail.com>
References: <1354925363-14602-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 4/4] linux-yocto_3.4: reuse spitz.cfg for akita
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
X-List-Received-Date: Sat, 08 Dec 2012 00:24:00 -0000

* the single config specific to akita is added in akita.cfg

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.4/akita/akita.cfg          |   68 --------------------
 .../linux/linux-yocto-3.4/akita/akita.scc          |    1 +
 2 files changed, 1 insertions(+), 68 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
index 303a0b9..f6eb8f2 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
+++ b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.cfg
@@ -2,71 +2,3 @@
 # System Type
 #
 CONFIG_GPIO_PCA953X=y
-
-#
-# Processor Features
-#
-CONFIG_IWMMXT=y
-
-#
-# End-user Products (sorted by vendor name)
-#
-CONFIG_MACH_AKITA=y
-CONFIG_MACH_SPITZ=y
-CONFIG_MACH_BORZOI=y
-CONFIG_PXA27x=y
-CONFIG_PXA_SHARP_Cxx00=y
-CONFIG_SHARPSL_PM=y
-CONFIG_SHARPSL_PM_MAX1111=y
-
-#
-# Boot options
-#
-CONFIG_CMDLINE="console=ttyS0,115200n8 console=tty1 fbcon=rotate:1 loglevel=3"
-
-#
-# Disk-On-Chip Device Drivers
-#
-CONFIG_MTD_NAND_SHARPSL=y
-
-#
-# Input Device Drivers
-#
-CONFIG_KEYBOARD_MATRIX=y
-CONFIG_TOUCHSCREEN_ADS7846=y
-
-#
-# Userland interfaces
-#
-CONFIG_INPUT_MOUSEDEV_SCREEN_X=640
-CONFIG_INPUT_MOUSEDEV_SCREEN_Y=480
-
-#
-# Frame buffer hardware drivers
-#
-CONFIG_FB_PXA=y
-CONFIG_FB_PXA_OVERLAY=y
-CONFIG_FB_PXA_SMARTPANEL=y
-CONFIG_FB_PXA_PARAMETERS=y
-CONFIG_LCD_CORGI=y
-CONFIG_BACKLIGHT_GENERIC=y
-
-#
-# Console display driver support
-#
-CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
-CONFIG_FONT_8x16=y
-
-#
-# USB Miscellaneous drivers
-#
-CONFIG_USB_PXA27X=m
-CONFIG_SND_PXA2XX_SOC_I2S=m
-CONFIG_SND_PXA2XX_SOC_SPITZ=m
-CONFIG_SND_SOC_WM8750=m
-
-#
-# on-CPU RTC drivers
-#
-CONFIG_RTC_DRV_PXA=y
-CONFIG_RTC_DRV_SA1100=y
diff --git a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc
index 82fa4bd..e1549ef 100644
--- a/recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc
+++ b/recipes-kernel/linux/linux-yocto-3.4/akita/akita.scc
@@ -1,3 +1,4 @@
+kconf hardware ../spitz/spitz.cfg
 kconf hardware akita.cfg
 
 include ../zaurus-pxa-only.scc
-- 
1.7.8.6



