Return-Path: <andrea.adami@gmail.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id BD14472027
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Jan 2015 22:42:01 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id w61so10350741wes.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 09 Jan 2015 14:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=s2shHNMkijo+NiBN1NMb33EkK6PYQP+xghwSIbx7rqc=;
	b=fXZSGv8kV8w9CGpWRK6piQ5dHxiT9LfbgaVks+pj743PoHhgeJmHBYeCWTjQTCvPn7
	LmQTYu28hPpKfyS1ZG8nQQqIqhv3YnZRP/5rUzyU1roeVcBAjpcYiWk31zRe0gIcrGwI
	GJi7yunaiInW5MG2vQvgiCuj/82pJkS4uPB8Hzwblr6QKwjzlvz4WSoWTg3TQYivG3U5
	HPNoWrDzPWj5fDYYeWyZLanKEl57kc3qtebIc2asi8l/a6L9kbBaRfHqoH9BxakkuFdU
	clSIsF0KVG/2WhPA/4u8fOtJvfu29EkL1gg+UjebA5oM+Qmrn86vLyvtvUmiNY8h/jep
	XAlQ==
X-Received: by 10.180.211.195 with SMTP id ne3mr1406719wic.52.1420843320685;
	Fri, 09 Jan 2015 14:42:00 -0800 (PST)
Received: from mizar.208.67.220.220
	(host214-185-dynamic.50-82-r.retail.telecomitalia.it.
	[82.50.185.214]) by mx.google.com with ESMTPSA id
	ez1sm11612893wjd.31.2015.01.09.14.41.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 09 Jan 2015 14:42:00 -0800 (PST)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  9 Jan 2015 23:41:50 +0100
Message-Id: <1420843310-29905-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-yocto(-tiny-kexecboot)_3.17: remove upstreamed patch for collie
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
X-List-Received-Date: Fri, 09 Jan 2015 22:42:08 -0000

Patch landed upstream in 3.17.3 (commit id
 255a8e963ea7d9d856d224a76b8a2fb99f0682fe)

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.17/collie/mtd-resume.patch | 34 ----------------------
 .../linux/linux-yocto-tiny-kexecboot_3.17.bbappend |  1 -
 recipes-kernel/linux/linux-yocto_3.17.bbappend     |  3 +-
 3 files changed, 1 insertion(+), 37 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/mtd-resume.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.17/collie/mtd-resume.patch b/recipes-kernel/linux/linux-yocto-3.17/collie/mtd-resume.patch
deleted file mode 100644
index 3cee9b3..0000000
--- a/recipes-kernel/linux/linux-yocto-3.17/collie/mtd-resume.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 6d34f776e8dba9cba5520db7d27a31102238f66e Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sun, 12 Oct 2014 12:31:36 +0200
-Subject: [PATCH 1130/1130] mtd: cfi_cmdset_0001.c: fix resume for LH28F640BF
- chips
-
-After '#echo mem > /sys/power/state' the device can not be resumed
-because apparently the Partition Configuration Register has been reset
-to default. This should only happen after cold/boot or hard reset but
-the behavior is confirmed on 2 different end-user devices.
-
-Tested on zaurus collie with kernel 3.17-rc7
-
-Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
----
- drivers/mtd/chips/cfi_cmdset_0001.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
-index a7543ba..59e2355 100644
---- a/drivers/mtd/chips/cfi_cmdset_0001.c
-+++ b/drivers/mtd/chips/cfi_cmdset_0001.c
-@@ -2590,6 +2590,8 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
- 
- 		/* Go to known state. Chip may have been power cycled */
- 		if (chip->state == FL_PM_SUSPENDED) {
-+			/* Refresh LH28F640BF Partition Configuration Register */
-+			fixup_LH28F640BF(mtd);
- 			map_write(map, CMD(0xFF), cfi->chips[i].start);
- 			chip->oldstate = chip->state = FL_READY;
- 			wake_up(&chip->wq);
--- 
-1.9.1
-
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend
index 909d66e..11d7f11 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend
@@ -54,7 +54,6 @@ SRC_URI_append_collie = " \
            file://locomolcd-suspend-resume.patch \
            \
            file://collie-use-gpio-charger.patch \
-           file://mtd-resume.patch \
            \
            "
 
diff --git a/recipes-kernel/linux/linux-yocto_3.17.bbappend b/recipes-kernel/linux/linux-yocto_3.17.bbappend
index 54747d0..eda4061 100644
--- a/recipes-kernel/linux/linux-yocto_3.17.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.17.bbappend
@@ -53,9 +53,8 @@ SRC_URI_append_collie = " \
            file://locomolcd-suspend-resume.patch \
            \
            file://collie-use-gpio-charger.patch \
-           file://mtd-resume.patch \
-           \
            "
+
 SRC_URI_append_h3600 = " \
            file://defconfig \
            file://OE-qvga-logo.patch \
-- 
1.9.1


