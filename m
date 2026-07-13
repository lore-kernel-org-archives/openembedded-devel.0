Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB6FDC44508
	for <webhook@archiver.kernel.org>; Mon, 13 Jul 2026 00:45:15 +0000 (UTC)
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1209.1783903509646254611
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Jul 2026 17:45:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NoAW8RKv;
 spf=pass (domain: gmail.com, ip: 209.85.215.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so1498341a12.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 12 Jul 2026 17:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783903509; x=1784508309; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6gdpTKYDGWkpZo7LwAVR7yGgxmEhd6vKt3oy8Wm/Fv8=;
        b=NoAW8RKvERHq/yb5caCiCNRKya+i/Dfym4PHj6ExPbvk5uB7/nZtzjYaxJUn+pw1uA
         3YYaHyfDJ6VdneoJ1US+AJ55frshYP1uDPl+wfWeyGpcgbgbRCH73C64AMrIcRSIko4F
         auOOHeREYdGMc1b4UTBTcJLK1Gj0RRpxUXqA17rf99upeapoGVUCLWuSVTn+kYk21hVb
         Mskz+kfLI8MV4cwQGrDUhz+/mayTtcMHkqtJXnOv7v2CagUpefCriJreSMNn/wdJdazu
         76Ohqvh7kHnn7XJO8gW1jI5RLLcMdx+vxdaA0oAJrfX8lmhGKPJyIyau7O6sOEWBRuhu
         7P3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783903509; x=1784508309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6gdpTKYDGWkpZo7LwAVR7yGgxmEhd6vKt3oy8Wm/Fv8=;
        b=RuXBkBubOstxrE6myd0FBGPvl6VllF8TxBn9JgzZAfAPF+2wCDa9Svrc0wlUE9gTLH
         e7at1iuwS05elQSZorsOMeGWwCxeR6KT4zDYIzv8phTzZM93XXTiw6+/SxB4pgBWYHO+
         xBOyCP/FQE0YM9g15KhpoqPMoz9yvd8aqM17Go3ZTAtV4iY8MIZsUYWqFcz58ymQlhBt
         3Wn2e2Y0IdLyOBP+/uFeZB5RTa3NByiAFM4DxiS9JihEHX9IwzrVxubWxBH+6H+Eho1u
         LvBoVORnNhM2+myPlD6RKNpA/eW2xZcS8xGIBhMPwtgaY6M98R5NmOIBYvew+7cLKPDs
         GAbQ==
X-Gm-Message-State: AOJu0YydDYxDxYBkCXFOWItGdgxAXqcPNdlFPkB2EOyytoWwHfGZ79o6
	+IRCjIYAMIy865yyeF7ICP24cBQjGO9otOrB45rXbTscvXx6QmW4ZJhGL6WRif4vI3Q=
X-Gm-Gg: AfdE7ckajpi/9A1/IlWyfYwlUCQ8sRUL0QFhKDy7Or3oq3jW0lVpgOSY7BfLdkqVcJx
	Se1P8Km91Ktardqe/+ow/DxWUF1+KV14BeETdGRf36zQGiW92dqYB06bNga/7tGXkw2Q+DPiWcM
	wMRhCHc9v02+CwWWgqq4CMu2NwWCqvSMceg8ZueZx0KyZpmkwlpjiGcOY6sr+K6A1m+PQbbrCmH
	XBgBsxrOHMAy7L1DBfQiCPZWKjI6NUk8O00CPYyDs/nxw6GXTMRX/i83BDD33I/KhKCBzlVBOkM
	m4IF0VIkawB33ytCKqVOOfyUz/5PoDlchWDcWrX4wO63VfhymKlat5UOn5jo9JIrNa5BqnfvP7l
	5yyTYl/6dSdyJgsxqzgPK5qJ1822Ce2uoY4aUrMdozxNy1/fBxh6iYOrkvGRlIDUGvevUHQdiFd
	u6U2Jn/Ig52u4Qzx96Hnfz1JJaV6iElQNqye3NL/00C2SA09t3w0Q9OT22B3STPFwyNCyio21ng
	HH8Pxju4g7p39TyOKy/dePIUsj8fXtA+FeBh3wr2Xe8OJ0/O36/h2S6JLE7mbiZS836KeQfUpav
	p5SwlHcZYZpeYcAluAqaEhc8mz4IXcOZX2RHaYeM
X-Received: by 2002:a05:6300:2189:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3c0f0990bcfmr12420781637.17.1783903508907;
        Sun, 12 Jul 2026 17:45:08 -0700 (PDT)
Received: from apollo.localdomain ([208.95.233.74])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm71206990c88.7.2026.07.12.17.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 17:45:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-oe][PATCH 3/8] bpftrace: link test data source binary without host runtime
Date: Sun, 12 Jul 2026 17:44:57 -0700
Message-ID: <20260713004502.716970-3-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
References: <20260713004502.716970-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2026 00:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128145

