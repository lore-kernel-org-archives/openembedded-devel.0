Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5F177218
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 22:42:05 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id l68so15076159wml.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 14:42:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/u5p16+fFXxYfOCCtwlFQ/1HR/g5uYjXRa6tMzwhBxc=;
	b=uyZb121Ar+ujyA6YkGpDIIq1C+/YcowZTWOa4aNr9EXf1i6X8B1+5+y21aijtOO+sb
	yZUz4c1EvFeIEullVRlIgaZCVXzuKdVEcXR3EWxsUiGnuc0uva6M9/TmMobXAhnuaMU3
	g9dVwKV3sQeSMmTE3iAuFVytrzRBsF4e7L6BlTXXcbgch2W4NUuNeRUGjpuym8yqRsmn
	7ZsFXZ/187nwhcXY2DjmUVAx9gRz2p7y1vCr/QvCs/hs80foPRnBtTtNc6IYry4LQqTq
	Fv1HgDOtqDTCCbvaul11w6q43b5gwgCdMsvY+/uVlu517MLZlFoMI776MdkSALLWN6SM
	3Ibw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=/u5p16+fFXxYfOCCtwlFQ/1HR/g5uYjXRa6tMzwhBxc=;
	b=NN4YNd44Jben12N79IbokyuJMfNp+rhFXogVK35fAHeLbNKkrcCU9JuodMJVKgsZEg
	lzl3G9EXKCT9jdFubQyo16UsjShUJY9YHyLD93mLe7RhQRp3W3tn8HFT/6JBpqqFELHj
	fGsmpZtQxJXogNQoyFqFwamdHT1rPmFcn99PyZr6lS3WskipaPfSj5JQ2o2qmbYnUaJ4
	60eAIZ1wqOW0nd5FDV18ZmVzahYPjQ7qzJ0DBojwJKGADsRQyvQaQe+AezY4Iy5HEPG6
	GdYq1bqXvELdqzlGQar4wDtPl4/YEjtEl8Nw+HONx4lUU8EYkpzFwFRJuxJTUUWgzHnF
	7tzA==
X-Gm-Message-State: AD7BkJLbUY91OHTi5maJGfr6IKqOYwLbrpsf5H5e3CUfpy/3p/1kyiBw1L6CYMCD4VIxyQ==
X-Received: by 10.194.189.231 with SMTP id gl7mr11616070wjc.162.1456699325968; 
	Sun, 28 Feb 2016 14:42:05 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host225-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.225])
	by smtp.gmail.com with ESMTPSA id
	73sm13454589wmy.22.2016.02.28.14.42.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 14:42:05 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2016 23:41:57 +0100
Message-Id: <1456699317-9516-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: fix build error (cpio not found)
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
X-List-Received-Date: Sun, 28 Feb 2016 22:42:06 -0000

As seen in the autobuilder the script generating the initramfs fails
because the .cpio is not found.

Match changes in the oe-core classes and redefine the INITRAMFS_TASK.
See commit 59a5f59 in oe-core "classes: Fix do_rootfs references"

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
index 2904ab6..e6c6d9d 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
@@ -8,7 +8,7 @@ KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${MACHI
 KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
 
 INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
-INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_rootfs"
+INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_image_complete"
 
 # disable unneeded tasks
 do_shared_workdir[noexec] = "1"
-- 
1.9.1


