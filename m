Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id B9C8B73613
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 08:21:17 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id r20so1222785wiv.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 00:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wZhfeqqunwBqMGPZwnicnID0yc0O1GzVMtaRjHX9gcU=;
	b=PYGkZ7IeAr2ajq8ai+wnyR0nKKqkxB1GMGIhP9c8oBo/6fpUxX8MwZ9mnZCA0cjdzz
	dRuFsp0wtziB1FdsgQgOTDhv14ikPxu2PaY0cicVplGjQXTMrIwrREVsQrOwxk82UMot
	f+vbkvQDLan7ctUYTfyG2v+w4fKyDwATnJ24DbOlnOF5NG8EL53Yk2W9TKG8TniOD+Qx
	UX7hnENzBnl+unI/t4245D8ANGNichiteN7yqLgnj40HMohPrgbpLa38roYpB8XmhKoY
	yZJ6kxdQNgZ118KN40MxFEVkSsSLUKkIpaLZ90HBTDRKFOWse0550CXZv8bU3WuM28qw
	+rew==
X-Received: by 10.194.77.230 with SMTP id v6mr16776558wjw.25.1424420477686;
	Fri, 20 Feb 2015 00:21:17 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fo8sm1257279wib.14.2015.02.20.00.21.16
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 20 Feb 2015 00:21:16 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Feb 2015 09:21:17 +0100
Message-Id: <1424420477-30493-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.3.0
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: remove 3.10, 3.17 and add 3.19
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
X-List-Received-Date: Fri, 20 Feb 2015 08:21:17 -0000

* 3.10 and 3.17 were removed in oe-core and parsing fails because of the require line

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.17.bb       | 26 ----------------------
 ..._3.10.bb => linux-yocto-tiny-kexecboot_3.19.bb} |  2 +-
 2 files changed, 1 insertion(+), 27 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb
 rename meta-initramfs/recipes-kernel/linux/{linux-yocto-tiny-kexecboot_3.10.bb => linux-yocto-tiny-kexecboot_3.19.bb} (93%)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb
deleted file mode 100644
index f3296c7..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb
+++ /dev/null
@@ -1,26 +0,0 @@
-require recipes-kernel/linux/linux-yocto-tiny_3.17.bb
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
diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb
similarity index 93%
rename from meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
rename to meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb
index a823e0f..f6d2fa0 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.19.bb
@@ -1,4 +1,4 @@
-require recipes-kernel/linux/linux-yocto-tiny_3.10.bb
+require recipes-kernel/linux/linux-yocto-tiny_${PV}.bb
 SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
 
 PACKAGES = ""
-- 
2.3.0