The build host HOME directory check recently added to OE-Core's
buildpaths QA test flags the ptest gtest binary:

WARNING: bpftrace-0.25.1-r0 do_package_qa: QA Issue: File
/usr/lib/bpftrace/ptest/tests/bpftrace_test in package bpftrace-ptest
contains a reference to the build host HOME directory. [buildpaths]

WARNING: bpftrace-0.25.1-r0 do_package_qa: QA Issue: File
/usr/lib/bpftrace/ptest/tests/.debug/bpftrace_test in package
bpftrace-dbg contains a reference to the build host HOME directory.
[buildpaths]

cmake/BuildBPF.cmake links the intermediate DWARF carrier binary
data_source_exe with the plain build host gcc, which bakes the host
dynamic loader's absolute path into the PT_INTERP segment. With a
distro gcc that is an innocuous /lib64/ld-linux-x86-64.so.2, but when
the host toolchain is a buildtools-extended/SDK gcc installed under
the build user's home directory (as on the autobuilder workers), it
is a $HOME-prefixed path like

  /srv/pokybuild/.../buildtools/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2

The executable is then embedded byte-for-byte into bpftrace_test via
embed()/xxd (tests/data/CMakeLists.txt), so the path ends up in the
test binary's .rodata, triggering the bpftrace-ptest warning. And
because cmake/Embed.tmpl declares the embedded blob as a constexpr
array, gcc additionally copies its contents into .debug_info as
DW_AT_const_value, which is how the same string survives
objcopy --only-keep-debug into the split debug file, triggering the
bpftrace-dbg warning. This is the same embedding mechanism that
previously leaked TMPDIR paths, fixed for the compile step by the
DEBUG_PREFIX_MAP patch; the link step was still leaking.

The tests only write this binary to a temp file and use it as a
uprobe target (tests/dwarf_common.h), parsing its DWARF and symbols;
it is never executed. So link it with -nostdlib -no-pie -Wl,--entry=0:
no interpreter, no host crt objects, no dynamic segment, and thus
nothing host-specific in the embedded blob. Function symbols, DWARF
type information and the pahole -J BTF encoding step are unaffected,
and the field_analyser_dwarf ptests still pass.

Because the object is now linked -nostdlib it must not reference the
libc stack-protector runtime. Host gcc toolchains that default to
-fstack-protector-strong (e.g. Debian/Ubuntu and the Yocto
autobuilder workers) otherwise leave an undefined reference and the
link fails:

  ld: data_source.o: in function `main':
  data_source.c:212: undefined reference to `__stack_chk_fail'
  collect2: error: ld returned 1 exit status

Compile the object and link the binary with -fno-stack-protector; the
canary is irrelevant to a DWARF/BTF carrier that is never run.

Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...make-link-data-source-binary-without.patch | 78 +++++++++++++++++++
 .../bpftrace/bpftrace_0.25.1.bb               |  1 +
 2 files changed, 79 insertions(+)
 create mode 100644 meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch
