Received: from smtp207.alice.it ([82.57.200.103])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1SxPmE-0008Ua-0D
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Aug 2012 23:51:22 +0200
Received: from mizar.localdomain (87.0.250.46) by smtp207.alice.it (8.6.023.02)
	id 500F3F9702503ADE; Fri, 3 Aug 2012 23:34:06 +0200
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  3 Aug 2012 23:34:03 +0200
Message-Id: <1344029643-5473-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [meta-handheld] [PATCH] zaurus: fix jffs2 and ubifs images for collie
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
X-List-Received-Date: Fri, 03 Aug 2012 21:51:22 -0000

* sumtool doesn't accept the same params used in mkfs.jffs2
* ubi calculation was wrong, erasesize is 0x20000
* and subpages seem to be 512 bytes

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 conf/machine/collie.conf        |    2 --
 conf/machine/include/zaurus.inc |   11 +++++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/conf/machine/collie.conf b/conf/machine/collie.conf
index 51001c7..2cd1499 100644
--- a/conf/machine/collie.conf
+++ b/conf/machine/collie.conf
@@ -6,8 +6,6 @@ require conf/machine/include/zaurus.inc
 require conf/machine/include/tune-strongarm1100.inc
 
 ROOT_FLASH_SIZE = "14"
-# actually 14680064
-EXTRA_IMAGECMD_jffs2 = "--pad=14680064 --little-endian --eraseblock=0x20000 -n"
 
 MACHINE_GUI_CLASS = "smallscreen"
 MACHINE_DISPLAY_WIDTH_PIXELS = "240"
diff --git a/conf/machine/include/zaurus.inc b/conf/machine/include/zaurus.inc
index cfcee14..3f5c642 100644
--- a/conf/machine/include/zaurus.inc
+++ b/conf/machine/include/zaurus.inc
@@ -19,10 +19,10 @@ ERASEBLOCKSIZE_spitz = "0x20000"
 # UBINIZE_ARGS_spitz = "-m 512 -p 16384 -s 256"
 # ERASEBLOCKSIZE_spitz = "0x4000"
 
-# UBI: max collie (14.125 = 904 PEBs)
-# 14.125 x 1024 : 16 = 904 PEBs
-MKUBIFS_ARGS_collie = "-m 512 -e 15872 -c 904 -x zlib"
-UBINIZE_ARGS_collie = "-m 512 -p 16384 -s 256"
+# UBI: max collie (14.125 = 113 PEBs)
+# 14.125 x 1024 : 128 = 113 PEBs
+MKUBIFS_ARGS_collie = "-m 2048 -e 129024 -c 113 -x zlib"
+UBINIZE_ARGS_collie = "-m 2048 -p 131072 -s 512"
 
 # UBI: max poodle (64-7 MiB = 3648 PEBs)
 # 57 x 1024 : 16 = 3648 PEBs
@@ -53,6 +53,9 @@ UBINIZE_ARGS_spitz = "-m 2048 -p 131072 -s 512"
 EXTRA_IMAGECMD_jffs2 = "-p -l --eraseblock=${ERASEBLOCKSIZE}"
 EXTRA_IMAGECMD_sum.jffs2 = "${EXTRA_IMAGECMD_jffs2}"
 
+EXTRA_IMAGECMD_jffs2_collie = "--pad=14680064 --little-endian --eraseblock=0x20000 -n"
+EXTRA_IMAGECMD_sum.jffs2_collie = "--pad -l --eraseblock=0x20000 -n"
+
 #########
 # xserver
 #########
-- 
1.7.8.6



