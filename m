Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f182.google.com (mail-wi0-f182.google.com
	[209.85.212.182])
	by mail.openembedded.org (Postfix) with ESMTP id 3981871710
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 20:38:32 +0000 (UTC)
Received: by mail-wi0-f182.google.com with SMTP id ex7so5195821wid.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Sep 2014 13:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=zU6m6hgQ5dIw1X/2q+xnAf+fact7QUVxaWnMa8x405M=;
	b=X0BQkjmBuewzmh2ShU8C9HG4tZpMJ+khldE/0vRXDgewUDS/J/oAndG7zWX50T8G4h
	n1NreqwTCJcuRvT9htvhlW44OJ0nQr179ncRsl9vuxacu6KuQYwF+Js05YN8B4JMlVK5
	TlgjzvMMGobMErNB7NbMdmaLLDIHAjyTTttk5+VnzGP+/LcOAnTdvtMgqwlgUK1YHhEc
	rYUvyePtbFECj/w4rBQM0isXFBpWhTTqPDcv6Npq0Gy5PO4XoJiGENJavWLMUv3ry77E
	QU1xzPpv/TS4gjVhbEZogk3QGUPCV7av+F05bSDfUb8yPca85q/n0Mw3UBcIG6bItYzi
	xSCA==
X-Received: by 10.194.120.37 with SMTP id kz5mr16267879wjb.107.1412109513583; 
	Tue, 30 Sep 2014 13:38:33 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host115-255-dynamic.2-87-r.retail.telecomitalia.it. [87.2.255.115])
	by mx.google.com with ESMTPSA id a2sm10848579wic.19.2014.09.30.13.38.32
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 30 Sep 2014 13:38:33 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 30 Sep 2014 22:38:11 +0200
Message-Id: <1412109491-3687-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot_3.17: initial commit based on 3.17-rc6
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
X-List-Received-Date: Tue, 30 Sep 2014 20:38:39 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.17.bb       | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb
new file mode 100644
index 0000000..f3296c7
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bb
@@ -0,0 +1,26 @@
+require recipes-kernel/linux/linux-yocto-tiny_3.17.bb
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
1.9.1


