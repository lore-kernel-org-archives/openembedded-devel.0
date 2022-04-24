Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 202D1C4707E
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.15569.1650789946136989965
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 01:45:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23O8jeBA027558
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 24 Apr 2022 01:45:40 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 24 Apr 2022 01:45:39 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 24 Apr 2022 01:45:39 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>, <akuster808@gmail.com>
Subject: [meta-oe][hardknott][PATCH] makedumpfile: Upgrade to 1.6.9
Date: Sun, 24 Apr 2022 16:45:38 +0800
Message-ID: <20220424084538.2940999-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96751

From: Mingli Yu <mingli.yu@windriver.com>

* Linux 5.10 introduces a new lockless ringbuffer. The new ringbuffer
  is structured completely different to the previous iterations.
  Add support for retrieving the ringbuffer from debug information
  and/or using vmcoreinfo. The new ringbuffer is detected based on
  the availability of the "prb" symbol.

* Support newer kernels as follows:

  - 5.10, 5.11, 5.12  (x86_64 SPARSEMEM)

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...1-makedumpfile-replace-hardcode-CFLAGS.patch | 17 +++++++++--------
 ...edumpfile_1.6.8.bb => makedumpfile_1.6.9.bb} |  2 +-
 2 files changed, 10 insertions(+), 9 deletions(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.6.8.bb => makedumpfile_1.6.9.bb} (97%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 270cc3562..94eac931e 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,4 +1,4 @@
-From af97e2ad643334b4c7c3d66f971ce9ebb2b596af Mon Sep 17 00:00:00 2001
+From 1053cf25be28b266ba264705e11179cf4f04aa91 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 21 Jul 2016 18:06:21 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
@@ -13,14 +13,15 @@ Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
 Upstream-Status: Inappropriate[oe specific]
 
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+
 ---
  Makefile | 45 +++++++++++++++++++++++----------------------
  1 file changed, 23 insertions(+), 22 deletions(-)
 
-Index: git/Makefile
-===================================================================
---- git.orig/Makefile
-+++ git/Makefile
+diff --git a/Makefile b/Makefile
+index 6fa00bc..7aa7ae2 100644
+--- a/Makefile
++++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
  CC	= gcc
  endif
@@ -79,7 +80,7 @@ Index: git/Makefile
 +              -DRELEASE_DATE='"$(DATE)"'
 +
  SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sadump_info.h
- SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c
+ SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c printk.c
  OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
 @@ -52,12 +53,12 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
  
@@ -104,7 +105,7 @@ Index: git/Makefile
 +CFLAGS_COMMON += -DUSESNAPPY
  endif
  
- LIBS := -lpthread $(LIBS)
+ LIBS := $(LIBS) -lpthread
 @@ -90,14 +91,14 @@ LIBS := $(LIBS) $(call try-run,\
  all: makedumpfile
  
@@ -122,7 +123,7 @@ Index: git/Makefile
  	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
  	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
  	mv temp.8 makedumpfile.8
-@@ -108,7 +109,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
+@@ -108,7 +109,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
  	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
  
  eppic_makedumpfile.so: extension_eppic.c
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
similarity index 97%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
index 6f87db177..4350ea126 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.8.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.6.9.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPLv2.0"
 
 SRCBRANCH ?= "master"
-SRCREV = "18e0cdba48feeccea2429b3b0b2691f4314d1062"
+SRCREV = "a9ad811c15e769c8e6d8d915a05cebc32f2ea2f5"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS_${PN}-tools = "perl ${PN}"
-- 
2.25.1


