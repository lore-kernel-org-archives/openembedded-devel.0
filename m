Received: from mail-ea0-f182.google.com ([209.85.215.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1UZ7ba-0006Ei-2c
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 May 2013 00:40:57 +0200
Received: by mail-ea0-f182.google.com with SMTP id z16so1491968ead.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 05 May 2013 15:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=eNhAKlwm8kxhkuKOZ217RBPhc6G3KrOWTPu00u90bjQ=;
	b=L8Wycef8I3Qz/1lU45YMS127lLUP1WdbzyuhkFwkFZex7oB88bzMKq8TBJdB7FdW2L
	+60trzOzsrOPIugK8aiUqRbnSMHmCka7M0Z3xbvJkWH9xwRBpja1SnDDjsPa2+J3S8i8
	7PRaOtLzc2mtUuqg1aNZ+mWXb1g/1+nPdP9GhLC48nKJHdGsLszNKiwsQCdDZrMySnB6
	lrIP1kXZ4v+Rq+N83lbA+ERMNryAA8YS2foS6LnqCBVkIWizCJwkN3MeRRz/L2pEb9u/
	zyVN9TwvECO99/uQ9S2g5ci80Mo6Vy9yo2Hpu3+j7O3uY5iMBQaAtbWqAzXSSo6lwE9d
	fTPg==
X-Received: by 10.15.26.6 with SMTP id m6mr54656260eeu.4.1367792551854;
	Sun, 05 May 2013 15:22:31 -0700 (PDT)
Received: from mizar.localdomain
	(host87-12-dynamic.60-82-r.retail.telecomitalia.it. [82.60.12.87])
	by mx.google.com with ESMTPSA id
	x41sm20899216eey.17.2013.05.05.15.22.30 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 05 May 2013 15:22:30 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  6 May 2013 00:22:20 +0200
Message-Id: <1367792540-25605-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: do not use klibc for the initramfs on x86/x86-64
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
X-List-Received-Date: Sun, 05 May 2013 22:41:02 -0000

* The current recipe of kexec-tools fails building against klibc
* se we cannot use the klibc shrinked version of the kexecboot image.
*
* Default image will be re-enabled once kexec-tools-klibc will be fixed.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb | 4 ++++
 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb
index d4798e8..50f741c 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.2.bb
@@ -8,6 +8,10 @@ KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}
 
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
 
+# on x86/x86-64 this initramfs cannot be built with klibc currently
+INITRAMFS_IMAGE_x86 = "initramfs-kexecboot-image"
+INITRAMFS_IMAGE_x86-64 = "initramfs-kexecboot-image"
+
 do_populate_sysroot() {
     :
 }
diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
index 189f87b..edc1247 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.4.bb
@@ -8,6 +8,10 @@ KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}
 
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
 
+# on x86/x86-64 this initramfs cannot be built with klibc currently
+INITRAMFS_IMAGE_x86 = "initramfs-kexecboot-image"
+INITRAMFS_IMAGE_x86-64 = "initramfs-kexecboot-image"
+
 do_populate_sysroot() {
     :
 }
-- 
1.8.1.5



