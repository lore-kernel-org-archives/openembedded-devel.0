Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1D76C4332F
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 15:30:02 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web10.206167.1672327797322989436
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 29 Dec 2022 07:29:57 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd85.dcpf.telekom.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout11.t-online.de (Postfix) with SMTP id 583F98213
	for <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 16:29:55 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([79.219.226.205]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pAuqu-1MF0wj0; Thu, 29 Dec 2022 16:29:52 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCHv2] gnome-control-center: update 42.0 -> 43.2
Date: Thu, 29 Dec 2022 16:29:46 +0100
Message-Id: <20221229152946.236288-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1672327792-2C8B9EA1-E876EB21/0/0 CLEAN NORMAL
X-TOI-MSGID: 1a96f952-51cb-4f02-b23f-27066346d2ed
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 29 Dec 2022 15:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100302

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...001-Add-meson-option-to-pass-sysroot.patch | 45 -----------------
 ...r_42.0.bb =3D> gnome-control-center_43.2.bb} | 48 ++++++++++---------
 2 files changed, 25 insertions(+), 68 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-control-center/gnome-c=
ontrol-center/0001-Add-meson-option-to-pass-sysroot.patch
 rename meta-gnome/recipes-gnome/gnome-control-center/{gnome-control-cent=
er_42.0.bb =3D> gnome-control-center_43.2.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center/0001-Add-meson-option-to-pass-sysroot.patch b/meta-gnome/recipes-g=
nome/gnome-control-center/gnome-control-center/0001-Add-meson-option-to-p=
ass-sysroot.patch
deleted file mode 100644
index 768ba5439..000000000
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center/=
0001-Add-meson-option-to-pass-sysroot.patch
+++ /dev/null
@@ -1,45 +0,0 @@
-From ba8aebe1259ae3f7f5a4827e5a47bb95c568b218 Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Tue, 21 May 2019 16:07:46 +0200
-Subject: [PATCH] Add meson option to pass sysroot
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-We need to pass this to meson to help it finding gdesktop-enums.h:
-
-| panels/background/meson.build:38:0: ERROR: File /usr/include/gsettings=
-desktop-schemas/gdesktop-enums.h does not exist.
-
-Upstream-Status: Inappropriate [OE specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- meson_options.txt             | 1 +
- panels/background/meson.build | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/meson_options.txt b/meson_options.txt
-index dbca723..af0f871 100644
---- a/meson_options.txt
-+++ b/meson_options.txt
-@@ -1,3 +1,4 @@
-+option('oe_sysroot', type: 'string', value: '', description: 'Directory=
 for OE-sysroot')
- option('documentation', type: 'boolean', value: false, description: 'bu=
ild documentation')
- option('ibus', type: 'boolean', value: true, description: 'build with I=
Bus support')
- option('privileged_group', type: 'string', value: 'wheel', description:=
 'name of group that has elevated permissions')
-diff --git a/panels/background/meson.build b/panels/background/meson.bui=
ld
-index 3634c47..459ccfe 100644
---- a/panels/background/meson.build
-+++ b/panels/background/meson.build
-@@ -25,7 +25,7 @@ common_sources =3D []
-=20
- enums =3D 'gdesktop-enums-types'
- enums_header =3D files(
--  gsettings_desktop_dep.get_pkgconfig_variable('prefix') + '/include/gs=
ettings-desktop-schemas/gdesktop-enums.h',
-+  get_option('oe_sysroot') + gsettings_desktop_dep.get_pkgconfig_variab=
le('prefix') + '/include/gsettings-desktop-schemas/gdesktop-enums.h',
-   'cc-background-item.h'
- )
-=20
---=20
-2.34.1
-
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_42.0.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_43.2.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/gnome-control-center/gnome-control-c=
enter_42.0.bb
rename to meta-gnome/recipes-gnome/gnome-control-center/gnome-control-cen=
ter_43.2.bb
index 6fe999a19..70c58118a 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
42.0.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
43.2.bb
@@ -4,46 +4,48 @@ LICENSE =3D "GPL-2.0-only"
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
-SRC_URI +=3D "file://0001-Add-meson-option-to-pass-sysroot.patch"
+SRC_URI[archive.sha256sum] =3D "d7f256aba80a92c727b329fd01c8602da4b78f0f=
ddaec93fcd91096964700563"
=20
 PACKAGECONFIG ??=3D "ibus ${@bb.utils.filter('DISTRO_FEATURES', 'wayland=
', d)}"
 PACKAGECONFIG[ibus] =3D "-Dibus=3Dtrue, -Dibus=3Dfalse, ibus"
 PACKAGECONFIG[wayland] =3D "-Dwayland=3Dtrue, -Dwayland=3Dfalse, wayland=
"
=20
-EXTRA_OEMESON =3D " \
-    -Doe_sysroot=3D${STAGING_DIR_HOST} \
-"
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
=20
 do_install:append() {
-	# If polkit is setup fixup permissions and ownership
     if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
         chmod 700 ${D}${datadir}/polkit-1/rules.d
         chown polkitd:root ${D}${datadir}/polkit-1/rules.d
--=20
2.34.1


