Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 975A76B6EA
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 11:57:31 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id f206so64187065wmf.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 03:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=faKTOo2I80cwvlecBXQD6ZqwFJ2Q77xi3KWfk00Xrqk=;
	b=SCnmW67LsBbBaQJnXgUGIbgW+pwmHPTgC4Qqfj6SroCr0cU/sURFpZonY8GamvLfc1
	TLl6V86oNcSODgfR39godwJE5VhE+mQpz7ngXy0jW3zLMVua2tDAW9CFZbiMoG9HuzTF
	6NTwbiIE+2yiioEg1K9MTjXzXGpBLMySQI02IFZejWEcLSicE3dR0ZKTVrpgkKAvk1C4
	lod1QRuzFEK4lFsgQ8F3ji7TwcSv/I+dfaE8dttrmtnGslgl0kUBSfqNR8Jc47vXmmk0
	hMRpZ9pFaA4sBuUlHPUwADPUmV5kGSWIjWeiktRnzltV82BSb19/hlER5LTOhLT2Y+Pm
	jvUg==
X-Received: by 10.28.72.2 with SMTP id v2mr73696792wma.84.1451476651509;
	Wed, 30 Dec 2015 03:57:31 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	w194sm10653242wmd.0.2015.12.30.03.57.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 03:57:30 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Dec 2015 13:01:05 +0100
Message-Id: <1451476865-16936-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.6.4
Subject: [PATCH][meta-initramfs] linux-yocto-tiny-kexecboot: upgrade to 4.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Dec 2015 11:57:31 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.19.bb       | 26 ----------------------
 .../linux/linux-yocto-tiny-kexecboot_4.1.bb        | 26 ++++++++++++++++++++++
 2 files changed, 26 insertions(+), 26 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.1.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb
deleted file mode 100644
index f6d2fa0..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require recipes-kernel/linux/linux-yocto-tiny_${PV}.bb
-SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
-
-PACKAGES = ""
-PROVIDES = ""
-
-KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${MACHINE}"
-KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
-
-INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
-INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
-
-# disable unneeded tasks
-do_install[noexec] = "1"
-do_package[noexec] = "1"
-do_package_qa[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_deb[noexec] = "1"
-do_package_ipk[noexec] = "1"
-do_package_rpm[noexec] = "1"
-do_package_tar[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
-do_package_write_tar[noexec] = "1"
-do_populate_sysroot[noexec] = "1"
diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.1.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.1.bb
new file mode 100644
index 0000000..f6d2fa0
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.1.bb
@@ -0,0 +1,26 @@
+require recipes-kernel/linux/linux-yocto-tiny_${PV}.bb
+SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
+
+PACKAGES = ""
+PROVIDES = ""
+
+KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${MACHINE}"
+KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
+
+INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
+INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
+
+# disable unneeded tasks
+do_install[noexec] = "1"
+do_package[noexec] = "1"
+do_package_qa[noexec] = "1"
+do_packagedata[noexec] = "1"
+do_package_deb[noexec] = "1"
+do_package_ipk[noexec] = "1"
+do_package_rpm[noexec] = "1"
+do_package_tar[noexec] = "1"
+do_package_write_deb[noexec] = "1"
+do_package_write_ipk[noexec] = "1"
+do_package_write_rpm[noexec] = "1"
+do_package_write_tar[noexec] = "1"
+do_populate_sysroot[noexec] = "1"
-- 
2.6.4


