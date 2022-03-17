Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D596C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 17:01:52 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web09.170.1647536510975493863
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 10:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd86.dcpf.telekom.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout08.t-online.de (Postfix) with SMTP id C11CD19C93
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 18:01:48 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.192]) by fwd86.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUtVS-4NN4Rl0; Thu, 17 Mar 2022 18:01:46 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCHv2] perfetto: initial add commit
Date: Thu, 17 Mar 2022 17:59:29 +0100
Message-Id: <20220317165929.527418-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647536506-000116DC-66893FF8/0/0 CLEAN NORMAL
X-TOI-MSGID: 9b719bb5-9937-4476-a68d-6381f3c47954
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 17:01:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96040

mesa 22.0.0 supports profiling GPU acceleration using google perfetto

This adds a recipe for it

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...meson.build-add-pc-file-build-shared.patch | 45 +++++++++++++++++
 .../perfetto/libperfetto_24.2.bb              | 28 +++++++++++
 .../perfetto/perfetto_24.2.bb                 | 48 +++++++++++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto/0001-me=
son.build-add-pc-file-build-shared.patch
 create mode 100644 meta-oe/recipes-devtools/perfetto/libperfetto_24.2.bb
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto_24.2.bb

diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson.bui=
ld-add-pc-file-build-shared.patch b/meta-oe/recipes-devtools/perfetto/lib=
perfetto/0001-meson.build-add-pc-file-build-shared.patch
new file mode 100644
index 000000000..46e3ec9ec
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto/0001-meson.build-add-=
pc-file-build-shared.patch
@@ -0,0 +1,45 @@
+From f70ed62ce4a42525c9738455966bec2ed9647568 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 17 Mar 2022 15:44:23 +0100
+Subject: [PATCH] meson.build: add pc file; build shared
+
+---
+ meson.build | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 06015141c..74fe2348f 100644
+--- a/meson.build
++++ b/meson.build
+@@ -19,6 +19,7 @@
+ project(
+     'perfetto',
+     ['c','cpp'],
++    version : '24.2',
+     default_options: ['c_std=3Dc99', 'cpp_std=3Dc++11']
+ )
+=20
+@@ -30,7 +31,7 @@ endif
+=20
+ dep_threads =3D dependency('threads')
+=20
+-lib_perfetto =3D static_library(
++lib_perfetto =3D shared_library(
+     'perfetto',
+     sources: 'sdk/perfetto.cc',
+     dependencies: dep_threads,
+@@ -43,3 +44,11 @@ dep_perfetto =3D declare_dependency(
+     link_with: lib_perfetto,
+     include_directories: inc_perfetto,
+ )
++
++pkgconfig =3D import('pkgconfig')
++pkgconfig.generate(
++    libraries:    lib_perfetto,
++    version:      meson.project_version(),
++    filebase:     meson.project_name(),
++    name:         meson.project_name(),
++    description: 'Perfetto Tracing Tool')
+--=20
+2.25.1
+
diff --git a/meta-oe/recipes-devtools/perfetto/libperfetto_24.2.bb b/meta=
-oe/recipes-devtools/perfetto/libperfetto_24.2.bb
new file mode 100644
index 000000000..07b1a0b4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/libperfetto_24.2.bb
@@ -0,0 +1,28 @@
+SUMMARY =3D "Perfetto - System profiling, app tracing and trace analysis=
"
+HOMEPAGE =3D "https://github.com/google/perfetto"
+BUGTRACKER =3D "https://github.com/google/perfetto/issues"
+LICENSE =3D "Apache-2.0"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df87516e0b698007e9e75a1fe1012b=
390"
+
+SRC_URI =3D " \
+	git://github.com/google/perfetto.git;protocol=3Dhttps;branch=3Dreleases=
/v24.x \
+	file://0001-meson.build-add-pc-file-build-shared.patch \
+"
+
+S =3D "${WORKDIR}/git"
+PV =3D "24.2"
+SRCREV =3D "7cb228c16d69aee297a106ad3ccc7461fa0b8045"
+
+inherit meson
+
+do_install:append() {
+	install -d ${D}${includedir}
+	install -m 0664 ${S}/sdk/perfetto.h ${D}${includedir}
+}
+
+FILES:${PN} =3D "${includedir} ${libdir}"
+FILES:${PN}-dev =3D ""
+
+BBCLASSEXTEND =3D "native nativesdk"
+
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto_24.2.bb b/meta-oe=
/recipes-devtools/perfetto/perfetto_24.2.bb
new file mode 100644
index 000000000..8b056df6b
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto_24.2.bb
@@ -0,0 +1,48 @@
+SUMMARY =3D "Perfetto - System profiling, app tracing and trace analysis=
"
+HOMEPAGE =3D "https://github.com/google/perfetto"
+BUGTRACKER =3D "https://github.com/google/perfetto/issues"
+LICENSE =3D "Apache-2.0"
+
+LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df87516e0b698007e9e75a1fe1012b=
390"
+
+SRC_URI =3D "git://github.com/google/perfetto.git;protocol=3Dhttps;branc=
h=3Dreleases/v24.x"
+
+DEPENDS =3D "gn-native ninja-native git-native curl-native"
+
+S =3D "${WORKDIR}/git"
+PV =3D "24.2"
+SRCREV =3D "7cb228c16d69aee297a106ad3ccc7461fa0b8045"
+
+inherit pkgconfig
+
+GN_ARGS =3D " \
+    build_with_chromium =3D false \
+    is_perfetto_build_generator =3D true \
+    perfetto_build_standalone =3D false \
+    perfetto_build_with_android =3D false \
+    perfetto_build_with_embedder =3D true \
+"
+
+
+OUTPUT_DIR =3D "out/Release"
+B =3D "${S}/${OUTPUT_DIR}"
+
+do_configure() {
+	cd ${S}
+	./tools/install-build-deps
+	gn gen --args=3D'${GN_ARGS}' "${OUTPUT_DIR}"
+}
+
+do_compile() {
+	ninja perfetto
+}
+
+do_install() {
+	install -d ${D}${bindir}
+	for bin in protoc perfetto ipc_plugin cppgen_plugin protozero_plugin; d=
o
+		install -m 0755 ${B}/"$bin" ${D}${bindir}
+	done
+}
+
+BBCLASSEXTEND =3D "native nativesdk"
+do_configure[network] =3D "1"
--=20
2.25.1


