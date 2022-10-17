Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE670C433FE
	for <webhook@archiver.kernel.org>; Mon, 17 Oct 2022 17:30:47 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.176.1666027845454823471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Oct 2022 10:30:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout02.t-online.de (Postfix) with SMTP id AECDF65A5
	for <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 19:30:31 +0200 (CEST)
Received: from flk-MS-7C91.. ([84.163.46.75]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1okTwa-0nQP1V0; Mon, 17 Oct 2022 19:30:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2] perfetto: build libperfetto
Date: Mon, 17 Oct 2022 19:30:21 +0200
Message-Id: <20221017173021.1316096-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1666027828-C37F89D3-72AFFC97/0/0 CLEAN NORMAL
X-TOI-MSGID: fd80e5a1-6255-4dae-a689-b3e9f515cdf8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Oct 2022 17:30:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99203

- Mesa has support for perfetto, but the libperfetto library is needed
- Only v27 seems to be supported for now. Update perfetto accordingly
- Make sure perfetto and libperfetto share the same codebase
- Patch meson.build to allow shared build
- Add a version number to avoid having a non symlink so file packaged int=
o dev package.
- Create a PC file for libperfetto to allow mesa to find it using pkgconf=
ig.
- Add nobranch=3D1 for the git repos to silence warnings about missing de=
fault branch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...1-meson-add-pc-file-for-lib_perfetto.patch | 52 +++++++++++++++++++
 .../recipes-devtools/perfetto/libperfetto.bb  | 11 ++++
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 14 ++---
 .../recipes-devtools/perfetto/perfetto.inc    |  9 ++++
 4 files changed, 79 insertions(+), 7 deletions(-)
 create mode 100644 meta-oe/recipes-devtools/perfetto/files/0001-meson-ad=
d-pc-file-for-lib_perfetto.patch
 create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto.bb
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto.inc

