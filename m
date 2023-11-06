Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD5CAC4167D
	for <webhook@archiver.kernel.org>; Mon,  6 Nov 2023 08:47:18 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web11.49626.1699260437961793895
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Nov 2023 00:47:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout05.t-online.de (Postfix) with SMTP id 1AFB475DA
	for <openembedded-devel@lists.openembedded.org>; Mon,  6 Nov 2023 09:47:06 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.229.73]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qzvGC-4R8o1B0; Mon, 6 Nov 2023 09:47:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] xdg-desktop-portal-gtk: Upgrade 1.14.1 -> 1.15.1
Date: Mon,  6 Nov 2023 09:47:29 +0100
Message-ID: <20231106084729.631892-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1699260424-EF7FDDD2-C6A6A31C/0/0 CLEAN NORMAL
X-TOI-MSGID: 53d18e60-a965-495b-a328-543121d5ac8e
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Nov 2023 08:47:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106402

Changes in 1.15.1, 2023-10-21
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

- Fix build of feature-gated portals

Changes in 1.15.0, 2023-10-20
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

- Switch to the Meson build system, and drop Autotools
- Drop most use of private GNOME API; the following portal interfaces
  have been removed:
    - org.freedesktop.impl.portal.Screenshot
    - org.freedesktop.impl.portal.ScreenCast
    - org.freedesktop.impl.portal.RemoteDesktop
    - org.freedesktop.impl.portsl.Background
- Do not add duplicate notifications
- Expose the org.gnome.desktop.calendar settings
- Fix type for org.gnome.desktop.background.picture-uri setting
- Support current_folder in org.freedesktop.impl.portal.FileChooser
- Update list of translatable files
- Translation updates

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../xdg-desktop-portal-gtk_1.14.1.bb          | 42 -------------------
 .../xdg-desktop-portal-gtk_1.15.1.bb          | 30 +++++++++++++
 2 files changed, 30 insertions(+), 42 deletions(-)
 delete mode 100644 meta-gnome/recipes-support/xdg-desktop-portal/xdg-des=
ktop-portal-gtk_1.14.1.bb
 create mode 100644 meta-gnome/recipes-support/xdg-desktop-portal/xdg-des=
ktop-portal-gtk_1.15.1.bb

diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gtk_1.14.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gtk_1.14.1.bb
deleted file mode 100644
index b291991d3..000000000
--- a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gt=
k_1.14.1.bb
+++ /dev/null
@@ -1,42 +0,0 @@
-SUMMARY =3D "A backend implementation for xdg-desktop-portal that is usi=
ng GTK and various pieces of GNOME infrastructure."
-HOMEPAGE =3D "https://github.com/flatpak/xdg-desktop-portal-gtk"
-LICENSE =3D "LGPL-2.1-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
-
-DEPENDS =3D " \
-    glib-2.0-native \
-    gtk+3\
-    xdg-desktop-portal \
-    libadwaita \
-    fontconfig \
-    gsettings-desktop-schemas \
-    gnome-desktop \
-    dconf \
-"
-
-inherit gettext autotools pkgconfig gsettings features_check
-
-REQUIRED_DISTRO_FEATURES =3D "polkit"
-
-SRC_URI =3D "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protoco=
l=3Dhttps;branch=3Dmain"
-
-S =3D "${WORKDIR}/git"
-SRCREV =3D "952005f6a7850a247d286f14838202f506b402b7"
-
-# gdbus-codegen wants to create files in ${B}/src and fails because of m=
issing directory
-do_configure:append() {
-	mkdir -p ${B}/src
-}
-
-# Note: wlroots has its own implementation for screenshot and screencast=
, but
-# you may want to include the according PACKAGECONFIGS for gnome.
-PACKAGECONFIG ?=3D "wallpaper appchooser lockdown"
-
-PACKAGECONFIG[screenshot] =3D "--enable-screenshot,--disable-screenshot,=
gnome-shell"
-PACKAGECONFIG[screencast] =3D "--enable-screencast,--disable-screencast,=
mutter"
-PACKAGECONFIG[wallpaper] =3D "--enable-wallpaper,--disable-wallpaper,gno=
me-desktop"
-PACKAGECONFIG[background] =3D "--enable-background,--disable-background,=
gnome-shell"
-PACKAGECONFIG[appchooser] =3D "--enable-appchooser,--disable-appchooser"
-PACKAGECONFIG[lockdown] =3D "--enable-lockdown,--disable-lockdown"
-
-FILES:${PN} +=3D "${systemd_user_unitdir} ${datadir}"
diff --git a/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-po=
rtal-gtk_1.15.1.bb b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-de=
sktop-portal-gtk_1.15.1.bb
new file mode 100644
index 000000000..0d2b0012c
--- /dev/null
+++ b/meta-gnome/recipes-support/xdg-desktop-portal/xdg-desktop-portal-gt=
k_1.15.1.bb
@@ -0,0 +1,30 @@
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
+    dconf \
+"
+
+inherit gettext meson pkgconfig gsettings features_check
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+SRC_URI =3D "git://github.com/flatpak/xdg-desktop-portal-gtk.git;protoco=
l=3Dhttps;branch=3Dmain"
+
+S =3D "${WORKDIR}/git"
+SRCREV =3D "54003825481c2b48fd0c42355b484469dea12020"
+
+PACKAGECONFIG ?=3D "wallpaper appchooser lockdown settings"
+
+PACKAGECONFIG[wallpaper] =3D "-Dwallpaper=3Denabled,-Dwallpaper=3Ddisabl=
ed,gnome-desktop"
+PACKAGECONFIG[settings] =3D "-Dsettings=3Denabled,-Dsettings=3Ddisabled,=
gsettings-desktop-schemas fontconfig"
+PACKAGECONFIG[appchooser] =3D "-Dappchooser=3Denabled,-Dappchooser=3Ddis=
abled"
+PACKAGECONFIG[lockdown] =3D "-Dlockdown=3Denabled,-Dlockdown=3Ddisabled"
+
+FILES:${PN} +=3D "${systemd_user_unitdir} ${datadir}"
--=20
2.42.0


