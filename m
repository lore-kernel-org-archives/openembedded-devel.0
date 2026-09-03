Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16964C624DB
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 08:19:39 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2795.1788423570336864253
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 01:19:30 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=MCk0cMFV;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id F0722E908
	for <openembedded-devel@lists.openembedded.org>; Thu,  3 Sep 2026 10:19:25 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.36]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x22fL-44btZN0; Thu, 3 Sep 2026 10:19:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 6/6] mozjs: update 128->140
Date: Thu,  3 Sep 2026 10:19:16 +0200
Message-ID: <20260903081916.156273-6-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903081916.156273-1-f_l_k@t-online.de>
References: <20260903081916.156273-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788423563-8D7F19C8-B0384B7F/0/0 CLEAN NORMAL
X-TOI-MSGID: b2676325-4ecb-4cf6-a4bb-4ee31fc278f8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788423565; i=f_l_k@t-online.de;
	bh=EhDK2frSChWpVuexX6xB/a8tbESxxTqLidXt3frIZPk=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MCk0cMFVI1GPEScMKOESp5dvv7y9MVZeSKoNUv4++IPtwUU2CbSQ75upAyb4KeO0y
	 CzFsPP6DmyZAkoUhuAxufBY52V3CL1Oerjyp5ADsh0Hx75QPMAdAiJ5WEC/a+SVjNd
	 UQeVhbyIkfuXSSOiafaHkUZU6aVDk4A73EfJQLGYabJcfOHPJIVyNh67IHNuz3HQc4
	 q3WODbVt3NbToGp3fIuM9KkiPkOkPlz3U1vSKXUBC7BxhWP5Lo/FskwJkArIT1AmMu
	 3ho0c17Qt3phcCFiZzSgp4Gff2jNShwWqnDiv8Se6A+PmCGG1ETn47P2zE4LhnYKcy
	 J23MPVv7TX5dA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 08:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129708

Dropped versus mozjs-128, both now fixed upstream in 140:
0002-moz.configure-do-not-look-for-llvm-objdump.patch
The LLVM_OBJDUMP check_prog block is gone from moz.configure entirely.
0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
js/moz.configure already asks for "icu-uc icu-i18n >=3D 76.1".

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...nfigure-do-not-look-for-llvm-objdump.patch | 43 -----------------
 ...ix-one-occasionally-reproduced-confi.patch | 47 -------------------
 ...with-icu-uc-to-fix-build-with-ICU-76.patch | 27 -----------
 ...001-Cargo.toml-do-not-abort-on-panic.patch |  0
 ...-not-try-to-find-a-suitable-upstrea.patch} |  0
 .../0003-use-asm-sgidefs.h.patch}             |  0
 .../0004-Add-RISCV32-support.patch}           |  0
 ...ix-one-occasionally-reproduced-confi.patch | 29 ++++++++++++
 ...ewrite-cargo-host-linker-in-python3.patch} |  2 +-
 ...e-stack-unwinder-like-glibc-therefo.patch} |  0
 ...om-firefox-bugzilla-to-fix-compile-.patch} |  0
 ...on-isn-t-available-in-ARMv5-or-v6-s.patch} |  0
 ...gc-and-riscv32gc-as-valid-architect.patch} | 38 ++++++++-------
 .../0011-Fix-build-error-with-musl.patch}     |  0
 ...d-ast.Str-and-ast.Index-with-ast.Co.patch} | 30 +++++++-----
 ...-128_128.14.0.bb =3D> mozjs-140_140.15.0.bb} | 42 ++++++++++-------
 16 files changed, 93 insertions(+), 165 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.con=
figure-do-not-look-for-llvm-objdump.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.co=
nfigure-fix-one-occasionally-reproduced-confi.patch
 delete mode 100644 meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-wi=
th-icu-uc-to-fix-build-with-ICU-76.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-128 =3D> mozjs-140}/0001-Ca=
rgo.toml-do-not-abort-on-panic.patch (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0003-rust.configure-do-=
not-try-to-find-a-suitable-upstrea.patch =3D> mozjs-140/0002-rust.configu=
re-do-not-try-to-find-a-suitable-upstrea.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0004-use-asm-sgidefs.h.=
patch =3D> mozjs-140/0003-use-asm-sgidefs.h.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0005-Add-RISCV32-suppor=
t.patch =3D> mozjs-140/0004-Add-RISCV32-support.patch} (100%)
 create mode 100644 meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.co=
