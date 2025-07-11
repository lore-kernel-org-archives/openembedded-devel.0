Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA6CC83F1A
	for <webhook@archiver.kernel.org>; Sat, 12 Jul 2025 00:00:11 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web10.27191.1752278402368760994
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 17:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMO4xj4M;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-749068b9b63so1855914b3a.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 17:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752278401; x=1752883201; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sj93R6PgtlII8FZlgZ+WnlLtKOKnxD/YB86xSJqv8f0=;
        b=hMO4xj4MHULZbjZSEKM6ImmYVL4rP/VDXA7zgUtdt6S5PUlOR+Eb10exX/JLJyrYBb
         lkrPdtMy2IVbveh6t6TZweyStXLpRBIp4hYM/ZHzKRu86UViwMN4lV6l/d1yMCv4k+ZA
         HsFxDaDy5CpT3YMajPKvKhVXy/fImVo6QXBKcDjGmLC1LGs0CweLDdH2LVu6EW/Q7N7h
         ARjBUCeAuOYVTph+YCvAb5YfDHgMMaGM0OZC/BpGYYgus0qXGi8e3QTjZtJE0o9Ibotm
         geY9g3KjbCl9RwZqQX5GC42Kn1oJ5zlXYwM27QLEDwR3eEWJfgxKAh9xpaLZT6HqBI+P
         ZifA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752278401; x=1752883201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sj93R6PgtlII8FZlgZ+WnlLtKOKnxD/YB86xSJqv8f0=;
        b=vd43myide6vwNhCUYncjieHmZkzGE4WygV0hVYMvlQHHq/RSVPZENFmCFFSh2btn/y
         GnMP/WP8SNnRBMYCb1EDj0xMlGc2jVtV24Eq7XT6pQM+tTq3HEiOTJZcQLq6IOfNEUYr
         Nlgibky0SvwLqi99NxNtbBeAPf9f9ClU2zEI1b0xMeaJTwGDHyOFnNewc4FcF+NG0Zzm
         xncnFPNhzrmvyUXTvBK2UHROXxkbSSTDRA+MIovqKIXEPFPwY8nL7vj8zjy1E6UfLVn2
         ZF0CBz3p8dSdCHCd7eQ0bfuUpXori1MpRiYfYaBQyFc9J2ougFtKWJuqrmZwMGqGPiUD
         W/GA==
X-Gm-Message-State: AOJu0Yyy4G3E/kHJJcWTf2CLPkMSERBeJi7Enm+Y8Y/RClmxOjjmuVYZ
	AwiZzGnCpty2/eAFV1jpvkhTp95ZpFy80CmKvplK8vO0JWx1aKxJuShRMD5n3l6c
X-Gm-Gg: ASbGncvstDktjpKxJCjNx+GjnFQutp4T78knjkbsYh12I+Gzt3NwI0tkXHCejSlKQxt
	a4bkNce7l/cB57ZEltLyi89ZigIXuXrQ909NxawlDrkYMZeaY1Mm8Bo7T6/pg4qK+3ygi+A/rkH
	Knqs3s8bwVbj0uQ9d134q5mLdKMoqhCs4FKQIbH5TSSchEGRbNQQdzn0OgLfyO99FOc9ic2pcJC
	I8Jmrb72Op6dO0jR9NjJIzdyw6687YxMwnKdNcWV6MbhZzWoKdB2PIhjB3OUU4ObdjavTCcNC/+
	56uxSGhAcuezoa6YbGaHPIbRQxggYb3HazPUbtDKkW8iH6G8iuqTbqleJH392Y5Yzch6Sxs8ZZh
	W+qOm3CL5rWU3FA==
X-Google-Smtp-Source: AGHT+IEBfTyt5FkXX0WxihG1gTwA0L0Tv54lQHWaUrLx/WrmQxmYzU7S3hBsgtbNJQW4FWARQ0EjHQ==
X-Received: by 2002:a17:90b:3a46:b0:312:f88d:25f9 with SMTP id 98e67ed59e1d1-31c50d5dd27mr5289111a91.7.1752278401281;
        Fri, 11 Jul 2025 17:00:01 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::1c1d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c3e972298sm6047715a91.11.2025.07.11.17.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 17:00:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] taisei: Upgrade to 1.4.3
Date: Fri, 11 Jul 2025 16:59:58 -0700
Message-ID: <20250711235958.3225107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 12 Jul 2025 00:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118461

Drop 0001-util-consideredharmful-Use-overloadable-func-attribu.patch
which is fixed differently upstream [1]

Specify strip=false via meson cmdline and avoid patching sources

Move dependency to libsdl3 instead of libsdl2 which is required in this
version

[1] https://github.com/taisei-project/taisei/commit/6a0c1c8bf0138b565bc2dd39f4175f76ba254129

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-strip-option-from-executable-build.patch | 29 ----------
 ...armful-Use-overloadable-func-attribu.patch | 58 -------------------
 .../{taisei_1.4.2.bb => taisei_1.4.3.bb}      | 12 ++--
 3 files changed, 5 insertions(+), 94 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-Remove-strip-option-from-executable-build.patch
 delete mode 100644 meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch
 rename meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/{taisei_1.4.2.bb => taisei_1.4.3.bb} (84%)

diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-Remove-strip-option-from-executable-build.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-Remove-strip-option-from-executable-build.patch
deleted file mode 100644
index aa36c2c3f8..0000000000
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-Remove-strip-option-from-executable-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 6c86f8aea2a29c33af3f212afa9f0ea180822d1e Mon Sep 17 00:00:00 2001
-From: Thomas Perrot <thomas.perrot@bootlin.com>
-Date: Wed, 6 Nov 2024 21:02:54 +0100
-Subject: [PATCH] Remove strip option from executable build
-
-To improve debugging experience, OE tasks will strip binaries.
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 88d4d53263ae..8a1f540836e0 100644
---- a/meson.build
-+++ b/meson.build
-@@ -73,7 +73,6 @@ project('taisei', 'c',
-
-         # You may want to change these for a debug build dir
-         'buildtype=release',
--        'strip=true',
-         'b_lto=true',
-         'b_ndebug=if-release',
-     ]
---
-2.47.0
-
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch
deleted file mode 100644
index 09f4be300c..0000000000
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei/0001-util-consideredharmful-Use-overloadable-func-attribu.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 6f40a8cfbc4dd5ca4c3156338e8e35f25d4d4599 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 22 Nov 2024 01:16:25 -0800
-Subject: [PATCH] util/consideredharmful: Use overloadable func attribute with
- clang
-
-When building with glibc HEAD, it has fortified headers with clang as well
-and clang reports errors e.g.
-
-| ../git/src/util/consideredharmful.h:33:7: error: redeclaration of 'strncat' must have the 'overloadable' attribute
-|    33 | char* strncat();
-|       |       ^
-| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux/taisei/1.4.2/recipe-sysroot/usr/include/bits/string_fortified.h:145:8: note: previous overload of function is here
-|   145 | __NTH (strncat (__fortify_clang_overload_arg (char *, __restrict, __dest),
-|       |        ^
-
-Upstream-Status: Submitted [https://github.com/taisei-project/taisei/pull/393]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/util/consideredharmful.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
---- a/src/util/consideredharmful.h
-+++ b/src/util/consideredharmful.h
-@@ -8,6 +8,7 @@
- 
- #pragma once
- #include "taisei.h"
-+#include "util/compat.h"
- 
- #include <stdio.h>
- 
-@@ -24,17 +25,23 @@ PRAGMA(GCC diagnostic ignored "-Wstrict-
- // clang generates lots of these warnings with _FORTIFY_SOURCE
- PRAGMA(GCC diagnostic ignored "-Wignored-attributes")
- 
-+#ifdef __GLIBC__
-+#define OVERLOADABLE __attribute__((overloadable))
-+#else
-+#define OVERLOADABLE
-+#endif
-+
- #undef fopen
- attr_deprecated("Use vfs_open or SDL_RWFromFile instead")
- FILE* fopen();
- 
- #undef strncat
- attr_deprecated("This function likely doesn't do what you expect, use strlcat")
--char* strncat();
-+char* OVERLOADABLE strncat();
- 
- #undef strncpy
- attr_deprecated("This function likely doesn't do what you expect, use strlcpy")
--char* strncpy();
-+char* OVERLOADABLE strncpy();
- 
- #undef errx
- attr_deprecated("Use log_fatal instead")
diff --git a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.3.bb
similarity index 84%
rename from meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
rename to meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.3.bb
index ee65f89ab7..239237ceaf 100644
--- a/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.2.bb
+++ b/meta-oe/dynamic-layers/multimedia-layer/recipes-graphics/taisei/taisei_1.4.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1a11ffd7e1bdd1d3156cecec60a2846f"
 DEPENDS = "\
     cglm \
     freetype \
-    virtual/libsdl2 \
+    libsdl3 \
     libwebp \
     opusfile \
     zstd \
@@ -32,12 +32,8 @@ RDEPENDS_${PN} = "\
     zlib \
 "
 
-SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https \
-           file://0001-util-consideredharmful-Use-overloadable-func-attribu.patch \
-           file://0001-Remove-strip-option-from-executable-build.patch"
-
-SRCREV = "c098579d4fa0f004ccc204c5bc46eac3717cba28"
-
+SRC_URI = "gitsm://github.com/taisei-project/taisei.git;branch=v1.4.x;protocol=https;tag=v${PV}"
+SRCREV = "02b7c71ae7d7a53202378e384f2cb26df9164f22"
 
 inherit features_check meson mime mime-xdg pkgconfig python3native
 
@@ -49,4 +45,6 @@ PACKAGECONFIG[a_null] = "-Da_null=true,-Da_null=false"
 PACKAGECONFIG[developer] = "-Ddeveloper=true,-Ddeveloper=false"
 PACKAGECONFIG[docs] = "-Ddocs=true,-Ddocs=false,python3-docutils-native"
 
+EXTRA_OEMESON += "-Dstrip=false"
+
 FILES:${PN} += "${datadir}"

