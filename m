Return-Path: <mingli.yu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79941C38A2C
	for <webhook@archiver.kernel.org>; Mon, 25 Apr 2022 19:26:12 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web10.25458.1650859205307246086
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 21:00:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: mingli.yu@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 23P402Zv009098
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 24 Apr 2022 21:00:03 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 24 Apr 2022 21:00:02 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Sun, 24 Apr 2022 21:00:02 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 24 Apr 2022 21:00:01 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [meta-oe][PATCH] makedumpfile: Upgrade to 1.7.1
Date: Mon, 25 Apr 2022 12:00:01 +0800
Message-ID: <20220425040001.1314913-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Apr 2022 19:26:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96758

From: Mingli Yu <mingli.yu@windriver.com>

Remove related man pages gz logic as it's removed in new version [1].

[1] https://github.com/makedumpfile/makedumpfile/commit/2169de66ecd4504a3e69e0be0330f492f966ce5e

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...makedumpfile-replace-hardcode-CFLAGS.patch | 55 ++++++++++---------
 ...umpfile_1.7.0.bb => makedumpfile_1.7.1.bb} |  8 +--
 2 files changed, 30 insertions(+), 33 deletions(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.0.bb => makedumpfile_1.7.1.bb} (85%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 1dd87c8b1..ab68d5c0e 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
@@ -1,6 +1,6 @@
-From af97e2ad643334b4c7c3d66f971ce9ebb2b596af Mon Sep 17 00:00:00 2001
+From 71b5a3905d5cd0feca88a0d61d7657ba5296a052 Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
-Date: Thu, 21 Jul 2016 18:06:21 +0800
+Date: Sun, 24 Apr 2022 17:25:33 +0800
 Subject: [PATCH] makedumpfile: replace hardcode CFLAGS
 
 * Create alias for target such as powerpc as powerpc32
@@ -16,10 +16,15 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
 [2021-11-18] Patch updated to use CFLAGS_COMMON for zstd
 Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
+
+Rebase to 1.7.1
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- Makefile |   47 ++++++++++++++++++++++++-----------------------
- 1 file changed, 24 insertions(+), 23 deletions(-)
+ Makefile | 42 ++++++++++++++++++++++--------------------
+ 1 file changed, 22 insertions(+), 20 deletions(-)
 
+diff --git a/Makefile b/Makefile
+index 537359d..7d07bdc 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -8,12 +8,6 @@ ifeq ($(strip $CC),)
@@ -35,19 +40,13 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  HOST_ARCH := $(shell uname -m)
  # Use TARGET as the target architecture if specified.
  # Defaults to uname -m
-@@ -21,29 +15,36 @@ ifeq ($(strip($TARGET)),)
- TARGET := $(HOST_ARCH)
- endif
- 
--ARCH := $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc64/ \
--			       -e s/arm.*/arm/ -e s/sa110/arm/ \
--			       -e s/s390x/s390/ -e s/parisc64/parisc/ \
+@@ -24,26 +18,34 @@ endif
+ ARCH := $(shell echo ${TARGET}  | sed -e s/i.86/x86/ -e s/sun4u/sparc64/ \
+ 			       -e s/arm.*/arm/ -e s/sa110/arm/ \
+ 			       -e s/s390x/s390/ -e s/parisc64/parisc/ \
 -			       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/)
-+ARCH := $(shell echo __${TARGET}__  | sed -e s/i.86/x86/ -e s/sun4u/sparc64/ \
-+		       -e s/arm.*/arm/ -e s/sa110/arm/ \
-+		       -e s/s390x/s390/ -e s/parisc64/parisc/ \
-+		       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/ \
-+		       -e s/_powerpc_/_powerpc32_/)
++			       -e s/ppc64/powerpc64/ -e s/ppc/powerpc32/ \
++			       -e s/_powerpc_/_powerpc32_/)
  
  CROSS :=
  ifneq ($(TARGET), $(HOST_ARCH))
@@ -78,11 +77,12 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
 +CFLAGS_COMMON = $(CFLAGS_ARCH) \
 +              -DVERSION='"$(VERSION)"' \
 +              -DRELEASE_DATE='"$(DATE)"'
