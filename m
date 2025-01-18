Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B567C02185
	for <webhook@archiver.kernel.org>; Sat, 18 Jan 2025 07:46:51 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.7163.1737186409563733609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 17 Jan 2025 23:46:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout05.t-online.de (Postfix) with SMTP id 583F7535
	for <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 08:46:47 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.162.124]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tZ3Xa-0J17iL0; Sat, 18 Jan 2025 08:46:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mozjs-115: remove recipe
Date: Sat, 18 Jan 2025 08:47:12 +0100
Message-ID: <20250118074712.588929-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1737186406-5EFF2956-257C1DE1/10/3626336762 SUSPECT URL
X-TOI-MSGID: 7238cf3f-4a8d-4751-a1de-d90474e7797a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 18 Jan 2025 07:46:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114948

polkit was the only consumer and switched to ducktape

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/conf/include/non-repro-meta-oe.inc    |   1 -
 ...001-Cargo.toml-do-not-abort-on-panic.patch |  32 ------
 ...with-icu-uc-to-fix-build-with-ICU-76.patch |  27 -----
 .../0001-add-arm-to-list-of-mozinline.patch   |  32 ------
 ...-autoconf-s-config.sub-to-canonicali.patch |  44 --------
 ...rewrite-cargo-host-linker-in-python3.patch |  54 ---------
 ...ix-one-occasionally-reproduced-confi.patch |  48 --------
 ...nfigure-do-not-look-for-llvm-objdump.patch |  44 --------
 ...o-not-try-to-find-a-suitable-upstrea.patch |  66 -----------
 .../mozjs-115/0004-use-asm-sgidefs.h.patch    |  38 -------
 .../mozjs/mozjs-115/1849070.patch             |  36 ------
 .../mozjs/mozjs-115/1894423.patch             |  30 -----
 .../mozjs/mozjs-115/armv5.patch               |  19 ----
 .../mozjs/mozjs-115/fix-musl-build.patch      |  29 -----
 .../mozjs-115/musl-disable-stackwalk.patch    |  27 -----
 .../mozjs/mozjs-115/riscv32.patch             |  60 ----------
 .../mozjs/mozjs-115_115.17.0.bb               | 106 ------------------
 17 files changed, 693 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-Cargo.t=
oml-do-not-abort-on-panic.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-Link-wi=
th-icu-uc-to-fix-build-with-ICU-76.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-add-arm=
-to-list-of-mozinline.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-d=
o-not-use-autoconf-s-config.sub-to-canonicali.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-rewrite=
-cargo-host-linker-in-python3.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-util.co=
nfigure-fix-one-occasionally-reproduced-confi.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0002-moz.con=
figure-do-not-look-for-llvm-objdump.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0003-rust.co=
nfigure-do-not-try-to-find-a-suitable-upstrea.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0004-use-asm=
-sgidefs.h.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/1849070.patc=
h
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/1894423.patc=
h
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-bui=
ld.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/musl-disable=
-stackwalk.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/riscv32.patc=
h
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115_115.17.0.bb

diff --git a/meta-oe/conf/include/non-repro-meta-oe.inc b/meta-oe/conf/in=
clude/non-repro-meta-oe.inc
index 3441cb119a..5575b12c33 100755
--- a/meta-oe/conf/include/non-repro-meta-oe.inc
+++ b/meta-oe/conf/include/non-repro-meta-oe.inc
@@ -67,7 +67,6 @@ KNOWN_NON_REPRO_META_OE =3D " \
     minifi-cpp \
     minifi-cpp-dbg \
     minifi-cpp-src \
-    mozjs-115-src \
     mpv \
     mpv-dbg \
     nana \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Cargo.toml-do-=
