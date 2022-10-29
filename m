Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03804C38A02
	for <webhook@archiver.kernel.org>; Sat, 29 Oct 2022 15:41:59 +0000 (UTC)
Received: from mailout12.t-online.de (mailout12.t-online.de [194.25.134.22])
 by mx.groups.io with SMTP id smtpd.web10.4502.1667058108917160089
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 29 Oct 2022 08:41:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.22, mailfrom: f_l_k@t-online.de)
Received: from fwd73.dcpf.telekom.de (fwd73.aul.t-online.de [10.223.144.99])
	by mailout12.t-online.de (Postfix) with SMTP id 39F6F118F8
	for <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 17:41:46 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.224.130]) by fwd73.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1oonxt-3mkXcP0; Sat, 29 Oct 2022 17:41:41 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-openembedded][PATCH 1/3] gtk-vnc: add recipe
Date: Sat, 29 Oct 2022 17:41:14 +0200
Message-Id: <20221029154116.3128371-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1667058101-2508E98D-A17745A5/0/0 CLEAN NORMAL
X-TOI-MSGID: 11991fac-cff3-47bf-99b2-8cdc5e8b92e2
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 29 Oct 2022 15:41:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99342

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gtk-vnc/gtk-vnc_1.3.1.bb                  | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1=
.bb

diff --git a/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb b/m=
eta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
new file mode 100644
index 000000000..36eb8ca19
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/gtk-vnc/gtk-vnc_1.3.1.bb
@@ -0,0 +1,26 @@
+SUMMARY =3D "A VNC client viewer widget for GTK"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING.LIB;md5=3D4339efb5fd592e45b9e2641de=
9fe734f"
+
+DEPENDS =3D " \
+    gdk-pixbuf \
+    glib-2.0 \
+    gnutls \
+    gtk+3 \
+    libgcrypt \
+    libx11 \
+    zlib \
+"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
+GIR_MESON_OPTION =3D ""
+
+PACKAGECONFIG[pulseaudio] =3D "-Dpulseaudio=3Denabled,-Dpulseaudio=3Ddis=
abled,pulseaudio"
+PACKAGECONFIG[sasl] =3D "-Dsasl=3Denabled,-Dsasl=3Ddisabled,cyrus-sasl"
+
+PACKAGECONFIG ??=3D "pulseaudio sasl"
+
+inherit pkgconfig gnomebase gettext gobject-introspection vala features_=
check
+
+SRC_URI[archive.sha256sum] =3D "512763ac4e0559d0158b6682ca5dd1a3bd633f08=
2f5e4349d7158e6b5f80f1ce"
--=20
2.34.1


