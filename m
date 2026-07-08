Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF58BC43602
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 09:45:20 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4897.1783503917836852504
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Jul 2026 02:45:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=P8XPTO1t;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1783503918; x=1815039918;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Fe4nU6+bunSr26uSTzP/9QEjornLuTuUW608dcVH/MA=;
  b=P8XPTO1tQxQVCfpsoF4IB6dJrfQB5/jDf//n3/k2+UMWy6uMFz7sMMbu
   iBUKkwqkgvIVRYuVxIqQiwAlV1wRfNZGxqPnYaPkHhv4bwFsr73IzlnM+
   jYBLEhuXFYe2H8oSJ3tEhn/TnEHyJXAL/WltJDKy3fHlfu0iLryENmmYy
   90TE7EmoyMBzfErBTDqKacWkSe2ghEbuSMV0fKRD2DhOrZDv5tLUJoE9v
   uM0w3cD/S2xd7wkyA/EQPEO66O5/zHCC5LB99eHLeNLrPj34f3owiiawV
   jsb12zm/I+RKxWcutnrtHEU2awqAFE+RXdp37vUxiT4mpT2c0Bop1mQm4
   w==;
X-CSE-ConnectionGUID: YeSnu7UBTOu2Af1dCFdXGQ==
X-CSE-MsgGUID: Dip/eIItTYWb+vs0m4rljA==
X-IronPort-AV: E=McAfee;i="6800,10657,11840"; a="234654535"
X-IronPort-AV: E=Sophos;i="6.25,153,1779116400"; 
   d="scan'208";a="234654535"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 18:45:15 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id CACAB33C5
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:15 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 78E731C2DF7D
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Jul 2026 09:45:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 62A381800C26;
	Wed,  8 Jul 2026 09:45:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/37] bcc: upgrade 0.36.1 -> 0.37.0
