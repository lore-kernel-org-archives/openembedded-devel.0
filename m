Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF66CD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 12:39:21 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7288.1779539960745234336
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 May 2026 05:39:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=QABYV30F;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2bd9c3b550aso57742915ad.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779539960; x=1780144760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QSRqNezVxsBH1BFX6zuHajB5kAgDAn/Zik0SAauqNkM=;
        b=QABYV30FbzsWfsAb9qDtouVUkdks4SHqTpum+NF9FxGX4TEA0qVZEMJ/lLrz7zXBQ2
         P8gplRmdhwerOMSRmzL8M3ErbWzsQZm84rtrFOpiQ91p67QvD8VgF6hG2xApqhElJpeY
         WxCKOpQp3tG7lbcU/HHr867smLzoLZd904KYvjyDq5mPsvLxJmMsDyuGSFtO65+CgWB1
         SKmr90lWlUMwMkeqGDWHKARCxhKQd+pFvlxaKm2fNiJ/7Gz/xGluinHccxbvlYA4m1TP
         7tUXO6CtsDgw9hpfv/Idh7dDbY2lsCFJOw2PQ5i/h4Qw0R3YMpKzbhtLeK9bPNIRh2wB
         ORxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779539960; x=1780144760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QSRqNezVxsBH1BFX6zuHajB5kAgDAn/Zik0SAauqNkM=;
        b=Cjda23GsTOZHHKGr4lAO/1h23TkeAj9BrHhhqCPf5b6+jZ1ADWb/gJf4cCbfOe7HbW
         BUxaac6ry/WzEI9EHzkSiFG6FtSlC/lzpVGGab9ayH2EGMt35Plh/ysdObqRZJhzb6dE
         p3HcSxY3HJ6Hf6dMpk5fiGFP6fc1Wa2ldrRK+CzVMr+ZYHYo4M+vTAzKCICD9wyMxu42
         k001q2HN/VjSRqb7c+CiOhOOiLqsAgtX7KF5NW0MoY75Wr+HWaWlvSnCNsBRcu7k/u9/
         jOZFByV8Ut2X5L/pCLlJ9tuCWwmfJLNnlM1+vEVQJ206wYjUInw6kJBdJuwQa0HmvwPj
         Z6hA==
X-Gm-Message-State: AOJu0YzkP8uiUVaPfphJWH1c11aNumLDg6xGYHOmx6lggXwHME0gm/BS
	6SpN5Vdy3mi753tcvsHcJ8xez8w2oqjJ6/iv7FgOCDXq9hlr2gJq0xAhPVYoPhUn
X-Gm-Gg: Acq92OGuoTl1N/SzmujJVkAaCAE60QQ6vMCRU+vFwelMvlXAfonDmVJ47/CMq8inE/Z
	uy8eW58B5dn29asxZtiyk4ch7QpjKqCkE9KJDnh0OpYGQ7lanK82sAPRnwBIvOdDsVAXJI2P+8M
	sRp8Kh6qAVXhJbI7OSd0l6OOWy4UAvXzUz0PT4YT3PfAchMLAl+hxTXrIS8Zm5/7hKCiZKEdtJv
	YTerRcGfpkUJpCR5CAT7U9+LWWfmdaKtnE/uBMKoUFcrmqUIIaxXaUESCw8ygRJlvT4U2Q2DVlq
	QEh9YBKG7ux9DZ8BdxGPjaqkbz3IX9UdS+FORc4tBTKALHpeqe3flE6Q4lWtzr00KLoih7/S0WS
	qDNeVvEwkV+gFf4iM9WMSPSA0XKFsYmCX/ADDBN1salpKmaJHZdWzGXSEX22ekAO+HvEOEjRXsN
	rdhwHT65AE3u0t/YX2aCzG7S5fa4YPQergCpbu
X-Received: by 2002:a17:903:1aae:b0:2b9:5d1b:73da with SMTP id d9443c01a7336-2beb0741079mr85312405ad.30.1779539960075;
        Sat, 23 May 2026 05:39:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3058sm46152515ad.39.2026.05.23.05.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 05:39:19 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 2/3] redis: upgrade 7.2.12 -> 7.2.14
Date: Sun, 24 May 2026 00:39:04 +1200
Message-ID: <20260523123907.2609140-2-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523123907.2609140-1-ankur.tyagi85@gmail.com>
References: <20260523123907.2609140-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 12:39:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127177

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also refreshed patches to resolve patch fuzz QA issue.

Bug and security fix release
https://github.com/redis/redis/releases/tag/7.2.13
https://github.com/redis/redis/releases/tag/7.2.14

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch   | 12 ++++++++----
 ...e-Makefile-to-use-environment-build-setting.patch |  6 +++---
 .../0003-hack-to-force-use-of-libc-malloc.patch      |  8 ++++----
 .../redis/0004-src-Do-not-reset-FINAL_LIBS.patch     |  6 +++---
 ...GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 10 +++++-----
 .../0006-Define-correct-gregs-for-RISCV32.patch      |  8 ++++----
 .../redis/{redis_7.2.12.bb => redis_7.2.14.bb}       |  2 +-
 7 files changed, 28 insertions(+), 24 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_7.2.12.bb => redis_7.2.14.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
