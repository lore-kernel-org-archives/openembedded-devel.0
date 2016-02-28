Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 90FFC7720F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 22:42:34 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id p65so23841719wmp.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 28 Feb 2016 14:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IWRx8tRMwDYTH27Z6vhozGHcvfuX/oMc/g05AjtGNaE=;
	b=mMSwSwvcctYJm65GELzcvbSLBamFcxVeAn9+fwqXoQ0rbYXb7KvNN0fQgbFHQe78VS
	XLiZ3CNTGSFS7d0Xi9PBsrYm9+kKpAJQEN0atPcGesggj3anZML8in//7jDRxXR7Y/+H
	s3HApvehrKH8J/ZsxnFrhtSfP/Yb+PHw9r8Aeb40caMgVVu8F2cilbkXnxQfXCLEolKr
	MC5/1GCjEDnnF37fixFm5vBoVDOFXgGkhYDcBQPq3eUxuWscJ8cC8GxMH/XEFZCuW5Tu
	XDdWhMTEP8Pq6dsjFRlebUJcfeDfzaWaGBSDrLM7z/NunsJVeqpz7+6d5lFxfn1NUrcC
	MM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=IWRx8tRMwDYTH27Z6vhozGHcvfuX/oMc/g05AjtGNaE=;
	b=REwZkIm4XYZwy9CuqTLw5e+8RDfrYn+7C6B+uxbGXxXrloKxu68MqSLMgqPmHCa/TI
	x9EAS10Q8Wv/FHjjJrosCOVJjBmESZWgU0ecpyo+8wDgwws3oXcEA3SN61OyvVDiv4g7
	uZDbPa0pdVk//grLTxG9Ey9o/CU9y37FnAXATrPG2Y/HfpCpfYY+O4ajSuwOL4EfQ5NJ
	iRDi1+5rkO/TvxCqo/faPC+f8vD1oA56u4A0w6c/gcmm6PGk/LcqQ2xx+UhxiYvR9xav
	blEq/bnu/dkMwcgOPOMMbZLL0NOiO/x4jf5g+3RWYXZORRkelUJbPlYnFQG/l44iWPQ1
	BebQ==
X-Gm-Message-State: AD7BkJLcHQkhsyD9zsEyt80eb1Bq6ut2YJLhL125SQR48ekaDizaOBX62WOdlPsHrAO7UA==
X-Received: by 10.28.72.132 with SMTP id v126mr9019072wma.88.1456699354990;
	Sun, 28 Feb 2016 14:42:34 -0800 (PST)
Received: from ThinkPad-T520.homenet.telecomitalia.it
	(host225-252-dynamic.0-87-r.retail.telecomitalia.it. [87.0.252.225])
	by smtp.gmail.com with ESMTPSA id
	192sm13498069wmw.0.2016.02.28.14.42.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Feb 2016 14:42:34 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 28 Feb 2016 23:42:31 +0100
Message-Id: <1456699351-9561-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-initramfs][PATCH] linux-yocto-tiny-kexecboot: revert Yocto specific console check
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
X-List-Received-Date: Sun, 28 Feb 2016 22:42:35 -0000

Revert Yocto-specific : "check console device file on fs when booting".
Fix kernel panic at boot because of the missing /dev/console.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../revert-check-console.patch                     | 47 ++++++++++++++++++++++
 .../linux/linux-yocto-tiny-kexecboot_4.4.bb        |  2 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch

diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch
new file mode 100644
index 0000000..5e5e8d9
--- /dev/null
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot/revert-check-console.patch
@@ -0,0 +1,47 @@
+From a74e0bf51adcc867b73fc44050eb9bde985c9cba Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 28 Feb 2016 01:09:19 +0100
+Subject: [PATCH] main.c: revert check on console device
+
+Fix kernel panic because of the missing /dev/console.
+
+Revert Yocto-specific : "check console device file on fs when booting".
+
+The initramfs used in this kernel needs to be of the smallest possible
+size so we save a few kb by deploying an empty /dev which is populated
+after boot by the init (kexecboot checks and recreates the devices
+with or without devtmpfs).
+
+Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
+---
+ init/main.c | 7 -------
+ 1 file changed, 7 deletions(-)
+
+diff --git a/init/main.c b/init/main.c
+index d191d2a..9e64d70 100644
+--- a/init/main.c
++++ b/init/main.c
+@@ -976,7 +976,6 @@ static int __ref kernel_init(void *unused)
+ 
+ static noinline void __init kernel_init_freeable(void)
+ {
+-	struct stat console_stat;
+ 	/*
+ 	 * Wait until kthreadd is all set-up.
+ 	 */
+@@ -1008,12 +1007,6 @@ static noinline void __init kernel_init_freeable(void)
+ 
+ 	do_basic_setup();
+ 
+-	/* Use /dev/console to infer if the rootfs is setup properly */
+-	if (sys_newlstat((char __user *) "/dev/console", (struct stat __user *) &console_stat)
+-			|| !S_ISCHR(console_stat.st_mode)) {
+-		panic("/dev/console is missing or not a character device!\nPlease ensure your rootfs is properly configured\n");
+-	}
+-
+ 	/* Open the /dev/console on the rootfs, this should never fail */
+ 	if (sys_open((const char __user *) "/dev/console", O_RDWR, 0) < 0)
+ 		pr_err("Warning: unable to open an initial console.\n");
+-- 
+1.9.1
+
diff --git a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
index e6c6d9d..e3c7144 100644
--- a/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
+++ b/meta-initramfs/recipes-kernel/linux/linux-yocto-tiny-kexecboot_4.4.bb
@@ -1,6 +1,8 @@
 require recipes-kernel/linux/linux-yocto-tiny_${PV}.bb
 SUMMARY = "Yocto tiny kernel embedding a minimalistic kexecboot initramfs"
 
+SRC_URI += "file://revert-check-on-console-device.patch"
+
 PACKAGES = ""
 PROVIDES = ""
 
-- 
1.9.1


