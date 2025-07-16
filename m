Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D68FC83F34
	for <webhook@archiver.kernel.org>; Wed, 16 Jul 2025 06:46:34 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web10.15903.1752648391085810664
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Jul 2025 23:46:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kZ8hB6Xj;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b3507b63c6fso6682704a12.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Jul 2025 23:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752648390; x=1753253190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=61cHr318GbpXyX/BYgGULRF40EOOdwI9KL8U3Dt+X/M=;
        b=kZ8hB6XjtouZFjDow+DW3fZQ82erCMnL0s5gE+22pHPGC0vdlioXfTqfXgPn3wcbRs
         dBptAQSWzw29T/tAe08SDfUMP8E02MU2iiFOPZjymyrsXD4RctmWlwMDCFPugVTRNcc3
         POQXuAcLiYbE0U3ggY9dV8ZqGheP3eoSGBl1Gja2oar7MV3qnXYmBHVVlHfeODlw2yVZ
         MAsvVzfjdAIdEbXZgNIhR/zGeiPeV+OLMt84Y8QZixnYx+2vBn+9ZUbcLgiNta6056vb
         N7YfgRVN27R5ruTJhmKCaEFfvwbAjyTMjcNWMqbrY1YzbwX8+Z0EcekVVU4zI5l66K3q
         gJxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752648390; x=1753253190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=61cHr318GbpXyX/BYgGULRF40EOOdwI9KL8U3Dt+X/M=;
        b=Ycgsr2I5c7FGIdvcFjkBOmsIVe7e6hNah9nZcQscpvFYH2enqq9ZEP+zvMnwDrBsPf
         KBYa5rvslrqUpGAsIgJQMKSs0l1k7lMKWTHorNKRiOIrFsjgnGYNaafVoVtzEb1wJ0HT
         WzLkHvgld2gf9FpyFsduO7cfk3ke+3gXFg2r+UOpWEyJCQUCQEQjN7eHnSaSHIZcRq5n
         PqZXmLXrhwv1a2HQyMPg6ASKhbO2XCn1k54nccEUOuU5jWBtCGywYzPkbpgAGCQRjcBI
         rscp5AbdfGjdbX+N6ex7tl4SsgFxlg3GZj/zEJ5/T1yTxGT5+uDoNt+REbOVowvh5cO7
         gtPg==
X-Gm-Message-State: AOJu0YyU1q6mvTQtdBC8DqHznQ4z+3i6qiO75wVNSvTmOvuu/vLXiKxE
	SwcJIhhneO5nuXzcyQ0YgVvos5p6D3+J4pWnH0wpFA20wZ0UAz0baiTrj40G1/7aHeg=
X-Gm-Gg: ASbGnctC1n9iFEcwG0uVQrDrRjweN/95MqpXAkMui9zgYK/cRNyHZI27p9x/I+cgq6G
	G9X0H5rXMM9t6OkArpJYAjPCpWTOMO3VD/8ahKGcQcjmk6EShd62QywgtUjMg2ospTHChRK82+F
	5an3K6bk4utLCqESCCE6X0GQTRCdRxkFyXXkO97eAc1kVbwNXJ5A5PfEtKkIAZjKZUUsT+oTqSD
	SnpEKFFRHo5I8g/R/a8IZFpLqM3xGbdKHI242twE0ea17kDpGX72CD5Z8MZP/ORgm7aVo04TqYm
	LjfEJ2dkb7ihDxuxN9TBM8lplnChBBP6Mn2WNgY3CHSpDFEjB9wQhIfqZ0zjJi+zeYFVce9i27G
	IUNmUdV0PS1+OMg==
X-Google-Smtp-Source: AGHT+IHAYWJfUYATlirVaXt024pax89WG9unJYooac4fdc7P9xlhUc0KUiiED4tLV6CZ1kYl1JMEjg==
X-Received: by 2002:a17:90b:1b06:b0:311:f2f6:44ff with SMTP id 98e67ed59e1d1-31c9f42400cmr2576016a91.17.1752648389528;
        Tue, 15 Jul 2025 23:46:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::730c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f29e424sm778208a91.40.2025.07.15.23.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 23:46:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/3] bpftrace,bcc: Migrate recipe from meta-clang to meta-oe
