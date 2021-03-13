Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.2319.1615660250799937235
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Mar 2021 10:30:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y4Wezn/T;
 spf=pass (domain: gmail.com, ip: 209.85.216.53, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f53.google.com with SMTP id lr1-20020a17090b4b81b02900ea0a3f38c1so563150pjb.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 13 Mar 2021 10:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+0DbDrX+/gklLn6GcsMKCPPEjp4x+cerZBYT+HXOZjg=;
        b=Y4Wezn/Th1tZQEPa4eaVpnlOyt2eyJMQrdYTnix/3qFOgdNoKbRLUKTHso8FB3BzXB
         7PSG7XKwDAKFInKcD/sMZKYJri4RxjGz6XodBgbwAuZAQ7xlEUVK/MXgBdGESqTJWc3L
         uQLwtcFcSQxlf6TlV7F9C2c6BtK0/hL3fEyZyo9SEG7pcWuAvlh+q6v/o6w6Y3DPsDup
         xPKi0Snta1w6fcNPW2aDbCuGarqbt8XSOd9vON4neor4Nq2RtN5EX7eeApLWiol4wReJ
         fb0XPCKu29jVyCZnKAl22i0m+Xjx6hedsq5pGuZEjABaTGZfsZMpmjdewIMnxauSC11o
         5BVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+0DbDrX+/gklLn6GcsMKCPPEjp4x+cerZBYT+HXOZjg=;
        b=o+ql+/vMzFtHLjQjIb5VSmUmrFGzPXaMPrD/F8f8Is/rSFFr7SKUbFYa5aUiJveCpj
         2coqJfKKgdo/GVzgdBDof24Hd09HgeTzASj9TKYWcoJA0oytnStS0gQdbkX0lyOySh5x
         9EaN4Fz4poJJPPpD/x6zenyv98SxmmfycH74VaNZp3mfIfcu2GPmoP8KJ3rULpGOhlM4
         JPndJgHJZlPOUTf7eKxbBLwOkkzNKShgVflSw//bcOxTyriYR3l5CSfHFpu06GMKmDXK
         GsscZF9oQ9qvcUTfwKaRSxFuYtTnHH9ITJFArmky8oW34VWy4ntBgKZjUagInf2E7FT4
         v+bQ==
X-Gm-Message-State: AOAM531hU5VswRcl6qGradYg/9p0iNlKbD9WJTH/J+LFUgHIDg/NiG2K
	cOngvLgC1aHRJ/fMQZG4vUC1l8T04N4Xow==
X-Google-Smtp-Source: ABdhPJwjD8raebyuad+G/+jnNDJKoqw73pgmG0m46kozo8oI2sCaPvXfUs1QGjnthh+rJRir7XJFDg==
X-Received: by 2002:a17:90a:1696:: with SMTP id o22mr4671722pja.0.1615660249997;
        Sat, 13 Mar 2021 10:30:49 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::c2dd])
        by smtp.gmail.com with ESMTPSA id y7sm5915317pja.25.2021.03.13.10.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Mar 2021 10:30:49 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] abseil-cpp: Fix build on musl and ppc64
Date: Sat, 13 Mar 2021 10:30:46 -0800
Message-Id: <20210313183047.402000-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../abseil-cpp/abseil-ppc-fixes.patch         | 94 +++++++++++++++++++
 .../abseil-cpp/abseil-cpp_git.bb              |  1 +
 2 files changed, 95 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
