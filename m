Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.4315.1587322476366564289
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Apr 2020 11:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LKnrfsZ2;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id g6so3916807pgs.9
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Apr 2020 11:54:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UWL5J5k6Ya3KdX3zQ6qirEkyW6Jo9PRKfNZCRy7cG6Y=;
        b=LKnrfsZ2TC40bas8Q7YbGHxedrHL9sy9nSu5ueAnETt4a3+RwMHbnsgeR0PKDMihTh
         A3A8rIp/e7k90ImtcvGPsKbG/FHzOVz4meImXECRkj8QBmSXNvmLNGdxB7O0i4qBMoBn
         nKxSpnBCjoFKcsc6wWihTvqcN/odlG+MBrXlotuF/w/AaOpJG8/8eg1aJEoI3TIJAP4T
         oPjKQqQqYddcRX8DZKSpFSGgB/tKv1C9NC9nuoTHw3jOrg7gMFWYOyNNPjA0ghujLRVN
         Svnvkk/TIqxpC+m/los0dWGGkEhVFFMoq9mN7o7ZIovBFX4oajWaPgOrFn+Qje7Pmwe8
         VHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UWL5J5k6Ya3KdX3zQ6qirEkyW6Jo9PRKfNZCRy7cG6Y=;
        b=kw63VjXdHLQTgk2nIfrGdxG3Bq2FsN33xIu0V7OQwoG8CJnwVaQ6ptXcaLLZDmQWQh
         CDt9akl3dLrPjfwqplxGpu5Hq9gnn6ubyPJWV/EFOLnYjjzq4sVI855ysSJjPD+2V64f
         v5waSW9DR35CUBblRvW8xumAJs0/E+oKPo8FS1rPNZzq/bUdsNWJ5yojclGsesqX6KXG
         enH521Q0EV4Z10+UrErfBcbNm/hXCyDr1Ncg48PYZRu5XaC2PSALrfA0h9Tf+JtxW4DY
         c/1bYPMha9bNu8Fgpz2i/8OH7oEPuD5Em4Lk7cZ9Nbm9L20Q0sO0S4etAYjmn4R5UPvJ
         KQLQ==
X-Gm-Message-State: AGi0Pua8/jXWodYIDiZ9skzhyl3le2Lo9LSICeHyzGNleMx1ucbDxVFa
	P6gJm7by8lPRlZ7xgXtuZOyWN5NJEtQ=
X-Google-Smtp-Source: APiQypKV2Iah9Exz02rbsgeE/dzDL5kkPUy+fiE5v3PGEiBQSRpVoZNELf8dOV8oaEbVXBakdakqyw==
X-Received: by 2002:aa7:9683:: with SMTP id f3mr13620994pfk.278.1587322475244;
        Sun, 19 Apr 2020 11:54:35 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net (c-73-63-224-124.hsd1.ca.comcast.net. [73.63.224.124])
        by smtp.gmail.com with ESMTPSA id b4sm15150204pff.6.2020.04.19.11.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2020 11:54:34 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-multimedia][PATCH] openh264: Upgrade to 2.1.0
