Received: from smtp206.alice.it ([82.57.200.102])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Swppg-0000Kc-4x
	for openembedded-devel@lists.openembedded.org;
	Thu, 02 Aug 2012 09:28:32 +0200
Received: from mizar.localdomain (87.0.250.46) by smtp206.alice.it (8.6.023.02)
	id 500F3F9501DB4D84; Thu, 2 Aug 2012 09:16:52 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Aug 2012 09:16:48 +0200
Message-Id: <1343891809-3929-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld][PATCH 1/2] zaurus.inc: add framework for ubifs image types
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
X-List-Received-Date: Thu, 02 Aug 2012 07:28:32 -0000

* In preparation for the next kexecboot release.
* tested on poodle, c7x0 and spitz 3200
* (the different partitioning btw spitz models will be
* detected by kexecbot)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/include/zaurus.inc |   47 ++++++++++++++++++++++++++++++++++-----
 1 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index 45c82d3..899664a 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -2,22 +2,57 @@
 # Zaurus common settings
 ########################
 
+IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2 ubifs"
+INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
+IMAGE_DEVICE_TABLES = ""
+
 ERASEBLOCKSIZE = "0x4000"
 ERASEBLOCKSIZE_akita = "0x20000"
+ERASEBLOCKSIZE_spitz = "0x20000"
 
 # Warning! SL-C3000 has "0x4000" (16MiB NAND) 
 # C3100 and C3200 have same 128MiB NAND device as akita
-ERASEBLOCKSIZE_spitz = "0x20000"
-
-IMAGE_FSTYPES ?= "tar.gz jffs2 sum.jffs2"
-INITRAMFS_FSTYPES ?= "cpio.gz cpio.lzma"
+#
+# SL-C3000 (16-7 MiB = 576 PEBs)
+# 9 x 1024 : 16 = 576 PEBs
+# MKUBIFS_ARGS_spitz = "-m 512 -e 15872 -c 576 -x zlib"
+# UBINIZE_ARGS_spitz = "-m 512 -p 16384 -s 256"
+# ERASEBLOCKSIZE_spitz = "0x4000"
+
+# UBI: max collie (14.125 = 904 PEBs)
+# 14.125 x 1024 : 16 = 904 PEBs
+MKUBIFS_ARGS_collie = "-m 512 -e 15872 -c 904 -x zlib"
+UBINIZE_ARGS_collie = "-m 512 -p 16384 -s 256"
+
+# UBI: max poodle (64-7 MiB = 3648 PEBs)
+# 57 x 1024 : 16 = 3648 PEBs
+MKUBIFS_ARGS_poodle = "-m 512 -e 15872 -c 3648 -x zlib"
+UBINIZE_ARGS_poodle = "-m 512 -p 16384 -s 256"
+
+# UBI: max c7x0 (128-7 MiB = 7744 PEBs)
+# 121 x 1024 : 16 = 7744 PEBs
+MKUBIFS_ARGS_c7x0 = "-m 512 -e 15872 -c 7744 -x zlib"
+UBINIZE_ARGS_c7x0 = "-m 512 -p 16384 -s 256"
+
+# UBI: max tosa (128-7 MiB = 7744 PEBs)
+# 121 x 1024 : 16 = 7744 PEBs
+MKUBIFS_ARGS_tosa = "-m 512 -e 15872 -c 7744 -x zlib"
+UBINIZE_ARGS_tosa = "-m 512 -p 16384 -s 256"
+
+# UBI: max akita (128-7 MiB = 968 PEBs)
+# 121 x 1024 : 128 = 968 PEBs
+MKUBIFS_ARGS_akita = "-m 2048 -e 129024 -c 968 -x zlib"
+UBINIZE_ARGS_akita = "-m 2048 -p 131072 -s 512"
+
+# UBI: max spitz (128-7 MiB = 968 PEBs)
+# 121 x 1024 : 128 = 968 PEBs
+MKUBIFS_ARGS_spitz = "-m 2048 -e 129024 -c 968 -x zlib"
+UBINIZE_ARGS_spitz = "-m 2048 -p 131072 -s 512"
 
 # kernel now supports favourlzo
 EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
-IMAGE_DEVICE_TABLES = ""
-
 #########
 # xserver
 #########
-- 
1.7.8.6



