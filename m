Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6B95CCD185
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 04:22:39 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web11.8081.1760502156221986533
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 21:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=IG3MCEMa;
 spf=pass (domain: mvista.com, ip: 209.85.210.177, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782bfd0a977so5065556b3a.3
        for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 21:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1760502155; x=1761106955; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXczYhdP4RhU51cnswx4SmdDrAESw46DKNEqzoNIsmM=;
        b=IG3MCEMaYGVby2B8zjqet+iWCglc+onNYEZLANHO/hzd3AfXDZfioPqBFX3WtmSnN9
         3sK8lclUWmKcj3cmUlRrMZOMO6LjV0qw9ZjomKPxadS/wCsBLnmYP/5PgNPFMxa4au2g
         KSmsFCrDTXiG5LAH8R/tLOsnUUYpOhIuuSQTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760502155; x=1761106955;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXczYhdP4RhU51cnswx4SmdDrAESw46DKNEqzoNIsmM=;
        b=Uuo/hPoBplhITtZLfX/1mkYyGnXzL0JSlvHSBI60BB9C5Uhbi5Zle+MDFnU39Guh5W
         n/vFM06/8/xATL/oBM+o13CJdLAqo1k9vCBmvlTBgZJWs14hznM0c/6cqbIQNVqNovo+
         O/wGdHqRNj45anOQ90LQekYG/QJcPlGz8vyJwrIw+//3OXtl3/rZM04BLZJgxLbrlnuQ
         sf5yL0UhgvkzOMNyOyoDpb0HbrXep91fe/p1d5bvfSHW07yKoguta7q/A2cd3HrtqcIf
         mqOJYb70J97TXEPP/mVpaDOedxOBnWmkL3/MpgepfsAsgb3fUoNqFvn4VSQlzNXIw92Q
         Ep5g==
X-Gm-Message-State: AOJu0Yyc5RuxAagNKy74ACCWePSqrFtR81Np2U6pf9ORoyJ8BjyJJonX
	Fb1pR/Z8bq5RFgdHimcqxz7NMSGSLAgOEgMa+RSGVsDeJ2yO6B2m+xYuL5seT96fWX1l18LWGsc
	5nZoq
X-Gm-Gg: ASbGncvAJLI9ViLyLiLW1qsAELcQrNbWSCleJ2tTgwA1YMa9xmXFvwukovICPqwtFbJ
	SvaKtyT9rps8+n7nCKAbeMqEnI0XCyDxVE6h74fHopWSCdC1B21F/SCmTCBoYAS1nOC4t7aRUUf
	G7ALdN/5WerO26YIjH5OiZ0Tb0dVSSTfHKqhrCCpNRKAHx2Xh7gsURFIKgJQJe8P9k7ad1oC/q/
	znjil7in855b8XJ1/ySz+gvwMlzO3Avvcb1kB32lN2T0BT2ED4kEpAcTK+QN/cBG6czJ4zj000R
	BKiTFDyoNuP2hOCrWUp4cH3iM/metCn3b+LBeVphv4BJaVXKZAMxAJmyI00lwf8h9MG9HnN0BZo
	ZVStEBcEC++S+AoBC2ljSLxuLmOmCGs33+e84QxeE2ykCgLUKq8vj06Yc
X-Google-Smtp-Source: AGHT+IH4fw2Rbj9pi/gThSSTe8oZcc1k+qJI7dKIbpU9O0r6tPUzRkf515c55Zd5tO/mci3Nv5ZAzQ==
X-Received: by 2002:a05:6a00:1492:b0:772:4319:e7df with SMTP id d2e1a72fcca58-793883da697mr30506505b3a.30.1760502154900;
        Tue, 14 Oct 2025 21:22:34 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:3282:6d6c:6f79:5d45:48d:1d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060c4esm17067760b3a.14.2025.10.14.21.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 21:22:34 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-devel@lists.openembedded.org
Cc: Yi Zhao <yi.zhao@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Vijay Anusuri <vanusuri@mvista.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/3] redis: upgrade 6.2.14 -> 6.2.16
Date: Wed, 15 Oct 2025 09:52:20 +0530
Message-Id: <20251015042222.121285-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Oct 2025 04:22:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120683

From: Yi Zhao <yi.zhao@windriver.com>

ChangeLog:

Security fixes
==============
* (CVE-2024-31449) Lua library commands may lead to stack overflow and
  potential RCE.
