Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7901EE7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 09:07:08 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web11.52532.1734340023990955090
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Dec 2024 01:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout12.t-online.de (Postfix) with SMTP id A8DC718A8
	for <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 10:07:01 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.147]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tN746-0Tnseo0; Mon, 16 Dec 2024 10:06:58 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 2/3] mozjs: add recipe for mozjs-128
Date: Mon, 16 Dec 2024 10:07:04 +0100
Message-ID: <20241216090705.1698-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241216090705.1698-1-f_l_k@t-online.de>
References: <20241216090705.1698-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1734340018-B9FF89DC-E31EEE82/0/0 CLEAN NORMAL
X-TOI-MSGID: 1795df2d-5f31-4083-80a9-ec8b3ce5c19c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Dec 2024 09:07:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114324

mozjs-128 is the current esr release based on firefox 128

Add a new recipe and keep mozjs-115 as its still supported and used by po=
lkit

- Remove two backported patches
- Remove a (hopefully) unneeded patches for musl (build for qemuarm/musl =
succeeded)
- Add dependency for cbindgen-native

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...001-Cargo.toml-do-not-abort-on-panic.patch |  31 ++++++
 ...with-icu-uc-to-fix-build-with-ICU-76.patch |  27 +++++
 .../0001-add-arm-to-list-of-mozinline.patch   |  31 ++++++
 ...-autoconf-s-config.sub-to-canonicali.patch |  44 ++++++++
 ...rewrite-cargo-host-linker-in-python3.patch |  53 +++++++++
 ...ix-one-occasionally-reproduced-confi.patch |  47 ++++++++
 ...nfigure-do-not-look-for-llvm-objdump.patch |  43 ++++++++
 ...o-not-try-to-find-a-suitable-upstrea.patch |  65 +++++++++++
 .../mozjs-128/0004-use-asm-sgidefs.h.patch    |  37 +++++++
 .../mozjs/mozjs-128/armv5.patch               |  28 +++++
 .../mozjs-128/musl-disable-stackwalk.patch    |  27 +++++
 .../mozjs/mozjs-128/riscv32.patch             |  59 ++++++++++
 .../mozjs/mozjs-128_128.5.2.bb                | 102 ++++++++++++++++++
 13 files changed, 594 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.t=
