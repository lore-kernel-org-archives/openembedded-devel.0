Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6343C3DA78
	for <webhook@archiver.kernel.org>; Sun, 15 Jan 2023 17:49:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web11.145388.1673804932262540373
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 15 Jan 2023 09:48:52 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd89.dcpf.telekom.de (fwd89.aul.t-online.de [10.223.144.115])
	by mailout10.t-online.de (Postfix) with SMTP id 6A4A51569C
	for <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 18:48:50 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.227.227]) by fwd89.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pH77i-2eZUkz0; Sun, 15 Jan 2023 18:48:50 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 1/5] gnome-chess: import recipe
Date: Sun, 15 Jan 2023 18:48:32 +0100
Message-Id: <20230115174836.48582-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-MSGID: 04b98664-1751-4399-8043-d2c900f8d46d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 15 Jan 2023 17:49:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100575

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-chess/gnome-chess_43.1.bb           | 35 +++++++++++++++++++
 .../gnome-chess/gnuchess_6.2.9.bb             | 19 ++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1=
.bb
 create mode 100644 meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.b=
b

diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb b/m=
eta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
new file mode 100644
index 000000000..643e6befe
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnome-chess_43.1.bb
@@ -0,0 +1,35 @@
+SUMMARY =3D "GNOME Chess is a 2D chess game, where games can be played b=
etween a combination of human and computer players."
+HOMEPAGE =3D "https://wiki.gnome.org/Apps/Chess"
+LICENSE =3D "GPL-3.0-only"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data opengl"
+
+GTKIC_VERSION =3D "4"
+
+DEPENDS =3D " \
+    appstream-glib-native \
+    cairo \
+    desktop-file-utils-native \
+    glib-2.0 \
+    glib-2.0 \
+    gtk4 \
+    libadwaita \
+    librsvg \
+    pango \
+"
+
+RRECOMMENDS:${PN}  =3D "gnuchess"
+
+SRC_URI =3D "git://github.com/GNOME/gnome-chess.git;protocol=3Dhttps;nob=
ranch=3D1"
+
+inherit meson pkgconfig gobject-introspection gtk-icon-cache vala featur=
es_check mime-xdg gsettings
+
+GIR_MESON_OPTION =3D ""
+
+S =3D "${WORKDIR}/git"
+PV =3D "43.1"
+SRCREV =3D "95c7fb91daf36014fc1c2a7ec20b7400a21cd316"
+
+FILES:${PN} +=3D "${datadir}"
diff --git a/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb b/met=
a-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
new file mode 100644
index 000000000..8ca40229e
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-chess/gnuchess_6.2.9.bb
@@ -0,0 +1,19 @@
+SUMMARY =3D "GNU Chess is a chess-playing program."
+HOMEPAGE =3D "http://www.gnu.org/software/chess/"
+LICENSE =3D "GPL-3.0-only"
+
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb673463ab874e80d47fae=
504"
+
+SRC_URI =3D "https://git.savannah.gnu.org/cgit/chess.git/snapshot/chess-=
${PV}.tar.gz"
+SRC_URI[sha256sum] =3D "03f9e844ccdd48d20ee49314174404f8b643d83bb8ce9ec9=
d2e6a21f1b6fb9f5"
+
+S =3D "${WORKDIR}/chess-${PV}"
+
+inherit autotools gettext
+
+do_configure:prepend() {
+    touch ${S}/ABOUT-NLS
+    touch ${S}/man/gnuchess.1
+}
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.34.1


