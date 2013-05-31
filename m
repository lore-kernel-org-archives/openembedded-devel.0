Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f174.google.com (mail-ea0-f174.google.com
	[209.85.215.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3575E6A430
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 21:56:07 +0000 (UTC)
Received: by mail-ea0-f174.google.com with SMTP id z7so2051298eaf.19
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 14:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=/Fj4JShVIzdIQSo6uz3dzRYpHwcpy2lGYy2CAeGnaWQ=;
	b=VXo1UnTOegY0fp/SoS3orKS7Oyae2aSnKZ27BE9IWYQb9+L0aMoRicJsqy8txb/ZaE
	n6MnoMlfd9r+lZZIenEbvVlxU34pG2Cc7NHLM6+1EbFmblvbDBicJbjCQuYbsQBbh0BQ
	X/bMvcpQhUAKF+EBR7uMWEHpCfXy6QJVq9Rg8MVXkiEdyd9Bv5RgEsCtKB/7nCdQVvnb
	ynnLi+nSyC22kKk3SdGwgCJBRTYANugQsaFacL0oeiwApZsUnNJTJwxKF7ImqSKBeJm3
	tenTXKX75MyirH1HKdWYmrib0TPIygPi7KFsjIWBhK5iHK+39eiRzYafAoD1VcG1aIY1
	OTug==
X-Received: by 10.14.251.193 with SMTP id b41mr14465421ees.126.1370037367340; 
	Fri, 31 May 2013 14:56:07 -0700 (PDT)
Received: from mizar.localdomain
	(host199-42-dynamic.183-80-r.retail.telecomitalia.it.
	[80.183.42.199])
	by mx.google.com with ESMTPSA id f1sm41488853eem.17.2013.05.31.14.56.05
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 14:56:06 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2013 23:55:56 +0200
Message-Id: <1370037356-12471-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1370037356-12471-1-git-send-email-andrea.adami@gmail.com>
References: <1370037356-12471-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/2] linux-yocto-tiny-kexecboot: move to version 3.8
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
X-List-Received-Date: Fri, 31 May 2013 21:56:07 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.4.bb             | 17 -----------------
 .../linux/linux-yocto-tiny-kexecboot_3.8.bb             | 17 +++++++++++++++++
 2 files changed, 17 insertions(+), 17 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
deleted file mode 100644
index 189f87b..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require recipes-kernel/linux/linux-yocto-tiny_3.4.bb
-
-PACKAGES = ""
-PROVIDES = ""
-
-KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${PR}-${MACHINE}"
-KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
-
-INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
-
-do_populate_sysroot() {
-    :
-}
-
-do_install() {
-    :
-}
diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
new file mode 100644
index 0000000..c4f7f20
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
@@ -0,0 +1,17 @@
+require recipes-kernel/linux/linux-yocto-tiny_3.8.bb
+
+PACKAGES = ""
+PROVIDES = ""
+
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${PR}-${MACHINE}"
+KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
+
+INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
+
+do_populate_sysroot() {
+    :
+}
+
+do_install() {
+    :
+}
-- 
1.8.1.5