oml-do-not-abort-on-panic.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-wi=
th-icu-uc-to-fix-build-with-ICU-76.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm=
-to-list-of-mozinline.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-build-d=
o-not-use-autoconf-s-config.sub-to-canonicali.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite=
-cargo-host-linker-in-python3.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.co=
nfigure-fix-one-occasionally-reproduced-confi.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.con=
figure-do-not-look-for-llvm-objdump.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.co=
nfigure-do-not-try-to-find-a-suitable-upstrea.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm=
-sgidefs.h.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable=
-stackwalk.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patc=
h
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-=
not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-=
Cargo.toml-do-not-abort-on-panic.patch
new file mode 100644
index 0000000000..97a4439628
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-not-abo=
rt-on-panic.patch
@@ -0,0 +1,31 @@
+From ddd23f8547f3a56aa542924aa400d3535f734bff Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 1 Oct 2021 13:00:24 +0200
+Subject: [PATCH] Cargo.toml: do not abort on panic
+
+OE's rust is configured to unwind, and this setting clashes with it/
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ Cargo.toml | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index a4248187be..eed8964b3a 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -67,13 +67,11 @@ opt-level =3D 1
+ rpath =3D false
+ lto =3D false
+ debug-assertions =3D true
+-panic =3D "abort"
+=20
+ [profile.release]
+ opt-level =3D 2
+ rpath =3D false
+ debug-assertions =3D false
+-panic =3D "abort"
+=20
+ # Optimize build dependencies, because bindgen and proc macros / style
+ # compilation take more to run than to build otherwise.
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-=
uc-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-=
128/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
new file mode 100644
index 0000000000..4fb7a28eeb
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-f=
ix-build-with-ICU-76.patch
@@ -0,0 +1,27 @@
+From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 23 Nov 2024 13:28:33 -0800
+Subject: [PATCH] Link with icu-uc to fix build with ICU-76
+
+Fixes
+https://bugzilla.mozilla.org/show_bug.cgi?id=3D1927380
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ js/moz.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/moz.configure b/js/moz.configure
+index 593b93acee..2181dca34b 100644
+--- a/js/moz.configure
++++ b/js/moz.configure
+@@ -1305,7 +1305,7 @@ def enable_system_icu_option(enable_system_icu):
+     return enable_system_icu
+=20
+=20
+-system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1", when=3D=
"--with-system-icu")
++system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1 icu-uc"=
, when=3D"--with-system-icu")
+=20
+=20
+ @depends(enable_system_icu_option)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-lis=
t-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-=
arm-to-list-of-mozinline.patch
new file mode 100644
index 0000000000..960b4593c2
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list-of-mo=
zinline.patch
@@ -0,0 +1,31 @@
+From 2d1fb35bd81acadc12cc077de86361ac59cee2f1 Mon Sep 17 00:00:00 2001
+From: Kai Kang <kai.kang@windriver.com>
+Date: Fri, 22 Sep 2023 22:59:59 +0000
+Subject: [PATCH] Backport patch from firefox bugzilla to fix compile err=
or for
+ qemuarm with some armv7ve tunes such as 'armv7vethf' and 'armv7vet-vfpv=
3d16':
+
+| /path/to/build/tmp/work/armv7vet2hf-vfp-poky-linux-gnueabi/mozjs-102/1=
02.5.0-r0/build/js/src/jit/AtomicOperationsGenerated.h:240:17:
+  error: 'asm' operand has impossible constraints
+|  240 |                 asm volatile (
+|      |                 ^~~
+
+Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=
=3D1761665]
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+---
+ js/src/jit/GenerateAtomicOperations.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/jit/GenerateAtomicOperations.py b/js/src/jit/Generat=
eAtomicOperations.py
+index 9194b8b685..145563bb37 100644
+--- a/js/src/jit/GenerateAtomicOperations.py
++++ b/js/src/jit/GenerateAtomicOperations.py
+@@ -850,7 +850,7 @@ def generate_atomics_header(c_out):
+=20
+         # Work around a GCC issue on 32-bit x86 by adding MOZ_NEVER_INL=
INE.
+         # See bug 1756347.
+-        if is_gcc and cpu_arch =3D=3D "x86":
++        if is_gcc and cpu_arch in ("x86", "arm"):
+             contents =3D contents.replace("INLINE_ATTR", "MOZ_NEVER_INL=
INE inline")
+         else:
+             contents =3D contents.replace("INLINE_ATTR", "inline")
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-build-do-not-u=
se-autoconf-s-config.sub-to-canonicali.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-128/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.=
patch
new file mode 100644
index 0000000000..38496ea56c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-build-do-not-use-auto=
conf-s-config.sub-to-canonicali.patch
@@ -0,0 +1,44 @@
+From c860dcbe63b0e393c95bfb0131238f91aaac11d3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Thu, 7 Oct 2021 12:44:18 +0200
+Subject: [PATCH] build: do not use autoconf's config.sub to 'canonicaliz=
e'
+ names
+
+The outcome is that processed names no longer match our custom rust
+target definitions, and the build fails.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ build/moz.configure/init.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -647,24 +647,7 @@ def help_host_target(help, host, target)
+=20
+ def config_sub(shell, triplet):
+     config_sub =3D os.path.join(os.path.dirname(__file__), "..", "autoc=
onf", "config.sub")
+-    # Config.sub doesn't like the *-windows-msvc/*-windows-gnu triplets=
, so
+-    # munge those before and after calling config.sub.
+-    suffix =3D None
+-    munging =3D {
+-        "-windows-msvc": "-mingw32",
+-        "-windows-gnu": "-mingw32",
+-    }
+-    for check_suffix, replacement in munging.items():
+-        if triplet.endswith(check_suffix):
+-            suffix =3D check_suffix
+-            triplet =3D triplet[: -len(suffix)] + replacement
+-            break
+-    result =3D check_cmd_output(shell, config_sub, triplet).strip()
+-    if suffix:
+-        assert result.endswith(replacement)
+-        result =3D result[: -len(replacement)] + suffix
+-    return result
+-
++    return triplet
+=20
+ @depends("--host", shell)
+ @checking("for host system type", lambda h: h.alias)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-=
host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0=
001-rewrite-cargo-host-linker-in-python3.patch
new file mode 100644
index 0000000000..94e1651b33
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-li=
nker-in-python3.patch
@@ -0,0 +1,53 @@
+From 6f6b78628a8edc834aa147c87ebce3eb8e670e7a Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 18 Nov 2021 07:16:39 +0000
+Subject: [PATCH] Rewrite cargo-host-linker in python3
+
+Mozjs compile failed with this failure:
+/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by /=
build/tmp-glibc/work/corei7-64-wrs-linux/mozjs/91.1.0-r0/recipe-sysroot-n=
ative/usr/lib/libtinfo.so.5)
+
+Root Cause:
+cargo-host-linker has /bin/sh as it's interpreter, but cargo run the cmd
+with LD_LIBRARY_PATH set to recipe-sysroot-native. The host /bin/sh link=
s
+libtinfo.so.5 under recipe-sysroot-native, which needs higher libc. But
+host libc is older libc. So the incompatible problem occurred.
+
+Solution:
+rewrite cargo-host-linker in python3
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ build/cargo-host-linker | 24 +++++++++++++++++++++---
+ 1 file changed, 21 insertions(+), 3 deletions(-)
+
+diff --git a/build/cargo-host-linker b/build/cargo-host-linker
+index cbd0472bf7..87d43ce9ec 100755
+--- a/build/cargo-host-linker
++++ b/build/cargo-host-linker
+@@ -1,3 +1,21 @@
+-#!/bin/sh
+-# See comment in cargo-linker.
+-eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
++#!/usr/bin/env python3
++
++import os,sys
++
++if os.environ['MOZ_CARGO_WRAP_HOST_LD'].strip():
++    binary=3Dos.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]
++else:
++    sys.exit(0)
++
++if os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS'].strip():
++    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
++        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.e=
nviron['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + [os.environ['MOZ_CARGO_WRA=
P_HOST_LDFLAGS']] + sys.argv[1:]
++    else:
++        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + [os.=
environ['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
++else:
++    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
++        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.e=
nviron['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + sys.argv[1:]
++    else:
++        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + sys.=
argv[1:]
++
++os.execvp(binary, args)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure=
-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-128/0001-util.configure-fix-one-occasionally-reproduced-confi.=
patch
new file mode 100644
index 0000000000..d53cc2bd41
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-on=
e-occasionally-reproduced-confi.patch
@@ -0,0 +1,47 @@
+From 683cd23dd269509a1d913adb2b049b84771e0a94 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 11 Nov 2021 16:05:54 +0800
+Subject: [PATCH] util.configure: fix one occasionally reproduced configu=
re
+ failure
+
+error:
+| checking whether the C++ compiler supports -Wno-range-loop-analysis...
+| DEBUG: Creating /tmp/conftest.jr1qrcw3.cpp with content:
+| DEBUG: | int
+| DEBUG: | main(void)
+| DEBUG: | {
+| DEBUG: |
+| DEBUG: | ;
+| DEBUG: | return 0;
+| DEBUG: | }
+| DEBUG: Executing: aarch64-wrs-linux-g++ -mcpu=3Dcortex-a53 -march=3Dar=
mv8-a+crc -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wf=
ormat-security -Werror=3Dformat-security --sysroot=3D/mozjs/91.1.0-r0/rec=
ipe-sysroot /tmp/conftest.jr1qrcw3.cpp -Werror -Wrange-loop-analysis -c
+| DEBUG: The command returned non-zero exit status 1.
+| DEBUG: Its error output was:
+...
+| File "/mozjs/91.1.0-r0/firefox-91.1.0/build/moz.configure/util.configu=
re", line 239, in try_invoke_compiler
+| os.remove(path)
+| FileNotFoundError: [Errno 2] No such file or directory: '/tmp/conftest=
.jr1qrcw3.cpp'
+
+It should be another process that deleted this file by using
+"rm -rf conftest*" inappropriately
+
+Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=
=3D1740667]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ build/moz.configure/util.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/moz.configure/util.configure b/build/moz.configure/ut=
il.configure
+index d93b91fcdd..47ab8b92b9 100644
+--- a/build/moz.configure/util.configure
++++ b/build/moz.configure/util.configure
+@@ -256,7 +256,7 @@ def try_invoke_compiler(
+         "C++": ".cpp",
+     }[language]
+=20
+-    fd, path =3D mkstemp(prefix=3D"conftest.", suffix=3Dsuffix, text=3D=
True)
++    fd, path =3D mkstemp(prefix=3D"try_invoke_compiler_conftest.", suff=
ix=3Dsuffix, text=3DTrue)
+     try:
+         source =3D source.encode("ascii", "replace")
+=20
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-=
do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs=
-128/0002-moz.configure-do-not-look-for-llvm-objdump.patch
new file mode 100644
index 0000000000..9a82acf77b
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-=
look-for-llvm-objdump.patch
@@ -0,0 +1,43 @@
+From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 1 Oct 2021 13:01:10 +0200
+Subject: [PATCH] moz.configure: do not look for llvm-objdump
+
+This avoid dragging in a dependency that isn't even needed
+for js builds.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ moz.configure | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/moz.configure b/moz.configure
+index 804b9a375a..402e79e3b3 100755
+--- a/moz.configure
++++ b/moz.configure
+@@ -390,15 +390,15 @@ def plain_llvm_or_prefixed(name, llvm_name=3DNone)=
:
+     return plain_llvm_or_prefixed
+=20
+=20
+-llvm_objdump =3D check_prog(
+-    "LLVM_OBJDUMP",
+-    llvm_tool("llvm-objdump"),
+-    what=3D"llvm-objdump",
+-    when=3D"--enable-compile-environment",
+-    paths=3Dclang_search_path,
+-)
+-
+-add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
++#llvm_objdump =3D check_prog(
++#    "LLVM_OBJDUMP",
++#    llvm_tool("llvm-objdump"),
++#    what=3D"llvm-objdump",
++#    when=3D"--enable-compile-environment",
++#    paths=3Dclang_search_path,
++#)
++#
++#add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
+=20
+=20
+ def validate_readelf(path):
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure=
-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-128/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.=
patch
new file mode 100644
index 0000000000..40025fbc68
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-do-not=
-try-to-find-a-suitable-upstrea.patch
@@ -0,0 +1,65 @@
+From 2d7f06cdf631e4d4d94e9d8e33a953dc57672750 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 1 Oct 2021 13:02:17 +0200
+Subject: [PATCH] rust.configure: do not try to find a suitable upstream =
target
+
+OE is using custom targets and so this is bound to fail.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+---
+ build/moz.configure/rust.configure | 34 ++----------------------------
+ 1 file changed, 2 insertions(+), 32 deletions(-)
+
+diff --git a/build/moz.configure/rust.configure b/build/moz.configure/ru=
st.configure
+index acac34ec05..ff3b8fc0fd 100644
+--- a/build/moz.configure/rust.configure
++++ b/build/moz.configure/rust.configure
+@@ -486,33 +486,7 @@ def assert_rust_compile(host_or_target, rustc_targe=
t, rustc):
+ def rust_host_triple(
+     rustc, host, compiler_info, rustc_host, rust_supported_targets, arm=
_target
+ ):
+-    rustc_target =3D detect_rustc_target(
+-        host, compiler_info, arm_target, rust_supported_targets
+-    )
+-    if rustc_target !=3D rustc_host:
+-        if host.alias =3D=3D rustc_target:
+-            configure_host =3D host.alias
+-        else:
+-            configure_host =3D "{}/{}".format(host.alias, rustc_target)
+-        die(
+-            dedent(
+-                """\
+-        The rust compiler host ({rustc}) is not suitable for the config=
ure host ({configure}).
+-
+-        You can solve this by:
+-        * Set your configure host to match the rust compiler host by ed=
iting your
+-        mozconfig and adding "ac_add_options --host=3D{rustc}".
+-        * Or, install the rust toolchain for {configure}, if supported,=
 by running
+-        "rustup default stable-{rustc_target}"
+-        """.format(
+-                    rustc=3Drustc_host,
+-                    configure=3Dconfigure_host,
+-                    rustc_target=3Drustc_target,
+-                )
+-            )
+-        )
+-    assert_rust_compile(host, rustc_target, rustc)
+-    return rustc_target
++    return rustc_host
+=20
+=20
+ @depends(
+@@ -522,11 +496,7 @@ def rust_host_triple(
+ def rust_target_triple(
+     rustc, target, compiler_info, rust_supported_targets, arm_target
+ ):
+-    rustc_target =3D detect_rustc_target(
+-        target, compiler_info, arm_target, rust_supported_targets
+-    )
+-    assert_rust_compile(target, rustc_target, rustc)
+-    return rustc_target
++    return target.alias
+=20
+=20
+ set_config("RUST_TARGET", rust_target_triple)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidef=
s.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs=
.h.patch
new file mode 100644
index 0000000000..eb3ff452b3
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs.h.pat=
ch
@@ -0,0 +1,37 @@
+From 1691939a22ec12245f008993e0b9a1b1dfb91e9c Mon Sep 17 00:00:00 2001
+From: Andre McCurdy <amccurdy@gmail.com>
+Date: Sat, 30 Apr 2016 15:29:06 -0700
+Subject: [PATCH] use <asm/sgidefs.h>
+
+Build fix for MIPS with musl libc
+
+The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
+but not by musl. Regardless of the libc, the kernel headers provide
+<asm/sgidefs.h> which provides the same definitions, so use that
+instead.
+
+Upstream-Status: Pending
+
+[Vincent:
+Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=3D21070]
+
+Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
+---
+ mfbt/RandomNum.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mfbt/RandomNum.cpp b/mfbt/RandomNum.cpp
+index 96de5d4055..2cfb2e10ee 100644
+--- a/mfbt/RandomNum.cpp
++++ b/mfbt/RandomNum.cpp
+@@ -53,7 +53,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PVOID RandomBuff=
er,
+ #  elif defined(__s390__)
+ #    define GETRANDOM_NR 349
+ #  elif defined(__mips__)
+-#    include <sgidefs.h>
++#    include <asm/sgidefs.h>
+ #    if _MIPS_SIM =3D=3D _MIPS_SIM_ABI32
+ #      define GETRANDOM_NR 4353
+ #    elif _MIPS_SIM =3D=3D _MIPS_SIM_ABI64
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch b/meta-=
oe/recipes-extended/mozjs/mozjs-128/armv5.patch
new file mode 100644
index 0000000000..564f423fb4
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
@@ -0,0 +1,28 @@
+From 0dd6fdbf6a821898617f1bd8e57123be048c07f5 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Mon, 16 Dec 2024 05:49:57 +0000
+Subject: [PATCH] The ISB instruction isn't available in ARMv5 or v6, so =
guard
+ it's use to fix the build on qemuarmv5.
+
+Upstream-Status: Pending
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ js/src/jit/arm/Architecture-arm.cpp | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/js/src/jit/arm/Architecture-arm.cpp b/js/src/jit/arm/Archit=
ecture-arm.cpp
+index d4c5026705..fc0455eaff 100644
+--- a/js/src/jit/arm/Architecture-arm.cpp
++++ b/js/src/jit/arm/Architecture-arm.cpp
+@@ -528,9 +528,11 @@ void FlushICache(void* code, size_t size) {
+=20
+ void FlushExecutionContext() {
+ #ifndef JS_SIMULATOR_ARM
++#if __ARM_ARCH >=3D 7
+   // Ensure that any instructions already in the pipeline are discarded=
 and
+   // reloaded from the icache.
+   asm volatile("isb\n" : : : "memory");
++#endif
+ #else
+   // We assume the icache flushing routines on other platforms take car=
e of this
+ #endif
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackw=
alk.patch b/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwa=
lk.patch
new file mode 100644
index 0000000000..3d5452ce4d
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwalk.pat=
ch
@@ -0,0 +1,27 @@
+From d96e9a40e9da9163e0a4b3475178fe30c26deb19 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 Sep 2023 22:59:56 +0000
+Subject: [PATCH] Musl does not have stack unwinder like glibc therefore =
we can
+
+ not assume that its always available on musl, we do need to check for t=
arget
+ environment as well which could be musl or glibc.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mozglue/misc/StackWalk.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.cpp
+index 18fd3464b0..d3d9208fdb 100644
+--- a/mozglue/misc/StackWalk.cpp
++++ b/mozglue/misc/StackWalk.cpp
+@@ -50,7 +50,7 @@ using namespace mozilla;
+ #  define HAVE___LIBC_STACK_END 0
+ #endif
+=20
+-#if (defined(linux) &&                                            \
++#if (defined(linux) && defined(__GLIBC__) &&                      \
+      ((defined(__GNUC__) && (defined(__i386) || defined(PPC))) || \
+       defined(HAVE__UNWIND_BACKTRACE)) &&                         \
+      (HAVE___LIBC_STACK_END || ANDROID))
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch b/met=
a-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
new file mode 100644
index 0000000000..67e23c5fcc
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
@@ -0,0 +1,59 @@
+From 0cc41bc953974d4852b263708bf8d12f823ca8ad Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 24 Oct 2021 22:32:50 -0700
+Subject: [PATCH] Add RISCV32 support
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ build/moz.configure/init.configure                             | 3 +++
+ python/mozbuild/mozbuild/configure/constants.py                | 2 ++
+ .../mozbuild/test/configure/test_toolchain_configure.py        | 1 +
+ 3 files changed, 6 insertions(+)
+
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/in=
it.configure
+index 97b9bab167..d9a5a2035d 100644
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -594,6 +594,9 @@ def split_triplet(triplet, allow_wasi=3DFalse):
+     elif cpu.startswith("aarch64"):
+         canonical_cpu =3D "aarch64"
+         endianness =3D "little"
++    elif cpu in ("riscv32", "riscv32gc"):
++        canonical_cpu =3D "riscv32"
++        endianness =3D "little"
+     elif cpu in ("riscv64", "riscv64gc"):
+         canonical_cpu =3D "riscv64"
+         endianness =3D "little"
+diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mo=
zbuild/mozbuild/configure/constants.py
+index 25f43bb9f8..3335e69405 100644
+--- a/python/mozbuild/mozbuild/configure/constants.py
++++ b/python/mozbuild/mozbuild/configure/constants.py
+@@ -73,6 +73,7 @@ CPU_bitness =3D {
+     "mips64": 64,
+     "ppc": 32,
+     "ppc64": 64,
++    'riscv32': 32,
+     "riscv64": 64,
+     "s390": 32,
+     "s390x": 64,
+@@ -129,6 +130,7 @@ CPU_preprocessor_checks =3D OrderedDict(
+         ("m68k", "__m68k__"),
+         ("mips64", "__mips64"),
+         ("mips32", "__mips__"),
++        ("riscv32", "__riscv && __riscv_xlen =3D=3D 32"),
+         ("riscv64", "__riscv && __riscv_xlen =3D=3D 64"),
+         ("loongarch64", "__loongarch64"),
+         ("sh4", "__sh__"),
+diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_conf=
igure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configu=
re.py
+index d438b68eb8..1be0d02e54 100644
+--- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
++++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
+@@ -1325,6 +1325,7 @@ class LinuxCrossCompileToolchainTest(BaseToolchain=
Test):
+         "m68k-unknown-linux-gnu": big_endian + {"__m68k__": 1},
+         "mips64-unknown-linux-gnuabi64": big_endian + {"__mips64": 1, "=
__mips__": 1},
+         "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
++        "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "__=
riscv_xlen": 32},
+         "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "__=
riscv_xlen": 64},
+         "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
+     }
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-128_128.5.2.bb
new file mode 100644
index 0000000000..0fbf3d43f9
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
@@ -0,0 +1,102 @@
+SUMMARY =3D "SpiderMonkey is Mozilla's JavaScript engine written in C/C+=
+"
+HOMEPAGE =3D "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/=
SpiderMonkey"
+LICENSE =3D "MPL-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc9b6ecd19a14a54a628edaaf2373=
3bf"
+
+SRC_URI =3D "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/s=
ource/firefox-${PV}esr.source.tar.xz \
+           file://0001-Cargo.toml-do-not-abort-on-panic.patch \
+           file://0002-moz.configure-do-not-look-for-llvm-objdump.patch =
\
+           file://0003-rust.configure-do-not-try-to-find-a-suitable-upst=
rea.patch \
+           file://0004-use-asm-sgidefs.h.patch \
+           file://riscv32.patch \
+           file://0001-util.configure-fix-one-occasionally-reproduced-co=
nfi.patch \
+           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
+           file://musl-disable-stackwalk.patch \
+           file://0001-add-arm-to-list-of-mozinline.patch \
+           file://armv5.patch \
+           file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
+           "
+SRC_URI[sha256sum] =3D "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef49=
5d4997154d68358f"
+
+UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs128"
+UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
+
+S =3D "${WORKDIR}/firefox-${PV}"
+
+inherit pkgconfig perlnative python3native rust
+
+DEPENDS +=3D "zlib cbindgen-native python3 icu"
+DEPENDS:remove:mipsarch =3D "icu"
+DEPENDS:remove:powerpc:toolchain-clang =3D "icu"
+
+B =3D "${WORKDIR}/build"
+
+export PYTHONPATH =3D "${S}/build:\
+${S}/third_party/python/PyYAML/lib3:\
+${S}/testing/mozbase/mozfile:\
+${S}/python/mozboot:\
+${S}/third_party/python/distro:\
+${S}/testing/mozbase/mozinfo:\
+${S}/config:\
+${S}/testing/mozbase/manifestparser:\
+${S}/third_party/python/pytoml:\
+${S}/testing/mozbase/mozprocess:\
+${S}/third_party/python/six:\
+${S}/python/mozbuild:\
+${S}/python/mozbuild/mozbuild:\
+${S}/python/mach:\
+${S}/third_party/python/jsmin:\
+${S}/python/mozversioncontrol"
+
+export HOST_CC =3D "${BUILD_CC}"
+export HOST_CXX =3D "${BUILD_CXX}"
+export HOST_CFLAGS =3D "${BUILD_CFLAGS}"
+export HOST_CPPFLAGS =3D "${BUILD_CPPFLAGS}"
+export HOST_CXXFLAGS =3D "${BUILD_CXXFLAGS}"
+
+export AS =3D "${CC}"
+
+export RUSTFLAGS
+
+JIT ?=3D ""
+JIT:mipsarch =3D "--disable-jit"
+ICU ?=3D "--with-system-icu"
+ICU:mipsarch =3D ""
+ICU:powerpc:toolchain-clang =3D ""
+
+LDFLAGS:append:riscv32 =3D " -latomic"
+
+do_configure() {
+    cd ${B}
+    python3 ${S}/configure.py \
+        --enable-project=3Djs \
+        --target=3D${RUST_HOST_SYS} \
+        --host=3D${BUILD_SYS} \
+        --prefix=3D${prefix} \
+        --libdir=3D${libdir} \
+        --disable-jemalloc \
+        --disable-strip \
+        ${JIT} \
+        ${ICU}
+}
+do_configure[cleandirs] +=3D "${B}"
+
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' install
+}
+
+inherit multilib_script multilib_header
+
+MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 1)}"
+MULTILIB_SCRIPTS +=3D "${PN}-dev:${bindir}/js${MAJ_VER}-config"
+
+do_install:append() {
+    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
+    sed -e 's@${STAGING_DIR_HOST}@@g' \
+        -i ${D}${bindir}/js${MAJ_VER}-config
+    rm -f ${D}${libdir}/libjs_static.ajs
+}
+
+PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
+PACKAGES =3D+ "lib${BPN}"
+FILES:lib${BPN} +=3D "${libdir}/lib*"
--=20
2.47.1


