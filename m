Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C13C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 15:00:32 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web12.11330.1647529230456724016
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 08:00:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.20,
 mailfrom: f_l_k@t-online.de)
Received: from fwd83.dcpf.telekom.de (fwd83.aul.t-online.de [10.223.144.109])
	by mailout08.t-online.de (Postfix) with SMTP id A6C6643DC
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Mar 2022 15:59:48 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.47.192]) by fwd83.t-online.de
	with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
	esmtp id 1nUrbP-2QtRvV0; Thu, 17 Mar 2022 15:59:48 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH] perfetto: initial add commit
Date: Thu, 17 Mar 2022 15:59:37 +0100
Message-Id: <20220317145937.217432-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1647529188-0000EDC4-262363D4/0/0 CLEAN NORMAL
X-TOI-MSGID: e5a3a64f-5217-4a5d-a233-a7f51211a963
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Mar 2022 15:00:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96038

mesa 22.0.0 supports profiling GPU acceleration using google perfetto

This adds a recipe for it

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...meson.build-add-pc-file-build-shared.patch | 45 +++++++++++++++++++
 .../recipes-devtools/perfetto/perfetto_git.bb | 28 ++++++++++++
 2 files changed, 73 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto/0001-meson=
.build-add-pc-file-build-shared.patch
 create mode 100644 meta-oe/recipes-devtools/perfetto/perfetto_git.bb

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto/0001-meson.build-=
add-pc-file-build-shared.patch b/meta-oe/recipes-devtools/perfetto/perfet=
to/0001-meson.build-add-pc-file-build-shared.patch
new file mode 100644
index 000000000..46e3ec9ec
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto/0001-meson.build-add-pc-=
file-build-shared.patch
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
diff --git a/meta-oe/recipes-devtools/perfetto/perfetto_git.bb b/meta-oe/=
recipes-devtools/perfetto/perfetto_git.bb
new file mode 100644
index 000000000..07b1a0b4b
--- /dev/null
+++ b/meta-oe/recipes-devtools/perfetto/perfetto_git.bb
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
--=20
2.25.1


