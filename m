Return-Path: <naveen.kumar.saini@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CDEC4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 09:17:20 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web10.7990.1672823836537589870
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Jan 2023 01:17:16 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel header.b=XaJa+cob;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: naveen.kumar.saini@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1672823836; x=1704359836;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iyLmApfPUtALRX/lsH2XsmmQT6bh3V1tT7bzO2YLWQY=;
  b=XaJa+cobL44KlmGnGN7b8JS1T090kBg1IIio06WhWjHIux7zy3c92lWB
   aLjh1ZAs3i373eNBMBaTnQQKSAx2rPEorcWSYUwkcNfLwykPjTpnhN3dh
   DzAmR7AnEcp3voCdQpXzxfDTHzuM8lB9rkmem03oI1vhQznBh0rrsjzV7
   9KfyFMXW4Jb29jukdhYxy1bJEew0cCUxkM6/CY2/CtyPMMhBNs4YS2YBx
   4BcI0IthNlv0qhNCfzIq5KCT+sTwBU0qfOVJQGzHLzpa6gMj1p/KQAbKB
   ryxhJaOjDlIho8FZLAtxgj/YKZIZUpUD9r6/aKXafQB3+bBHvVvTK7EuC
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="319597265"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="319597265"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 01:17:16 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="797462982"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; 
   d="scan'208";a="797462982"
Received: from saininav-desk1.png.intel.com ([172.30.130.9])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2023 01:17:15 -0800
From: Naveen Saini <naveen.kumar.saini@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] tbb: upgrade 2021.5.0 -> 2021.7.0
Date: Wed,  4 Jan 2023 17:39:05 +0800
Message-Id: <20230104093905.1355831-1-naveen.kumar.saini@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 04 Jan 2023 09:17:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100390

Drop patches which are already merged. Also drop
which are not required anymore.

Tested following machines with both gcc and clang:
qemuarm
qemuarm64
qemuriscv32
qemuriscv64

Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
---
 .../0001-Disable-LTO-on-clang-riscv32.patch   | 29 ----------------
 ...1-Disable-use-of-_tpause-instruction.patch | 29 ----------------
 ...Musl-linux-can-not-use-RTLD_DEEPBIND.patch | 33 -------------------
 ...nfo-is-glibc-specific-API-mark-it-so.patch | 33 -------------------
 .../tbb/{tbb_2021.5.0.bb => tbb_2021.7.0.bb}  | 13 ++++----
 5 files changed, 6 insertions(+), 131 deletions(-)
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
 delete mode 100644 meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
 rename meta-oe/recipes-support/tbb/{tbb_2021.5.0.bb => tbb_2021.7.0.bb} (74%)

diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch b/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
deleted file mode 100644
index 662065635..000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-Disable-LTO-on-clang-riscv32.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 95a5c97122b7c5bdeba61f2e890bae9a961dd4bf Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 8 Dec 2021 10:01:22 -0800
-Subject: [PATCH] Disable LTO on clang/riscv
-
-With clang in OE LTO does not work as it does not seem to carry right
-target info and mixes ABIs
-
-| Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)
-| /mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/tbb/1_2021.4.0-r0/recipe-sysroot-native/usr/bin/riscv32-yoe-linux/riscv32-yoe-linux-ld: /tmp/lto-llvm-3fb1bf.o: can't link soft-float modules with double-float modules
-| /mnt/b/yoe/master/build/tmp/work/riscv32-yoe-linux/tbb/1_2021.4.0-r0/recipe-sysroot-native/usr/bin/riscv32-yoe-linux/riscv32-yoe-linux-ld: failed to merge target specific data of file /tmp/lto-llvm-3fb1bf.o
-
-Upstream-Status: Inappropriate [ OE-Specific ]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- cmake/compilers/Clang.cmake | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/cmake/compilers/Clang.cmake
-+++ b/cmake/compilers/Clang.cmake
-@@ -60,7 +60,7 @@ endif()
- 
- # Enabling LTO on Android causes the NDK bug.
- # NDK throws the warning: "argument unused during compilation: '-Wa,--noexecstack'"
--if (NOT ANDROID_PLATFORM AND BUILD_SHARED_LIBS)
-+if (NOT ANDROID_PLATFORM AND BUILD_SHARED_LIBS AND NOT CMAKE_SYSTEM_PROCESSOR MATCHES "(riscv32|riscv64|arm)")
-     set(TBB_IPO_COMPILE_FLAGS $<$<NOT:$<CONFIG:Debug>>:-flto>)
-     set(TBB_IPO_LINK_FLAGS $<$<NOT:$<CONFIG:Debug>>:-flto>)
- endif()
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch b/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
deleted file mode 100644
index 78051d7ee..000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-Disable-use-of-_tpause-instruction.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 26bc87fdad9f29c00a5e37d6d9aed7f6dc7ff416 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Mon, 12 Apr 2021 14:15:53 +0800
-Subject: [PATCH] Disable use of _tpause instruction
-
-It is assuming right now that WAITPKG instructions are available when using
-gcc 11 or clang 12. It's possible that we are building for a
-CPU where it's not available - in this case anything older than Alder Lake.
-
-Disable for now until the detection isn't fixed upstream.
-
-Upstream-Status: Inappropriate
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- src/tbb/scheduler_common.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/src/tbb/scheduler_common.h
-+++ b/src/tbb/scheduler_common.h
-@@ -220,7 +220,7 @@ inline void prolonged_pause_impl() {
- #endif
- 
- inline void prolonged_pause() {
--#if __TBB_WAITPKG_INTRINSICS_PRESENT && (_WIN32 || _WIN64 || __unix__) && (__TBB_x86_32 || __TBB_x86_64)
-+#if 0
-     if (governor::wait_package_enabled()) {
-         std::uint64_t time_stamp = machine_time_stamp();
-         // _tpause function directs the processor to enter an implementation-dependent optimized state
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch b/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
deleted file mode 100644
index 355cf2e0b..000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From a7289eeff4ac9e3ca2d2289672c923518433124c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 8 Dec 2021 09:26:58 -0800
-Subject: [PATCH] Musl/linux can not use RTLD_DEEPBIND
-
-Exclude non-glibc linux systems along with android
-Fixes
-src/tbb/dynamic_link.cpp:417:29: error: use
- of undeclared identifier 'RTLD_DEEPBIND'                                                                                    |             flags = flags | RTLD_DEEPBIND;
-|                             ^
-
-Upstream-Status: Submitted [https://github.com/oneapi-src/oneTBB/pull/684]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/tbb/dynamic_link.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/tbb/dynamic_link.cpp b/src/tbb/dynamic_link.cpp
-index 12f35cfd..942c1c64 100644
---- a/src/tbb/dynamic_link.cpp
-+++ b/src/tbb/dynamic_link.cpp
-@@ -413,7 +413,7 @@ namespace r1 {
-         int flags = RTLD_NOW;
-         if (local_binding) {
-             flags = flags | RTLD_LOCAL;
--#if __linux__ && !__ANDROID__ && !__TBB_USE_SANITIZERS
-+#if (__linux__ && __GLIBC__) && !__TBB_USE_SANITIZERS
-             flags = flags | RTLD_DEEPBIND;
- #endif
-         } else {
--- 
-2.34.1
-
diff --git a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch b/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
deleted file mode 100644
index 9af37ebc6..000000000
--- a/meta-oe/recipes-support/tbb/tbb/0001-mallinfo-is-glibc-specific-API-mark-it-so.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 52c1586bff0ecb418ac21d6678f8963d70959f04 Mon Sep 17 00:00:00 2001
-From: Naveen Saini <naveen.kumar.saini@intel.com>
-Date: Wed, 7 Apr 2021 11:14:13 +0800
-Subject: [PATCH] mallinfo() is glibc specific API mark it so
-
-Helps compiling with musl
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
----
- src/tbbmalloc_proxy/proxy.cpp | 2 ++
- 1 file changed, 2 insertions(+)
-
---- a/src/tbbmalloc_proxy/proxy.cpp
-+++ b/src/tbbmalloc_proxy/proxy.cpp
-@@ -260,6 +260,7 @@ int mallopt(int /*param*/, int /*value*/
-     return 1;
- }
- 
-+#ifdef __GLIBC__
- struct mallinfo mallinfo() __THROW
- {
-     struct mallinfo m;
-@@ -267,6 +268,7 @@ struct mallinfo mallinfo() __THROW
- 
-     return m;
- }
-+#endif
- 
- #if __ANDROID__
- // Android doesn't have malloc_usable_size, provide it to be compatible
diff --git a/meta-oe/recipes-support/tbb/tbb_2021.5.0.bb b/meta-oe/recipes-support/tbb/tbb_2021.7.0.bb
similarity index 74%
rename from meta-oe/recipes-support/tbb/tbb_2021.5.0.bb
rename to meta-oe/recipes-support/tbb/tbb_2021.7.0.bb
index 0d108f21a..8c72b349d 100644
--- a/meta-oe/recipes-support/tbb/tbb_2021.5.0.bb
+++ b/meta-oe/recipes-support/tbb/tbb_2021.7.0.bb
@@ -12,15 +12,10 @@ DEPENDS:append:libc-musl = " libucontext"
 PE = "1"
 
 BRANCH = "onetbb_2021"
-SRCREV = "3df08fe234f23e732a122809b40eb129ae22733f"
+SRCREV = "7673da272f7e1592876b42cfe98b9f4cadf6ae41"
 SRC_URI = "git://github.com/oneapi-src/oneTBB.git;protocol=https;branch=${BRANCH} \
-            file://0001-mallinfo-is-glibc-specific-API-mark-it-so.patch \
             file://0001-CMakeLists.txt-exclude-riscv64-riscv32.patch \
-            file://0001-Disable-use-of-_tpause-instruction.patch \
-            file://0001-Musl-linux-can-not-use-RTLD_DEEPBIND.patch \
-            file://0001-Disable-LTO-on-clang-riscv32.patch \
 "
-
 S = "${WORKDIR}/git"
 
 inherit cmake
@@ -30,7 +25,11 @@ EXTRA_OECMAKE += " \
                     -DTBB_TEST=OFF \
                     -DCMAKE_BUILD_TYPE=Release \
                 "
-
+# Hard-float 'd' ABI can't be used for a target that doesn't support the D instruction set extension (ignoring target-abi)
+# tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: /tmp/lto-llvm-264bc2.o: can't link soft-float modules with double-float modules
+# tmp-glibc/work/riscv64-oe-linux/tbb/1_2021.7.0-r0/recipe-sysroot-native/usr/bin/riscv64-oe-linux/riscv64-oe-linux-ld: failed to merge target specific data of file /tmp/lto-llvm-264bc2.o
+EXTRA_OECMAKE:append:riscv32:toolchain-clang = " -DTBB_ENABLE_IPO=OFF "
+EXTRA_OECMAKE:append:riscv64:toolchain-clang = " -DTBB_ENABLE_IPO=OFF "
 
 # fails with thumb enabled:
 # | arm-oe-linux-gnueabi-g++  -march=armv7-a -mthumb -mthumb-interwork -mfloat-abi=softfp -mfpu=neon -mtune=cortex-a9 -mcpu=cortex-a9 -D__ARM__ -D__LINUX_ARM_ARCH__=7 -funwind-tables -mvectorize-with-neon-quad -rdynamic --sysroot=/OE/sysroots/m14tv -c -MMD -DTBB_USE_DEBUG  -g -O0 -DUSE_PTHREAD -fPIC -D__TBB_BUILD=1 -Wall -Wno-parentheses -Wno-non-virtual-dtor -O2 -pipe -g -feliminate-unused-debug-types -fpermissive -fvisibility-inlines-hidden   -I../../src -I../../src/rml/include -I../../include ../../src/tbb/concurrent_queue.cpp
-- 
2.25.1


