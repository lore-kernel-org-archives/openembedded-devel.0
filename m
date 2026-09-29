Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA99FCA5FAB
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 01:52:01 +0000 (UTC)
Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73807.1790646718751852842
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2026 18:51:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=rYt3JDjN;
 spf=pass (domain: gmail.com, ip: 74.125.229.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-34b223602d7so177572eec.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2026 18:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790646718; x=1791251518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xjO0/OnRSR0K9rZDRoGvg7Cqzf3XGrGqObt1v0xr+b4=;
        b=rYt3JDjNQdyI4FZ3JmAEV9WT4Xt1PKIJAW7fVUtlRWHYv2+FbqtYlBsVc7rC/YRGeW
         F/6Jstjz9bFmdCtv9eWImud4QWnbpTaLuOuQtQPmPKKCcD/57DJPglXrxtx6MhE4Whnt
         9unqX3MpTxAeflktatrr+i8SOmj0zMWMn36lNXISYTldJkkRRGHVHsL0+IDP9/x2oheS
         ECjHVN/0aRxAz4ve+1E21iFQm/tVyTr35Md6UhF38cem7lKA6babmnLAAs7byP25zy3A
         UNvG4B1KRNdt+AgyLvDRH3Azz7hubdihlJ7D1qNm0rqMWoKeu3v0uXLrf+K0qaOIEUED
         TCmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790646718; x=1791251518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xjO0/OnRSR0K9rZDRoGvg7Cqzf3XGrGqObt1v0xr+b4=;
        b=rKjFfTMqLpQEGuk1u98wiGLHCImw2gkEpYewHig2YQC82lAnskSoQwRKOqu9YXTItl
         E4p5tbxIkICpkaJkUCPpjuyxFKyXuV52yBn7AnTDqU36nqQp2vFjR4rQNAu4csqQfis7
         63AHjHKNVUtjhOTtvLJrQcIwFyGbuX4GzNokM1j+ke9M9XcMmCc/7Z+EltZ36aQxj7di
         eJRFaNUZA2f9rCd7MKS5JHcYTI2Ko8JNEJbq2F0sJ3TLRD7WlB57I+1JyRYhrPzEF9tC
         Hl49q2GUVQLVzLCtLBU54vRqnnAb7S7lkHMiM7hpleuI4mCpv9a8dtdIbqRUq7GP5fm4
         9stw==
X-Gm-Message-State: AFq9FYJ09PJqdEHiBZypbg6Web6euHzeIvOJMxrBZ0G+amVDia6RZcvQ
	hdNSDNnslE1RD/YAGez8i9VC5OKkldAnuSoQUL3mDO/uQEjjSmAGaiFMMkWgVjB/mK4=
X-Gm-Gg: AYBFou3r0KRIw1+K4KgJP190TtTUZvbM/MBHu+0t9wiRDSs37ubj/PhpKlWWV06GUyb
	Ltaig5l6HcoOt/Fon6hN6qWwAi95OKg/JgDO90He/Oys0gUT+G9NRXZTITgJoSNg591o9KGQboS
	wJKHDySLTzXxWlx5CZfLah5+Ix4Knf8pu7ys7tk2+3K6vx1GF3HWLViRW350kQV32rwz1f3Rulg
	LxcDGPuKa5bEYfZ3QTBoArYzV3d59LwnKQFoWv74b9akWn5I3Ln89+5veYLhhTLoYi/510ciOoP
	+Hkl1Go8NJN6d8F/Rfx/LQUTQTZDBUB/zGDEHvVlixPJpR9pskRVdfWIj63Ls0uGTRRm8L2ymTb
	lhdP/obFqnpjLLyhdkjom9GWw/P1IigpfjI2c49LG4Z6iNo5gPqpk4tnJeoWgCuBq/mo1RP2utk
	EwFROEgJGVfmELGlFjTIrOcHk+jZu/B4ftK4JziRZeO3ZEW1IBr4aTfLRQRvdXzqZMEtQTTrcVn
	sKNmszO8Inzgbo9hkWm4kaA4CBftsnwERyOng3tTUW+kVHGU08w3eKBm4iXPNUfz3KtZAsiIiYD
	gOmWx7fsfamaquZgR1/4HcOwbBnksaYp0N+NNPMOv6kihyy+6sVMRULIDGM4Whm6TOTKKBY/fzt
	4fM/1i3Vq2jGRbF6hItYi+fQK1+ABflrU5Ygfx6mzJBdcEkMDIIXXe6n908QxHn4cgBGUusa13u
	xCpBG8HOR75Q2RbXLD9Jn+OHkLhXRTola0C3ju8Q==
X-Received: by 2002:a05:7301:4281:b0:33c:1521:89aa with SMTP id 5a478bee46e88-34271a8deb8mr11094224eec.24.1790646717829;
        Mon, 28 Sep 2026 18:51:57 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34571658054sm12857924eec.8.2026.09.28.18.51.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 18:51:57 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH] tbb: Fix ptest build on musl
