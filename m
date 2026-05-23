Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C54FCD5BB1
	for <webhook@archiver.kernel.org>; Sat, 23 May 2026 12:39:31 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7289.1779539963557083453
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 23 May 2026 05:39:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UZe8un6K;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-369576666d5so3888962a91.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 05:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779539963; x=1780144763; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dgvk5In/928sbk214YO/b1u9FffO8gh80h84fM65V/Q=;
        b=UZe8un6KqFRrsD4Ae0aHwCoY8uhkzZgzrsDMaW2Iu0uJUn+VDN6u/sL/HxZhzftbp7
         54oFffhO7EdwWNQHOXK61Or5prXQg1wKvnVcXpRVPlbRCPDTLxfJXkwgyyC+fSZacvLO
         kTqi3BubpT3+lRDX0m9Y7eMQkbBeYwmapgsRxDP7B+N9cbYduv9I43DE/4WmFFTUOhWh
         pDzRvmcJ4QAp+5H60j28DYH3unx77dLg7ZpMQJhLgpvRnD1/d3mPj1zXSBtUkcxQdUKG
         DRmHZjub+hnrp4HU4qhLumiEvmRWKOumNkHqKvQZYcdAOea9QkmChAiDn1EZt7JvYLlv
         0IaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779539963; x=1780144763;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dgvk5In/928sbk214YO/b1u9FffO8gh80h84fM65V/Q=;
        b=DdTgBXQ3SMxT0hUFnYSGr5Ta4voo4eenISn5id4lpc0+dMLecgBDd5OtRiq+IjFJjD
         PLm3fLMD0RhaPPaZiQs2NGeLVyUJu/KGOz93xTuMtSFDl8atXF/wyYc6wGfRcCYfDJl5
         1k79htdhseKv+3dvmdvDSS8rMdd22e/XfXZvZrlm54mYDFed1wDOPVzXjk2QKRqwk47S
         kX0HfEEJalmcVtTE2BTz07cwxM3bHtEQYHFJQLMJabX+s3fmXz1lFi+wHWZ/hHHU2rTx
         Hc2Aajv9ThpbB7/EhR6JAt6oeGMWbLIHKGiaP/n03WWm2LF/ybG3Qzi5W2HsihLzT0k9
         3Eng==
X-Gm-Message-State: AOJu0YypuLVTm5QbeAyOJsEKSO8exneN3Mwht+rqAx2Ud8lIQmOF1fEc
	mhhPAufpjaTAFm3KzonXwJd1leZF+xoULW1gLT1m5BTDi1nYGvbZGBGAdl4sgPpk
X-Gm-Gg: Acq92OHr8zdPgo0gR6VIZ2JUIFOCafuhsm52jjDZkDTgUrUrFSo4u+/GbbetIXL7zrM
	7jfR+pMOPTe2cp3qhx7m/976iFUgGIc1YQsZBEExelb+64IBbEBFWSYvrDmgQKV47Llx08Yn+X3
	ZIj7HHNBLaCSDN+MK0cavYTwt7Qx9omdvho4FMI1zYgFY6rLrahLeubKR0bhMzJaARgQVSg9Yt6
	zI06emPsCyxqzVvQXsbSOPeRBBhy3zLZPkJasXfBFWgIPj5l2QlgJP92/fgRBnVPtuH8+7eHlwr
	pI6IqDNSHXWpaFqChE5LfGIk6l4U/mTn3LlJle3rRLu/l3CYxl/m3WLyJB7wVq5ge4dy7f3RP45
	QKLqWpOa7AW4ucKlKe+ldJU8PAnpTfNC9O2zX2eJMotatd3zxGRFZd4ynCq0BV+qEiikmMD38+g
	0mYCh5v18ocj8PemGkV3x1GMc6EqSY5BKtv2fvAfDIEVHA9lI=
