Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f169.google.com (mail-we0-f169.google.com
	[74.125.82.169])
	by mail.openembedded.org (Postfix) with ESMTP id EF78F60304
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 20:34:58 +0000 (UTC)
Received: by mail-we0-f169.google.com with SMTP id n57so2793036wev.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jun 2013 13:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=uCyDP2nJoVNkUHAkBaTFQhrCnUrZLWjqQrmHtqFmexo=;
	b=tdOWY9fOm8uco+WXY0vPstkLz1WBtrMNm4sbSTn2T8CDZFokTwUqEltHq+4sOOG8qq
	aqUeeud7DccLVe2FMLynYQD/U7NHN/5n4O29xWZomsqFIn573uP/zbHGMrBY4/RX3ZKP
	pWucmZFIXVsiGa7uJQEN43kVIXgTNI6lN2V3PEQvPAVZobUjedc8dCVJQiZ45OH5XdMj
	leiYIgY1Liq6AZUr/0Bnr8uLGEhq8aaUHM9T68upicHeRpcnjneppYK1CTqV+RJKv77X
	yeGNR4ly2NmUHO1IrttGSDVFBO/TxVag6HiJs3sGKR9k8VaLYYS3+A6VAeIcLsOzz477
	WbyQ==
X-Received: by 10.194.75.201 with SMTP id e9mr2776310wjw.20.1371501299449;
	Mon, 17 Jun 2013 13:34:59 -0700 (PDT)
Received: from mizar.localdomain
	(host253-191-dynamic.56-82-r.retail.telecomitalia.it.
	[82.56.191.253]) by mx.google.com with ESMTPSA id
	dz8sm24600208wib.11.2013.06.17.13.34.58 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 17 Jun 2013 13:34:58 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Jun 2013 22:34:44 +0200
Message-Id: <1a5eb2a0296312cf9fff8fd00198ae8b3839c734.1371499248.git.andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
In-Reply-To: <cover.1371499248.git.andrea.adami@gmail.com>
References: <cover.1371499248.git.andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 1/9] initramfs-kexecboot(-klibc)-image: provide SUMMARY and DESCRIPTION
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
X-List-Received-Date: Mon, 17 Jun 2013 20:34:59 -0000

* plus some minor editing of comments

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb | 10 ++++------
 .../recipes-bsp/images/initramfs-kexecboot-klibc-image.bb      |  6 +++++-
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
index dbe5583..dd6d07d 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-image.bb
@@ -1,6 +1,5 @@
-# Initramfs image providing kexecboot
-# a linux as bootloader implementation
-
+SUMMARY = "Initramfs image for kexecboot kernel"
+DESCRIPTION = "This image provides kexecboot (linux as bootloader) and helpers."
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
@@ -9,9 +8,8 @@ IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
 # avoid circular dependencies
 EXTRA_IMAGEDEPENDS = ""
 
-# for ubiattach we have to install mtd-utils-ubifs
-# or use ubiattach-klibc instead
-IMAGE_INSTALL = "kexec kexecboot mtd-utils-ubifs"
+# We really need just kexecboot, kexec and ubiattach
+IMAGE_INSTALL = "kexecboot kexec mtd-utils-ubifs"
 
 # Do not pollute the initrd image with rootfs features
 IMAGE_FEATURES = ""
diff --git a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
index 37349e1..df97511 100644
--- a/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
+++ b/meta-initramfs/recipes-bsp/images/initramfs-kexecboot-klibc-image.bb
@@ -1,3 +1,7 @@
 require initramfs-kexecboot-image.bb
 
-IMAGE_INSTALL = "kexec-klibc kexecboot-klibc ubiattach-klibc"
+SUMMARY = "Initramfs image for kexecboot kernel (klibc-static binaries)"
+
+# We really need just kexecboot, kexec and ubiattach
+# statically compiled against klibc
+IMAGE_INSTALL = "kexecboot-klibc kexec-klibc ubiattach-klibc"
-- 
1.8.1.5


