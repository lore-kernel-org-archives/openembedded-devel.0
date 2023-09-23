Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B395CE7A88
	for <webhook@archiver.kernel.org>; Sat, 23 Sep 2023 00:10:50 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.11989.1695427844675310237
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 22 Sep 2023 17:10:45 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 3854BC2D1
	for <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 02:10:41 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.34.192]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qjqEK-23FnFb0; Sat, 23 Sep 2023 02:10:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 3/4] mozjs: add recipe for v115
Date: Sat, 23 Sep 2023 02:10:25 +0200
Message-ID: <20230923001033.2805049-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230923001033.2805049-1-f_l_k@t-online.de>
References: <20230923001033.2805049-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1695427840-56FF8F57-2304F77A/0/0 CLEAN NORMAL
X-TOI-MSGID: cd59481e-90d5-407a-ad28-a7920201e82a
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 23 Sep 2023 00:10:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105083

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...001-Cargo.toml-do-not-abort-on-panic.patch | 32 ++++++++
 .../0001-add-arm-to-list-of-mozinline.patch   | 32 ++++++++
 ...-autoconf-s-config.sub-to-canonicali.patch | 29 +++++++
 ...rewrite-cargo-host-linker-in-python3.patch | 54 +++++++++++++
 ...ix-one-occasionally-reproduced-confi.patch | 48 ++++++++++++
 ...nfigure-do-not-look-for-llvm-objdump.patch | 44 +++++++++++
 ...o-not-try-to-find-a-suitable-upstrea.patch | 66 ++++++++++++++++
 .../mozjs-115/0004-use-asm-sgidefs.h.patch    | 38 +++++++++
 .../mozjs/mozjs-115/fix-musl-build.patch      | 27 +++++++
 .../mozjs-115/musl-disable-stackwalk.patch    | 27 +++++++
 .../mozjs/mozjs-115/riscv32.patch             | 60 ++++++++++++++
 .../mozjs/mozjs-115_115.2.0.bb                | 78 +++++++++++++++++++
 12 files changed, 535 insertions(+)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-Cargo.t=
