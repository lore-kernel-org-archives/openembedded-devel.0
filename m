Received: from [85.33.2.25] (helo=smtp-out25.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRg-00053q-O5
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:28 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out25.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:41 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 18 Jan 2009 03:24:41 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:36 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:23 +0100
Message-Id: <cd9f2d057b582d2fb54e80ccc71e72ee1116bdc8.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
	<b313e1d6307a63ce53bbeaffbf01d842ef6f9e27.1232244759.git.andrea.adami@gmail.com>
	<98c252f0e21dc1d58f37dafe492d09b998dad5e5.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:36.0080 (UTC)
	FILETIME=[E805BF00:01C97913]
Subject: [PATCH 03/14] linux-kexecboot-2.6.26: defconfig fixes
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
X-List-Received-Date: Sun, 18 Jan 2009 02:31:29 -0000

- enable boot from nand for spitz
- enable boot from CF for c7x0 and akita
- bump PR
---
 .../linux-kexecboot-2.6.26/akita/defconfig         |    8 +++---
 .../linux-kexecboot-2.6.26/c7x0/defconfig          |    8 +++---
 .../linux-kexecboot-2.6.26/spitz/defconfig         |   29 ++++++++++---------
 packages/kexecboot/linux-kexecboot_2.6.26.bb       |    2 +-
 4 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/packages/kexecboot/linux-kexecboot-2.6.26/akita/defconfig b/packages/kexecboot/linux-kexecboot-2.6.26/akita/defconfig
index 0c9d323..80daecd 100644
--- a/packages/kexecboot/linux-kexecboot-2.6.26/akita/defconfig
+++ b/packages/kexecboot/linux-kexecboot-2.6.26/akita/defconfig
@@ -226,16 +226,16 @@ CONFIG_SHARP_SCOOP=y
 #
 # CONFIG_PCI_SYSCALL is not set
 # CONFIG_ARCH_SUPPORTS_MSI is not set
-CONFIG_PCCARD=m
+CONFIG_PCCARD=y
 # CONFIG_PCMCIA_DEBUG is not set
-CONFIG_PCMCIA=m
+CONFIG_PCMCIA=y
 CONFIG_PCMCIA_LOAD_CIS=y
 CONFIG_PCMCIA_IOCTL=y
 
 #
 # PC-card bridges
 #
-CONFIG_PCMCIA_PXA2XX=m
+CONFIG_PCMCIA_PXA2XX=y
 
 #
 # Kernel Features
@@ -430,7 +430,7 @@ CONFIG_BLK_DEV_IDE=y
 # CONFIG_BLK_DEV_IDE_SATA is not set
 CONFIG_BLK_DEV_IDEDISK=y
 # CONFIG_IDEDISK_MULTI_MODE is not set
-CONFIG_BLK_DEV_IDECS=m
+CONFIG_BLK_DEV_IDECS=y
 # CONFIG_BLK_DEV_IDECD is not set
 # CONFIG_BLK_DEV_IDETAPE is not set
 # CONFIG_BLK_DEV_IDEFLOPPY is not set
diff --git a/packages/kexecboot/linux-kexecboot-2.6.26/c7x0/defconfig b/packages/kexecboot/linux-kexecboot-2.6.26/c7x0/defconfig
index 7724d61..3196f89 100644
--- a/packages/kexecboot/linux-kexecboot-2.6.26/c7x0/defconfig
+++ b/packages/kexecboot/linux-kexecboot-2.6.26/c7x0/defconfig
@@ -228,16 +228,16 @@ CONFIG_SHARP_SCOOP=y
 #
 # CONFIG_PCI_SYSCALL is not set
 # CONFIG_ARCH_SUPPORTS_MSI is not set
-CONFIG_PCCARD=m
+CONFIG_PCCARD=y
 # CONFIG_PCMCIA_DEBUG is not set
-CONFIG_PCMCIA=m
+CONFIG_PCMCIA=y
 CONFIG_PCMCIA_LOAD_CIS=y
 CONFIG_PCMCIA_IOCTL=y
 
 #
 # PC-card bridges
 #
-CONFIG_PCMCIA_PXA2XX=m
+CONFIG_PCMCIA_PXA2XX=y
 
 #
 # Kernel Features
@@ -447,7 +447,7 @@ CONFIG_BLK_DEV_IDE=y
 # CONFIG_BLK_DEV_IDE_SATA is not set
 CONFIG_BLK_DEV_IDEDISK=y
 # CONFIG_IDEDISK_MULTI_MODE is not set
-CONFIG_BLK_DEV_IDECS=m
+CONFIG_BLK_DEV_IDECS=y
 # CONFIG_BLK_DEV_IDECD is not set
 # CONFIG_BLK_DEV_IDETAPE is not set
 # CONFIG_BLK_DEV_IDEFLOPPY is not set
diff --git a/packages/kexecboot/linux-kexecboot-2.6.26/spitz/defconfig b/packages/kexecboot/linux-kexecboot-2.6.26/spitz/defconfig
index c7c6442..9de4245 100644
--- a/packages/kexecboot/linux-kexecboot-2.6.26/spitz/defconfig
+++ b/packages/kexecboot/linux-kexecboot-2.6.26/spitz/defconfig
@@ -328,20 +328,21 @@ CONFIG_FW_LOADER=y
 # CONFIG_DEBUG_DRIVER is not set
 # CONFIG_DEBUG_DEVRES is not set
 # CONFIG_SYS_HYPERVISOR is not set
-CONFIG_MTD=m
+CONFIG_MTD=y
 # CONFIG_MTD_DEBUG is not set
 # CONFIG_MTD_CONCAT is not set
 CONFIG_MTD_PARTITIONS=y
 # CONFIG_MTD_REDBOOT_PARTS is not set
+CONFIG_MTD_CMDLINE_PARTS=y
 # CONFIG_MTD_AFS_PARTS is not set
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
@@ -366,7 +367,7 @@ CONFIG_MTD_CFI_I2=y
 # CONFIG_MTD_CFI_I4 is not set
 # CONFIG_MTD_CFI_I8 is not set
 # CONFIG_MTD_RAM is not set
-CONFIG_MTD_ROM=m
+CONFIG_MTD_ROM=y
 # CONFIG_MTD_ABSENT is not set
 
 #
@@ -374,7 +375,7 @@ CONFIG_MTD_ROM=m
 #
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 # CONFIG_MTD_PHYSMAP is not set
-CONFIG_MTD_SHARP_SL=m
+CONFIG_MTD_SHARP_SL=y
 # CONFIG_MTD_PLATRAM is not set
 
 #
@@ -391,14 +392,14 @@ CONFIG_MTD_SHARP_SL=m
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
@@ -1233,7 +1234,7 @@ CONFIG_TMPFS=y
 # CONFIG_BEFS_FS is not set
 # CONFIG_BFS_FS is not set
 # CONFIG_EFS_FS is not set
-CONFIG_JFFS2_FS=m
+CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_FS_DEBUG=0
 CONFIG_JFFS2_FS_WRITEBUFFER=y
 # CONFIG_JFFS2_FS_WBUF_VERIFY is not set
@@ -1465,10 +1466,10 @@ CONFIG_CRC_CCITT=y
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
diff --git a/packages/kexecboot/linux-kexecboot_2.6.26.bb b/packages/kexecboot/linux-kexecboot_2.6.26.bb
index a0d00ab..2fa0e6c 100644
--- a/packages/kexecboot/linux-kexecboot_2.6.26.bb
+++ b/packages/kexecboot/linux-kexecboot_2.6.26.bb
@@ -1,6 +1,6 @@
 require linux-kexecboot.inc
 
-PR = "r6"
+PR = "r7"
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_qemuarm = "-1"
 DEFAULT_PREFERENCE_qemux86 = "-1"
-- 
1.6.0.6



