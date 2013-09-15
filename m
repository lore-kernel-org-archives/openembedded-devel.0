Return-Path: <andrea.adami@gmail.com>
Received: from mail-ee0-f42.google.com (mail-ee0-f42.google.com [74.125.83.42])
	by mail.openembedded.org (Postfix) with ESMTP id 088576C753
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 16:15:40 +0000 (UTC)
Received: by mail-ee0-f42.google.com with SMTP id b45so1545561eek.29
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Sep 2013 09:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=mB9m7h4Sr5kFap9pVN7/RznCk2JhUTMfzRkzVF6SWqo=;
	b=Erpm0JQRJgkq9KTcr6GwHlhLRVwUbhmGrYRWDHdEq+VNCtU0GIdA1D8sbcgbXaNjz7
	+iP+1DN4sMtvQl0lKgCJcrumOf4SgjlCl9jL5K5rjWaFEAFJUPz8QohJjywEQZPZOsx3
	p/hpnA1pvvG/oDbSjaFJyo1oTa8Ygpzh8IpitMAOI2FhRtQVQVI/SP4Qu+HG5xXihN+w
	8yN8v5WkZevqaEF4By8yD5nD80ZBYx9x+y73LBCeXbAI4vB94NH7tGhwlbP1rHBc/2sI
	oIcOa4cc23WNMW5Kv/zqgeisoGLYBCMfeE1zGSAq8Jyboj/xSPvbW1TIKK90GWsUs7lU
	AC7g==
X-Received: by 10.14.199.3 with SMTP id w3mr36078925een.33.1379261742278;
	Sun, 15 Sep 2013 09:15:42 -0700 (PDT)
Received: from mizar.localdomain
	(host50-7-dynamic.20-79-r.retail.telecomitalia.it. [79.20.7.50])
	by mx.google.com with ESMTPSA id
	r48sm34004501eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 15 Sep 2013 09:15:41 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 15 Sep 2013 18:15:15 +0200
Message-Id: <1379261716-7617-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
In-Reply-To: <1379261716-7617-1-git-send-email-andrea.adami@gmail.com>
References: <1379261716-7617-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-initramfs][PATCH 2/3] linux-yocto-tiny-kexecboot: repair after changes in kernel.bbclass
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
X-List-Received-Date: Sun, 15 Sep 2013 16:15:41 -0000

Add INITRAMFS_TASK to build the cpio on first run and exclude
the packaging tasks to avoid the expected errors about modules_split
and packaging. The recipe doesn't create any package.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
index 78858a3..686cc3d 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.8.bb
@@ -8,6 +8,8 @@ KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${PR}-$
 KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
 
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
+INITRAMFS_TASK = "initramfs-kexecboot-klibc-image:do_rootfs"
+
 
 do_populate_sysroot() {
     :
@@ -16,3 +18,9 @@ do_populate_sysroot() {
 do_install() {
     :
 }
+
+do_package() {
+}
+
+do_package_ipk() {
+}
-- 
1.8.1.5