nfigure-fix-one-occasionally-reproduced-confi.patch
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0007-Rewrite-cargo-host=
-linker-in-python3.patch =3D> mozjs-140/0006-Rewrite-cargo-host-linker-in=
-python3.patch} (96%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0008-Musl-does-not-have=
-stack-unwinder-like-glibc-therefo.patch =3D> mozjs-140/0007-Musl-does-no=
t-have-stack-unwinder-like-glibc-therefo.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0009-Backport-patch-fro=
m-firefox-bugzilla-to-fix-compile-.patch =3D> mozjs-140/0008-Backport-pat=
ch-from-firefox-bugzilla-to-fix-compile-.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0010-The-ISB-instructio=
n-isn-t-available-in-ARMv5-or-v6-s.patch =3D> mozjs-140/0009-The-ISB-inst=
ruction-isn-t-available-in-ARMv5-or-v6-s.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0012-Recognise-riscv64g=
c-and-riscv32gc-as-valid-architect.patch =3D> mozjs-140/0010-Recognise-ri=
scv64gc-and-riscv32gc-as-valid-architect.patch} (62%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/0013-Fix-build-error-wi=
th-musl.patch =3D> mozjs-140/0011-Fix-build-error-with-musl.patch} (100%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128/D261512.1755672843.patc=
h =3D> mozjs-140/0012-Replace-deprecated-ast.Str-and-ast.Index-with-ast.C=
o.patch} (72%)
 rename meta-oe/recipes-extended/mozjs/{mozjs-128_128.14.0.bb =3D> mozjs-=
140_140.15.0.bb} (64%)

diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-=
do-not-look-for-llvm-objdump.patch b/meta-oe/recipes-extended/mozjs/mozjs=
-128/0002-moz.configure-do-not-look-for-llvm-objdump.patch
deleted file mode 100644
index 0616aa3ee7..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0002-moz.configure-do-not-=
look-for-llvm-objdump.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From 0f885ae37ef7cd94fd0712cefb5d3314fbcfdf44 Mon Sep 17 00:00:00 2001
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure=
-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-128/0006-util.configure-fix-one-occasionally-reproduced-confi.=
patch
deleted file mode 100644
index 9cc7831876..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0006-util.configure-fix-on=
e-occasionally-reproduced-confi.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From 13b544e4ed51f41138bf200eb84552e169df87b0 Mon Sep 17 00:00:00 2001
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
----
- build/moz.configure/util.configure | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/build/moz.configure/util.configure b/build/moz.configure/ut=
il.configure
-index d93b91fcdd..47ab8b92b9 100644
---- a/build/moz.configure/util.configure
-+++ b/build/moz.configure/util.configure
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-=
uc-to-fix-build-with-ICU-76.patch b/meta-oe/recipes-extended/mozjs/mozjs-=
128/0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch
deleted file mode 100644
index 2d85e29005..0000000000
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0011-Link-with-icu-uc-to-f=
ix-build-with-ICU-76.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 8290fd619582651334fbfdfe7be887d539ce0f2c Mon Sep 17 00:00:00 2001
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
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-=
not-abort-on-panic.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0001-=
Cargo.toml-do-not-abort-on-panic.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0001-Cargo.toml-do-n=
ot-abort-on-panic.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0001-Cargo.toml-do-not=
-abort-on-panic.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure=
-do-not-try-to-find-a-suitable-upstrea.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/0002-rust.configure-do-not-try-to-find-a-suitable-upstrea.=
patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0003-rust.configure-=
do-not-try-to-find-a-suitable-upstrea.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0002-rust.configure-do=
-not-try-to-find-a-suitable-upstrea.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidef=
s.h.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0003-use-asm-sgidefs=
.h.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0004-use-asm-sgidefs=
.h.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0003-use-asm-sgidefs.h=
.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-su=
pport.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0004-Add-RISCV32-s=
upport.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0005-Add-RISCV32-sup=
port.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0004-Add-RISCV32-suppo=
rt.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.configure=
-fix-one-occasionally-reproduced-confi.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/0005-util.configure-fix-one-occasionally-reproduced-confi.=
patch
new file mode 100644
index 0000000000..6430de38f2
--- /dev/null
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0005-util.configure-fix-on=
e-occasionally-reproduced-confi.patch
@@ -0,0 +1,29 @@
+From fe1c2336dfe5e8b4357d5e382edd1eba30cfa7d7 Mon Sep 17 00:00:00 2001
+From: x <a@b.c>
+Date: Wed, 2 Sep 2026 20:23:10 +0000
+Subject: [PATCH] util.configure: fix one occasionally reproduced configu=
re
+ failure
+
+try_invoke_compiler() creates its temporary files with the prefix "conft=
est",
+which collides with the files other configure checks create under the sa=
me
+name. Under parallel builds this occasionally makes a check pick up a st=
ale
+file and fail. Use a distinct prefix.
+
+Upstream-Status: Pending
+---
+ build/moz.configure/util.configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/build/moz.configure/util.configure b/build/moz.configure/ut=
il.configure
+index 8d31d112a..cb0884496 100644
+--- a/build/moz.configure/util.configure
++++ b/build/moz.configure/util.configure
+@@ -169,7 +169,7 @@ normalize_path =3D normalize_path()
+ def make_create_temporary_file():
+     @contextmanager
+     def create_temporary_file(suffix):
+-        fd, path =3D mkstemp(prefix=3D"conftest", suffix=3Dsuffix)
++        fd, path =3D mkstemp(prefix=3D"try_invoke_compiler_conftest", s=
uffix=3Dsuffix)
+         os.close(fd)
+         yield path
+         try:
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-=
host-linker-in-python3.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0=
006-Rewrite-cargo-host-linker-in-python3.patch
similarity index 96%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-h=
ost-linker-in-python3.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0006-Rewrite-cargo-hos=
t-linker-in-python3.patch
index 9d6a89214b..71ec4b29b6 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0007-Rewrite-cargo-host-li=
nker-in-python3.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0006-Rewrite-cargo-host-li=
nker-in-python3.patch
@@ -29,7 +29,7 @@ index cbd0472bf7..87d43ce9ec 100755
 @@ -1,3 +1,21 @@
 -#!/bin/sh
 -# See comment in cargo-linker.
--eval ${MOZ_CARGO_WRAP_HOST_LD} ${MOZ_CARGO_WRAP_HOST_LDFLAGS} '"$@"'
+-eval ${MOZ_CARGO_WRAP_HOST_LD} '"$@"' ${MOZ_CARGO_WRAP_HOST_LDFLAGS}
 +#!/usr/bin/env python3
 +
 +import os,sys
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-=
have-stack-unwinder-like-glibc-therefo.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/0007-Musl-does-not-have-stack-unwinder-like-glibc-therefo.=
patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0008-Musl-does-not-h=
ave-stack-unwinder-like-glibc-therefo.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0007-Musl-does-not-hav=
e-stack-unwinder-like-glibc-therefo.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch=
-from-firefox-bugzilla-to-fix-compile-.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/0008-Backport-patch-from-firefox-bugzilla-to-fix-compile-.=
patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0009-Backport-patch-=
from-firefox-bugzilla-to-fix-compile-.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0008-Backport-patch-fr=
om-firefox-bugzilla-to-fix-compile-.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instru=
ction-isn-t-available-in-ARMv5-or-v6-s.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/0009-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.=
patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0010-The-ISB-instruc=
tion-isn-t-available-in-ARMv5-or-v6-s.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0009-The-ISB-instructi=
on-isn-t-available-in-ARMv5-or-v6-s.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-risc=
v64gc-and-riscv32gc-as-valid-architect.patch b/meta-oe/recipes-extended/m=
ozjs/mozjs-140/0010-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.=
patch
similarity index 62%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv=
64gc-and-riscv32gc-as-valid-architect.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0010-Recognise-riscv64=
gc-and-riscv32gc-as-valid-architect.patch
index 9cdb9fe913..21d79e8686 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/0012-Recognise-riscv64gc-a=
nd-riscv32gc-as-valid-architect.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0010-Recognise-riscv64gc-a=
nd-riscv32gc-as-valid-architect.patch
@@ -1,35 +1,37 @@
-From 93d586d712bf34c243c6174425c78d3ab274c6a0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 7 Jan 2025 15:17:16 -0800
+From 6fac6696adffc7b4f2bd47e12e8cae842736813f Mon Sep 17 00:00:00 2001
+From: x <a@b.c>
+Date: Wed, 2 Sep 2026 20:23:36 +0000
 Subject: [PATCH] Recognise riscv64gc and riscv32gc as valid architecture=
