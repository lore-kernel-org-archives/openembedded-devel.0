Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EE99C3DA4A
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 08:29:49 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.93336.1723624185685352569
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 01:29:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd87.aul.t-online.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout09.t-online.de (Postfix) with SMTP id C77183F019
	for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 10:28:57 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.175.216]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1se9NB-03h3jt0; Wed, 14 Aug 2024 10:28:49 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-oe][PATCH] cleanup after polkit fix
Date: Wed, 14 Aug 2024 10:30:09 +0200
Message-ID: <20240814083009.2666156-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1723624129-EEFFA9CF-CC9E8FEA/0/0 CLEAN NORMAL
X-TOI-MSGID: 287ec34d-82f2-458b-ac06-43b016d78e4d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 08:29:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111799

This commit removes the need to fix polkit permissions:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3Dd5e90541f8e35916abc930b2da6de037b23d51a1

That allows to do some cleanup
---
 .../gnome-remote-desktop_46.2.bb                    | 12 +-----------
 .../gnome-control-center_46.2.bb                    | 12 +-----------
 meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb        | 11 +----------
 .../recipes-connectivity/blueman/blueman_2.4.3.bb   | 11 +----------
 meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb           | 13 +------------
 meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb  | 11 +----------
 meta-oe/recipes-gnome/malcontent/malcontent.bb      | 11 +----------
 meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb | 13 +------------
 8 files changed, 8 insertions(+), 86 deletions(-)

diff --git a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-=
remote-desktop/gnome-remote-desktop_46.2.bb b/meta-gnome/dynamic-layers/m=
eta-security/recipes-gnome/gnome-remote-desktop/gnome-remote-desktop_46.2=
.bb
index 59ae9383d..a16a02aa7 100644
--- a/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_46.2.bb
+++ b/meta-gnome/dynamic-layers/meta-security/recipes-gnome/gnome-remote-=
desktop/gnome-remote-desktop_46.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fc=
e4486a80fdaf4a4263"
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase gettext gsettings features_check useradd
+inherit gnomebase gettext gsettings features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "opengl polkit"
=20
@@ -36,15 +36,5 @@ PACKAGECONFIG[vnc] =3D "-Dvnc=3Dtrue,-Dvnc=3Dfalse,lib=
vncserver"
 PACKAGECONFIG[rdp] =3D "-Drdp=3Dtrue,-Drdp=3Dfalse,freerdp3 fuse3 libxkb=
common"
 PACKAGECONFIG[systemd] =3D "-Dsystemd=3Dtrue,-Dsystemd=3Dfalse,systemd"
=20
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
-
-do_install:append() {
-    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
-        chmod 700 ${D}${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-    fi
-}
-
 PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
 FILES:${PN} +=3D "${systemd_user_unitdir} ${systemd_system_unitdir} ${da=
tadir} ${libdir}/sysusers.d ${libdir}/tmpfiles.d"
diff --git a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-=
center_46.2.bb b/meta-gnome/recipes-gnome/gnome-control-center/gnome-cont=
rol-center_46.2.bb
index 152e803b5..ae96caf94 100644
--- a/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.2.bb
+++ b/meta-gnome/recipes-gnome/gnome-control-center/gnome-control-center_=
46.2.bb
@@ -33,7 +33,7 @@ DEPENDS =3D " \
     upower \
 "
=20
-inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-ve=
rsion-is-even bash-completion features_check useradd
+inherit gtk-icon-cache pkgconfig gnomebase gsettings gettext upstream-ve=
rsion-is-even bash-completion features_check
=20
 REQUIRED_DISTRO_FEATURES +=3D "opengl polkit pulseaudio systemd x11"
=20
@@ -52,16 +52,6 @@ EXTRA_OEMESON +=3D "-Doe_sysroot=3D${STAGING_DIR_HOST}=
"
=20
 export XDG_DATA_DIRS =3D "${STAGING_DATADIR}"
=20
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
-
-do_install:append() {
-    if [ -d ${D}${datadir}/polkit-1/rules.d ]; then
-        chmod 700 ${D}${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-    fi
-}
-
 PACKAGE_DEBUG_SPLIT_STYLE =3D "debug-without-src"
=20
 FILES:${PN} +=3D " \
diff --git a/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb b/meta-gnome/re=
cipes-gnome/gvfs/gvfs_1.54.0.bb
index 01cdb4eef..6549b1900 100644
--- a/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
+++ b/meta-gnome/recipes-gnome/gvfs/gvfs_1.54.0.bb
@@ -2,7 +2,7 @@ DESCRIPTION =3D "gvfs is a userspace virtual filesystem"
 LICENSE =3D "LGPL-2.0-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D05df38dd77c35ec8431f212410a33=
29e"
=20
-inherit gnomebase gsettings bash-completion gettext upstream-version-is-=
even features_check useradd
+inherit gnomebase gsettings bash-completion gettext upstream-version-is-=
even features_check
=20
 DEPENDS +=3D "\
     dbus \
@@ -77,16 +77,7 @@ PACKAGECONFIG[fuse] =3D "-Dfuse=3Dtrue, -Dfuse=3Dfalse=
, fuse3"
 # libcdio-paranoia recipe doesn't exist yet
 PACKAGECONFIG[cdda] =3D "-Dcdda=3Dtrue, -Dcdda=3Dfalse, libcdio-paranoia=
"
=20
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
-
 do_install:append() {
-    if ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'true', 'false'=
, d)}; then
-        # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
-        chmod 700 ${D}${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}${datadir}/polkit-1/rules.d
-    fi
-
     # After rebuilds (not from scracth) it can happen that the executabl=
es in
     # libexec ar missing executable permission flag. Not sure but it cam=