Date: Mon, 28 Sep 2026 18:51:54 -0700
Message-ID: <20260929015154.4032632-1-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Sep 2026 01:52:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130471

Two tests fail to compile on musl:

- conformance_resumable_tasks uses its own platform list instead of
  __TBB_RESUMABLE_TASKS, which the library leaves disabled on Linux
  without glibc, so tbb::task::suspend() is not declared.
- test_malloc_overload calls mallopt(), mallinfo() and pvalloc(), which
  are glibc extensions musl does not provide.

Guard both on what is actually available. All 142 tbb ptests pass in
meta-oe-image-ptest-tbb on qemux86-64 musl.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...mance_resumable_tasks-when-resumable.patch | 27 +++++++++
 ...load-Only-use-glibc-malloc-extension.patch | 57 +++++++++++++++++++
 meta-oe/recipes-support/tbb/tbb_2023.1.0.bb   |  2 +
 3 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-support/tbb/files/0001-test-Skip-conformance_resumable_tasks-when-resumable.patch
 create mode 100644 meta-oe/recipes-support/tbb/files/0002-test-malloc_overload-Only-use-glibc-malloc-extension.patch

diff --git a/meta-oe/recipes-support/tbb/files/0001-test-Skip-conformance_resumable_tasks-when-resumable.patch b/meta-oe/recipes-support/tbb/files/0001-test-Skip-conformance_resumable_tasks-when-resumable.patch
new file mode 100644
index 0000000000..ea36dc5b24
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/files/0001-test-Skip-conformance_resumable_tasks-when-resumable.patch
@@ -0,0 +1,27 @@
+From: Khem Raj <raj.khem@gmail.com>
+Subject: [PATCH] test: Skip conformance_resumable_tasks when resumable tasks are disabled
+
+The library only enables resumable tasks when __TBB_RESUMABLE_TASKS is
+set, which excludes Linux with a C library other than glibc (e.g. musl).
+test_resumable_tasks.cpp checks that macro, but the conformance test
+repeats an older list of platforms and fails to build on musl:
+
+  conformance_resumable_tasks.cpp:39:5: error: no member named 'suspend' in namespace 'tbb::task'
+
+Use __TBB_RESUMABLE_TASKS instead, keeping the WINAPI_FAMILY exclusion.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/test/conformance/conformance_resumable_tasks.cpp
++++ b/test/conformance/conformance_resumable_tasks.cpp
+@@ -17,8 +17,7 @@
+
+ #include "common/test.h"
+
+-#if (!__TBB_WIN8UI_SUPPORT && !defined(WINAPI_FAMILY) && !__ANDROID__ \
+-    && !__QNX__)
++#if __TBB_RESUMABLE_TASKS && !defined(WINAPI_FAMILY)
+
+ #include "oneapi/tbb/task.h"
+ #include "oneapi/tbb/task_group.h"
diff --git a/meta-oe/recipes-support/tbb/files/0002-test-malloc_overload-Only-use-glibc-malloc-extension.patch b/meta-oe/recipes-support/tbb/files/0002-test-malloc_overload-Only-use-glibc-malloc-extension.patch
new file mode 100644
index 0000000000..3675a68f2b
--- /dev/null
+++ b/meta-oe/recipes-support/tbb/files/0002-test-malloc_overload-Only-use-glibc-malloc-extension.patch
@@ -0,0 +1,57 @@
+From: Khem Raj <raj.khem@gmail.com>
+Subject: [PATCH] test: malloc_overload: Only use glibc malloc extensions where available
+
+mallopt(), mallinfo() and pvalloc() are GNU extensions that musl does not
+provide, so test_malloc_overload fails to build there:
+
+  test_malloc_overload.cpp:401:13: error: use of undeclared identifier 'mallopt'
+  test_malloc_overload.cpp:451:18: error: use of undeclared identifier 'pvalloc'; did you mean 'valloc'?
+  test_malloc_overload.cpp:466:21: error: variable has incomplete type 'struct mallinfo'
+
+Only test them on glibc (and Android for mallopt()/mallinfo()), matching
+the guard tbbmalloc_proxy already uses for its mallinfo() override.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+--- a/test/tbbmalloc/test_malloc_overload.cpp
++++ b/test/tbbmalloc/test_malloc_overload.cpp
+@@ -53,7 +53,9 @@
+ #endif
+
+ #define __TBB_POSIX_MEMALIGN_PRESENT (__unix__ && !__ANDROID__) || __APPLE__
+-#define __TBB_PVALLOC_PRESENT __unix__ && !__ANDROID__
++#define __TBB_PVALLOC_PRESENT __unix__ && !__ANDROID__ && __GLIBC__
++// mallopt() and mallinfo() are not provided by every C library, e.g. musl
++#define __TBB_MALLOPT_MALLINFO_PRESENT __unix__ && (__GLIBC__ || __ANDROID__)
+ #if __GLIBC__
+   // aligned_alloc available since GLIBC 2.16
+   #define __TBB_ALIGNED_ALLOC_PRESENT __GLIBC_PREREQ(2, 16)
+@@ -397,9 +399,9 @@
+ //! Testing tbbmalloc_proxy overload capabilities
+ //! \brief \ref error_guessing
+ TEST_CASE("Main set of tests") {
+-#if __unix__
++#if __TBB_MALLOPT_MALLINFO_PRESENT
+     REQUIRE(mallopt(0, 0)); // add dummy mallopt call for coverage
+-#endif // __unix__
++#endif // __TBB_MALLOPT_MALLINFO_PRESENT
+
+     void *ptr = nullptr;
+     utils::suppress_unused_warning(ptr); // for android
+@@ -456,6 +458,7 @@
+     CheckMemalignFuncOverload(aligned_alloc, free);
+ #endif
+
++#if __TBB_MALLOPT_MALLINFO_PRESENT
+ #if __INTEL_COMPILER
+    #pragma warning(push)
+    #pragma warning(disable: 1478)
+@@ -473,6 +476,7 @@
+     REQUIRE((!info.arena && !info.ordblks && !info.smblks && !info.hblks
+            && !info.hblkhd && !info.usmblks && !info.fsmblks
+            && !info.uordblks && !info.fordblks && !info.keepcost));
++#endif // __TBB_MALLOPT_MALLINFO_PRESENT
+
+  #if !__ANDROID__
+     // These non-standard functions are exported by GLIBC, and might be used
diff --git a/meta-oe/recipes-support/tbb/tbb_2023.1.0.bb b/meta-oe/recipes-support/tbb/tbb_2023.1.0.bb
index 8f48412fb6..08f6ddcfd2 100644
--- a/meta-oe/recipes-support/tbb/tbb_2023.1.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2023.1.0.bb
@@ -16,6 +16,8 @@ BRANCH = "onetbb_2023"
 SRCREV = "3046c8b0c29df995980003ea24f4d78c80ec0c8d"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
            file://run-ptest \
+           file://0001-test-Skip-conformance_resumable_tasks-when-resumable.patch \
+           file://0002-test-malloc_overload-Only-use-glibc-malloc-extension.patch \
           "

 LDFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-lld', ' -Wl,--undefined-version', '', d)}"

