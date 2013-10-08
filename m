Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f43.google.com (mail-ee0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8A5CF6CF69
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 23:40:57 +0000 (UTC)
Received: by mail-ee0-f43.google.com with SMTP id e52so13442eek.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 16:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=/nhXogQQoOMhzyVth27r5+77FmskybUM1WRKKvk1XIk=;
	b=Uobbfel0p/bN3sVc6/Uv1FAJM8oqlU+drB2F8GTnbG6P5YLrdRbSKfmiZHeaLo2O+F
	aFW+m4uuu2ZKZvxx3y4t0dYZbeDBZzXnTELwbyrckIOpfL8cda/CPzRBcoteb+7hNAh+
	ZM2m9A9Qutj+aX/IRdFlzt0d6Tif7EbzoVLyoixtD1rTQeqDiLEL5aeBBdxg5D2C2oA6
	Y2z87oD84o4wb8oqk/uH3nyyOgINqmc1J45t8qf6CnnJBBqhGYUCakhVymvRTs38YZO8
	DSLWRh29GY5TOJNnqt+wEnW4mqiYPvy1iEx4/MWbf2v0or73LvEafAmamptnGHKBGmIE
	c8bg==
X-Received: by 10.15.35.196 with SMTP id g44mr6491434eev.18.1381275659118;
	Tue, 08 Oct 2013 16:40:59 -0700 (PDT)
Received: from mizar.localdomain
	(host40-228-dynamic.1-79-r.retail.telecomitalia.it. [79.1.228.40])
	by mx.google.com with ESMTPSA id d8sm81475383eeh.8.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 16:40:58 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  9 Oct 2013 01:40:52 +0200
Message-Id: <1381275653-25949-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1381275653-25949-1-git-send-email-andrea.adami@gmail.com>
References: <1381275653-25949-1-git-send-email-andrea.adami@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Subject: [meta-handheld][PATCH 2/3] h3600.conf: update machine configuration
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
X-List-Received-Date: Tue, 08 Oct 2013 23:40:58 -0000

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/h3600.conf | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/conf/machine/h3600.conf b/conf/machine/h3600.conf
index 5cd1a6c..fea565c 100644
--- a/conf/machine/h3600.conf
+++ b/conf/machine/h3600.conf
@@ -9,29 +9,37 @@ require conf/machine/include/tune-strongarm1100.inc
 
 # h3700, h3800 have 32, but let that be the bonus
 ROOT_FLASH_SIZE = "16"
-# h3630 have 32Mb only
-VOLATILE_STORAGE_SIZE = "64"
+# h3630 have 32Mb only, others should set this to 64
+VOLATILE_STORAGE_SIZE = "32"
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
 MACHINE_DISPLAY_HEIGHT_PIXELS = "320"
-MACHINE_FEATURES = "kernel26 touchscreen apm alsa irda usbgadget screen vfat"
+MACHINE_FEATURES = "touchscreen apm alsa irda usbgadget screen vfat ext2"
 
 #
 # Software/packages selection
 #
-PREFERRED_PROVIDER_virtual/kernel = "linux"
-PREFERRED_PROVIDER_xserver = "xserver-kdrive"
-PREFERRED_VERSION_udev = "164"
+PREFERRED_PROVIDER_virtual/kernel = "linux-yocto"
+KERNEL_IMAGETYPE ?= "zImage"
+# Compression level for 32MB RAM
+XZ_COMPRESSION_LEVEL = "-2e"
 
-IMAGE_FSTYPES = "tar.bz2 jffs2"
+INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
+
+IMAGE_DEVICE_TABLES = ""
+
+IMAGE_FSTYPES = "jffs2"
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS = "kernel ipaq-boot-params"
-MACHINE_EXTRA_RRECOMMENDS = "\
-                             kernel-module-micro"
+MACHINE_EXTRA_RDEPENDS = "mtd-utils mtd-utils-jffs2"
+
+MACHINE_EXTRA_RRECOMMENDS = ""
 
-EXTRA_IMAGECMD_jffs2 = "-e 0x40000 -p ; echo '${IMAGE_NAME}  ${IMAGE_NAME}.rootfs.jffs2 - root' >> ${DEPLOY_DIR_IMAGE}/reflash.ctl"
+ERASEBLOCKSIZE = "0x40000"
+EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
 
 #
 # Modules autoload and other boot properties
 #
-SERIAL_CONSOLE = "115200 ttySA0 vt100"
+CMDLINE = "console=ttySA0,115200n8 console=tty1 fbcon=rotate:1"
+SERIAL_CONSOLE = "115200 ttySA0"
 USE_VT = "0"
-- 
1.8.1.5


