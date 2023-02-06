Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3902C636D6
	for <webhook@archiver.kernel.org>; Mon,  6 Feb 2023 03:26:01 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.45709.1675653955959838050
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Feb 2023 19:25:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=UYUNqqF/;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id j1so4516547pjd.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 19:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9h3IbTkiuNn8wx4+cgkTEok1t/0zTejGL3/fl9RQ/88=;
        b=UYUNqqF/I1jJDsKA7gwCDQNnq0Uf1/oeow8qWFWGT/YdLp1vlu4sdkJwT6vrFpVbxm
         J06837HOHTjgfUEpglviuZoDXw6Wp6DPhCfnUl2T+JA/qj2ivmJC676R3WqbJeSkPG0o
         QKte44nrUIeI+XdpZ6ten6ruC2CIWKX9r1amTcyctPrjbJqpeY0C39XrK9Opl8Hc20/s
         RCRz3yrm8H3o89QzExI4dV7LCMxgWIQOYfRlMQ4ItHaFtrI1saw2OxZUvZzdw+1lC8ur
         VUysw22l64+k3S1VGctjplFBIIghzs5HSUDay6r0IDt/5amCtEtlm93FU0YUiBMakZXt
         peyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9h3IbTkiuNn8wx4+cgkTEok1t/0zTejGL3/fl9RQ/88=;
        b=4orA+ncPyb+gayfVKxrhOjGcBjz9/qR+JUcfwM/bdWJ/Tpqhsd1gfAOHsGGHi+qX/i
         D9eXM+vvnR09jdq0LMLJl48c9E2wqicW/5ejNvpAtLMPiJyVyGkpVKB/kNxCWerNjU91
         hME66Jnia/OtfcQTKVGVNgLwAg5pksL3M9K75+phQBAmW+37yBpivtPEvTSwovEAm9ic
         GT2MYxqpzNuo4cqjtkVbFe9uk5lC6Lfowlhb6RYIgMITi9S5vPrTkxTecnmaMoMnsjRf
         Kfc43BbJsqU8uV3yakxRVXev1w6dqrleAdoE/BuXG/OXiPjYSHVgQbO9U+rBUouNZOmK
         uWUQ==
X-Gm-Message-State: AO0yUKXVlwLLlQfzk4vkP1eThmwhTDiEo/UUnlGcwpXWmbV8nKwQ3LKQ
	QlOhFVbkF+56CoBAH8EWxBIMt6K5eDE=
X-Google-Smtp-Source: AK7set/UoAwhtMrZhV4ZOMbl5PUnKJwL2I6O1iAxfjWAtcngg+OKfT2ko1p4/CNmX7Wh15XA+OUsCw==
X-Received: by 2002:a05:6a20:65a0:b0:bc:b8d:9eab with SMTP id p32-20020a056a2065a000b000bc0b8d9eabmr17612936pzh.24.1675653954789;
        Sun, 05 Feb 2023 19:25:54 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id x7-20020a056a000bc700b0059416691b64sm6037870pfu.19.2023.02.05.19.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 19:25:54 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-python][PATCH] python3-greenlet: Upgrade to 2.0.2
Date: Sun,  5 Feb 2023 19:25:52 -0800
Message-Id: <20230206032552.3682155-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Feb 2023 03:26:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100938

