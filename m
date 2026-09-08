Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25D1C79FAA
	for <webhook@archiver.kernel.org>; Tue,  8 Sep 2026 02:08:07 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.527.1788833279984578652
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Sep 2026 19:08:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=SXlg1jtd;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2d71ae3455aso63546165ad.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Sep 2026 19:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788833279; x=1789438079; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1+SjpiAZJ0s7qHzDvRtXewYpGINuqoFCEcL3sAHMJqg=;
        b=SXlg1jtdQC4sJ1TUXHtpp3Y70d3Z1FfjiuAF4aN+ztR+ND+VK2Ttd2YjgW6qR1B/A3
         CSx0TtillZ1vsCwlthz3yJFvk08dn9Pj0llTsdYH0vZt07HcLzeCilE03LSlSZXbwTbs
         Mc+NVOluHVYnfLbkIQs/tYCoGgF+loAmbxqRXsi4M2xoctBBLA4wHqzea3zx0BhrrS/Q
         waWS5D6NIqGBFPt/mk9We8lpessZjl7gBzi0d4kS+HBO/+jpQvTlAFvxd+UtL7a0/Ub9
         6s17GuS+LddGWOMibwqzClPzz8HSFjCKVttLXnVDEH4DhN05ac2weolIBtOPvJhWFzGz
         h/iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788833279; x=1789438079;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1+SjpiAZJ0s7qHzDvRtXewYpGINuqoFCEcL3sAHMJqg=;
        b=HVy688T6iyTho0qtxMZVGKAz9hPyI7jKezyn/V7TVjCK43xoc2ByODK4+jpW6ohlqC
         MKatDhcSHqD67VU7v0oCM7swRkx5AuRR4izwX1XluqQmTDZbkclyh8dRLGO9JnLQeLxi
         kfQOrX1vihWUw9XyYHvAWiAeYvwkAeh/xUx1oaP7iuP8kAiZQt+QXY0CH+t0q0awAyKn
         PbpDONK8Qj3xbuN7VjBr7ECxFOPM08OYxPWK/8gkGzMd3buDlW7vJM4m7X/5IhChYY9r
         qMVp3qVkXFjfcTiXpSXRGUH9n+OP95YrVpmXPd/uKn5cPS1xAzDLNL14DAg8T3IlMLtU
         aRAA==
X-Gm-Message-State: AFuF++kzentmVy9g2UoExIMmy5L/Ch0eTXUa04oFIlqMhuW57LBP6QUH
	jPwWDluekk/zlGuR5NFYpp/A3P+ZsipWXM9+vjYbCRSTm1Vfxujoz+/96Swx4g==
X-Gm-Gg: AYBFou195Yfo9mfMYY68lzueTHe3zhCDEfCMSewUdqbsMmf8iWY6hUgrTx2h0DzUyG7
	oWSS/ROkKzQLSc2L5CPzE/TDdQ39sWhK0jfjyrp6TtggW1nNRlzw7UIFfR9982ujGidewwVwHyo
	rPn3Zv9moXWefZaB3WklZ2lSIs5MZNjUaJe+sCpxlwgX7kQw81cBVxnOMlxSoE/nzw2F1Nd6MIj
	uF5SMTMjP0j+lfNzrBZa49Stxia74qk73qXhyzk5mp99yJyHA8T9+XDAXNXobcgOuytMcy79zrM
	fynhw/mgBobb0hFShcHwvl6EkW3r0q3Ntw5R9x1M6pQlJ2SXKZ4EratO/1zPTjeoUyBZX1aQERP
	HL3GDP++aciT7YuahvWkjw6s7hM9yf3O+kuD3ieuaXqGlasyWx1e1S4ngq5voZypXhF8hdTsSKf
	IP30eWfAVSFRZ00cBykI5SSW4x2FiHytM59VxX+sQlKxO8w9l87zoetziOwAyIX/hRve63vMhYm
	DFWYVegrDFL7DRRXfLSdjElPlQ7HxjIL2ONmlbuyJqr/VeD+KEBmP4oxuFTf01B/ePE8NpvBv1R
	x6QQF7MK8NtWN4rSUBPS9Re7QAGNeJ04XB8q8as0EadmeHFPtVvd3MQUzJqZkfMerJP73ijQk4p
	0LNibkd/t9Y8xumjJmOltq46VY+T2DaKLI5FNiNJhs2Zfag==
X-Received: by 2002:a17:90b:5344:b0:38e:4f41:83df with SMTP id 98e67ed59e1d1-39b261e0f14mr39679140a91.15.1788833279244;
        Mon, 07 Sep 2026 19:07:59 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33688cfc714sm14044803eec.20.2026.09.07.19.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 19:07:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/6] bpftrace: Fix tests to cross compile