index 51a6e9c957..035f533661 100644
--- a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From 67990f216f2fbbc8a6699c700dfc089aa617905f Mon Sep 17 00:00:00 2001
+From 61ae3e0277ac92323584bbe75ce79de6e030e84a Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
@@ -6,6 +6,10 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Instead of trying to automagically figure out CC, which breaks with OE
 as CC has spaces in it, just skip it if one was already passed in.
 
@@ -23,15 +27,15 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index 7e41c97..54717e3 100644
+index bd2106b..9ce768d 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
-@@ -42,8 +42,6 @@ endef
+@@ -36,8 +36,6 @@ endef
  export REDIS_TEST_CONFIG
  
  # Fallback to gcc when $CC is not in $PATH.
 -CC:=$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
 -CXX:=$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
  OPTIMIZATION?=-O3
- WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
+ WARNINGS=-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
  DEBUG_FLAGS?= -g -ggdb
diff --git a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
index 17b533669b..c163aaae8b 100644
--- a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From ef989aab052510bfda32b2b325a5f80b76c42677 Mon Sep 17 00:00:00 2001
+From a35a89981e28fb118efa86a798dacda826eb6f74 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -23,10 +23,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  3 files changed, 6 insertions(+), 12 deletions(-)
 
 diff --git a/deps/Makefile b/deps/Makefile
-index cbe3aef..76bc222 100644
+index 3bf0363..fd8765a 100644
 --- a/deps/Makefile
 +++ b/deps/Makefile
-@@ -81,7 +81,6 @@ endif
+@@ -94,7 +94,6 @@ endif
  # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
  # challenging to cross-compile lua (and redis).  These defines make it easier
  # to fit redis into cross-compilation environments, which typically set AR.
diff --git a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
index f1021eef6c..f142ff6ec2 100644
--- a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
@@ -1,4 +1,4 @@
-From b9586abcb803747301f6cc4ff93c7642bef693ea Mon Sep 17 00:00:00 2001
+From a6246b17e94a2f7ad3560787a476b18aa7a45358 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -20,7 +20,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 7d75c83..35dd314 100644
+index 6a87909..b8e0d44 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
@@ -31,5 +31,5 @@ index 7d75c83..35dd314 100644
 +# use fake uname option to force use of generic libc
 +uname_S := "USE_LIBC_MALLOC"
  uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
- OPTIMIZATION?=-O2
- DEPENDENCY_TARGETS=hiredis linenoise lua hdr_histogram
+ CLANG := $(findstring clang,$(shell sh -c '$(CC) --version | head -1'))
+ OPTIMIZATION?=-O3
diff --git a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
index 958106e261..ecf8714d33 100644
--- a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -1,4 +1,4 @@
-From a4d87aca1c00c53b386ee7490223971e00873add Mon Sep 17 00:00:00 2001
+From 1b59adad94137eedfbcddb27adae74b80b4e0909 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 35dd314..3770f96 100644
+index b8e0d44..3a68fa6 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -93,7 +93,7 @@ endif
+@@ -122,7 +122,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
diff --git a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index d73c66c9d0..cd8fae4074 100644
--- a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
+++ b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From 2e6311c9c7cd85bf63eab8fe92c08ec1ec01b6fc Mon Sep 17 00:00:00 2001
+From 5a58c573d486411a3a1585ca42bee70a661a983d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -16,12 +16,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/zmalloc.c b/src/zmalloc.c
-index 1f33d09..5e182d1 100644
+index bbfa386..93e07ff 100644
 --- a/src/zmalloc.c
 +++ b/src/zmalloc.c
-@@ -28,6 +28,7 @@
-  * POSSIBILITY OF SUCH DAMAGE.
-  */
+@@ -32,6 +32,7 @@
+ #include "config.h"
+ #include "solarisfixes.h"
  
 +#define _GNU_SOURCE
  #include <stdio.h>
diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index bb3f5c607e..dd44797437 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From 6149911f7a6fbaef3ed418408e2b501fa9479ffa Mon Sep 17 00:00:00 2001
+From 8a16ff40b75671725e4bd92b50a5f083460e796b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -14,10 +14,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index bb76c5d..55a0696 100644
+index 684f692..2ee151f 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1067,7 +1067,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
+@@ -1215,7 +1215,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -28,7 +28,7 @@ index bb76c5d..55a0696 100644
      GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
      GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
-@@ -1234,8 +1236,28 @@ void logRegisters(ucontext_t *uc) {
+@@ -1401,8 +1403,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.12.bb b/meta-oe/recipes-extended/redis/redis_7.2.14.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_7.2.12.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.14.bb
index 2b4087a74b..93235e3707 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.12.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.14.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
-SRC_URI[sha256sum] = "97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d0196bc"
+SRC_URI[sha256sum] = "21326da3f66c0aead4c8204c0ac52ff905337a77cadd169f75ac22835ea30025"
 
 inherit autotools-brokensep pkgconfig update-rc.d systemd useradd
 

