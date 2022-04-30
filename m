Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 197D0C433EF
	for <webhook@archiver.kernel.org>; Sat, 30 Apr 2022 19:19:21 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web08.25976.1651346351335048593
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Tlz2I2j6;
 spf=pass (domain: gmail.com, ip: 209.85.214.172,
 mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f172.google.com with SMTP id k1so1096466pll.4
        for <openembedded-devel@lists.openembedded.org>;
 Sat, 30 Apr 2022 12:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hoqL8oeKzwbPLpPnHeZ7uIiaoSufSw6O6FP7OY/DQsk=;
        b=Tlz2I2j6AeOjnK1Uudo1w4XnEXsyj1BAl/P44Vp2hpr2CwMOGOzovuEhpzbRmKga9O
         sjokoQZFgzJ9jV1HwR8xZhDv0O8G0/H/xQnu1YVGQyO43NrCnnVK5dGYToO4VTcCgsgq
         MH7k6lnRa5604yNOV1ethwHuCW+2q3pRNoFRhRrZtDqAPlquRvBzWmYwtewQFnKysvpm
         9HuRqokkXNB3xdMzSFdGan5FE5rkn3MDsMp/MIYu0Blbu9BBMKhsmdN6vsVaCsPOG486
         QeHG6Su7us1bXnYQU2j2UWvMItO70+DNRteh0SkIv26nKNz5F7Tsi8Ai2uEIjpFy3ixY
         +Ouw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hoqL8oeKzwbPLpPnHeZ7uIiaoSufSw6O6FP7OY/DQsk=;
        b=EESL9JsnheC6/bN1zpv1yANkUYAHQfNMn/hJuIdWQX1AWiiBuCLsxvCK6j2YQ1oPzJ
         IZTonLJ5O56t/pi0FTRenw91FOxRONOqs67TPBlKeMhHNPp38tlsOwbxX0s8mFds08Mz
         Fk8xhitkQRb4uPLw9SaUQb8BFEHUqhRze8tz5Igv4OMgATw3vggvFYpgUi5W4gOp/TPq
         OaXH+2y7WpbL9soDUHYNU3v6Qw9kKwmXUbBPVYMw8HCKkt5G66RSi1TqsIXRJkid7XI0
         gDm1M33kBJiyV7EgUXPM2fxdA16WWDyLQ4w6qrk6mcYorkuLjnMbYEvdWMxzvcsNBUKj
         q20A==
X-Gm-Message-State: AOAM532f2+r0y99Txk77ikCl0TGT0ARZvXjqoVwF++GudrpaRIDmuwxC
	k7DZn6/zRE20IGY7ZzC9YFi2efuVkH9YvA==
X-Google-Smtp-Source: 
 ABdhPJxJpT1ELfjWECuCrvNYkoRFtSlKbrOlU4Cw5Ex+YrCmBIHMrDqbAdh30/YctiGLc8nnlpqw8w==
X-Received: by 2002:a17:90a:7acb:b0:1d9:85a5:e1e3 with SMTP id
 b11-20020a17090a7acb00b001d985a5e1e3mr10155542pjl.172.1651346349859;
        Sat, 30 Apr 2022 12:19:09 -0700 (PDT)
Received: from keaua.caveonetworks.com
 ([2601:202:4180:a5c0:8e62:e537:ba7a:ce43])
        by smtp.gmail.com with ESMTPSA id
 h10-20020a170902b94a00b0015e8d4eb28bsm1810756pls.213.2022.04.30.12.19.08
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Apr 2022 12:19:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [kirkstone 28/39] makedumpfile: Upgrade to 1.7.1
Date: Sat, 30 Apr 2022 12:18:08 -0700
Message-Id: 
 <6b161909ebe1db75882cc3bfe9de266a28dc6bc2.1651346200.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1651346200.git.akuster808@gmail.com>
References: <cover.1651346200.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 30 Apr 2022 19:19:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96895

From: Mingli Yu <mingli.yu@windriver.com>

Remove related man pages gz logic as it's removed in new version [1].

[1] https://github.com/makedumpfile/makedumpfile/commit/2169de66ecd4504a3e69e0be0330f492f966ce5e

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f2748082e84b70c0a73d7d494b0f02338fedded1)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...makedumpfile-replace-hardcode-CFLAGS.patch | 53 +++++++++----------
 ...umpfile_1.7.0.bb => makedumpfile_1.7.1.bb} |  8 +--
 2 files changed, 26 insertions(+), 35 deletions(-)
 rename meta-oe/recipes-kernel/makedumpfile/{makedumpfile_1.7.0.bb => makedumpfile_1.7.1.bb} (85%)

diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch b/meta-oe/recipes-kernel/makedumpfile/makedumpfile/0001-makedumpfile-replace-hardcode-CFLAGS.patch
index 1dd87c8b11..f3dc8a466a 100644
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
@@ -16,9 +16,12 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
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
 
 --- a/Makefile
 +++ b/Makefile
@@ -35,19 +38,13 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
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
@@ -55,8 +52,7 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  endif
  
 -CFLAGS += -D__$(ARCH)__ $(CROSS)
--CFLAGS_ARCH += -D__$(ARCH)__ $(CROSS)
-+CFLAGS_ARCH += -D$(ARCH) $(CROSS)
+ CFLAGS_ARCH += -D__$(ARCH)__ $(CROSS)
  
 -ifeq ($(ARCH), powerpc64)
 -CFLAGS += -m64
@@ -78,11 +74,12 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
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
@@ -97,7 +94,7 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  endif
  
  ifeq ($(USESNAPPY), on)
-@@ -65,12 +66,12 @@ LIBS := -lsnappy $(LIBS)
+@@ -65,12 +67,12 @@ LIBS := -lsnappy $(LIBS)
  ifneq ($(LINKTYPE), dynamic)
  LIBS := $(LIBS) -lstdc++
  endif
@@ -112,7 +109,7 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
  endif
  
  ifeq ($(DEBUG), on)
-@@ -104,14 +105,14 @@ LIBS := $(LIBS) $(call try-run,\
+@@ -104,14 +106,14 @@ LIBS := $(LIBS) $(call try-run,\
  all: makedumpfile
  
  $(OBJ_PART): $(SRC_PART)
@@ -126,15 +123,15 @@ Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
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
+@@ -120,7 +122,7 @@ makedumpfile: $(SRC_BASE) $(OBJ_PART) $(
+ 	     $(VPATH)makedumpfile.conf.5.in > $(VPATH)makedumpfile.conf.5
  
  eppic_makedumpfile.so: extension_eppic.c
 -	$(CC) $(CFLAGS) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppic.c -fPIC -leppic -ltinfo
 +	$(CC) $(CFLAGS_COMMON) $(LDFLAGS) -shared -rdynamic -o $@ extension_eppic.c -fPIC -leppic -ltinfo
  
  clean:
- 	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8.gz makedumpfile.conf.5.gz
+ 	rm -f $(OBJ) $(OBJ_PART) $(OBJ_ARCH) makedumpfile makedumpfile.8 makedumpfile.conf.5
diff --git a/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb b/meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
similarity index 85%
rename from meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.0.bb
rename to meta-oe/recipes-kernel/makedumpfile/makedumpfile_1.7.1.bb
index d4da031866..c3f965b041 100644
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