Date: Mon,  7 Sep 2026 19:07:49 -0700
Message-ID: <20260908020752.2748681-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
References: <20260908020752.2748681-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Sep 2026 02:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129851

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ker-flags-and-sysroot-to-raw-compile.patch | 79 +++++++++++++++++++
 ...d-build-paths-in-split-DWARF-test-pr.patch | 61 ++++++++++++++
 .../bpftrace/bpftrace_0.26.1.bb               |  2 +
 3 files changed, 142 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
new file mode 100644
index 0000000000..491b451ee9
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch
@@ -0,0 +1,79 @@
+From 94892d6ac971155b43a6bbff942acede21b60efb Mon Sep 17 00:00:00 2001
+From: x <x@x>
+Date: Mon, 7 Sep 2026 17:54:26 +0000
+Subject: [PATCH] tests: pass C/linker flags and sysroot to raw compiler
+ invocations in testprogs
+
+Several add_custom_command() rules in tests/testprogs invoke
+${CMAKE_C_COMPILER} directly (false.bin and the split-DWARF dwo/dwp
+builds). Unlike add_executable() targets, these do not automatically
+receive CMAKE_C_FLAGS, CMAKE_EXE_LINKER_FLAGS or CMAKE_SYSROOT, so with
+cross toolchains that have no built-in default sysroot (e.g.
+Yocto/OpenEmbedded) the compile fails with:
+
+  uprobe_test.c:1:10: fatal error: unistd.h: No such file or directory
+
+Build a flag list from CMAKE_C_COMPILER_ARG1, CMAKE_SYSROOT and
+CMAKE_C_FLAGS and pass it to each raw compiler invocation. The dwo/dwp
+commands compile and link in a single step, so also pass
+CMAKE_EXE_LINKER_FLAGS to those.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/testprogs/CMakeLists.txt | 23 ++++++++++++++++++++---
+ 1 file changed, 20 insertions(+), 3 deletions(-)
+
+--- a/tests/testprogs/CMakeLists.txt
++++ b/tests/testprogs/CMakeLists.txt
+@@ -17,6 +17,23 @@ test_and_add_testprog_cflag("-fno-omit-f
+ test_and_add_testprog_cflag("-mno-omit-leaf-frame-pointer")
+ get_property(testprog_cflags GLOBAL PROPERTY testprog_cflags)
+ 
++# Flags for the add_custom_command() invocations below that call the C
++# compiler directly. Unlike add_executable(), custom commands do not
++# automatically receive CMAKE_C_FLAGS or the sysroot, which breaks cross
++# compilation with toolchains that have no default sysroot (e.g. Yocto).
++set(testprog_raw_cc_flags "")
++if(CMAKE_C_COMPILER_ARG1)
++  separate_arguments(_arg1 UNIX_COMMAND "${CMAKE_C_COMPILER_ARG1}")
++  list(APPEND testprog_raw_cc_flags ${_arg1})
++endif()
++if(CMAKE_SYSROOT)
++  list(APPEND testprog_raw_cc_flags "--sysroot=${CMAKE_SYSROOT}")
++endif()
++separate_arguments(_c_flags UNIX_COMMAND "${CMAKE_C_FLAGS}")
++list(APPEND testprog_raw_cc_flags ${_c_flags})
++# Linker flags for the custom commands that compile and link in one step.
++separate_arguments(testprog_raw_ld_flags UNIX_COMMAND "${CMAKE_EXE_LINKER_FLAGS}")
++
+ file(GLOB testprog_sources CONFIGURE_DEPENDS *.c *.cpp)
+ set(testprogtargets "")
+ function(testprog_compile is_pie)
+@@ -85,7 +102,7 @@ endif()
+ find_program(LLVM_OBJCOPY llvm-objcopy REQUIRED)
+ add_custom_command(
+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/false.bin
+-  COMMAND ${CMAKE_C_COMPILER} -c ${CMAKE_CURRENT_SOURCE_DIR}/false.c -o ${CMAKE_CURRENT_BINARY_DIR}/false.o
++  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -c ${CMAKE_CURRENT_SOURCE_DIR}/false.c -o ${CMAKE_CURRENT_BINARY_DIR}/false.o
+   COMMAND ${LLVM_OBJCOPY} -S --only-section=.text --keep-symbol=main -O binary ${CMAKE_CURRENT_BINARY_DIR}/false.o ${CMAKE_CURRENT_BINARY_DIR}/false.bin
+   COMMAND ${CMAKE_COMMAND} -E rm -f ${CMAKE_CURRENT_BINARY_DIR}/false.o
+   WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
+@@ -147,7 +164,7 @@ add_custom_command(
+   OUTPUT
+     ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split
+     ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split-uprobe_test.dwo
+-  COMMAND ${CMAKE_C_COMPILER} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split
++  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split ${testprog_raw_ld_flags}
+   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
+ )
+ list(APPEND testprogtargets ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split)
+@@ -159,7 +176,7 @@ add_custom_command(
+   OUTPUT
+     ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
+     ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
+-  COMMAND ${CMAKE_C_COMPILER} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
++  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split ${testprog_raw_ld_flags}
+   COMMAND ${LLVM_DWP} -e ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
+   COMMAND ${CMAKE_COMMAND} -E rm -f ${EXTERNAL_DEBUG_DIR}/dwp/*.dwo
+   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch
new file mode 100644
index 0000000000..aecbabc8d0
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch
@@ -0,0 +1,61 @@
+From bc125c84cffdbb23ea7977b1f235635607e00a18 Mon Sep 17 00:00:00 2001
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Mon, 7 Sep 2026 16:36:50 -0700
+Subject: [PATCH] tests: do not embed build paths in split DWARF test programs
+
+The two split-DWARF test binaries are compiled by add_custom_command() with
+an absolute -o path. clang derives the .dwo file name from -o and records it
+verbatim in DW_AT_dwo_name, without applying -ffile-prefix-map, so the
+absolute build directory ends up baked into uprobe_test-split, its .dwo and
+the .dwp built from it. gcc remaps it, clang does not.
+
+Compile from inside the target directory with a relative -o instead. The
+recorded DW_AT_dwo_name then becomes a plain file name, which is what the
+dwarf parser looks for anyway (it uses only the basename), and llvm-dwp
+resolves it relative to its working directory.
+
+This keeps the shipped test programs free of build paths, which matters for
+distributions that package tests/ and check for host paths in the output.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ tests/testprogs/CMakeLists.txt | 12 +++++++++---
+ 1 file changed, 9 insertions(+), 3 deletions(-)
+
+diff --git a/tests/testprogs/CMakeLists.txt b/tests/testprogs/CMakeLists.txt
+index 4cc9967..2b407b7 100644
+--- a/tests/testprogs/CMakeLists.txt
++++ b/tests/testprogs/CMakeLists.txt
+@@ -160,11 +160,16 @@ list(APPEND testprogtargets
+   ${CMAKE_CURRENT_BINARY_DIR}/.debug/uprobe_separate_debug-stripped.debug)
+ 
+ # Build a binary with split DWARF (.dwo files) to verify parsing of the split debug info format.
++# Compile from within the output directory and pass a relative -o: some compilers
++# (e.g. clang) record the -o derived .dwo path verbatim in DW_AT_dwo_name without
++# applying -ffile-prefix-map, which would bake the absolute build directory into
++# both the binary and the .dwo file.
+ add_custom_command(
+   OUTPUT
+     ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split
+     ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split-uprobe_test.dwo
+-  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split ${testprog_raw_ld_flags}
++  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o uprobe_test-split ${testprog_raw_ld_flags}
++  WORKING_DIRECTORY ${EXTERNAL_DEBUG_DIR}/dwo
+   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
+ )
+ list(APPEND testprogtargets ${EXTERNAL_DEBUG_DIR}/dwo/uprobe_test-split)
+@@ -176,9 +181,10 @@ add_custom_command(
+   OUTPUT
+     ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split
+     ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
+-  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split ${testprog_raw_ld_flags}
+-  COMMAND ${LLVM_DWP} -e ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split -o ${EXTERNAL_DEBUG_DIR}/dwp/uprobe_test-split.dwp
++  COMMAND ${CMAKE_C_COMPILER} ${testprog_raw_cc_flags} -g -O0 -gsplit-dwarf ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c -o uprobe_test-split ${testprog_raw_ld_flags}
++  COMMAND ${LLVM_DWP} -e uprobe_test-split -o uprobe_test-split.dwp
+   COMMAND ${CMAKE_COMMAND} -E rm -f ${EXTERNAL_DEBUG_DIR}/dwp/*.dwo
++  WORKING_DIRECTORY ${EXTERNAL_DEBUG_DIR}/dwp
+   DEPENDS ${CMAKE_CURRENT_SOURCE_DIR}/uprobe_test.c
+ )
+ list(APPEND testprogtargets
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
index 44e32cb9a4..836f4d2483 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.26.1.bb
@@ -19,6 +19,8 @@ SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.26.x;protocol=http
            file://0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch \
            file://0004-IRBuilderBPF-Fix-HasTerminator-on-LLVM-23.patch \
            file://0005-CMakeLists-Add-support-for-LLVM-23.patch \
+           file://0001-tests-pass-C-linker-flags-and-sysroot-to-raw-compile.patch \
+           file://0006-tests-do-not-embed-build-paths-in-split-DWARF-test-pr.patch \
 "
 SRCREV = "1bac8a8daad6e0aa579980e877d0c9d5fc296593"
 

