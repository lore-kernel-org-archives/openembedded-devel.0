Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 411B6C4332F
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 03:00:00 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.10353.1671591599367906620
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Dec 2022 18:59:59 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd71.dcpf.telekom.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout11.t-online.de (Postfix) with SMTP id 3387F1C1CE
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 03:59:57 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.46.43]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7pKm-1irhQH0; Wed, 21 Dec 2022 03:59:56 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] gnome-software: add recipe
Date: Wed, 21 Dec 2022 03:59:45 +0100
Message-Id: <20221221025945.33420-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671591596-01604ECF-556AE3E6/0/0 CLEAN NORMAL
X-TOI-MSGID: c7a47862-4bba-475e-b3f2-59a2c699b4d9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Dec 2022 03:00:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100166

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../gnome-software/gnome-software_43.2.bb     | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/gnome-software/gnome-softwar=
e_43.2.bb

diff --git a/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.=
bb b/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.bb
new file mode 100644
index 000000000..183a2d107
--- /dev/null
+++ b/meta-gnome/recipes-gnome/gnome-software/gnome-software_43.2.bb
@@ -0,0 +1,44 @@
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
+	appstream \
+	gdk-pixbuf \
+	glib-2.0 \
+	glib-2.0-native \
+	gsettings-desktop-schemas \
+	gtk4 \
+	iso-codes \
+	json-glib \
+	libadwaita \
+	libgudev \
+	libsoup-3.0 \
+	libxmlb-native \
+	polkit \
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
+FILES:${PN} +=3D "${datadir}"
+FILES:${PN}-dev +=3D "${libdir}/gnome-software/libgnomesoftware.so"
--=20
2.34.1


