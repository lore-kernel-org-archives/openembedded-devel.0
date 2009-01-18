Received: from [85.37.17.113] (helo=smtp-out113.alice.it)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LONRj-00054F-LY
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jan 2009 03:31:31 +0100
Received: from FBCMMO01.fbc.local ([192.168.68.195]) by smtp-out113.alice.it
	with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:44 +0100
Received: from FBCMCL01B06.fbc.local ([192.168.69.87]) by FBCMMO01.fbc.local
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Sun, 18 Jan 2009 03:24:44 +0100
Received: from localhost.localdomain ([79.30.253.111]) by
	FBCMCL01B06.fbc.local with Microsoft SMTPSVC(6.0.3790.1830); 
	Sun, 18 Jan 2009 03:24:38 +0100
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Jan 2009 03:24:31 +0100
Message-Id: <c1ce4054664d07c9f2a79ac7bcdf26637470aeec.1232244759.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.6.0.6
In-Reply-To: <48e10fbb365d98dff4b8086d562b339fe62e29a6.1232244759.git.andrea.adami@gmail.com>
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
	<48e10fbb365d98dff4b8086d562b339fe62e29a6.1232244759.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1232244759.git.andrea.adami@gmail.com>
References: <cover.1232244759.git.andrea.adami@gmail.com>
X-OriginalArrivalTime: 18 Jan 2009 02:24:38.0580 (UTC)
	FILETIME=[E9833740:01C97913]
Subject: [PATCH 11/14] linux-rp: update defconfigs for c7x0 and akita
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

- enable boot from EXT3
- enable boot from CF
- for both 2.6.24 and 2.6.26 kernels
- bump PR
---
 packages/linux/linux-rp-2.6.24/defconfig-akita |   12 ++++++------
 packages/linux/linux-rp-2.6.24/defconfig-c7x0  |   12 ++++++------
 packages/linux/linux-rp-2.6.26/defconfig-akita |   12 ++++++------
 packages/linux/linux-rp-2.6.26/defconfig-c7x0  |   12 ++++++------
 packages/linux/linux-rp_2.6.24.bb              |    2 +-
 packages/linux/linux-rp_2.6.26.bb              |    2 +-
 6 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/packages/linux/linux-rp-2.6.24/defconfig-akita b/packages/linux/linux-rp-2.6.24/defconfig-akita
index 32bfa9d..141be08 100644
--- a/packages/linux/linux-rp-2.6.24/defconfig-akita
+++ b/packages/linux/linux-rp-2.6.24/defconfig-akita
@@ -203,16 +203,16 @@ CONFIG_SHARP_SCOOP=y
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
@@ -645,7 +645,7 @@ CONFIG_BLK_DEV_IDE=y
 # CONFIG_BLK_DEV_IDE_SATA is not set
 CONFIG_BLK_DEV_IDEDISK=y
 # CONFIG_IDEDISK_MULTI_MODE is not set
-CONFIG_BLK_DEV_IDECS=m
+CONFIG_BLK_DEV_IDECS=y
 # CONFIG_BLK_DEV_IDECD is not set
 # CONFIG_BLK_DEV_IDETAPE is not set
 # CONFIG_BLK_DEV_IDEFLOPPY is not set
@@ -1444,10 +1444,10 @@ CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
 # CONFIG_EXT2_FS_XATTR is not set
 # CONFIG_EXT2_FS_XIP is not set
-CONFIG_EXT3_FS=m
+CONFIG_EXT3_FS=y
 # CONFIG_EXT3_FS_XATTR is not set
 # CONFIG_EXT4DEV_FS is not set
-CONFIG_JBD=m
+CONFIG_JBD=y
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
 # CONFIG_FS_POSIX_ACL is not set
diff --git a/packages/linux/linux-rp-2.6.24/defconfig-c7x0 b/packages/linux/linux-rp-2.6.24/defconfig-c7x0
index 4b54f9f..5abf790 100644
--- a/packages/linux/linux-rp-2.6.24/defconfig-c7x0
+++ b/packages/linux/linux-rp-2.6.24/defconfig-c7x0
@@ -205,16 +205,16 @@ CONFIG_SHARP_SCOOP=y
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
@@ -661,7 +661,7 @@ CONFIG_BLK_DEV_IDE=y
 # CONFIG_BLK_DEV_IDE_SATA is not set
 CONFIG_BLK_DEV_IDEDISK=y
 # CONFIG_IDEDISK_MULTI_MODE is not set
-CONFIG_BLK_DEV_IDECS=m
+CONFIG_BLK_DEV_IDECS=y
 # CONFIG_BLK_DEV_IDECD is not set
 # CONFIG_BLK_DEV_IDETAPE is not set
 # CONFIG_BLK_DEV_IDEFLOPPY is not set
