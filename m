Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38EC3C4332F
	for <webhook@archiver.kernel.org>; Sat, 31 Dec 2022 18:22:33 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.47672.1672510949535292971
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Dec 2022 10:22:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id 55AA9E909;
	Sat, 31 Dec 2022 19:22:27 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.27]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pBgUt-40AMYz0; Sat, 31 Dec 2022 19:22:19 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCHv3] gnome-control-center: update 42.0 -> 43.2
Date: Sat, 31 Dec 2022 19:22:12 +0100
Message-Id: <20221231182212.58025-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1672510939-2D8B7EA1-8A523030/0/0 CLEAN NORMAL
X-TOI-MSGID: 515af6b1-fe2b-41ae-ad38-163a8ceacf3b
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Dec 2022 18:22:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100325

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...001-Add-meson-option-to-pass-sysroot.patch |  1 -
 ...r_42.0.bb =3D> gnome-control-center_43.2.bb} | 45 +++++++++++--------
 2 files changed, 26 insertions(+), 20 deletions(-)
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_42.0.bb =3D> gnome-control-center_43.2.bb} (70%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
index 768ba5439..11ad30eda 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
@@ -42,4 +42,3 @@ index 3634c47..459ccfe 100644
 =20
 --=20
 2.34.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_42.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_43.2.bb
similarity index 70%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_43.2.bb
index 6fe999a19..830f3ec68 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
43.2.bb
@@ -4,35 +4,40 @@ LICENSE =3D "GPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D75859989545e37968a99b631ef427=
22e"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
-
-inherit gnomebase gsettings gettext vala upstream-version-is-even bash-c=
ompletion features_check
+GTKIC_VERSION =3D "4"
=20
 DEPENDS =3D " \
-    gdk-pixbuf-native \
-    colord-gtk \
-    udisks2 \
-    upower \
-    polkit \
-    pulseaudio \
     accountsservice \
-    samba \
-    gsettings-desktop-schemas \
-    gnome-settings-daemon \
+    colord-gtk \
+    gcr3 \
+    gdk-pixbuf \
+    glib-2.0 \
+    gnome-bluetooth \
     gnome-desktop \
     gnome-online-accounts \
-    libnma \
-    gnome-bluetooth \
-    grilo \
+    gnome-settings-daemon \
+    gsettings-desktop-schemas \
+    gtk4 \
+    libadwaita \
+    libepoxy \
     libgtop \
-    gsound \
+    libgudev \
+    libnma \
     libpwquality \
-    libadwaita \
+    libxml2 \
+    polkit \
+    pulseaudio \
+    samba \
+    udisks2 \
+    upower \
 "
=20
-REQUIRED_DISTRO_FEATURES +=3D "polkit pulseaudio systemd x11"
+inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-ve=
rsion-is-even bash-completion features_check useradd
+
+REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
-SRC_URI[archive.sha256sum] =3D "0732efa7c4171ce0a0ed4106580b4ce35a57b101=
52c0ea36d239134913777eda"
 SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
+SRC_URI[archive.sha256sum] =3D "d7f256aba80a92c727b329fd01c8602da4b78f0f=
ddaec93fcd91096964700563"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
@@ -42,8 +47,10 @@ EXTRA_OEMESON =3D " \
     -Doe_sysroot=3D${STAGING_DIR_HOST} \
 "
=20
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
+
 do_install:append() {
-	# If polkit is setup fixup permissions and ownership
     if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
         chmod 700 ${D}${datadir}/polkit-1/rules.d
         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
--=20
2.34.1


