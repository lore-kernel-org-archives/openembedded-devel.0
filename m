Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRj-00054F-8X
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:31 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:44 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 18 Jan 2009 03:24:43 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:38 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:30 +0100
Message-Id: <48e10fbb365d98dff4b8086d562b339fe62e29a6.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <ea6b4f404328c7722af631e1fcf6050a184eef42.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
	<cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
	<a75400f3e012a40bf684d0c4537e3310019c8c59.1232244759.git.andrea.adami@gmail.com>
	<2c1715b769f3227f74aa46bae8c27587e5387d3e.1232244759.git.andrea.adami@gmail.com>
	<45a1b453435a1f916e5540bd0845762636b0ac1f.1232244759.git.andrea.adami@gmail.com>
	<8c1396b3add963b97e1f9f144c1bdd966ebbce02.1232244759.git.andrea.adami@gmail.com>
	<4c945c9a1076160cee628241443c8a27d8b5e1ca.1232244759.git.andrea.adami@gmail.com>
	<ea6b4f404328c7722af631e1fcf6050a184eef42.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:38.0252 (UTC)
	FILETIME=[E9512AC0:01C97913]
Subject: [PATCH 10/14] linux-rp: update defconfig for spitz
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:31 -0000

- enable boot from nand
- for both 2.6.24 and 2.6.26 kernels
- bump PR
---
 packages/linux/linux-rp-2.6.24/defconfig-spitz |   29 ++++++++++++-----------
 packages/linux/linux-rp-2.6.26/defconfig-spitz |   29 ++++++++++++-----------
 packages/linux/linux-rp_2.6.24.bb              |    2 +-
 packages/linux/linux-rp_2.6.26.bb              |    2 +-
 4 files changed, 32 insertions(+), 30 deletions(-)

diff --git a/packages/linux/linux-rp-2.6.24/defconfig-spitz b/packages/linux/linux-rp-2.6.24/defconfig-spitz
index d97e13f..cc7f17e 100644
--- a/packages/linux/linux-rp-2.6.24/defconfig-spitz
+++ b/packages/linux/linux-rp-2.6.24/defconfig-spitz
@@ -544,19 +544,20 @@ CONFIG_FW_LOADER=y
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
 # CONFIG_CONNECTOR is not set
-CONFIG_MTD=m
+CONFIG_MTD=y
 # CONFIG_MTD_DEBUG is not set
 # CONFIG_MTD_CONCAT is not set
 CONFIG_MTD_PARTITIONS=y
 # CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
 # CONFIG_MTD_AFS_PARTS is not set
 
 #
 # User Modules And Translation Layers
 #
-CONFIG_MTD_CHAR=m
-CONFIG_MTD_BLKDEVS=m
-CONFIG_MTD_BLOCK=m
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
 # CONFIG_MTD_BLOCK_RO is not set
 # CONFIG_FTL is not set
 # CONFIG_NFTL is not set
@@ -581,7 +582,7 @@ CONFIG_MTD_CFI_I2=y
 # CONFIG_MTD_CFI_I4 is not set
 # CONFIG_MTD_CFI_I8 is not set
 # CONFIG_MTD_RAM is not set
-CONFIG_MTD_ROM=m
+CONFIG_MTD_ROM=y
 # CONFIG_MTD_ABSENT is not set
 
 #
@@ -589,7 +590,7 @@ CONFIG_MTD_ROM=m
 #
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 # CONFIG_MTD_PHYSMAP is not set
-CONFIG_MTD_SHARP_SL=m
+CONFIG_MTD_SHARP_SL=y
 # CONFIG_MTD_PLATRAM is not set
 
 #
@@ -606,14 +607,14 @@ CONFIG_MTD_SHARP_SL=m
 # CONFIG_MTD_DOC2000 is not set
 # CONFIG_MTD_DOC2001 is not set
 # CONFIG_MTD_DOC2001PLUS is not set
-CONFIG_MTD_NAND=m
+CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_VERIFY_WRITE=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
 # CONFIG_MTD_NAND_H1900 is not set
-CONFIG_MTD_NAND_IDS=m
+CONFIG_MTD_NAND_IDS=y
 # CONFIG_MTD_NAND_DISKONCHIP is not set
-CONFIG_MTD_NAND_SHARPSL=m
+CONFIG_MTD_NAND_SHARPSL=y
 # CONFIG_MTD_NAND_NANDSIM is not set
 # CONFIG_MTD_NAND_PLATFORM is not set
 # CONFIG_MTD_ALAUDA is not set
@@ -1502,7 +1503,7 @@ CONFIG_TMPFS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-CONFIG_JFFS2_FS=m
+CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_DEBUG=0
 CONFIG_JFFS2_FS_WRITEBUFFER=y
 # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
@@ -1731,10 +1732,10 @@ CONFIG_CRC_CCITT=y
 CONFIG_CRC32=y
 # CONFIG_CRC7 is not set
 CONFIG_LIBCRC32C=m
-CONFIG_ZLIB_INFLATE=m
-CONFIG_ZLIB_DEFLATE=m
-CONFIG_LZO_COMPRESS=m
-CONFIG_LZO_DECOMPRESS=m
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
 CONFIG_PLIST=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
