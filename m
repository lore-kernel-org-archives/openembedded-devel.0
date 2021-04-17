Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web11.3587.1618693589785058636
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 17 Apr 2021 14:06:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=exjSb6T/;
 spf=pass (domain: gmail.com, ip: 209.85.210.169, mailfrom: akuster808@gmail.com)
Received: by mail-pf1-f169.google.com with SMTP id 10so11746397pfl.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 17 Apr 2021 14:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=XW6/AutI+Y62wynrF37AN8kJcg/Foma7EBqe5R0WKF0=;
        b=exjSb6T/K2n4k7zViOzQp5aJ4idRz6QHCOE8rSZPuNuejI0/h37xmOxNurkseO6tZW
         LJTJAJ8NEB1JURWyfdbFhRhnp9vO3bHeGYsbNYGBSYp70YKJ7ZybSlbfPxgnzKUF/SIF
         nYwoWYqWcXtefV5N/dbeDLJSz0fcMs2U/QzlpD5zGMLNlVyeoL0NoKx9AT5vkXUC0196
         +WssgMVF3dWUFaYp97EgMjD5zRBCJZUNk88u0FMoi5QC7/UfWgJgKXk78nkxbJS8qok6
         GkZsqikuFXNXbuMCaCtiFnCEYDvHiAjz/gVCYr8obzmGtG8MaeGXwkaQlXVnc4TbEAoY
         wLeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=XW6/AutI+Y62wynrF37AN8kJcg/Foma7EBqe5R0WKF0=;
        b=DyJp3t3S5+DyzjorWJjGMpflXfjGOvmu9zJvJOxy6K1O4usNF0YlbeoM/WMe/jcPeT
         hz77uPjBaw0zZJ3LvmyfEVye4voqJz2y2wixkTggg09FmTnhXEVA6+QtjXFMSxHg+4Mu
         7zOh/dvIIZTSHcF9ATd7O2sEvNdUJxpqmBMtpbWXT6lkEHn8oe6EajlogYsZ4cfvEjCv
         dCuPz36Lz/YkKITi2nT+ulO9C4N/roDek2eJKNuhhuYzYbh5nHtGzKpOQaIZGOIlrmPK
         RGP8BvD+Mqwnhsp8XxafLQG9w3V5oiw43u6Fs9E58Q8DLlQH4DGxOu/wWsU60Y/L25K+
         FPAQ==
X-Gm-Message-State: AOAM530OOZpcOGwq/Hqrhj2YjPJJ53Hnk9aWOWC9dI4eo3ku/Kgur//5
	hc9Qhaao04tsN/AMu0Z41WFvMi7Ep55Uhw==
X-Google-Smtp-Source: ABdhPJxGS5XHxrnlPAJe55Bu6bW/QuI0PRs1fCQu3rtFgiaCXXYe0KFQWewngMQfwEm6kLiRzn7NWg==
X-Received: by 2002:a63:4a0b:: with SMTP id x11mr4932131pga.8.1618693588967;
        Sat, 17 Apr 2021 14:06:28 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:7c7e:4cc5:a7d5:fd57])
        by smtp.gmail.com with ESMTPSA id t67sm8509204pfb.210.2021.04.17.14.06.28
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Apr 2021 14:06:28 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardnott 27/50] redis: upgrade 6.0.9 -> 6.2.1
Date: Sat, 17 Apr 2021 14:05:36 -0700
Message-Id: <34c6ad05d2b2cb6c3ddb7ca394d73ca8abcfad65.1618692905.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1618692905.git.akuster808@gmail.com>
References: <cover.1618692905.git.akuster808@gmail.com>

From: Yi Fan Yu <yifan.yu@windriver.com>

Refresh 3 patches.