not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-=
Cargo.toml-do-not-abort-on-panic.patch
deleted file mode 100644
index e8dfdea1e9..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Cargo.toml-do-not-abo=
rt-on-panic.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From f501f7c02df4f0ff5d5f100d9eeb74cd4d12ea3d Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 1 Oct 2021 13:00:24 +0200
-Subject: [PATCH] Cargo.toml: do not abort on panic
-
-OE's rust is configured to unwind, and this setting clashes with it/
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- Cargo.toml | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/Cargo.toml b/Cargo.toml
-index a2718b2f35..4e231c30e8 100644
---- a/Cargo.toml
-+++ b/Cargo.toml
-@@ -59,13 +59,11 @@ opt-level =3D 1
- rpath =3D false
- lto =3D false
- debug-assertions =3D true
--panic =3D "abort"
-=20
- [profile.release]
- opt-level =3D 2
- rpath =3D false
- debug-assertions =3D false
--panic =3D "abort"
-=20
- # Optimize build dependencies, because bindgen and proc macros / style
- # compilation take more to run than to build otherwise.
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Link-with-icu-=
uc-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-=
115/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
deleted file mode 100644
index 8b1fee2cae..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Link-with-icu-uc-to-f=
ix-build-with-ICU-76.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 3b75498f523ce6e41662ec79ff7180def6af8a99 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 23 Nov 2024 13:28:33 -0800
-Subject: [PATCH] Link with icu-uc to fix build with ICU-76
-
-Fixes
-https://bugzilla.mozilla.org/show_bug.cgi?id=3D1927380
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- js/moz.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/js/moz.configure b/js/moz.configure
-index af11416ec2..2b305bc8dd 100644
---- a/js/moz.configure
-+++ b/js/moz.configure
-@@ -1104,7 +1104,7 @@ set_define(
- # =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
- system_lib_option("--with-system-icu", help=3D"Use system ICU")
-=20
--system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1", when=3D=
"--with-system-icu")
-+system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1 icu-uc"=
, when=3D"--with-system-icu")
-=20
-=20
- @depends("--with-system-icu")
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-add-arm-to-lis=
t-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-add-=
arm-to-list-of-mozinline.patch
deleted file mode 100644
index 83187861c7..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-add-arm-to-list-of-mo=
zinline.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From c5cfb8aa591afd5ad3aedc58fe7f410e89013605 Mon Sep 17 00:00:00 2001
-From: Kai Kang <kai.kang@windriver.com>
-Date: Fri, 22 Sep 2023 22:59:59 +0000
-Subject: [PATCH] Backport patch from firefox bugzilla to fix compile err=
or for
- qemuarm with some armv7ve tunes such as 'armv7vethf' and 'armv7vet-vfpv=
3d16':
-
-| /path/to/build/tmp/work/armv7vet2hf-vfp-poky-linux-gnueabi/mozjs-102/1=
02.5.0-r0/build/js/src/jit/AtomicOperationsGenerated.h:240:17:
-  error: 'asm' operand has impossible constraints
-|  240 |                 asm volatile (
-|      |                 ^~~
-
-Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=
=3D1761665]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
----
- js/src/jit/GenerateAtomicOperations.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/js/src/jit/GenerateAtomicOperations.py b/js/src/jit/Generat=
eAtomicOperations.py
-index 24b5a191cf..e41948c5af 100644
---- a/js/src/jit/GenerateAtomicOperations.py
-+++ b/js/src/jit/GenerateAtomicOperations.py
-@@ -860,7 +860,7 @@ def generate_atomics_header(c_out):
-=20
-         # Work around a GCC issue on 32-bit x86 by adding MOZ_NEVER_INL=
INE.
-         # See bug 1756347.
--        if is_gcc and cpu_arch =3D=3D "x86":
-+        if is_gcc and cpu_arch in ("x86", "arm"):
-             contents =3D contents.replace("INLINE_ATTR", "MOZ_NEVER_INL=
INE inline")
-         else:
-             contents =3D contents.replace("INLINE_ATTR", "inline")
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-do-not-u=
se-autoconf-s-config.sub-to-canonicali.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-115/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.=
patch
deleted file mode 100644
index 38496ea56c..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-do-not-use-auto=
conf-s-config.sub-to-canonicali.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From c860dcbe63b0e393c95bfb0131238f91aaac11d3 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Thu, 7 Oct 2021 12:44:18 +0200
-Subject: [PATCH] build: do not use autoconf's config.sub to 'canonicaliz=
e'
- names
-
-The outcome is that processed names no longer match our custom rust
-target definitions, and the build fails.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- build/moz.configure/init.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/build/moz.configure/init.configure
-+++ b/build/moz.configure/init.configure
-@@ -647,24 +647,7 @@ def help_host_target(help, host, target)
-=20
- def config_sub(shell, triplet):
-     config_sub =3D os.path.join(os.path.dirname(__file__), "..", "autoc=
onf", "config.sub")
--    # Config.sub doesn't like the *-windows-msvc/*-windows-gnu triplets=
, so
--    # munge those before and after calling config.sub.
--    suffix =3D None
--    munging =3D {
--        "-windows-msvc": "-mingw32",
--        "-windows-gnu": "-mingw32",
--    }
--    for check_suffix, replacement in munging.items():
--        if triplet.endswith(check_suffix):
--            suffix =3D check_suffix
--            triplet =3D triplet[: -len(suffix)] + replacement
--            break
--    result =3D check_cmd_output(shell, config_sub, triplet).strip()
--    if suffix:
--        assert result.endswith(replacement)
--        result =3D result[: -len(replacement)] + suffix
--    return result
--
-+    return triplet
-=20
- @depends("--host", shell)
- @checking("for host system type", lambda h: h.alias)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-rewrite-cargo-=
host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0=
001-rewrite-cargo-host-linker-in-python3.patch
deleted file mode 100644
index 83f384e6c2..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-rewrite-cargo-host-li=
nker-in-python3.patch
+++ /dev/null
@@ -1,54 +0,0 @@
-From c6a84863454b882695058187cd282987613474ef Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 18 Nov 2021 07:16:39 +0000
-Subject: [PATCH] Rewrite cargo-host-linker in python3
-
-Mozjs compile failed with this failure:
-/bin/sh: /lib64/libc.so.6: version `GLIBC_2.33' not found (required by /=
build/tmp-glibc/work/corei7-64-wrs-linux/mozjs/91.1.0-r0/recipe-sysroot-n=
ative/usr/lib/libtinfo.so.5)
-
-Root Cause:
-cargo-host-linker has /bin/sh as it's interpreter, but cargo run the cmd
-with LD_LIBRARY_PATH set to recipe-sysroot-native. The host /bin/sh link=
s
-libtinfo.so.5 under recipe-sysroot-native, which needs higher libc. But
-host libc is older libc. So the incompatible problem occurred.
-
-Solution:
-rewrite cargo-host-linker in python3
-
-Upstream-Status: Inappropriate [oe specific]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- build/cargo-host-linker | 24 +++++++++++++++++++++---
- 1 file changed, 21 insertions(+), 3 deletions(-)
-
-diff --git a/build/cargo-host-linker b/build/cargo-host-linker
-index cbd0472bf7..87d43ce9ec 100755
---- a/build/cargo-host-linker
-+++ b/build/cargo-host-linker
-@@ -1,3 +1,21 @@
--#!/bin/sh
--# See comment in cargo-linker.
--eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
-+#!/usr/bin/env python3
-+
-+import os,sys
-+
-+if os.environ['MOZ_CARGO_WRAP_HOST_LD'].strip():
-+    binary=3Dos.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]
-+else:
-+    sys.exit(0)
-+
-+if os.environ['MOZ_CARGO_WRAP_HOST_LDFLAGS'].strip():
-+    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
-+        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.e=
nviron['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + [os.environ['MOZ_CARGO_WRA=
P_HOST_LDFLAGS']] + sys.argv[1:]
-+    else:
-+        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + [os.=
environ['MOZ_CARGO_WRAP_HOST_LDFLAGS']] + sys.argv[1:]
-+else:
-+    if os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[1:]:
-+        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + os.e=
nviron['MOZ_CARGO_WRAP_HOST_LD'].split()[1:] + sys.argv[1:]
-+    else:
-+        args=3D[os.environ['MOZ_CARGO_WRAP_HOST_LD'].split()[0]] + sys.=
argv[1:]
-+
-+os.execvp(binary, args)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-util.configure=
-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-115/0001-util.configure-fix-one-occasionally-reproduced-confi.=
patch
deleted file mode 100644
index 4921a9028c..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-util.configure-fix-on=
e-occasionally-reproduced-confi.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 0d28cd65efe14022e1d645db71dec74f11ab2ae8 Mon Sep 17 00:00:00 2001
-From: Changqing Li <changqing.li@windriver.com>
-Date: Thu, 11 Nov 2021 16:05:54 +0800
-Subject: [PATCH] util.configure: fix one occasionally reproduced configu=
re
- failure
-
-error:
-| checking whether the C++ compiler supports -Wno-range-loop-analysis...
-| DEBUG: Creating /tmp/conftest.jr1qrcw3.cpp with content:
-| DEBUG: | int
-| DEBUG: | main(void)
-| DEBUG: | {
-| DEBUG: |
-| DEBUG: | ;
-| DEBUG: | return 0;
-| DEBUG: | }
-| DEBUG: Executing: aarch64-wrs-linux-g++ -mcpu=3Dcortex-a53 -march=3Dar=
mv8-a+crc -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=3D2 -Wformat -Wf=
ormat-security -Werror=3Dformat-security --sysroot=3D/mozjs/91.1.0-r0/rec=
ipe-sysroot /tmp/conftest.jr1qrcw3.cpp -Werror -Wrange-loop-analysis -c
-| DEBUG: The command returned non-zero exit status 1.
-| DEBUG: Its error output was:
-...
-| File "/mozjs/91.1.0-r0/firefox-91.1.0/build/moz.configure/util.configu=
re", line 239, in try_invoke_compiler
-| os.remove(path)
-| FileNotFoundError: [Errno 2] No such file or directory: '/tmp/conftest=
.jr1qrcw3.cpp'
-
-It should be another process that deleted this file by using
-"rm -rf conftest*" inappropriately
-
-Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=
=3D1740667]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- build/moz.configure/util.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/moz.configure/util.configure b/build/moz.configure/ut=
il.configure
-index f5ff3acd79..44f69deceb 100644
---- a/build/moz.configure/util.configure
-+++ b/build/moz.configure/util.configure
-@@ -254,7 +254,7 @@ def try_invoke_compiler(
-         "C++": ".cpp",
-     }[language]
-=20
--    fd, path =3D mkstemp(prefix=3D"conftest.", suffix=3Dsuffix, text=3D=
True)
-+    fd, path =3D mkstemp(prefix=3D"try_invoke_compiler_conftest.", suff=
ix=3Dsuffix, text=3DTrue)
-     try:
-         source =3D source.encode("ascii", "replace")
-=20
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0002-moz.configure-=
do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs=
-115/0002-moz.configure-do-not-look-for-llvm-objdump.patch
deleted file mode 100644
index 4c69155a68..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0002-moz.configure-do-not-=
look-for-llvm-objdump.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 49cb509abd309e3b74ef4c872ae773f18dabca19 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 1 Oct 2021 13:01:10 +0200
-Subject: [PATCH] moz.configure: do not look for llvm-objdump
-
-This avoid dragging in a dependency that isn't even needed
-for js builds.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- moz.configure | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/moz.configure b/moz.configure
-index 3a9461200d..33b3f49b0c 100755
---- a/moz.configure
-+++ b/moz.configure
-@@ -723,15 +723,15 @@ check_prog(
- )
-=20
-=20
--llvm_objdump =3D check_prog(
--    "LLVM_OBJDUMP",
--    llvm_tool("llvm-objdump"),
--    what=3D"llvm-objdump",
--    when=3D"--enable-compile-environment",
--    paths=3Dclang_search_path,
--)
--
--add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
-+#llvm_objdump =3D check_prog(
-+#    "LLVM_OBJDUMP",
-+#    llvm_tool("llvm-objdump"),
-+#    what=3D"llvm-objdump",
-+#    when=3D"--enable-compile-environment",
-+#    paths=3Dclang_search_path,
-+#)
-+#
-+#add_old_configure_assignment("LLVM_OBJDUMP", llvm_objdump)
-=20
-=20
- def validate_readelf(path):
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0003-rust.configure=
-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-115/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.=
patch
deleted file mode 100644
index 0f9d062205..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0003-rust.configure-do-not=
-try-to-find-a-suitable-upstrea.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-From ac6a3711917ff3f2b64662cbf4681c22a09da403 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 1 Oct 2021 13:02:17 +0200
-Subject: [PATCH] rust.configure: do not try to find a suitable upstream =
target
-
-OE is using custom targets and so this is bound to fail.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
-
----
- build/moz.configure/rust.configure | 34 ++----------------------------
- 1 file changed, 2 insertions(+), 32 deletions(-)
-
-diff --git a/build/moz.configure/rust.configure b/build/moz.configure/ru=
st.configure
-index 7a2fd1ae70..e11f13b253 100644
---- a/build/moz.configure/rust.configure
-+++ b/build/moz.configure/rust.configure
-@@ -486,33 +486,7 @@ def assert_rust_compile(host_or_target, rustc_targe=
t, rustc):
- def rust_host_triple(
-     rustc, host, compiler_info, rustc_host, rust_supported_targets, arm=
_target
- ):
--    rustc_target =3D detect_rustc_target(
--        host, compiler_info, arm_target, rust_supported_targets
--    )
--    if rustc_target !=3D rustc_host:
--        if host.alias =3D=3D rustc_target:
--            configure_host =3D host.alias
--        else:
--            configure_host =3D "{}/{}".format(host.alias, rustc_target)
--        die(
--            dedent(
--                """\
--        The rust compiler host ({rustc}) is not suitable for the config=
ure host ({configure}).
--
--        You can solve this by:
--        * Set your configure host to match the rust compiler host by ed=
iting your
--        mozconfig and adding "ac_add_options --host=3D{rustc}".
--        * Or, install the rust toolchain for {configure}, if supported,=
 by running
--        "rustup default stable-{rustc_target}"
--        """.format(
--                    rustc=3Drustc_host,
--                    configure=3Dconfigure_host,
--                    rustc_target=3Drustc_target,
--                )
--            )
--        )
--    assert_rust_compile(host, rustc_target, rustc)
--    return rustc_target
-+    return rustc_host
-=20
-=20
- @depends(
-@@ -522,11 +496,7 @@ def rust_host_triple(
- def rust_target_triple(
-     rustc, target, compiler_info, rust_supported_targets, arm_target
- ):
--    rustc_target =3D detect_rustc_target(
--        target, compiler_info, arm_target, rust_supported_targets
--    )
--    assert_rust_compile(target, rustc_target, rustc)
--    return rustc_target
-+    return target.alias
-=20
-=20
- set_config("RUST_TARGET", rust_target_triple)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0004-use-asm-sgidef=
s.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0004-use-asm-sgidefs=
.h.patch
deleted file mode 100644
index 6443d46b2c..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/0004-use-asm-sgidefs.h.pat=
ch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 607aa4d822b0e074ae1b2fc16d7c140c3e889680 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <amccurdy@gmail.com>
-Date: Sat, 30 Apr 2016 15:29:06 -0700
-Subject: [PATCH] use <asm/sgidefs.h>
-
-Build fix for MIPS with musl libc
-
-The MIPS specific header <sgidefs.h> is provided by glibc and uclibc
-but not by musl. Regardless of the libc, the kernel headers provide
-<asm/sgidefs.h> which provides the same definitions, so use that
-instead.
-
-Upstream-Status: Pending
-
-[Vincent:
-Taken from: https://sourceware.org/bugzilla/show_bug.cgi?id=3D21070]
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-
----
- mfbt/RandomNum.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mfbt/RandomNum.cpp b/mfbt/RandomNum.cpp
-index 96de5d4055..2cfb2e10ee 100644
---- a/mfbt/RandomNum.cpp
-+++ b/mfbt/RandomNum.cpp
-@@ -53,7 +53,7 @@ extern "C" BOOLEAN NTAPI RtlGenRandom(PVOID RandomBuff=
er,
- #  elif defined(__s390__)
- #    define GETRANDOM_NR 349
- #  elif defined(__mips__)
--#    include <sgidefs.h>
-+#    include <asm/sgidefs.h>
- #    if _MIPS_SIM =3D=3D _MIPS_SIM_ABI32
- #      define GETRANDOM_NR 4353
- #    elif _MIPS_SIM =3D=3D _MIPS_SIM_ABI64
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/1849070.patch b/met=
a-oe/recipes-extended/mozjs/mozjs-115/1849070.patch
deleted file mode 100644
index c19a32690d..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/1849070.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-Bug 1849070 - Avoid using char_traits<unsigned char>. r=3Dspidermonkey-r=
eviewers,anba
-
-It is not guaranteed to exist by the standard, and is actively being
-removed from libc++ in LLVM 18.
-
-Differential Revision: https://phabricator.services.mozilla.com/D186421
-
-Upstream-Status: Backport [https://hg.mozilla.org/mozilla-central/rev/68=
ff4d3f7338248b4d67cf03aade5a73f8d396b2]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/js/src/builtin/intl/Locale.cpp
-+++ b/js/src/builtin/intl/Locale.cpp
-@@ -802,8 +802,10 @@ static inline auto FindUnicodeExtensionT
-                                             UnicodeKey key) {
-   JS::AutoCheckCannotGC nogc;
-   return unicodeExtension->hasLatin1Chars()
--             ? FindUnicodeExtensionType(unicodeExtension->latin1Chars(n=
ogc),
--                                        unicodeExtension->length(), key=
)
-+             ? FindUnicodeExtensionType(
-+                   reinterpret_cast<const char*>(
-+                       unicodeExtension->latin1Chars(nogc)),
-+                   unicodeExtension->length(), key)
-              : FindUnicodeExtensionType(unicodeExtension->twoByteChars(=
nogc),
-                                         unicodeExtension->length(), key=
);
- }
-@@ -920,7 +922,9 @@ static BaseNamePartsResult BaseNameParts
- static inline auto BaseNameParts(JSLinearString* baseName) {
-   JS::AutoCheckCannotGC nogc;
-   return baseName->hasLatin1Chars()
--             ? BaseNameParts(baseName->latin1Chars(nogc), baseName->len=
gth())
-+             ? BaseNameParts(
-+                   reinterpret_cast<const char*>(baseName->latin1Chars(=
nogc)),
-+                   baseName->length())
-              : BaseNameParts(baseName->twoByteChars(nogc), baseName->le=
ngth());
- }
-=20
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/1894423.patch b/met=
a-oe/recipes-extended/mozjs/mozjs-115/1894423.patch
deleted file mode 100644
index 93e0f0f4f9..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/1894423.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-Bug 1894423 - Remove unused ExclusiveData move constructor. r=3Dspidermo=
nkey-reviewers,jonco
-
-Because the constructor is actually not used, the compiler used to not
-complain about it being broken. Recent changes on clang trunk made it
-catch this problem without the constructor being used.
-
-As Mutex doesn't have a move constructor, it's also not only a matter of
-adding the missing underscore to lock.
-
-As the constructor is never used, just remove it.
-
-Differential Revision: https://phabricator.services.mozilla.com/D209108
-
-Upstream-Status: Backport [https://hg.mozilla.org/mozilla-central/rev/22=
3087fdc29f]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
---- a/js/src/threading/ExclusiveData.h
-+++ b/js/src/threading/ExclusiveData.h
-@@ -109,11 +109,6 @@ class ExclusiveData {
-   explicit ExclusiveData(const MutexId& id, Args&&... args)
-       : lock_(id), value_(std::forward<Args>(args)...) {}
-=20
--  ExclusiveData(ExclusiveData&& rhs)
--      : lock_(std::move(rhs.lock)), value_(std::move(rhs.value_)) {
--    MOZ_ASSERT(&rhs !=3D this, "self-move disallowed!");
--  }
--
-   ExclusiveData& operator=3D(ExclusiveData&& rhs) {
-     this->~ExclusiveData();
-     new (mozilla::KnownNotNull, this) ExclusiveData(std::move(rhs));
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch b/meta-=
oe/recipes-extended/mozjs/mozjs-115/armv5.patch
deleted file mode 100644
index 4c45955bca..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/armv5.patch
+++ /dev/null
@@ -1,19 +0,0 @@
-The ISB instruction isn't available in ARMv5 or v6, so
-guard it's use to fix the build on qemuarmv5.
-
-Upstream-Status: Pending
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-diff --git a/js/src/jit/arm/Architecture-arm.cpp b/js/src/jit/arm/Archit=
ecture-arm.cpp
---- a/js/src/jit/arm/Architecture-arm.cpp	2024-01-18 17:31:32.078718197 =
+0000
-+++ b/js/src/jit/arm/Architecture-arm.cpp	2024-01-18 18:00:16.738921445 =
+0000
-@@ -529,7 +529,9 @@
- void FlushExecutionContext() {
- #ifndef JS_SIMULATOR_ARM
-+#if __ARM_ARCH >=3D 7
-   // Ensure that any instructions already in the pipeline are discarded=
 and
-   // reloaded from the icache.
-   asm volatile("isb\n" : : : "memory");
-+#endif
- #else
-   // We assume the icache flushing routines on other platforms take car=
e of this
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patc=
h b/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch
deleted file mode 100644
index 22f31e05f8..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From e4d8016d0dc56b02e22898d83aad9f80a94d1c3c Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 20 Oct 2021 16:21:14 -0700
-Subject: [PATCH] mozjs: Fix musl miscompiles with HAVE_THREAD_TLS_KEYWOR=
D
-
-Upstream: No
-Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWOR=
D:
-https://github.com/void-linux/void-packages/issues/2598
-
----
-Upstream-Status: Pending
-
- js/src/old-configure.in | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/js/src/old-configure.in b/js/src/old-configure.in
-index cabd72a2b6..0f08d91cbf 100644
---- a/js/src/old-configure.in
-+++ b/js/src/old-configure.in
-@@ -807,6 +807,9 @@ if test "$ac_cv_thread_keyword" =3D yes; then
-     *-android*|*-linuxandroid*)
-       :
-       ;;
-+    *-musl*)
-+      :
-+      ;;
-     *)
-       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
-       ;;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/musl-disable-stackw=
alk.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/musl-disable-stackwa=
lk.patch
deleted file mode 100644
index 590cddfe5f..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/musl-disable-stackwalk.pat=
ch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 9aae71c6ee73431d2609be0ef74ffd4b22b36c75 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 22 Sep 2023 22:59:56 +0000
-Subject: [PATCH] Musl does not have stack unwinder like glibc therefore =
we can
- not assume that its always available on musl, we do need to check for t=
arget
- environment as well which could be musl or glibc.
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- mozglue/misc/StackWalk.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.cpp
-index 307715b170..a8d3cb40c0 100644
---- a/mozglue/misc/StackWalk.cpp
-+++ b/mozglue/misc/StackWalk.cpp
-@@ -43,7 +43,7 @@ using namespace mozilla;
- #  define MOZ_STACKWALK_SUPPORTS_MACOSX 0
- #endif
-=20
--#if (defined(linux) &&                                            \
-+#if (defined(linux) && defined(__GLIBC__) &&                      \
-      ((defined(__GNUC__) && (defined(__i386) || defined(PPC))) || \
-       defined(HAVE__UNWIND_BACKTRACE)))
- #  define MOZ_STACKWALK_SUPPORTS_LINUX 1
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/riscv32.patch b/met=
a-oe/recipes-extended/mozjs/mozjs-115/riscv32.patch
deleted file mode 100644
index 16f95659e2..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115/riscv32.patch
+++ /dev/null
@@ -1,60 +0,0 @@
-From d6aff068170e56e6773feba42a463dd8c50bc4ff Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 24 Oct 2021 22:32:50 -0700
-Subject: [PATCH] Add RISCV32 support
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- build/moz.configure/init.configure                             | 3 +++
- python/mozbuild/mozbuild/configure/constants.py                | 2 ++
- .../mozbuild/test/configure/test_toolchain_configure.py        | 1 +
- 3 files changed, 6 insertions(+)
-
-diff --git a/build/moz.configure/init.configure b/build/moz.configure/in=
it.configure
-index 53bbc4203f..2ac40d3d39 100644
---- a/build/moz.configure/init.configure
-+++ b/build/moz.configure/init.configure
-@@ -584,6 +584,9 @@ def split_triplet(triplet, allow_wasi=3DFalse):
-     elif cpu.startswith("aarch64"):
-         canonical_cpu =3D "aarch64"
-         endianness =3D "little"
-+    elif cpu in ("riscv32", "riscv32gc"):
-+        canonical_cpu =3D "riscv32"
-+        endianness =3D "little"
-     elif cpu in ("riscv64", "riscv64gc"):
-         canonical_cpu =3D "riscv64"
-         endianness =3D "little"
-diff --git a/python/mozbuild/mozbuild/configure/constants.py b/python/mo=
zbuild/mozbuild/configure/constants.py
-index a36152651d..a6050be5d8 100644
---- a/python/mozbuild/mozbuild/configure/constants.py
-+++ b/python/mozbuild/mozbuild/configure/constants.py
-@@ -51,6 +51,7 @@ CPU_bitness =3D {
-     "mips64": 64,
-     "ppc": 32,
-     "ppc64": 64,
-+    'riscv32': 32,
-     "riscv64": 64,
-     "s390": 32,
-     "s390x": 64,
-@@ -98,6 +99,7 @@ CPU_preprocessor_checks =3D OrderedDict(
-         ("m68k", "__m68k__"),
-         ("mips64", "__mips64"),
-         ("mips32", "__mips__"),
-+        ("riscv32", "__riscv && __riscv_xlen =3D=3D 32"),
-         ("riscv64", "__riscv && __riscv_xlen =3D=3D 64"),
-         ("loongarch64", "__loongarch64"),
-         ("sh4", "__sh__"),
-diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_conf=
igure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configu=
re.py
-index c6af3d99d4..7ef02e1a85 100644
---- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
-+++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
-@@ -1325,6 +1325,7 @@ class LinuxCrossCompileToolchainTest(BaseToolchain=
Test):
-         "m68k-unknown-linux-gnu": big_endian + {"__m68k__": 1},
-         "mips64-unknown-linux-gnuabi64": big_endian + {"__mips64": 1, "=
__mips__": 1},
-         "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
-+        "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "__=
riscv_xlen": 32},
-         "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "__=
riscv_xlen": 64},
-         "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
-     }
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.17.0.bb b/meta-=
oe/recipes-extended/mozjs/mozjs-115_115.17.0.bb
deleted file mode 100644
index ca92f2cced..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-115_115.17.0.bb
+++ /dev/null
@@ -1,106 +0,0 @@
-SUMMARY =3D "SpiderMonkey is Mozilla's JavaScript engine written in C/C+=
+"
-HOMEPAGE =3D "https://developer.mozilla.org/en-US/docs/Mozilla/Projects/=
SpiderMonkey"
-LICENSE =3D "MPL-2.0"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc9b6ecd19a14a54a628edaaf2373=
3bf"
-
-SRC_URI =3D "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/s=
ource/firefox-${PV}esr.source.tar.xz \
-           file://0001-Cargo.toml-do-not-abort-on-panic.patch \
-           file://0002-moz.configure-do-not-look-for-llvm-objdump.patch =
\
-           file://0003-rust.configure-do-not-try-to-find-a-suitable-upst=
rea.patch \
-           file://0004-use-asm-sgidefs.h.patch \
-           file://fix-musl-build.patch \
-           file://0001-build-do-not-use-autoconf-s-config.sub-to-canonic=
ali.patch \
-           file://riscv32.patch \
-           file://0001-util.configure-fix-one-occasionally-reproduced-co=
nfi.patch \
-           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
-           file://musl-disable-stackwalk.patch \
-           file://0001-add-arm-to-list-of-mozinline.patch \
-           file://armv5.patch \
-           file://1849070.patch \=20
-           file://1894423.patch \
-           file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
-           "
-SRC_URI[sha256sum] =3D "80f184a102a743ee75401e86dd86af0be5f1e5ebf07c8111=
9d9ca77422d716c3"
-
-UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs115"
-UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
-
-S =3D "${WORKDIR}/firefox-${PV}"
-
-inherit pkgconfig perlnative python3native rust
-
-DEPENDS +=3D "zlib cargo-native python3 icu"
-DEPENDS:remove:mipsarch =3D "icu"
-DEPENDS:remove:powerpc:toolchain-clang =3D "icu"
-
-B =3D "${WORKDIR}/build"
-
-export PYTHONPATH =3D "${S}/build:\
-${S}/third_party/python/PyYAML/lib3:\
-${S}/testing/mozbase/mozfile:\
-${S}/python/mozboot:\
-${S}/third_party/python/distro:\
-${S}/testing/mozbase/mozinfo:\
-${S}/config:\
-${S}/testing/mozbase/manifestparser:\
-${S}/third_party/python/pytoml:\
-${S}/testing/mozbase/mozprocess:\
-${S}/third_party/python/six:\
-${S}/python/mozbuild:\
-${S}/python/mozbuild/mozbuild:\
-${S}/python/mach:\
-${S}/third_party/python/jsmin:\
-${S}/python/mozversioncontrol"
-
-export HOST_CC =3D "${BUILD_CC}"
-export HOST_CXX =3D "${BUILD_CXX}"
-export HOST_CFLAGS =3D "${BUILD_CFLAGS}"
-export HOST_CPPFLAGS =3D "${BUILD_CPPFLAGS}"
-export HOST_CXXFLAGS =3D "${BUILD_CXXFLAGS}"
-
-export AS =3D "${CC}"
-
-export RUSTFLAGS
-
-JIT ?=3D ""
-JIT:mipsarch =3D "--disable-jit"
-ICU ?=3D "--with-system-icu"
-ICU:mipsarch =3D ""
-ICU:powerpc:toolchain-clang =3D ""
-
-LDFLAGS:append:riscv32 =3D " -latomic"
-
-do_configure() {
-    cd ${B}
-    python3 ${S}/configure.py \
-        --enable-project=3Djs \
-        --target=3D${RUST_HOST_SYS} \
-        --host=3D${BUILD_SYS} \
-        --prefix=3D${prefix} \
-        --libdir=3D${libdir} \
-        --disable-jemalloc \
-        --disable-strip \
-        ${JIT} \
-        ${ICU}
-}
-do_configure[cleandirs] +=3D "${B}"
-
-do_install() {
-    oe_runmake 'DESTDIR=3D${D}' install
-}
-
-inherit multilib_script multilib_header
-
-MAJ_VER =3D "${@oe.utils.trim_version("${PV}", 1)}"
-MULTILIB_SCRIPTS +=3D "${PN}-dev:${bindir}/js${MAJ_VER}-config"
-
-do_install:append() {
-    oe_multilib_header mozjs-${MAJ_VER}/js-config.h
-    sed -e 's@${STAGING_DIR_HOST}@@g' \
-        -i ${D}${bindir}/js${MAJ_VER}-config
-    rm -f ${D}${libdir}/libjs_static.ajs
-}
-
-PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
-PACKAGES =3D+ "lib${BPN}"
-FILES:lib${BPN} +=3D "${libdir}/lib*"
--=20
2.47.1


