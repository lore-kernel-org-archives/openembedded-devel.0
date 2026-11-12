Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6134.1794517677088387760
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 13:07:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eL/5ITuY;
 spf=pass (domain: gmail.com, ip: 74.125.82.45, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1438d9363fbso182402c88.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 13:07:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794517676; x=1795122476; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YCvS46DrJeXIKTFAwpqEJINUMpcfNVpLRUTU8KJ3iaI=;
        b=eL/5ITuYfy1F/mLhOvw9KRpKbRYkg6y40C/it95nvhDT8wcyYHK4UqEbsh355G4nvW
         ipVhj9s/4+mLyNKqzJd4eqmwH9Yx4oPhTtEu5Sgbq9WA+viTC85lwre+uulvAwNFk1/0
         2cV0RT6JtMh0bQSbMIglN2mQwP1jUWelubBWKZpMy5LtbF4U1NJMpLZQFY0pl3ED6Wet
         JURRmCFSq7eC/CF0pM/dTxdLLye61gCXiGGq79gzC+oo/WBtMj4UxJtzdIqC3ht5gmjL
         SZbK0RbQsi2RB5vrpZ6XFkt7St+AeLGEdMwgqVZvkYFQu7B86DT1XI7QQEi5BQ+C0rEs
         utXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794517676; x=1795122476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YCvS46DrJeXIKTFAwpqEJINUMpcfNVpLRUTU8KJ3iaI=;
        b=F23qFXGh8GTUvpDdaTi5SXVAi9kgibNmaBq2mzeGWrrZMReKa8stTxd26nrL/EgIO0
         UT91XRMeiW2eL0HwRbS4FDgbAVdSJ1FffI+pD//u1z8F4+QAI7dyvXs2sQgdcl1mBqjG
         gVpnAul4ZZN3JruHn5QMuXc9tq0j0L691dQM7IiFxwBPnZ7s3AYOm/8xarWQpXfwAH51
         ib3Su0imsPm7lBoRq8PeDddKmlwgp7b2Ae8kkl//cKU8cn8qbJChtpOBlM4OEjvt22GK
         VgDkc6Y29++E8Ev01dv8QglZdYphPcl9P0J1GrJC5uAoRNAoqCrDQjL8Fi5WUxCtaugX
         nEWA==
X-Gm-Message-State: APuU4Z82R/wNGuRPaYwnMtGRIY/+ylpYriv9LK/1CAaDlPqvoRMPfZjn
	RnK6VrVLs4/VrW+9VqSt5sT/ZCvqcjo1EX5VY5iJFW5USu5y2Hf9voG4G6fXddNx1tI=
X-Gm-Gg: AYBFou2h3iziADr83YOl7Z366HqwHU3W22O78BvCgNhu2sy8baQWPxyyLuqaKR6yUFJ
	nQBuGbQGFqkBj8Y+XBU13e/zhjDILqDSeE+j/gdDoQwdSVKG3eE1PLmAmblEMWSGaikYpnkwLwG
	FHaE33G6NJTOUzIZOZWtI+PiPKYCnVqVcW8dpfcUiD0NoL8WyNO2N4Nr+fCZ04H5gG64osnkk1N
	gZO/3n30PkOSa06ac8yTUve5QjAM1YilR5EyHhof/TUykNXfmQvQGcHHCLx2oA6/yNpXutoPIv5
	srs4qSdvyX+0E2/CoeP/fyeUuZC+LOPtbrAT1ICG84JH9KC8R+uji2h1apnBsEwIc2W0++82CJ7
	zsRllcGd8IzC3HR9+EInYXuOyRYZ5f53WTRt3ti4JR66dud3rLJEbdq7+a+GaU05SVOzs3lLsAo
	YGIZXZVW/aqkAlhJ5MqhjUKxCRlwhDK/b66ysKC5kfTv980l0qfOSiEdvBA/U0QGkP+zUHTQ7ee
	4KEFwPbqRpB+qGxL11AzZPmMMNxd1Qi6IsV16kPc99Y83ZCAuRDExWCA8Q5sFOVlpjYx51W+MDS
	2PjwBjV9g2H8S0RFFXIlwCnHyB9REgTWDkbblVKOsWXxzBqgDOiGeVbyys/ARkZSDdLIF1e6SoL
	F9JPPIump+XWenv925OIJbGYnXK62tkKAEUCbm1oAvkE6OGhjRv4oRY9Jmh91pATGC7zoZ8ECr+
	xiFQ9XQ0L/4aPHUSuz1ECR5B0nAPS+t0q+plQfLycN8n3sdxJ14DLFmQhABvO3/Y+qNZ3eTbj+R
	YRpl+jTWRBvXpQzP/b/tT8fEnJm7M+6treDp9soGo+H0UwZu7YP8oD2Q3el8q4zD/5WIIBXYgwK
	jwyw
X-Received: by 2002:a05:701b:4648:b0:1ad:1574:aa9d with SMTP id a92af1059eb24-1b502f8a3femr610962c88.0.1794517676243;
        Thu, 12 Nov 2026 13:07:56 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm1800274c88.5.2026.11.12.13.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 13:07:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/3] gperftools: Drop obsolete musl patches
