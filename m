Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id 76BB16D03A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 16:17:50 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id c50so3516133eek.32
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 09:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0zEvFfw9LDePC3qnoyOo5E42gBaJIXh/0OXton0yP1w=;
	b=dEK4BsfbTMp91F7AuU2ZnLhOzeI7hHSe1bFJHSXyltjPrNoZC5AHfa6LjU4XURGQrP
	1YErYMwDhJ/OLe2Ir52IQtJZGDdLx+7l1tKcuZq3o5VgpcrGAj8JKV9KBpOUjgKCvWdB
	0/vjFEk+nwHShQaX6iSiPVy1bXTHUcy4r7eZFzJAso9EHJ4a5pwM0mMKWSWblWBx+oFp
	DHtrUErM3Z7Kf2/ozt1wVVEY5tbH1qfUym1iA41g2wsiAGj+T3fp+TmLdEFSmaUSofWr
	Mr6SJ3xVXfsqcrGGdYYD6vZ5StGZK7YJPz5F+IgSpIV+OnnehvhtsXdnG2l7O7ltp+WO
	owcw==
X-Received: by 10.14.198.197 with SMTP id v45mr4925244een.52.1381767471645;
	Mon, 14 Oct 2013 09:17:51 -0700 (PDT)
Received: from mizar.localdomain ([95.237.174.211])
	by mx.google.com with ESMTPSA id
	l49sm71080987eeo.12.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 09:17:51 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Oct 2013 18:17:47 +0200
Message-Id: <1381767467-8803-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-handheld][PATCH] zaurus: readd specific bits to each machine
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
X-List-Received-Date: Mon, 14 Oct 2013 16:17:51 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/akita.conf         | 14 ++++++++++++--
 conf/machine/c7x0.conf          | 16 ++++++++++++---
 conf/machine/collie.conf        | 10 ++++++++++
 conf/machine/include/zaurus.inc | 43 -----------------------------------------
 conf/machine/poodle.conf        | 13 +++++++++++++
 conf/machine/spitz.conf         | 27 ++++++++++++++++++++++----
 conf/machine/tosa.conf          | 14 ++++++++++++--
 7 files changed, 83 insertions(+), 54 deletions(-)

diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
index 4f9bccd..b7b1ed7 100644
--- a/conf/machine/akita.conf
+++ b/conf/machine/akita.conf
@@ -2,11 +2,21 @@
 #@NAME: Sharp Zaurus SL-C1000
 #@DESCRIPTION: Machine configuration for the Sharp Zaurus SL-C1000 device
 
+# NAND factory-default
+# mtdparts=sharpsl-nand:7168k@0k(smf),59392k@7168k(root),-(home) 
+
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
 PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt" 
 MACHINE_FEATURES += "iwmmxt"
 
-# NAND factory-default
-# mtdparts=sharpsl-nand:7168k@0k(smf),59392k@7168k(root),-(home) 
+ERASEBLOCKSIZE = "0x20000"
+
+EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+
+# UBI: max akita (128-7 MiB = 968 PEBs)
+# 121 x 1024 : 128 = 968 PEBs
+MKUBIFS_ARGS = "-m 2048 -e 129024 -c 968 -x zlib"
+UBINIZE_ARGS = "-m 2048 -p ${ERASEBLOCKSIZE} -s 512"
diff --git a/conf/machine/c7x0.conf b/conf/machine/c7x0.conf
index 2f228a0..3c8e69a 100644
--- a/conf/machine/c7x0.conf
+++ b/conf/machine/c7x0.conf
@@ -2,11 +2,21 @@
 #@NAME: Sharp Zaurus SL-C7x0
 #@DESCRIPTION: Machine configuration for the Sharp Zaurus SL-C700, Sharp Zaurus SL-C750, Sharp Zaurus SL-C760, Sharp Zaurus SL-C860 devices
 
-require conf/machine/include/zaurus.inc
-require conf/machine/include/tune-xscale.inc
-
 # NAND factory-default
 # SL-C700 (corgi) mtdparts=sharpsl-nand:7168k@0k(smf),25600k@7168k(root),-(home)
 # SL-C750 (Shepherd) mtdparts=sharpsl-nand:7168k@0k(smf),25600k@7168k(root),-(home)
 # SL-C760 (Husky) mtdparts=sharpsl-nand:7168k@0k(smf),54272k@7168k(root),-(home)
 # SL-C860 (Boxer) mtdparts=sharpsl-nand:7168k@0k(smf),54272k@7168k(root),-(home)
