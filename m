Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C5CC433F5
	for <webhook@archiver.kernel.org>; Sun, 15 May 2022 13:50:00 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web12.16978.1652622590826246546
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PqRxnTG2;
 spf=pass (domain: gmail.com, ip: 209.85.210.181,
 mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id bo5so11774012pfb.4
        for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 May 2022 06:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=o19hEw1BJO51eGYL9sVBdTO7JJz40Ne+hqzvh9D9UL0=;
        b=PqRxnTG2nT7GGenhFc3Ids+ppiYqhdeZtqBJKaUMZgIAZmFogZePWXsXiGmkFiw1x2
         RkLCSnJAWmUQxTuiuBiv8D9XDC0n/OS1BjniN+42HfJsc9mxLEMDjrLXW60QiZYJhpdr
         FpVKyPNC6bmc8K7n5+quSrDxWGAIgDJ8Sdgyqfhn8hj3ArUHPbPifSDwtdLJH5Rbv8xa
         8tvXZCLdZLmorlmDJnboWtyQYCCumicWzWSKXi2vEg/zJtYsSyC8CujJPoPkRxP9tw6a
         1yUwFa/c7ER9r9SNEwH/4uP7PKn4kkou3B7f6YEWBXrEcc6YmX1vC3YPc1pSsn+Rctzf
         TvdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o19hEw1BJO51eGYL9sVBdTO7JJz40Ne+hqzvh9D9UL0=;
        b=LMAUXDlnzEneSaOcD9OdxI4ssLPy+KBamhdesT7QM5feBRucuq9GKK1fJASYLgSHj4
         PbGgL8GBBqTTl44+0Fuxhh/DmI5tKEZkuKaOUT75TVA/Z0yuWwNXPtupb4DxqdjILa15
         Egzsx9eoW+suaYkRNcqjxUpk6FC1usk4f8stYWFpQXyTFv4SH1P9z49oW674NgQW0S//
         svwhD11Z5EHJrthY0b/3xv2VkBIX7HBQ7/6XLHeUNUI2zUDQWKr+O5y1Qt8Aawn1b1jN
         TxgApai0ETfi+pCH4R07AQMBVnngVdJTqys2Iq/pLQ2OIJ3yK3kRTy7i0+uydZg6K13E
         1dlg==
X-Gm-Message-State: AOAM531RMDo4BcLODaEVTV4Io492WaZo1ko2RE6dWvJRwTRjkgVmzZMs
	DRdbJmbVX3jAf3sb63VCafYfh25JpteU4w==
X-Google-Smtp-Source: 
 ABdhPJyyIliaJKFOjEItV+COr+aqcxXFqRq0+WCiJapaQIbwRStXjLDntv3OjIZUpJTehj2sn6bdmg==
X-Received: by 2002:a05:6a00:1a86:b0:50f:f4fd:c9a7 with SMTP id
 e6-20020a056a001a8600b0050ff4fdc9a7mr13081336pfv.46.1652622589875;
        Sun, 15 May 2022 06:49:49 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:48be:3d3d:c26:7949])
        by smtp.gmail.com with ESMTPSA id
 z22-20020a63e556000000b003c644b2180asm4961650pgj.77.2022.05.15.06.49.48
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 May 2022 06:49:49 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 18/22] devmem2: reinstate previous patches,
 removed by mistake
Date: Sun, 15 May 2022 06:49:18 -0700
Message-Id: 
 <43cc4a2bfe1d63427f62a2af8e7c8f08ffc46785.1652622481.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1652622481.git.akuster808@gmail.com>
References: <cover.1652622481.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 May 2022 13:50:00 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97115

From: Denys Dmytriyenko <denis@denix.org>

This reverts commit 5e8f4720aaa3da7350ead06959cae0492133cd61.

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit e192bd13ff2f39cc9762ca73d65a1c5537a70335)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-support/devmem2/devmem2.bb    |  3 +-
 ...word-is-32-bit-and-add-support-for-6.patch | 70 ++++++++++++++
 .../devmem2/devmem2/devmem2-fixups-2.patch    | 91 +++++++++++++++++++
 3 files changed, 163 insertions(+), 1 deletion(-)
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
 create mode 100644 meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch

diff --git a/meta-oe/recipes-support/devmem2/devmem2.bb b/meta-oe/recipes-support/devmem2/devmem2.bb
index 92c05fe065..c6b8df5e47 100644
--- a/meta-oe/recipes-support/devmem2/devmem2.bb
+++ b/meta-oe/recipes-support/devmem2/devmem2.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://devmem2.c;endline=38;md5=a9eb9f3890384519f435aedf9862
 PR = "r7"
 
 SRC_URI = "http://www.free-electrons.com/pub/mirror/devmem2.c;downloadfilename=devmem2-new.c \
-          " 
+           file://devmem2-fixups-2.patch;apply=yes;striplevel=0 \
+           file://0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch"
 
 S = "${WORKDIR}"
 
diff --git a/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
new file mode 100644
index 0000000000..2a57f29891
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2/0001-devmem.c-ensure-word-is-32-bit-and-add-support-for-6.patch
@@ -0,0 +1,70 @@
+From 1360a907879dd24041797a3b709d49aeac2ab444 Mon Sep 17 00:00:00 2001
+From: Denys Dmytriyenko <denys@ti.com>
+Date: Tue, 29 May 2018 16:55:42 -0400
+Subject: [PATCH] devmem.c: ensure word is 32-bit and add support for 64-bit
+ long
+
+Signed-off-by: Denys Dmytriyenko <denys@ti.com>
+---
+ devmem2.c | 23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/devmem2.c b/devmem2.c
+index 5845381..68131b2 100644
+--- a/devmem2.c
++++ b/devmem2.c
+@@ -39,6 +39,7 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
++#include <stdint.h>
+ #include <unistd.h>
+ #include <string.h>
+ #include <errno.h>
+@@ -69,7 +70,7 @@ int main(int argc, char **argv) {
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+ 			"\taddress : memory address to act upon\n"
+-			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord\n"
++			"\ttype    : access operation type : [b]yte, [h]alfword, [w]ord, [l]ong\n"
+ 			"\tdata    : data to be written\n\n",
+ 			argv[0]);
+ 		exit(1);
+@@ -103,9 +104,14 @@ int main(int argc, char **argv) {
+ 			read_result = *((unsigned short *) virt_addr);
+ 			break;
+ 		case 'w':
+-			data_size = sizeof(unsigned long);
++			data_size = sizeof(uint32_t);
+ 			virt_addr = fixup_addr(virt_addr, data_size);
+-			read_result = *((unsigned long *) virt_addr);
++			read_result = *((uint32_t *) virt_addr);
++			break;
++		case 'l':
++			data_size = sizeof(uint64_t);
++			virt_addr = fixup_addr(virt_addr, data_size);
++			read_result = *((uint64_t *) virt_addr);
+ 			break;
+ 		default:
+ 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
+@@ -129,9 +135,14 @@ int main(int argc, char **argv) {
+ 				read_result = *((unsigned short *) virt_addr);
+ 				break;
+ 			case 'w':
+-				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
+-				*((unsigned long *) virt_addr) = write_val;
+-				read_result = *((unsigned long *) virt_addr);
++				virt_addr = fixup_addr(virt_addr, sizeof(uint32_t));
++				*((uint32_t *) virt_addr) = write_val;
++				read_result = *((uint32_t *) virt_addr);
++				break;
++			case 'l':
++				virt_addr = fixup_addr(virt_addr, sizeof(uint64_t));
++				*((uint64_t *) virt_addr) = write_val;
++				read_result = *((uint64_t *) virt_addr);
+ 				break;
+ 		}
+ 		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
new file mode 100644
index 0000000000..4517797fc7
--- /dev/null
+++ b/meta-oe/recipes-support/devmem2/devmem2/devmem2-fixups-2.patch
@@ -0,0 +1,91 @@
+--- devmem2.c	2004-08-05 01:55:25.000000000 +0200
++++ devmem2_modif.c	2011-01-13 15:48:37.798799784 +0100
+@@ -45,12 +45,16 @@
+ #define MAP_SIZE 4096UL
+ #define MAP_MASK (MAP_SIZE - 1)
+ 
++static inline void *fixup_addr(void *addr, size_t size);
++
+ int main(int argc, char **argv) {
+     int fd;
+     void *map_base, *virt_addr; 
+-	unsigned long read_result, writeval;
++	unsigned long read_result, write_val;
+ 	off_t target;
+ 	int access_type = 'w';
++	char fmt_str[128];
++	size_t data_size;
+ 	
+ 	if(argc < 2) {
+ 		fprintf(stderr, "\nUsage:\t%s { address } [ type [ data ] ]\n"
+@@ -79,38 +83,51 @@
+     virt_addr = map_base + (target & MAP_MASK);
+     switch(access_type) {
+ 		case 'b':
++			data_size = sizeof(unsigned char);
++			virt_addr = fixup_addr(virt_addr, data_size);
+ 			read_result = *((unsigned char *) virt_addr);
+ 			break;
+ 		case 'h':
++			data_size = sizeof(unsigned short);
++			virt_addr = fixup_addr(virt_addr, data_size);
+ 			read_result = *((unsigned short *) virt_addr);
+ 			break;
+ 		case 'w':
++			data_size = sizeof(unsigned long);
++			virt_addr = fixup_addr(virt_addr, data_size);
+ 			read_result = *((unsigned long *) virt_addr);
+ 			break;
+ 		default:
+ 			fprintf(stderr, "Illegal data type '%c'.\n", access_type);
+ 			exit(2);
+ 	}
+-    printf("Value at address 0x%X (%p): 0x%X\n", target, virt_addr, read_result); 
++	sprintf(fmt_str, "Read at address  0x%%08lX (%%p): 0x%%0%dlX\n", 2*data_size);
++    printf(fmt_str, (unsigned long)target, virt_addr, read_result);
+     fflush(stdout);
+ 
+ 	if(argc > 3) {
+-		writeval = strtoul(argv[3], 0, 0);
++		write_val = strtoul(argv[3], 0, 0);
+ 		switch(access_type) {
+ 			case 'b':
+-				*((unsigned char *) virt_addr) = writeval;
++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned char));
++				*((unsigned char *) virt_addr) = write_val;
+ 				read_result = *((unsigned char *) virt_addr);
+ 				break;
+ 			case 'h':
+-				*((unsigned short *) virt_addr) = writeval;
++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned short));
++				*((unsigned short *) virt_addr) = write_val;
+ 				read_result = *((unsigned short *) virt_addr);
+ 				break;
+ 			case 'w':
+-				*((unsigned long *) virt_addr) = writeval;
++				virt_addr = fixup_addr(virt_addr, sizeof(unsigned long));
++				*((unsigned long *) virt_addr) = write_val;
+ 				read_result = *((unsigned long *) virt_addr);
+ 				break;
+ 		}
+-		printf("Written 0x%X; readback 0x%X\n", writeval, read_result); 
++		sprintf(fmt_str, "Write at address 0x%%08lX (%%p): 0x%%0%dlX, "
++			"readback 0x%%0%dlX\n",	2*data_size, 2*data_size);
++		printf(fmt_str, (unsigned long)target, virt_addr,
++			write_val, read_result);
+ 		fflush(stdout);
+ 	}
+ 	
+@@ -119,3 +136,12 @@
+     return 0;
+ }
+ 
++static inline void *fixup_addr(void *addr, size_t size)
++{
++#ifdef FORCE_STRICT_ALIGNMENT
++	unsigned long aligned_addr = (unsigned long)addr;
++	aligned_addr &= ~(size - 1);
++	addr = (void *)aligned_addr;
++#endif
++	return addr;
++}
-- 
2.25.1


