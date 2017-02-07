Return-Path: <andrea.adami@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id 10F8C71A3E
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Feb 2017 23:56:55 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id i10so6948715wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Feb 2017 15:56:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=q4mtUeLrqIkDCjEIG+zvx9xPQZ3aKji8sHh8eZslPHM=;
	b=M0pwCO/BH7SvS10eVnezZ087jgpfVVZ60xJyS8vrlroXqb9b550LIob6xo6jkOV4DI
	HZOZKamykEi4w3p2ltu/hT6Tfm0BNQLSed93aTqy96xgz+R6KOO5sLVA20lszXQdUIzg
	8ULDHvx2i9RFNIMzIGoFgqd75q+xK2r0CRf/g8Z2DUkYkNAQb9pY5JrCD/Br4ElbAadM
	sQgjdg4mYTpPz2TegWyZ55+fSX4KsQ0cy9Bpw69DZi6R5tim+SKyD0PYCX+wmkaCG9dz
	XSjmSlmIC38Q8fqmNM9lvBWO+V1y5WT4l4u4wYJ8o3j72q/kiFrzvk8sMf0fNC1TwFWM
	iIQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=q4mtUeLrqIkDCjEIG+zvx9xPQZ3aKji8sHh8eZslPHM=;
	b=f09PwW6OCIWVwpOIXIglVNSllv504YDfKFIqlV57y7GKpMazUamXY2lEXaEoJLbepK
	BDbnOMzRvIP2O1gBy71uOMDTJs1k1eERfuOAAxNSUkoBrFfvLGLWUJYtABgHPyPbtkF6
	3YtHMjwBpD0vg53oZPZWsEtJsPDYWajZQB5QCT7QM5RlYz5GYBRBYO29us/3gM3sLq/A
	ylQTLqwJArfBrud11wAASQzXVOhwmeNw9qOzZvyP80s9+Hch0DFJSsd1ZrOdRdenB4ph
	V0/4MQeFDjoHH+Hx1cKQC0QoI+wqXYHEmcCzYF85pAKgaEN5jQxqeXYBKAHOqEkXxuuh
	8/Yg==
X-Gm-Message-State: AIkVDXKBZo/IuZEdJJ8lPetG8ExJlyIcbqgUy9vF3tsW0NudskXMMDKHa7yjUWMQGZGeeQ==
X-Received: by 10.223.146.34 with SMTP id 31mr15941307wrj.201.1486511815707;
	Tue, 07 Feb 2017 15:56:55 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host13-229-dynamic.20-79-r.retail.telecomitalia.it. [79.20.229.13])
	by smtp.gmail.com with ESMTPSA id e74sm285326wmd.2.2017.02.07.15.56.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Feb 2017 15:56:54 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  8 Feb 2017 00:56:52 +0100
Message-Id: <1486511812-32217-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: remove obsoleted recipe
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
X-List-Received-Date: Tue, 07 Feb 2017 23:56:56 -0000

With the changes about the kernel build directories it is now hard to build
two different flavors together witout races.

This recipe was meant as example back then when kexecboot was introduced.
Nowadays the only users are the devices in meta-handheld and they use a more
modern and maintained linux-kexecboot kernel.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../revert-check-console.patch                     | 47 ----------------------
 .../linux/linux-yocto-tiny-kexecboot_4.4.bb        | 29 -------------
 2 files changed, 76 deletions(-)
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch
 delete mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch
deleted file mode 100644
index 5e5e8d9..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From a74e0bf51adcc867b73fc44050eb9bde985c9cba Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 28 Feb 2016 01:09:19 +0100
-Subject: [PATCH] main.c: revert check on console device
-
-Fix kernel panic because of the missing /dev/console.
-
-Revert Yocto-specific : "check console device file on fs when booting".
-
-The initramfs used in this kernel needs to be of the smallest possible
-size so we save a few kb by deploying an empty /dev which is populated
-after boot by the init (kexecboot checks and recreates the devices
-with or without devtmpfs).
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- init/main.c | 7 -------
- 1 file changed, 7 deletions(-)
-
-diff --git a/init/main.c b/init/main.c
-index d191d2a..9e64d70 100644
---- a/init/main.c
-+++ b/init/main.c
-@@ -976,7 +976,6 @@ static int __ref kernel_init(void *unused)
- 
- static noinline void __init kernel_init_freeable(void)
- {
--	struct stat console_stat;
- 	/*
- 	 * Wait until kthreadd is all set-up.
- 	 */
-@@ -1008,12 +1007,6 @@ static noinline void __init kernel_init_freeable(void)
- 
- 	do_basic_setup();
- 
--	/* Use /dev/console to infer if the rootfs is setup properly */
--	if (sys_newlstat((char __user *) "/dev/console", (struct stat __user *) &console_stat)
--			|| !S_ISCHR(console_stat.st_mode)) {
--		panic("/dev/console is missing or not a character device!\nPlease ensure your rootfs is properly configured\n");
--	}
--
- 	/* Open the /dev/console on the rootfs, this should never fail */
- 	if (sys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
- 		pr_err("Warning: unable to open an initial console.\n");
--- 
-1.9.1
-
diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
deleted file mode 100644
index 66e0e53..0000000
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require recipes-kernel/linux/linux-yocto-tiny_${PV}.bb
-SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
-
-SRC_URI += "file://revert-check-console.patch"
-
-PACKAGES = ""
-PROVIDES = ""
-
-KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${PV}-${MACHINE}"
-KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-yocto-tiny-kexecboot-${MACHINE}"
-
-INITRAMFS_IMAGE = "initramfs-kexecboot-klibc-image"
-INITRAMFS_TASK = "${INITRAMFS_IMAGE}:do_image_complete"
-
-# disable unneeded tasks
-do_shared_workdir[noexec] = "1"
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
-- 
2.7.4


