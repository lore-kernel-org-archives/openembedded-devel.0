Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id 5BA7C6FEEF
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 22:22:20 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id t60so6462817wes.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jun 2014 15:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=E+f8Uftsf98GDSI8x0Nti7BGwVdGMJy0UFNwHn++HhI=;
	b=n+7W2+Qo7cda4k0J7CML8LuggphUwYD/eIttL/MnQi6yH9jU8gFmPP9Pzo340L7VPo
	igprrm6zzSNlESyhMnF6RI9FjPPE/eproGFVc8Zdu6skfMdCIqGNTASIqDk04Bu/NtEd
	hKoYf9eP9johxu2mcAn+cCUDTSoZEJk061PYUVpremYtmUoPdOfmnKO40DedNDhXVh11
	uP7bPZLs1UqyUPo3SDvgITbWbAcM34VOkYEopb76BXQ6hZ3se4XlWlws+pwXTpZgpN5V
	lop8yjvgoAkPgv3Vh+YWRwLG04kGrh6/aymyRoXHHDu/lCQLoUYDJxkWugm+xZih9hJx
	MGFA==
X-Received: by 10.194.176.1 with SMTP id ce1mr8654082wjc.79.1402957341563;
	Mon, 16 Jun 2014 15:22:21 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host103-90-dynamic.45-79-r.retail.telecomitalia.it. [79.45.90.103])
	by mx.google.com with ESMTPSA id
	v45sm36829464eeg.29.2014.06.16.15.22.20 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 16 Jun 2014 15:22:21 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 17 Jun 2014 00:22:11 +0200
Message-Id: <76e8df6c70fd7db80902d8d9efb3ba08e0da5868.1402956940.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1402956940.git.andrea.adami@gmail.com>
References: <cover.1402956940.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1402956940.git.andrea.adami@gmail.com>
References: <cover.1402956940.git.andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 1/3] linux-yocto_3.14: zaurus: remove unused filesystems to reduce kernel size
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
X-List-Received-Date: Mon, 16 Jun 2014 22:22:22 -0000

Revert to the 3.2 pre-yocto settings.
Removed yaffs, reiserfs, btrfs, most xattr and posix options.
Make NFS modular.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.14/akita/defconfig           | 20 +++-----------------
 recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig | 20 +++-----------------
 .../linux/linux-yocto-3.14/collie/defconfig          | 20 +++-----------------
 .../linux/linux-yocto-3.14/poodle/defconfig          | 20 +++-----------------
 .../linux/linux-yocto-3.14/spitz/defconfig           | 20 +++-----------------
 recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig | 20 +++-----------------
 6 files changed, 18 insertions(+), 102 deletions(-)

diff --git a/recipes-kernel/linux/linux-yocto-3.14/akita/defconfig b/recipes-kernel/linux/linux-yocto-3.14/akita/defconfig
index 7672925..24b2f4a 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/akita/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/akita/defconfig
@@ -387,26 +387,15 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_FS_XATTR=y
-CONFIG_REISERFS_FS_POSIX_ACL=y
-CONFIG_BTRFS_FS=y
-CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_YAFFS_FS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
@@ -416,14 +405,11 @@ CONFIG_UBIFS_FS_ADVANCED_COMPR=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=m
 CONFIG_ROMFS_FS=m
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V4=m
 CONFIG_NFSD=m
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_XATTR=y
-CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_CODEPAGE_737=m
 CONFIG_NLS_CODEPAGE_775=m
diff --git a/recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig b/recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig
index c15260a..2088673 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/c7x0/defconfig
@@ -317,26 +317,15 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_FS_XATTR=y
-CONFIG_REISERFS_FS_POSIX_ACL=y
-CONFIG_BTRFS_FS=y
-CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_YAFFS_FS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
@@ -346,14 +335,11 @@ CONFIG_UBIFS_FS_ADVANCED_COMPR=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=m
 CONFIG_ROMFS_FS=m
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V4=m
 CONFIG_NFSD=m
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_XATTR=y
-CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_CODEPAGE_737=m
 CONFIG_NLS_CODEPAGE_775=m
