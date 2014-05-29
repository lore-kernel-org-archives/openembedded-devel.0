Return-Path: <>
Received: from mail-we0-f177.google.com (mail-we0-f177.google.com
	[74.125.82.177])
	by mail.openembedded.org (Postfix) with ESMTP id DAC6E6FD68
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 22:56:30 +0000 (UTC)
Received: by mail-we0-f177.google.com with SMTP id x48so1109672wes.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 May 2014 15:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Fp4wlEAC2FoyCLqMigjGkw7m2SF6tsxeEnzjpMIdYvg=;
	b=0UoCoSQgmWyOVXaOGOg/zd8y9IcZfJf6WIttOea4nXOWSzsodZ4Sks+XsjLEf9D9T/
	zhnkmXEXIo3a0nnP6Yq5J7Y7Jz0201TSt8LjuvPtsN5R62Y0EIAxr8rItT7NZNp0p4ih
	ZkWwcZCNZGz8u7kghDBCpg46iySpGxIR90DKT6FUKBPtfADDDnQg9tC2ndFZJyQLXcKY
	dtgImJIhSoYfvf3V14HR7EV9r3BdiSPAG+rtMIYOFabNhyFJeszazWgAc5/Nmbi0PXmy
	W6IfH+S76SUgjtP5CUGnxgySTmfqJxaYPiYuhl9MhTTVkhNV4duNVY7/uq/xghfJmZVZ
	G2zA==
X-Received: by 10.180.103.228 with SMTP id fz4mr758727wib.4.1401404190968;
	Thu, 29 May 2014 15:56:30 -0700 (PDT)
Received: from mizar.208.67.220.220
	(host160-222-dynamic.7-79-r.retail.telecomitalia.it. [79.7.222.160])
	by mx.google.com with ESMTPSA id dk10sm645930wib.1.2014.05.29.15.56.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 29 May 2014 15:56:30 -0700 (PDT)
From: Andrea Adami <andrea.adami@gmail.com>
X-Google-Original-From: Andrea Adami <andrea.adami@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 May 2014 00:56:09 +0200
Message-Id: <1401404169-5953-3-git-send-email-andrea.adami@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1401404169-5953-1-git-send-email-andrea.adami@gmail.com>
References: <1401404169-5953-1-git-send-email-andrea.adami@gmail.com>
Subject: [meta-handheld][PATCH 3/3] linux-yocto(-tiny-kexecboot)_3.10: collie: remove detection hack
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
X-List-Received-Date: Thu, 29 May 2014 22:56:31 -0000

From: Andrea Adami <andrea.adami@gmail.com>

The collie used for development has unfortunately an hw flaw
and the CFI table is missing on one NOR chip.

Further testings on other models are giving normal readings.

Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
---
 .../linux/linux-yocto-3.10/collie/collie.scc       |  1 -
 .../patches/patches-mtd/collie-match-cfi-qry.patch | 47 ----------------------
 .../linux/linux-yocto-tiny-kexecboot_3.10.bbappend |  1 -
 3 files changed, 49 deletions(-)
 delete mode 100644 recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch

diff --git a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
index 9828877..e3f9c54 100644
--- a/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
+++ b/recipes-kernel/linux/linux-yocto-3.10/collie/collie.scc
@@ -11,7 +11,6 @@ patch ../patches/patches-mtd/collie-eraseinfo.patch
 // for 3.12
 patch ../patches/patches-mtd/collie-cfi-probe-again.patch
 patch ../patches/patches-mtd/collie-mtd-resize.patch
-patch ../patches/patches-mtd/collie-match-cfi-qry.patch
 patch ../patches/patches-mtd/collie-LH28F640BF.patch
 patch ../patches/patches-sa1100/collie-irda.patch
 patch ../patches/patches-sa1100/collie-add-bootblock.patch
diff --git a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch b/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
deleted file mode 100644
index a315d93..0000000
--- a/recipes-kernel/linux/linux-yocto-3.10/patches/patches-mtd/collie-match-cfi-qry.patch
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
diff --git a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
index a6a7741..70d8a4a 100644
--- a/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
+++ b/recipes-kernel/linux/linux-yocto-tiny-kexecboot_3.10.bbappend
@@ -50,7 +50,6 @@ SRC_URI_append_collie = " \
            file://patches/patches-mtd/collie-eraseinfo.patch \
            file://patches/patches-mtd/collie-cfi-probe-again.patch \
            file://patches/patches-mtd/collie-mtd-resize.patch \
-           file://patches/patches-mtd/collie-match-cfi-qry.patch \
            file://patches/patches-mtd/collie-LH28F640BF.patch \
            file://patches/patches-sa1100/collie-irda.patch \
            file://patches/patches-sa1100/collie-add-bootblock.patch \
-- 
1.9.1