diff --git a/packages/linux/linux-rp-2.6.26/defconfig-spitz b/packages/linux/linux-rp-2.6.26/defconfig-spitz
index 775efaf..587b2e6 100644
--- a/packages/linux/linux-rp-2.6.26/defconfig-spitz
+++ b/packages/linux/linux-rp-2.6.26/defconfig-spitz
@@ -563,20 +563,21 @@ CONFIG_FW_LOADER=y
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
 # CONFIG_CONNECTOR is not set
-CONFIG_MTD=m
+CONFIG_MTD=y
 # CONFIG_MTD_DEBUG is not set
 # CONFIG_MTD_CONCAT is not set
 CONFIG_MTD_PARTITIONS=y
 # CONFIG_MTD_REDBOOT_PARTS is not set
 # CONFIG_MTD_AFS_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
 # CONFIG_MTD_AR7_PARTS is not set
 
 #
 # User Modules And Translation Layers
 #
-CONFIG_MTD_CHAR=m
-CONFIG_MTD_BLKDEVS=m
-CONFIG_MTD_BLOCK=m
+CONFIG_MTD_CHAR=y
+CONFIG_MTD_BLKDEVS=y
+CONFIG_MTD_BLOCK=y
 # CONFIG_MTD_BLOCK_RO is not set
 # CONFIG_FTL is not set
 # CONFIG_NFTL is not set
@@ -601,7 +602,7 @@ CONFIG_MTD_CFI_I2=y
 # CONFIG_MTD_CFI_I4 is not set
 # CONFIG_MTD_CFI_I8 is not set
 # CONFIG_MTD_RAM is not set
-CONFIG_MTD_ROM=m
+CONFIG_MTD_ROM=y
 # CONFIG_MTD_ABSENT is not set
 
 #
@@ -609,7 +610,7 @@ CONFIG_MTD_ROM=m
 #
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 # CONFIG_MTD_PHYSMAP is not set
-CONFIG_MTD_SHARP_SL=m
+CONFIG_MTD_SHARP_SL=y
 # CONFIG_MTD_PLATRAM is not set
 
 #
@@ -626,14 +627,14 @@ CONFIG_MTD_SHARP_SL=m
 # CONFIG_MTD_DOC2000 is not set
 # CONFIG_MTD_DOC2001 is not set
 # CONFIG_MTD_DOC2001PLUS is not set
-CONFIG_MTD_NAND=m
+CONFIG_MTD_NAND=y
 CONFIG_MTD_NAND_VERIFY_WRITE=y
 # CONFIG_MTD_NAND_ECC_SMC is not set
 # CONFIG_MTD_NAND_MUSEUM_IDS is not set
 # CONFIG_MTD_NAND_H1900 is not set
-CONFIG_MTD_NAND_IDS=m
+CONFIG_MTD_NAND_IDS=y
 # CONFIG_MTD_NAND_DISKONCHIP is not set
-CONFIG_MTD_NAND_SHARPSL=m
+CONFIG_MTD_NAND_SHARPSL=y
 # CONFIG_MTD_NAND_NANDSIM is not set
 # CONFIG_MTD_NAND_PLATFORM is not set
 # CONFIG_MTD_ALAUDA is not set
@@ -1561,7 +1562,7 @@ CONFIG_TMPFS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-CONFIG_JFFS2_FS=m
+CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_DEBUG=0
 CONFIG_JFFS2_FS_WRITEBUFFER=y
 # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
@@ -1824,10 +1825,10 @@ CONFIG_CRC_CCITT=y
 CONFIG_CRC32=y
 # CONFIG_CRC7 is not set
 CONFIG_LIBCRC32C=m
-CONFIG_ZLIB_INFLATE=m
-CONFIG_ZLIB_DEFLATE=m
-CONFIG_LZO_COMPRESS=m
-CONFIG_LZO_DECOMPRESS=m
+CONFIG_ZLIB_INFLATE=y
+CONFIG_ZLIB_DEFLATE=y
+CONFIG_LZO_COMPRESS=y
+CONFIG_LZO_DECOMPRESS=y
 CONFIG_PLIST=y
 CONFIG_HAS_IOMEM=y
 CONFIG_HAS_IOPORT=y
diff --git a/packages/linux/linux-rp_2.6.24.bb b/packages/linux/linux-rp_2.6.24.bb
index 3cc4df8..6bd53fb 100644
--- a/packages/linux/linux-rp_2.6.24.bb
+++ b/packages/linux/linux-rp_2.6.24.bb
@@ -1,6 +1,6 @@
 require linux-rp.inc
 
-PR = "r17"
+PR = "r18"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_collie = "1"
diff --git a/packages/linux/linux-rp_2.6.26.bb b/packages/linux/linux-rp_2.6.26.bb
index b977cf3..55161a2 100644
--- a/packages/linux/linux-rp_2.6.26.bb
+++ b/packages/linux/linux-rp_2.6.26.bb
@@ -1,6 +1,6 @@
 require linux-rp.inc
 
-PR = "r5"
+PR = "r6"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_qemuarm = "-1"
-- 
1.6.0.6



