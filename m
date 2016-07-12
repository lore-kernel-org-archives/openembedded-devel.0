Return-Path: <koen.kooi@linaro.org>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 7B5B5606D0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 10:05:28 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id f65so94695378wmi.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jul 2016 03:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=wmmXd3UXegY+0ocBxpcX5O5gtmqyWGkHqqiq15L3e2g=;
	b=Z1ctr3HlY71GzU7UFzxoGdnH6SvqnVaZe70QUS8W8DrHr5FCenHhutTIlpgeBASDzP
	zwMWZETGFPWMHq8qYd9DLYKnofji6mkRW1pt7b0AHiU7NiofVTnIp/Rk40nSCz8gpS1K
	Bmi5K10p9RdYBhjDnJxBA1N6EaUxCQ+Ymn33I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=wmmXd3UXegY+0ocBxpcX5O5gtmqyWGkHqqiq15L3e2g=;
	b=kKEZp9r9vlw3lqSAdVYHtZdxLhW9uwL+0nRoAI0Or9099R9xEYl/D/735NAuZyXp2E
	UJSnpXTTs6JxnEup+2cus3mEqMwWsDO8UXUC4A7dJtTKjuvK6CE97unYmodnB3Ra0HWx
	E/iPWWZ2e/vJ/gtXhGCE0NqWJzm75wKqL2mbdAVhySyqoLh3zauZyFXkpgNDhV4eqQ3S
	QyN/5q0owbO2jFCSsFbrOZQS0XrJaG7tWTfaBSL4Hv2xIZcbRxgi4R29iyK8i2GKRUX/
	uERsYkjSiImRxVXWTc3C+qfOZGlI7UAdYgdxXcTRrZR7/48ArrR1wGt55rNQu6mhsTtt
	Voxg==
X-Gm-Message-State: ALyK8tIMbauVBgcEfxMRA564WU5yHXIzOOjFoAjEvAHbCYvIe/HJErImmEjtuoazn3oQfbeD
X-Received: by 10.28.35.86 with SMTP id j83mr2074412wmj.18.1468317928821;
	Tue, 12 Jul 2016 03:05:28 -0700 (PDT)
Received: from thinkpad.localdomain (ip4da29576.direct-adsl.nl.
	[77.162.149.118]) by smtp.gmail.com with ESMTPSA id
	r127sm27732759wmf.21.2016.07.12.03.05.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 03:05:27 -0700 (PDT)
From: Koen Kooi <koen.kooi@linaro.org>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jul 2016 12:05:23 +0200
Message-Id: <1468317923-18042-1-git-send-email-koen.kooi@linaro.org>
X-Mailer: git-send-email 2.4.3
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: [RFC][PATCH] mozjs: add 45.0.2
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 12 Jul 2016 10:05:33 -0000

Mozjs 17 has serious issues on non-x86 64 bit hardware and worse, on 48/51 bit VA architectures. The systemd -> polkit -> mozjs chain renders various armv8 systems unbootable due to that. There are no fixes for mozjs17, only more recent versions.

Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
---

