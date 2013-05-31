Return-Path: <andrea.adami@gmail.com>
Received: from mail-ea0-f172.google.com (mail-ea0-f172.google.com
	[209.85.215.172])
	by mail.openembedded.org (Postfix) with ESMTP id 8D705619E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 21:56:02 +0000 (UTC)
Received: by mail-ea0-f172.google.com with SMTP id d10so2135475eaj.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 May 2013 14:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=zAhx02IsqWe8wAZ1x/5ypkLcFNcIWY4tv4EWgEJB6Yg=;
	b=c9Bk9u/OJMhFAk7ps9T9K8s37lRzPF6qYbaqs1E1PJi+GqDAZTJLqPRcAMTs0GFBht
	isdQnsqIFIk9RtdsLzaKa7mhlEIav6GprI3xoZcTQIjt4btqAGN0q+L0i0c+Gl/MjvwE
	Grdm6BX12/LXzRYIyTn2EayVBsrpvt6NhmGy+BRuzeRzgD0QcrZcwGOy1Kp84n/bUQnk
	l1g9yusSqUNSwnbeAPqS5T+0uRDe+ixu3F1px2Yi041dLQKmtK0HU9gfay04fvdwMU6R
	EBL/Me2vvi7RaC8vM2Icbi4Va+qByX6gv3CL+aSdoC+m36f5LiTV6myTEWfKAk2KjkEs
	jRBg==
X-Received: by 10.15.63.129 with SMTP id m1mr14857905eex.108.1370037362239;
	Fri, 31 May 2013 14:56:02 -0700 (PDT)
Received: from mizar.localdomain
	(host199-42-dynamic.183-80-r.retail.telecomitalia.it.
	[80.183.42.199])
	by mx.google.com with ESMTPSA id f1sm41488853eem.17.2013.05.31.14.56.00
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 14:56:01 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 May 2013 23:55:55 +0200
Message-Id: <1370037356-12471-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH 1/2] linux-yocto-tiny-kexecboot_3.2: remove orphan recipe
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
X-List-Received-Date: Fri, 31 May 2013 21:56:02 -0000

* this kernel recipe was requiring linux-yocto-tiny_3.2.bb
* which has been removed on 2013-05-31 with commit id
* b8d53d8f91bd1b165016ea1063868c8b15f07ce0

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-tiny-kexecboot_3.2.bb             | 17 -----------------
 1 file changed, 17 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb
deleted file mode 100644
index d4798e8..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-require recipes-kernel/linux/linux-yocto-tiny_3.2.bb
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
-- 
1.8.1.5


