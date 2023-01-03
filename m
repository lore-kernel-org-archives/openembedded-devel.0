Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8B93C53210
	for <webhook@archiver.kernel.org>; Tue,  3 Jan 2023 14:34:11 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.64600.1672756448399137111
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 03 Jan 2023 06:34:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd88.dcpf.telekom.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout01.t-online.de (Postfix) with SMTP id AAD791C7D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  3 Jan 2023 15:34:06 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.228.243]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pCiMg-1wj1G50; Tue, 3 Jan 2023 15:34:06 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH] xdg-desktop-portal-gtk: add recipe
Date: Tue,  3 Jan 2023 15:33:54 +0100
Message-Id: <20230103143354.97830-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672756446-E38B1E65-7F88D4DF/0/0 CLEAN NORMAL
X-TOI-MSGID: e89a2c70-3a89-42f5-be6a-761b941d55d5
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 03 Jan 2023 14:34:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100364

 - add it as denpendency for xdg-desktop-portal-gnome

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal-gnome_43.1.bb          |  3 ++
 .../xdg-desktop-portal-gtk_1.14.1.bb          | 42 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta-gnome/recipes-support/xdg-desktop-portal/xdg-des=
ktop-portal-gtk_1.14.1.bb

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gnome_43.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gnome_43.1.bb
index a1532c24c..050ce1a04 100644
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_43.1.bb
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gn=
ome_43.1.bb
@@ -7,6 +7,7 @@ DEPENDS =3D " \
     glib-2.0-native \
     gtk4\
     xdg-desktop-portal \
+    xdg-desktop-portal-gtk \
     libadwaita \
     fontconfig \
     gsettings-desktop-schemas \
@@ -14,6 +15,8 @@ DEPENDS =3D " \
     dconf \
 "
=20
+RDEPENDS:${PN} =3D "xdg-desktop-portal xdg-desktop-portal-gtk"
+
 inherit meson pkgconfig gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gtk_1.14.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gtk_1.14.1.bb
new file mode 100644
index 000000000..79597cb94
--- /dev/null
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gt=
k_1.14.1.bb
@@ -0,0 +1,42 @@
+SUMMARY =3D "A backend implementation for xdg-desktop-portal that is usi=
ng GTK and various pieces of GNOME infrastructure."
+HOMEPAGE =3D "https://github.com/flatpak/xdg-desktop-portal-gtk"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+DEPENDS =3D " \
+    glib-2.0-native \
+    gtk+3\
+    xdg-desktop-portal \
+    libadwaita \
+    fontconfig \
+    gsettings-desktop-schemas \
+    gnome-desktop \
+    dconf \
+"
+
+inherit gettext autotools pkgconfig gsettings features_check
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+SRC_URI =3D "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protoco=
l=3Dhttps;nobranch=3D1"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "952005f6a7850a247d286f14838202f506b402b7"
+
+# gdbus-codegen wants to create files in ${B}/src and fails because of m=
issing directory
+do_configure:append() {
+	mkdir -p ${B}/src
+}
+
+# Note: wlroots has its own implementation for screenshot and screencast=
, but
+# you may want to include the according PACKAGECONFIGS for gnome.
+PACKAGECONFIG ?=3D "wallpaper background appchooser lockdown"
+
+PACKAGECONFIG[screenshot] =3D "--enable-screenshot,--disable-screenshot,=
gnome-shell"
+PACKAGECONFIG[screencast] =3D "--enable-screencast,--disable-screencast,=
mutter"
+PACKAGECONFIG[wallpaper] =3D "--enable-wallpaper,--disable-wallpaper,gno=
me-desktop"
+PACKAGECONFIG[background] =3D "--enable-background,--disable-background,=
gnome-shell"
+PACKAGECONFIG[appchooser] =3D "--enable-appchooser,--disable-appchooser"
+PACKAGECONFIG[lockdown] =3D "--enable-lockdown,--disable-lockdown"
+
+FILES:${PN} +=3D "${systemd_user_unitdir} ${datadir}"
--=20
2.34.1