This is an RFC since there are a number of things needing to get sorted out, like the usage for host python instead of the sysroot one and the fact that configure runs 'pip install', which needs networking. But it's mozilla software, so we have to accept that it's ugly and a maintenance nightmare. 

 .../0001-configure-use-host-python.patch           |  31 ++++
 .../mozjs/mozjs-45.0.2/mozbz-1143022.patch         | 172 +++++++++++++++++++++
 .../mozjs/mozjs-45.0.2/mozbz-1277742.patch         |  34 ++++
 .../mozjs/mozjs-45.0.2/mozbz1266366.patch          |  33 ++++
 meta-oe/recipes-extended/mozjs/mozjs_45.0.2.bb     | 111 +++++++++++++
 5 files changed, 381 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-45.0.2/0001-configure-use-host-python.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz-1143022.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz-1277742.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz1266366.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs_45.0.2.bb

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/0001-configure-use-host-python.patch b/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/0001-configure-use-host-python.patch
new file mode 100644
index 0000000..7fa73e7
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/0001-configure-use-host-python.patch
@@ -0,0 +1,31 @@
+From fd3bdf5482560016946e874fa1d0329273a929d6 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen.kooi@linaro.org>
+Date: Mon, 11 Jul 2016 10:02:36 +0200
+Subject: [PATCH] configure: use host python
+
+Python path provided by configure doesn't work, use the host instead.
+
+Adapted from https://github.com/OSSystems/meta-browser/blob/master/recipes-mozilla/firefox/firefox/fix-python-path.patch
+
+pstream-Status: Inappropriate [configuration]
+Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index a957c4b..df6f54f 100755
+--- a/configure
++++ b/configure
+@@ -17061,7 +17061,7 @@ echo creating $CONFIG_STATUS
+ extra_python_path=${COMM_BUILD:+"'mozilla', "}
+ 
+ cat > $CONFIG_STATUS <<EOF
+-#!${PYTHON}
++#!/usr/bin/python
+ # coding=$encoding
+ 
+ import os
+-- 
+2.4.3
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz-1143022.patch b/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz-1143022.patch
new file mode 100644
index 0000000..7ed8ba7
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz-1143022.patch
@@ -0,0 +1,172 @@
+
+# HG changeset patch
+# User Zheng Xu <zheng.xu@linaro.org>
+# Date 1464657720 -7200
+# Node ID dfaafbaaa2919a033c4c0abdd5830f4ea413bed6
+# Parent  499f16ca85ec48d1896a1633730715f32bd62140
+Bug 1143022 - Manually mmap on arm64 to ensure high 17 bits are clear. r=ehoogeveen
+
+There might be 48-bit VA on arm64 depending on kernel configuration.
+Manually mmap heap memory to align with the assumption made by JS engine.
+
+Upstream-status: Backport
+
+diff --git a/js/src/gc/Memory.cpp b/js/src/gc/Memory.cpp
+--- a/js/src/gc/Memory.cpp
++++ b/js/src/gc/Memory.cpp
+@@ -430,17 +430,17 @@ InitMemorySubsystem()
+     if (pageSize == 0)
+         pageSize = allocGranularity = size_t(sysconf(_SC_PAGESIZE));
+ }
+ 
+ static inline void*
+ MapMemoryAt(void* desired, size_t length, int prot = PROT_READ | PROT_WRITE,
+             int flags = MAP_PRIVATE | MAP_ANON, int fd = -1, off_t offset = 0)
+ {
+-#if defined(__ia64__) || (defined(__sparc64__) && defined(__NetBSD__))
++#if defined(__ia64__) || (defined(__sparc64__) && defined(__NetBSD__)) || defined(__aarch64__)
+     MOZ_ASSERT(0xffff800000000000ULL & (uintptr_t(desired) + length - 1) == 0);
+ #endif
+     void* region = mmap(desired, length, prot, flags, fd, offset);
+     if (region == MAP_FAILED)
+         return nullptr;
+     /*
+      * mmap treats the given address as a hint unless the MAP_FIXED flag is
+      * used (which isn't usually what you want, as this overrides existing
+@@ -480,16 +480,51 @@ MapMemory(size_t length, int prot = PROT
+      * as out of memory.
+      */
+     if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
+         if (munmap(region, length))
+             MOZ_ASSERT(errno == ENOMEM);
+         return nullptr;
+     }
+     return region;
++#elif defined(__aarch64__)
++   /*
++    * There might be similar virtual address issue on arm64 which depends on
++    * hardware and kernel configurations. But the work around is slightly
++    * different due to the different mmap behavior.
++    *
++    * TODO: Merge with the above code block if this implementation works for
++    * ia64 and sparc64.
++    */
++    const uintptr_t start = UINT64_C(0x0000070000000000);
++    const uintptr_t end   = UINT64_C(0x0000800000000000);
++    const uintptr_t step  = ChunkSize;
++   /*
++    * Optimization options if there are too many retries in practice:
++    * 1. Examine /proc/self/maps to find an available address. This file is
++    *    not always available, however. In addition, even if we examine
++    *    /proc/self/maps, we may still need to retry several times due to
++    *    racing with other threads.
++    * 2. Use a global/static variable with lock to track the addresses we have
++    *    allocated or tried.
++    */
++    uintptr_t hint;
++    void* region = MAP_FAILED;
++    for (hint = start; region == MAP_FAILED && hint + length <= end; hint += step) {
++        region = mmap((void*)hint, length, prot, flags, fd, offset);
++        if (region != MAP_FAILED) {
++            if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
++                if (munmap(region, length)) {
++                    MOZ_ASSERT(errno == ENOMEM);
++                }
++                region = MAP_FAILED;
++            }
++        }
++    }
++    return region == MAP_FAILED ? nullptr : region;
+ #else
+     void* region = MozTaggedAnonymousMmap(nullptr, length, prot, flags, fd, offset, "js-gc-heap");
+     if (region == MAP_FAILED)
+         return nullptr;
+     return region;
+ #endif
+ }
+ 
+diff --git a/js/src/jsapi-tests/testGCAllocator.cpp b/js/src/jsapi-tests/testGCAllocator.cpp
+--- a/js/src/jsapi-tests/testGCAllocator.cpp
++++ b/js/src/jsapi-tests/testGCAllocator.cpp
+@@ -307,48 +307,72 @@ void* mapMemoryAt(void* desired, size_t 
+ void* mapMemory(size_t length) { return nullptr; }
+ void unmapPages(void* p, size_t size) { }
+ 
+ #elif defined(XP_UNIX)
+ 
+ void*
+ mapMemoryAt(void* desired, size_t length)
+ {
+-#if defined(__ia64__) || (defined(__sparc64__) && defined(__NetBSD__))
++#if defined(__ia64__) || (defined(__sparc64__) && defined(__NetBSD__)) || defined(__aarch64__)
+     MOZ_RELEASE_ASSERT(0xffff800000000000ULL & (uintptr_t(desired) + length - 1) == 0);
+ #endif
+     void* region = mmap(desired, length, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
+     if (region == MAP_FAILED)
+         return nullptr;
+     if (region != desired) {
+         if (munmap(region, length))
+             MOZ_RELEASE_ASSERT(errno == ENOMEM);
+         return nullptr;
+     }
+     return region;
+ }
+ 
+ void*
+ mapMemory(size_t length)
+ {
+-    void* hint = nullptr;
++    int prot = PROT_READ | PROT_WRITE;
++    int flags = MAP_PRIVATE | MAP_ANON;
++    int fd = -1;
++    off_t offset = 0;
++    // The test code must be aligned with the implementation in gc/Memory.cpp.
+ #if defined(__ia64__) || (defined(__sparc64__) && defined(__NetBSD__))
+-    hint = (void*)0x0000070000000000ULL;
+-#endif
+-    void* region = mmap(hint, length, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANON, -1, 0);
++    void* region = mmap((void*)0x0000070000000000, length, prot, flags, fd, offset);
+     if (region == MAP_FAILED)
+         return nullptr;
+-#if defined(__ia64__) || (defined(__sparc64__) && defined(__NetBSD__))
+-    if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000ULL) {
++    if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
+         if (munmap(region, length))
+             MOZ_RELEASE_ASSERT(errno == ENOMEM);
+         return nullptr;
+     }
++    return region;
++#elif defined(__aarch64__)
++    const uintptr_t start = UINT64_C(0x0000070000000000);
++    const uintptr_t end   = UINT64_C(0x0000800000000000);
++    const uintptr_t step  = ChunkSize;
++    uintptr_t hint;
++    void* region = MAP_FAILED;
++    for (hint = start; region == MAP_FAILED && hint + length <= end; hint += step) {
++        region = mmap((void*)hint, length, prot, flags, fd, offset);
++        if (region != MAP_FAILED) {
++            if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
++                if (munmap(region, length)) {
++                    MOZ_RELEASE_ASSERT(errno == ENOMEM);
++                }
++                region = MAP_FAILED;
++            }
++        }
++    }
++    return region == MAP_FAILED ? nullptr : region;
++#else
++    void* region = mmap(nullptr, length, prot, flags, fd, offset);
++    if (region == MAP_FAILED)
++        return nullptr;
++    return region;
+ #endif
+-    return region;
+ }
+ 
+ void
+ unmapPages(void* p, size_t size)
+ {
+     if (munmap(p, size))
+         MOZ_RELEASE_ASSERT(errno == ENOMEM);
+ }
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz-1277742.patch b/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz-1277742.patch
new file mode 100644
index 0000000..0530b7d
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz-1277742.patch
@@ -0,0 +1,34 @@
+
+# HG changeset patch
+# User Makoto Kato <m_kato@ga2.so-net.ne.jp>
+# Date 1464948660 -32400
+# Node ID 58137ecd12edb7ae1a57c80da811676bc66fd03c
+# Parent  d02ab40ae319910659cf19114f41e7aa7ce68e4d
+Bug 1277742 - Use correct namespace for ChunkSize on aarch64. r=ehoogeveen
+
+MozReview-Commit-ID: FqXkZaOG6SK
+Upstream-status: Backport
+
+diff --git a/js/src/jsapi-tests/testGCAllocator.cpp b/js/src/jsapi-tests/testGCAllocator.cpp
+--- a/js/src/jsapi-tests/testGCAllocator.cpp
++++ b/js/src/jsapi-tests/testGCAllocator.cpp
+@@ -342,17 +342,17 @@ mapMemory(size_t length)
+         if (munmap(region, length))
+             MOZ_RELEASE_ASSERT(errno == ENOMEM);
+         return nullptr;
+     }
+     return region;
+ #elif defined(__aarch64__)
+     const uintptr_t start = UINT64_C(0x0000070000000000);
+     const uintptr_t end   = UINT64_C(0x0000800000000000);
+-    const uintptr_t step  = ChunkSize;
++    const uintptr_t step  = js::gc::ChunkSize;
+     uintptr_t hint;
+     void* region = MAP_FAILED;
+     for (hint = start; region == MAP_FAILED && hint + length <= end; hint += step) {
+         region = mmap((void*)hint, length, prot, flags, fd, offset);
+         if (region != MAP_FAILED) {
+             if ((uintptr_t(region) + (length - 1)) & 0xffff800000000000) {
+                 if (munmap(region, length)) {
+                     MOZ_RELEASE_ASSERT(errno == ENOMEM);
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz1266366.patch b/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz1266366.patch
new file mode 100644
index 0000000..cbe6924
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-45.0.2/mozbz1266366.patch
@@ -0,0 +1,33 @@
+
+# HG changeset patch
+# User Nicolas B. Pierron <nicolas.b.pierron@mozilla.com>
+# Date 1461215040 -7200
+# Node ID 797112ba4b5b719ae0a88e2ceb4a63f4d8c52f5a
+# Parent  c4d70631b3c641078e3300b439d3e01932d05252
+Bug 1266366 - Add branch64 functions to the none-backend MacroAssembler. r=h4writer, a=sylvestre
+
+Upstream-status: Backport
+
+diff --git a/js/src/jit/none/MacroAssembler-none.h b/js/src/jit/none/MacroAssembler-none.h
+--- a/js/src/jit/none/MacroAssembler-none.h
++++ b/js/src/jit/none/MacroAssembler-none.h
+@@ -254,16 +254,18 @@ class MacroAssemblerNone : public Assemb
+     template <typename T, typename S> void branchSub32(Condition, T, S, Label*) { MOZ_CRASH(); }
+     template <typename T, typename S> void branchPtr(Condition, T, S, Label*) { MOZ_CRASH(); }
+     template <typename T, typename S> void branchTestPtr(Condition, T, S, Label*) { MOZ_CRASH(); }
+     template <typename T, typename S> void branchDouble(DoubleCondition, T, S, Label*) { MOZ_CRASH(); }
+     template <typename T, typename S> void branchFloat(DoubleCondition, T, S, Label*) { MOZ_CRASH(); }
+     template <typename T, typename S> void branchPrivatePtr(Condition, T, S, Label*) { MOZ_CRASH(); }
+     template <typename T, typename S> void decBranchPtr(Condition, T, S, Label*) { MOZ_CRASH(); }
+     template <typename T, typename S> void branchTest64(Condition, T, T, S, Label*) { MOZ_CRASH(); }
++    template <typename T, typename S> void branch64(Condition, T, S, Label*) { MOZ_CRASH(); }
++    template <typename T, typename S> void branch64(Condition, T, T, S, Label*) { MOZ_CRASH(); }
+     template <typename T, typename S> void mov(T, S) { MOZ_CRASH(); }
+     template <typename T, typename S> void movq(T, S) { MOZ_CRASH(); }
+     template <typename T, typename S> void movePtr(T, S) { MOZ_CRASH(); }
+     template <typename T, typename S> void move32(T, S) { MOZ_CRASH(); }
+     template <typename T, typename S> void moveFloat32(T, S) { MOZ_CRASH(); }
+     template <typename T, typename S> void moveDouble(T, S) { MOZ_CRASH(); }
+     template <typename T, typename S> void move64(T, S) { MOZ_CRASH(); }
+     template <typename T> CodeOffset movWithPatch(T, Register) { MOZ_CRASH(); }
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_45.0.2.bb b/meta-oe/recipes-extended/mozjs/mozjs_45.0.2.bb
new file mode 100644
index 0000000..b2d83f4
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs_45.0.2.bb
@@ -0,0 +1,111 @@
+SUMMARY = "SpiderMonkey is Mozilla's JavaScript engine written in C/C++"
+LICENSE = "MPL-2.0"
+LIC_FILES_CHKSUM = "file://../../LICENSE;md5=815ca599c9df247a0c7f619bab123dad"
+
+SRC_URI = " \
+    https://people.mozilla.org/~sfink/mozjs-${PV}.tar.bz2 \
+    file://0001-configure-use-host-python.patch \
+    file://mozbz-1143022.patch;patchdir=../../ \
+    file://mozbz-1277742.patch;patchdir=../../ \
+    file://mozbz1266366.patch;patchdir=../../ \
+"
+
+SRC_URI[md5sum] = "2ca34f998d8b5ea79d8616dd26b5fbab"
+SRC_URI[sha256sum] = "570530b1e551bf4a459d7cae875f33f99d5ef0c29ccc7742a1b6f588e5eadbee"
+
+S = "${WORKDIR}/${BPN}-${PV}/js/src"
+
+# patch.bbclass will try to apply the patches already present and fail, so clean them out
+do_unpack() {
+    tar -xvf ${DL_DIR}/mozjs-${PV}.tar.bz2 -C ${WORKDIR}/
+    rm -rf ${WORKDIR}/${BPN}-${PV}/patches
+}
+
+inherit autotools pkgconfig perlnative
+#pythonnative
+
+DEPENDS += "nspr zlib icu libffi readline"
+
+# nspr's package-config is ignored so set libs manually
+EXTRA_OECONF = " \
+    --target=${TARGET_SYS} \
+    --host=${BUILD_SYS} \
+    --build=${BUILD_SYS} \
+    --prefix=${prefix} \
+    --libdir=${libdir} \
+    --enable-xterm-updates \
+    --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \ 
+    --enable-threadsafe \
+    --with-system-zlib \
+    --enable-system-ffi \
+    --with-system-icu \
+    --without-intl-api \
+    --enable-pie \
+    --disable-static \
+    --disable-optimize \
+"
+EXTRA_OECONF_append_armv4 += " \
+    --disable-methodjit \
+"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG[x11] = "--with-x --x-includes=${STAGING_INCDIR} --x-libraries=${STAGING_LIBDIR},--without-x,virtual/libx11"
+
+# DEBUG: Executing shell function do_configure                                                                                                                                                                                                 
+#  /usr/bin/perl: symbol lookup error: /build/[..]/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.1/auto/Data/Dumper/Dumper.so: undefined symbol: Perl_xs_handshake                  
+export PERL = "${STAGING_BINDIR_NATIVE}/perl-native/perl"
+#export PYTHON = "${STAGING_BINDIR_NATIVE}/python-native/python"
+
+# Need -fpermissive due to some macros using nullptr as bool false
+CFLAGS += "-fpermissive -fno-tree-vrp -fno-strict-aliasing"
+CXXFLAGS += "-fpermissive -fno-tree-vrp -fno-strict-aliasing"
+CXXFLAGS_remove = "-fvisibility-inlines-hidden"
+
+# mozjs requires autoreconf 2.13
+do_configure() {
+    # clean up virtualenv, configure will happily ignore changes to the sysroot :/
+    rm -rf ${B}/_virtualenv
+
+    export SHELL="/bin/sh"
+
+    ( cd ${S} 
+      gnu-configize --force 
+      cp config.guess config.sub ../../build/autoconf
+    )
+    ${S}/configure ${EXTRA_OECONF}
+}
+
+# Fails to build with thumb-1 (qemuarm)
+#| {standard input}: Assembler messages:
+#| {standard input}:2172: Error: shifts in CMP/MOV instructions are only supported in unified syntax -- `mov r2,r1,LSR#20'
+#| {standard input}:2173: Error: unshifted register required -- `bic r2,r2,#(1<<11)'
+#| {standard input}:2174: Error: unshifted register required -- `orr r1,r1,#(1<<20)'
+#| {standard input}:2176: Error: instruction not supported in Thumb16 mode -- `subs r2,r2,#0x300'
+#| {standard input}:2178: Error: instruction not supported in Thumb16 mode -- `subs r5,r2,#52'
+ARM_INSTRUCTION_SET = "arm"
+
+do_compile_prepend() {
+    # From the fedora .spec file http://pkgs.fedoraproject.org/cgit/rpms/mozjs45.git/tree/mozjs45.spec
+
+    # Make mozjs these functions visible:
+    # JS::UTF8CharsToNewTwoByteCharsZ and JS::LossyUTF8CharsToNewTwoByteCharsZ
+    sed -i 's|^\(TwoByteCharsZ\)$|JS_PUBLIC_API\(\1\)|g' ${S}/vm/CharacterEncoding.cpp
+    sed -i 's|^extern\ \(TwoByteCharsZ\)$|JS_PUBLIC_API\(\1\)|g' ${S}/../public/CharacterEncoding.h
+    # Also make visible js::DisableExtraThreads()
+    sed -i '/^void$/{$!{N;s/^\(void\)\n\(js\:\:DisableExtraThreads()\)$/JS_PUBLIC_API\(\1\)\n\2/;ty;P;D;:y}}'  ${S}/vm/Runtime.cpp
+    sed -i 's|\(void\) \(DisableExtraThreads()\)|JS_PUBLIC_API\(\1\) \2|g'  ${S}/vm/Runtime.h
+}
+
+do_install_append() {
+    ( cd ${D}${includedir}
+    for link in $(find . -type l); do
+	header=$(readlink $link)
+	rm -f $link
+	cp -p $header $link
+    done )
+}
+
+PACKAGES =+ "lib${PN}"
+FILES_lib${PN} += "${libdir}/lib*.so ${libdir}/lib*.ajs"
+FILES_${PN}-dev += "${bindir}/js*-config"
+
-- 
2.4.3


