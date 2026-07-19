Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05761C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 14:46:55 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6413.1784472404498519934
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 07:46:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=ubQQTjZ+;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd70.aul.t-online.de (fwd70.aul.t-online.de [10.223.144.96])
	by mailout10.t-online.de (Postfix) with SMTP id 7E1CD37E66
	for <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 16:46:42 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.166.191]) by fwd70.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wlSmt-1X9TG50; Sun, 19 Jul 2026 16:46:39 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] protobuf: update 6.33.1 -> 35.1
Date: Sun, 19 Jul 2026 16:46:31 +0200
Message-ID: <20260719144631.1408576-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1784472399-9DFF898F-B64BB921/0/0 CLEAN NORMAL
X-TOI-MSGID: 3dee3523-ef13-4000-ac63-cb1b95f1a238
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1784472402; i=f_l_k@t-online.de;
	bh=fqqi0hfpb/SidUuixfhaq97shVG7rSY6uJeUYGB2eJk=;
	h=From:To:Subject:Date;
	b=ubQQTjZ+gmMJKwAsPkjl/6aykmc6C4UcukLa1uXkt70E7ELWotzy119x93anmHWA4
	 q+hyNpBL0D1blF3lMXCwwTWgzG2aT3sUL5chyzX7ZcQ0cnwS20cL8hbtKHNdWMH4x7
	 KGJRHmA67EeXBNRn3pCpN7P19CPUp7jUPz8ekpYJEVAGyeBBnCKB3P4kFs5TTL1EiT
	 +J9ejnjqZGI9SdKJrf/5dr2lFAOh+tHSgHWZAgA8Nmsb0/voqiX9N4P8cR/oG2ws0p
	 jl3E/MrvGppV3IKPzYD1Lcrk0UspKS6Gliz0gHDc2AGfBgjTWaxjvI5Wtub/oHL/ia
	 /OX/VU4iCqBUA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 14:46:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128259

    - Remove PROTOC_VERSION. It now matches PV
    - Adjust PROTOC_BRANCH
    - Do not build with a custom configuration for protobuf-native; in pa=
rticular, do not build shared libraries
    - protobuf-native only needs to provide the binaries. Do not package =
the library and includes to
      avoid potential linking failures
---
 .../{protobuf_6.33.6.bb =3D> protobuf_35.1.bb}  | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-devtools/protobuf/{protobuf_6.33.6.bb =3D> protob=
uf_35.1.bb} (92%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb b/meta-=
oe/recipes-devtools/protobuf/protobuf_35.1.bb
similarity index 92%
rename from meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
index 880dd82b1d..dd3f364de2 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_6.33.6.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_35.1.bb
@@ -10,21 +10,20 @@ LIC_FILES_CHKSUM =3D " \
     file://third_party/utf8_range/LICENSE;md5=3Dd4974d297231477b2ff507c3=
5d61c13c \
 "
=20
-PROTOC_VERSION =3D "v${@d.getVar('PV').split('.', 1)[1]}"
-PROTOC_BRANCH =3D "${@d.getVar('PV').split('.', 2)[1]}.x"
+PROTOC_BRANCH =3D "${@d.getVar('PV').split('.')[0]}.x"
=20
 DEPENDS =3D "zlib abseil-cpp jsoncpp"
 DEPENDS:append:class-target =3D " protobuf-native"
=20
-SRCREV =3D "6e1998413a5bca7c058b85999667893f167434bc"
+SRCREV =3D "35cd01f9fe9afbeea38cc7b979a3b6bfcde82c03"
=20
-SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D${PR=
OTOC_BRANCH};protocol=3Dhttps;tag=3D${PROTOC_VERSION} \
+SRC_URI =3D "git://github.com/protocolbuffers/protobuf.git;branch=3D${PR=
OTOC_BRANCH};protocol=3Dhttps;tag=3Dv${PV} \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-f=
ix-.patch \
            file://0001-fix-protobuf-native-build-failure-with-gcc-10.pat=
ch \
            "
=20
-UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d\.\d+\.\d+)"
+UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>\d\.\d+)"
=20
 CVE_PRODUCT =3D "google:protobuf protobuf:protobuf google-protobuf proto=
buf-cpp"
=20
@@ -39,7 +38,7 @@ PACKAGECONFIG:class-nativesdk ?=3D "compiler"
 PACKAGECONFIG[python] =3D ",,"
 PACKAGECONFIG[compiler] =3D "-Dprotobuf_BUILD_PROTOC_BINARIES=3DON,-Dpro=
tobuf_BUILD_PROTOC_BINARIES=3DOFF"
=20
-EXTRA_OECMAKE +=3D "\
+EXTRA_OECMAKE:class-target =3D "\
     -Dprotobuf_BUILD_SHARED_LIBS=3DON \
     -Dprotobuf_BUILD_LIBPROTOC=3DON \
     -Dprotobuf_BUILD_TESTS=3DOFF \
@@ -100,6 +99,14 @@ do_compile_ptest() {
 	export PKG_CONFIG_SYSROOT_DIR=3D$save_pkg_config_sysroot_dir
 }
=20
+do_install:append:class-native() {
+    rm -rf ${D}${libdir} ${D}${includedir}
+}
+
+do_install:append:class-nativesdk() {
+    rm -rf ${D}${libdir} ${D}${includedir}
+}
+
 do_install_ptest() {
 	local olddir=3D`pwd`
=20
--=20
2.55.0