new file mode 100644
index 0000000000..ee0c25473b
--- /dev/null
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp/abseil-ppc-fixes.patch
@@ -0,0 +1,94 @@
+An all-in-one patch that fixes several issues:
+
+1) UnscaledCycleClock not fully implemented for ppc*-musl (disabled on musl)
+2) powerpc stacktrace implementation only works on glibc (disabled on musl)
+3) powerpc stacktrace implementation has ppc64 assumptions (fixed)
+4) examine_stack.cpp makes glibc assumptions on powerpc (fixed)
+
+Sourced from void linux
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+--- a/absl/base/internal/unscaledcycleclock.cc
++++ b/absl/base/internal/unscaledcycleclock.cc
+@@ -20,7 +20,7 @@
+ #include <intrin.h>
+ #endif
+ 
+-#if defined(__powerpc__) || defined(__ppc__)
++#if (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
+ #ifdef __GLIBC__
+ #include <sys/platform/ppc.h>
+ #elif defined(__FreeBSD__)
+@@ -59,7 +59,7 @@ double UnscaledCycleClock::Frequency() {
+   return base_internal::NominalCPUFrequency();
+ }
+ 
+-#elif defined(__powerpc__) || defined(__ppc__)
++#elif (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
+ 
+ int64_t UnscaledCycleClock::Now() {
+ #ifdef __GLIBC__
+--- a/absl/base/internal/unscaledcycleclock.h
++++ b/absl/base/internal/unscaledcycleclock.h
+@@ -46,7 +46,7 @@
+ 
+ // The following platforms have an implementation of a hardware counter.
+ #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
+-  defined(__powerpc__) || defined(__ppc__) || \
++  ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
+   defined(_M_IX86) || defined(_M_X64)
+ #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
+ #else
+--- a/absl/debugging/internal/examine_stack.cc
++++ b/absl/debugging/internal/examine_stack.cc
+@@ -27,6 +27,10 @@
+ #include <csignal>
+ #include <cstdio>
+ 
++#if defined(__powerpc__)
++#include <asm/ptrace.h>
++#endif
++
+ #include "absl/base/attributes.h"
+ #include "absl/base/internal/raw_logging.h"
+ #include "absl/base/macros.h"
+@@ -55,8 +59,10 @@ void* GetProgramCounter(void* vuc) {
+     return reinterpret_cast<void*>(context->uc_mcontext.pc);
+ #elif defined(__powerpc64__)
+     return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
+-#elif defined(__powerpc__)
++#elif defined(__powerpc__) && defined(__GLIBC__)
+     return reinterpret_cast<void*>(context->uc_mcontext.regs->nip);
++#elif defined(__powerpc__)
++    return reinterpret_cast<void*>(((struct pt_regs *)context->uc_regs)->nip);
+ #elif defined(__riscv)
+     return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
+ #elif defined(__s390__) && !defined(__s390x__)
+--- a/absl/debugging/internal/stacktrace_config.h
++++ b/absl/debugging/internal/stacktrace_config.h
+@@ -64,7 +64,7 @@
+ #elif defined(__i386__) || defined(__x86_64__)
+ #define ABSL_STACKTRACE_INL_HEADER \
+   "absl/debugging/internal/stacktrace_x86-inl.inc"
+-#elif defined(__ppc__) || defined(__PPC__)
++#elif (defined(__ppc__) || defined(__PPC__)) && defined(__GLIBC__)
+ #define ABSL_STACKTRACE_INL_HEADER \
+   "absl/debugging/internal/stacktrace_powerpc-inl.inc"
+ #elif defined(__aarch64__)
+--- a/absl/debugging/internal/stacktrace_powerpc-inl.inc
++++ b/absl/debugging/internal/stacktrace_powerpc-inl.inc
+@@ -130,8 +130,13 @@ static void **NextStackFrame(void **old_
+         StacktracePowerPCGetLR(new_sp) == kernel_sigtramp_rt64_address) {
+       const ucontext_t* signal_context =
+           reinterpret_cast<const ucontext_t*>(uc);
++#if defined(__powerpc64__)
+       void **const sp_before_signal =
+           reinterpret_cast<void**>(signal_context->uc_mcontext.gp_regs[PT_R1]);
++#else
++      void **const sp_before_signal =
++          reinterpret_cast<void**>(signal_context->uc_mcontext.uc_regs->gregs[PT_R1]);
++#endif
+       // Check that alleged sp before signal is nonnull and is reasonably
+       // aligned.
+       if (sp_before_signal != nullptr &&
diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
index 6a1a029566..b944b3c15e 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_git.bb
@@ -13,6 +13,7 @@ BRANCH = "lts_2020_09_23"
 SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH}         \
            file://0001-absl-always-use-asm-sgidefs.h.patch             \
            file://0002-Remove-maes-option-from-cross-compilation.patch \
+           file://file://abseil-ppc-fixes.patch \
           "
 
 S = "${WORKDIR}/git"
-- 
2.30.2

