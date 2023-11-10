Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1B77C4332F
	for <webhook@archiver.kernel.org>; Fri, 10 Nov 2023 11:46:24 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.25591.1699616779728558213
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Nov 2023 03:46:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd89.aul.t-online.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout09.t-online.de (Postfix) with SMTP id 432C15A94
	for <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 12:45:32 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.32.113]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r1Px4-21NTYw0; Fri, 10 Nov 2023 12:45:30 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH 2/4] Gupnp-tools upgrade 0.10.2 -> 0.12.1
Date: Fri, 10 Nov 2023 12:45:44 +0100
Message-ID: <20231110114546.306710-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231110114546.306710-1-f_l_k@t-online.de>
References: <20231110114546.306710-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699616730-4A220820-E82F4BF0/0/0 CLEAN NORMAL
X-TOI-MSGID: 1f1d4539-43cc-4b0b-b417-a467a52b253c
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 10 Nov 2023 11:46:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106540

- switch to soup-3.0

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-build-Fix-wrap-file-syntax.patch     | 56 -------------------
 .../gupnp/gupnp-tools_0.10.2.bb               | 17 ------
 .../gupnp/gupnp-tools_0.12.1.bb               | 19 +++++++
 3 files changed, 19 insertions(+), 73 deletions(-)
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-tool=
s/0001-build-Fix-wrap-file-syntax.patch
 delete mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-tool=
s_0.10.2.bb
 create mode 100644 meta-multimedia/recipes-connectivity/gupnp/gupnp-tool=
s_0.12.1.bb

diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools/0001-=
build-Fix-wrap-file-syntax.patch b/meta-multimedia/recipes-connectivity/g=
upnp/gupnp-tools/0001-build-Fix-wrap-file-syntax.patch
deleted file mode 100644
index 5c13ce0bd..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools/0001-build-F=
ix-wrap-file-syntax.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 4c86f814fbe17eb5774055d69102408bbfc1cd63 Mon Sep 17 00:00:00 2001
-From: Jens Georg <mail@jensge.org>
-Date: Sun, 9 Jul 2023 21:47:48 +0200
-Subject: [PATCH] build: Fix wrap file syntax
-
-No idea why it worked in the first place
-
-Fixes #26
-
-Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gupnp-tools/-/=
commit/1372f9ebe45180d58cefb6c0475fafe77de37ef2]
----
- subprojects/gssdp-1.2.wrap    | 4 ++--
- subprojects/gupnp-1.2.wrap    | 4 ++--
- subprojects/gupnp-av-1.0.wrap | 4 ++--
- 3 files changed, 6 insertions(+), 6 deletions(-)
-
-diff --git a/subprojects/gssdp-1.2.wrap b/subprojects/gssdp-1.2.wrap
-index 34d9b0b..f78d2fa 100644
---- a/subprojects/gssdp-1.2.wrap
-+++ b/subprojects/gssdp-1.2.wrap
-@@ -3,6 +3,6 @@ url =3D https://gitlab.gnome.org/GNOME/gssdp.git
- revision =3D master
- depth =3D 1
- =20
--[provides]
--dependency_name =3D gssdp-1.2
-+[provide]
-+dependency_names =3D gssdp-1.2
-=20
-diff --git a/subprojects/gupnp-1.2.wrap b/subprojects/gupnp-1.2.wrap
-index c345910..f92c055 100644
---- a/subprojects/gupnp-1.2.wrap
-+++ b/subprojects/gupnp-1.2.wrap
-@@ -3,6 +3,6 @@ url =3D https://gitlab.gnome.org/GNOME/gupnp.git
- revision =3D master
- depth =3D 1
- =20
--[provides]
--dependency_name =3D gupnp-1.2
-+[provide]
-+dependency_names =3D gupnp-1.2
-=20
-diff --git a/subprojects/gupnp-av-1.0.wrap b/subprojects/gupnp-av-1.0.wr=
ap
-index 967e6d3..8c3b490 100644
---- a/subprojects/gupnp-av-1.0.wrap
-+++ b/subprojects/gupnp-av-1.0.wrap
-@@ -3,6 +3,6 @@ url =3D https://gitlab.gnome.org/GNOME/gupnp-av.git
- revision =3D master
- depth =3D 1
- =20
--[provides]
--dependency_name =3D gupnp-av-1.0
-+[provide]
-+dependency_names =3D gupnp-av-1.0
-=20
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.=
2.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb
deleted file mode 100644
index 9731ede27..000000000
--- a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.10.2.bb
+++ /dev/null
@@ -1,17 +0,0 @@
-SUMMARY =3D "Tools for GUPnP"
-LICENSE =3D "GPL-2.0-or-later"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe \
-                    file://src/network-light/main.c;beginline=3D1;endlin=
e=3D21;md5=3D2c39b3a000495dabd4932f231c7efed8"
-
-DEPENDS =3D "gupnp gupnp-av gtk+3 glib-2.0-native intltool-native"
-
-inherit features_check meson pkgconfig gettext gtk-icon-cache
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
-
-SRC_URI =3D "http://download.gnome.org/sources/${BPN}/0.10/${BPN}-${PV}.=
tar.xz \
-    file://0001-build-Fix-wrap-file-syntax.patch \
-"
-SRC_URI[sha256sum] =3D "6de49ef4b375b8a164f74b766168b1184e0d28196b6b07a4=
f5341f08dfd85d6c"
-
-RRECOMMENDS:${PN} =3D "adwaita-icon-theme"
diff --git a/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.=
1.bb b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.1.bb
new file mode 100644
index 000000000..4f6ff3fb9
--- /dev/null
+++ b/meta-multimedia/recipes-connectivity/gupnp/gupnp-tools_0.12.1.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "Tools for GUPnP"
+LICENSE =3D "GPL-2.0-or-later"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
+
+DEPENDS =3D "gupnp gssdp  gtk+3 libsoup-3.0 libxml2 glib-2.0 "
+
+inherit gnomebase features_check pkgconfig gettext gtk-icon-cache
+
+ANY_OF_DISTRO_FEATURES =3D "x11 wayland"
+
+SRC_URI[archive.sha256sum] =3D "53cf93123f397e8f8f0b8e9e4364c86a7502a533=
4f4c0be2e054a824478bd5ba"
+
+PACKAGECONFIG ??=3D "av-tools"
+PACKAGECONFIG[av-tools] =3D "-Dav-tools=3Dtrue,-Dav-tools=3Dfalse,gupnp-=
av"
+PACKAGECONFIG[gtksourceview] =3D ",,gtksourceview4"
+
+CFLAGS +=3D "-Wno-deprecated-declarations"
+
+RRECOMMENDS:${PN} =3D "adwaita-icon-theme"
--=20
2.42.0


