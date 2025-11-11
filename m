Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7104DCCF9E3
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 04:31:35 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10090.1762835492742988663
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 20:31:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hw4qs0e1;
 spf=pass (domain: gmail.com, ip: 209.85.215.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b5a631b9c82so3115926a12.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 10 Nov 2025 20:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762835492; x=1763440292; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GHVvd7qeejxsZeJtYgCdhXofqXjmYmCmKDnfm4pqF8I=;
        b=hw4qs0e1p3qmRRiYnqAo2wNF3c3iuDDxrnnhHO8jvndyBiC2Wo5VUBdMUnI26Tl7PU
         8kCHPw0up3ws4yqF1IvUqZheE5NpXPz4p/d6GNOReQsG4rc0Bz2k1TajePC85kfimVkm
         KJ2QO/pd4AB+AtA53y4DetV+2ePDSP3xKq+9c+4U/4evCN90GNyc5YUhWkHK5cLT34XC
         Pa3n9uBSi/HdW5FFnZ3ggzT0Hp3DQTmV7arBCVJQ+XFE9+4K/HNDQEJ8t8/EqUN6oFSx
         1YwX7KDHloOAHiuXyDZQyj0JfOK1lQstwDYdMyd0U9BVjVs/7A0L2Q0tPx7nnRUURoIB
         tv6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762835492; x=1763440292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GHVvd7qeejxsZeJtYgCdhXofqXjmYmCmKDnfm4pqF8I=;
        b=P0UqKz8EIMzbSGClE2KJ0Xz3EOsIS6FA7EDibnZvlwa9vOBVn9XoEz8VPmc/5r5yYN
         Zb8idRdq+hgOheHw0RtZGKo39YlajxbBigW/B2jck/07MnOHYZTDvwfegrhPUPZ5wPWA
         LPm+VA9HbfOW0O1EvEXryfweTgZgpViCvynSdPBpAnBrx797S/3QXuT1aEvV1Vjiogak
         PpVS5JjN0VDl6WTCnrenR1B9k/VsP+vA0cahr9gwoxcDSvNbbqSfvsSCdhlgKpeKEV4y
         97mKxTFoICWGG+V5PMzZ9W1Q8YyI4EveC0wugb/s3nkvUwvBjtlPc3E667wsLj1PQI7N
         sC0g==
X-Gm-Message-State: AOJu0YxFOz4sbnMZweUgYrPXoxPmSkOTJIHLwRo9oWXpQ+8f5vsgSrpv
	uRpeZ8UXGH0x7yXw4XFruV5jVoRj4DaBTzrXRNVOoyza+Rf0PH7vxtVQbm79LMOCMgk=
X-Gm-Gg: ASbGncsywfzHhKjlmDWV0KtIjjRyEKrG9qa4ujLQhFFErm57Y21K/Ongmh5WbCAmc7V
	ScY+mXo5vGIc716mjv0bKDBb5wvbRWmnB1iv1NhKlZHkrTaR3Tqv5kATGY0KOswk/syrbTrJt6Y
	s6I0RCwOodax75JXFLTawWI1T4IiQamE9ty+0Cn+BjffsCjv5EDDiWs03q38UwR0cX8z82AUYWY
	hKM7MGwMVUG7B20uQugLqItuk5eFb8+PWBT2uxztsQwmSKGaXMNtnl8pRYAgfXpfEp6GCTF0Mvr
	L9HFYeQDukmzdaiRmPmS25d8s+eRSY4Z7NRJdkQC038i/+mj1DGPEWJ0LFgxjzE4cvX9MSW9AnK
	PF3hy5wuupFdkBIXy8D8WYUUPxf1GBLScaW57xQTZ1131G/f35hijQ0BaDqr21/7od8/5pfpv7B
	tCbm6xlBAGDyQ1bYrACyxFuQc369ZRHDOmlbGMRa3kEfY0snlsxYto5E8Gmhs8pq2On4SZOEsO
X-Google-Smtp-Source: AGHT+IFndfviYgSZNxF0RfeBnBxgxvOXMaurw23nisEBEOZTHFT0GPqH2G3iUd0kTi4ZC7PjCaeQ+A==
X-Received: by 2002:a17:902:e88f:b0:295:592e:7633 with SMTP id d9443c01a7336-297e56be211mr149769265ad.29.1762835491552;
        Mon, 10 Nov 2025 20:31:31 -0800 (PST)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::888a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651ca1b8csm167771415ad.85.2025.11.10.20.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 20:31:30 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/4] heaptrack: Update to latest tip of trunk