Removed Patch:
ilp32.patch fixed by upstream 0719388cfb1a79160204314beb1de1f9c29a3684

Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 0c006765426bc41c1344e856528b499637574f97)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 ...06-Define-correct-gregs-for-RISCV32.patch} | 26 ++++++--
 .../recipes-extended/redis/redis/ilp32.patch  | 29 --------
 ...ile-to-use-environment-build-setting.patch | 66 ++++++++++---------
 .../redis/redis/oe-use-libc-malloc.patch      | 12 ++--
 .../redis/{redis_6.0.9.bb => redis_6.2.1.bb}  |  5 +-
 5 files changed, 62 insertions(+), 76 deletions(-)
 rename meta-oe/recipes-extended/redis/redis/{riscv32.patch => 0006-Define-correct-gregs-for-RISCV32.patch} (61%)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/ilp32.patch
 rename meta-oe/recipes-extended/redis/{redis_6.0.9.bb => redis_6.2.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/redis/redis/riscv32.patch b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
similarity index 61%
rename from meta-oe/recipes-extended/redis/redis/riscv32.patch
rename to meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
index 79ec7423da5..b2d1a32eda7 100644
--- a/meta-oe/recipes-extended/redis/redis/riscv32.patch
+++ b/meta-oe/recipes-extended/redis/redis/0006-Define-correct-gregs-for-RISCV32.patch
@@ -1,21 +1,33 @@
-Define correct gregs for RISCV32
+From 6134b471c35df826ccb41aab9a47e5c89e15a0c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 26 Oct 2020 21:32:22 -0700
+Subject: [PATCH] Define correct gregs for RISCV32
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Updated patch for 6.2.1
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
+---
+ src/debug.c | 26 ++++++++++++++++++++++++--
+ 1 file changed, 24 insertions(+), 2 deletions(-)
+
+diff --git a/src/debug.c b/src/debug.c
+index e7fec29..5abb404 100644
 --- a/src/debug.c
 +++ b/src/debug.c
-@@ -942,7 +942,9 @@ static void *getMcontextEip(ucontext_t *
+@@ -1039,7 +1039,9 @@ static void *getMcontextEip(ucontext_t *uc) {
      #endif
  #elif defined(__linux__)
      /* Linux */
--    #if defined(__i386__) || defined(__ILP32__)
+-    #if defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
 +    #if defined(__riscv) && __riscv_xlen == 32
 +    return (void*) uc->uc_mcontext.__gregs[REG_PC];
-+    #elif defined(__i386__) || defined(__ILP32__)
++    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
      return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
      #elif defined(__X86_64__) || defined(__x86_64__)
      return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1102,8 +1104,28 @@ void logRegisters(ucontext_t *uc) {
+@@ -1206,8 +1208,28 @@ void logRegisters(ucontext_t *uc) {
      #endif
  /* Linux */
  #elif defined(__linux__)
@@ -40,8 +52,8 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 +    );
 +    logStackContent((void**)uc->uc_mcontext.__gregs[REG_SP]);
      /* Linux x86 */
--    #if defined(__i386__) || defined(__ILP32__)
-+    #elif defined(__i386__) || defined(__ILP32__)
+-    #if defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
++    #elif defined(__i386__) || ((defined(__X86_64__) || defined(__x86_64__)) && defined(__ILP32__))
      serverLog(LL_WARNING,
      "\n"
      "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
diff --git a/meta-oe/recipes-extended/redis/redis/ilp32.patch b/meta-oe/recipes-extended/redis/redis/ilp32.patch
deleted file mode 100644
index 48d01a1d62d..00000000000
--- a/meta-oe/recipes-extended/redis/redis/ilp32.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-__ILP32__ is defined for all 32bit architectures with clang e.g.
-which is right but it is causing issues on non-x86 architectures
-where this condition becomes true and wrongly starts using this
-code, this issue is hidden with gcc becuase gcc does not define
-__ILP32__ for all 32bit architectures but for selected 64bit arches
-who choose to use 32bit ABI e.g. x32
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
---- a/src/debug.c
-+++ b/src/debug.c
-@@ -944,7 +944,7 @@ static void *getMcontextEip(ucontext_t *
-     /* Linux */
-     #if defined(__riscv) && __riscv_xlen == 32
-     return (void*) uc->uc_mcontext.__gregs[REG_PC];
--    #elif defined(__i386__) || defined(__ILP32__)
-+    #elif defined(__i386__) || (defined(__X86_64__) && defined(__ILP32__))
-     return (void*) uc->uc_mcontext.gregs[14]; /* Linux 32 */
-     #elif defined(__X86_64__) || defined(__x86_64__)
-     return (void*) uc->uc_mcontext.gregs[16]; /* Linux 64 */
-@@ -1125,7 +1125,7 @@ void logRegisters(ucontext_t *uc) {
-     );
-     logStackContent((void**)uc->uc_mcontext.__gregs[REG_SP]);
-     /* Linux x86 */
--    #elif defined(__i386__) || defined(__ILP32__)
-+    #elif defined(__i386__) || ( defined(__X86_64__) && defined(__ILP32__))
-     serverLog(LL_WARNING,
-     "\n"
-     "EAX:%08lx EBX:%08lx ECX:%08lx EDX:%08lx\n"
diff --git a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
index 7e62ae1316f..1619e9db352 100644
--- a/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
+++ b/meta-oe/recipes-extended/redis/redis/lua-update-Makefile-to-use-environment-build-setting.patch
@@ -1,4 +1,4 @@
-From 394108035d350ae662a431c80131f812b5f72dff Mon Sep 17 00:00:00 2001
+From 097a2b259cb266c2c861dc74fa6f80712d6138c5 Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Fri, 8 Feb 2013 20:22:19 -0600
 Subject: [PATCH] lua: update Makefile to use environment build settings
@@ -12,14 +12,42 @@ Updated to work with 3.0.x
 
 Signed-off-by: Armin Kuster <akust808@gmail.com>
 
+updated to work wtih 6.2.1
+Signed-off-by: Yi Fan Yu <yifan.yu@windriver.com>
 ---
- deps/lua/src/Makefile | 18 +++++++-----------
- 1 file changed, 7 insertions(+), 11 deletions(-)
+ deps/Makefile         |  1 -
+ deps/lua/Makefile     |  1 -
+ deps/lua/src/Makefile | 16 ++++++----------
+ 3 files changed, 6 insertions(+), 12 deletions(-)
 
-Index: redis-3.0.2/deps/lua/src/Makefile
-===================================================================
---- redis-3.0.2.orig/deps/lua/src/Makefile
-+++ redis-3.0.2/deps/lua/src/Makefile
+diff --git a/deps/Makefile b/deps/Makefile
+index ff16ee9..d8d64aa 100644
+--- a/deps/Makefile
++++ b/deps/Makefile
+@@ -74,7 +74,6 @@ LUA_LDFLAGS+= $(LDFLAGS)
+ # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
+ # challenging to cross-compile lua (and redis).  These defines make it easier
+ # to fit redis into cross-compilation environments, which typically set AR.
+-AR=ar
+ ARFLAGS=rc
+ 
+ lua: .make-prerequisites
+diff --git a/deps/lua/Makefile b/deps/lua/Makefile
+index 209a132..72f4b2b 100644
+--- a/deps/lua/Makefile
++++ b/deps/lua/Makefile
+@@ -33,7 +33,6 @@ INSTALL_DATA= $(INSTALL) -m 0644
+ 
+ # Utilities.
+ MKDIR= mkdir -p
+-RANLIB= ranlib
+ 
+ # == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========
+ 
+diff --git a/deps/lua/src/Makefile b/deps/lua/src/Makefile
+index f3bba2f..1555ec0 100644
+--- a/deps/lua/src/Makefile
++++ b/deps/lua/src/Makefile
 @@ -5,18 +5,14 @@
  # == CHANGE THE SETTINGS BELOW TO SUIT YOUR ENVIRONMENT =======================
  
@@ -45,27 +73,3 @@ Index: redis-3.0.2/deps/lua/src/Makefile
  
  # == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========
  
-Index: redis-3.0.2/deps/Makefile
-===================================================================
---- redis-3.0.2.orig/deps/Makefile
-+++ redis-3.0.2/deps/Makefile
-@@ -63,7 +63,6 @@ LUA_LDFLAGS+= $(LDFLAGS)
- # lua's Makefile defines AR="ar rcu", which is unusual, and makes it more
- # challenging to cross-compile lua (and redis).  These defines make it easier
- # to fit redis into cross-compilation environments, which typically set AR.
--AR=ar
- ARFLAGS=rcu
- 
- lua: .make-prerequisites
-Index: redis-3.0.2/deps/lua/Makefile
-===================================================================
---- redis-3.0.2.orig/deps/lua/Makefile
-+++ redis-3.0.2/deps/lua/Makefile
-@@ -33,7 +33,6 @@ INSTALL_DATA= $(INSTALL) -m 0644
- 
- # Utilities.
- MKDIR= mkdir -p
--RANLIB= ranlib
- 
- # == END OF USER SETTINGS. NO NEED TO CHANGE ANYTHING BELOW THIS LINE =========
- 
diff --git a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
index 6745f3d0e0a..a0f66b845e2 100644
--- a/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
+++ b/meta-oe/recipes-extended/redis/redis/oe-use-libc-malloc.patch
@@ -1,4 +1,4 @@
-From f8861d2129b9e18bba137705bfa38c6bd9be1790 Mon Sep 17 00:00:00 2001
+From 1fa047162983d4a7e0576f0837a73a6027a783bd Mon Sep 17 00:00:00 2001
 From: Venture Research <tech@ventureresearch.com>
 Date: Wed, 6 Feb 2013 20:51:02 -0600
 Subject: [PATCH] hack to force use of libc malloc
@@ -6,7 +6,7 @@ Subject: [PATCH] hack to force use of libc malloc
 Hack to force libc usage as it seems the option to pass it in has been
 removed in favor of magic.
 
-Note that this of course doesn't allow tcmalloc and jemalloc, however 
+Note that this of course doesn't allow tcmalloc and jemalloc, however
 jemalloc wasn't building correctly.
 
 Signed-off-by: Venture Research <tech@ventureresearch.com>
@@ -15,11 +15,11 @@ Update to work with 4.0.8
 Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
 
 ---
- src/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
+ src/Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/src/Makefile b/src/Makefile
-index 86e0b3fe..a810180b 100644
+index ecd6929..c7f43c5 100644
 --- a/src/Makefile
 +++ b/src/Makefile
 @@ -13,7 +13,8 @@
@@ -31,4 +31,4 @@ index 86e0b3fe..a810180b 100644
 +uname_S := "USE_LIBC_MALLOC"
  uname_M := $(shell sh -c 'uname -m 2>/dev/null || echo not')
  OPTIMIZATION?=-O2
- DEPENDENCY_TARGETS=hiredis linenoise lua
+ DEPENDENCY_TARGETS=hiredis linenoise lua hdr_histogram
diff --git a/meta-oe/recipes-extended/redis/redis_6.0.9.bb b/meta-oe/recipes-extended/redis/redis_6.2.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/redis/redis_6.0.9.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.1.bb
index 50571ed550b..89990df3de2 100644
--- a/meta-oe/recipes-extended/redis/redis_6.0.9.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.1.bb
@@ -15,10 +15,9 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://oe-use-libc-malloc.patch \
            file://0001-src-Do-not-reset-FINAL_LIBS.patch \
            file://GNU_SOURCE.patch \
-           file://riscv32.patch \
-           file://ilp32.patch \
+           file://0006-Define-correct-gregs-for-RISCV32.patch \
            "
-SRC_URI[sha256sum] = "dc2bdcf81c620e9f09cfd12e85d3bc631c897b2db7a55218fd8a65eaa37f86dd"
+SRC_URI[sha256sum] = "cd222505012cce20b25682fca931ec93bd21ae92cb4abfe742cf7b76aa907520"
 
 inherit autotools-brokensep update-rc.d systemd useradd
 
-- 
2.17.1

