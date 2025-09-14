Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CA0CCAC58F
	for <webhook@archiver.kernel.org>; Sun, 14 Sep 2025 06:08:16 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.4316.1757830090034370519
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 13 Sep 2025 23:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd82.aul.t-online.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout06.t-online.de (Postfix) with SMTP id B20B61C047
	for <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 08:08:07 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.41.171]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uxfuA-3ggMiH0; Sun, 14 Sep 2025 08:08:06 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][RFC][PATCH 1/2] mozjs: update 128 > 140
Date: Sun, 14 Sep 2025 08:07:57 +0200
Message-ID: <20250914060758.18953-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1757830086-F97F84E6-2D6B5CA2/0/0 CLEAN NORMAL
X-TOI-MSGID: 5dfdff2e-7b91-4515-a879-b1563676cdcf
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 14 Sep 2025 06:08:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119390

- rework some patches
- drop applied patches
- add some additional patches from debian
- add clang-native dependency since it is available in oe-core
  and llvm-objdump is needed in more places now

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...with-icu-uc-to-fix-build-with-ICU-76.patch | 27 ------------
 ...nfigure-do-not-look-for-llvm-objdump.patch | 43 -------------------
 ...001-Cargo.toml-do-not-abort-on-panic.patch |  0
 .../0001-add-arm-to-list-of-mozinline.patch   |  0
 ...rewrite-cargo-host-linker-in-python3.patch | 13 +++---
 ...ix-one-occasionally-reproduced-confi.patch | 19 ++++----
 ...o-not-try-to-find-a-suitable-upstrea.patch |  0
 .../0004-use-asm-sgidefs.h.patch              |  0
 ...ecurity-warning-when-disabling-forma.patch | 21 +++++++++
 ...nicalizedNaNBits-on-architectures-th.patch | 30 +++++++++++++
 .../Fix-math_private.h-for-i386-FTBFS.patch   | 29 +++++++++++++
 .../{mozjs-128 =3D> mozjs-140}/armv5.patch      |  0
 .../musl-disable-stackwalk.patch              |  0
 .../{mozjs-128 =3D> mozjs-140}/riscv.patch      | 29 +++++++------
 .../{mozjs-128 =3D> mozjs-140}/riscv32.patch    |  0
 ...js-128_128.5.2.bb =3D> mozjs-140_140.2.0.bb} | 11 ++---
 16 files changed, 118 insertions(+), 104 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-wi=