s
=20
-Rust uses above for architecture in tuples
+rust names the riscv targets riscv64gc-* and riscv32gc-*, and OE passes =
that
+triple straight through to configure. config.sub rejects it.
=20
 Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- build/autoconf/config.sub                                     | 2 +-
+ build/autoconf/config.sub                                     | 2 ++
  .../mozbuild/test/configure/test_toolchain_configure.py       | 4 ++++
- 2 files changed, 5 insertions(+), 1 deletion(-)
+ 2 files changed, 6 insertions(+)
=20
 diff --git a/build/autoconf/config.sub b/build/autoconf/config.sub
-index 2c6a07ab3c..f7ee82380c 100755
+index 4aaae46f6..10020ca01 100755
 --- a/build/autoconf/config.sub
 +++ b/build/autoconf/config.sub
-@@ -1236,7 +1236,7 @@ case $cpu-$vendor in
- 			| powerpc | powerpc64 | powerpc64le | powerpcle | powerpcspe \
- 			| pru \
+@@ -1395,8 +1395,10 @@ case $cpu-$vendor in
  			| pyramid \
--			| riscv | riscv32 | riscv32be | riscv64 | riscv64be \
-+			| riscv | riscv32 | riscv32be | riscv32gc | riscv64 | riscv64be | ri=
scv64gc \
- 			| rl78 | romp | rs6000 | rx \
- 			| s390 | s390x \
- 			| score \
+ 			| riscv \
+ 			| riscv32 \
++			| riscv32gc \
+ 			| riscv32be \
+ 			| riscv64 \
++			| riscv64gc \
+ 			| riscv64be \
+ 			| rl78 \
+ 			| romp \
 diff --git a/python/mozbuild/mozbuild/test/configure/test_toolchain_conf=
igure.py b/python/mozbuild/mozbuild/test/configure/test_toolchain_configu=
re.py
-index 1be0d02e54..a476d787b2 100644
+index 481ce4687..b5ce7785b 100644
 --- a/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
 +++ b/python/mozbuild/mozbuild/test/configure/test_toolchain_configure.p=