* (CVE-2024-31228) Potential Denial-of-service due to unbounded pattern
  matching.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f702405fe9c24f66e8bf38b8801cd7e87ddd2f55)
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 ...1-hiredis-use-default-CC-if-it-is-set.patch} | 14 +++++++-------
 ...file-to-use-environment-build-setting.patch} | 10 +++++-----
 ...0003-hack-to-force-use-of-libc-malloc.patch} |  9 ++++-----
 ...h => 0004-src-Do-not-reset-FINAL_LIBS.patch} |  8 ++++----
 ...URCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} |  6 ++----
 .../0006-Define-correct-gregs-for-RISCV32.patch | 12 +++++-------
 .../redis/redis/init-redis-server               |  0
 .../redis/{redis_6.2.14.bb => redis_6.2.16.bb}  | 17 +++++++++--------
 8 files changed, 36 insertions(+), 40 deletions(-)
 rename meta-oe/recipes-extended/redis/redis/{hiredis-use-default-CC-if-it-is-set.patch => 0001-hiredis-use-default-CC-if-it-is-set.patch} (85%)
 rename meta-oe/recipes-extended/redis/redis/{lua-update-Makefile-to-use-environment-build-setting.patch => 0002-lua-update-Makefile-to-use-environment-build-setting.patch} (93%)
 rename meta-oe/recipes-extended/redis/redis/{oe-use-libc-malloc.patch => 0003-hack-to-force-use-of-libc-malloc.patch} (92%)
 rename meta-oe/recipes-extended/redis/redis/{0001-src-Do-not-reset-FINAL_LIBS.patch => 0004-src-Do-not-reset-FINAL_LIBS.patch} (86%)
 rename meta-oe/recipes-extended/redis/redis/{GNU_SOURCE.patch => 0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch} (91%)
 mode change 100755 => 100644 meta-oe/recipes-extended/redis/redis/init-redis-server
 rename meta-oe/recipes-extended/redis/{redis_6.2.14.bb => redis_6.2.16.bb} (79%)

diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 85%
rename from meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
index d2a1b45e66..51a6e9c957 100644
--- a/meta-oe/recipes-extended/redis/redis/hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
@@ -1,11 +1,16 @@
-From dc745a33f3875cc72d41bd34ed490b352e546352 Mon Sep 17 00:00:00 2001
+From 67990f216f2fbbc8a6699c700dfc089aa617905f Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 Instead of trying to automagically figure out CC, which breaks with OE
 as CC has spaces in it, just skip it if one was already passed in.
 
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
 
 Update to work with 4.0.8
@@ -14,13 +19,11 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 Reworked for 6.0.4
 Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
 ---
-Upstream-Status: Pending
-
  deps/hiredis/Makefile | 2 --
  1 file changed, 2 deletions(-)
 
 diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index 25ac154..569f82b 100644
+index 7e41c97..54717e3 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
 @@ -42,8 +42,6 @@ endef
@@ -32,6 +35,3 @@ index 25ac154..569f82b 100644
  OPTIMIZATION?=-O3
  WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
  DEBUG_FLAGS?= -g -ggdb
--- 
-2.21.3
-
diff --git a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
index aade7afd06..17b533669b 100644
--- a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From 097a2b259cb266c2c861dc74fa6f80712d6138c5 Mon Sep 17 00:00:00 2001
+From ef989aab052510bfda32b2b325a5f80b76c42677 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -6,6 +6,8 @@ Subject: [PATCH] lua: update Makefile to use environment build settings
 OE-specific parameters, instead of overriding all of these simply use
 the ones that are already passed in. Also configure for only Linux...
 
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
 
 Updated to work with 3.0.x
@@ -15,18 +17,16 @@ Signed-off-by: Armin Kuster <akust808@gmail.com>
 updated to work wtih 6.2.1
 Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
-Upstream-Status: Pending
-
  deps/Makefile         |  1 -
  deps/lua/Makefile     |  1 -
  deps/lua/src/Makefile | 16 ++++++----------
  3 files changed, 6 insertions(+), 12 deletions(-)
 
 diff --git a/deps/Makefile b/deps/Makefile
-index ff16ee9..d8d64aa 100644
+index cbe3aef..76bc222 100644
 --- a/deps/Makefile
 +++ b/deps/Makefile
-@@ -74,7 +74,6 @@ LUA_LDFLAGS+= $(LDFLAGS)
+@@ -81,7 +81,6 @@ endif
  # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
  # challenging to cross-compile lua (and redis).  These defines make it easier
  # to fit redis into cross-compilation environments, which typically set AR.
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 92%
rename from meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
index e76bdbc263..f1021eef6c 100644
--- a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
@@ -1,4 +1,4 @@
-From 1fa047162983d4a7e0576f0837a73a6027a783bd Mon Sep 17 00:00:00 2001
+From b9586abcb803747301f6cc4ff93c7642bef693ea Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -9,19 +9,18 @@ removed in favor of magic.
 Note that this of course doesn't allow tcmalloc and jemalloc, however
 jemalloc wasn't building correctly.
 