Date: Thu, 12 Nov 2026 13:07:49 -0800
Message-ID: <20261112210749.875657-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112210749.875657-1-khem.raj@oss.qualcomm.com>
References: <20261112210749.875657-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 21:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132216
Content-Type: text/plain; charset="utf-8"

ppc-musl.patch no longer applies after the 2.19.3 upgrade, failing
do_patch on musl. Upstream fixed PT_NIP handling for non-glibc in
122d6e7885 and 17ff2e676b, and elf_mem_image.cc no longer uses
__WORDSIZE, so drop it and the elf_mem_image patch.

Replace the Makefile.am patch that stopped building the test programs
with the --disable-tests configure option added upstream.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...-elf_mem_image.cc-fix-build-for-musl.patch | 35 ----------
 ...sable-building-noinst-tests-for-musl.patch | 32 ---------
 .../gperftools/gperftools/ppc-musl.patch      | 65 -------------------
 .../gperftools/gperftools_2.19.3.bb           |  8 +--
 4 files changed, 2 insertions(+), 138 deletions(-)
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/0003-Makefile.am-disable-building-noinst-tests-for-musl.patch
 delete mode 100644 meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch

diff --git a/meta-oe/recipes-support/gperftools/gperftools/0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch
deleted file mode 100644
index eae71be8fc..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 02ff9fcc74ba64aeb22fcc553f30657bd2b62930 Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Wed, 26 Feb 2025 23:46:56 -0800
-Subject: [PATCH 2/3] src/base/elf_mem_image.cc: fix build for musl
-
-Include header file for musl to avoid error below:
-
-  error: '__WORDSIZE' was not declared in this scope
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/base/elf_mem_image.cc | 5 +++++
- 1 file changed, 5 insertions(+)
-
-diff --git a/src/base/elf_mem_image.cc b/src/base/elf_mem_image.cc
-index d2ca1a5..89dc0e4 100644
---- a/src/base/elf_mem_image.cc
-+++ b/src/base/elf_mem_image.cc
-@@ -38,6 +38,11 @@
- 
- #ifdef HAVE_ELF_MEM_IMAGE  // defined in elf_mem_image.h
- 
-+// for musl __WORDSIZE definition
-+#if !defined(__GLIBC__)
-+#include <sys/reg.h>
-+#endif
-+
- #include <stddef.h>   // for size_t, ptrdiff_t
- #include "base/logging.h"
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/0003-Makefile.am-disable-building-noinst-tests-for-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/0003-Makefile.am-disable-building-noinst-tests-for-musl.patch
deleted file mode 100644
index 01ecdd5336..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/0003-Makefile.am-disable-building-noinst-tests-for-musl.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 3bb5707c6a6a0d2061c79c556cbe4a87efea02ab Mon Sep 17 00:00:00 2001
-From: Chen Qi <Qi.Chen@windriver.com>
-Date: Thu, 27 Feb 2025 00:44:34 -0800
-Subject: [PATCH 3/3] Makefile.am: disable building noinst tests for musl
-
-Build fails for musl + qemuppc64 about ld failing to find
-symbols in libucontext. Until a real solution is found,
-we need this workaround.
-
-Upstream-Status: Inappropriate [OE Specific]
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Makefile.am b/Makefile.am
-index 9fa24c0..7dd1b60 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -938,7 +938,7 @@ endif WITH_HEAP_PROFILER_OR_CHECKER
- # This should always include $(TESTS), but may also include other
- # binaries that you compile but don't want automatically installed.
- # We'll add to this later, on a library-by-library basis
--noinst_PROGRAMS += $(TESTS)
-+#noinst_PROGRAMS += $(TESTS)
- 
- # http://linux.die.net/man/1/pkg-config, http://pkg-config.freedesktop.org/wiki
- pkgconfigdir = $(libdir)/pkgconfig
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch b/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
deleted file mode 100644
index e5061840bc..0000000000
--- a/meta-oe/recipes-support/gperftools/gperftools/ppc-musl.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 1526be49b8c49719459ef15c93090fdbdc10f3cb Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 13 Mar 2021 00:42:25 -0800
-Subject: [PATCH 1/3] Compatibility fixes for musl.
-
-Upstream-Status: Pending
-
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- src/getpc.h                        | 4 ++++
- src/stacktrace_powerpc-linux-inl.h | 8 ++++++--
- 2 files changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/src/getpc.h b/src/getpc.h
-index c14c9d0..cf4866b 100644
---- a/src/getpc.h
-+++ b/src/getpc.h
-@@ -61,6 +61,10 @@
- typedef ucontext ucontext_t;
- #endif
- 
-+#if defined(__powerpc__) && !defined(PT_NIP)
-+#define PT_NIP 32
-+#endif
-+
- namespace tcmalloc {
- namespace getpc {
- 
-diff --git a/src/stacktrace_powerpc-linux-inl.h b/src/stacktrace_powerpc-linux-inl.h
-index 883e7d2..212bd25 100644
---- a/src/stacktrace_powerpc-linux-inl.h
-+++ b/src/stacktrace_powerpc-linux-inl.h
-@@ -186,7 +186,7 @@ static int GET_STACK_TRACE_OR_FRAMES {
-           ucontext_t uc;
-         // We don't care about the rest, since the IP value is at 'uc' field.
-         } *sigframe = reinterpret_cast<signal_frame_64*>(current);
--        result[n] = (void*) sigframe->uc.uc_mcontext.gp_regs[PT_NIP];
-+        result[n] = (void*) sigframe->uc.uc_mcontext.gp_regs[32];
-       }
- #else
-       if (sigtramp32_vdso && (sigtramp32_vdso == current->return_addr)) {
-@@ -196,7 +196,7 @@ static int GET_STACK_TRACE_OR_FRAMES {
-           mcontext_t mctx;
-           // We don't care about the rest, since IP value is at 'mctx' field.
-         } *sigframe = reinterpret_cast<signal_frame_32*>(current);
--        result[n] = (void*) sigframe->mctx.gregs[PT_NIP];
-+        result[n] = (void*) sigframe->mctx.gregs[32];
-       } else if (sigtramp32_rt_vdso && (sigtramp32_rt_vdso == current->return_addr)) {
-         struct rt_signal_frame_32 {
-           char dummy[64 + 16];
-@@ -204,7 +204,11 @@ static int GET_STACK_TRACE_OR_FRAMES {
-           ucontext_t uc;
-           // We don't care about the rest, since IP value is at 'uc' field.A
-         } *sigframe = reinterpret_cast<rt_signal_frame_32*>(current);
-+#if defined(__GLIBC__)
-         result[n] = (void*) sigframe->uc.uc_mcontext.uc_regs->gregs[PT_NIP];
-+#else
-+        result[n] = (void*) sigframe->uc.uc_mcontext.gregs[32];
-+#endif
-       }
- #endif
- 
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-support/gperftools/gperftools_2.19.3.bb b/meta-oe/recipes-support/gperftools/gperftools_2.19.3.bb
index 82a038b464..22cb19c0bd 100644
--- a/meta-oe/recipes-support/gperftools/gperftools_2.19.3.bb
+++ b/meta-oe/recipes-support/gperftools/gperftools_2.19.3.bb
@@ -13,12 +13,6 @@ DEPENDS:append:libc-musl = " libucontext"
 SRCREV = "f21715726a385adba7ce3a9db2df6e18b5b6bc5c"
 SRC_URI = "git://github.com/gperftools/gperftools;branch=master;protocol=https;tag=gperftools-${PV}"
 
-SRC_URI:append:libc-musl = " \
-        file://ppc-musl.patch \
-        file://0002-src-base-elf_mem_image.cc-fix-build-for-musl.patch \
-        file://0003-Makefile.am-disable-building-noinst-tests-for-musl.patch \
-        "
-
 inherit autotools
 
 
@@ -36,6 +30,8 @@ COMPATIBLE_HOST:riscv32 = "null"
 ARM_INSTRUCTION_SET:armv5 = "arm"
 ARM_INSTRUCTION_SET:toolchain-clang:arm = "arm"
 
+# Test programs fail to link against libucontext on musl + ppc64
+EXTRA_OECONF:append:libc-musl = " --disable-tests"
 EXTRA_OECONF:append:libc-musl:powerpc64le = " --disable-cpu-profiler"
 EXTRA_OECONF:append:libc-musl:powerpc = " --disable-cpu-profiler"
 PACKAGECONFIG ?= "libunwind static"