Date: Tue, 15 Jul 2025 23:46:24 -0700
Message-ID: <20250716064626.339595-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Jul 2025 06:46:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118586

These recipes depend on clang, and clang being on core
it is better place for these tools to be in a common
layer for now that is meta-oe

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ists.txt-override-the-PY_CMD_ESCAPED.patch |  41 ++++++
 ...gh-extra-headers-to-allow-libbpf-to-.patch | 124 ++++++++++++++++++
 .../bcc/bcc/fix_for_memleak.patch             |  16 +++
 .../recipes-devtools/bcc/bcc/ptest_wrapper.sh |  16 +++
 .../recipes-devtools/bcc/bcc/run-ptest        |  65 +++++++++
 .../recipes-devtools/bcc/bcc_0.35.0.bb        |  92 +++++++++++++
 ...-failures-due-to-missing-location.hh.patch |  54 ++++++++
 ....txt-allow-to-set-BISON_FLAGS-like-l.patch |  38 ++++++
 .../bpftrace/bpftrace/run-ptest               |  51 +++++++
 .../bpftrace/bpftrace_0.23.0.bb               |  62 +++++++++
 10 files changed, 559 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/fix_for_memleak.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/ptest_wrapper.sh
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/run-ptest
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Fix-build-failures-due-to-missing-location.hh.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/run-ptest
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch
new file mode 100644
index 0000000000..1f9c41dfab
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch
@@ -0,0 +1,41 @@
+From 4f64ed40e1ffea7ea278627f30a01018e57dcbcf Mon Sep 17 00:00:00 2001
+From: Mingli Yu <mingli.yu@windriver.com>
+Date: Wed, 9 Sep 2020 05:48:19 +0000
+Subject: [PATCH] CMakeLists.txt: override the PY_CMD_ESCAPED
+
+Override the PY_CMD_ESCAPED as the PY_CMD_ESCAPED is constructed by
+the full path of the python3. In some cases, the path is so long and
+result in the PY_CMD_ESCAPED exceeds 255 characters and comes below
+do_configure error:
+ | CMake Error at src/python/CMakeLists.txt:18 (configure_file):
+ |   configure_file Problem configuring file
+ |
+ | CMake Error: Could not open file for write in copy operation /buildarea1/test/wr_build/wr1020_20200909_bcc/bcc_long_Kernel/auto-standalone_next/200827/lxbuilds/Intel-Snow-Ridge-NS_platform_up/intel-x86-64-standard-glibc-std/wrlinux/build/tmp-glibc/work/corei7-64-wrs-linux/bcc/0.15.0-r0/build/src/python/bcc--buildarea1-test-wr_build-wr1020_20200909_bcc-bcc_long_Kernel-auto-standalone_next-200827-lxbuilds-Intel-Snow-Ridge-NS_platform_up-intel-x86-64-standard-glibc-std-wrlinux-build-tmp-glibc-work-corei7-64-wrs-linux-bcc-0.15.0-r0-recipe-sysroot-native-usr-bin-python3-native-python3/bcc/version.py.tmp
+
+Upstream-Status: Pending
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ src/python/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+--- a/src/python/CMakeLists.txt
++++ b/src/python/CMakeLists.txt
+@@ -16,7 +16,7 @@ file(GLOB_RECURSE PYTHON_INCLUDES RELATI
+ 
+ foreach(PY_CMD ${PYTHON_CMD})
+   string(REPLACE "/" "-" PY_CMD_ESCAPED ${PY_CMD})
+-  set(PY_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bcc-${PY_CMD_ESCAPED})
++  set(PY_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/bcc-python3)
+ 
+   foreach(PY_SRC ${PYTHON_SOURCES})
+     configure_file(${PY_SRC} ${PY_DIRECTORY}/${PY_SRC} COPYONLY)
+@@ -35,7 +35,7 @@ foreach(PY_CMD ${PYTHON_CMD})
+     DEPENDS ${PYTHON_SOURCES} ${PYTHON_INCLUDES}
+     COMMENT "Building sdist for ${PY_CMD}"
+   )
+-  add_custom_target(bcc_py_${PY_CMD_ESCAPED} ALL DEPENDS ${PIP_INSTALLABLE})
++  add_custom_target(bcc_py_python3 ALL DEPENDS ${PIP_INSTALLABLE})
+ 
+   if(NOT PYTHON_PREFIX)
+      set(PYTHON_PREFIX ${CMAKE_INSTALL_PREFIX})
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch
new file mode 100644
index 0000000000..c3c787d26d
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch
@@ -0,0 +1,124 @@
+From 6cffc195eca6b53a12865d325ff97e7b5ba8f22b Mon Sep 17 00:00:00 2001
+From: Daniel Thompson <daniel.thompson@linaro.org>
+Date: Thu, 19 May 2022 09:14:20 +0000
+Subject: [PATCH] Vendor just enough extra headers to allow libbpf to be
+ de-vendored
+
+Currently it is not possible to build the bcc recipe when we de-vendor
+libbpf and adopt the packaged version. Ironically this is due to the
+deliberate vendoring of some depreciated btf code that is being removed
+upstream because bcc was the only user! In other words the vendored code
+doesn't work the de-vendored libbpf because also ends up de-vendoring
+one of the Linux uapi headers.
+
+This is obviously an OE specific issue (due to the current combination
+of linux headers, libbpf and bcc). It's a bit of a mess and the right
+solution is probably to update the system UAPI headers but I am committing
+this for now simply so I can easily show why we must de-vendor libbpf in
+the first place!
+
+Upstream-Status: Inappropriate [other]
+
+Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
+---
+ src/cc/bcc_btf.cc | 87 +++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 87 insertions(+)
+
+diff --git a/src/cc/bcc_btf.cc b/src/cc/bcc_btf.cc
+index 7f551ae8..cca3c6c3 100644
+--- a/src/cc/bcc_btf.cc
++++ b/src/cc/bcc_btf.cc
+@@ -33,6 +33,93 @@
+ 
+ namespace btf_ext_vendored {
+ 
++#ifdef HAVE_EXTERNAL_LIBBPF
++/*
++ * When we de-vendor libbpf we end up picking up an older version of
++ * [uapi/]linux/bpf.h which misses out some of the data structures needed
++ * to compile this file. Annoyingly the code that doesn't compile it
++ * a result of de-vendoring
++ *
++ * This section is a minimized re-vendoring to fix that. It is not robust
++ * against version skew: When the system linux/bpf.h is updated then this
++ * will break the build and the patch can be dropped.
++ */
++
++/* bpf_core_relo_kind encodes which aspect of captured field/type/enum value
++ * has to be adjusted by relocations. It is emitted by llvm and passed to
++ * libbpf and later to the kernel.
++ */
++enum bpf_core_relo_kind {
++	BPF_CORE_FIELD_BYTE_OFFSET = 0,      /* field byte offset */
++	BPF_CORE_FIELD_BYTE_SIZE = 1,        /* field size in bytes */
++	BPF_CORE_FIELD_EXISTS = 2,           /* field existence in target kernel */
++	BPF_CORE_FIELD_SIGNED = 3,           /* field signedness (0 - unsigned, 1 - signed) */
++	BPF_CORE_FIELD_LSHIFT_U64 = 4,       /* bitfield-specific left bitshift */
++	BPF_CORE_FIELD_RSHIFT_U64 = 5,       /* bitfield-specific right bitshift */
++	BPF_CORE_TYPE_ID_LOCAL = 6,          /* type ID in local BPF object */
++	BPF_CORE_TYPE_ID_TARGET = 7,         /* type ID in target kernel */
++	BPF_CORE_TYPE_EXISTS = 8,            /* type existence in target kernel */
++	BPF_CORE_TYPE_SIZE = 9,              /* type size in bytes */
++	BPF_CORE_ENUMVAL_EXISTS = 10,        /* enum value existence in target kernel */
++	BPF_CORE_ENUMVAL_VALUE = 11,         /* enum value integer value */
++};
++
++/*
++ * "struct bpf_core_relo" is used to pass relocation data form LLVM to libbpf
++ * and from libbpf to the kernel.
++ *
++ * CO-RE relocation captures the following data:
++ * - insn_off - instruction offset (in bytes) within a BPF program that needs
++ *   its insn->imm field to be relocated with actual field info;
++ * - type_id - BTF type ID of the "root" (containing) entity of a relocatable
++ *   type or field;
++ * - access_str_off - offset into corresponding .BTF string section. String
++ *   interpretation depends on specific relocation kind:
++ *     - for field-based relocations, string encodes an accessed field using
++ *       a sequence of field and array indices, separated by colon (:). It's
++ *       conceptually very close to LLVM's getelementptr ([0]) instruction's
++ *       arguments for identifying offset to a field.
++ *     - for type-based relocations, strings is expected to be just "0";
++ *     - for enum value-based relocations, string contains an index of enum
++ *       value within its enum type;
++ * - kind - one of enum bpf_core_relo_kind;
++ *
++ * Example:
++ *   struct sample {
++ *       int a;
++ *       struct {
++ *           int b[10];
++ *       };
++ *   };
++ *
++ *   struct sample *s = ...;
++ *   int *x = &s->a;     // encoded as "0:0" (a is field #0)
++ *   int *y = &s->b[5];  // encoded as "0:1:0:5" (anon struct is field #1,
++ *                       // b is field #0 inside anon struct, accessing elem #5)
++ *   int *z = &s[10]->b; // encoded as "10:1" (ptr is used as an array)
++ *
++ * type_id for all relocs in this example will capture BTF type id of
++ * `struct sample`.
++ *
++ * Such relocation is emitted when using __builtin_preserve_access_index()
++ * Clang built-in, passing expression that captures field address, e.g.:
++ *
++ * bpf_probe_read(&dst, sizeof(dst),
++ *		  __builtin_preserve_access_index(&src->a.b.c));
++ *
++ * In this case Clang will emit field relocation recording necessary data to
++ * be able to find offset of embedded `a.b.c` field within `src` struct.
++ *
++ * [0] https://llvm.org/docs/LangRef.html#getelementptr-instruction
++ */
++struct bpf_core_relo {
++	__u32 insn_off;
++	__u32 type_id;
++	__u32 access_str_off;
++	enum bpf_core_relo_kind kind;
++};
++#endif /* HAVE_EXTERNAL_LIBBPF */
++
+ /* The minimum bpf_func_info checked by the loader */
+ struct bpf_func_info_min {
+         uint32_t   insn_off;
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/fix_for_memleak.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/fix_for_memleak.patch
new file mode 100644
index 0000000000..a3a1ec931d
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/fix_for_memleak.patch
@@ -0,0 +1,16 @@
+Upstream-Status: Submitted [https://github.com/iovisor/bcc/pull/5355]
+Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
+
+diff --git a/tests/python/test_tools_memleak.py b/tests/python/test_tools_memleak.py
+--- a/tests/python/test_tools_memleak.py       
++++ b/tests/python/test_tools_memleak.py   
+@@ -26,7 +26,7 @@
+     # Build the memory leaking application.
+     c_src = 'test_tools_memleak_leaker_app.c'
+     tmp_dir = tempfile.mkdtemp(prefix='bcc-test-memleak-')
+-    c_src_full = os.path.dirname(sys.argv[0]) + os.path.sep + c_src
++    c_src_full = os.path.abspath(os.path.dirname(sys.argv[0])) + os.path.sep + c_src
+     exec_dst = tmp_dir + os.path.sep + 'leaker_app'
+
+     if subprocess.call(['gcc', '-g', '-O0', '-o', exec_dst, c_src_full]) != 0:
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/ptest_wrapper.sh b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/ptest_wrapper.sh
new file mode 100644
index 0000000000..92d015614c
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/ptest_wrapper.sh
@@ -0,0 +1,16 @@
+#!/bin/sh
+# Simple OE specific wrapper for bcc python tests
+
+name=$1
+kind=$2
+cmd=$3
+shift 3
+
+case $kind in
+    simple|sudo)
+        $cmd "$@"
+        ;;
+    *)
+        echo "Invalid kind $kind of test $name"
+        exit 1
+esac
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/run-ptest b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/run-ptest
new file mode 100644
index 0000000000..4740ae9c11
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc/run-ptest
@@ -0,0 +1,65 @@
+#!/bin/sh
+
+cd tests || exit 1
+
+PASS_CNT=0
+FAIL_CNT=0
+FAILED=""
+
+print_test_result() {
+    if [ $? -eq 0 ]; then
+        echo PASS: "$1"
+        PASS_CNT=$((PASS_CNT + 1))
+    else
+        echo FAIL: "$1"
+        FAIL_CNT=$((FAIL_CNT + 1))
+        FAILED="$FAILED $1;"
+    fi
+}
+
+ARCH=$(uname -m)
+
+case "$ARCH" in
+  x86_64)
+    KDIR="x86"
+    ;;
+  riscv64)
+    KDIR="riscv"
+    ;;
+  aarch64)
+    KDIR="arm64"
+    ;;
+  powerpc64le | ppc64le)
+    KDIR="powerpc"
+    ;;
+  *)
+    echo "Architecture not present, Add the architecture in run-ptest: $ARCH"
+    exit 1
+    ;;
+esac
+
+export BCC_KERNEL_SOURCE="/usr/src/kernel/arch/$KDIR"
+
+# Run CC tests, set IFS as test names have spaces
+IFS=$(printf '\n\t')
+for test_name in $(./cc/test_libbcc_no_libbpf --list-test-names-only); do
+    ./cc/test_libbcc_no_libbpf "$test_name" > /dev/null 2>&1
+    print_test_result "cc $test_name"
+done
+unset IFS
+
+# Run python tests, skip namespace tests as they currently don't work
+if cmake -DCMAKE_TESTING_ENABLED=ON -DTEST_WRAPPER="$(pwd)/ptest_wrapper.sh" python > /dev/null 2>&1; then
+    for test_name in $(awk -F '[( ]' '/^add_test/ && !/namespace/ {print $2}' CTestTestfile.cmake); do
+        ctest -Q -R "$test_name"
+        print_test_result "python $test_name"
+    done
+else
+    print_test_result "cmake error, couldn't start python tests"
+fi
+
+echo "#### bcc tests summary ####"
+echo "# TOTAL: $((PASS_CNT + FAIL_CNT))"
+echo "# PASS:  $PASS_CNT"
+echo "# FAIL:  $FAIL_CNT ($FAILED)"
+echo "###########################"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
new file mode 100644
index 0000000000..b810f6ec77
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bcc/bcc_0.35.0.bb
@@ -0,0 +1,92 @@
+SUMMARY = "BPF Compiler Collection (BCC)"
+HOMEPAGE = "https://github.com/iovisor/bcc"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e3fc50a88d0a364313df4b21ef20c29e"
+
+inherit cmake python3native manpages ptest
+
+DEPENDS += "bison-native \
+            flex-native \
+            zip-native \
+            flex \
+            elfutils \
+            clang \
+            libbpf \
+            python3-setuptools-native \
+            "
+
+RDEPENDS:${PN} += "bash python3 python3-core python3-setuptools xz"
+RDEPENDS:${PN}-ptest = "kernel-devsrc packagegroup-core-buildessential cmake bash python3 python3-netaddr python3-pyroute2"
+
+SRC_URI = "gitsm://github.com/iovisor/bcc;branch=master;protocol=https;tag=v${PV} \
+           file://0001-CMakeLists.txt-override-the-PY_CMD_ESCAPED.patch \
+           file://0001-Vendor-just-enough-extra-headers-to-allow-libbpf-to-.patch \
+           file://run-ptest \
+           file://ptest_wrapper.sh \
+           file://fix_for_memleak.patch \
+           "
+
+SRCREV = "c31a1ca305f787ba53e001ead45ebf65233a32cf"
+
+PACKAGECONFIG ??= "examples"
+PACKAGECONFIG:remove:libc-musl = "examples"
+
+PACKAGECONFIG[manpages] = "-DENABLE_MAN=ON,-DENABLE_MAN=OFF,"
+PACKAGECONFIG[examples] = "-DENABLE_EXAMPLES=ON,-DENABLE_EXAMPLES=OFF,"
+
+EXTRA_OECMAKE = " \
+    -DREVISION='${PV}' \
+    -DCMAKE_USE_LIBBPF_PACKAGE=ON \
+    -DENABLE_LLVM_SHARED=ON \
+    -DENABLE_CLANG_JIT=ON \
+    -DPY_SKIP_DEB_LAYOUT=ON \
+    -DPYTHON_CMD=${PYTHON} \
+    -DPYTHON_FLAGS=--install-lib=${PYTHON_SITEPACKAGES_DIR} \
+"
+
+# Avoid stripping debuginfo.so to fix some tests.
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+
+do_install:append() {
+        sed -e 's@#!/usr/bin/env python@#!/usr/bin/env python3@g' \
+            -i $(find ${D}${datadir}/${PN} -type f)
+        sed -e 's@#!/usr/bin/python.*@#!/usr/bin/env python3@g' \
+            -i $(find ${D}${datadir}/${PN} -type f)
+        rm -rf ${D}${datadir}/bcc/examples/lua
+}
+
+do_install_ptest() {
+    install -d ${D}${PTEST_PATH}/tests/cc
+    # ptest searches for shared libs and archive files in the build folder.
+    # Hence, these files are copied to the image to fix these tests.
+    install -d ${D}${B}/tests/cc
+    install ${B}/tests/cc/archive.zip ${B}/tests/cc/libdebuginfo_test_lib.so ${B}/tests/cc/with_gnu_debuglink.so ${B}/tests/cc/with_gnu_debugdata.so ${B}/tests/cc/debuginfo.so ${D}${B}/tests/cc
+    install -d ${D}/opt
+    install ${B}/tests/cc/test_libbcc_no_libbpf ${B}/tests/cc/libusdt_test_lib.so ${D}${PTEST_PATH}/tests/cc
+    cp -rf ${S}/tests/python ${D}${PTEST_PATH}/tests/python
+    install ${UNPACKDIR}/ptest_wrapper.sh ${D}${PTEST_PATH}/tests
+    install ${S}/examples/networking/simulation.py ${D}${PTEST_PATH}/tests/python
+    find ${S}/tools/ -type f -name "*.py" -exec \
+    sed -i \
+    -e 's@^#! */usr/bin/env python$@#!/usr/bin/env python3@' \
+    -e 's@^#! */usr/bin/python.*@#!/usr/bin/env python3@' {} +
+    cp -rf ${S}/tools/ ${D}${PTEST_PATH}/../../tools/
+}
+
+FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}"
+FILES:${PN} += "${B}/tests/cc"
+FILES:${PN}-ptest += "${libdir}/libbcc.so"
+FILES:${PN}-ptest += "${libdir}/tools/"
+FILES:${PN}-ptest += "/opt/"
+FILES:${PN}-doc += "${datadir}/${PN}/man"
+
+COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
+
+# WARNING: bcc-0.30.0+git-r0 do_package_qa: QA Issue: File /usr/lib/bcc/ptest/tests/cc/test_libbcc_no_libbpf in package bcc-ptest contains reference to TMPDIR [buildpaths]
+# this one is difficult to resolve, because the tests use CMAKE_CURRENT_BINARY_DIR directly in .cc e.g.:
+# https://github.com/iovisor/bcc/commit/7271bfc946a19413761be2e3c60c48bf72c5eea1#diff-233a0bfa490f3d7466c49935b64c86dd93956bbc0461f5af703b344cf6601461
+# we would probably need to use separate variable for "runtime" path for test assets from the standard CMAKE_CURRENT_BINARY_DIR variable or use relative
+# path from the test binary
+WARN_QA:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' buildpaths', '', d)}"
+ERROR_QA:remove = "${@bb.utils.contains('PTEST_ENABLED', '1', 'buildpaths', '', d)}"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Fix-build-failures-due-to-missing-location.hh.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Fix-build-failures-due-to-missing-location.hh.patch
new file mode 100644
index 0000000000..1c2ae33238
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0001-Fix-build-failures-due-to-missing-location.hh.patch
@@ -0,0 +1,54 @@
+From 24421ba92c69f1abaadaff01270621917616a2b8 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 17 Apr 2025 10:38:50 +0800
+Subject: [PATCH] Fix build failures due to missing location.hh
+
+ast/location.h does `#include "location.hh"` and location.hh is
+generated by the parser so any CMake target whose source includes
+ast/location.h needs to have a dependency on the `parser` target,
+otherwise the compilation may fail due to incorrect ordering of build
+targets. This also applies to targets which include ast/location.h
+transitively via other headers.
+
+To avoid such errors, do 2 things:
+- drop includes of ast/location.h where unused
+- for CMake targets including ast/location.h, add an explicit dependency
+  on the `parser` target
+
+Signed-off-by: Viktor Malik <viktor.malik@gmail.com>
+
+Upstream-Status: Backport [https://github.com/bpftrace/bpftrace/commit/743cb9c88c25fb9737d714f4d4ac853f05bb6481]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ src/CMakeLists.txt     | 1 +
+ src/ast/CMakeLists.txt | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index e04ee429..13a51040 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -21,6 +21,7 @@ add_library(compiler_core STATIC
+   struct.cpp
+   types.cpp
+ )
++add_dependencies(compiler_core parser)
+ 
+ add_library(runtime STATIC
+   attached_probe.cpp
+diff --git a/src/ast/CMakeLists.txt b/src/ast/CMakeLists.txt
+index 92231f85..7230cf71 100644
+--- a/src/ast/CMakeLists.txt
++++ b/src/ast/CMakeLists.txt
+@@ -22,6 +22,7 @@ add_library(ast STATIC
+   passes/return_path_analyser.cpp
+ )
+ 
++add_dependencies(ast parser)
+ target_compile_definitions(ast PRIVATE ${BPFTRACE_FLAGS})
+ target_link_libraries(ast PUBLIC ast_defs arch compiler_core parser)
+ 
+-- 
+2.34.1
+
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
new file mode 100644
index 0000000000..4f0ebbf564
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch
@@ -0,0 +1,38 @@
+From ce5d908bb1256ede680fbfd521f087060a567dca Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Tue, 3 Sep 2024 14:17:51 +0200
+Subject: [PATCH] CMakeLists.txt: allow to set BISON_FLAGS like -l
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+
+Upstream-Status: Pending
+---
+ CMakeLists.txt | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -100,16 +100,20 @@ include_directories(SYSTEM ${LIBCEREAL_I
+ 
+ find_package(BISON REQUIRED)
+ find_package(FLEX REQUIRED)
++
++# avoid buildpaths in generated #line statements and allow to pass --file-prefix-map=OLD=NEW
++set(BISON_FLAGS "${BISON_FLAGS} -l")
++set(FLEX_FLAGS "${FLEX_FLAGS} -L")
+ # `parser_class_name` is deprecated and generates warnings in bison >= 3.3.
+ # But `api.parser.class` is not supported in bison < 3.3. So we must inject
+ # the %define based on the bison version here.
+ if(${BISON_VERSION} VERSION_GREATER_EQUAL 3.3)
+-  set(BISON_FLAGS "-Dapi.parser.class={Parser}")
++  set(BISON_FLAGS "${BISON_FLAGS} -Dapi.parser.class={Parser}")
+ else()
+-  set(BISON_FLAGS "-Dparser_class_name={Parser}")
++  set(BISON_FLAGS "${BISON_FLAGS} -Dparser_class_name={Parser}")
+ endif()
+ bison_target(bison_parser src/parser.yy ${CMAKE_BINARY_DIR}/parser.tab.cc COMPILE_FLAGS ${BISON_FLAGS} VERBOSE)
+-flex_target(flex_lexer src/lexer.l ${CMAKE_BINARY_DIR}/lex.yy.cc)
++flex_target(flex_lexer src/lexer.l ${CMAKE_BINARY_DIR}/lex.yy.cc COMPILE_FLAGS ${FLEX_FLAGS})
+ add_flex_bison_dependency(flex_lexer bison_parser)
+ add_library(parser STATIC ${BISON_bison_parser_OUTPUTS} ${FLEX_flex_lexer_OUTPUTS})
+ target_compile_options(parser PRIVATE "-w")
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/run-ptest b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/run-ptest
new file mode 100644
index 0000000000..63d65e25a2
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/run-ptest
@@ -0,0 +1,51 @@
+#!/bin/sh
+
+# The whole test suite may take up to 40 minutes to run, so setting -t 2400
+# parameter in ptest-runner is necessary to not kill it before completion
+
+cd tests || exit 1
+export BPFTRACE_RUNTIME_TEST_EXECUTABLE=/usr/bin/bpftrace
+export BPFTRACE_AOT_RUNTIME_TEST_EXECUTABLE=/usr/bin/bpftrace-aotrt
+
+PASS_CNT=0
+FAIL_CNT=0
+SKIP_CNT=0
+FAILED=""
+
+print_test_result() {
+     if [ $? -eq 0 ]; then
+         echo "PASS: $1"
+         PASS_CNT=$((PASS_CNT + 1))
+     else
+         echo "FAIL: $1"
+         FAIL_CNT=$((FAIL_CNT + 1))
+         FAILED="${FAILED:+$FAILED }$1;"
+     fi
+ }
+
+IFS=$(printf '\n\t')
+# Start unit tests
+for test_name in $(./bpftrace_test --gtest_list_tests | grep -v "^ "); do
+    ./bpftrace_test --gtest_filter="${test_name}*" > /dev/null 2>&1
+    print_test_result "unit:$test_name"
+done
+
+# Start runtime tests
+for test_name in $(ls runtime); do
+    # Ignore test cases that hang the suite forever (bpftrace v0.16.0)
+    if [ "$test_name" = "signals" ] || [ "$test_name" = "watchpoint" ]; then
+        echo "SKIP: runtime:$test_name"
+        SKIP_CNT=$((SKIP_CNT + 1))
+        continue
+    fi
+    python3 runtime/engine/main.py --filter="${test_name}.*" > /dev/null 2>&1
+    print_test_result "runtime:$test_name"
+done
+unset IFS
+
+echo "#### bpftrace tests summary ####"
+echo "# TOTAL: $((PASS_CNT + FAIL_CNT + SKIP_CNT))"
+echo "# PASS:  $PASS_CNT"
+echo "# FAIL:  $FAIL_CNT ($FAILED)"
+echo "# SKIP:  $SKIP_CNT"
+echo "################################"
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb
new file mode 100644
index 0000000000..bd3b772220
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.23.0.bb
@@ -0,0 +1,62 @@
+SUMMARY = "bpftrace"
+HOMEPAGE = "https://github.com/iovisor/bpftrace"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+
+DEPENDS += "bison-native \
+            flex-native \
+            gzip-native \
+            elfutils \
+            bcc \
+            systemtap \
+            libcereal \
+            libbpf \
+            "
+DEPENDS += "${@bb.utils.contains('PTEST_ENABLED', '1', 'pahole-native llvm-native', '', d)}"
+
+RDEPENDS:${PN} += "bash python3 xz"
+
+PV .= "+git"
+
+SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.23.x;protocol=https \
+           file://run-ptest \
+           file://0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch \
+           file://0001-Fix-build-failures-due-to-missing-location.hh.patch \
+"
+SRCREV = "01e806d24c61f996f1809e1e991646311499db4f"
+
+inherit bash-completion cmake ptest pkgconfig
+
+PACKAGECONFIG ?= " \
+        ${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
+        ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "systemd", "", d)} \
+        "
+
+PACKAGECONFIG[tests] = "-DBUILD_TESTING=ON,-DBUILD_TESTING=OFF,gtest xxd-native"
+PACKAGECONFIG[systemd] = "-DENABLE_SYSTEMD=ON,-DENABLE_SYSTEMD=OFF,systemd"
+
+do_install_ptest() {
+    if [ -e ${B}/tests/bpftrace_test ]; then
+        install -Dm 755 ${B}/tests/bpftrace_test ${D}${PTEST_PATH}/tests/bpftrace_test
+        cp -rf ${B}/tests/runtime ${D}${PTEST_PATH}/tests
+        cp -rf ${B}/tests/test* ${D}${PTEST_PATH}/tests
+    fi
+}
+
+EXTRA_OECMAKE = " \
+    -DCMAKE_ENABLE_EXPORTS=1 \
+    -DCMAKE_BUILD_TYPE=Release \
+    -DUSE_SYSTEM_BPF_BCC=ON \
+    -DENABLE_MAN=OFF \
+    -DBISON_FLAGS='--file-prefix-map=${WORKDIR}=' \
+"
+
+COMPATIBLE_HOST = "(x86_64.*|aarch64.*|powerpc64.*|riscv64.*)-linux"
+COMPATIBLE_HOST:libc-musl = "null"
+
+INHIBIT_PACKAGE_STRIP_FILES += "\
+    ${PKGD}${PTEST_PATH}/tests/testprogs/uprobe_test \
+"
+
+WARN_QA:append = "${@bb.utils.contains('PTEST_ENABLED', '1', ' buildpaths', '', d)}"
+ERROR_QA:remove = "${@bb.utils.contains('PTEST_ENABLED', '1', 'buildpaths', '', d)}"

