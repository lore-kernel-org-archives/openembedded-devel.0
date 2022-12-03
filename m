Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBC1C4332F
	for <webhook@archiver.kernel.org>; Sat,  3 Dec 2022 07:50:47 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.99662.1670053844350031486
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Dec 2022 23:50:44 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd82.dcpf.telekom.de (fwd82.aul.t-online.de [10.223.144.108])
	by mailout09.t-online.de (Postfix) with SMTP id 69B74211D3
	for <openembedded-devel@lists.openembedded.org>; Sat,  3 Dec 2022 08:50:42 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.34.117]) by fwd82.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p1NIG-1tzuBF0; Sat, 3 Dec 2022 08:50:40 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] perfetto: pass TUNE_CCARGS to use machine tune
Date: Sat,  3 Dec 2022 08:43:24 +0100
Message-Id: <20221203074324.403778-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1670053840-E67DE07E-25E35E9D/0/0 CLEAN NORMAL
X-TOI-MSGID: 48e3a4d5-95e9-41e5-ba1a-08b8a3c6194e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 03 Dec 2022 07:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99917

We already tried to pass -mfloat-abi=3Dhard if the machine can use it, bu=
t since
no floating-point-unit was defined it got stubbed out and the result was,=
 that
only arm targets configured for softfp were able to build perfetto.

Simplify by passing ${TUNE_CCARGS} to ensure, we always use the features,=
 the
machine was configured for.

Also, do not use sed to remove the hardcoded -mfpu=3Dneon entry. If this =
really
turns out to be problematic, we need to patch it out to avoid not having =
a
floating-point-unit again.

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 25 ++++++-------------
 1 file changed, 7 insertions(+), 18 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/reci=
pes-devtools/perfetto/perfetto.bb
index 98e39f068..86ab18cac 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -70,24 +70,14 @@ do_configure () {
     elif [ $arch =3D "aarch64" ]; then
         arch=3D"arm64"
     fi
-   =20
-    # For ARM32 with hardware floating point using clang and musl, we ne=
ed to
-    # specify -mfloat-abi=3Dhard to make the ABI settings of the linker =
and the
-    # compiler match. The linker would use hardware float ABI. The compi=
ler does
-    # not. As a result we need to force the compiler to do so by adding
-    # -mfloat-abi=3Dhard to compilation flags.
-    FLOAT_ABI=3D""
-    if [[ "${@bb.utils.contains('TUNE_FEATURES', 'callconvention-hard', =
'true', 'false', d)}" =3D=3D "true" ]]; then
-      FLOAT_ABI=3D"-mfloat-abi=3Dhard"
-    fi
=20
     ARGS=3D$ARGS" target_os=3D\"linux\""
     ARGS=3D$ARGS" target_cpu=3D\"$arch\""
-    ARGS=3D$ARGS" target_cc=3D\"$CC_BIN ${FLOAT_ABI}\""
-    ARGS=3D$ARGS" target_cxx=3D\"$CXX_BIN -std=3Dc++11 ${FLOAT_ABI}\""
+    ARGS=3D$ARGS" target_cc=3D\"$CC_BIN ${TUNE_CCARGS}\""
+    ARGS=3D$ARGS" target_cxx=3D\"$CXX_BIN -std=3Dc++11 ${TUNE_CCARGS}\""
     ARGS=3D$ARGS" target_strip=3D\"$STRIP_BIN\"" #
     ARGS=3D$ARGS" target_sysroot=3D\"${RECIPE_SYSROOT}\""
-    ARGS=3D$ARGS" target_linker=3D\"$CC_BIN ${FLOAT_ABI} ${LDFLAGS}\""
+    ARGS=3D$ARGS" target_linker=3D\"$CC_BIN ${TUNE_CCARGS} ${LDFLAGS}\""
     ARGS=3D$ARGS" target_ar=3D\"$AR\""
     ARGS=3D"'$ARGS'"
     cmd=3D"tools/gn gen --args=3D$ARGS ${B}"
@@ -100,7 +90,6 @@ do_configure () {
     # Eliminate a few incompatible build flags
     REPLACES=3D"s/-Wl,--icf=3Dall//g"
     REPLACES=3D$REPLACES";s/-Werror//g"
-    REPLACES=3D$REPLACES";s/-mfpu=3Dneon//g"
     REPLACES=3D$REPLACES";s/-fcolor-diagnostics//g"
     REPLACES=3D$REPLACES";s/=3Dformat-security//g"
     REPLACES=3D$REPLACES";s/-fdiagnostics-show-template-tree//g"
@@ -111,12 +100,12 @@ do_configure () {
=20
     # If using the clang toolchain: use the clang host-side binaries bui=
lt by Bitbake
     if [ "${TOOLCHAIN}" =3D "clang" ]; then
-        BB_CLANGXX=3D"${BUILD_CXX} ${BUILD_LDFLAGS} ${FLOAT_ABI}"
-        BB_CLANG=3D"${BUILD_CC} ${FLOAT_ABI}"
+        BB_CLANGXX=3D"${BUILD_CXX} ${BUILD_LDFLAGS} ${TUNE_CCARGS}"
+        BB_CLANG=3D"${BUILD_CC} ${TUNE_CCARGS}"
         BB_LLVM_OBJCOPY=3D"${RECIPE_SYSROOT_NATIVE}/usr/bin/llvm-objcopy=
"
        =20
-        HOST_CLANGXX=3D"${STAGING_DIR_NATIVE}/usr/bin/clang++ -stdlib=3D=
libc++ -rtlib=3Dlibgcc -unwindlib=3Dlibgcc ${FLOAT_ABI}"
-        HOST_CLANG=3D"${STAGING_DIR_NATIVE}/usr/bin/clang ${FLOAT_ABI}"
+        HOST_CLANGXX=3D"${STAGING_DIR_NATIVE}/usr/bin/clang++ -stdlib=3D=
libc++ -rtlib=3Dlibgcc -unwindlib=3Dlibgcc ${TUNE_CCARGS}"
+        HOST_CLANG=3D"${STAGING_DIR_NATIVE}/usr/bin/clang ${TUNE_CCARGS}=
"
         HOST_LLVM_OBJCOPY=3D"${STAGING_DIR_NATIVE}/usr/bin/llvm-objcopy"
=20
         cd gcc_like_host
--=20
2.34.1


