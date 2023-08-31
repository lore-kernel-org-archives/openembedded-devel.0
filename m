Return-Path: <bbara93@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE20BC83F29
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 08:54:24 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.12362.1693472063516090791
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Aug 2023 01:54:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Fvq0U9wj;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: bbara93@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-31c3726cc45so421700f8f.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 01:54:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693472062; x=1694076862; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ClaGbxPKYsfpBkvFlG/slbyIJW7jzq/D4c9cEgo/9JE=;
        b=Fvq0U9wjPtJ3ZBvVg88E5gw885Q1Qvn6pZNuLRiO0mhO6hWkTyWZ7WdQgITZwXC+ZO
         eba7H4MzGAUSIgtiqj1161h/5/FVx5+ugKn7WLMdZJlGZvwMpSvXC+PfTmzlHBk15/9G
         H7aa0HqtzsHkfg3swB0DqbfNMzaFjmo1O+yMm/S374xpqonIoMmqESE9udmFcSPMxeWR
         jsux3ybVK8/tU0aFx4DoPi1bdwiwhIpTZXygyxg+1kBa0+oM5AJhO69a7SDY9EkKmnQE
         21jDdZ97Ivg+xGeDmXHxU/MdXKvXlwO86h10bYBIIWJlM2f7JsTKpnEZ6Lqv9xS9DfK4
         OGLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693472062; x=1694076862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ClaGbxPKYsfpBkvFlG/slbyIJW7jzq/D4c9cEgo/9JE=;
        b=beATLQiKLitmtTC2ApgXzAiGbsWOnheCZy0cgE2SqqFvBJ3TXzc9ggXCUj1aeFIpUM
         liIossVyEmzEYFCsp/S+1P4MU5TrTB8pTQrbYgk5CE/XFp4J14xyj72AH9EweiHdd9sQ
         cMtU+B4r4aOLPML9EAsxkHN8FinID6xxn5DxQOvgERzXazeEaqdYkdgb54KOUs3kEdt4
         51Ze246zR5OoEHLfxhz8R1hvu7A/06s1On9nkBAKsM9sPjWjpUSs7ID+WdaOnI6ZzIJF
         TatMKxjZf/9eUIOP/vKPsOcsOC70oX8IddiE9La7oAYuSwjDoz+nq2ulp8lnUS3jdYyv
         dS0Q==
X-Gm-Message-State: AOJu0Yzbd4pG/PmVjS6heF9uAjqQ5bFNi02YVS0R2HuvGsiLABCVsGUI
	bkLPWvUzRw3a/Y+CT81ftr8=
X-Google-Smtp-Source: AGHT+IH/4R5yRuK7+qWJRtoYFeWkojTYqTEgscL4YvqXjksj0zdBwXH5u6Ffx02Djd0X0XNi+uXpmg==
X-Received: by 2002:adf:de0e:0:b0:31a:dbe0:ca7d with SMTP id b14-20020adfde0e000000b0031adbe0ca7dmr3596133wrm.8.1693472061555;
        Thu, 31 Aug 2023 01:54:21 -0700 (PDT)
Received: from PCBABN.skidata.net ([91.230.2.244])
        by smtp.gmail.com with ESMTPSA id e13-20020a5d4e8d000000b0031c6cc74882sm1445524wru.107.2023.08.31.01.54.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 01:54:21 -0700 (PDT)
From: Benjamin Bara <bbara93@gmail.com>
To: schnitzeltony@gmail.com
Cc: openembedded-devel@lists.openembedded.org,
	Benjamin Bara <benjamin.bara@skidata.com>
Subject: [meta-multimedia][PATCH] openh264: make neon optional and disable if not supported
Date: Thu, 31 Aug 2023 10:54:11 +0200
Message-Id: <20230831085411.3715616-1-bbara93@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Aug 2023 08:54:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104681

From: Benjamin Bara <benjamin.bara@skidata.com>

openh264 currently enforces neon on armv7, although it has fallbacks
implemented in C/C++ and it is mentioned in the README that it is
optional[1].

Therefore, make neon optional and disable it if the machine does not
support it.

[1] https://github.com/cisco/openh264/blob/v2.3.1/README.md?plain=1#L54

Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
---
 ...ossibility-to-disable-NEON-extension.patch | 103 ++++++++++++++++++
 .../openh264/openh264_2.3.1.bb                |   4 +
 2 files changed, 107 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch b/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch
