Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6CC7C4332F
	for <webhook@archiver.kernel.org>; Tue, 29 Nov 2022 06:57:15 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.143160.1669705031933729759
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Nov 2022 22:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout11.t-online.de (Postfix) with SMTP id E1561E952
	for <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 07:57:09 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.163]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1ozuY9-3ii2420; Tue, 29 Nov 2022 07:57:02 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/7] amtk: update 5.3.1 -> 5.6.1
Date: Tue, 29 Nov 2022 07:56:38 +0100
Message-Id: <20221129065643.82373-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129065643.82373-1-f_l_k@t-online.de>
References: <20221129065643.82373-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1669705022-08E92417-29DCDA9E/0/0 CLEAN NORMAL
X-TOI-MSGID: 7db7c8e6-cc67-4076-8000-8efe2cb17220
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 29 Nov 2022 06:57:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99839

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb | 18 ------------------
 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb | 21 +++++++++++++++++++++
 2 files changed, 21 insertions(+), 18 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb
 create mode 100644 meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb

diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb b/meta-gnome/rec=
ipes-gnome/amtk/amtk_5.3.1.bb
deleted file mode 100644
index f6d8739da..000000000
--- a/meta-gnome/recipes-gnome/amtk/amtk_5.3.1.bb
+++ /dev/null
@@ -1,18 +0,0 @@
-SUMMARY =3D "Actions, Menus and Toolbars Kit"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    gtk+3 \
-"
-
-GNOMEBASEBUILDCLASS =3D "meson"
-
-GIR_MESON_OPTION =3D ""
-
-inherit gnomebase gettext features_check gobject-introspection
-
-ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
-
-SRC_URI[archive.sha256sum] =3D "d5aa236c5d71dc41aa4674f345560a67a27f21c0=
efc97c9b3da09cb582b4638b"
diff --git a/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb b/meta-gnome/rec=
ipes-gnome/amtk/amtk_5.6.1.bb
new file mode 100644
index 000000000..8cb2fa79b
--- /dev/null
+++ b/meta-gnome/recipes-gnome/amtk/amtk_5.6.1.bb
@@ -0,0 +1,21 @@
+SUMMARY =3D "Actions, Menus and Toolbars Kit"
+LICENSE =3D "LGPL-3.0-or-later"
+LIC_FILES_CHKSUM =3D "file://LICENSES/LGPL-3.0-or-later.txt;md5=3Dc51d3e=
ef3be114124d11349ca0d7e117"
+
+DEPENDS =3D " \
+    glib-2.0-native \
+    gtk+3 \
+    gtk-doc-native \
+    libxslt-native \
+    docbook-xsl-stylesheets-native \
+"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+GIR_MESON_OPTION =3D ""
+
+inherit gnomebase gettext features_check gobject-introspection
+
+ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
+
+SRC_URI[archive.sha256sum] =3D "d50115b85c872aac296934b5ee726a3fa156c6f5=
ad96d27e0edd0aa5ad173228"
--=20
2.34.1