Drop backported patches as they are already in 2.0.2 release
Add a patch to cleanup register keyword usage

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Allocator-define-missing-rebind-type.patch |  56 ----
 ...ng-register-storage-class-keyword-ev.patch | 247 ++++++++++++++++++
 ...using-register-storage-class-keyword.patch |  31 ---
 ...let_2.0.1.bb => python3-greenlet_2.0.2.bb} |   6 +-
 4 files changed, 249 insertions(+), 91 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-greenlet/0001-PythonAllocator-define-missing-rebind-type.patch
 create mode 100644 meta-python/recipes-devtools/python/python3-greenlet/0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-greenlet/0001-greenlet-Drop-using-register-storage-class-keyword.patch
 rename meta-python/recipes-devtools/python/{python3-greenlet_2.0.1.bb => python3-greenlet_2.0.2.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet/0001-PythonAllocator-define-missing-rebind-type.patch b/meta-python/recipes-devtools/python/python3-greenlet/0001-PythonAllocator-define-missing-rebind-type.patch
deleted file mode 100644
index 01092025de..0000000000
--- a/meta-python/recipes-devtools/python/python3-greenlet/0001-PythonAllocator-define-missing-rebind-type.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 18fb84bb041072503b783ae03c5252f26d2216b8 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 29 Jan 2023 21:42:08 -0800
-Subject: [PATCH] PythonAllocator: define missing 'rebind' type
-
-`gcc-13` added an assert to standard headers to make sure custom
-allocators have intended implementation of rebind type instead
-of inherited rebind. gcc change:
-    https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=64c986b49558a7
-
-Without the fix build fails on this week's `gcc-13` as:
-
-| In file included from ../recipe-sysroot/usr/include/c++/13.0.1/ext/alloc_traits.h:34,
-|                  from ../recipe-sysroot/usr/include/c++/13.0.1/bits/basic_string.h:39,
-|                  from ../recipe-sysroot/usr/include/c++/13.0.1/string:54,
-|                  from src/greenlet/greenlet.cpp:10:
-| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h: In instantiation of 'struct std::__allocator_traits_base::__rebind<greenlet::PythonAllocator<_greenlet*>, _greenlet*, void>':
-| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h:94:11:   required by substitution of 'template<class _Alloc, class _Up> using std::__alloc_rebind = typename std::__allocator_traits_base::__rebind<_Alloc, _Up>::type [with _Alloc = greenlet::PythonAllocator<_greenlet*>; _Up = _greenlet*]'
-| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h:228:8:   required by substitution of 'template<class _Alloc> template<class _Tp> using std::allocator_traits< <template-parameter-1-1> >::rebind_alloc = std::__alloc_rebind<_Alloc, _Tp> [with _Tp = _greenlet*; _Alloc = greenlet::PythonAllocator<_greenlet*>]'
-| ../recipe-sysroot/usr/include/c++/13.0.1/ext/alloc_traits.h:126:65:   required from 'struct __gnu_cxx::__alloc_traits<greenlet::PythonAllocator<_greenlet*>, _greenlet*>::rebind<_greenlet*>'
-| ../recipe-sysroot/usr/include/c++/13.0.1/bits/stl_vector.h:88:21:   required from 'struct std::_Vector_base<_greenlet*, greenlet::PythonAllocator<_greenlet*> >'
-| ../recipe-sysroot/usr/include/c++/13.0.1/bits/stl_vector.h:423:11:   required from 'class std::vector<_greenlet*, greenlet::PythonAllocator<_greenlet*> >'
-| src/greenlet/greenlet_thread_state.hpp:115:16:   required from here
-| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h:70:31: error: static assertion failed: allocator_traits<A>::rebind_alloc<A::value_type> must be A
-|    70 |                         _Tp>::value,
-|       |                               ^~~~~
-| ../recipe-sysroot/usr/include/c++/13.0.1/bits/alloc_traits.h:70:31: note: 'std::integral_constant<bool, false>::value' evaluates to false
-
-The change adds trivial `rebind` definition with expected return type
-and satisfies conversion requirements.
-
-Upstream-Status: Submitted [https://github.com/python-greenlet/greenlet/pull/344]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/greenlet/greenlet_allocator.hpp | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/greenlet/greenlet_allocator.hpp b/src/greenlet/greenlet_allocator.hpp
-index 666307d..beaa7ed 100644
---- a/src/greenlet/greenlet_allocator.hpp
-+++ b/src/greenlet/greenlet_allocator.hpp
-@@ -32,6 +32,11 @@ namespace greenlet
- 
-         PythonAllocator() : std::allocator<T>() {}
- 
-+        template <class U> struct rebind
-+        {
-+            typedef PythonAllocator<U> other;
-+        };
-+
-         T* allocate(size_t number_objects, const void* UNUSED(hint)=0)
-         {
-             void* p;
--- 
-2.39.1
-
diff --git a/meta-python/recipes-devtools/python/python3-greenlet/0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch b/meta-python/recipes-devtools/python/python3-greenlet/0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch
new file mode 100644
index 0000000000..2a6ddd4726
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-greenlet/0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch
@@ -0,0 +1,247 @@
+From 74d8c5ecdc677a7a412c7f782fe8488a5d987333 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 5 Feb 2023 19:05:45 -0800
+Subject: [PATCH] cleanup: Drop using 'register' storage class keyword everywhere
+
+This has been dropped in c++17 and newer
+
+Upstream-Status: Submitted [https://github.com/python-greenlet/greenlet/pull/347]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/greenlet/platform/switch_alpha_unix.h    | 4 ++--
+ src/greenlet/platform/switch_arm32_gcc.h     | 2 +-
+ src/greenlet/platform/switch_arm32_ios.h     | 2 +-
+ src/greenlet/platform/switch_csky_gcc.h      | 2 +-
+ src/greenlet/platform/switch_mips_unix.h     | 4 ++--
+ src/greenlet/platform/switch_ppc64_aix.h     | 4 ++--
+ src/greenlet/platform/switch_ppc64_linux.h   | 4 ++--
+ src/greenlet/platform/switch_ppc_aix.h       | 4 ++--
+ src/greenlet/platform/switch_ppc_linux.h     | 4 ++--
+ src/greenlet/platform/switch_ppc_macosx.h    | 4 ++--
+ src/greenlet/platform/switch_ppc_unix.h      | 4 ++--
+ src/greenlet/platform/switch_s390_unix.h     | 4 ++--
+ src/greenlet/platform/switch_sparc_sun_gcc.h | 4 ++--
+ src/greenlet/platform/switch_x32_unix.h      | 4 ++--
+ src/greenlet/platform/switch_x86_unix.h      | 2 +-
+ 15 files changed, 26 insertions(+), 26 deletions(-)
+
+diff --git a/src/greenlet/platform/switch_alpha_unix.h b/src/greenlet/platform/switch_alpha_unix.h
+index 216619f..7e07abf 100644
+--- a/src/greenlet/platform/switch_alpha_unix.h
++++ b/src/greenlet/platform/switch_alpha_unix.h
+@@ -9,8 +9,8 @@
+ static int
+ slp_switch(void)
+ {
+-  register int ret;
+-  register long *stackref, stsizediff;
++  int ret;
++  long *stackref, stsizediff;
+   __asm__ volatile ("" : : : REGS_TO_SAVE);
+   __asm__ volatile ("mov $30, %0" : "=r" (stackref) : );
+   {
+diff --git a/src/greenlet/platform/switch_arm32_gcc.h b/src/greenlet/platform/switch_arm32_gcc.h
+index 035d6b9..655003a 100644
+--- a/src/greenlet/platform/switch_arm32_gcc.h
++++ b/src/greenlet/platform/switch_arm32_gcc.h
+@@ -56,7 +56,7 @@ __attribute__((optimize("no-omit-frame-pointer")))
+ slp_switch(void)
+ {
+         void *fp;
+-        register int *stackref, stsizediff;
++        int *stackref, stsizediff;
+         int result;
+         __asm__ volatile ("" : : : REGS_TO_SAVE);
+         __asm__ volatile ("mov r0," REG_FP "\n\tstr r0,%0" : "=m" (fp) : : "r0");
+diff --git a/src/greenlet/platform/switch_arm32_ios.h b/src/greenlet/platform/switch_arm32_ios.h
+index e993707..9e640e1 100644
+--- a/src/greenlet/platform/switch_arm32_ios.h
++++ b/src/greenlet/platform/switch_arm32_ios.h
+@@ -38,7 +38,7 @@ __attribute__((optimize("no-omit-frame-pointer")))
+ slp_switch(void)
+ {
+         void *fp;
+-        register int *stackref, stsizediff, result;
++        int *stackref, stsizediff, result;
+         __asm__ volatile ("" : : : REGS_TO_SAVE);
+         __asm__ volatile ("str " REG_FP ",%0" : "=m" (fp));
+         __asm__ ("mov %0," REG_SP : "=r" (stackref));
+diff --git a/src/greenlet/platform/switch_csky_gcc.h b/src/greenlet/platform/switch_csky_gcc.h
+index 7486b94..ac469d3 100644
+--- a/src/greenlet/platform/switch_csky_gcc.h
++++ b/src/greenlet/platform/switch_csky_gcc.h
+@@ -23,7 +23,7 @@ __attribute__((optimize("no-omit-frame-pointer")))
+ #endif
+ slp_switch(void)
+ {
+-        register int *stackref, stsizediff;
++        int *stackref, stsizediff;
+         int result;
+ 
+         __asm__ volatile ("" : : : REGS_TO_SAVE);
+diff --git a/src/greenlet/platform/switch_mips_unix.h b/src/greenlet/platform/switch_mips_unix.h
+index 1916b26..b9003e9 100644
+--- a/src/greenlet/platform/switch_mips_unix.h
++++ b/src/greenlet/platform/switch_mips_unix.h
+@@ -19,8 +19,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int err;
+-    register int *stackref, stsizediff;
++    int err;
++    int *stackref, stsizediff;
+ #ifdef __mips64
+     uint64_t gpsave;
+ #endif
+diff --git a/src/greenlet/platform/switch_ppc64_aix.h b/src/greenlet/platform/switch_ppc64_aix.h
+index e07b8de..e7e0b87 100644
+--- a/src/greenlet/platform/switch_ppc64_aix.h
++++ b/src/greenlet/platform/switch_ppc64_aix.h
+@@ -74,8 +74,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int err;
+-    register long *stackref, stsizediff;
++    int err;
++    long *stackref, stsizediff;
+     void * toc;
+     void * r30;
+     __asm__ volatile ("" : : : REGS_TO_SAVE);
+diff --git a/src/greenlet/platform/switch_ppc64_linux.h b/src/greenlet/platform/switch_ppc64_linux.h
+index 88e6847..3c324d0 100644
+--- a/src/greenlet/platform/switch_ppc64_linux.h
++++ b/src/greenlet/platform/switch_ppc64_linux.h
+@@ -76,8 +76,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int err;
+-    register long *stackref, stsizediff;
++    int err;
++    long *stackref, stsizediff;
+     void * toc;
+     void * r30;
+     __asm__ volatile ("" : : : REGS_TO_SAVE);
+diff --git a/src/greenlet/platform/switch_ppc_aix.h b/src/greenlet/platform/switch_ppc_aix.h
+index c7d476f..6d93c13 100644
+--- a/src/greenlet/platform/switch_ppc_aix.h
++++ b/src/greenlet/platform/switch_ppc_aix.h
+@@ -53,8 +53,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int err;
+-    register int *stackref, stsizediff;
++    int err;
++    int *stackref, stsizediff;
+     __asm__ volatile ("" : : : REGS_TO_SAVE);
+     __asm__ ("mr %0, 1" : "=r" (stackref) : );
+     {
+diff --git a/src/greenlet/platform/switch_ppc_linux.h b/src/greenlet/platform/switch_ppc_linux.h
+index 0a71255..e83ad70 100644
+--- a/src/greenlet/platform/switch_ppc_linux.h
++++ b/src/greenlet/platform/switch_ppc_linux.h
+@@ -49,8 +49,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int err;
+-    register int *stackref, stsizediff;
++    int err;
++    int *stackref, stsizediff;
+     __asm__ volatile ("" : : : REGS_TO_SAVE);
+     __asm__ ("mr %0, 1" : "=r" (stackref) : );
+     {
+diff --git a/src/greenlet/platform/switch_ppc_macosx.h b/src/greenlet/platform/switch_ppc_macosx.h
+index 56e573f..d6e5a03 100644
+--- a/src/greenlet/platform/switch_ppc_macosx.h
++++ b/src/greenlet/platform/switch_ppc_macosx.h
+@@ -46,8 +46,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int err;
+-    register int *stackref, stsizediff;
++    int err;
++    int *stackref, stsizediff;
+     __asm__ volatile ("" : : : REGS_TO_SAVE);
+     __asm__ ("; asm block 2\n\tmr %0, r1" : "=g" (stackref) : );
+     {
+diff --git a/src/greenlet/platform/switch_ppc_unix.h b/src/greenlet/platform/switch_ppc_unix.h
+index 2b3d307..ca590a5 100644
+--- a/src/greenlet/platform/switch_ppc_unix.h
++++ b/src/greenlet/platform/switch_ppc_unix.h
+@@ -47,8 +47,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int err;
+-    register int *stackref, stsizediff;
++    int err;
++    int *stackref, stsizediff;
+     __asm__ volatile ("" : : : REGS_TO_SAVE);
+     __asm__ ("mr %0, 1" : "=g" (stackref) : );
+     {
+diff --git a/src/greenlet/platform/switch_s390_unix.h b/src/greenlet/platform/switch_s390_unix.h
+index 6641854..9199367 100644
+--- a/src/greenlet/platform/switch_s390_unix.h
++++ b/src/greenlet/platform/switch_s390_unix.h
+@@ -36,8 +36,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int ret;
+-    register long *stackref, stsizediff;
++    int ret;
++    long *stackref, stsizediff;
+     __asm__ volatile ("" : : : REGS_TO_SAVE);
+ #ifdef __s390x__
+     __asm__ volatile ("lgr %0, 15" : "=r" (stackref) : );
+diff --git a/src/greenlet/platform/switch_sparc_sun_gcc.h b/src/greenlet/platform/switch_sparc_sun_gcc.h
+index 652b57f..96990c3 100644
+--- a/src/greenlet/platform/switch_sparc_sun_gcc.h
++++ b/src/greenlet/platform/switch_sparc_sun_gcc.h
+@@ -51,8 +51,8 @@
+ static int
+ slp_switch(void)
+ {
+-    register int err;
+-    register int *stackref, stsizediff;
++    int err;
++    int *stackref, stsizediff;
+ 
+     /* Put current stack pointer into stackref.
+      * Register spilling is done in save/restore.
+diff --git a/src/greenlet/platform/switch_x32_unix.h b/src/greenlet/platform/switch_x32_unix.h
+index cb14ec1..893369c 100644
+--- a/src/greenlet/platform/switch_x32_unix.h
++++ b/src/greenlet/platform/switch_x32_unix.h
+@@ -22,8 +22,8 @@ slp_switch(void)
+     void* ebx;
+     unsigned int csr;
+     unsigned short cw;
+-    register int err;
+-    register int *stackref, stsizediff;
++    int err;
++    int *stackref, stsizediff;
+     __asm__ volatile ("" : : : REGS_TO_SAVE);
+     __asm__ volatile ("fstcw %0" : "=m" (cw));
+     __asm__ volatile ("stmxcsr %0" : "=m" (csr));
+diff --git a/src/greenlet/platform/switch_x86_unix.h b/src/greenlet/platform/switch_x86_unix.h
+index 3a95186..493fa6b 100644
+--- a/src/greenlet/platform/switch_x86_unix.h
++++ b/src/greenlet/platform/switch_x86_unix.h
+@@ -51,7 +51,7 @@ slp_switch(void)
+ #endif
+     void *ebp, *ebx;
+     unsigned short cw;
+-    register int *stackref, stsizediff;
++    int *stackref, stsizediff;
+     __asm__ volatile ("" : : : "esi", "edi");
+     __asm__ volatile ("fstcw %0" : "=m" (cw));
+     __asm__ volatile ("movl %%ebp, %0" : "=m" (ebp));
+-- 
+2.39.1
+
diff --git a/meta-python/recipes-devtools/python/python3-greenlet/0001-greenlet-Drop-using-register-storage-class-keyword.patch b/meta-python/recipes-devtools/python/python3-greenlet/0001-greenlet-Drop-using-register-storage-class-keyword.patch
deleted file mode 100644
index 5abe59279f..0000000000
--- a/meta-python/recipes-devtools/python/python3-greenlet/0001-greenlet-Drop-using-register-storage-class-keyword.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From aa505359a3bb5a954fe3c7fbd853c75802bf3533 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 16 Jan 2023 21:37:26 -0800
-Subject: [PATCH] greenlet: Drop using 'register' storage class keyword
-
-This has been dropped in c++17 and newer
-
-Upstream-Status: Submitted [https://github.com/python-greenlet/greenlet/pull/336]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/greenlet/platform/switch_riscv_unix.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/greenlet/platform/switch_riscv_unix.h b/src/greenlet/platform/switch_riscv_unix.h
-index 5b5ea98..24df9db 100644
---- a/src/greenlet/platform/switch_riscv_unix.h
-+++ b/src/greenlet/platform/switch_riscv_unix.h
-@@ -11,8 +11,8 @@
- static int
- slp_switch(void)
- {
--  register int ret;
--  register long *stackref, stsizediff;
-+  int ret;
-+  long *stackref, stsizediff;
-   __asm__ volatile ("" : : : REGS_TO_SAVE);
-   __asm__ volatile ("mv %0, sp" : "=r" (stackref) : );
-   {
--- 
-2.39.0
-
diff --git a/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb b/meta-python/recipes-devtools/python/python3-greenlet_2.0.2.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_2.0.2.bb
index 90b5d140d5..a2e036a891 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_2.0.2.bb
@@ -4,9 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI += "file://0001-greenlet-Drop-using-register-storage-class-keyword.patch \
-            file://0001-PythonAllocator-define-missing-rebind-type.patch"
-
-SRC_URI[sha256sum] = "42e602564460da0e8ee67cb6d7236363ee5e131aa15943b6670e44e5c2ed0f67"
+SRC_URI += "file://0001-cleanup-Drop-using-register-storage-class-keyword-ev.patch"
+SRC_URI[sha256sum] = "e7c8dc13af7db097bed64a051d2dd49e9f0af495c26995c00a9ee842690d34c0"
 
 inherit pypi setuptools3
-- 
2.39.1