oml-do-not-abort-on-panic.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-add-arm=
-to-list-of-mozinline.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-d=
o-not-use-autoconf-s-config.sub-to-canonicali.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-rewrite=
-cargo-host-linker-in-python3.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0001-util.co=
nfigure-fix-one-occasionally-reproduced-confi.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0002-moz.con=
figure-do-not-look-for-llvm-objdump.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0003-rust.co=
nfigure-do-not-try-to-find-a-suitable-upstrea.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/0004-use-asm=
-sgidefs.h.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-bui=
ld.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/musl-disable=
-stackwalk.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115/riscv32.patc=
h
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Cargo.toml-do-=
not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-=
Cargo.toml-do-not-abort-on-panic.patch
new file mode 100644
index 000000000..e8dfdea1e
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-Cargo.toml-do-not-abo=
rt-on-panic.patch
@@ -0,0 +1,32 @@
+From f501f7c02df4f0ff5d5f100d9eeb74cd4d12ea3d Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 1 Oct 2021 13:00:24 +0200
+Subject: [PATCH] Cargo.toml: do not abort on panic
+
+OE's rust is configured to unwind, and this setting clashes with it/
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ Cargo.toml | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/Cargo.toml b/Cargo.toml
+index a2718b2f35..4e231c30e8 100644
+--- a/Cargo.toml
++++ b/Cargo.toml
+@@ -59,13 +59,11 @@ opt-level =3D 1
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-add-arm-to-lis=
t-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-add-=
arm-to-list-of-mozinline.patch
new file mode 100644
index 000000000..83187861c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-add-arm-to-list-of-mo=
zinline.patch
@@ -0,0 +1,32 @@
+From c5cfb8aa591afd5ad3aedc58fe7f410e89013605 Mon Sep 17 00:00:00 2001
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
+
+---
+ js/src/jit/GenerateAtomicOperations.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/jit/GenerateAtomicOperations.py b/js/src/jit/Generat=
eAtomicOperations.py
+index 24b5a191cf..e41948c5af 100644
+--- a/js/src/jit/GenerateAtomicOperations.py
++++ b/js/src/jit/GenerateAtomicOperations.py
+@@ -860,7 +860,7 @@ def generate_atomics_header(c_out):
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-do-not-u=
se-autoconf-s-config.sub-to-canonicali.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-115/0001-build-do-not-use-autoconf-s-config.sub-to-canonicali.=
patch
new file mode 100644
index 000000000..fe905fe4d
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-build-do-not-use-auto=
conf-s-config.sub-to-canonicali.patch
@@ -0,0 +1,29 @@
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
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/in=
it.configure
+index 81f500a0b7..0b7a2ff60f 100644
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -585,7 +585,7 @@ def help_host_target(help, host, target):
+=20
+ def config_sub(shell, triplet):
+     config_sub =3D os.path.join(os.path.dirname(__file__), "..", "autoc=
onf", "config.sub")
+-    return check_cmd_output(shell, config_sub, triplet).strip()
++    return triplet
+=20
+=20
+ @depends("--host", shell)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-rewrite-cargo-=
host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0=
001-rewrite-cargo-host-linker-in-python3.patch
new file mode 100644
index 000000000..83f384e6c
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-rewrite-cargo-host-li=
nker-in-python3.patch
@@ -0,0 +1,54 @@
+From c6a84863454b882695058187cd282987613474ef Mon Sep 17 00:00:00 2001
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
+
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0001-util.configure=
-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-115/0001-util.configure-fix-one-occasionally-reproduced-confi.=
patch
new file mode 100644
index 000000000..4921a9028
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0001-util.configure-fix-on=
e-occasionally-reproduced-confi.patch
@@ -0,0 +1,48 @@
+From 0d28cd65efe14022e1d645db71dec74f11ab2ae8 Mon Sep 17 00:00:00 2001
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
+
+---
+ build/moz.configure/util.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/moz.configure/util.configure b/build/moz.configure/ut=
il.configure
+index f5ff3acd79..44f69deceb 100644
+--- a/build/moz.configure/util.configure
++++ b/build/moz.configure/util.configure
+@@ -254,7 +254,7 @@ def try_invoke_compiler(
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0002-moz.configure-=
do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs=
-115/0002-moz.configure-do-not-look-for-llvm-objdump.patch
new file mode 100644
index 000000000..4c69155a6
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0002-moz.configure-do-not-=
look-for-llvm-objdump.patch
@@ -0,0 +1,44 @@
+From 49cb509abd309e3b74ef4c872ae773f18dabca19 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 1 Oct 2021 13:01:10 +0200
+Subject: [PATCH] moz.configure: do not look for llvm-objdump
+
+This avoid dragging in a dependency that isn't even needed
+for js builds.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ moz.configure | 18 +++++++++---------
+ 1 file changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/moz.configure b/moz.configure
+index 3a9461200d..33b3f49b0c 100755
+--- a/moz.configure
++++ b/moz.configure
+@@ -723,15 +723,15 @@ check_prog(
+ )
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0003-rust.configure=
-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-115/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.=
patch
new file mode 100644
index 000000000..0f9d06220
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0003-rust.configure-do-not=
-try-to-find-a-suitable-upstrea.patch
@@ -0,0 +1,66 @@
+From ac6a3711917ff3f2b64662cbf4681c22a09da403 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex@linutronix.de>
+Date: Fri, 1 Oct 2021 13:02:17 +0200
+Subject: [PATCH] rust.configure: do not try to find a suitable upstream =
target
+
+OE is using custom targets and so this is bound to fail.
+
+Upstream-Status: Inappropriate [oe-core specific]
+Signed-off-by: Alexander Kanavin <alex@linutronix.de>
+
+---
+ build/moz.configure/rust.configure | 34 ++----------------------------
+ 1 file changed, 2 insertions(+), 32 deletions(-)
+
+diff --git a/build/moz.configure/rust.configure b/build/moz.configure/ru=
st.configure
+index 7a2fd1ae70..e11f13b253 100644
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/0004-use-asm-sgidef=
s.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/0004-use-asm-sgidefs=
.h.patch
new file mode 100644
index 000000000..6443d46b2
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/0004-use-asm-sgidefs.h.pat=
ch
@@ -0,0 +1,38 @@
+From 607aa4d822b0e074ae1b2fc16d7c140c3e889680 Mon Sep 17 00:00:00 2001
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
+
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patc=
h b/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch
new file mode 100644
index 000000000..d2b87e803
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/fix-musl-build.patch
@@ -0,0 +1,27 @@
+From e4d8016d0dc56b02e22898d83aad9f80a94d1c3c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 20 Oct 2021 16:21:14 -0700
+Subject: [PATCH] mozjs: Fix musl miscompiles with HAVE_THREAD_TLS_KEYWOR=
D
+
+Upstream: No
+Reason: mozjs60 miscompiles on musl if built with HAVE_THREAD_TLS_KEYWOR=
D:
+https://github.com/void-linux/void-packages/issues/2598
+
+---
+ js/src/old-configure.in | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/js/src/old-configure.in b/js/src/old-configure.in
+index cabd72a2b6..0f08d91cbf 100644
+--- a/js/src/old-configure.in
++++ b/js/src/old-configure.in
+@@ -807,6 +807,9 @@ if test "$ac_cv_thread_keyword" =3D yes; then
+     *-android*|*-linuxandroid*)
+       :
+       ;;
++    *-musl*)
++      :
++      ;;
+     *)
+       AC_DEFINE(HAVE_THREAD_TLS_KEYWORD)
+       ;;
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/musl-disable-stackw=
alk.patch b/meta-oe/recipes-extended/mozjs/mozjs-115/musl-disable-stackwa=
lk.patch
new file mode 100644
index 000000000..590cddfe5
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/musl-disable-stackwalk.pat=
ch
@@ -0,0 +1,27 @@
+From 9aae71c6ee73431d2609be0ef74ffd4b22b36c75 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 22 Sep 2023 22:59:56 +0000
+Subject: [PATCH] Musl does not have stack unwinder like glibc therefore =
we can
+ not assume that its always available on musl, we do need to check for t=
arget
+ environment as well which could be musl or glibc.
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ mozglue/misc/StackWalk.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/mozglue/misc/StackWalk.cpp b/mozglue/misc/StackWalk.cpp
+index 307715b170..a8d3cb40c0 100644
+--- a/mozglue/misc/StackWalk.cpp
++++ b/mozglue/misc/StackWalk.cpp
+@@ -43,7 +43,7 @@ using namespace mozilla;
+ #  define MOZ_STACKWALK_SUPPORTS_MACOSX 0
+ #endif
+=20
+-#if (defined(linux) &&                                            \
++#if (defined(linux) && defined(__GLIBC__) &&                      \
+      ((defined(__GNUC__) && (defined(__i386) || defined(PPC))) || \
+       defined(HAVE__UNWIND_BACKTRACE)))
+ #  define MOZ_STACKWALK_SUPPORTS_LINUX 1
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115/riscv32.patch b/met=
a-oe/recipes-extended/mozjs/mozjs-115/riscv32.patch
new file mode 100644
index 000000000..16f95659e
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115/riscv32.patch
@@ -0,0 +1,60 @@
+From d6aff068170e56e6773feba42a463dd8c50bc4ff Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 24 Oct 2021 22:32:50 -0700
+Subject: [PATCH] Add RISCV32 support
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+---
+ build/moz.configure/init.configure                             | 3 +++
+ python/mozbuild/mozbuild/configure/constants.py                | 2 ++
+ .../mozbuild/test/configure/test_toolchain_configure.py        | 1 +
+ 3 files changed, 6 insertions(+)
+
+diff --git a/build/moz.configure/init.configure b/build/moz.configure/in=
it.configure
+index 53bbc4203f..2ac40d3d39 100644
+--- a/build/moz.configure/init.configure
++++ b/build/moz.configure/init.configure
+@@ -584,6 +584,9 @@ def split_triplet(triplet, allow_wasi=3DFalse):
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
+index a36152651d..a6050be5d8 100644
+--- a/python/mozbuild/mozbuild/configure/constants.py
++++ b/python/mozbuild/mozbuild/configure/constants.py
+@@ -51,6 +51,7 @@ CPU_bitness =3D {
+     "mips64": 64,
+     "ppc": 32,
+     "ppc64": 64,
++    'riscv32': 32,
+     "riscv64": 64,
+     "s390": 32,
+     "s390x": 64,
+@@ -98,6 +99,7 @@ CPU_preprocessor_checks =3D OrderedDict(
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
+index c6af3d99d4..7ef02e1a85 100644
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-115_115.2.0.bb
new file mode 100644
index 000000000..799b8abd9
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-115_115.2.0.bb
@@ -0,0 +1,78 @@
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
+           file://fix-musl-build.patch \
+           file://riscv32.patch \
+           file://0001-util.configure-fix-one-occasionally-reproduced-co=
nfi.patch \
+           file://0001-rewrite-cargo-host-linker-in-python3.patch  \
+           file://musl-disable-stackwalk.patch \
+           file://0001-add-arm-to-list-of-mozinline.patch \
+           "
+SRC_URI[sha256sum] =3D "51534dd2a158d955a2cb67cc1308f100f6c9def0788713ed=
8b4d743f3ad72457"
+
+S =3D "${WORKDIR}/firefox-${PV}"
+
+inherit pkgconfig perlnative python3native rust
+
+DEPENDS +=3D "zlib cargo-native python3 icu"
+DEPENDS:remove:mipsarch =3D "icu"
+DEPENDS:remove:powerpc:toolchain-clang =3D "icu"
+
+B =3D "${WORKDIR}/build"
+
+export PYTHONPATH =3D "${S}/build:${S}/third_party/python/PyYAML/lib3:${=
S}/testing/mozbase/mozfile:${S}/python/mozboot:${S}/third_party/python/di=
stro:${S}/testing/mozbase/mozinfo:${S}/config:${S}/testing/mozbase/manife=
stparser:${S}/third_party/python/pytoml:${S}/testing/mozbase/mozprocess:$=
{S}/third_party/python/six:${S}/python/mozbuild:${S}/python/mozbuild/mozb=
uild:${S}/python/mach:${S}/third_party/python/jsmin:${S}/python/mozversio=
ncontrol"
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
+
+do_install() {
+    oe_runmake 'DESTDIR=3D${D}' install
+}
+
+inherit multilib_script multilib_header
+
+MULTILIB_SCRIPTS +=3D " ${PN}-dev:${bindir}/js102-config"
+
+do_install:append() {
+    oe_multilib_header mozjs-115/js-config.h
+    sed -e 's@${STAGING_DIR_HOST}@@g' \
+        -i ${D}${bindir}/js115-config
+    rm -f ${D}${libdir}/libjs_static.ajs
+}
+
+PACKAGES =3D+ "lib${BPN}"
+FILES:lib${BPN} +=3D "${libdir}/lib*"
--=20
2.42.0


