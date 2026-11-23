Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48025.1795411838141196833
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Nov 2026 21:30:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=pjrtX8j9;
 spf=pass (domain: gmail.com, ip: 74.125.82.43, mailfrom: raj.khem@gmail.com)
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-15ea896ddc8so4888166c88.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Nov 2026 21:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795411837; x=1796016637; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+FbwSAVB880d7v4WEOihdMrjAoqmBU3Aq7qx4NY1xaA=;
        b=pjrtX8j95RxMs8VehqtYHpZFFAZv+tuh5g1b8yWp93oKrFmpy6OvmQwD0lHIUEghKp
         ZgOfE1tgYEwWd8Pej+VqSqXduqU6sZ30V8PKqKUC0CEA2tCg7pYH6NRzZYxG7lPkNQ9v
         m7NqN4AzLvTxtgXeLTTdoXi8SCI37iYg1Nu0bzbO8yCUHLotcyRPcmV4GJOG6HYXlYYY
         DW2eWiGi1r/UiEazupJxLGHBhvj0veGdGO7QS+REue+RDgILvlc/eBOLwOMg43/0T7bQ
         9JDxnbuRxBgPk7WK4p3R+BpeQ9yCwFohMt0X6knZPyepXODNNZWq0xP6g8/aOyLfAHV3
         13uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411837; x=1796016637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+FbwSAVB880d7v4WEOihdMrjAoqmBU3Aq7qx4NY1xaA=;
        b=rz4l6EC7c6WJplyQYR/4JL89ri5tU+Wqk6hoPNwp1QVaAg2vIowfdD0YeSKoJHZqkH
         0ywigLxiPzllFaj8HBTAJOp2iC07YfVuMogRhaBFyzo/W2H7Ia7au4xBEaykSW6FAj0Q
         NDbV9pn0NoYd/ZvGpHV0JlvhWnNSY56+C6nk2UUCFP/A/mvVw3L5CyWef/EUIbqqJJm3
         TCVBzPxpfFVzJVs9w+TuslkJVce2/TfiCCWioHMF9A2DnOOoUfz2T1nnBCmzuKOhhNwh
         3DM/k1L91OyvJiRaxCF8ii0aOX82vcwtkCUG0eU0BNY82mx7a8PldgATeN6kvz72zAEL
         H8GA==
X-Gm-Message-State: APuU4Z84XtiVYSjPloeDtDqVv/JPieueqFIdsw/+SKE/hJZw2VpIUZCd
	r7WfUi1nbwakl/vW7vDhB+HRr+A+wu15gV3x8UMjRtFwVoUygg0etvse59WfO9kaF/w=
X-Gm-Gg: AZFdTZcNiGM+PB/CNmWPH6hxQyo0qs8b5gi0uhK7RsC2n8s97Ml+sRSsUxfJA3Oiips
	gLycUVVGIbixCdxE+9CvklOIjKh6OXmApZziYnn2qNx8i9VCqgV29+Ic8gGfISgQ3zZft7CLciE
	6Y1ExzIi9N1+pifA/TlK8LIaRho2jz3SzK0H4Q2ifq0nkC5qBrJkwZEIuotrI//2WQbA0UJc1gi
	RVc+yCHPFz3zOn2leg2P6/G5/r4EpzTNSVF5CNzASM419W68P1ZVkoqm8u41goS3C3XXw5FxJ+k
	X2hkt9gVGYLgC/wpT9GqAg+UJ49I455Lf8ovbsD22xINGXcrH+KeQLADycp/yLxT7anesWOzt0m
	4HJbAZCTsRMkV1Hi5s34/zpWNuUcDNYqGWRT3SXoBeG7C+LL5IlCeQuijsTWkMZDDfqqL1Fogv2
	PDQzdt9ZtZDkTlfhc1M97ZePV4jE0yLV1G/gUw/FEQkxy/mvwa90LUh4A9kek7QZpFFhbCuYuPf
	6zi/gveNnB2kPvcZbXv1P1DhFGb9uyHF/jNSpTa8NsZ3mBiHcEwQMG6W22s0X5sO0kP9T6dzaol
	pIBRf9W1RVb2iaTj/EYx9JsY1HzGyUnMOcSlUVFm0c98mR07Ac9XLDHwdCmZbdGxy0BomE8nIzi
	BAWr9PgHBCNuL9necZ0MAsN9H6XAuz11YaDpipYz2OPTg9RsnaJsSamKFuiqKfLiUosDJVKlUZW
	j90a/fKkFRABt0l5r9kyShahPxhZnPITgvJbg+5C0N2Gc7qC4GL4wWGXP+70DL9ph43r3lDP3V6
	L0ZKtjmMozM1/Qv7PCB4hA8zM9NTSSuybTV+6mPJl1vdpupSALtpwjFDd3wmhjqZC/LABs8j3f7
	9jlr
