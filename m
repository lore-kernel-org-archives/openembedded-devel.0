Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EF4DCCA476
	for <webhook@archiver.kernel.org>; Sun, 12 Oct 2025 01:22:47 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.11416.1760232158753764303
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Oct 2025 18:22:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hzLmzcU5;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-28a5b8b12a1so29436335ad.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Oct 2025 18:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760232158; x=1760836958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+7iY1oC0/xAy7XKcKQR/1Y3eHduXB2Wz1FXODgw1avs=;
        b=hzLmzcU55NCLrfIbtvuPI+ofOnOKcua84fvWv91qr0JnN8mOBTvftAgemcIJTwpENm
         C+pnay0BKDR3//M+FXeT3+Cd1ujkXvzgoeKBNtMbRJOzu58lnYaPRcbtYbVCx6gSfMyc
         jxRGtElSc2GqqiF8gQ3/s/SnNwl1XHnh+JmfcGLtAS1q2ZSMdQJ4VW4MYYFpZLD5NsSc
         uv+mpdjDSeUWhaW5MrPM1gzDJK3v4QbP/qLb7TcoZ4bS1XTWxLRZoo0XVj0zegz2luRG
         Njs2FvsFQ9Zns758y1xcfIJtkVH+d/Pa+eZiog6HuZmO7CGLgja9aDijRcMt3SCqigDp
         gX6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760232158; x=1760836958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+7iY1oC0/xAy7XKcKQR/1Y3eHduXB2Wz1FXODgw1avs=;
        b=eNFrNh9JrA/FrRiPr73fJMZDUsfPX5Gne70eELzLYQLiMO0B+d9bXZwswH478E/XSB
         fgWbG2SilOm3lpcy9ug4D2n97tfh5x3QC2wS4IRhz6wHkS9y5sM0L7pkMNUuRGZT1F0U
         W1tNCN6csfWlOkB5wgnIxorSOexzLcuaCwbBl2ciy8c+7/mORyruAusJ+0zywvElu7F1
         192Y+jT97UQ5OHuAer7drBZQDGVSjXIxe9K7ywObnfwUZ0SH0BUZT0r2YTCGKXH+LvH9
         qgrCTU6/s7u+xVqScjUCYTqLy4m+hPdPJESs2e7vuJ4m333aRI5bPjglv7d49+l7eUO0
         fSiA==
X-Gm-Message-State: AOJu0YyIeUktEfWph8UiQvDMhs1pbw+PVC8mj5vQQreUkj2GxjjYNEvH
	haM9CBixUVrECGNXMDWos0oVn+iDWjRxzEuc/lb0ZXF3E4q5wu9uZctFUv5l6A==
X-Gm-Gg: ASbGncuqks7yT49OHWQCJk5BP4CBBc3TWrkTfW0faiMBbB+XgVqhx32L4c36uhlYDQM
	7lCg4sOkTFxU4R9H3SlonS5aX1H6xZQ3vosaCrc6qPYTB25n+YPb1o5xV3qVByDa8kyYhggPPXq
	m+PaxvQIfFIhmR4uMXdCsBmU3fqavQiKLeR2atP3ox89w/knGS/D4Z4vCZxXRK8x2cDi4/wYjo5
	uwiRrhTpEROA5i0cyMJW9WXvwSnIwQXgVXFaj9fWsplEXgVqtRxhU2KojO7XgcGwR/REhl0NKQ2
	p+xts4Rzgv1x+kmSZKgV7WJPIAtexzsdYSjpLAaUpCtCwSNYVLXov6qDDHX/l3xpCZMt/lTCHQ2
	f8IX9WGrjv/+jZhQ6dk6D+k+fwVJjkwBta1UvckRVuMiamdgaw+KTEXRUZW/d1R3CfEkDWVc=