new file mode 100644
index 000000000..298ac1c01
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264/0002-Makefile-add-possibility-to-disable-NEON-extension.patch
@@ -0,0 +1,103 @@
+From bc3a3baeaccfe9c1286848b348baf92dfbd05346 Mon Sep 17 00:00:00 2001
+From: Benjamin Bara <benjamin.bara@skidata.com>
+Date: Thu, 31 Aug 2023 09:27:31 +0200
+Subject: [PATCH 2/2] Makefile: add possibility to disable NEON extension
+
+README states that the NEON extension is optional. However, currently it
+cannot be turned off, therefore add an option to disable it.
+
+Upstream-Status: Submitted [https://github.com/cisco/openh264/pull/3679]
+Signed-off-by: Benjamin Bara <benjamin.bara@skidata.com>
+---
+ Makefile                   |  1 +
+ build/arch.mk              |  4 ++++
+ build/msvc-common.mk       | 10 ++++++++--
+ build/platform-mingw_nt.mk |  5 ++++-
+ 4 files changed, 17 insertions(+), 3 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index baed53a7..cc22c4aa 100644
+--- a/Makefile
++++ b/Makefile
+@@ -35,6 +35,7 @@ CCASFLAGS=$(CFLAGS)
+ STATIC_LDFLAGS=-lstdc++
+ STRIP ?= strip
+ USE_STACK_PROTECTOR = Yes
++USE_NEON=Yes
+ 
+ SHAREDLIB_MAJORVERSION=7
+ FULL_VERSION := 2.3.1
+diff --git a/build/arch.mk b/build/arch.mk
+index 4e1538c4..fd6a81e4 100644
+--- a/build/arch.mk
++++ b/build/arch.mk
+@@ -17,18 +17,22 @@ ifneq ($(filter-out arm64 arm64e, $(filter arm%, $(ARCH))),)
+ ifeq ($(USE_ASM), Yes)
+ ASM_ARCH = arm
+ ASMFLAGS += -I$(SRC_PATH)codec/common/arm/
++ifeq ($(USE_NEON), Yes)
+ CFLAGS += -DHAVE_NEON
+ endif
+ endif
++endif
+ 
+ #for arm64
+ ifneq ($(filter arm64 aarch64 arm64e, $(ARCH)),)
+ ifeq ($(USE_ASM), Yes)
+ ASM_ARCH = arm64
+ ASMFLAGS += -I$(SRC_PATH)codec/common/arm64/
++ifeq ($(USE_NEON), Yes)
+ CFLAGS += -DHAVE_NEON_AARCH64
+ endif
+ endif
++endif
+ 
+ #for mips
+ ifneq ($(filter mips mips64, $(ARCH)),)
+diff --git a/build/msvc-common.mk b/build/msvc-common.mk
+index 5891ea4e..5a1e2582 100644
+--- a/build/msvc-common.mk
++++ b/build/msvc-common.mk
+@@ -10,7 +10,10 @@ else
+ endif
+ ifeq ($(ASM_ARCH), arm)
+ CCAS = gas-preprocessor.pl -as-type armasm -force-thumb -- armasm
+-CCASFLAGS = -nologo -DHAVE_NEON -ignore 4509
++CCASFLAGS = -nologo -ignore 4509
++ifeq ($(USE_NEON), Yes)
++CCASFLAGS += -DHAVE_NEON
++endif
+ endif
+ 
+ CC=cl
+@@ -20,7 +23,10 @@ CXX_O=-Fo$@
+ 
+ ifeq ($(ASM_ARCH), arm64)
+ CCAS = clang-cl
+-CCASFLAGS = -nologo -DHAVE_NEON_AARCH64 --target=arm64-windows
++CCASFLAGS = -nologo --target=arm64-windows
++ifeq ($(USE_NEON), Yes)
++CCASFLAGS += -DHAVE_NEON_AARCH64
++endif
+ endif
+ 
+ 
+diff --git a/build/platform-mingw_nt.mk b/build/platform-mingw_nt.mk
+index b7a5495d..d73e362a 100644
+--- a/build/platform-mingw_nt.mk
++++ b/build/platform-mingw_nt.mk
+@@ -17,7 +17,10 @@ endif
+ endif
+ ifeq ($(ASM_ARCH), arm)
+ CCAS = gas-preprocessor.pl -as-type clang -force-thumb -- $(CC)
+-CCASFLAGS = -DHAVE_NEON -mimplicit-it=always
++CCASFLAGS = -mimplicit-it=always
++ifeq ($(USE_NEON), Yes)
++CCASFLAGS += -DHAVE_NEON
++endif
+ endif
+ EXEEXT = .exe
+ 
+-- 
+2.34.1
+
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
index 89b1ea58c..6dfd75935 100644
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
@@ -16,6 +16,7 @@ SRCREV = "0a48f4d2e9be2abb4fb01b4c3be83cf44ce91a6e"
 BRANCH = "openh264v${PV}"
 SRC_URI = "git://github.com/cisco/openh264.git;protocol=https;branch=${BRANCH} \
            file://0001-Makefile-Use-cp-options-to-preserve-file-mode.patch \
+           file://0002-Makefile-add-possibility-to-disable-NEON-extension.patch \
            "
 
 COMPATIBLE_MACHINE:armv7a = "(.*)"
@@ -35,6 +36,9 @@ EXTRA_OEMAKE:mips = "ARCH=mips"
 EXTRA_OEMAKE:mips64 = "ARCH=mips64"
 EXTRA_OEMAKE:riscv64 = "ARCH=riscv64"
 
+EXTRA_OEMAKE:append:armv7a = "${@bb.utils.contains("TUNE_FEATURES","neon",""," USE_NEON=No",d)}"
+EXTRA_OEMAKE:append:armv7ve = "${@bb.utils.contains("TUNE_FEATURES","neon",""," USE_NEON=No",d)}"
+
 EXTRA_OEMAKE:append = " ENABLEPIC=Yes"
 do_configure() {
     :
-- 
2.34.1


