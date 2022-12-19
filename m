Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BF24C4167B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:12:16 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.21095.1671455527689588664
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 0B8983A95
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:11:23 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7FvO-2FOhA20; Mon, 19 Dec 2022 14:11:22 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 10/10] gnome-software: add recipe
Date: Mon, 19 Dec 2022 14:10:41 +0100
Message-Id: <20221219131041.452949-10-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219131041.452949-1-f_l_k@t-online.de>
References: <20221219131041.452949-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455482-68DE2991-F6773BBE/0/0 CLEAN NORMAL
X-TOI-MSGID: 5fa27c1c-f8e2-4af3-b508-c58c520b68d9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100105

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-software/gnome-software_43.2.bb     | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-software/gnome-softwar=
e_43.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.bb
new file mode 100644
index 000000000..1ac451c62
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.bb
@@ -0,0 +1,46 @@
+SUMMARY =3D "GNOME Software allows users to easily find, discover and in=
stall apps."
+LICENSE =3D "GPL-2.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
+
+GNOMEBASEBUILDCLASS =3D "meson"
+GTKDOC_MESON_OPTION ?=3D "gtk_doc"
+
+inherit gnomebase gsettings itstool gnome-help gtk-icon-cache gtk-doc mi=
me mime-xdg gettext upstream-version-is-even features_check
+
+REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam"
+
+DEPENDS +=3D " \
+	libadwaita \
+	appstream \
+	gdk-pixbuf \
+	gtk4 \
+	libgudev \
+	libxmlb-native \
+	glib-2.0 \
+	glib-2.0-native \
+	libsoup-3.0 \
+	json-glib \
+	polkit \
+	gsettings-desktop-schemas \
+	polkit \
+	libsoup-3.0 \
+	iso-codes \
+"
+
+RDEPENDS:${PN} =3D "iso-codes"
+
+EXTRA_OEMESON +=3D "-Dtests=3Dfalse -Dsoup2=3Dfalse"
+
+SRC_URI[archive.sha256sum] =3D "22aa7f0a317c770f68b897e9e512b2cbedb181b6=
95ffdb0b658d99bbd64f368d"
+
+PACKAGECONFIG ?=3D "flatpak"
+PACKAGECONFIG[flatpak] =3D "-Dflatpak=3Dtrue,-Dflatpak=3Dfalse,flatpak o=
stree"
+PACKAGECONFIG[snap] =3D "-Dsnap=3Dtrue,-Dsnap=3Dfalse,snapd-glib"
+PACKAGECONFIG[gtk_doc] =3D "-Dgtk_doc=3Dtrue,-Dgtk_doc=3Dfalse,libxslt-n=
ative docbook-xsl-stylesheets"
+PACKAGECONFIG[man] =3D "-Dman=3Dtrue,-Dman=3Dfalse,libxslt-native docboo=
k-xsl-stylesheets"
+PACKAGECONFIG[packagekit] =3D "-Dpackagekit=3Dtrue,-Dpackagekit=3Dfalse,=
gnome-packagekit,gnome-packagekit"
+PACKAGECONFIG[fwupd] =3D "-Dfwupd=3Dtrue,-Dfwupd=3Dfalse,fwupd,fwupd"
+PACKAGECONFIG[malcontent] =3D "-Dmalcontent=3Dtrue,-Dmalcontent=3Dfalse,=
malcontent"
+
+FILES:${PN} +=3D "${libdir}gnome-software/libgnomesoftware.so ${datadir}=
"
+INSANE_SKIP:${PN} =3D "dev-so"
--=20
2.34.1