y
-@@ -1327,6 +1327,10 @@ class LinuxCrossCompileToolchainTest(BaseToolchai=
nTest):
+@@ -1328,6 +1328,10 @@ class LinuxCrossCompileToolchainTest(BaseToolchai=
nTest):
          "mips-unknown-linux-gnu": big_endian + {"__mips__": 1},
          "riscv32-unknown-linux-gnu": little_endian + {"__riscv": 1, "__=
riscv_xlen": 32},
          "riscv64-unknown-linux-gnu": little_endian + {"__riscv": 1, "__=
riscv_xlen": 64},
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-erro=
r-with-musl.patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0011-Fix-bui=
ld-error-with-musl.patch
similarity index 100%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/0013-Fix-build-error=
-with-musl.patch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0011-Fix-build-error-w=
ith-musl.patch
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.=
patch b/meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecated-=
ast.Str-and-ast.Index-with-ast.Co.patch
similarity index 72%
rename from meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.p=
atch
rename to meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecate=
d-ast.Str-and-ast.Index-with-ast.Co.patch
index 1b35d2c094..7838de39d0 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128/D261512.1755672843.patch
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140/0012-Replace-deprecated-as=
t.Str-and-ast.Index-with-ast.Co.patch
@@ -1,14 +1,22 @@
-This patch fixes configure with python 3.14
+From 459a43a9b1f767cde9a8bbb6016b5f9d17890370 Mon Sep 17 00:00:00 2001
+From: x <a@b.c>
+Date: Wed, 2 Sep 2026 20:23:13 +0000
+Subject: [PATCH] Replace deprecated ast.Str and ast.Index with ast.Const=
ant
=20
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
+ast.Str and ast.Index were removed in Python 3.12, which makes mozbuild =
fail
+to read moz.build files when the build host provides a newer python3.
=20
-Upstream-Status: Backport [https://github.com/mozilla-firefox/firefox/co=
mmit/d497aa4f770ca02f6083e93b94996a8fe32c2ff4]
+Upstream-Status: Backport [https://phabricator.services.mozilla.com/D261=
512]
+---
+ python/mozbuild/mozbuild/frontend/reader.py        | 14 +++++++-------
+ .../mozbuild/mozbuild/vendor/rewrite_mozbuild.py   |  6 ++----
+ 2 files changed, 9 insertions(+), 11 deletions(-)
=20
 diff --git a/python/mozbuild/mozbuild/frontend/reader.py b/python/mozbui=
ld/mozbuild/frontend/reader.py
-index 5cb627b..c2dcafe 100644
+index 9f6292cb9..89bf9995c 100644
 --- a/python/mozbuild/mozbuild/frontend/reader.py
 +++ b/python/mozbuild/mozbuild/frontend/reader.py
-@@ -470,7 +470,7 @@ class TemplateFunction(object):
+@@ -470,7 +470,7 @@ class TemplateFunction:
              return c(
                  ast.Subscript(
                      value=3Dc(ast.Name(id=3Dself._global_name, ctx=3Das=
t.Load())),
@@ -17,7 +25,7 @@ index 5cb627b..c2dcafe 100644
                      ctx=3Dnode.ctx,
                  )
              )
-@@ -1035,8 +1035,8 @@ class BuildReader(object):
+@@ -1039,8 +1039,8 @@ class BuildReader:
                  else:
                      # Others
                      assert isinstance(target.slice, ast.Index)
@@ -25,10 +33,10 @@ index 5cb627b..c2dcafe 100644
 -                    key =3D target.slice.value.s
 +                    assert isinstance(target.slice.value, ast.Constant)
 +                    key =3D target.slice.value.value
-=20
-             return name, key
-=20
-@@ -1044,11 +1044,11 @@ class BuildReader(object):
+             elif isinstance(target, ast.Attribute):
+                 assert isinstance(target.attr, str)
+                 key =3D target.attr
+@@ -1051,11 +1051,11 @@ class BuildReader:
              value =3D node.value
              if isinstance(value, ast.List):
                  for v in value.elts:
@@ -45,7 +53,7 @@ index 5cb627b..c2dcafe 100644
          assignments =3D []
 =20
 diff --git a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py b/pytho=
n/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
-index 1590267..151d27c 100644
+index cfcc0f18b..de06b5881 100644
 --- a/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
 +++ b/python/mozbuild/mozbuild/vendor/rewrite_mozbuild.py
 @@ -327,15 +327,13 @@ def assignment_node_to_source_filename_list(code, =
node):
diff --git a/meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb b/meta-=
oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb
similarity index 64%
rename from meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
rename to meta-oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb
index 635cad96cf..7b1418cf29 100644
--- a/meta-oe/recipes-extended/mozjs/mozjs-128_128.14.0.bb
+++ b/meta-oe/recipes-extended/mozjs/mozjs-140_140.15.0.bb
@@ -6,23 +6,22 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc9b6ecd19a1=
4a54a628edaaf23733bf"
 SRC_URI =3D " \
     https://archive.mozilla.org/pub/firefox/releases/${PV}esr/source/fir=
efox-${PV}esr.source.tar.xz \
     file://0001-Cargo.toml-do-not-abort-on-panic.patch \
-    file://0002-moz.configure-do-not-look-for-llvm-objdump.patch \
-    file://0003-rust.configure-do-not-try-to-find-a-suitable-upstrea.pat=
ch \
-    file://0004-use-asm-sgidefs.h.patch \
-    file://0005-Add-RISCV32-support.patch \
-    file://0006-util.configure-fix-one-occasionally-reproduced-confi.pat=
ch \
-    file://0007-Rewrite-cargo-host-linker-in-python3.patch  \
-    file://0008-Musl-does-not-have-stack-unwinder-like-glibc-therefo.pat=
ch \
-    file://0009-Backport-patch-from-firefox-bugzilla-to-fix-compile-.pat=
ch \
-    file://0010-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.pat=
ch \
-    file://0011-Link-with-icu-uc-to-fix-build-with-ICU-76.patch \
-    file://0012-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.pat=
ch \
-    file://0013-Fix-build-error-with-musl.patch \
-    file://D261512.1755672843.patch \
+    file://0002-rust.configure-do-not-try-to-find-a-suitable-upstrea.pat=
ch \
+    file://0003-use-asm-sgidefs.h.patch \
+    file://0004-Add-RISCV32-support.patch \
+    file://0005-util.configure-fix-one-occasionally-reproduced-confi.pat=
ch \
+    file://0006-Rewrite-cargo-host-linker-in-python3.patch \
+    file://0007-Musl-does-not-have-stack-unwinder-like-glibc-therefo.pat=
ch \
+    file://0008-Backport-patch-from-firefox-bugzilla-to-fix-compile-.pat=
ch \
+    file://0009-The-ISB-instruction-isn-t-available-in-ARMv5-or-v6-s.pat=
ch \
+    file://0010-Recognise-riscv64gc-and-riscv32gc-as-valid-architect.pat=
ch \
+    file://0011-Fix-build-error-with-musl.patch \
+    file://0012-Replace-deprecated-ast.Str-and-ast.Index-with-ast.Co.pat=
ch \
 "
-SRC_URI[sha256sum] =3D "93b9ef6229f41cb22ff109b95bbf61a78395a0fe4b870192=
eeca22947cb09a53"
=20
-UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs128"
+SRC_URI[sha256sum] =3D "358bb03c550f95172f1e31694e4287da3411560df91e931c=
b25210efdf90e524"
+
+UPSTREAM_CHECK_URI =3D "https://tracker.debian.org/pkg/mozjs140"
 UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
=20
 S =3D "${UNPACKDIR}/firefox-${PV}"
@@ -70,6 +69,7 @@ ICU:mipsarch =3D ""
 ICU:powerpc:toolchain-clang =3D ""
=20
 LDFLAGS:append:riscv32 =3D " -latomic"
+SECURITY_STRINGFORMAT =3D ""
=20
 do_configure() {
     cd ${B}
@@ -86,9 +86,9 @@ do_configure() {
 }
 do_configure[cleandirs] +=3D "${B}"
=20
-# The main build system is a Makefile that call cargo downstream.
-# We inherit cargo to get the environnement but need to switch back to
-# base_do_compile to do the Makefile base compilation.
+# The main build system is a Makefile that calls cargo downstream.
+# We inherit cargo to get the environment but need to switch back to
+# base_do_compile to do the Makefile based compilation.
 do_compile() {
     base_do_compile
 }
@@ -107,6 +107,12 @@ do_install:append() {
     sed -e 's@${STAGING_DIR_HOST}@@g' \
         -i ${D}${bindir}/js${MAJ_VER}-config
     rm -f ${D}${libdir}/libjs_static.ajs
+    # The installed SpiderMonkey headers require the consumer to define =
XP_UNIX
+    # or XP_WIN; mozilla/UniquePtrExtensions.h #errors out otherwise. js=
.pc.in
+    # ships only -isystem, and js-confdefs.h (which carries -DXP_UNIX in=
 the
+    # internal build) is deliberately not in EXPORTS, so declare it here=
.
+    sed -i -e 's|^Cflags: |Cflags: -DXP_UNIX |' \
+        ${D}${libdir}/pkgconfig/mozjs-${MAJ_VER}.pc
 }
=20
 INSANE_SKIP +=3D "32bit-time"
--=20
2.55.0


