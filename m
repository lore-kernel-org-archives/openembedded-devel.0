Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09198CCFA04
	for <webhook@archiver.kernel.org>; Tue,  4 Nov 2025 19:34:54 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4593.1762284885202682959
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 04 Nov 2025 11:34:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c5KUIozo;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-294fd2ca6acso1489045ad.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 11:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762284884; x=1762889684; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SetUm5qSzwetbcgL0l1azxmCk+vNCHNodAlOTDwhor4=;
        b=c5KUIozoWzpeuLVdY3xyyPpHo1hbTIHST6+sPvsfcgEd5QJtdp5njQSmNWX4T2Tenm
         8mV6qpeyhH2BzusMyFZ8imkQe3lNQOZCoMHkq5PwvC+c5ySxMr/y87dcz1b4WeDUAGE2
         BYXGljtf5A8O+68KjgjWREFZI1LE4XjJVCxivhontQ4alWPTJ6rTOrHFmfJdYsigHrHN
         AOpkXS0xuQOV+u1pU+hbnBR/n/zPnWPJ/RFY5WVyF2zhMre/ykEcxMOni0Xvds59rtvr
         uECT4eatqPcXHT8EOfb0yN4HAAJ0a4cqT2bl280kYohtfIj69tJeh21DtJZHS6LYY5Dg
         Vbpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762284884; x=1762889684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SetUm5qSzwetbcgL0l1azxmCk+vNCHNodAlOTDwhor4=;
        b=Ok4UX0EVbVadxmjyLiAPGdh6R8FwBJKx+HM/ch5JgGEgCr47ckgqUcUZWh9R9zfn+/
         IJVwBvb9SoZTEGeKxFkSrpnuc7KyRdKa86snAEARiXKbRLypcHMxWEonMMdtdOK7bFJl
         jRbfdSfowJX2UMbna+pETIDNrAwUvyCXXFmQwPLAFB5iVj8r3XX3gFWqHe2mZB/5pGZ4
         z6wQ7X3/Sek1HBCB+P+yJsZTsbCvvtfiNsfQLaoDR4z9ZYWuaRc1gobsJQiro1tQt152
         7Zg2GnfAMlvxCjfsat0S/Z8/3uOAlTpCCqrv1bf2IRKFmJqkvrMEIALsK0HtbVN7DTMW
         y4UQ==
X-Gm-Message-State: AOJu0Yye1lgvvq0vFhzvaLqWkfgBf5n/lo0lScR+fHLd71ZyJkDm/FBO
	Fhno6ic3eluDEWn2woRsmxSsej9V3P9m7uPtuBOljlTSCVZzVXGGsyi6IMLkVUBz
X-Gm-Gg: ASbGncsT7phwwpn1usWsrnzBYENjkUH6wWCuWuFgBYirqGn0237QeMPnpaGUBFj1EkD
	/4FtNcTgr3P42YosfnyJf0nF9ggUzP8yz5NY6NJIJzq3Y3S4b44QBUsiQH2YxXjwf3caUvA0lyB
	/lqp5sGWLPIWVnT+lfn8195j1DnrnSQxvmBsihwBC8qeEicOxIzz4mPTYKJKQQWC+V80J6QsaaY
	3c9zIHk6wGyS88xIc73y07lei4V6k647NtFmsOCx+GhF2heuynWI/Gt7y5YywN/P7SpLMRCgC4i
	rQtlSnj4b0pFj2dZ9U9vtVb971u/LAHcZEAXx6wf5h8B5UP/vniEcDt+qFTr2klDV7H+V1QiERF
	PZyKA5GwSxNmdYmSnK/FsMxaWGrHdKxW0zlmE9fDp4I9yx8SFSWAWudrlCnsA5nanhk9wz/v96j
	WtCs5RcX4+5AdPXQ==
X-Google-Smtp-Source: AGHT+IGOr7WRGwTV0vRYVVYbNPnozfgLLhVUfsHOYTgXnNpthSatKUKiyTdx13tyOYFq+qtGQwClKQ==
X-Received: by 2002:a17:902:e88b:b0:282:2c52:508e with SMTP id d9443c01a7336-2962ad25f9amr9301575ad.8.1762284884093;
        Tue, 04 Nov 2025 11:34:44 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a5d202sm36120625ad.78.2025.11.04.11.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 11:34:43 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][PATCH 1/2] redis: upgrade 7.2.11 -> 7.2.12
Date: Wed,  5 Nov 2025 08:34:36 +1300
Message-ID: <20251104193437.1797870-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Nov 2025 19:34:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121303

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

and refresh patches