diff --git a/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-fi=
le-for-lib_perfetto.patch b/meta-oe/recipes-devtools/perfetto/files/0001-=
meson-add-pc-file-for-lib_perfetto.patch
new file mode 100644
index 000000000..70de44173
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/files/0001-meson-add-pc-file-for-=
lib_perfetto.patch
@@ -0,0 +1,52 @@
+From 027f90dc9386ec08f2a5107025683e5fed6f3444 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 17 Oct 2022 19:20:53 +0200
+Subject: [PATCH] meson: add PC file for lib_perfetto
+
+---
+ meson.build | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 06015141c..752b4d928 100644
+--- a/meson.build
++++ b/meson.build
+@@ -19,9 +19,12 @@
+ project(
+     'perfetto',
+     ['c','cpp'],
+-    default_options: ['c_std=3Dc99', 'cpp_std=3Dc++11']
++    default_options: ['c_std=3Dc99', 'cpp_std=3Dc++11'],
++    version: '27.1'
+ )
+=20
++soversion =3D meson.project_version()
++
+ fs =3D import('fs')
+=20
+ if not fs.is_dir('sdk')
+@@ -30,8 +33,9 @@ endif
+=20
+ dep_threads =3D dependency('threads')
+=20
+-lib_perfetto =3D static_library(
++lib_perfetto =3D shared_library(
+     'perfetto',
++    version: soversion,
+     sources: 'sdk/perfetto.cc',
+     dependencies: dep_threads,
+     install: true,
+@@ -39,6 +43,10 @@ lib_perfetto =3D static_library(
+=20
+ inc_perfetto =3D include_directories('sdk')
+=20
++install_headers('sdk/perfetto.h')
++pkg =3D import('pkgconfig')
++pkg.generate(lib_perfetto)
++
+ dep_perfetto =3D declare_dependency(
+     link_with: lib_perfetto,
+     include_directories: inc_perfetto,
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto.bb b/meta-oe/r=
ecipes-devtools/perfetto/libperfetto.bb
new file mode 100644
index 000000000..d58e31414
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto.bb
@@ -0,0 +1,11 @@
+LICENSE =3D "Apache-2.0"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df87516e0b698007e9e75a1fe1012b=
390"
+
+require perfetto.inc
+
+inherit meson
+
+SRC_URI:append =3D " file://0001-meson-add-pc-file-for-lib_perfetto.patc=
h"
+
+FILES:${PN} +=3D "${datadir}"
+BBCLASSEXTEND =3D "native nativesdk"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/reci=
pes-devtools/perfetto/perfetto.bb
index 94c39e9cc..c1b099430 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -10,16 +10,15 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df87516e0b6=
98007e9e75a1fe1012b390 \
                     file://debian/copyright;md5=3D4e08364c82141f181de69d=
0a2b89d612 \
                     file://python/LICENSE;md5=3Dc602a632c34ade9c78a97673=
4077bce7"
=20
-SRC_URI =3D "git://github.com/google/perfetto.git;protocol=3Dhttps;name=3D=
perfetto \
+SRC_URI:append =3D " \
            git://github.com/protocolbuffers/protobuf.git;branch=3D3.9.x;=
protocol=3Dhttps;destsuffix=3Dgit/buildtools/protobuf;name=3Dprotobuf \
-           git://chromium.googlesource.com/external/github.com/llvm/llvm=
-project/libcxx.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libcxx;n=
ame=3Dlibcxx \
-           git://chromium.googlesource.com/external/github.com/llvm/llvm=
-project/libcxxabi.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libcx=
xabi;name=3Dlibcxxabi \
-           git://chromium.googlesource.com/external/github.com/llvm/llvm=
-project/libunwind.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libun=
wind;name=3Dlibunwind \
-           git://android.googlesource.com/platform/external/zlib.git;bra=
nch=3Dmaster;protocol=3Dhttps;destsuffix=3Dgit/buildtools/zlib;name=3Dzli=
b \
+           git://chromium.googlesource.com/external/github.com/llvm/llvm=
-project/libcxx.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libcxx;n=
ame=3Dlibcxx;nobranch=3D1 \
+           git://chromium.googlesource.com/external/github.com/llvm/llvm=
-project/libcxxabi.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libcx=
xabi;name=3Dlibcxxabi;nobranch=3D1 \
+           git://chromium.googlesource.com/external/github.com/llvm/llvm=
-project/libunwind.git;protocol=3Dhttps;destsuffix=3Dgit/buildtools/libun=
wind;name=3Dlibunwind;nobranch=3D1 \
+           git://android.googlesource.com/platform/external/zlib.git;bra=
nch=3Dmaster;protocol=3Dhttps;destsuffix=3Dgit/buildtools/zlib;name=3Dzli=
b;nobranch=3D1 \
            https://storage.googleapis.com/perfetto/gn-linux64-1968-0725d=
782;subdir=3Dgit/buildtools/;name=3Dgn \
            file://0001-Remove-check_build_deps-build-steps.patch "
=20
-SRCREV_perfetto =3D "5bd3f582c075d0d026c5fe0b5e291d34dee0d976"
 SRCREV_protobuf =3D "6a59a2ad1f61d9696092f79b6d74368b4d7970a3"
 SRCREV_libcxx =3D "d9040c75cfea5928c804ab7c235fed06a63f743a"
 SRCREV_libcxxabi =3D "196ba1aaa8ac285d94f4ea8d9836390a45360533"
@@ -27,6 +26,8 @@ SRCREV_libunwind =3D "d999d54f4bca789543a2eb6c995af2d9b=
5a1f3ed"
 SRCREV_zlib =3D "5c85a2da4c13eda07f69d81a1579a5afddd35f59"
 SRC_URI[gn.sha256sum] =3D "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f=
99efa2358177b64f5cd"
=20
+require perfetto.inc
+
 DEPENDS +=3D " ninja-native"
=20
 COMPATIBLE_HOST =3D "(i.86|x86_64|aarch64|arm).*-linux*"
@@ -35,7 +36,6 @@ FILES:${PN}:append =3D " \
   ${bindir}/tracebox \
   "
=20
-S =3D "${WORKDIR}/git"
 B =3D "${WORKDIR}/build"
=20
 CXXFLAGS:append:arm =3D "${@bb.utils.contains('TUNE_FEATURES', 'callconv=
ention-hard', ' -mfloat-abi=3Dhard', '', d)}"
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.inc b/meta-oe/rec=
ipes-devtools/perfetto/perfetto.inc
new file mode 100644
index 000000000..5cb6f8bb3
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.inc
@@ -0,0 +1,9 @@
+SUMMARY =3D "Perfetto - System profiling, app tracing and trace analysis=
."
+HOMEPAGE =3D "https://github.com/google/perfetto"
+
+SRC_URI =3D "git://github.com/google/perfetto.git;protocol=3Dhttps;name=3D=
perfetto;nobranch=3D1"
+
+SRCREV_perfetto =3D "1c52b5e132312aeb007ed180d4ba1d8d66227923"
+PV =3D "27.1"
+
+S =3D "${WORKDIR}/git"
--=20
2.34.1