th-icu-uc-to-fix-build-with-ICU-76.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.con=
figure-do-not-look-for-llvm-objdump.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/0001-Ca=
rgo.toml-do-not-abort-on-panic.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/0001-ad=
d-arm-to-list-of-mozinline.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/0001-re=
write-cargo-host-linker-in-python3.patch (86%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/0001-ut=
il.configure-fix-one-occasionally-reproduced-confi.patch (81%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/0003-ru=
st.configure-do-not-try-to-find-a-suitable-upstrea.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/0004-us=
e-asm-sgidefs.h.patch (100%)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-140/Disable-form=
at-security-warning-when-disabling-forma.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-de=
tail-CanonicalizedNaNBits-on-architectures-th.patch
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_pri=
vate.h-for-i386-FTBFS.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/armv5.p=
atch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/musl-di=
sable-stackwalk.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/riscv.p=
atch (53%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/riscv32=
.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128_128.5.2.bb =3D> mozjs-1=
40_140.2.0.bb} (88%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-=
uc-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-=
128/0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
deleted file mode 100644
index 4fb7a28eeb..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Link-with-icu-uc-to-f=
ix-build-with-ICU-76.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From cbb5cc1022cc27edefc8eabbe21458cac9bda6fb Mon Sep 17 00:00:00 2001
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
-index 593b93acee..2181dca34b 100644
---- a/js/moz.configure
-+++ b/js/moz.configure
-@@ -1305,7 +1305,7 @@ def enable_system_icu_option(enable_system_icu):
-     return enable_system_icu
-=20
-=20
--system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1", when=3D=
"--with-system-icu")
-+system_icu =3D pkg_check_modules("MOZ_ICU", "icu-i18n >=3D 73.1 icu-uc"=
, when=3D"--with-system-icu")
-=20
-=20
- @depends(enable_system_icu_option)
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-=
do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs=
-128/0002-moz.configure-do-not-look-for-llvm-objdump.patch
deleted file mode 100644
index 9a82acf77b..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-=
look-for-llvm-objdump.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 1a5331f1997788e9a25bbc2b10eb14e2ee418be9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 1 Oct 2021 13:01:10 +0200
-Subject: [PATCH] moz.configure: do not look for llvm-objdump
-
-This avoid dragging in a dependency that isn't even needed
-for js builds.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- moz.configure | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/moz.configure b/moz.configure
-index 804b9a375a..402e79e3b3 100755
---- a/moz.configure
-+++ b/moz.configure
-@@ -390,15 +390,15 @@ def plain_llvm_or_prefixed(name, llvm_name=3DNone)=
:
-     return plain_llvm_or_prefixed
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-=
not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-=
Cargo.toml-do-not-abort-on-panic.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-n=
ot-abort-on-panic.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-Cargo.toml-do-not=
-abort-on-panic.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-lis=
t-of-mozinline.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-add-=
arm-to-list-of-mozinline.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-add-arm-to-list=
-of-mozinline.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-add-arm-to-list-o=
f-mozinline.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-=
host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0=
001-rewrite-cargo-host-linker-in-python3.patch
similarity index 86%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-h=
ost-linker-in-python3.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-rewrite-cargo-hos=
t-linker-in-python3.patch
index 94e1651b33..b1a0243939 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-rewrite-cargo-host-li=
nker-in-python3.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-rewrite-cargo-host-li=
nker-in-python3.patch
@@ -18,18 +18,19 @@ rewrite cargo-host-linker in python3
 Upstream-Status: Inappropriate [oe specific]
=20
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
  build/cargo-host-linker | 24 +++++++++++++++++++++---
  1 file changed, 21 insertions(+), 3 deletions(-)
=20
-diff --git a/build/cargo-host-linker b/build/cargo-host-linker
+diff --git a/build/cargo-host-linker.bat b/build/cargo-host-linker.bat
 index cbd0472bf7..87d43ce9ec 100755
---- a/build/cargo-host-linker
-+++ b/build/cargo-host-linker
+--- a/build/cargo-host-linker.bat
++++ b/build/cargo-host-linker.bat
 @@ -1,3 +1,21 @@
--#!/bin/sh
--# See comment in cargo-linker.
--eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
+-@echo off
+-REM See comment in cargo-linker (without extension)
+-%MOZ_CARGO_WRAP_HOST_LD% %* %MOZ_CARGO_WRAP_HOST_LDFLAGS%
 +#!/usr/bin/env python3
 +
 +import os,sys
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure=
-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/0001-util.configure-fix-one-occasionally-reproduced-confi.=
patch
similarity index 81%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-=
fix-one-occasionally-reproduced-confi.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-util.configure-fi=
x-one-occasionally-reproduced-confi.patch
index d53cc2bd41..99b0d28754 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-util.configure-fix-on=
e-occasionally-reproduced-confi.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-util.configure-fix-on=
e-occasionally-reproduced-confi.patch
@@ -28,6 +28,7 @@ It should be another process that deleted this file by =
using
 Upstream-Status: Submitted [https://bugzilla.mozilla.org/show_bug.cgi?id=
=3D1740667]
=20
 Signed-off-by: Changqing Li <changqing.li@windriver.com>
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
  build/moz.configure/util.configure | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
@@ -36,12 +37,12 @@ diff --git a/build/moz.configure/util.configure b/bui=
ld/moz.configure/util.confi
 index d93b91fcdd..47ab8b92b9 100644
 --- a/build/moz.configure/util.configure
 +++ b/build/moz.configure/util.configure
-@@ -256,7 +256,7 @@ def try_invoke_compiler(
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
+@@ -169,7 +169,7 @@
+ def make_create_temporary_file():
+     @contextmanager
+     def create_temporary_file(suffix):
+-        fd, path =3D mkstemp(prefix=3D"conftest", suffix=3Dsuffix)
++        fd, path =3D mkstemp(prefix=3D"try_invoke_compiler_conftest.", =
suffix=3Dsuffix, text=3DTrue)
+         os.close(fd)
+         yield path
+         try:
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure=
-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.=
patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-=
do-not-try-to-find-a-suitable-upstrea.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0003-rust.configure-do=
-not-try-to-find-a-suitable-upstrea.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidef=
s.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0004-use-asm-sgidefs=
.h.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs=
.h.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0004-use-asm-sgidefs.h=
.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format-secu=
rity-warning-when-disabling-forma.patch b/meta-oe/recipes-extended/mozjs/=
mozjs-140/Disable-format-security-warning-when-disabling-forma.patch
new file mode 100644
index 0000000000..27b8b71b5d
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/Disable-format-security-wa=
rning-when-disabling-forma.patch
@@ -0,0 +1,21 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Wed, 5 Mar 2025 07:16:17 +0900
+Subject: Disable format-security warning when disabling format warning
+
+Upstream-Status: Pending [Not my work. Taken from debian]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ js/src/xsum/moz.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/src/xsum/moz.build b/js/src/xsum/moz.build
+index dc7a4f2..30f64cd 100644
+--- a/js/src/xsum/moz.build
++++ b/js/src/xsum/moz.build
+@@ -17,4 +17,4 @@ SOURCES +=3D [
+ ]
+=20
+ # Suppress warnings in third-party code.
+-SOURCES['xsum.cpp'].flags +=3D ['-Wno-implicit-fallthrough', '-Wno-form=
at', '-Wno-unused-value']
++SOURCES['xsum.cpp'].flags +=3D ['-Wno-implicit-fallthrough', '-Wno-form=
at', '-Wno-format-security', '-Wno-unused-value']
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-detail-Ca=
nonicalizedNaNBits-on-architectures-th.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/Export-js-detail-CanonicalizedNaNBits-on-architectures-th.=
patch
new file mode 100644
index 0000000000..0b90eaf909
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/Export-js-detail-Canonical=
izedNaNBits-on-architectures-th.patch
@@ -0,0 +1,30 @@
+From: Simon McVittie <smcv@debian.org>
+Date: Thu, 8 Feb 2024 10:36:53 +0000
+Subject: Export js::detail::CanonicalizedNaNBits on architectures that u=
se it
+
+Otherwise the inline function JS::CanonicalizeNaN(double), which is
+called by gjs, cannot validly refer to it.
+
+Bug-Debian: https://bugs.debian.org/1063446
+Signed-off-by: Simon McVittie <smcv@debian.org>
+
+Upstream-Status: Pending [Not my work. Taken from debian]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ js/public/Value.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/js/public/Value.h b/js/public/Value.h
+index c70d5b6..4bee5bc 100644
+--- a/js/public/Value.h
++++ b/js/public/Value.h
+@@ -426,7 +426,7 @@ constexpr uint64_t CanonicalizedNaNSignificand =3D 0=
x8000000000000;
+ #endif
+=20
+ #if defined(JS_RUNTIME_CANONICAL_NAN)
+-extern uint64_t CanonicalizedNaNBits;
++extern JS_PUBLIC_DATA uint64_t CanonicalizedNaNBits;
+ #else
+ constexpr uint64_t CanonicalizedNaNBits =3D
+     mozilla::SpecificNaNBits<double, detail::CanonicalizedNaNSignBit,
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_private.h-=
for-i386-FTBFS.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_=
private.h-for-i386-FTBFS.patch
new file mode 100644
index 0000000000..18d53cd068
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/Fix-math_private.h-for-i38=
6-FTBFS.patch
@@ -0,0 +1,29 @@
+From: Mike Hommey <mh@glandium.org>
+Date: Sat, 27 Nov 2021 06:49:44 +0900
+Subject: Fix math_private.h for i386 FTBFS
+
+Origin: firefox-esr packaging, commit:https://salsa.debian.org/mozilla-t=
eam/firefox/-/commit/fc1e93ab0fd20680006d6e25f301ec47b1969518
+
+Upstream-Status: Pending [Not my work. Taken from debian]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ modules/fdlibm/src/math_private.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/modules/fdlibm/src/math_private.h b/modules/fdlibm/src/math=
_private.h
+index 45f7401..29ca8a8 100644
+--- a/modules/fdlibm/src/math_private.h
++++ b/modules/fdlibm/src/math_private.h
+@@ -30,7 +30,11 @@
+  * Adapted from https://github.com/freebsd/freebsd-src/search?q=3D__dou=
ble_t
+  */
+=20
++#if defined __FLT_EVAL_METHOD__ && (__FLT_EVAL_METHOD__ =3D=3D 2)
++typedef long double      __double_t;
++#else
+ typedef double      __double_t;
++#endif
+ typedef __double_t  double_t;
+ typedef float       __float_t;
+=20
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch b/meta-=
oe/recipes-extended/mozjs/mozjs-140/armv5.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/armv5.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/armv5.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackw=
alk.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/musl-disable-stackwa=
lk.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/musl-disable-stackwa=
lk.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/musl-disable-stackwalk=
.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch b/meta-=
oe/recipes-extended/mozjs/mozjs-140/riscv.patch
similarity index 53%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/riscv.patch
index cb2dc66525..9967bb75cc 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/riscv.patch
@@ -4,27 +4,28 @@ Rust uses above for architecture in tuples
=20
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
 --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
 +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
-@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(Bas
+@@ -1328,6 +1328,8 @@
          "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
          "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "__=
riscv_xlen": 32},
          "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "__=
riscv_xlen": 64},
-+        "riscv32gc-unknown-linux-gnu": little_endian
-+        + {"__riscv": 1, "__riscv_xlen": 32},
-+        "riscv64gc-unknown-linux-gnu": little_endian
-+        + {"__riscv": 1, "__riscv_xlen": 64},
++        "riscv32gc-unknown-linux-gnu": little_endian + {"__riscv": 1, "=
__riscv_xlen": 32},
++        "riscv64gc-unknown-linux-gnu": little_endian + {"__riscv": 1, "=
__riscv_xlen": 64},
          "sh4-unknown-linux-gnu": little_endian + {"__sh__": 1},
      }
 =20
 --- a/build/autoconf/config.sub
 +++ b/build/autoconf/config.sub
-@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
- 			| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \
- 			| pru \
- 			| pyramid \
--			| riscv | riscv32 | riscv32be | riscv64 | riscv64be \
-+			| riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | ri=
scv64gc \
- 			| rl78 | romp | rs6000 | rx \
- 			| s390 | s390x \
- 			| score \
+@@ -1396,8 +1396,10 @@
+ 			| riscv \
+ 			| riscv32 \
+ 			| riscv32be \
++			| riscv32gc \
+ 			| riscv64 \
+ 			| riscv64be \
++			| riscv64gc \
+ 			| rl78 \
+ 			| romp \
+ 			| rs6000 \
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch b/met=
a-oe/recipes-extended/mozjs/mozjs-140/riscv32.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/riscv32.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/riscv32.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb b/meta-o=
e/recipes-extended/mozjs/mozjs-140_140.2.0.bb
similarity index 88%
rename from meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-140_140.2.0.bb
index ceb81d07e5..e9e1c96921 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.5.2.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140_140.2.0.bb
@@ -5,7 +5,6 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc9b6ecd19a14a=
54a628edaaf23733bf"
=20
 SRC_URI =3D "https://archive.mozilla.org/pub/firefox/releases/${PV}esr/s=
ource/firefox-${PV}esr.source.tar.xz \
            file://0001-Cargo.toml-do-not-abort-on-panic.patch \
-           file://0002-moz.configure-do-not-look-for-llvm-objdump.patch =
\
            file://0003-rust.configure-do-not-try-to-find-a-suitable-upst=
rea.patch \
            file://0004-use-asm-sgidefs.h.patch \
            file://riscv32.patch \
@@ -14,19 +13,21 @@ SRC_URI =3D "https://archive.mozilla.org/pub/firefox/=
releases/${PV}esr/source/fire
            file://musl-disable-stackwalk.patch \
            file://0001-add-arm-to-list-of-mozinline.patch \
            file://armv5.patch \
-           file://0001-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
            file://riscv.patch \
+           file://Disable-format-security-warning-when-disabling-forma.p=
atch \
+           file://Export-js-detail-CanonicalizedNaNBits-on-architectures=
-th.patch \
+           file://Fix-math_private.h-for-i386-FTBFS.patch \
            "
-SRC_URI[sha256sum] =3D "25d633eb81499cbda44b8c64fa1c1a5879d55024b864ef49=
5d4997154d68358f"
+SRC_URI[sha256sum] =3D "956dce675c3b706d563caf07ed3ca9af632ab830be710dfd=
4351da78a0a2ef55"
=20
-UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs128"
+UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs140"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
 S =3D "${UNPACKDIR}/firefox-${PV}"
=20
 inherit pkgconfig perlnative python3native rust cargo
=20
-DEPENDS +=3D "zlib cbindgen-native python3 icu"
+DEPENDS +=3D "zlib cbindgen-native python3 icu clang-native"
 DEPENDS:remove:mipsarch =3D "icu"
 DEPENDS:remove:powerpc:toolchain-clang =3D "icu"
=20
--=20
2.50.1