Changelog:
https://github.com/redis/redis/releases/tag/7.2.12

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../0001-hiredis-use-default-CC-if-it-is-set.patch     |  6 +++++-
 ...ate-Makefile-to-use-environment-build-setting.patch |  2 +-
 .../0003-hack-to-force-use-of-libc-malloc.patch        | 10 +++++-----
 .../0004-src-Do-not-reset-FINAL_LIBS.patch             | 10 +++++-----
 ...-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  2 +-
 .../0006-Define-correct-gregs-for-RISCV32.patch        |  2 +-
 .../{redis-7.2.11 => redis-7.2.12}/init-redis-server   |  0
 .../redis/{redis-7.2.11 => redis-7.2.12}/redis.conf    |  0
 .../redis/{redis-7.2.11 => redis-7.2.12}/redis.service |  0
 .../redis/{redis_7.2.11.bb => redis_7.2.12.bb}         |  2 +-
 10 files changed, 19 insertions(+), 15 deletions(-)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0001-hiredis-use-default-CC-if-it-is-set.patch (89%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0002-lua-update-Makefile-to-use-environment-build-setting.patch (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0003-hack-to-force-use-of-libc-malloc.patch (81%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0004-src-Do-not-reset-FINAL_LIBS.patch (74%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch (92%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/0006-Define-correct-gregs-for-RISCV32.patch (97%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/init-redis-server (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/redis.conf (100%)
 rename meta-oe/recipes-extended/redis/{redis-7.2.11 => redis-7.2.12}/redis.service (100%)
 rename meta-oe/recipes-extended/redis/{redis_7.2.11.bb => redis_7.2.12.bb} (97%)

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.12/0001-hiredis-use-default-CC-if-it-is-set.patch
similarity index 89%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/0001-hiredis-use-default-CC-if-it-is-set.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.12/0001-hiredis-use-default-CC-if-it-is-set.patch
index 63bf403412..99783ce237 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.11/0001-hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.12/0001-hiredis-use-default-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From af4fc632c03b2a68be4206b4896f27fc4bb865ae Mon Sep 17 00:00:00 2001
+From 2fec7733df9a6224875f3ecd3aaafc2857a546c0 Mon Sep 17 00:00:00 2001
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
 
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.12/0002-lua-update-Makefile-to-use-environment-build-setting.patch
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/0002-lua-update-Makefile-to-use-environment-build-setting.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.12/0002-lua-update-Makefile-to-use-environment-build-setting.patch
index 46330f5064..a3365043b5 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.11/0002-lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.12/0002-lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From 45ae5eb5c3482054073e06ab1a78e0aa9b96447f Mon Sep 17 00:00:00 2001
+From 71d92a24da61eab1e3697cc83ebc387b57bb6c3b Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.12/0003-hack-to-force-use-of-libc-malloc.patch
similarity index 81%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/0003-hack-to-force-use-of-libc-malloc.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.12/0003-hack-to-force-use-of-libc-malloc.patch
index 8991d2d9bc..4ab1ca0ca8 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.11/0003-hack-to-force-use-of-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.12/0003-hack-to-force-use-of-libc-malloc.patch
@@ -1,4 +1,4 @@
-From 7a98e3ac480413ce7db3a5edd5dc70458b921b29 Mon Sep 17 00:00:00 2001
+From 577335d0309c852d9f6099c255d5a80603fcbdb9 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -19,10 +19,10 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  src/Makefile | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: redis-7.2.10/src/Makefile
-===================================================================
---- redis-7.2.10.orig/src/Makefile
-+++ redis-7.2.10/src/Makefile
+diff --git a/src/Makefile b/src/Makefile
+index 6a87909..b8e0d44 100644
+--- a/src/Makefile
++++ b/src/Makefile
 @@ -13,7 +13,8 @@
  # Just use 'make dep', but this is only needed by developers.
  
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.12/0004-src-Do-not-reset-FINAL_LIBS.patch
similarity index 74%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/0004-src-Do-not-reset-FINAL_LIBS.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.12/0004-src-Do-not-reset-FINAL_LIBS.patch
index 0513138b4e..71044365af 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.11/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.12/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -1,4 +1,4 @@
-From 50fc46a12f6cf97e7b927d3ea29eecc9ebdea34d Mon Sep 17 00:00:00 2001
+From 225f45d5fbeaa8998fac983fcb78d7912d6d6dd3 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  src/Makefile | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-Index: redis-7.2.10/src/Makefile
-===================================================================
---- redis-7.2.10.orig/src/Makefile
-+++ redis-7.2.10/src/Makefile
+diff --git a/src/Makefile b/src/Makefile
+index b8e0d44..3a68fa6 100644
+--- a/src/Makefile
++++ b/src/Makefile
 @@ -122,7 +122,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.12/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
similarity index 92%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.12/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index 8e5f30993b..a45de28e0e 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.11/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.12/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From acd832d76002a1916b3128ac05bc0296425aea6d Mon Sep 17 00:00:00 2001
+From b636c748fb4047b1ef3a4062c675e1ee4584230b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.12/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/0006-Define-correct-gregs-for-RISCV32.patch
rename to meta-oe/recipes-extended/redis/redis-7.2.12/0006-Define-correct-gregs-for-RISCV32.patch
index 7009048171..bf44858d16 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.11/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.12/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From dd3ecb07bbf80b986b8f2c656ea11d1346e212f6 Mon Sep 17 00:00:00 2001
+From 8984a5df54fc80de1c99b311f117d28c2a42d959 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/init-redis-server b/meta-oe/recipes-extended/redis/redis-7.2.12/init-redis-server
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/init-redis-server
rename to meta-oe/recipes-extended/redis/redis-7.2.12/init-redis-server
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/redis.conf b/meta-oe/recipes-extended/redis/redis-7.2.12/redis.conf
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/redis.conf
rename to meta-oe/recipes-extended/redis/redis-7.2.12/redis.conf
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.11/redis.service b/meta-oe/recipes-extended/redis/redis-7.2.12/redis.service
similarity index 100%
rename from meta-oe/recipes-extended/redis/redis-7.2.11/redis.service
rename to meta-oe/recipes-extended/redis/redis-7.2.12/redis.service
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.11.bb b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
similarity index 97%
rename from meta-oe/recipes-extended/redis/redis_7.2.11.bb
rename to meta-oe/recipes-extended/redis/redis_7.2.12.bb
index 83cb4531d2..9016254731 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.11.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.12.bb
@@ -17,7 +17,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
           "
-SRC_URI[sha256sum] = "2f9886eca68d30114ad6a01da65631f8007d802fd3e6c9fac711251e6390323d"
+SRC_URI[sha256sum] = "97c60478a7c777ac914ca9d87a7e88ba265926456107e758c62d8f971d0196bc"
 
 RPROVIDES:${PN} = "virtual-redis"
 