Date: Wed,  8 Jul 2026 17:44:11 +0800
Message-ID: <20260708094508.2060-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Jul 2026 09:45:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128072

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch
0002-Add-riscv-syscall-prefix-detection-in-C-API.patch
0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch
0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch
0001-Fix-build-with-LLVM-22.patch
removed since they're included in 0.37.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...64-syscall-prefix-detection-in-C-API.patch | 35 ----------
 .../bcc/bcc/0001-Fix-build-with-LLVM-22.patch | 61 -----------------
 ...cv-syscall-prefix-detection-in-C-API.patch | 32 ---------
 ...move-x86-specific-naming-from-tracin.patch | 25 -------
 ...d-ARM-and-AArch64-support-to-static-.patch | 67 -------------------
 .../bcc/{bcc_0.36.1.bb => bcc_0.37.0.bb}      |  7 +-
 6 files changed, 1 insertion(+), 226 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Fix-build-with-LLVM-22.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0002-Add-riscv-syscall-prefix-detection-in-C-API.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/{bcc_0.36.1.bb => bcc_0.37.0.bb} (90%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch
deleted file mode 100644
index d6b52438c4..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From b901fb0088a7605eec00af7b644e25987995d693 Mon Sep 17 00:00:00 2001
-From: Harish Sadineni <Harish.Sadineni@windriver.com>
-Date: Sat, 7 Mar 2026 07:18:43 -0800
-Subject: [PATCH] Add ARM64 syscall prefix detection in C++ API
-
-Fixes issue where bpf.get_syscall_fnname() on ARM64 returns bare
-syscall name instead of the prefixed __arm64_sys_ variant, causing
-kprobe attachment failures. Now detects ARM64 prefix alongside x64
-(__x64_sys_) and generic (sys_) prefixes.
-
-Fixes: #5350
-
-Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5489]
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- src/cc/api/BPF.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/cc/api/BPF.cc b/src/cc/api/BPF.cc
-index 2a77c2c9..11c6c542 100644
---- a/src/cc/api/BPF.cc
-+++ b/src/cc/api/BPF.cc
-@@ -780,6 +780,8 @@ std::string BPF::get_syscall_fnname(const std::string& name) {
-       syscall_prefix_.reset(new std::string("sys_"));
-     else if (ksym.resolve_name(nullptr, "__x64_sys_bpf", &addr))
-       syscall_prefix_.reset(new std::string("__x64_sys_"));
-+    else if (ksym.resolve_name(nullptr, "__arm64_sys_bpf", &addr))
-+      syscall_prefix_.reset(new std::string("__arm64_sys_"));
-     else
-       syscall_prefix_.reset(new std::string());
-   }
--- 
-2.49.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Fix-build-with-LLVM-22.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Fix-build-with-LLVM-22.patch
deleted file mode 100644
index 19f0a6ccb4..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Fix-build-with-LLVM-22.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From 4c7be1ec6ab74e973f8d18a9011fa349c3d9dd58 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Holger=20Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>
-Date: Mon, 2 Mar 2026 10:03:15 +0100
-Subject: [PATCH] Fix build with LLVM-22
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-LLVM-22 changed the signatures of various createDiagnostics() calls [1].
-Introduce a new version macro guard and adapt the code to the changed API.
-
-Fixes #5483
-
-[1] https://github.com/llvm/llvm-project/commit/30633f30894129919050f24fdd1f8f6bc46beae0
-
-Upstream-Status: Backport [https://github.com/iovisor/bcc/commit/4c7be1ec6ab74e973f8d18a9011fa349c3d9dd58]
-Signed-off-by: Holger Hoffstätte <holger@applied-asynchrony.com>
----
- src/cc/frontends/clang/loader.cc | 15 ++++++++++++---
- 1 file changed, 12 insertions(+), 3 deletions(-)
-
-diff --git a/src/cc/frontends/clang/loader.cc b/src/cc/frontends/clang/loader.cc
-index 6f8387aa..1f706344 100644
---- a/src/cc/frontends/clang/loader.cc
-+++ b/src/cc/frontends/clang/loader.cc
-@@ -464,7 +464,10 @@ int ClangLoader::do_compile(
-   }
-   invocation0.getFrontendOpts().DisableFree = false;
-
--#if LLVM_VERSION_MAJOR >= 20
-+#if LLVM_VERSION_MAJOR >= 22
-+  compiler0.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
-+  compiler0.createDiagnostics(new IgnoringDiagConsumer());
-+#elif LLVM_VERSION_MAJOR >= 20
-   compiler0.createDiagnostics(*llvm::vfs::getRealFileSystem(), new IgnoringDiagConsumer());
- #else
-   compiler0.createDiagnostics(new IgnoringDiagConsumer());
-@@ -487,7 +490,10 @@ int ClangLoader::do_compile(
-   add_main_input(invocation1, main_path, &*out_buf);
-   invocation1.getFrontendOpts().DisableFree = false;
-
--#if LLVM_VERSION_MAJOR >= 20
-+#if LLVM_VERSION_MAJOR >= 22
-+  compiler1.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
-+  compiler1.createDiagnostics();
-+#elif LLVM_VERSION_MAJOR >= 20
-   compiler1.createDiagnostics(*llvm::vfs::getRealFileSystem());
- #else
-   compiler1.createDiagnostics();
-@@ -517,7 +523,10 @@ int ClangLoader::do_compile(
-   invocation2.getCodeGenOpts().setInlining(CodeGenOptions::NormalInlining);
-   // suppress warnings in the 2nd pass, but bail out on errors (our fault)
-   invocation2.getDiagnosticOpts().IgnoreWarnings = true;
--#if LLVM_VERSION_MAJOR >= 20
-+#if LLVM_VERSION_MAJOR >= 22
-+  compiler2.setVirtualFileSystem(llvm::vfs::getRealFileSystem());
-+  compiler2.createDiagnostics();
-+#elif LLVM_VERSION_MAJOR >= 20
-   compiler2.createDiagnostics(*llvm::vfs::getRealFileSystem());
- #else
-   compiler2.createDiagnostics();
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0002-Add-riscv-syscall-prefix-detection-in-C-API.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0002-Add-riscv-syscall-prefix-detection-in-C-API.patch
deleted file mode 100644
index 78bf1df7c3..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0002-Add-riscv-syscall-prefix-detection-in-C-API.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From da01655f0f335584867b3427005b95384499a020 Mon Sep 17 00:00:00 2001
-From: Harish Sadineni <Harish.Sadineni@windriver.com>
-Date: Sat, 7 Mar 2026 20:20:04 -0800
-Subject: [PATCH 2/2] Add riscv syscall prefix detection in C++ API
-
-Fixes issue where bpf.get_syscall_fnname() on riscv64 returns bare syscall
-name instead of the prefixed _riscv_sys variant, causing kprobe
-attachment failures.
-
-Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5490]
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- src/cc/api/BPF.cc | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/src/cc/api/BPF.cc b/src/cc/api/BPF.cc
-index 11c6c542..e1df8208 100644
---- a/src/cc/api/BPF.cc
-+++ b/src/cc/api/BPF.cc
-@@ -782,6 +782,8 @@ std::string BPF::get_syscall_fnname(const std::string& name) {
-       syscall_prefix_.reset(new std::string("__x64_sys_"));
-     else if (ksym.resolve_name(nullptr, "__arm64_sys_bpf", &addr))
-       syscall_prefix_.reset(new std::string("__arm64_sys_"));
-+    else if (ksym.resolve_name(nullptr, "__riscv_sys_bpf", &addr))
-+      syscall_prefix_.reset(new std::string("__riscv_sys_"));
-     else
-       syscall_prefix_.reset(new std::string());
-   }
--- 
-2.49.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch
deleted file mode 100644
index 2c1ff2dd73..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From c2bd977c6c885d5cdca94ef5ac31bfcd9c4347ea Mon Sep 17 00:00:00 2001
-From: Harish Sadineni <Harish.Sadineni@windriver.com>
-Date: Sat, 7 Mar 2026 21:44:41 +0000
-Subject: [PATCH 1/2] folly/tracing: Remove x86-specific naming from tracing
- header
-
-Rename StaticTracepoint-ELFx86.h to StaticTracepoint-ELF.h so the header
-name is no longer tied to a specific architecture, enabling future
-support for additional architectures.
-
-Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5491]
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- .../tracing/{StaticTracepoint-ELFx86.h => StaticTracepoint-ELF.h} | 0
- 1 file changed, 0 insertions(+), 0 deletions(-)
- rename tests/python/include/folly/tracing/{StaticTracepoint-ELFx86.h => StaticTracepoint-ELF.h} (100%)
-
-diff --git a/tests/python/include/folly/tracing/StaticTracepoint-ELFx86.h b/tests/python/include/folly/tracing/StaticTracepoint-ELF.h
-similarity index 100%
-rename from tests/python/include/folly/tracing/StaticTracepoint-ELFx86.h
-rename to tests/python/include/folly/tracing/StaticTracepoint-ELF.h
--- 
-2.49.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch
deleted file mode 100644
index 2b97242753..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From f290f9df0556735041bfee8e67fcad55edb4c70b Mon Sep 17 00:00:00 2001
-From: Harish Sadineni <Harish.Sadineni@windriver.com>
-Date: Sat, 7 Mar 2026 22:02:07 +0000
-Subject: [PATCH 2/2] folly/tracing: Add ARM and AArch64 support to static
- tracepoints
-
-Extend the static tracepoint (SDT) macros to work on ARM and AArch64
-by:
-
-- Defining FOLLY_SDT_NOP as "nop" (the same mnemonic works for both
-  ARM and AArch64)
-- Adding `defined(__aarch64__) || defined(__arm__)` to the preprocessor
-  guard in StaticTracepoint.h
-
-This resolves USDT probe test failures on ARM64 platforms.
-Without these changes, the .note.stapsdt section containing probe
-information was missing entirely on ARM64, causing test failures when
-attempting to find and attach to USDT probes in the BCC test suite.
-
-Fixes: #5354
-
-Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5491]
-
-Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
----
- tests/python/include/folly/tracing/StaticTracepoint-ELF.h | 6 ++++++
- tests/python/include/folly/tracing/StaticTracepoint.h     | 4 ++--
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/tests/python/include/folly/tracing/StaticTracepoint-ELF.h b/tests/python/include/folly/tracing/StaticTracepoint-ELF.h
-index 033809cb..47828309 100644
---- a/tests/python/include/folly/tracing/StaticTracepoint-ELF.h
-+++ b/tests/python/include/folly/tracing/StaticTracepoint-ELF.h
-@@ -25,7 +25,13 @@
- #endif
- 
- // Instruction to emit for the probe.
-+#if defined(__x86_64__) || defined(__i386__)
- #define FOLLY_SDT_NOP                 nop
-+#elif defined(__aarch64__) || defined(__arm__)
-+#define FOLLY_SDT_NOP                 nop
-+#else
-+#error "Unsupported architecture"
-+#endif
- 
- // Note section properties.
- #define FOLLY_SDT_NOTE_NAME           "stapsdt"
-diff --git a/tests/python/include/folly/tracing/StaticTracepoint.h b/tests/python/include/folly/tracing/StaticTracepoint.h
-index 858b7dbc..86f8e40c 100644
---- a/tests/python/include/folly/tracing/StaticTracepoint.h
-+++ b/tests/python/include/folly/tracing/StaticTracepoint.h
-@@ -16,10 +16,10 @@
- 
- #pragma once
- 
--#if defined(__ELF__) && (defined(__x86_64__) || defined(__i386__)) && \
-+#if defined(__ELF__) && (defined(__x86_64__) || defined(__i386__) || defined(__aarch64__) || defined(__arm__)) && \
-     !FOLLY_DISABLE_SDT
- 
--#include <folly/tracing/StaticTracepoint-ELFx86.h>
-+#include <folly/tracing/StaticTracepoint-ELF.h>
- 
- #define FOLLY_SDT(provider, name, ...) \
-   FOLLY_SDT_PROBE_N(                   \
--- 
-2.49.0
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.36.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
similarity index 90%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.36.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
index 0d8bee5da4..9ecc30b58b 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.36.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.37.0.bb
@@ -22,16 +22,11 @@ RDEPENDS:${PN}-ptest = "kernel-devsrc packagegroup-core-buildessential cmake bas
 SRC_URI = "gitsm://github.com/iovisor/bcc;branch=master;protocol=https;lfs=0;tag=v${PV} \
            file://0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch \
            file://0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch \
-           file://0001-Add-ARM64-syscall-prefix-detection-in-C-API.patch \
-           file://0002-Add-riscv-syscall-prefix-detection-in-C-API.patch \
-           file://0003-folly-tracing-Remove-x86-specific-naming-from-tracin.patch \
-           file://0004-folly-tracing-Add-ARM-and-AArch64-support-to-static-.patch \
-           file://0001-Fix-build-with-LLVM-22.patch \
            file://run-ptest \
            file://ptest_wrapper.sh \
            "
 
-SRCREV = "b9f1b2ab025e3ac95b6aaa1cb20bf222a7b8804e"
+SRCREV = "306a2819f73d9525430693e6399d58caf6e12b3b"
 
 PACKAGECONFIG ??= "examples"
 PACKAGECONFIG:remove:libc-musl = "examples"
-- 
2.43.0


