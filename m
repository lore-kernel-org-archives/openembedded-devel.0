Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f52.google.com (mail-ee0-f52.google.com [74.125.83.52])
	by mail.openembedded.org (Postfix) with ESMTP id F0D1D610F8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2013 22:06:11 +0000 (UTC)
Received: by mail-ee0-f52.google.com with SMTP id c41so1490795eek.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Sep 2013 15:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=I3Ot/5RGt9/FsxIe/EApd5ibC4uOPzLTbcelx9pnGi4=;
	b=gqZRx2kR1qGKV5SN/SjME6H8+3u5y1C+zFAsBeK4pfTFYvBpHxvAFthb3JgpmF0nfT
	4WxI+UP3q7II9hfWx7/sRPm6gUS/oex4FyJePui5qRdJs9vDC5zFfC61gU6I1uButLtt
	/jTjm+FkMsmO4b2E0nPVTJ54v0ck6xpaGu5L24g4igECMel9Lb5f/4aBrHsIKZ3MYItu
	wWNFskUXMcovC7s4ISZPGiIq6K4D6AxBwZBqXJyOUseunJnBQEuYhAtvkncV6qFb70z9
	t9B5bWSVUgVBkAi6ICdj6EsgWhPxjtWsNB56xS9516Db3//AdFiTzcIZOrPfk/Nbub9q
	bt1Q==
X-Received: by 10.15.64.1 with SMTP id n1mr13909606eex.15.1380319572814;
	Fri, 27 Sep 2013 15:06:12 -0700 (PDT)
Received: from mizar.localdomain ([87.13.50.106])
	by mx.google.com with ESMTPSA id
	x47sm20616818eea.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 27 Sep 2013 15:06:12 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 28 Sep 2013 00:05:58 +0200
Message-Id: <1380319559-12074-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: replace empty tasks with explicit [noexec]=1
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
X-List-Received-Date: Fri, 27 Sep 2013 22:06:13 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.10.bb       | 64 +++++-----------------
 1 file changed, 15 insertions(+), 49 deletions(-)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
index 887921e..20a9791 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bb
@@ -8,52 +8,18 @@ KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${PR}-$
 KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
 
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
-INITRAMFS_TASK = "initramfs-kexecboot-klibc-image:do_rootfs"
-
-
-do_populate_sysroot() {
-    :
-}
-
-do_install() {
-    :
-}
-
-do_package() {
-}
-
-do_package_deb() {
-    :
-}
-
-do_package_ipk() {
-    :
-}
-
-do_package_rpm() {
-    :
-}
-
-do_package_tar() {
-    :
-}
-
-do_package_write_deb() {
-    :
-}
-
-do_package_write_ipk() {
-    :
-}
-
-do_package_write_rpm() {
-    :
-}
-
-do_package_write_tar() {
-    :
-}
-
-do_packagedata() {
-    :
-}
+INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
+
+# disable unneeded tasks
+do_install[noexec] = "1"
+do_package[noexec] = "1"
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
1.8.1.5


