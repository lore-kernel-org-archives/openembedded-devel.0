Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 276E978A71
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2018 14:04:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6KE4RXQ008345
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 20 Jul 2018 07:04:28 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 20 Jul 2018 07:04:26 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <raj.khem@gmail.com>
Date: Fri, 20 Jul 2018 22:14:37 +0800
Message-ID: <1532096077-26473-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs: add support for mips64-n32
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
X-List-Received-Date: Fri, 20 Jul 2018 14:04:28 -0000
Content-Type: text/plain

- Tweak configure for mips64-n32

- Disable gold linker which not supported by mips64-n32

- Since n32 and n64 use the same registers, add n32 to
  n64's register definition.

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...1-fix-compiling-failure-on-mips64-n32-bsp.patch | 79 ++++++++++++++++++++++
 meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb     |  7 ++
 2 files changed, 86 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch

diff --git a/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
new file mode 100644
index 0000000..bc1af3c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs/0001-fix-compiling-failure-on-mips64-n32-bsp.patch
@@ -0,0 +1,79 @@
+From 5ad700c92224193bfc789f7d53af38fc6f8b8904 Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Thu, 19 Jul 2018 17:31:35 +0800
+Subject: [PATCH] fix compiling failure on mips64-n32 bsp
+
+- Tweak mips64-n32 with mips32
+
+- The toolchain of mips64-n32 supports both of macro
+  `__mips64' and `__mips__', but 32bit is required here.
+
+- N32 uses 64-bit registers but restricts addresses to 32 bits.
+  https://www.linux-mips.org/pub/linux/mips/doc/ABI/MIPS-N32-ABI-Handbook.pdf
+  Table 2-1 specifies the use of registers in n32 and native 64-bit mode.
+  From the table, N32 and N64 have the same registers
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ build/moz.configure/init.configure                | 5 ++++-
+ js/src/jit/mips-shared/Architecture-mips-shared.h | 4 +++-
+ python/mozbuild/mozbuild/configure/constants.py   | 2 +-
+ 3 files changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/init.configure
+index 6fe6591..a77b46c 100644
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -357,7 +357,10 @@ def split_triplet(triplet):
+         canonical_cpu = 'mips32'
+         endianness = 'little' if 'el' in cpu else 'big'
+     elif cpu in ('mips64', 'mips64el'):
+-        canonical_cpu = 'mips64'
++        if 'n32' in triplet:
++            canonical_cpu = 'mips32'
++        else:
++            canonical_cpu = 'mips64'
+         endianness = 'little' if 'el' in cpu else 'big'
+     elif cpu.startswith('aarch64'):
+         canonical_cpu = 'aarch64'
+diff --git a/js/src/jit/mips-shared/Architecture-mips-shared.h b/js/src/jit/mips-shared/Architecture-mips-shared.h
+index 7afe305..c6e29dc 100644
+--- a/js/src/jit/mips-shared/Architecture-mips-shared.h
++++ b/js/src/jit/mips-shared/Architecture-mips-shared.h
+@@ -24,6 +24,8 @@
+ #define USES_O32_ABI
+ #elif (defined(_MIPS_SIM) && (_MIPS_SIM == _ABI64)) || defined(JS_SIMULATOR_MIPS64)
+ #define USES_N64_ABI
++#elif (defined(_MIPS_SIM) && (_MIPS_SIM == _ABIN32))
++#define USES_N32_ABI
+ #else
+ #error "Unsupported ABI"
+ #endif
+@@ -91,7 +93,7 @@ class Registers
+         ta1 = t5,
+         ta2 = t6,
+         ta3 = t7,
+-#elif defined(USES_N64_ABI)
++#elif defined(USES_N64_ABI) || defined(USES_N32_ABI)
+         a4 = r8,
+         a5 = r9,
+         a6 = r10,
+diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mozbuild/mozbuild/configure/constants.py
+index dfc7cf8..27f83ab 100644
+--- a/python/mozbuild/mozbuild/configure/constants.py
++++ b/python/mozbuild/mozbuild/configure/constants.py
+@@ -83,8 +83,8 @@ CPU_preprocessor_checks = OrderedDict((
+     ('hppa', '__hppa__'),
+     ('sparc64', '__sparc__ && __arch64__'),
+     ('sparc', '__sparc__'),
+-    ('mips64', '__mips64'),
+     ('mips32', '__mips__'),
++    ('mips64', '__mips64'),
+ ))
+ 
+ assert sorted(CPU_preprocessor_checks.keys()) == sorted(CPU.POSSIBLE_VALUES)
+-- 
+2.7.4
+
diff --git a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
index 7909602..5996812 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs_52.8.1.bb
@@ -15,12 +15,18 @@ SRC_URI = "http://archive.ubuntu.com/ubuntu/pool/main/m/mozjs52/mozjs52_52.8.1.o
 SRC_URI_append_libc-musl = " \
            file://0006-support-musl.patch \
            "
+SRC_URI_append_mipsarchn32 = " \
+           file://0001-fix-compiling-failure-on-mips64-n32-bsp.patch \
+           "
 
 SRC_URI[md5sum] = "3a44c2fd3d7b5a370ed9184163c74bc4"
 SRC_URI[sha256sum] = "fb5e11b7f31a33be820d5c947c5fa114751b0d5033778c1cd8e0cf2dad91e8fa"
 
 inherit autotools pkgconfig perlnative pythonnative
 
+inherit distro_features_check
+CONFLICT_DISTRO_FEATURES_mipsarchn32 = "ld-is-gold"
+
 DEPENDS += "nspr zlib"
 
 # nspr's package-config is ignored so set libs manually
@@ -31,6 +37,7 @@ EXTRA_OECONF = " \
     --libdir=${libdir} \
     --disable-tests \
     --with-nspr-libs='-lplds4 -lplc4 -lnspr4' \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'ld-is-gold', "--enable-gold", '--disable-gold', d)} \
 "
 
 PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}"
-- 
2.7.4