new file mode 100644
index 0000000000..7a69d0f8c1
--- /dev/null
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace/0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch
@@ -0,0 +1,78 @@
+From: Khem Raj <khem.raj@oss.qualcomm.com>
+Date: Thu, 2 Jul 2026 15:30:00 -0700
+Subject: [PATCH] cmake/BuildBPF.cmake: link data source binary without host
+ runtime
+
+The `bpf()` helper links the intermediate DWARF carrier binary
+(data_source_exe) with the plain host gcc:
+
+  ${GCC} -g -o data_source_exe data_source.o
+
+and the resulting executable is then embedded byte-for-byte into
+bpftrace_test via embed()/xxd (tests/data/CMakeLists.txt). Linking it as
+a regular dynamic executable bakes host-toolchain artifacts into it:
+
+  * PT_INTERP: the absolute path of the host toolchain's dynamic
+    loader. With a vendored/SDK toolchain (e.g. Yocto
+    buildtools-extended installed under the build user's home) this is
+    an absolute build-host path such as
+    /srv/pokybuild/.../buildtools/sysroots/x86_64-pokysdk-linux/lib/ld-linux-x86-64.so.2
+  * crt startup objects (crt1.o, crti.o, crtbegin.o) including whatever
+    debug info the host libc was built with.
+
+Since the embedded blob carries these strings into the packaged test
+binary, the build is not reproducible across hosts and leaks build host
+paths, flagged by OE's buildpaths QA check:
+
+  WARNING: bpftrace-0.25.1-r0 do_package_qa: QA Issue: File
+  /usr/lib/bpftrace/ptest/tests/bpftrace_test in package bpftrace-ptest
+  contains a reference to the build host HOME directory. [buildpaths]
+
+The binary only serves as a DWARF/BTF container: the tests write it to
+a temp file and use it as a uprobe target (tests/dwarf_common.h), which
+parses debug info and symbols but never executes it. So link it with
+-nostdlib -no-pie: no interpreter, no dynamic segment, no host crt
+code. -Wl,--entry=0 silences the "cannot find entry symbol _start"
+warning. All function symbols, DWARF type information and the
+pahole -J BTF encoding step are unaffected.
+
+Because the object is now linked -nostdlib, it must not emit references
+to the libc stack-protector runtime. Host gcc toolchains that default to
+-fstack-protector-strong (e.g. Debian/Ubuntu, the Yocto autobuilders)
+otherwise leave an undefined reference and the link fails:
+
+  ld: data_source.o: in function `main':
+  data_source.c:212: undefined reference to `__stack_chk_fail'
+  collect2: error: ld returned 1 exit status
+
+Compile the object (and link the binary) with -fno-stack-protector; the
+canary is irrelevant to a DWARF/BTF carrier that is never run.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
+---
+ cmake/BuildBPF.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/BuildBPF.cmake b/cmake/BuildBPF.cmake
+index cb8cd68..8aa059f 100644
+--- a/cmake/BuildBPF.cmake
++++ b/cmake/BuildBPF.cmake
+@@ -90,7 +90,7 @@ function(bpf NAME)
+     OUTPUT ${ARG_OBJECT}
+     DEPENDS ${ARG_SOURCE} ${ARG_DEPENDS}
+     # See above: fresh compilation and the use of `gcc`.
+-    COMMAND ${GCC} -Wno-attributes -g -I ${CMAKE_CURRENT_BINARY_DIR} -c ${CMAKE_CURRENT_SOURCE_DIR}/${ARG_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
++    COMMAND ${GCC} -Wno-attributes -fno-stack-protector -g -I ${CMAKE_CURRENT_BINARY_DIR} -c ${CMAKE_CURRENT_SOURCE_DIR}/${ARG_SOURCE} -o ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
+     COMMAND cmake -E env LLVM_OBJCOPY=${LLVM_OBJCOPY} ${PAHOLE} -J ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
+     VERBATIM
+   )
+@@ -107,7 +107,7 @@ function(bpf NAME)
+     add_custom_command(
+       OUTPUT ${ARG_BINARY}
+       DEPENDS ${ARG_SOURCE} ${NAME}_gen_object
+-      COMMAND ${GCC} -g -o ${CMAKE_CURRENT_BINARY_DIR}/${ARG_BINARY} ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
++      COMMAND ${GCC} -g -fno-stack-protector -nostdlib -no-pie -Wl,--entry=0 -o ${CMAKE_CURRENT_BINARY_DIR}/${ARG_BINARY} ${CMAKE_CURRENT_BINARY_DIR}/${ARG_OBJECT}
+       COMMAND cmake -E env LLVM_OBJCOPY=${LLVM_OBJCOPY} ${PAHOLE} -J ${CMAKE_CURRENT_BINARY_DIR}/${ARG_BINARY}
+       VERBATIM
+     )
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.25.1.bb b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.25.1.bb
index 62e0c17f9d..7daf02ba1c 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.25.1.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-devtools/bpftrace/bpftrace_0.25.1.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/iovisor/bpftrace;branch=release/0.25.x;protocol=http
            file://run-ptest \
            file://0002-CMakeLists.txt-allow-to-set-BISON_FLAGS-like-l.patch \
            file://0001-cmake-BuildBPF.cmake-introduce-DEBUG_PREFIX_MAP.patch \
+           file://0003-cmake-BuildBPF.cmake-link-data-source-binary-without.patch \
 "
 SRCREV = "e491811e5d648288c01f42ce087967b271f504a0"