+
+require conf/machine/include/zaurus.inc
+require conf/machine/include/tune-xscale.inc
+
+ERASEBLOCKSIZE = "0x4000"
+
+EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+
+# UBI: max c7x0 (128-7 MiB = 7744 PEBs)
+# 121 x 1024 : 16 = 7744 PEBs
+MKUBIFS_ARGS = "-m 512 -e 15872 -c 7744 -x zlib"
+UBINIZE_ARGS = "-m 512 -p ${ERASEBLOCKSIZE} -s 256"
diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index 660be96..00a25bf 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -4,3 +4,13 @@
 
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-strongarm1100.inc
+
+ERASEBLOCKSIZE = "0x20000"
+
+EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=${ERASEBLOCKSIZE} -n"
+EXTRA_IMAGECMD_sum.jffs2 = "--pad -l --eraseblock=0x20000 -n"
+
+# UBI: max collie (14.125 = 113 PEBs)
+# 14.125 x 1024 : 128 = 113 PEBs
+MKUBIFS_ARGS = "-m 2048 -e 129024 -c 113 -x zlib"
+UBINIZE_ARGS = "-m 2048 -p ${ERASEBLOCKSIZE} -s 512"
diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index fd8cc9e..2f5d2e7 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -6,49 +6,6 @@ IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2 ubifs"
 INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
 IMAGE_DEVICE_TABLES = ""
 
-ERASEBLOCKSIZE = "0x4000"
-ERASEBLOCKSIZE_akita = "0x20000"
-ERASEBLOCKSIZE_spitz = "0x20000"
-
-# Warning! SL-C3000 has "0x4000" (16MiB NAND) 
-# C3100 and C3200 have same 128MiB NAND device as akita
-#
-# SL-C3000 (16-7 MiB = 576 PEBs)
-# 9 x 1024 : 16 = 576 PEBs
-# MKUBIFS_ARGS_spitz = "-m 512 -e 15872 -c 576 -x zlib"
-# UBINIZE_ARGS_spitz = "-m 512 -p 16384 -s 256"
-# ERASEBLOCKSIZE_spitz = "0x4000"
-
-# UBI: max collie (14.125 = 113 PEBs)
-# 14.125 x 1024 : 128 = 113 PEBs
-MKUBIFS_ARGS_collie = "-m 2048 -e 129024 -c 113 -x zlib"
-UBINIZE_ARGS_collie = "-m 2048 -p 131072 -s 512"
-
-# UBI: max poodle (64-7 MiB = 3648 PEBs)
-# 57 x 1024 : 16 = 3648 PEBs
-MKUBIFS_ARGS_poodle = "-m 512 -e 15872 -c 3648 -x zlib"
-UBINIZE_ARGS_poodle = "-m 512 -p 16384 -s 256"
-
-# UBI: max c7x0 (128-7 MiB = 7744 PEBs)
-# 121 x 1024 : 16 = 7744 PEBs
-MKUBIFS_ARGS_c7x0 = "-m 512 -e 15872 -c 7744 -x zlib"
-UBINIZE_ARGS_c7x0 = "-m 512 -p 16384 -s 256"
-
-# UBI: max tosa (128-7 MiB = 7744 PEBs)
-# 121 x 1024 : 16 = 7744 PEBs
-MKUBIFS_ARGS_tosa = "-m 512 -e 15872 -c 7744 -x zlib"
-UBINIZE_ARGS_tosa = "-m 512 -p 16384 -s 256"
-
-# UBI: max akita (128-7 MiB = 968 PEBs)
-# 121 x 1024 : 128 = 968 PEBs
-MKUBIFS_ARGS_akita = "-m 2048 -e 129024 -c 968 -x zlib"
-UBINIZE_ARGS_akita = "-m 2048 -p 131072 -s 512"
-
-# UBI: max spitz (128-7 MiB = 968 PEBs)
-# 121 x 1024 : 128 = 968 PEBs
-MKUBIFS_ARGS_spitz = "-m 2048 -e 129024 -c 968 -x zlib"
-UBINIZE_ARGS_spitz = "-m 2048 -p 131072 -s 512"
-
 # kernel now supports favourlzo
 EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