++
 +
  SRC_BASE = makedumpfile.c makedumpfile.h diskdump_mod.h sadump_mod.h sadump_info.h
- SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c printk.c
+ SRC_PART = print_info.c dwarf_info.c elf_info.c erase_info.c sadump_info.c cache.c tools.c printk.c detect_cycle.c
  OBJ_PART=$(patsubst %.c,%.o,$(SRC_PART))
-@@ -52,12 +53,12 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
+@@ -52,12 +54,12 @@ OBJ_ARCH=$(patsubst %.c,%.o,$(SRC_ARCH))
  
  LIBS = -ldw -lbz2 -ldl -lelf -lz
  ifneq ($(LINKTYPE), dynamic)
@@ -97,7 +97,7 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  endif
  
  ifeq ($(USESNAPPY), on)
-@@ -65,12 +66,12 @@ LIBS := -lsnappy $(LIBS)
+@@ -65,12 +67,12 @@ LIBS := -lsnappy $(LIBS)
  ifneq ($(LINKTYPE), dynamic)
  LIBS := $(LIBS) -lstdc++
  endif
@@ -112,7 +112,7 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  endif
  
  ifeq ($(DEBUG), on)
-@@ -104,14 +105,14 @@ LIBS := $(LIBS) $(call try-run,\
+@@ -104,14 +106,14 @@ LIBS := $(LIBS) $(call try-run,\
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -126,15 +126,18 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
 -	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $@ $< $(LIBS)
 +	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) $(OBJ_PART) $(OBJ_ARCH) -rdynamic -o $@ $< $(LIBS)
- 	echo .TH MAKEDUMPFILE 8 \"$(DATE)\" \"makedumpfile v$(VERSION)\" \"Linux System Administrator\'s Manual\" > temp.8
- 	grep -v "^.TH MAKEDUMPFILE 8" $(VPATH)makedumpfile.8 >> temp.8
- 	mv temp.8 makedumpfile.8
-@@ -122,7 +123,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
- 	gzip -c ./makedumpfile.conf.5 > ./makedumpfile.conf.5.gz
+ 	@sed -e "s/@DATE@/$(DATE)/" \
+ 	     -e "s/@VERSION@/$(VERSION)/" \
+ 	     $(VPATH)makedumpfile.8.in > $(VPATH)makedumpfile.8
+@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(OBJ_ARCH)
+ 	     $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
  
  eppic_makedumpfile.so: extension_eppic.c
 -	$(CC) $(CFLAGS) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppic.c -fPIC -leppic -ltinfo
 +	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppic.c -fPIC -leppic -ltinfo
  
  clean:
- 	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8.gz makedumpfile.conf.5.gz
+ 	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8 makedumpfile.conf.5
+-- 
+2.25.1
+
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
similarity index 85%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
index d4da03186..c3f965b04 100644
--- a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
+++ b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 LICENSE = "GPL-2.0-only"
 
 SRCBRANCH ?= "master"
-SRCREV = "06ef8e2b814feb08a668b7a3783c86674e49a7b1"
+SRCREV = "74bbdd14ec861552ace1ca63953eb2ef73e1f965"
 
 DEPENDS = "bzip2 zlib elfutils xz"
 RDEPENDS:${PN}-tools = "perl ${PN}"
@@ -52,12 +52,6 @@ do_install () {
     install -m 755 ${S}/makedumpfile ${D}/usr/bin
     install -m 755 ${S}/makedumpfile-R.pl ${D}/usr/bin
 
-    mkdir -p ${D}/usr/share/man/man8
-    install -m 644 ${S}/makedumpfile.8.gz ${D}/usr/share/man/man8
-
-    mkdir -p ${D}/usr/share/man/man5
-    install -m 644 ${S}/makedumpfile.conf.5.gz ${D}/usr/share/man/man5
-
     mkdir -p ${D}/etc/
     install -m 644 ${S}/makedumpfile.conf ${D}/etc/makedumpfile.conf.sample
 }
-- 
2.25.1


