Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4AD207BFB3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2019 06:47:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5J6llpK021894
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Jun 2019 23:47:47 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Tue, 18 Jun 2019 23:47:46 -0700
From: <mingli.yu@windriver.com>
To: <raj.khem@gmail.com>, <openembedded-devel@lists.openembedded.org>
Date: Wed, 19 Jun 2019 14:47:45 +0800
Message-ID: <1560926865-286631-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [meta-oe][PATCH] mozjs: Fix do_patch error for mips64-n32
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
X-List-Received-Date: Wed, 19 Jun 2019 06:47:47 -0000
Content-Type: text/plain

From: Mingli Yu <Mingli.Yu@windriver.com>

After mozjs upgrade to 60.5.2 in below commit:
9ca3aad9c mozjs: Upgrade to version 60.x

With below logic in local.conf:
MACHINE ??= "qemumips64"
MULTILIB_GLOBAL_VARIANTS_append = " libn32"
MULTILIBS ?= "multilib:lib32 multilib:libn32"
DEFAULTTUNE_virtclass-multilib-lib32 ?= "mips"
DEFAULTTUNE_virtclass-multilib-libn32 ?= "mips64-n32"
require conf/multilib.conf

$ bitbake libn32-mozjs -cpatch
| NOTE: Applying patch '0001-fix-compiling-failure-on-mips64-n32-bsp.patch' (../layers/meta-openembedded/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch)
| ERROR: Command Error: 'quilt --quiltrc TOPDIR/tmp/work/mips64-n32-wrsmllibn32-linux-gnun32/libn32-mozjs/60.5.2-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
| Applying patch 0001-fix-compiling-failure-on-mips64-n32-bsp.patch
| patching file build/moz.configure/init.configure
| patching file js/src/jit/mips-shared/Architecture-mips-shared.h
| Hunk #1 succeeded at 28 with fuzz 2 (offset 2 lines).
| Hunk #2 FAILED at 95.
| 1 out of 2 hunks FAILED -- rejects in file js/src/jit/mips-shared/Architecture-mips-shared.h
| patching file python/mozbuild/mozbuild/configure/constants.py
| Patch 0001-fix-compiling-failure-on-mips64-n32-bsp.patch does not apply (enforce with -f)

Rework 0001-fix-compiling-failure-on-mips64-n32-bsp.patch
to fix the above do_patch error.

Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
---
 ...1-fix-compiling-failure-on-mips64-n32-bsp.patch | 36 ++++++++++++++--------
 1 file changed, 23 insertions(+), 13 deletions(-)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
index a36478b..b882d76 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
@@ -1,6 +1,6 @@
-From 5ad700c92224193bfc789f7d53af38fc6f8b8904 Mon Sep 17 00:00:00 2001
+From f2f8be496c8e34b4d909b688a95c6f8565201081 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Thu, 19 Jul 2018 17:31:35 +0800
+Date: Wed, 19 Jun 2019 14:30:44 +0800
 Subject: [PATCH] fix compiling failure on mips64-n32 bsp
 
 - Tweak mips64-n32 with mips32
@@ -16,15 +16,18 @@ Subject: [PATCH] fix compiling failure on mips64-n32 bsp
 Upstream-Status: Inappropriate [oe specific]
 
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
 ---
  build/moz.configure/init.configure                | 5 ++++-
  js/src/jit/mips-shared/Architecture-mips-shared.h | 4 +++-
  python/mozbuild/mozbuild/configure/constants.py   | 2 +-
  3 files changed, 8 insertions(+), 3 deletions(-)
 
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
+index 648ac2d..d0bcaf8 100644
 --- a/build/moz.configure/init.configure
 +++ b/build/moz.configure/init.configure
-@@ -650,7 +650,10 @@ def split_triplet(triplet, allow_unknown
+@@ -650,7 +650,10 @@ def split_triplet(triplet, allow_unknown=False):
          canonical_cpu = 'mips32'
          endianness = 'little' if 'el' in cpu else 'big'
      elif cpu in ('mips64', 'mips64el'):
@@ -36,26 +39,30 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
          endianness = 'little' if 'el' in cpu else 'big'
      elif cpu.startswith('aarch64'):
          canonical_cpu = 'aarch64'
+diff --git a/js/src/jit/mips-shared/Architecture-mips-shared.h b/js/src/jit/mips-shared/Architecture-mips-shared.h
+index e95ffd4..caf83f7 100644
 --- a/js/src/jit/mips-shared/Architecture-mips-shared.h
 +++ b/js/src/jit/mips-shared/Architecture-mips-shared.h
-@@ -26,6 +26,8 @@
- #define USES_O32_ABI
- #elif (defined(_MIPS_SIM) && (_MIPS_SIM == _ABI64)) || defined(JS_SIMULATOR_MIPS64)
+@@ -28,6 +28,8 @@
+ #elif (defined(_MIPS_SIM) && (_MIPS_SIM == _ABI64)) || \
+     defined(JS_SIMULATOR_MIPS64)
  #define USES_N64_ABI
 +#elif (defined(_MIPS_SIM) && (_MIPS_SIM == _ABIN32))
 +#define USES_N32_ABI
  #else
  #error "Unsupported ABI"
  #endif
-@@ -93,7 +95,7 @@ class Registers
-         ta1 = t5,
-         ta2 = t6,
-         ta3 = t7,
+@@ -94,7 +96,7 @@ class Registers {
+     ta1 = t5,
+     ta2 = t6,
+     ta3 = t7,
 -#elif defined(USES_N64_ABI)
 +#elif defined(USES_N64_ABI) || defined(USES_N32_ABI)
-         a4 = r8,
-         a5 = r9,
-         a6 = r10,
+     a4 = r8,
+     a5 = r9,
+     a6 = r10,
+diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
+index 1067b6a..e0f0405 100644
 --- a/python/mozbuild/mozbuild/configure/constants.py
 +++ b/python/mozbuild/mozbuild/configure/constants.py
 @@ -90,8 +90,8 @@ CPU_preprocessor_checks = OrderedDict((
@@ -68,3 +75,6 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
      ('sh4', '__sh__'),
  ))
  
+-- 
+2.7.4
+
-- 
2.7.4