X-Received: by 2002:a05:7300:ff48:b0:385:3595:5e87 with SMTP id 5a478bee46e88-3856fd5b5damr10094911eec.16.1795411837345;
        Sun, 22 Nov 2026 21:30:37 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm36573136eec.26.2026.11.22.21.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:30:36 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 05/42] bpftrace: upgrade 0.26.1 -> 0.27.1
Date: Sun, 22 Nov 2026 21:28:49 -0800
Message-ID: <20261123052953.3658549-33-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
References: <20261123052953.3658549-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 05:30:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132820
Content-Type: text/plain; charset="utf-8"

- 0.27.0 adds str_concat(), container_of() and config to the stdlib,
  reg("pc") as an instruction pointer alias and type expression
  substitution for macros
- Fix session probes on kernel 7.0, fentry/fexit argument decoding,
  USDT/uaddr() address spaces and strftime() on big endian
- Fix several codegen crashes and string allocation size mismatches
- 0.27.1 copies structs/arrays on scratch variable assignment and
  fixes bitfield/field access on structs in maps, tuples and records
- Fix an invalid BPF object with LLVM 23 and a large max_strlen
- Print compile-time warnings to stderr so JSON output stays clean

Track the release/0.27.x branch. Drop the two LLVM 23 backports, which
are part of 0.27.x, and refresh the tests patches for the reworked
testprogs/CMakeLists.txt. The new dwarf_origin test fixture was
referenced by its build tree path, which leaked TMPDIR into
bpftrace_test and broke the test once installed; look it up relative to
the tests directory and install it with the ptest.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ker-flags-and-sysroot-to-raw-compile.patch | 24 +++----
 ...lderBPF-Fix-HasTerminator-on-LLVM-23.patch | 38 -----------
 ...5-CMakeLists-Add-support-for-LLVM-23.patch | 36 ----------
 ...d-build-paths-in-split-DWARF-test-pr.patch | 30 ++++-----
 ...e-dwarf_origin-fixture-relative-to-t.patch | 65 +++++++++++++++++++
 ...{bpftrace_0.26.1.bb => bpftrace_0.27.1.bb} |  8 +--
 6 files changed, 95 insertions(+), 106 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0008-tests-look-up-the-dwarf_origin-fixture-relative-to-t.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/{bpftrace_0.26.1.bb => bpftrace_0.27.1.bb} (92%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
index 491b451ee9..70a52d97ca 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
@@ -26,7 +26,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
 
 --- a/tests/testprogs/CMakeLists.txt
 +++ b/tests/testprogs/CMakeLists.txt
-@@ -17,6 +17,23 @@ test_and_add_testprog_cflag("-fno-omit-f
+@@ -17,6 +17,23 @@
  test_and_add_testprog_cflag("-mno-omit-leaf-frame-pointer")
  get_property(testprog_cflags GLOBAL PROPERTY testprog_cflags)
  
@@ -50,7 +50,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  file(GLOB testprog_sources CONFIGURE_DEPENDS *.c *.cpp)
  set(testprogtargets "")
  function(testprog_compile is_pie)
-@@ -85,7 +102,7 @@ endif()
+@@ -85,7 +102,7 @@
  find_program(LLVM_OBJCOPY llvm-objcopy REQUIRED)
  add_custom_command(
    OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/false.bin
@@ -59,7 +59,7 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
    COMMAND ${LLVM_OBJCOPY} -S --only-section=.text --keep-symbol=main -O binary ${CMAKE_CURRENT_BINARY_DIR}/false.o ${CMAKE_CURRENT_BINARY_DIR}/false.bin
    COMMAND ${CMAKE_COMMAND} -E rm -f ${CMAKE_CURRENT_BINARY_DIR}/false.o
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
-@@ -147,7 +164,7 @@ add_custom_command(
+@@ -147,7 +164,7 @@
    OUTPUT
      ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split
      ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split-uprobe_test.dwo
@@ -68,12 +68,12 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
  )
  list(APPEND testprogtargets ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split)
-@@ -159,7 +176,7 @@ add_custom_command(
-   OUTPUT
-     ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
-     ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
--  COMMAND ${CMAKE_C_COMPILER} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
-+  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split ${testprog_raw_ld_flags}
-   COMMAND ${LLVM_DWP} -e ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
-   COMMAND ${CMAKE_COMMAND} -E rm -f ${EXTERNAL_DEBUG_DIR}/dwp/*.dwo
-   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
+@@ -165,7 +182,7 @@
+     OUTPUT
+       ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
+       ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
+-    COMMAND ${CMAKE_C_COMPILER} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
++    COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split ${testprog_raw_ld_flags}
+     COMMAND ${LLVM_DWP} -e ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
+     COMMAND ${CMAKE_COMMAND} -E rm -f ${EXTERNAL_DEBUG_DIR}/dwp/*.dwo
+     DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
deleted file mode 100644
index f224ca3d81..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From d09a791bb88c69c34dd2e294213ed2a47568267f Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Viktor=20Mal=C3=ADk?= <viktor.malik@gmail.com>
-Date: Tue, 18 Aug 2026 21:47:37 +0200
-Subject: [PATCH] IRBuilderBPF: Fix HasTerminator on LLVM 23 (#5298)
-
-LLVM 23 changed the implementation of BasicBlock::getTerminator(), which
-now doesn't check that a basic block actually has a terminator and
-should only be called after a successful BasicBlock::hasTerminator()
-check. Add the check to IRBuilderBPF::HasTerminator() for LLVM 23.
-
-Signed-off-by: Viktor Malik <viktor.malik@gmail.com>
-
-Upstream-Status: Backport [https://github.com/bpftrace/bpftrace/commit/d09a791bb88c69c34dd2e294213ed2a47568267f]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/ast/irbuilderbpf.cpp | 8 +++++++-
- 1 file changed, 7 insertions(+), 1 deletion(-)
-
-diff --git a/src/ast/irbuilderbpf.cpp b/src/ast/irbuilderbpf.cpp
-index fb94f9bdde6b..2a2ac6209c19 100644
---- a/src/ast/irbuilderbpf.cpp
-+++ b/src/ast/irbuilderbpf.cpp
-@@ -2512,7 +2512,13 @@ llvm::Value *IRBuilderBPF::CreateCheckedBinop(Binop &binop,
- bool IRBuilderBPF::HasTerminator()
- {
-   BasicBlock *current_block = GetInsertBlock();
--  return current_block && current_block->getTerminator();
-+  if (!current_block)
-+    return false;
-+#if LLVM_VERSION_MAJOR >= 23
-+  if (!current_block->hasTerminator())
-+    return false;
-+#endif
-+  return current_block->getTerminator();
- }
- 
- } // namespace bpftrace::ast
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
deleted file mode 100644
index b5f7f0e3dc..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0005-CMakeLists-Add-support-for-LLVM-23.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From f0768d0a3d08b4ba7fbc85f874fbe905cd4a6880 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Viktor=20Mal=C3=ADk?= <viktor.malik@gmail.com>
-Date: Wed, 19 Aug 2026 09:25:25 +0200
-Subject: [PATCH] Add support for LLVM 23 (#5299)
-
-- Bump MAX_LLVM_MAJOR
-- Add new Nix targets
-- Bump BCC version to the commit fixing LLVM 23 build
-- Adjust CI jobs
-
-Also drop support for LLVM 18. Since the Nix fuzz shell depended on LLVM
-18, move that to 22.
-
-Signed-off-by: Viktor Malik <viktor.malik@gmail.com>
-
-Only the CMakeLists.txt hunk is backported here; the Nix and CI changes of
-the original commit do not apply to an OE build, and the BCC bump is
-handled by the bcc recipe.
-
-Upstream-Status: Backport [https://github.com/bpftrace/bpftrace/commit/f0768d0a3d08b4ba7fbc85f874fbe905cd4a6880]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index baea14e65c60..a781bf347d61 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -156,7 +156,7 @@ if(CMAKE_BUILD_TYPE STREQUAL "Debug")
-   # releases.
-   set(MAX_LLVM_MAJOR 999)
- else()
--  set(MAX_LLVM_MAJOR 22)
-+  set(MAX_LLVM_MAJOR 23)
- endif()
- 
- if((${LLVM_VERSION_MAJOR} VERSION_LESS ${MIN_LLVM_MAJOR}) OR (${LLVM_VERSION_MAJOR} VERSION_GREATER ${MAX_LLVM_MAJOR}))
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch
index aecbabc8d0..696b626aa4 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch
@@ -24,11 +24,9 @@ Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
  tests/testprogs/CMakeLists.txt | 12 +++++++++---
  1 file changed, 9 insertions(+), 3 deletions(-)
 
-diff --git a/tests/testprogs/CMakeLists.txt b/tests/testprogs/CMakeLists.txt
-index 4cc9967..2b407b7 100644
 --- a/tests/testprogs/CMakeLists.txt
 +++ b/tests/testprogs/CMakeLists.txt
-@@ -160,11 +160,16 @@ list(APPEND testprogtargets
+@@ -160,11 +160,16 @@
    ${CMAKE_CURRENT_BINARY_DIR}/.debug/uprobe_separate_debug-stripped.debug)
  
  # Build a binary with split DWARF (.dwo files) to verify parsing of the split debug info format.
@@ -46,16 +44,16 @@ index 4cc9967..2b407b7 100644
    DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
  )
  list(APPEND testprogtargets ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split)
-@@ -176,9 +181,10 @@ add_custom_command(
-   OUTPUT
-     ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
-     ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
--  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split ${testprog_raw_ld_flags}
--  COMMAND ${LLVM_DWP} -e ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
-+  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o uprobe_test-split ${testprog_raw_ld_flags}
-+  COMMAND ${LLVM_DWP} -e uprobe_test-split -o uprobe_test-split.dwp
-   COMMAND ${CMAKE_COMMAND} -E rm -f ${EXTERNAL_DEBUG_DIR}/dwp/*.dwo
-+  WORKING_DIRECTORY ${EXTERNAL_DEBUG_DIR}/dwp
-   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
- )
- list(APPEND testprogtargets
+@@ -182,9 +187,10 @@
+     OUTPUT
+       ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
+       ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
+-    COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split ${testprog_raw_ld_flags}
+-    COMMAND ${LLVM_DWP} -e ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
++    COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o uprobe_test-split ${testprog_raw_ld_flags}
++    COMMAND ${LLVM_DWP} -e uprobe_test-split -o uprobe_test-split.dwp
+     COMMAND ${CMAKE_COMMAND} -E rm -f ${EXTERNAL_DEBUG_DIR}/dwp/*.dwo
++    WORKING_DIRECTORY ${EXTERNAL_DEBUG_DIR}/dwp
+     DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
+   )
+   list(APPEND testprogtargets
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0008-tests-look-up-the-dwarf_origin-fixture-relative-to-t.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0008-tests-look-up-the-dwarf_origin-fixture-relative-to-t.patch
new file mode 100644
index 0000000000..1818899c4b
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0008-tests-look-up-the-dwarf_origin-fixture-relative-to-t.patch
@@ -0,0 +1,65 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Sat, 21 Nov 2026 00:00:00 -0800
+Subject: [PATCH] tests: make the dwarf_origin fixture usable in installed tests
+
+DWARF_ORIGIN_BINARY is set to the absolute path of the fixture in the
+build tree, so bpftrace_test embeds the build directory and cannot find
+the fixture once the tests are installed elsewhere. ctest runs
+bpftrace_test from the tests build directory, so a path relative to it
+works both there and in an installed copy of the tests directory.
+
+The fixture is also built with the build host gcc found by BuildBPF.cmake,
+so a cross build installs a host binary next to target tests. Its DWARF is
+hand written and architecture independent, so build it with the target C
+compiler and sysroot instead.
+
+Upstream-Status: Pending
+AI-Generated: Uses Claude Code
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/CMakeLists.txt      |  2 +-
+ tests/data/CMakeLists.txt | 16 ++++++++++++++--
+ 2 files changed, 15 insertions(+), 3 deletions(-)
+
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -65,7 +65,7 @@ add_subdirectory(data)
+ add_dependencies(bpftrace_test data_source_dwarf data_source_btf)
+ add_dependencies(bpftrace_test dwarf_origin_fixture)
+ target_compile_definitions(bpftrace_test PRIVATE
+-  DWARF_ORIGIN_BINARY="${CMAKE_CURRENT_BINARY_DIR}/data/dwarf_origin")
++  DWARF_ORIGIN_BINARY="data/dwarf_origin")
+ target_include_directories(bpftrace_test PRIVATE ${CMAKE_CURRENT_BINARY_DIR})
+ target_include_directories(bpftrace_test PRIVATE ${CMAKE_CURRENT_SOURCE_DIR})
+ 
+--- a/tests/data/CMakeLists.txt
++++ b/tests/data/CMakeLists.txt
+@@ -1,13 +1,25 @@
+ include(BuildBPF)
+ include(Embed)
+ 
++# The fixture is installed with the tests, so build it with the target C
++# compiler and sysroot; GCC from BuildBPF.cmake is the build host compiler.
++set(dwarf_origin_cc_flags "")
++if(CMAKE_C_COMPILER_ARG1)
++  separate_arguments(_arg1 UNIX_COMMAND "${CMAKE_C_COMPILER_ARG1}")
++  list(APPEND dwarf_origin_cc_flags ${_arg1})
++endif()
++if(CMAKE_SYSROOT)
++  list(APPEND dwarf_origin_cc_flags "--sysroot=${CMAKE_SYSROOT}")
++endif()
++separate_arguments(dwarf_origin_ld_flags UNIX_COMMAND "${CMAKE_EXE_LINKER_FLAGS}")
++
+ # Define the DIE order explicitly: compiler-generated DWARF may put the
+ # abstract function first and leave inherited parameter names untested.
+ add_custom_command(
+   OUTPUT dwarf_origin
+-  COMMAND ${GCC} -no-pie ${CMAKE_CURRENT_SOURCE_DIR}/dwarf_origin.c
++  COMMAND ${CMAKE_C_COMPILER} ${dwarf_origin_cc_flags} -no-pie ${CMAKE_CURRENT_SOURCE_DIR}/dwarf_origin.c
+           ${CMAKE_CURRENT_SOURCE_DIR}/dwarf_origin.S
+-          -o ${CMAKE_CURRENT_BINARY_DIR}/dwarf_origin
++          -o ${CMAKE_CURRENT_BINARY_DIR}/dwarf_origin ${dwarf_origin_ld_flags}
+   DEPENDS dwarf_origin.c dwarf_origin.S
+   VERBATIM
+ )
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.27.1.bb
similarity index 92%
rename from meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.27.1.bb
index e217ac150d..7eaeaf72dc 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.27.1.bb
@@ -13,17 +13,16 @@ DEPENDS += "gzip-native \
             "
 DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-native zip-native', '', d)}"
 
-SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.26.x;protocol=https;tag=v${PV} \
+SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.27.x;protocol=https;tag=v${PV} \
            file://run-ptest \
            file://0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch \
            file://0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch \
-           file://0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch \
-           file://0005-CMakeLists-Add-support-for-LLVM-23.patch \
            file://0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch \
            file://0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch \
            file://0007-tests-testprogs-define-_GNU_SOURCE-for-pthread_setn.patch \
+           file://0008-tests-look-up-the-dwarf_origin-fixture-relative-to-t.patch \
 "
-SRCREV = "1bac8a8daad6e0aa579980e877d0c9d5fc296593"
+SRCREV = "24e9fe60faffcbed50b44428067fcd9b03770584"
 
 inherit bash-completion cmake ptest pkgconfig
 
@@ -53,6 +52,7 @@ do_install_ptest() {
         install -Dm 755 ${B}/tests/bpftrace_test ${D}${PTEST_PATH}/tests/bpftrace_test
         cp -rf ${B}/tests/runtime ${D}${PTEST_PATH}/tests
         cp -rf ${B}/tests/test* ${D}${PTEST_PATH}/tests
+        install -Dm 755 ${B}/tests/data/dwarf_origin ${D}${PTEST_PATH}/tests/data/dwarf_origin
     fi
     for f in testlibs/cmake_install.cmake \
              testprogs/cmake_install.cmake \