Date: Sun, 19 Apr 2020 11:54:31 -0700
Message-Id: <20200419185431.2568375-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop mips64 build patches as they are not needed anymore
Add logic for building on rv64

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...-poke-at-host-gcc-for-target-options.patch | 25 -------
 .../0001-codec-Disable-asm-for-mips.patch     | 70 -------------------
 .../{openh264_2.0.0.bb => openh264_2.1.0.bb}  |  7 +-
 3 files changed, 3 insertions(+), 99 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/0001-codec-Disable-asm-for-mips.patch
 rename meta-multimedia/recipes-multimedia/openh264/{openh264_2.0.0.bb => openh264_2.1.0.bb} (85%)

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch
deleted file mode 100644
index 5f590596d9..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From af9bd9201c755e0b01251021f4e7642d3fec9c1c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 4 Mar 2020 08:38:46 -0800
-Subject: [PATCH] Makefile: Do not poke at host gcc for target options
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- build/arch.mk | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/build/arch.mk b/build/arch.mk
-index 8ac3e70a..b80cee8c 100644
---- a/build/arch.mk
-+++ b/build/arch.mk
-@@ -35,7 +35,6 @@ ifneq ($(filter mips mips64, $(ARCH)),)
- ifeq ($(USE_ASM), Yes)
- ASM_ARCH = mips
- ASMFLAGS += -I$(SRC_PATH)codec/common/mips/
--LOONGSON3A = $(shell g++ -dM -E - < /dev/null | grep '_MIPS_TUNE ' | cut -f 3 -d " ")
- ifeq ($(LOONGSON3A), "loongson3a")
- CFLAGS += -DHAVE_MMI
- endif
--- 
-2.25.1
-
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-codec-Disable-asm-for-mips.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/0001-codec-Disable-asm-for-mips.patch
deleted file mode 100644
index 60ea69dbc0..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264/0001-codec-Disable-asm-for-mips.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From edb62d2518d87536290d00a11c78c311e3680914 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 4 Mar 2020 09:14:57 -0800
-Subject: [PATCH] codec: Disable asm for mips
-
-It needs loongson support which qemumips is not targettin
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- codec/common/targets.mk     | 2 +-
- codec/decoder/targets.mk    | 2 +-
- codec/encoder/targets.mk    | 2 +-
- codec/processing/targets.mk | 2 +-
- 4 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/codec/common/targets.mk b/codec/common/targets.mk
-index 96843cd9..e76cb2cb 100644
---- a/codec/common/targets.mk
-+++ b/codec/common/targets.mk
-@@ -74,7 +74,7 @@ COMMON_ASM_MIPS_SRCS=\
- 	$(COMMON_SRCDIR)/mips/satd_sad_mmi.c\
- 
- COMMON_OBJSMIPS += $(COMMON_ASM_MIPS_SRCS:.c=.$(OBJ))
--ifeq ($(ASM_ARCH), mips)
-+ifeq ($(ASM_ARCH), mips64)
- COMMON_OBJS += $(COMMON_OBJSMIPS)
- endif
- OBJS += $(COMMON_OBJSMIPS)
-diff --git a/codec/decoder/targets.mk b/codec/decoder/targets.mk
-index eaf5d3c0..615d9216 100644
---- a/codec/decoder/targets.mk
-+++ b/codec/decoder/targets.mk
-@@ -60,7 +60,7 @@ DECODER_ASM_MIPS_SRCS=\
- 	$(DECODER_SRCDIR)/core/mips/dct_mmi.c\
- 
- DECODER_OBJSMIPS += $(DECODER_ASM_MIPS_SRCS:.c=.$(OBJ))
--ifeq ($(ASM_ARCH), mips)
-+ifeq ($(ASM_ARCH), mips64)
- DECODER_OBJS += $(DECODER_OBJSMIPS)
- endif
- OBJS += $(DECODER_OBJSMIPS)
-diff --git a/codec/encoder/targets.mk b/codec/encoder/targets.mk
-index 1f053280..fd49c1fd 100644
---- a/codec/encoder/targets.mk
-+++ b/codec/encoder/targets.mk
-@@ -88,7 +88,7 @@ ENCODER_ASM_MIPS_SRCS=\
- 	$(ENCODER_SRCDIR)/core/mips/score_mmi.c\
- 
- ENCODER_OBJSMIPS += $(ENCODER_ASM_MIPS_SRCS:.c=.$(OBJ))
--ifeq ($(ASM_ARCH), mips)
-+ifeq ($(ASM_ARCH), mips64)
- ENCODER_OBJS += $(ENCODER_OBJSMIPS)
- endif
- OBJS += $(ENCODER_OBJSMIPS)
-diff --git a/codec/processing/targets.mk b/codec/processing/targets.mk
-index 300de2d8..8451d66e 100644
---- a/codec/processing/targets.mk
-+++ b/codec/processing/targets.mk
-@@ -62,7 +62,7 @@ PROCESSING_ASM_MIPS_SRCS=\
- 	$(PROCESSING_SRCDIR)/src/mips/vaa_mmi.c\
- 
- PROCESSING_OBJSMIPS += $(PROCESSING_ASM_MIPS_SRCS:.c=.$(OBJ))
--ifeq ($(ASM_ARCH), mips)
-+ifeq ($(ASM_ARCH), mips64)
- PROCESSING_OBJS += $(PROCESSING_OBJSMIPS)
- endif
- OBJS += $(PROCESSING_OBJSMIPS)
--- 
-2.25.1
-
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.0.0.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb
similarity index 85%
rename from meta-multimedia/recipes-multimedia/openh264/openh264_2.0.0.bb
rename to meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb
index 31b9da269f..3c65ef2479 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.0.0.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.1.0.bb
@@ -11,12 +11,10 @@ LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6d3771da6a07d33fd50d4d9aa73bcf"
 
 S = "${WORKDIR}/git"
-SRCREV = "71374015cdf13f7aab4bc2d820f77905b3becfb8"
-BRANCH = "openh264v2.0.0"
+SRCREV = "a60e28efe227ea8ea760b1e29a8943e371ebe4b3"
+BRANCH = "openh264v2.1.0"
 SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
            file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch \
-           file://0001-Makefile-Do-not-poke-at-host-gcc-for-target-options.patch \
-           file://0001-codec-Disable-asm-for-mips.patch \
            "
 
 COMPATIBLE_MACHINE_armv7a = "(.*)"
@@ -33,6 +31,7 @@ EXTRA_OEMAKE_x86 = "ARCH=i386"
 EXTRA_OEMAKE_x86-64 = "ARCH=x86_64"
 EXTRA_OEMAKE_mips = "ARCH=mips"
 EXTRA_OEMAKE_mips64 = "ARCH=mips64"
+EXTRA_OEMAKE_riscv64 = "ARCH=riscv64"
 
 EXTRA_OEMAKE_append = " ENABLEPIC=Yes"
 do_configure() {
-- 
2.26.1

