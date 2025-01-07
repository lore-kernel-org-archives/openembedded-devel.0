Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5574E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 19:05:25 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.380.1736276716852376017
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Jan 2025 11:05:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout09.t-online.de (Postfix) with SMTP id A42A1A06
	for <openembedded-devel@lists.openembedded.org>; Tue,  7 Jan 2025 20:05:09 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.46.246]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tVEt1-467OCH0; Tue, 7 Jan 2025 20:05:07 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] opeh264: update 2.3.1 -> 2.5.0
Date: Tue,  7 Jan 2025 20:05:25 +0100
Message-ID: <20250107190525.948693-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1736276707-7A7FB9DC-EF508FA6/10/3626336762 SUSPECT URL
X-TOI-MSGID: 605d30ea-e0a7-4026-aa0c-c50d3761d0bc
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 19:05:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114722

- switch to meson buildsystem

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../openh264/openh264_2.3.1.bb                | 55 -------------------
 .../openh264/openh264_2.5.0.bb                | 20 +++++++
 2 files changed, 20 insertions(+), 55 deletions(-)
 delete mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264_=
2.3.1.bb
 create mode 100644 meta-multimedia/recipes-multimedia/openh264/openh264_=
2.5.0.bb

diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.b=
b b/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
deleted file mode 100644
index 6dfd759355..0000000000
--- a/meta-multimedia/recipes-multimedia/openh264/openh264_2.3.1.bb
+++ /dev/null
@@ -1,55 +0,0 @@
-SUMMARY =3D "Open Source H.264 Codec"
-DESCRIPTION =3D "OpenH264 is a codec library which supports H.264 encodi=
ng and \
-decoding. It is suitable for use in real time applications such as WebRT=
C."
-HOMEPAGE =3D "http://www.openh264.org/"
-SECTION =3D "libs/multimedia"
-
-DEPENDS:append:x86 =3D " nasm-native"
-DEPENDS:append:x86-64 =3D " nasm-native"
-
-LICENSE =3D "BSD-2-Clause"
-LICENSE_FLAGS =3D "commercial"
-LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb6d3771da6a07d33fd50d4d9aa73=
bcf"
-
-S =3D "${WORKDIR}/git"
-SRCREV =3D "0a48f4d2e9be2abb4fb01b4c3be83cf44ce91a6e"
-BRANCH =3D "openh264v${PV}"
-SRC_URI =3D "git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=
=3D${BRANCH} \
-           file://0001-Makefile-Use-cp-options-to-preserve-file-mode.pat=
ch \
-           file://0002-Makefile-add-possibility-to-disable-NEON-extensio=
n.patch \
-           "
-
-COMPATIBLE_MACHINE:armv7a =3D "(.*)"
-COMPATIBLE_MACHINE:aarch64 =3D "(.*)"
-COMPATIBLE_MACHINE:x86 =3D "(.*)"
-COMPATIBLE_MACHINE:x86-64 =3D "(.*)"
-COMPATIBLE_MACHINE:mips =3D "(.*)"
-COMPATIBLE_MACHINE:mips64 =3D "(.*)"
-COMPATIBLE_MACHINE:powerpc64le =3D "null"
-
-EXTRA_OEMAKE:armv7a =3D "ARCH=3Darm"
-EXTRA_OEMAKE:armv7ve =3D "ARCH=3Darm"
-EXTRA_OEMAKE:aarch64 =3D "ARCH=3Darm64"
-EXTRA_OEMAKE:x86 =3D "ARCH=3Di386"
-EXTRA_OEMAKE:x86-64 =3D "ARCH=3Dx86_64"
-EXTRA_OEMAKE:mips =3D "ARCH=3Dmips"
-EXTRA_OEMAKE:mips64 =3D "ARCH=3Dmips64"
-EXTRA_OEMAKE:riscv64 =3D "ARCH=3Driscv64"
-
-EXTRA_OEMAKE:append:armv7a =3D "${@bb.utils.contains("TUNE_FEATURES","ne=
on",""," USE_NEON=3DNo",d)}"
-EXTRA_OEMAKE:append:armv7ve =3D "${@bb.utils.contains("TUNE_FEATURES","n=
eon",""," USE_NEON=3DNo",d)}"
-
-EXTRA_OEMAKE:append =3D " ENABLEPIC=3DYes"
-do_configure() {
-    :
-}
-
-do_compile() {
-    oe_runmake
-}
-
-do_install() {
-    oe_runmake install DESTDIR=3D${D} PREFIX=3D${prefix} LIBDIR_NAME=3D$=
{baselib} SHAREDLIB_DIR=3D${libdir}
-}
-
-CLEANBROKEN =3D "1"
diff --git a/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.b=
b b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
new file mode 100644
index 0000000000..04e93ce790
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/openh264/openh264_2.5.0.bb
@@ -0,0 +1,20 @@
+SUMMARY =3D "Open Source H.264 Codec"
+DESCRIPTION =3D "OpenH264 is a codec library which supports H.264 encodi=
ng and \
+decoding. It is suitable for use in real time applications such as WebRT=
C."
+HOMEPAGE =3D "http://www.openh264.org/"
+SECTION =3D "libs/multimedia"
+LICENSE =3D "BSD-2-Clause"
+LICENSE_FLAGS =3D "commercial"
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dbb6d3771da6a07d33fd50d4d9aa73=
bcf"
+
+DEPENDS =3D " nasm-native"
+
+inherit meson pkgconfig
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "8c7008aeb6335e7d36ab0d9a023a63f82a8eaac0"
+BRANCH =3D "openh264v${PV}"
+SRC_URI =3D "git://github.com/cisco/openh264.git;protocol=3Dhttps;branch=
=3D${BRANCH}"
+
+COMPATIBLE_MACHINE:powerpc64le =3D "null"
+
--=20
2.47.1


