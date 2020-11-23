Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web08.44420.1606174971660967097
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2020 15:42:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LZbW/QgL;
 spf=pass (domain: gmail.com, ip: 209.85.210.172, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id w187so2044651pfd.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2020 15:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qlW0VW97WXcE/sRYO+2iGAE9asyKPeGE9OfAJNzYYbw=;
        b=LZbW/QgLgzdjfxYOZeqkCcAh5Qy7rbWCWmQSzN3DohRFwUBid9RfNnbMybsd2eB6dh
         5+GQksUN7uewUTASWGq5qpBvUI5gJfOS/S5VfcLYflNzMvOBcUgJXfsB3dWi+KB8/oQ6
         VMTLu4Z+/yC1B382OTZliASofXuhMtL5zLbmv9f2ILgK57OMRxGQDgyjAHyZJN55ywKN
         YJa5kxiloZJGpEtMoF7cYy+MPox4VjShGj5GrgWbhfcZQxDGGgTGU8YdxJS/h2r8wTaQ
         d/X81MlXplL1K844Y6dm3AIRDXJ2UVU3+BRe4PE0KPjNksFogrn/rBDesO46/TRf5YqV
         RG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qlW0VW97WXcE/sRYO+2iGAE9asyKPeGE9OfAJNzYYbw=;
        b=kOkKJlpL4FfZza9XwdPm/cFzdyAJHD1DfcN+AdS+kI5k12i+O5xevgWst0LNVGBJwZ
         TycLQEsSsn7XIrDiTw3I0vMSRWwB/4+LEuScy2TuxdgQwsBt9OFYk8to7WsjSYKp8Vsg
         EvEBza0oUHOQoOV+LXRZM1AcTaqO4zw1mxJjIAvuQhitHVJwKgCibwyOhLGbfJTWjru1
         fPwDrhjlsVb1/RKBfKlH3Rm+nhN1oH6o5/tP+aGvq61jCEm/g2E3cEIwwb10Fbfa3sxr
         9ql72TzMMYnfArGLQNfqLY6v730phrps8lbIOSJHruR/BC3rNhBeFc1NXfZXnxM6P6UF
         +HZQ==
X-Gm-Message-State: AOAM531Wp0nLh90cFDOS5vKJSaHK50bDZ/pDCBCQnf74+2sk3O4rTH0M
	uz0cfYbVxdrppnvTLroVrIhaL+IRpdtLlw==
X-Google-Smtp-Source: ABdhPJz/4OIOXp9GzwqOFLTxju6YrHIF7zn97sjbY0rY/C73mEDzi2wpMe91R1Vu+TojCrzzs0xFQQ==
X-Received: by 2002:a62:8cd6:0:b029:18b:ad92:503b with SMTP id m205-20020a628cd60000b029018bad92503bmr1626925pfd.77.1606174970496;
        Mon, 23 Nov 2020 15:42:50 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::ed1a])
        by smtp.gmail.com with ESMTPSA id 84sm12938259pfu.53.2020.11.23.15.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 15:42:49 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>,
	Sinan Kaya <okaya@kernel.org>
Subject: [meta-oe][PATCH] heaptrack: Fix build on musl
Date: Mon, 23 Nov 2020 15:42:47 -0800
Message-Id: <20201123234247.2010609-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Improve upon summary and description fields
Add PV to the recipe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Sinan Kaya <okaya@kernel.org>
---
 ...heaptrack-Replace-__pid_t-with-pid_t.patch |  26 ++++
 ...t-Include-dlfcn.h-for-dlopen-dlclose.patch |  38 ++++++
 ...d-Make-noexcept-attribute-conditiona.patch | 118 ++++++++++++++++++
 ...04-backtrace-Always-include-stdint.h.patch |  42 +++++++
 .../heaptrack/heaptrack_1.2.0.bb              |  27 ++++
 .../heaptrack/heaptrack_git.bb                |  18 ---
 6 files changed, 251 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libheaptrack-Replace-__pid_t-with-pid_t.patch
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0002-heaptrack_inject-Include-dlfcn.h-for-dlopen-dlclose.patch
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0003-heaptrack_preload-Make-noexcept-attribute-conditiona.patch
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack/0004-backtrace-Always-include-stdint.h.patch
 create mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
 delete mode 100644 meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb

diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libheaptrack-Replace-__pid_t-with-pid_t.patch b/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libheaptrack-Replace-__pid_t-with-pid_t.patch
new file mode 100644
index 0000000000..9681086a52
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack/0001-libheaptrack-Replace-__pid_t-with-pid_t.patch
@@ -0,0 +1,26 @@
+From 18671cd6028f996c138c6eb4282caf313f3fc605 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Nov 2020 15:25:18 -0800
+Subject: [PATCH] libheaptrack: Replace __pid_t with pid_t
+
+__pid_t is for internal libc use
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/track/libheaptrack.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/track/libheaptrack.cpp b/src/track/libheaptrack.cpp
+index e138bce..4120ecd 100644
+--- a/src/track/libheaptrack.cpp
++++ b/src/track/libheaptrack.cpp
+@@ -79,7 +79,7 @@ chrono::milliseconds elapsedTime()
+     return chrono::duration_cast<chrono::milliseconds>(clock::now() - startTime());
+ }
+ 
+-__pid_t gettid()
++pid_t gettid()
+ {
+     return syscall(SYS_gettid);
+ }
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0002-heaptrack_inject-Include-dlfcn.h-for-dlopen-dlclose.patch b/meta-oe/recipes-devtools/heaptrack/heaptrack/0002-heaptrack_inject-Include-dlfcn.h-for-dlopen-dlclose.patch
new file mode 100644
index 0000000000..5fa802cb38
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack/0002-heaptrack_inject-Include-dlfcn.h-for-dlopen-dlclose.patch
@@ -0,0 +1,38 @@
+From 8ebcf5f2dd27dbeb6c81e9c40a5d17916cb243e6 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Nov 2020 15:26:31 -0800
+Subject: [PATCH] heaptrack_inject: Include dlfcn.h for dlopen/dlclose
+
+Do not use __WORDSIZE which is for libc internal use
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/track/heaptrack_inject.cpp | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/track/heaptrack_inject.cpp b/src/track/heaptrack_inject.cpp
+index 325d87e..fb1c154 100644
+--- a/src/track/heaptrack_inject.cpp
++++ b/src/track/heaptrack_inject.cpp
+@@ -28,6 +28,7 @@
+ #include <link.h>
+ #include <malloc.h>
+ #include <unistd.h>
++#include <dlfcn.h>
+ 
+ #include <sys/mman.h>
+ 
+@@ -39,9 +40,10 @@
+  * @brief Experimental support for symbol overloading after runtime injection.
+  */
+ 
+-#if __WORDSIZE == 64
++#include <limits.h>
++#if ULONG_MAX == 0xffffffffffffffff
+ #define ELF_R_SYM(i) ELF64_R_SYM(i)
+-#elif __WORDSIZE == 32
++#elif ULONG_MAX == 0xffffffff
+ #define ELF_R_SYM(i) ELF32_R_SYM(i)
+ #else
+ #error unsupported word size
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0003-heaptrack_preload-Make-noexcept-attribute-conditiona.patch b/meta-oe/recipes-devtools/heaptrack/heaptrack/0003-heaptrack_preload-Make-noexcept-attribute-conditiona.patch
new file mode 100644
index 0000000000..c3c852e39e
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack/0003-heaptrack_preload-Make-noexcept-attribute-conditiona.patch
@@ -0,0 +1,118 @@
+From b8435c6523d9377f04d5e21629f3dc68b8865016 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Nov 2020 15:31:45 -0800
+Subject: [PATCH] heaptrack_preload: Make noexcept attribute conditional
+
+musl does not define these functions with noexcept and hence compiler
+complains about them
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/track/heaptrack_preload.cpp | 26 ++++++++++++++++----------
+ 1 file changed, 16 insertions(+), 10 deletions(-)
+
+diff --git a/src/track/heaptrack_preload.cpp b/src/track/heaptrack_preload.cpp
+index 63110ce..ee85331 100644
+--- a/src/track/heaptrack_preload.cpp
++++ b/src/track/heaptrack_preload.cpp
+@@ -171,11 +171,17 @@ void init()
+ }
+ }
+ 
++#ifdef __GLIBC__
++#define NOEXECPT noexcept
++#else
++#define NOEXECPT
++#endif
++
+ extern "C" {
+ 
+ /// TODO: memalign, pvalloc, ...?
+ 
+-void* malloc(size_t size) noexcept
++void* malloc(size_t size) NOEXECPT
+ {
+     if (!hooks::malloc) {
+         hooks::init();
+@@ -186,7 +192,7 @@ void* malloc(size_t size) noexcept
+     return ptr;
+ }
+ 
+-void free(void* ptr) noexcept
++void free(void* ptr) NOEXECPT
+ {
+     if (!hooks::free) {
+         hooks::init();
+@@ -204,7 +210,7 @@ void free(void* ptr) noexcept
+     hooks::free(ptr);
+ }
+ 
+-void* realloc(void* ptr, size_t size) noexcept
++void* realloc(void* ptr, size_t size) NOEXECPT
+ {
+     if (!hooks::realloc) {
+         hooks::init();
+@@ -219,7 +225,7 @@ void* realloc(void* ptr, size_t size) noexcept
+     return ret;
+ }
+ 
+-void* calloc(size_t num, size_t size) noexcept
++void* calloc(size_t num, size_t size) NOEXECPT
+ {
+     if (!hooks::calloc) {
+         hooks::init();
+@@ -235,7 +241,7 @@ void* calloc(size_t num, size_t size) noexcept
+ }
+ 
+ #if HAVE_CFREE
+-void cfree(void* ptr) noexcept
++void cfree(void* ptr) NOEXECPT
+ {
+     if (!hooks::cfree) {
+         hooks::init();
+@@ -252,7 +258,7 @@ void cfree(void* ptr) noexcept
+ }
+ #endif
+ 
+-int posix_memalign(void** memptr, size_t alignment, size_t size) noexcept
++int posix_memalign(void** memptr, size_t alignment, size_t size) NOEXECPT
+ {
+     if (!hooks::posix_memalign) {
+         hooks::init();
+@@ -268,7 +274,7 @@ int posix_memalign(void** memptr, size_t alignment, size_t size) noexcept
+ }
+ 
+ #if HAVE_ALIGNED_ALLOC
+-void* aligned_alloc(size_t alignment, size_t size) noexcept
++void* aligned_alloc(size_t alignment, size_t size) NOEXECPT
+ {
+     if (!hooks::aligned_alloc) {
+         hooks::init();
+@@ -285,7 +291,7 @@ void* aligned_alloc(size_t alignment, size_t size) noexcept
+ #endif
+ 
+ #if HAVE_VALLOC
+-void* valloc(size_t size) noexcept
++void* valloc(size_t size) NOEXECPT
+ {
+     if (!hooks::valloc) {
+         hooks::init();
+@@ -301,7 +307,7 @@ void* valloc(size_t size) noexcept
+ }
+ #endif
+ 
+-void* dlopen(const char* filename, int flag) noexcept
++void* dlopen(const char* filename, int flag) NOEXECPT
+ {
+     if (!hooks::dlopen) {
+         hooks::init();
+@@ -316,7 +322,7 @@ void* dlopen(const char* filename, int flag) noexcept
+     return ret;
+ }
+ 
+-int dlclose(void* handle) noexcept
++int dlclose(void* handle) NOEXECPT
+ {
+     if (!hooks::dlclose) {
+         hooks::init();
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack/0004-backtrace-Always-include-stdint.h.patch b/meta-oe/recipes-devtools/heaptrack/heaptrack/0004-backtrace-Always-include-stdint.h.patch
new file mode 100644
index 0000000000..3db03cf85d
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack/0004-backtrace-Always-include-stdint.h.patch
@@ -0,0 +1,42 @@
+From 200f71ea8c0756594ac7e079ccc686d9a20cea5c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 23 Nov 2020 15:32:58 -0800
+Subject: [PATCH] backtrace: Always include stdint.h
+
+in OE we will always have system headers which supports C99/stdint.h
+
+Upstream-Status: Inappropriate [Unless upstream drops legacy]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ 3rdparty/libbacktrace/backtrace.h | 16 ----------------
+ 1 file changed, 16 deletions(-)
+
+diff --git a/3rdparty/libbacktrace/backtrace.h b/3rdparty/libbacktrace/backtrace.h
+index 14863cf..d0ac38f 100644
+--- a/3rdparty/libbacktrace/backtrace.h
++++ b/3rdparty/libbacktrace/backtrace.h
+@@ -36,24 +36,8 @@ POSSIBILITY OF SUCH DAMAGE.  */
+ #include <stddef.h>
+ #include <stdio.h>
+ 
+-/* We want to get a definition for uintptr_t, but we still care about
+-   systems that don't have <stdint.h>.  */
+-#if defined(__GLIBC__) && __GLIBC__ >= 2
+-
+-#include <stdint.h>
+-
+-#elif defined(HAVE_STDINT_H)
+-
+ #include <stdint.h>
+ 
+-#else
+-
+-/* Systems that don't have <stdint.h> must provide gstdint.h, e.g.,
+-   from GCC_HEADER_STDINT in configure.ac.  */
+-#include "gstdint.h"
+-
+-#endif
+-
+ #ifdef __cplusplus
+ extern "C" {
+ #endif
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
new file mode 100644
index 0000000000..14d3983ca6
--- /dev/null
+++ b/meta-oe/recipes-devtools/heaptrack/heaptrack_1.2.0.bb
@@ -0,0 +1,27 @@
+SUMMARY = "Heap memory profiler for Linux"
+DESCRIPTION = "Heaptrack traces all memory allocations and annotates these \
+events with stack traces. Dedicated analysis tools then allow you to interpret \
+the heap memory profile to find hotspots to reduce memory, leaks, allocation \
+hotspots and temporary allocations"
+HOMEPAGE = "https://phabricator.kde.org/source/heaptrack/"
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+DEPENDS = "zlib boost libunwind elfutils"
+
+SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https \
+           file://0001-libheaptrack-Replace-__pid_t-with-pid_t.patch \
+           file://0002-heaptrack_inject-Include-dlfcn.h-for-dlopen-dlclose.patch \
+           file://0003-heaptrack_preload-Make-noexcept-attribute-conditiona.patch \
+           file://0004-backtrace-Always-include-stdint.h.patch \
+           "
+
+SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
+
+S = "${WORKDIR}/git"
+
+inherit cmake
+
+EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb b/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
deleted file mode 100644
index 30d7b65bd7..0000000000
--- a/meta-oe/recipes-devtools/heaptrack/heaptrack_git.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-DESCRIPTION = "Heaptrack"
-HOMEPAGE = "https://phabricator.kde.org/source/heaptrack/"
-LICENSE = "LGPL-2.1"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
-
-DEPENDS = "zlib boost libunwind elfutils"
-
-SRC_URI = "git://github.com/KDE/heaptrack.git;protocol=https"
-
-SRCREV = "bc9e3744bcc47de978673d1e382f4125a1ab5fa8"
-
-S = "${WORKDIR}/git"
-
-inherit cmake
-
-EXTRA_OECMAKE += "-DHEAPTRACK_BUILD_GUI=OFF"
-
-BBCLASSEXTEND = "native nativesdk"
-- 
2.29.2