Date: Mon, 10 Nov 2025 20:31:24 -0800
Message-ID: <20251111043128.3063095-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 04:31:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121474

* It has cmake 4 fixes
* Drop all patches, they are no more needed
* Fix build with glibc-2.43/c23
* Enabled on riscv64, since libunwind now supports it

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-libheaptrack-Fix-build-on-c23.patch  |  47 +++++++
 ...heaptrack-Replace-__pid_t-with-pid_t.patch |  26 ----
 ...-unw_set_caching_policy-before-using.patch |  41 ------
 ...t-Include-dlfcn.h-for-dlopen-dlclose.patch |  38 ------
 ...d-Make-noexcept-attribute-conditiona.patch | 118 ------------------
 ...04-backtrace-Always-include-stdint.h.patch |  42 -------
 .../heaptrack/heaptrack_1.2.0.bb              |  63 ----------
 .../heaptrack/heaptrack_1.5.0.bb              |  33 +++++
 8 files changed, 80 insertions(+), 328 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libhe=
aptrack-Fix-build-on-c23.patch
 delete mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libhe=
aptrack-Replace-__pid_t-with-pid_t.patch
 delete mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0001-track=
-Check-for-unw_set_caching_policy-before-using.patch
 delete mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0002-heapt=
rack_inject-Include-dlfcn.h-for-dlopen-dlclose.patch
 delete mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0003-heapt=
rack_preload-Make-noexcept-attribute-conditiona.patch
 delete mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0004-backt=
race-Always-include-stdint.h.patch
 delete mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_1.5.0.bb

diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libheaptrack=
-Fix-build-on-c23.patch b/meta-oe/recipes-devtools/heaptrack/heaptrack/0001=
-libheaptrack-Fix-build-on-c23.patch
new file mode 100644
index 0000000000..67669e2811
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libheaptrack-Fix-bu=
ild-on-c23.patch
@@ -0,0 +1,47 @@
+From 5afb9b9267b59f60b53978858e21ec2369659de7 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 10 Nov 2025 18:53:38 -0800
+Subject: [PATCH] libheaptrack: Fix build on c23
+MIME-Version: 1.0
+Content-Type: text/plain; charset=3DUTF-8
+Content-Transfer-Encoding: 8bit
+
+C23/glibc is now including once_init in stdlib.h
+
+https://patchwork.sourceware.org/project/glibc/patch/78061085-f04a-0c45-10=
7b-5a8a15521083@redhat.com/#213088
+
+This is a name collision with the new C once_flag/call_once that
+glibc exposes (via <stdlib.h>) and C++=E2=80=99s std::once_flag/std::call_=
once
+
+Fixes
+../sources/heaptrack-1.5.0+git/src/track/libheaptrack.cpp:301:16: error: r=
eference to 'once_flag' is ambiguous
+  301 |         static once_flag once;
+      |                ^
+../recipe-sysroot/usr/include/bits/types/once_flag.h:24:21: note: candidat=
e found by name lookup is 'once_flag'
+   24 | typedef __once_flag once_flag;
+      |                     ^
+../recipe-sysroot/usr/lib/aarch64-yoe-linux/15.2.0/../../../include/c++/15=
.2.0/mutex:809:10: note: candidate found by name lookup is 'std::once_flag'
+  809 |   struct once_flag
+      |          ^
+
+Upstream-Status: Submitted [https://invent.kde.org/sdk/heaptrack/-/merge_r=
equests/56]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/track/libheaptrack.cpp | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/track/libheaptrack.cpp b/src/track/libheaptrack.cpp
+index 4be3dcd..f7576a2 100644
+--- a/src/track/libheaptrack.cpp
++++ b/src/track/libheaptrack.cpp
+@@ -298,8 +298,8 @@ public:
+         }
+
+         // do some once-only initializations
+-        static once_flag once;
+-        call_once(once, [] {
++        static std::once_flag once;
++        std::call_once(once, [] {
+             debugLog<MinimalOutput>("%s", "doing once-only initialization=
");
+
+             Trace::setup();
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libheaptrack=
-Replace-__pid_t-with-pid_t.patch b/meta-oe/recipes-devtools/heaptrack/heap=
track/0001-libheaptrack-Replace-__pid_t-with-pid_t.patch
deleted file mode 100644
index 9681086a52..0000000000
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libheaptrack-Replac=
e-__pid_t-with-pid_t.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 18671cd6028f996c138c6eb4282caf313f3fc605 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Nov 2020 15:25:18 -0800
-Subject: [PATCH] libheaptrack: Replace __pid_t with pid_t
-
-__pid_t is for internal libc use
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/track/libheaptrack.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/track/libheaptrack.cpp b/src/track/libheaptrack.cpp
-index e138bce..4120ecd 100644
---- a/src/track/libheaptrack.cpp
-+++ b/src/track/libheaptrack.cpp
-@@ -79,7 +79,7 @@ chrono::milliseconds elapsedTime()
-     return chrono::duration_cast<chrono::milliseconds>(clock::now() - sta=
rtTime());
- }
-
--__pid_t gettid()
-+pid_t gettid()
- {
-     return syscall(SYS_gettid);
- }
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-track-Check-=
for-unw_set_caching_policy-before-using.patch b/meta-oe/recipes-devtools/he=
aptrack/heaptrack/0001-track-Check-for-unw_set_caching_policy-before-using.=
patch
deleted file mode 100644
index a6547eded8..0000000000
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-track-Check-for-unw=
_set_caching_policy-before-using.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From bcfc4c8d7dc70bd81367c183a68cc9ee02ab4744 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 28 May 2021 17:52:57 -0700
-Subject: [PATCH] track: Check for unw_set_caching_policy before using
-
-llvm libunwind does not implement unw_cache_* functions yet
-Include inttypes.h got PRI* macros
-
-Upstream-Status: Submitted [https://github.com/KDE/heaptrack/pull/33]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/track/trace_libunwind.cpp | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/track/trace_libunwind.cpp b/src/track/trace_libunwind.cpp
-index c76337c..96b2176 100644
---- a/src/track/trace_libunwind.cpp
-+++ b/src/track/trace_libunwind.cpp
-@@ -26,6 +26,7 @@
-
- #define UNW_LOCAL_ONLY
- #include <libunwind.h>
-+#include <inttypes.h>
-
- #include <stdio.h>
-
-@@ -60,9 +61,11 @@ void Trace::print()
- void Trace::setup()
- {
-     // configure libunwind for better speed
-+#if UNW_CACHE_PER_THREAD
-     if (unw_set_caching_policy(unw_local_addr_space, UNW_CACHE_PER_THREAD=
)) {
-         fprintf(stderr, "WARNING: Failed to enable per-thread libunwind c=
aching.\n");
-     }
-+#endif
- #if LIBUNWIND_HAS_UNW_SET_CACHE_SIZE
-     if (unw_set_cache_size(unw_local_addr_space, 1024, 0)) {
-         fprintf(stderr, "WARNING: Failed to set libunwind cache size.\n");
---
-2.31.1
-
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0002-heaptrack_in=
ject-Include-dlfcn.h-for-dlopen-dlclose.patch b/meta-oe/recipes-devtools/he=
aptrack/heaptrack/0002-heaptrack_inject-Include-dlfcn.h-for-dlopen-dlclose.=
patch
deleted file mode 100644
index 5fa802cb38..0000000000
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack/0002-heaptrack_inject-In=
clude-dlfcn.h-for-dlopen-dlclose.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 8ebcf5f2dd27dbeb6c81e9c40a5d17916cb243e6 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Nov 2020 15:26:31 -0800
-Subject: [PATCH] heaptrack_inject: Include dlfcn.h for dlopen/dlclose
-
-Do not use __WORDSIZE which is for libc internal use
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/track/heaptrack_inject.cpp | 6 ++++--
- 1 file changed, 4 insertions(+), 2 deletions(-)
-
-diff --git a/src/track/heaptrack_inject.cpp b/src/track/heaptrack_inject.c=
pp
-index 325d87e..fb1c154 100644
---- a/src/track/heaptrack_inject.cpp
-+++ b/src/track/heaptrack_inject.cpp
-@@ -28,6 +28,7 @@
- #include <link.h>
- #include <malloc.h>
- #include <unistd.h>
-+#include <dlfcn.h>
-
- #include <sys/mman.h>
-
-@@ -39,9 +40,10 @@
-  * @brief Experimental support for symbol overloading after runtime injec=
tion.
-  */
-
--#if __WORDSIZE =3D=3D 64
-+#include <limits.h>
-+#if ULONG_MAX =3D=3D 0xffffffffffffffff
- #define ELF_R_SYM(i) ELF64_R_SYM(i)
--#elif __WORDSIZE =3D=3D 32
-+#elif ULONG_MAX =3D=3D 0xffffffff
- #define ELF_R_SYM(i) ELF32_R_SYM(i)
- #else
- #error unsupported word size
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0003-heaptrack_pr=
eload-Make-noexcept-attribute-conditiona.patch b/meta-oe/recipes-devtools/h=
eaptrack/heaptrack/0003-heaptrack_preload-Make-noexcept-attribute-condition=
a.patch
deleted file mode 100644
index c3c852e39e..0000000000
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack/0003-heaptrack_preload-M=
ake-noexcept-attribute-conditiona.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From b8435c6523d9377f04d5e21629f3dc68b8865016 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Nov 2020 15:31:45 -0800
-Subject: [PATCH] heaptrack_preload: Make noexcept attribute conditional
-
-musl does not define these functions with noexcept and hence compiler
-complains about them
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/track/heaptrack_preload.cpp | 26 ++++++++++++++++----------
- 1 file changed, 16 insertions(+), 10 deletions(-)
-
-diff --git a/src/track/heaptrack_preload.cpp b/src/track/heaptrack_preload=
.cpp
-index 63110ce..ee85331 100644
---- a/src/track/heaptrack_preload.cpp
-+++ b/src/track/heaptrack_preload.cpp
-@@ -171,11 +171,17 @@ void init()
- }
- }
-
-+#ifdef __GLIBC__
-+#define NOEXECPT noexcept
-+#else
-+#define NOEXECPT
-+#endif
-+
- extern "C" {
-
- /// TODO: memalign, pvalloc, ...?
-
--void* malloc(size_t size) noexcept
-+void* malloc(size_t size) NOEXECPT
- {
-     if (!hooks::malloc) {
-         hooks::init();
-@@ -186,7 +192,7 @@ void* malloc(size_t size) noexcept
-     return ptr;
- }
-
--void free(void* ptr) noexcept
-+void free(void* ptr) NOEXECPT
- {
-     if (!hooks::free) {
-         hooks::init();
-@@ -204,7 +210,7 @@ void free(void* ptr) noexcept
-     hooks::free(ptr);
- }
-
--void* realloc(void* ptr, size_t size) noexcept
-+void* realloc(void* ptr, size_t size) NOEXECPT
- {
-     if (!hooks::realloc) {
-         hooks::init();
-@@ -219,7 +225,7 @@ void* realloc(void* ptr, size_t size) noexcept
-     return ret;
- }
-
--void* calloc(size_t num, size_t size) noexcept
-+void* calloc(size_t num, size_t size) NOEXECPT
- {
-     if (!hooks::calloc) {
-         hooks::init();
-@@ -235,7 +241,7 @@ void* calloc(size_t num, size_t size) noexcept
- }
-
- #if HAVE_CFREE
--void cfree(void* ptr) noexcept
-+void cfree(void* ptr) NOEXECPT
- {
-     if (!hooks::cfree) {
-         hooks::init();
-@@ -252,7 +258,7 @@ void cfree(void* ptr) noexcept
- }
- #endif
-
--int posix_memalign(void** memptr, size_t alignment, size_t size) noexcept
-+int posix_memalign(void** memptr, size_t alignment, size_t size) NOEXECPT
- {
-     if (!hooks::posix_memalign) {
-         hooks::init();
-@@ -268,7 +274,7 @@ int posix_memalign(void** memptr, size_t alignment, si=
ze_t size) noexcept
- }
-
- #if HAVE_ALIGNED_ALLOC
--void* aligned_alloc(size_t alignment, size_t size) noexcept
-+void* aligned_alloc(size_t alignment, size_t size) NOEXECPT
- {
-     if (!hooks::aligned_alloc) {
-         hooks::init();
-@@ -285,7 +291,7 @@ void* aligned_alloc(size_t alignment, size_t size) noe=
xcept
- #endif
-
- #if HAVE_VALLOC
--void* valloc(size_t size) noexcept
-+void* valloc(size_t size) NOEXECPT
- {
-     if (!hooks::valloc) {
-         hooks::init();
-@@ -301,7 +307,7 @@ void* valloc(size_t size) noexcept
- }
- #endif
-
--void* dlopen(const char* filename, int flag) noexcept
-+void* dlopen(const char* filename, int flag) NOEXECPT
- {
-     if (!hooks::dlopen) {
-         hooks::init();
-@@ -316,7 +322,7 @@ void* dlopen(const char* filename, int flag) noexcept
-     return ret;
- }
-
--int dlclose(void* handle) noexcept
-+int dlclose(void* handle) NOEXECPT
- {
-     if (!hooks::dlclose) {
-         hooks::init();
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0004-backtrace-Al=
ways-include-stdint.h.patch b/meta-oe/recipes-devtools/heaptrack/heaptrack/=
0004-backtrace-Always-include-stdint.h.patch
deleted file mode 100644
index 3db03cf85d..0000000000
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack/0004-backtrace-Always-in=
clude-stdint.h.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 200f71ea8c0756594ac7e079ccc686d9a20cea5c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Nov 2020 15:32:58 -0800
-Subject: [PATCH] backtrace: Always include stdint.h
-
-in OE we will always have system headers which supports C99/stdint.h
-
-Upstream-Status: Inappropriate [Unless upstream drops legacy]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- 3rdparty/libbacktrace/backtrace.h | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/3rdparty/libbacktrace/backtrace.h b/3rdparty/libbacktrace/bac=
ktrace.h
-index 14863cf..d0ac38f 100644
---- a/3rdparty/libbacktrace/backtrace.h
-+++ b/3rdparty/libbacktrace/backtrace.h
-@@ -36,24 +36,8 @@ POSSIBILITY OF SUCH DAMAGE.  */
- #include <stddef.h>
- #include <stdio.h>
-
--/* We want to get a definition for uintptr_t, but we still care about
--   systems that don't have <stdint.h>.  */
--#if defined(__GLIBC__) && __GLIBC__ >=3D 2
--
--#include <stdint.h>
--
--#elif defined(HAVE_STDINT_H)
--
- #include <stdint.h>
-
--#else
--
--/* Systems that don't have <stdint.h> must provide gstdint.h, e.g.,
--   from GCC_HEADER_STDINT in configure.ac.  */
--#include "gstdint.h"
--
--#endif
--
- #ifdef __cplusplus
- extern "C" {
- #endif
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-o=
e/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
deleted file mode 100644
index 6896daf836..0000000000
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
+++ /dev/null
@@ -1,63 +0,0 @@
-SUMMARY =3D "Heap memory profiler for Linux"
-DESCRIPTION =3D "Heaptrack traces all memory allocations and annotates the=
se \
-events with stack traces. Dedicated analysis tools then allow you to inter=
pret \
-the heap memory profile to find hotspots to reduce memory, leaks, allocati=
on \
-hotspots and temporary allocations"
-HOMEPAGE =3D "https://phabricator.kde.org/source/heaptrack/"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b364516=
c"
-
-DEPENDS =3D "zlib boost libunwind elfutils"
-
-SRC_URI =3D "git://github.com/KDE/heaptrack.git;protocol=3Dhttps;branch=3D=
master \
-           file://0001-libheaptrack-Replace-__pid_t-with-pid_t.patch \
-           file://0002-heaptrack_inject-Include-dlfcn.h-for-dlopen-dlclose=
.patch \
-           file://0003-heaptrack_preload-Make-noexcept-attribute-condition=
a.patch \
-           file://0004-backtrace-Always-include-stdint.h.patch \
-           file://0001-track-Check-for-unw_set_caching_policy-before-using=
.patch \
-           "
-
-SRCREV =3D "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
-
-
-inherit cmake
-
-EXTRA_OECMAKE +=3D "-DHEAPTRACK_BUILD_GUI=3DOFF \
-                  -DCMAKE_POLICY_VERSION_MINIMUM=3D3.5 \
-"
-
-# libunwind is not yet ported to RISCV
-COMPATIBLE_HOST:riscv32 =3D "null"
-COMPATIBLE_HOST:riscv64 =3D "null"
-
-BBCLASSEXTEND =3D "native"
-
-# http://errors.yoctoproject.org/Errors/Details/766879/
-#     buildResult:
-#       variable: "LIBUNWIND_HAS_UNW_BACKTRACE"
-#       cached: true
-#       stdout: |
-#         Change Dir: '/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4=
_64-webos-linux/heaptrack/1.2.0/build/CMakeFiles/CMakeScratch/TryCompile-kg=
uYrO'
-#
-#         Run Build Command(s): ninja -v cmTC_51d86
-#         [1/2] ccache /OE/lge/build/webos/styhead/BUILD/work/raspberrypi4=
_64-webos-linux/heaptrack/1.2.0/recipe-sysroot-native/usr/bin/aarch64-webos=
-linux/aarch64-webos-linux-gcc --sysroot=3D/OE/lge/build/webos/styhead/BUIL=
D/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot -DLIBUNWI=
ND_HAS_UNW_BACKTRACE  -mcpu=3Dcortex-a72+crc -mbranch-protection=3Dstandard=
 -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-secu=
rity -Werror=3Dformat-security -Werror=3Dreturn-type  --sysroot=3D/OE/lge/b=
uild/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/r=
ecipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-m=
ap  -fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi=
4_64-webos-linux/heaptrack/1.2.0/git=3D/usr/src/debug/heaptrack/1.2.0  -fde=
bug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-web=
os-linux/heaptrack/1.2.0/git=3D/usr/src/debug/heaptrack/1.2.0  -fmacro-pref=
ix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux=
/heaptrack/1.2.0/build=3D/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=
=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heapt=
rack/1.2.0/build=3D/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=3D/OE=
/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1=
.2.0/recipe-sysroot=3D  -fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BU=
ILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot=3D  -fd=
ebug-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-we=
bos-linux/heaptrack/1.2.0/recipe-sysroot-native=3D -o CMakeFiles/cmTC_51d86=
.dir/src.c.o -c /OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webo=
s-linux/heaptrack/1.2.0/build/CMakeFiles/CMakeScratch/TryCompile-kguYrO/src=
.c
-#         FAILED: CMakeFiles/cmTC_51d86.dir/src.c.o
-#         ccache /OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-we=
bos-linux/heaptrack/1.2.0/recipe-sysroot-native/usr/bin/aarch64-webos-linux=
/aarch64-webos-linux-gcc --sysroot=3D/OE/lge/build/webos/styhead/BUILD/work=
/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot -DLIBUNWIND_HAS=
_UNW_BACKTRACE  -mcpu=3Dcortex-a72+crc -mbranch-protection=3Dstandard -fsta=
ck-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -=
Werror=3Dformat-security -Werror=3Dreturn-type  --sysroot=3D/OE/lge/build/w=
ebos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-=
sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fcanon-prefix-map  -f=
macro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-w=
ebos-linux/heaptrack/1.2.0/git=3D/usr/src/debug/heaptrack/1.2.0  -fdebug-pr=
efix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-lin=
ux/heaptrack/1.2.0/git=3D/usr/src/debug/heaptrack/1.2.0  -fmacro-prefix-map=
=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heapt=
rack/1.2.0/build=3D/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=3D/OE=
/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1=
.2.0/build=3D/usr/src/debug/heaptrack/1.2.0  -fdebug-prefix-map=3D/OE/lge/b=
uild/webos/styhead/BUILD/work/raspberrypi4_64-webos-linux/heaptrack/1.2.0/r=
ecipe-sysroot=3D  -fmacro-prefix-map=3D/OE/lge/build/webos/styhead/BUILD/wo=
rk/raspberrypi4_64-webos-linux/heaptrack/1.2.0/recipe-sysroot=3D  -fdebug-p=
refix-map=3D/OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-li=
nux/heaptrack/1.2.0/recipe-sysroot-native=3D -o CMakeFiles/cmTC_51d86.dir/s=
rc.c.o -c /OE/lge/build/webos/styhead/BUILD/work/raspberrypi4_64-webos-linu=
x/heaptrack/1.2.0/build/CMakeFiles/CMakeScratch/TryCompile-kguYrO/src.c
-#         src.c: In function 'main':
-#         src.c:3:43: error: passing argument 1 of 'unw_backtrace' from in=
compatible pointer type [-Wincompatible-pointer-types]
-#             3 | int main() { void* buf[10]; unw_backtrace(&buf, 10); ret=
urn 0; }
-#               |                                           ^~~~
-#               |                                           |
-#               |                                           void * (*)[10]
-#         In file included from ../../../../recipe-sysroot/usr/include/lib=
unwind-aarch64.h:232,
-#                          from ../../../../recipe-sysroot/usr/include/lib=
unwind-64.h:7,
-#                          from ../../../../recipe-sysroot/usr/include/lib=
unwind.h:27,
-#                          from src.c:2:
-#         ../../../../recipe-sysroot/usr/include/libunwind-common.h:290:27=
: note: expected 'void **' but argument is of type 'void * (*)[10]'
-#           290 | extern int unw_backtrace (void **, int);
-#               |                           ^~~~~~~
-#         ninja: build stopped: subcommand failed.
-#
-#       exitCode: 1
-#
-CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.5.0.bb b/meta-o=
e/recipes-devtools/heaptrack/heaptrack_1.5.0.bb
new file mode 100644
index 0000000000..172a74fa6a
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.5.0.bb
@@ -0,0 +1,33 @@
+SUMMARY =3D "Heap memory profiler for Linux"
+DESCRIPTION =3D "Heaptrack traces all memory allocations and annotates the=
se \
+events with stack traces. Dedicated analysis tools then allow you to inter=
pret \
+the heap memory profile to find hotspots to reduce memory, leaks, allocati=
on \
+hotspots and temporary allocations"
+HOMEPAGE =3D "https://phabricator.kde.org/source/heaptrack/"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://LICENSES/Apache-2.0.txt;md5=3Dc846ebb396f8b17=
4b10ded4771514fcc \
+                    file://LICENSES/BSD-3-Clause.txt;md5=3Df225922a2c12dfa=
5218fb70c49db3ea6 \
+                    file://LICENSES/BSL-1.0.txt;md5=3D4c66a2bad475d1a8f152=
667a4d0ada34 \
+                    file://LICENSES/GPL-2.0-or-later.txt;md5=3D3d26203303a=
722dedc6bf909d95ba815 \
+                    file://LICENSES/LGPL-2.1-only.txt;md5=3D41890f71f74030=
2b785c27661123bff5 \
+                    file://LICENSES/LGPL-2.1-or-later.txt;md5=3D147a320ed8=
b16b036829a0c71d424153 \
+                    file://LICENSES/MIT.txt;md5=3D7dda4e90ded66ab88b86f761=
69f28663"
+
+DEPENDS =3D "zlib boost libunwind elfutils"
+
+SRC_URI =3D "git://github.com/KDE/heaptrack.git;protocol=3Dhttps;branch=3D=
master \
+           file://0001-libheaptrack-Fix-build-on-c23.patch \
+		  "
+SRCREV =3D "0a15d643791e9829ef3f754ac10e3bed966152c5"
+PV .=3D "+git"
+
+inherit cmake
+
+EXTRA_OECMAKE +=3D "-DHEAPTRACK_BUILD_GUI=3DOFF"
+
+# libunwind is not yet ported to RISCV32
+COMPATIBLE_HOST:riscv32 =3D "null"
+
+BBCLASSEXTEND =3D "native"
+
+TOOLCHAIN =3D "gcc"