X-Google-Smtp-Source: AGHT+IHBX5wwaLokKekfuXtLk0Hid0lTX4woI2veYGYNy/PGIkPfN81/6/oYkyXJ8pW6HlaW5yGV1Q==
X-Received: by 2002:a17:903:1b44:b0:279:a5bb:54e2 with SMTP id d9443c01a7336-29027379a7dmr205121225ad.20.1760232157854;
        Sat, 11 Oct 2025 18:22:37 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([147.161.216.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f362fasm94541355ad.97.2025.10.11.18.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 18:22:37 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
X-Google-Original-From: Ankur Tyagi <ankur.tyagi@navicogroup.com>
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][walnascar][PATCH] redis: patch CVE-2025-49844
Date: Sun, 12 Oct 2025 14:22:26 +1300
Message-ID: <20251012012226.3314502-2-ankur.tyagi@navicogroup.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251012012226.3314502-1-ankur.tyagi@navicogroup.com>
References: <20251012012226.3314502-1-ankur.tyagi@navicogroup.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Oct 2025 01:22:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120517

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2025-49844

Also refreshed patches for v6.2.18

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 ...-hiredis-use-default-CC-if-it-is-set.patch |  2 +-
 ...ile-to-use-environment-build-setting.patch |  2 +-
 ...003-hack-to-force-use-of-libc-malloc.patch |  4 +-
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |  6 +--
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  2 +-
 ...006-Define-correct-gregs-for-RISCV32.patch |  2 +-
 ...pt-may-lead-to-remote-code-execution.patch | 37 +++++++++++++++++++
 ...-hiredis-use-default-CC-if-it-is-set.patch |  2 +-
 ...ile-to-use-environment-build-setting.patch |  2 +-
 ...003-hack-to-force-use-of-libc-malloc.patch |  4 +-
 .../0004-src-Do-not-reset-FINAL_LIBS.patch    |  4 +-
 ...RCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch |  2 +-
 ...006-Define-correct-gregs-for-RISCV32.patch |  6 +--
 ...pt-may-lead-to-remote-code-execution.patch | 37 +++++++++++++++++++
 .../recipes-extended/redis/redis_6.2.18.bb    |  1 +
 meta-oe/recipes-extended/redis/redis_7.2.8.bb |  1 +
 16 files changed, 95 insertions(+), 19 deletions(-)
 create mode 100644 meta-oe/recipes-extended/redis/redis-7.2.8/0007-Lua-script-may-lead-to-remote-code-execution.patch
 create mode 100644 meta-oe/recipes-extended/redis/redis/0007-Lua-script-may-lead-to-remote-code-execution.patch

diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch
index 63bf403412..6458830902 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0001-hiredis-use-default-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From af4fc632c03b2a68be4206b4896f27fc4bb865ae Mon Sep 17 00:00:00 2001
+From dd6c0b5b0570cefda981d35fe9100cb52c112b79 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch
index 46330f5064..7cb5bb294c 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0002-lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From 45ae5eb5c3482054073e06ab1a78e0aa9b96447f Mon Sep 17 00:00:00 2001
+From b6dadc6b094b7537bc7c4ae1ac598ffeca4c7cd6 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
index 1f97f9783d..ba8aa64b3e 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0003-hack-to-force-use-of-libc-malloc.patch
@@ -1,4 +1,4 @@
-From 7a98e3ac480413ce7db3a5edd5dc70458b921b29 Mon Sep 17 00:00:00 2001
+From 4cbd78f802be21e9673e1592965c0a40916c1691 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -20,7 +20,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index ecbd275..39decee 100644
+index 6a87909..b8e0d44 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
index 974cf5169f..69a2152574 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -1,4 +1,4 @@
-From 50fc46a12f6cf97e7b927d3ea29eecc9ebdea34d Mon Sep 17 00:00:00 2001
+From 6566cc4b3278c8cef57d7dc3c4f7ca06e2e46102 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -16,10 +16,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 39decee..f5efe82 100644
+index b8e0d44..3a68fa6 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -119,7 +119,7 @@ endif
+@@ -122,7 +122,7 @@ endif
  
  FINAL_CFLAGS=$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index 8e5f30993b..26da277960 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From acd832d76002a1916b3128ac05bc0296425aea6d Mon Sep 17 00:00:00 2001
+From e4cbb3e6844c8753afafc0e36fdc38313e525642 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch
index 7009048171..fb1f5380b3 100644
--- a/meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From dd3ecb07bbf80b986b8f2c656ea11d1346e212f6 Mon Sep 17 00:00:00 2001
+From b626206e156d245484689762b87f6a71cbd775b4 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
diff --git a/meta-oe/recipes-extended/redis/redis-7.2.8/0007-Lua-script-may-lead-to-remote-code-execution.patch b/meta-oe/recipes-extended/redis/redis-7.2.8/0007-Lua-script-may-lead-to-remote-code-execution.patch
new file mode 100644
index 0000000000..fc6da9483d
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis-7.2.8/0007-Lua-script-may-lead-to-remote-code-execution.patch
@@ -0,0 +1,37 @@
+From a631c8341ce635c32edf7dc5ba6144bde33d4527 Mon Sep 17 00:00:00 2001
+From: Mincho Paskalev <minchopaskal@gmail.com>
+Date: Mon, 23 Jun 2025 11:41:37 +0300
+Subject: [PATCH] Lua script may lead to remote code execution
+
+CVE: CVE-2025-49844
+Upstream-Status: Backport [https://github.com/redis/redis/commit/d5728cb5795c966c5b5b1e0f0ac576a7e69af539]
+
+(cherry picked from commit d5728cb5795c966c5b5b1e0f0ac576a7e69af539)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ deps/lua/src/lparser.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/deps/lua/src/lparser.c b/deps/lua/src/lparser.c
+index dda7488..ee7d90c 100644
+--- a/deps/lua/src/lparser.c
++++ b/deps/lua/src/lparser.c
+@@ -384,13 +384,17 @@ Proto *luaY_parser (lua_State *L, ZIO *z, Mbuffer *buff, const char *name) {
+   struct LexState lexstate;
+   struct FuncState funcstate;
+   lexstate.buff = buff;
+-  luaX_setinput(L, &lexstate, z, luaS_new(L, name));
++  TString *tname = luaS_new(L, name);
++  setsvalue2s(L, L->top, tname);
++  incr_top(L);
++  luaX_setinput(L, &lexstate, z, tname);
+   open_func(&lexstate, &funcstate);
+   funcstate.f->is_vararg = VARARG_ISVARARG;  /* main func. is always vararg */
+   luaX_next(&lexstate);  /* read first token */
+   chunk(&lexstate);
+   check(&lexstate, TK_EOS);
+   close_func(&lexstate);
++  --L->top;
+   lua_assert(funcstate.prev == NULL);
+   lua_assert(funcstate.f->nups == 0);
+   lua_assert(lexstate.fs == NULL);
diff --git a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
index 51a6e9c957..72d899485e 100644
--- a/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
+++ b/meta-oe/recipes-extended/redis/redis/0001-hiredis-use-default-CC-if-it-is-set.patch
@@ -1,4 +1,4 @@
-From 67990f216f2fbbc8a6699c700dfc089aa617905f Mon Sep 17 00:00:00 2001
+From 947efa7c62e4451f3893dab31457249993f9fcf0 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 17:39:52 -0600
 Subject: [PATCH] hiredis: use default CC if it is set
diff --git a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
index 17b533669b..56b5d5e7a1 100644
--- a/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/0002-lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From ef989aab052510bfda32b2b325a5f80b76c42677 Mon Sep 17 00:00:00 2001
+From 7d6127170dac332b5f14e53510d3c35f8c81a677 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
diff --git a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
index f1021eef6c..7e8c9bda80 100644
--- a/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/0003-hack-to-force-use-of-libc-malloc.patch
@@ -1,4 +1,4 @@
-From b9586abcb803747301f6cc4ff93c7642bef693ea Mon Sep 17 00:00:00 2001
+From 98f33d1b49c4ff1378a90f1b67b44c2a2bcbe6d1 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -20,7 +20,7 @@ Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 7d75c83..35dd314 100644
+index 49335f0..5af2b48 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
diff --git a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
index 958106e261..c0285c9627 100644
--- a/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
+++ b/meta-oe/recipes-extended/redis/redis/0004-src-Do-not-reset-FINAL_LIBS.patch
@@ -1,4 +1,4 @@
-From a4d87aca1c00c53b386ee7490223971e00873add Mon Sep 17 00:00:00 2001
+From ac93222e7b5e93aa187fc1ca1b9f160b5e29c80c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -16,7 +16,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 35dd314..3770f96 100644
+index 5af2b48..071798d 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -93,7 +93,7 @@ endif
diff --git a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
index d73c66c9d0..e543f46550 100644
--- a/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
+++ b/meta-oe/recipes-extended/redis/redis/0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch
@@ -1,4 +1,4 @@
-From 2e6311c9c7cd85bf63eab8fe92c08ec1ec01b6fc Mon Sep 17 00:00:00 2001
+From 4c9751247fc7273965790ea70d5073667de7f63d Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 21 Dec 2019 12:09:51 -0800
 Subject: [PATCH] Define _GNU_SOURCE to get PTHREAD_MUTEX_INITIALIZER
diff --git a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index bb3f5c607e..c17519b493 100644
--- a/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,4 +1,4 @@
-From 6149911f7a6fbaef3ed418408e2b501fa9479ffa Mon Sep 17 00:00:00 2001
+From ed5af1f409b4fce1bf9e88c478a6287d149be77c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 26 Oct 2020 21:32:22 -0700
 Subject: [PATCH] Define correct gregs for RISCV32
@@ -7,8 +7,8 @@ Upstream-Status: Pending
 
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Updated patch for 6.2.1
-Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+Updated patch for 6.2.8
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
 ---
  src/debug.c | 26 ++++++++++++++++++++++++--
  1 file changed, 24 insertions(+), 2 deletions(-)
diff --git a/meta-oe/recipes-extended/redis/redis/0007-Lua-script-may-lead-to-remote-code-execution.patch b/meta-oe/recipes-extended/redis/redis/0007-Lua-script-may-lead-to-remote-code-execution.patch
new file mode 100644
index 0000000000..9527d27805
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/0007-Lua-script-may-lead-to-remote-code-execution.patch
@@ -0,0 +1,37 @@
+From ab3294e02e06dd1e9b6cac232b8bf4482497a8c1 Mon Sep 17 00:00:00 2001
+From: Mincho Paskalev <minchopaskal@gmail.com>
+Date: Mon, 23 Jun 2025 11:41:37 +0300
+Subject: [PATCH] Lua script may lead to remote code execution
+
+CVE: CVE-2025-49844
+Upstream-Status: Backport [https://github.com/redis/redis/commit/d5728cb5795c966c5b5b1e0f0ac576a7e69af539]
+
+(cherry picked from commit d5728cb5795c966c5b5b1e0f0ac576a7e69af539)
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ deps/lua/src/lparser.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/deps/lua/src/lparser.c b/deps/lua/src/lparser.c
+index dda7488..ee7d90c 100644
+--- a/deps/lua/src/lparser.c
++++ b/deps/lua/src/lparser.c
+@@ -384,13 +384,17 @@ Proto *luaY_parser (lua_State *L, ZIO *z, Mbuffer *buff, const char *name) {
+   struct LexState lexstate;
+   struct FuncState funcstate;
+   lexstate.buff = buff;
+-  luaX_setinput(L, &lexstate, z, luaS_new(L, name));
++  TString *tname = luaS_new(L, name);
++  setsvalue2s(L, L->top, tname);
++  incr_top(L);
++  luaX_setinput(L, &lexstate, z, tname);
+   open_func(&lexstate, &funcstate);
+   funcstate.f->is_vararg = VARARG_ISVARARG;  /* main func. is always vararg */
+   luaX_next(&lexstate);  /* read first token */
+   chunk(&lexstate);
+   check(&lexstate, TK_EOS);
+   close_func(&lexstate);
++  --L->top;
+   lua_assert(funcstate.prev == NULL);
+   lua_assert(funcstate.f->nups == 0);
+   lua_assert(lexstate.fs == NULL);
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.18.bb b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
index 171c6640f2..7c572e2ff1 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.18.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.18.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://0007-Lua-script-may-lead-to-remote-code-execution.patch \
           "
 
 SRC_URI[sha256sum] = "470c75bac73d7390be4dd66479c6f29e86371c5d380ce0c7efb4ba2bbda3612d"
diff --git a/meta-oe/recipes-extended/redis/redis_7.2.8.bb b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
index 3c4d84085b..48d9efc73a 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.8.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.8.bb
@@ -16,6 +16,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://0004-src-Do-not-reset-FINAL_LIBS.patch \
            file://0005-Define-_GNU_SOURCE-to-get-PTHREAD_MUTEX_INITIALIZER.patch \
            file://0006-Define-correct-gregs-for-RISCV32.patch \
+           file://0007-Lua-script-may-lead-to-remote-code-execution.patch \
           "
 
 SRC_URI[sha256sum] = "6be4fdfcdb2e5ac91454438246d00842d2671f792673390e742dfcaf1bf01574"

