Return-Path: <>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id E0AB86FD56
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 22:56:28 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id x12so1120040wgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 15:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ht5+87Ycvekgh4TehmYBYBivPVVIKy+8GaQF7zG2/5U=;
	b=BnUh/Rne7+FIO1TzOS/zM9vULF6KQ/3de8joQTCS9/KLUJy+goQ2gSA8tE58MR6G8m
	Z8A9FgXZf+cuQnfqloFSvH/0WCCJNgCT7N4l2IGIvwq5tw0+Z7FkXza6cqpyUNHdac5B
	ws2+wsvdHi0kkOFE0Yb2Ooy+3V2rFB0l9JNX+kEspLVx9LVX2OTRRjkAIVAFgeR+tdXA
	0XzY7Lmph3SUu5cp7VSiqLuUb5gu06R9ruhEF9qC2lXGSLjLEARBZBtcSyrSR9wdMg4T
	bkgfq3FVl3wV+Scu84YLQy9BJ5WqeXM4lRFrZLAsH5J/ZMsE9fcoHkEgFpbCViL3Op95
	tbpA==
X-Received: by 10.194.22.100 with SMTP id c4mr15291671wjf.89.1401404189103;
	Thu, 29 May 2014 15:56:29 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host160-222-dynamic.7-79-r.retail.telecomitalia.it. [79.7.222.160])
	by mx.google.com with ESMTPSA id dk10sm645930wib.1.2014.05.29.15.56.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 May 2014 15:56:28 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
X-Google-Original-From: Andrea Adami <andrea.adami@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 May 2014 00:56:08 +0200
Message-Id: <1401404169-5953-2-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401404169-5953-1-git-send-email-andrea.adami@gmail.com>
References: <1401404169-5953-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 2/3] linux-yocto_3.14: collie: remove detection hack
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
X-List-Received-Date: Thu, 29 May 2014 22:56:29 -0000

From: Andrea Adami <andrea.adami@gmail.com>

The collie used for development has unfortunately an hw flaw
and the CFI table is missing on one NOR chip.

Further testings on other models are giving normal readings.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../collie/collie-match-cfi-qry.patch              | 47 ----------------------
 recipes-kernel/linux/linux-yocto_3.14.bbappend     |  1 -
 2 files changed, 48 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.14/collie/collie-match-cfi-qry.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.14/collie/collie-match-cfi-qry.patch b/recipes-kernel/linux/linux-yocto-3.14/collie/collie-match-cfi-qry.patch
deleted file mode 100644
index a315d93..0000000
--- a/recipes-kernel/linux/linux-yocto-3.14/collie/collie-match-cfi-qry.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 66ec11df6561d5ba7cdf41977af828a53ba6b99f Mon Sep 17 00:00:00 2001
-From: Andrea Adami <andrea.adami@gmail.com>
-Date: Sat, 1 Feb 2014 13:17:24 +0100
-Subject: [PATCH] mtd: cfi_util.c: force CFI detection of 2x LH28F640BF
-
-Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
----
- drivers/mtd/chips/cfi_util.c | 16 ++++++++++++++++
- 1 file changed, 16 insertions(+)
-
-diff --git a/drivers/mtd/chips/cfi_util.c b/drivers/mtd/chips/cfi_util.c
-index f992418..2c7a13d 100644
---- a/drivers/mtd/chips/cfi_util.c
-+++ b/drivers/mtd/chips/cfi_util.c
-@@ -29,6 +29,7 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
- 	int osf = cfi->interleave * cfi->device_type;	/* scale factor */
- 	map_word val[3];
- 	map_word qry[3];
-+	unsigned long mask = (1 << (cfi->device_type * 8)) - 1;
- 
- 	qry[0] = cfi_build_cmd('Q', map, cfi);
- 	qry[1] = cfi_build_cmd('R', map, cfi);
-@@ -38,6 +39,21 @@ int __xipram cfi_qry_present(struct map_info *map, __u32 base,
- 	val[1] = map_read(map, base + osf*0x11);
- 	val[2] = map_read(map, base + osf*0x12);
- 
-+	/* Apparently only one of the 2 interleaved LH28F640BF 16 bit chips on
-+	 * a 32 bit wide bus is answering to the CFI Query.
-+	 * Using the expected map bankwidth=4 and chip interleave=2 we get wrong
-+	 * readings like 0xffff0051 instead of 0x00510051 etc.
-+	 * We take the valid bytes and recreate the expected answer as workaround.
-+	 */
-+	if (((val[0].x[0] >> (cfi->device_type * 8)) == mask) &&
-+	    ((val[1].x[0] >> (cfi->device_type * 8)) == mask) &&
-+	    ((val[2].x[0] >> (cfi->device_type * 8)) == mask))
-+	{
-+	val[0].x[0] = (val[0].x[0] & mask) + ((val[0].x[0] & mask) << (cfi->device_type * 8));
-+	val[1].x[0] = (val[1].x[0] & mask) + ((val[1].x[0] & mask) << (cfi->device_type * 8));
-+	val[2].x[0] = (val[2].x[0] & mask) + ((val[2].x[0] & mask) << (cfi->device_type * 8));
-+	}
-+
- 	if (!map_word_equal(map, qry[0], val[0]))
- 		return 0;
- 
--- 
-1.8.1.5
-
diff --git a/recipes-kernel/linux/linux-yocto_3.14.bbappend b/recipes-kernel/linux/linux-yocto_3.14.bbappend
index 9591f1a..79fff8d 100644
--- a/recipes-kernel/linux/linux-yocto_3.14.bbappend
+++ b/recipes-kernel/linux/linux-yocto_3.14.bbappend
@@ -55,7 +55,6 @@ SRC_URI_append_collie = " \
            \
            file://collie-cfi-probe-again.patch \
            file://collie-mtd-resize.patch \
-           file://collie-match-cfi-qry.patch \
            file://collie-LH28F640BF.patch \
            file://collie-add-bootblock.patch \
            \
-- 
1.9.1


