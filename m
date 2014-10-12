Return-Path: <andrea.adami@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 9B5E87169F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 22:03:57 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id hi2so5999911wib.14
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 15:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=6C2NoNqmesUstw2KOC4MjXv1sjq0hmOJQKSnVKtUKVo=;
	b=zl0iV1GgOqVgZNSUCyf8Bz7ULXZPeqKp24WnIaj7LOnLApPx3LfZPbBAG2bfckmS25
	vTjlFSqyGnOgZ6RH8gtc9itit6vjqImHVafiJaT5i7+p/V0JBxxLQINnuUiVQLv18d78
	SBG7PvPwXMiE1LFqbLOG99Ll8o67tP7/bRtSsWfRide1h/4G+wFQrbtxAQmBifaXID46
	iYAs61w8rlX0y0mwR1DW+N01klnxcE54Dk2AbSr2KjHI2LbMjl9a2eGyBMV9bhNKZdjw
	YoCOsWvVoSsZ5eGfLpmCfEknTc/+hhLpDwZTNyUSTP0lZ0whgcmw8fR0xuol0nc8Uweq
	DbcA==
X-Received: by 10.194.121.33 with SMTP id lh1mr8531wjb.78.1413151437837;
	Sun, 12 Oct 2014 15:03:57 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host177-255-dynamic.11-79-r.retail.telecomitalia.it.
	[79.11.255.177])
	by mx.google.com with ESMTPSA id u7sm10161700wif.7.2014.10.12.15.03.56
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Oct 2014 15:03:57 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Oct 2014 00:03:46 +0200
Message-Id: <1413151426-22066-1-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [meta-handheld][PATCH] linux-yocto(-tiny-kexecboot): collie: fixup for mtd resume after pm suspend
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
X-List-Received-Date: Sun, 12 Oct 2014 22:04:06 -0000

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.17/collie/mtd-resume.patch | 34 ++++++++++++++++++++++
 .../linux/linux-yocto-tiny-kexecboot_3.17.bbappend |  1 +
 recipes-kernel/linux/linux-yocto_3.17.bbappend     |  1 +
 3 files changed, 36 insertions(+)
 create mode 100644 recipes-kernel/linux/linux-yocto-3.17/collie/mtd-resume.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.17/collie/mtd-resume.patch b/recipes-kernel/linux/linux-yocto-3.17/collie/mtd-resume.patch
new file mode 100644
index 0000000..3cee9b3
--- /dev/null
+++ b/recipes-kernel/linux/linux-yocto-3.17/collie/mtd-resume.patch
@@ -0,0 +1,34 @@
+From 6d34f776e8dba9cba5520db7d27a31102238f66e Mon Sep 17 00:00:00 2001
+From: Andrea Adami <andrea.adami@gmail.com>
+Date: Sun, 12 Oct 2014 12:31:36 +0200
+Subject: [PATCH 1130/1130] mtd: cfi_cmdset_0001.c: fix resume for LH28F640BF
+ chips
+
+After '#echo mem > /sys/power/state' the device can not be resumed
+because apparently the Partition Configuration Register has been reset
+to default. This should only happen after cold/boot or hard reset but
+the behavior is confirmed on 2 different end-user devices.
+
+Tested on zaurus collie with kernel 3.17-rc7
+
+Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
+---
+ drivers/mtd/chips/cfi_cmdset_0001.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/drivers/mtd/chips/cfi_cmdset_0001.c b/drivers/mtd/chips/cfi_cmdset_0001.c
+index a7543ba..59e2355 100644
+--- a/drivers/mtd/chips/cfi_cmdset_0001.c
++++ b/drivers/mtd/chips/cfi_cmdset_0001.c
+@@ -2590,6 +2590,8 @@ static void cfi_intelext_resume(struct mtd_info *mtd)
+ 
+ 		/* Go to known state. Chip may have been power cycled */
+ 		if (chip->state == FL_PM_SUSPENDED) {
++			/* Refresh LH28F640BF Partition Configuration Register */
++			fixup_LH28F640BF(mtd);
+ 			map_write(map, CMD(0xFF), cfi->chips[i].start);
+ 			chip->oldstate = chip->state = FL_READY;
+ 			wake_up(&chip->wq);
+-- 
+1.9.1
+
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend
index 11d7f11..909d66e 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.17.bbappend
@@ -54,6 +54,7 @@ SRC_URI_append_collie = " \
            file://locomolcd-suspend-resume.patch \
            \
            file://collie-use-gpio-charger.patch \
+           file://mtd-resume.patch \
            \
            "
 
diff --git a/recipes-kernel/linux/linux-yocto_3.17.bbappend b/recipes-kernel/linux/linux-yocto_3.17.bbappend
index 116c7ce..992bc85 100644
--- a/recipes-kernel/linux/linux-yocto_3.17.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.17.bbappend
@@ -51,6 +51,7 @@ SRC_URI_append_collie = " \
            file://locomolcd-suspend-resume.patch \
            \
            file://collie-use-gpio-charger.patch \
+           file://mtd-resume.patch \
            \
            "
 
-- 
1.9.1