diff --git a/conf/machine/poodle.conf b/conf/machine/poodle.conf
index f2b5cf9..b3a34f8 100644
--- a/conf/machine/poodle.conf
+++ b/conf/machine/poodle.conf
@@ -2,5 +2,18 @@
 #@NAME: Sharp Zaurus SL-B500, Sharp Zaurus SL-5600
 #@DESCRIPTION: Machine configuration for the PXA250 based Sharp Zaurus SL-B500 and SHarp Zaurus SL-5600 devices
 
+# NAND factory-default
+# SL-5600 (poodle) mtdparts=sharpsl-nand:7168k@0k(smf),22528k@7168k(root),-(home)
+
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
+
+ERASEBLOCKSIZE = "0x4000"
+
+EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+
+# UBI: max poodle (64-7 MiB = 3648 PEBs)
+# 57 x 1024 : 16 = 3648 PEBs
+MKUBIFS_ARGS = "-m 512 -e 15872 -c 3648 -x zlib"
+UBINIZE_ARGS = "-m 512 -p ${ERASEBLOCKSIZE} -s 256"
diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
index 0929029..e88462e 100644
--- a/conf/machine/spitz.conf
+++ b/conf/machine/spitz.conf
@@ -2,13 +2,32 @@
 #@NAME: Sharp Zaurus SL-C3000
 #@DESCRIPTION: Machine configuration for the Sharp Zaurus SL-C3000 device
 
+# NAND factory-default
+# SL-C3000 (spitz) mtdparts=sharpsl-nand:7168k@0k(smf),5120k@7168k(root),-(home)
+# SL-C3100 (borzoi) mtdparts=sharpsl-nand:7168k@0k(smf),32768k@7168k(root),-(home)
+# SL-C3200 (terrier) mtdparts=sharpsl-nand:7168k@0k(smf),44032k@7168k(root),-(home)
+
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
 MACHINE_FEATURES += "iwmmxt"
 PACKAGE_EXTRA_ARCHS_tune-xscale += "iwmmxt"
 
-# NAND factory-default
-# SL-C3000 (spitz) mtdparts=sharpsl-nand:7168k@0k(smf),5120k@7168k(root),-(home)
-# SL-C3100 (borzoi) mtdparts=sharpsl-nand:7168k@0k(smf),32768k@7168k(root),-(home)
-# SL-C3200 (terrier) mtdparts=sharpsl-nand:7168k@0k(smf),44032k@7168k(root),-(home)
+# Warning! SL-C3000 has "0x4000" (16MiB NAND) 
+# C3100 and C3200 have same 128MiB NAND device as akita
+#
+# SL-C3000 (16-7 MiB = 576 PEBs)
+# 9 x 1024 : 16 = 576 PEBs
+# ERASEBLOCKSIZE = "0x4000"
+# MKUBIFS_ARGS = "-m 512 -e 15872 -c 576 -x zlib"
+# UBINIZE_ARGS = "-m 512 -p 16384 -s 256"
+
+ERASEBLOCKSIZE = "0x20000"
+
+EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+
+# UBI: max spitz (128-7 MiB = 968 PEBs)
+# 121 x 1024 : 128 = 968 PEBs
+MKUBIFS_ARGS = "-m 2048 -e 129024 -c 968 -x zlib"
+UBINIZE_ARGS = "-m 2048 -p ${ERASEBLOCKSIZE} -s 512"
diff --git a/conf/machine/tosa.conf b/conf/machine/tosa.conf
index 70cfedd..dcfad04 100644
--- a/conf/machine/tosa.conf
+++ b/conf/machine/tosa.conf
@@ -2,8 +2,18 @@
 #@NAME: Sharp Zaurus SL-6000
 #@DESCRIPTION: Machine configuration for the PXA255 based Sharp Zaurus SL-6000 device
 
+# NAND factory-default
+# mtdparts=sharpsl-nand:7168k@0k(smf),28672k@7168k(root),-(home)
+
 require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-xscale.inc
 
-# NAND factory-default
-# mtdparts=sharpsl-nand:7168k@0k(smf),28672k@7168k(root),-(home)
+ERASEBLOCKSIZE = "0x4000"
+
+EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
+EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
+
+# UBI: max tosa (128-7 MiB = 7744 PEBs)
+# 121 x 1024 : 16 = 7744 PEBs
+MKUBIFS_ARGS = "-m 512 -e 15872 -c 7744 -x zlib"
+UBINIZE_ARGS = "-m 512 -p ${ERASEBLOCKSIZE} -s 256"
-- 
1.8.1.5


