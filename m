Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F40C54EBE
	for <webhook@archiver.kernel.org>; Sun,  8 Jan 2023 13:08:01 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.web11.44275.1673183279610875665
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 08 Jan 2023 05:07:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout03.t-online.de (Postfix) with SMTP id 323401C8C2
	for <openembedded-devel@lists.openembedded.org>; Sun,  8 Jan 2023 14:07:56 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.124]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pEVP0-43c1Z40; Sun, 8 Jan 2023 14:07:54 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 2/5] eog: add recipe
Date: Sun,  8 Jan 2023 14:07:40 +0100
Message-Id: <20230108130743.983639-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108130743.983639-1-f_l_k@t-online.de>
References: <20230108130743.983639-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1673183274-F2FF5ECF-F16ECBAB/0/0 CLEAN NORMAL
X-TOI-MSGID: f8d5ac16-6eef-44f9-86a3-2a5580335707
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 08 Jan 2023 13:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100441

Add eyeofgnome as it is a good image viewer

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-gnome/recipes-gnome/eog/eog_43.1.bb | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/eog/eog_43.1.bb

diff --git a/meta-gnome/recipes-gnome/eog/eog_43.1.bb b/meta-gnome/recipe=
s-gnome/eog/eog_43.1.bb
new file mode 100644
index 000000000..24701bcb3
--- /dev/null
+++ b/meta-gnome/recipes-gnome/eog/eog_43.1.bb
@@ -0,0 +1,30 @@
+SUMMARY =3D "This is the Eye of GNOME, an image viewer program."
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+DEPENDS =3D " \
+    librsvg \
+    gnome-desktop \
+    gsettings-desktop-schemas \
+    gdk-pixbuf \
+    gtk+3 \
+    libhandy \
+    libpeas \
+    libportal \
+    libexif \
+    lcms \
+"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+
+inherit gnomebase pkgconfig gsettings gobject-introspection gettext mime=
-xdg features_check gtk-icon-cache
+
+REQUIRED_DISTRO_FEATURES =3D "opengl"
+
+SRC_URI[archive.sha256sum] =3D "fed79ff3ca19bac62f27155c9bdd69eef875870b=
971e6dcb0aa38c093d131971"
+
+GTKDOC_MESON_OPTION =3D "gtk_doc"
+
+EXTRA_OEMESON =3D "-Dxmp=3Dfalse"
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