e up
     # during transition to meson. Looked into build files and logs but c=
ould
diff --git a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.b=
b b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
index df2a226f0..766903519 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_2.4.3.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dd32239bcb67346=
3ab874e80d47fae504"
=20
 DEPENDS =3D "gtk+3 glib-2.0 bluez5 python3-pygobject python3-cython-nati=
ve"
=20
-inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache useradd features_check
+inherit meson gettext systemd gsettings pkgconfig python3native gtk-icon=
-cache features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
=20
@@ -56,12 +56,3 @@ do_install:append() {
                                               ${D}${bindir}/blueman-serv=
ices \
                                               ${D}${bindir}/blueman-tray
 }
-
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-        # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-}
diff --git a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb b/meta-oe/recipes-=
bsp/fwupd/fwupd_1.9.22.bb
index d9059daa5..4e131f61f 100644
--- a/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
+++ b/meta-oe/recipes-bsp/fwupd/fwupd_1.9.22.bb
@@ -14,7 +14,7 @@ UPSTREAM_CHECK_REGEX =3D "(?P<pver>\d+(\.\d+)+)"
 # Machine-specific as we examine MACHINE_FEATURES to decide whether to b=
uild the UEFI plugins
 PACKAGE_ARCH =3D "${MACHINE_ARCH}"
=20
-inherit meson vala gobject-introspection systemd bash-completion pkgconf=
ig gi-docgen ptest manpages useradd
+inherit meson vala gobject-introspection systemd bash-completion pkgconf=
ig gi-docgen ptest manpages
=20
 GIDOCGEN_MESON_OPTION =3D 'docs'
 GIDOCGEN_MESON_ENABLE_FLAG =3D 'enabled'
@@ -116,17 +116,6 @@ DISABLE_NON_X86:x86 =3D ""
 DISABLE_NON_X86:x86-64 =3D ""
 PACKAGECONFIG:remove =3D "${DISABLE_NON_X86}"
=20
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', =
d)}; then
-        #Fix up permissions on polkit rules.d to work with rpm4 constrai=
nts
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-    fi
-}
-
 FILES:${PN} +=3D "${libdir}/fwupd-plugins-* \
                 ${libdir}/fwupd-${PV} \
                 ${systemd_unitdir} \
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.9.bb
index e4b130741..f8d211236 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.9.bb
@@ -12,7 +12,7 @@ SRCREV =3D "b026910d1c18900e9daf07c429f7e901eb1c3f20"
=20
 S =3D "${WORKDIR}/git"
=20
-inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native useradd mime features_check
+inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native mime features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "polkit"
=20
@@ -76,12 +76,3 @@ EXTRA_OEMESON =3D " \
 "
=20
 FILES:${PN} +=3D "${libdir} ${datadir}"
-
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
-
-do_install:append() {
-    chmod 0700 ${D}/${datadir}/polkit-1/rules.d
-    chown polkitd ${D}/${datadir}/polkit-1/rules.d
-    chgrp root ${D}/${datadir}/polkit-1/rules.d
-}
diff --git a/meta-oe/recipes-gnome/malcontent/malcontent.bb b/meta-oe/rec=
ipes-gnome/malcontent/malcontent.bb
index c4bc50fa8..b30d85080 100644
--- a/meta-oe/recipes-gnome/malcontent/malcontent.bb
+++ b/meta-oe/recipes-gnome/malcontent/malcontent.bb
@@ -17,7 +17,7 @@ DEPENDS =3D " \
=20
 GIR_MESON_OPTION =3D ""
=20
-inherit  meson pkgconfig gobject-introspection gettext features_check us=
eradd
+inherit  meson pkgconfig gobject-introspection gettext features_check
=20
 REQUIRED_DISTRO_FEATURES =3D "pam polkit gobject-introspection"
=20
@@ -26,15 +26,6 @@ PACKAGECONFIG[ui] =3D ",,,malcontent-ui"
=20
 EXTRA_OEMESON =3D "-Dui=3Ddisabled"
=20
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-        # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-}
-
 FILES:${PN} +=3D " \
 	${libdir}/security/pam_malcontent.so \
 	${datadir}/accountsservice \
diff --git a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb b/meta-o=
e/recipes-navigation/geoclue/geoclue_2.7.1.bb
index 9fcd1e6f1..5d247fb9c 100644
--- a/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
+++ b/meta-oe/recipes-navigation/geoclue/geoclue_2.7.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dbdfdd4986a08=
53eb84eeba85f9d0c4d6"
=20
 DEPENDS =3D "glib-2.0 dbus json-glib libsoup-3.0 intltool-native"
=20
-inherit meson pkgconfig gtk-doc gobject-introspection vala useradd
+inherit meson pkgconfig gtk-doc gobject-introspection vala
=20
 SRCREV =3D "8a24f60969d4c235d9918796c38a6a9c42e10131"
 SRC_URI =3D "git://gitlab.freedesktop.org/geoclue/geoclue.git;protocol=3D=
https;branch=3Dmaster \
@@ -36,17 +36,6 @@ EXTRA_OEMESON +=3D " \
     -Ddbus-sys-dir=3D${sysconfdir}/dbus-1/system.d \
 "
=20
-USERADD_PACKAGES =3D "${PN}"
-USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 --shell /bin/nologin polkitd"
-
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'modem-gps', 'true', 'false=
', d)}; then
-        # Fix up permissions on polkit rules.d to work with rpm4 constra=
ints
-        chmod 700 ${D}/${datadir}/polkit-1/rules.d
-        chown polkitd:root ${D}/${datadir}/polkit-1/rules.d
-    fi
-}
-
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1/system-services \
     ${datadir}/polkit-1/rules.d \
--=20
2.45.2