@@ -1450,10 +1450,10 @@ CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
 # CONFIG_EXT2_FS_XATTR is not set
 # CONFIG_EXT2_FS_XIP is not set
-CONFIG_EXT3_FS=m
+CONFIG_EXT3_FS=y
 # CONFIG_EXT3_FS_XATTR is not set
 # CONFIG_EXT4DEV_FS is not set
-CONFIG_JBD=m
+CONFIG_JBD=y
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
 # CONFIG_FS_POSIX_ACL is not set
diff --git a/packages/linux/linux-rp-2.6.26/defconfig-akita b/packages/linux/linux-rp-2.6.26/defconfig-akita
index 0106fa5..a98dc48 100644
--- a/packages/linux/linux-rp-2.6.26/defconfig-akita
+++ b/packages/linux/linux-rp-2.6.26/defconfig-akita
@@ -203,16 +203,16 @@ CONFIG_SHARP_SCOOP=y
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
@@ -646,7 +646,7 @@ CONFIG_BLK_DEV_IDE=y
 # CONFIG_BLK_DEV_IDE_SATA is not set
 CONFIG_BLK_DEV_IDEDISK=y
 # CONFIG_IDEDISK_MULTI_MODE is not set
-CONFIG_BLK_DEV_IDECS=m
+CONFIG_BLK_DEV_IDECS=y
 # CONFIG_BLK_DEV_IDECD is not set
 # CONFIG_BLK_DEV_IDETAPE is not set
 # CONFIG_BLK_DEV_IDEFLOPPY is not set
@@ -1445,10 +1445,10 @@ CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
 # CONFIG_EXT2_FS_XATTR is not set
 # CONFIG_EXT2_FS_XIP is not set
-CONFIG_EXT3_FS=m
+CONFIG_EXT3_FS=y
 # CONFIG_EXT3_FS_XATTR is not set
 # CONFIG_EXT4DEV_FS is not set
-CONFIG_JBD=m
+CONFIG_JBD=y
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
 # CONFIG_FS_POSIX_ACL is not set
diff --git a/packages/linux/linux-rp-2.6.26/defconfig-c7x0 b/packages/linux/linux-rp-2.6.26/defconfig-c7x0
index b9b653c..380af6b 100644
--- a/packages/linux/linux-rp-2.6.26/defconfig-c7x0
+++ b/packages/linux/linux-rp-2.6.26/defconfig-c7x0
@@ -205,16 +205,16 @@ CONFIG_SHARP_SCOOP=y
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
@@ -662,7 +662,7 @@ CONFIG_BLK_DEV_IDE=y
 # CONFIG_BLK_DEV_IDE_SATA is not set
 CONFIG_BLK_DEV_IDEDISK=y
 # CONFIG_IDEDISK_MULTI_MODE is not set
-CONFIG_BLK_DEV_IDECS=m
+CONFIG_BLK_DEV_IDECS=y
 # CONFIG_BLK_DEV_IDECD is not set
 # CONFIG_BLK_DEV_IDETAPE is not set
 # CONFIG_BLK_DEV_IDEFLOPPY is not set
@@ -1451,10 +1451,10 @@ CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
 # CONFIG_EXT2_FS_XATTR is not set
 # CONFIG_EXT2_FS_XIP is not set
-CONFIG_EXT3_FS=m
+CONFIG_EXT3_FS=y
 # CONFIG_EXT3_FS_XATTR is not set
 # CONFIG_EXT4DEV_FS is not set
-CONFIG_JBD=m
+CONFIG_JBD=y
 # CONFIG_REISERFS_FS is not set
 # CONFIG_JFS_FS is not set
 # CONFIG_FS_POSIX_ACL is not set
diff --git a/packages/linux/linux-rp_2.6.24.bb b/packages/linux/linux-rp_2.6.24.bb
index 6bd53fb..a1ad351 100644
--- a/packages/linux/linux-rp_2.6.24.bb
+++ b/packages/linux/linux-rp_2.6.24.bb
@@ -1,6 +1,6 @@
 require linux-rp.inc
 
-PR = "r18"
+PR = "r19"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_collie = "1"
diff --git a/packages/linux/linux-rp_2.6.26.bb b/packages/linux/linux-rp_2.6.26.bb
index 55161a2..7a6ee08 100644
--- a/packages/linux/linux-rp_2.6.26.bb
+++ b/packages/linux/linux-rp_2.6.26.bb
@@ -1,6 +1,6 @@
 require linux-rp.inc
 
-PR = "r6"
+PR = "r7"
 
 DEFAULT_PREFERENCE = "-1"
 DEFAULT_PREFERENCE_qemuarm = "-1"
-- 
1.6.0.6