X-Received: by 2002:a17:903:1a27:b0:2b2:4b4e:e4d2 with SMTP id d9443c01a7336-2beb0758412mr79636555ad.15.1779539962684;
        Sat, 23 May 2026 05:39:22 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.105.153])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b3058sm46152515ad.39.2026.05.23.05.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 05:39:22 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 3/3] redis: upgrade 6.2.21 -> 6.2.22
Date: Sun, 24 May 2026 00:39:05 +1200
Message-ID: <20260523123907.2609140-3-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260523123907.2609140-1-ankur.tyagi85@gmail.com>
References: <20260523123907.2609140-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 May 2026 12:39:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127178

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Also refreshed patches to resolve patch fuzz QA issue.

Bug and security fix release
https://github.com/redis/redis/releases/tag/6.2.22

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch   | 12 ++++++++----
 ...e-Makefile-to-use-environment-build-setting.patch |  6 +++---
 .../0003-hack-to-force-use-of-libc-malloc.patch      |  8 ++++----
 .../redis/0004-src-Do-not-reset-FINAL_LIBS.patch     |  6 +++---
 ...GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch | 10 +++++-----
 .../0006-Define-correct-gregs-for-RISCV32.patch      |  8 ++++----
 .../redis/redis/CVE-2025-27151.patch                 |  2 +-
 .../redis/{redis_6.2.21.bb => redis_6.2.22.bb}       |  2 +-
 8 files changed, 29 insertions(+), 25 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis_6.2.21.bb => redis_6.2.22.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
index 035f533661..05fd3cb9ac 100644
--- a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From 61ae3e0277ac92323584bbe75ce79de6e030e84a Mon Sep 17 00:00:00 2001
+From 494ddfc9945d867409c22c5f1e5d2a33f257fc9f Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
@@ -10,6 +10,10 @@ MIME-Version: 1.0
 Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
 Instead of trying to automagically figure out CC, which breaks with OE
 as CC has spaces in it, just skip it if one was already passed in.
 
@@ -27,15 +31,15 @@ Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/deps/hiredis/Makefile b/deps/hiredis/Makefile
-index bd2106b..9ce768d 100644
+index 7e41c97..54717e3 100644
 --- a/deps/hiredis/Makefile
 +++ b/deps/hiredis/Makefile