+Upstream-Status: Pending
+
 Signed-off-by: Venture Research <tech@ventureresearch.com>
 
 Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
-
 ---
-Upstream-Status: Pending
-
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index ecd6929..c7f43c5 100644
+index 7d75c83..35dd314 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
diff --git a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 86%
rename from meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
index 66ab0ee33c..958106e261 100644
--- a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -1,4 +1,4 @@
-From 97584e1eb78dc18599534b47b6670c20c63f5ee2 Mon Sep 17 00:00:00 2001
+From a4d87aca1c00c53b386ee7490223971e00873add Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -9,17 +9,17 @@ environment to get it going
 e.g. -latomic is needed on clang/x86 to provide for 64bit atomics
 
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 5564351..83ccd76 100644
+index 35dd314..3770f96 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -91,7 +91,7 @@ endif
+@@ -93,7 +93,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
diff --git a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 91%
rename from meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
rename to meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index 20f689bd0b..d73c66c9d0 100644
--- a/meta-oe/recipes-extended/redis/redis/GNU_SOURCE.patch
+++ b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From 98d526f76049be21bf3d77158236b2189419a78e Mon Sep 17 00:00:00 2001
+From 2e6311c9c7cd85bf63eab8fe92c08ec1ec01b6fc Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -9,6 +9,7 @@ Fixes
 |       |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/zmalloc.c | 1 +
@@ -26,6 +27,3 @@ index 1f33d09..5e182d1 100644
  #include <stdio.h>
  #include <stdlib.h>
  #include <stdint.h>
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index 9d7e502717..bb3f5c607e 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,9 +1,10 @@
-From 26bd72f3b8de22e5036d86e6c79f815853b83473 Mon Sep 17 00:00:00 2001
+From 6149911f7a6fbaef3ed418408e2b501fa9479ffa Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
 
 Upstream-Status: Pending
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Updated patch for 6.2.1
@@ -13,10 +14,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index 5318c14..8c21b47 100644
+index bb76c5d..55a0696 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1055,7 +1055,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
+@@ -1067,7 +1067,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -27,7 +28,7 @@ index 5318c14..8c21b47 100644
      GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
      GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
-@@ -1222,8 +1224,28 @@ void logRegisters(ucontext_t *uc) {
+@@ -1234,8 +1236,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -57,6 +58,3 @@ index 5318c14..8c21b47 100644
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/init-redis-server b/meta-oe/recipes-extended/redis/redis/init-redis-server
old mode 100755
new mode 100644
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.14.bb b/meta-oe/recipes-extended/redis/redis_6.2.16.bb
similarity index 79%
rename from meta-oe/recipes-extended/redis/redis_6.2.14.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.16.bb
index fa430ce402..b5d53a2370 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.14.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.16.bb
@@ -10,19 +10,20 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://redis.conf \
            file://init-redis-server \
            file://redis.service \
-           file://hiredis-use-default-CC-if-it-is-set.patch \
-           file://lua-update-Makefile-to-use-environment-build-setting.patch \
-           file://oe-use-libc-malloc.patch \
-           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://GNU_SOURCE.patch \
+           file://0001-hiredis-use-default-CC-if-it-is-set.patch \
+           file://0002-lua-update-Makefile-to-use-environment-build-setting.patch \
+           file://0003-hack-to-force-use-of-libc-malloc.patch \
+           file://0004-src-Do-not-reset-FINAL_LIBS.patch \
+           file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
-           "
-SRC_URI[sha256sum] = "34e74856cbd66fdb3a684fb349d93961d8c7aa668b06f81fd93ff267d09bc277"
+          "
+
+SRC_URI[sha256sum] = "846bff83c26d827d49f8cc8114ea9d1e72eea1169f7de36b8135ea2cec104e7d"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
 FINAL_LIBS:x86:toolchain-clang = "-latomic"
-FINAL_LIBS:riscv32:toolchain-clang = "-latomic"
+FINAL_LIBS:riscv32 = "-latomic"
 FINAL_LIBS:mips = "-latomic"
 FINAL_LIBS:arm = "-latomic"
 FINAL_LIBS:powerpc = "-latomic"
-- 
2.25.1