diff --git a/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig b/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
index 9e37ee3..36ceadb 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/collie/defconfig
@@ -320,26 +320,15 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_FS_XATTR=y
-CONFIG_REISERFS_FS_POSIX_ACL=y
-CONFIG_BTRFS_FS=y
-CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_YAFFS_FS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
@@ -349,14 +338,11 @@ CONFIG_UBIFS_FS_ADVANCED_COMPR=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=m
 CONFIG_ROMFS_FS=m
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V4=m
 CONFIG_NFSD=m
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_XATTR=y
-CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_CODEPAGE_737=m
 CONFIG_NLS_CODEPAGE_775=m
diff --git a/recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig b/recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig
index a211bef..2aefea7 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/poodle/defconfig
@@ -318,26 +318,15 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_FS_XATTR=y
-CONFIG_REISERFS_FS_POSIX_ACL=y
-CONFIG_BTRFS_FS=y
-CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_YAFFS_FS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
@@ -347,14 +336,11 @@ CONFIG_UBIFS_FS_ADVANCED_COMPR=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=m
 CONFIG_ROMFS_FS=m
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V4=m
 CONFIG_NFSD=m
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_XATTR=y
-CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_CODEPAGE_737=m
 CONFIG_NLS_CODEPAGE_775=m
diff --git a/recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig b/recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig
index 4aa4b9c..f560a26 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/spitz/defconfig
@@ -386,26 +386,15 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_FS_XATTR=y
-CONFIG_REISERFS_FS_POSIX_ACL=y
-CONFIG_BTRFS_FS=y
-CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_YAFFS_FS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
@@ -415,14 +404,11 @@ CONFIG_UBIFS_FS_ADVANCED_COMPR=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=m
 CONFIG_ROMFS_FS=m
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V4=m
 CONFIG_NFSD=m
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_XATTR=y
-CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_CODEPAGE_737=m
 CONFIG_NLS_CODEPAGE_775=m
diff --git a/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig b/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
index bf7e376..f83cc49 100644
--- a/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
+++ b/recipes-kernel/linux/linux-yocto-3.14/tosa/defconfig
@@ -390,26 +390,15 @@ CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_SA1100=y
 CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
 CONFIG_EXT3_FS=y
-CONFIG_EXT3_FS_POSIX_ACL=y
-CONFIG_EXT3_FS_SECURITY=y
+# CONFIG_EXT3_FS_XATTR is not set
 CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_REISERFS_FS=m
-CONFIG_REISERFS_FS_XATTR=y
-CONFIG_REISERFS_FS_POSIX_ACL=y
-CONFIG_BTRFS_FS=y
-CONFIG_BTRFS_FS_POSIX_ACL=y
 CONFIG_AUTOFS4_FS=y
 CONFIG_FUSE_FS=m
 CONFIG_CUSE=m
 CONFIG_VFAT_FS=y
 CONFIG_TMPFS=y
 CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_YAFFS_FS=y
 CONFIG_JFFS2_FS=y
 CONFIG_JFFS2_SUMMARY=y
 CONFIG_JFFS2_COMPRESSION_OPTIONS=y
@@ -419,14 +408,11 @@ CONFIG_UBIFS_FS_ADVANCED_COMPR=y
 CONFIG_CRAMFS=y
 CONFIG_MINIX_FS=m
 CONFIG_ROMFS_FS=m
-CONFIG_NFS_FS=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
+CONFIG_NFS_FS=m
+CONFIG_NFS_V4=m
 CONFIG_NFSD=m
 CONFIG_NFSD_V4=y
 CONFIG_CIFS=m
-CONFIG_CIFS_XATTR=y
-CONFIG_CIFS_POSIX=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_CODEPAGE_737=m
 CONFIG_NLS_CODEPAGE_775=m
-- 
1.9.1


