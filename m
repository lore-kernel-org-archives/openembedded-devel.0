Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69EE2C4708E
	for <webhook@archiver.kernel.org>; Fri, 30 Dec 2022 13:13:33 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.17678.1672406012396921186
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 30 Dec 2022 05:13:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd81.dcpf.telekom.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout10.t-online.de (Postfix) with SMTP id 9EAA9E9D
	for <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 14:13:30 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.234.94]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBFCS-0mgTr80; Fri, 30 Dec 2022 14:13:28 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/2] dconf-editor: update 3.38.3 -> 43.0
Date: Fri, 30 Dec 2022 14:13:07 +0100
Message-Id: <20221230131307.615168-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221230131307.615168-1-f_l_k@t-online.de>
References: <20221230131307.615168-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672406008-EF7E87E2-3F241CC0/0/0 CLEAN NORMAL
X-TOI-MSGID: f394b028-3a47-44c9-b8ed-21194b5dd428
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 30 Dec 2022 13:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100312

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...or-meson.build-fix-meson-0.61-errors.patch | 31 -------------------
 .../dconf/dconf-editor_3.38.3.bb              | 17 ----------
 .../recipes-gnome/dconf/dconf-editor_43.0.bb  | 21 +++++++++++++
 3 files changed, 21 insertions(+), 48 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/dconf/dconf-editor/0001-edit=
or-meson.build-fix-meson-0.61-errors.patch
 delete mode 100644 meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
 create mode 100644 meta-gnome/recipes-gnome/dconf/dconf-editor_43.0.bb

diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor/0001-editor-meso=
n.build-fix-meson-0.61-errors.patch b/meta-gnome/recipes-gnome/dconf/dcon=
f-editor/0001-editor-meson.build-fix-meson-0.61-errors.patch
deleted file mode 100644
index 850d8a9d4..000000000
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor/0001-editor-meson.build=
-fix-meson-0.61-errors.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 86379a220a4eb00c309f514d2ca57ed6c1c8b35c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex@linutronix.de>
-Date: Fri, 21 Jan 2022 22:22:58 +0100
-Subject: [PATCH] editor/meson.build: fix meson 0.61 errors
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/dconf-editor/=
-/merge_requests/21]
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- editor/meson.build | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/editor/meson.build b/editor/meson.build
-index 4c89ab99..0eb3bb1a 100644
---- a/editor/meson.build
-+++ b/editor/meson.build
-@@ -1,7 +1,6 @@
- desktop =3D dconf_editor_namespace + '.desktop'
-=20
- i18n.merge_file (
--  desktop,
-   type: 'desktop',
-   input: desktop + '.in',
-   output: desktop,
-@@ -26,7 +25,6 @@ configure_file(
- appdata =3D dconf_editor_namespace + '.appdata.xml'
-=20
- i18n.merge_file(
--  appdata,
-   input: appdata + '.in',
-   output: appdata,
-   po_dir: po_dir,
diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb b/meta=
-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
deleted file mode 100644
index ef26caa14..000000000
--- a/meta-gnome/recipes-gnome/dconf/dconf-editor_3.38.3.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY =3D "Configuration editor for dconf"
-LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
-
-GNOMEBASEBUILDCLASS =3D "meson"
-
-DEPENDS =3D "dconf gtk+3"
-
-inherit gnomebase vala gettext gsettings bash-completion
-
-SRC_URI +=3D " file://0001-editor-meson.build-fix-meson-0.61-errors.patc=
h"
-SRC_URI[archive.sha256sum] =3D "571af4c7dad4f049b53e6cd728b79addf08c27dd=
ab6bc57b396d211866ee79e3"
-
-FILES:${PN} +=3D " \
-    ${datadir}/dbus-1 \
-    ${datadir}/metainfo \
-"
diff --git a/meta-gnome/recipes-gnome/dconf/dconf-editor_43.0.bb b/meta-g=
nome/recipes-gnome/dconf/dconf-editor_43.0.bb
new file mode 100644
index 000000000..5b3764560
--- /dev/null
+++ b/meta-gnome/recipes-gnome/dconf/dconf-editor_43.0.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Configuration editor for dconf"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D1ebbd3e34237af26da5dc08a4e440=
464"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+DEPENDS =3D " \
+    dconf \
+    gtk+3 \
+    glib-2.0 \
+    libhandy\
+"
+
+inherit gnomebase vala gsettings bash-completion pkgconfig gtk-icon-cach=
e
+
+SRC_URI[archive.sha256sum] =3D "935a3c2dd76cc2a93cd5aee9a54d3947fb111eb3=
96f4b63dc5f0ba8f8d099136"
+
+FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
+    ${datadir}/metainfo \
+"
--=20
2.34.1