-@@ -36,8 +36,6 @@ endef
+@@ -42,8 +42,6 @@ endef
  export REDIS_TEST_CONFIG
  
  # Fallback to gcc when $CC is not in $PATH.
 -CC:=$(shell sh -c 'type $${CC%% *} >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
 -CXX:=$(shell sh -c 'type $${CXX%% *} >/dev/null 2>/dev/null && echo $(CXX) || echo g++')
  OPTIMIZATION?=-O3
- WARNINGS=-Wall -Wextra -Werror -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
+ WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings -Wno-missing-field-initializers
  DEBUG_FLAGS?= -g -ggdb
diff --git a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
index c163aaae8b..580b196b76 100644
--- a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From a35a89981e28fb118efa86a798dacda826eb6f74 Mon Sep 17 00:00:00 2001
+From 31de6e24a299442a0b7808b2860af8984362f299 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -23,10 +23,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  3 files changed, 6 insertions(+), 12 deletions(-)
 
 diff --git a/deps/Makefile b/deps/Makefile
-index 3bf0363..fd8765a 100644
+index cbe3aef..76bc222 100644
 --- a/deps/Makefile
 +++ b/deps/Makefile
-@@ -94,7 +94,6 @@ endif
+@@ -81,7 +81,6 @@ endif
  # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
  # challenging to cross-compile lua (and redis).  These defines make it easier
  # to fit redis into cross-compilation environments, which typically set AR.
diff --git a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
index f142ff6ec2..59650654ce 100644
--- a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
@@ -1,4 +1,4 @@
-From a6246b17e94a2f7ad3560787a476b18aa7a45358 Mon Sep 17 00:00:00 2001
+From dc42b5043ef16122b005d360fc9b679c5da6b40b Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -20,7 +20,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 6a87909..b8e0d44 100644
+index 49335f0..5af2b48 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
@@ -31,5 +31,5 @@ index 6a87909..b8e0d44 100644
 +# use fake uname option to force use of generic libc
 +uname_S := "USE_LIBC_MALLOC"
  uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
- CLANG := $(findstring clang,$(shell sh -c '$(CC) --version | head -1'))
- OPTIMIZATION?=-O3
+ OPTIMIZATION?=-O2
+ DEPENDENCY_TARGETS=hiredis linenoise lua hdr_histogram
diff --git a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
index ecf8714d33..8ff16340ff 100644
--- a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -1,4 +1,4 @@
-From 1b59adad94137eedfbcddb27adae74b80b4e0909 Mon Sep 17 00:00:00 2001
+From e69dbf949fbc9d682fc21b3b22cfc23b9ddd9a0e Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index b8e0d44..3a68fa6 100644
+index 5af2b48..071798d 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -122,7 +122,7 @@ endif
+@@ -93,7 +93,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
diff --git a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index cd8fae4074..3694d94492 100644
--- a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
+++ b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From 5a58c573d486411a3a1585ca42bee70a661a983d Mon Sep 17 00:00:00 2001
+From 93b0eb691fa0208a10ca169483bb0d00cfcddcec Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
@@ -16,12 +16,12 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/src/zmalloc.c b/src/zmalloc.c
-index bbfa386..93e07ff 100644
+index 1f33d09..5e182d1 100644
 --- a/src/zmalloc.c
 +++ b/src/zmalloc.c
-@@ -32,6 +32,7 @@
- #include "config.h"
- #include "solarisfixes.h"
+@@ -28,6 +28,7 @@
+  * POSSIBILITY OF SUCH DAMAGE.
+  */
  
 +#define _GNU_SOURCE
  #include <stdio.h>
diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index dd44797437..8181747796 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From 8a16ff40b75671725e4bd92b50a5f083460e796b Mon Sep 17 00:00:00 2001
+From 5aef49d7f4e26009e4af408cd9a736b0394e69a2 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -14,10 +14,10 @@ Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
  1 file changed, 24 insertions(+), 2 deletions(-)
 
 diff --git a/src/debug.c b/src/debug.c
-index 684f692..2ee151f 100644
+index bb76c5d..55a0696 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -1215,7 +1215,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
+@@ -1067,7 +1067,9 @@ static void* getAndSetMcontextEip(ucontext_t *uc, void *eip) {
      #endif
  #elif defined(__linux__)
      /* Linux */
@@ -28,7 +28,7 @@ index 684f692..2ee151f 100644
      GET_SET_RETURN(uc->uc_mcontext.gregs[14], eip);
      #elif defined(__X86_64__) || defined(__x86_64__)
      GET_SET_RETURN(uc->uc_mcontext.gregs[16], eip);
-@@ -1401,8 +1403,28 @@ void logRegisters(ucontext_t *uc) {
+@@ -1234,8 +1236,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch b/meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch
index ccd56ea8a8..50b1e6768a 100644
--- a/meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2025-27151.patch
@@ -1,4 +1,4 @@
-From 845233cecd6327a20957a97b78e61bccaaa652f7 Mon Sep 17 00:00:00 2001
+From 4d985adf522f8c6bbe1e8d225f9d11cbee4bbc26 Mon Sep 17 00:00:00 2001
 From: YaacovHazan <yaacov.hazan@redis.com>
 Date: Tue, 27 May 2025 10:23:27 +0300
 Subject: [PATCH] Check length of AOF file name in redis-check-aof
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.21.bb b/meta-oe/recipes-extended/redis/redis_6.2.22.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_6.2.21.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.22.bb
index c47f51692d..01d461f55e 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.21.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.22.bb
@@ -19,7 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://CVE-2025-27151.patch \
            "
 
-SRC_URI[sha256sum] = "6383b32ba8d246f41bbbb83663381f5a5f4c4713235433cec22fc4a47e9b6d5f"
+SRC_URI[sha256sum] = "3ce191a727505b2d711bb45cfde8d9eeab1e061bdc0e5cb56a50201069a9729d"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 

