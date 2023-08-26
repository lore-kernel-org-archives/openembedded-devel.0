Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDC1C83F08
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 00:05:22 +0000 (UTC)
Received: from mailout07.t-online.de (mailout07.t-online.de [194.25.134.83])
 by mx.groups.io with SMTP id smtpd.web11.38.1693008313400108706
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Aug 2023 17:05:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.83, mailfrom: f_l_k@t-online.de)
Received: from fwd79.aul.t-online.de (fwd79.aul.t-online.de [10.223.144.105])
	by mailout07.t-online.de (Postfix) with SMTP id 3D52967CD
	for <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 02:04:50 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.172.109]) by fwd79.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qZgnF-2CICvJ0; Sat, 26 Aug 2023 02:04:45 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC[meta-oe][PATCH 1/3] flatpak: allow to build native
Date: Sat, 26 Aug 2023 02:04:31 +0200
Message-ID: <20230826000433.544757-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1693008285-ED7F82E6-D10F8CE8/0/0 CLEAN NORMAL
X-TOI-MSGID: fd89b4cd-7210-4d36-8278-1905bd365223
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 26 Aug 2023 00:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104616

flatpaks dbus-1/interfaces and dbus-1/services files are required
to build xdg-desktop-portal. To avoid having to patch the .pc files
or having to have flatpak installed on the host machine, make
flatpak-native available to other recipes

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-flatpak-pc-add-pc_sysrootdir.patch   | 28 -------------------
 .../flatpak/flatpak_1.15.4.bb                 | 17 +++++------
 2 files changed, 9 insertions(+), 36 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak=
-pc-add-pc_sysrootdir.patch

diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add=
-pc_sysrootdir.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001-flat=
pak-pc-add-pc_sysrootdir.patch
deleted file mode 100644
index c1f2cca5c..000000000
--- a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sys=
rootdir.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 3a1ab02d821cd4b0af44c0dad87e290ebaabef83 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Wed, 14 Dec 2022 06:50:40 +0100
-Subject: [PATCH] flatpak.pc: add pc_sysrootdir
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
-Upstream-Status: Pending
-
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 4a0b865e..5f69b1d9 100644
---- a/meson.build
-+++ b/meson.build
-@@ -509,7 +509,7 @@ pkgconfig_variables +=3D 'exec_prefix=3D${prefix}'
- pkgconfig_variables +=3D 'datadir=3D' + ('${prefix}' / get_option('data=
dir'))
-=20
- pkgconfig_variables +=3D 'datarootdir=3D' + ('${prefix}' / get_option('=
datadir'))
--pkgconfig_variables +=3D 'interfaces_dir=3D${datadir}/dbus-1/interfaces=
/'
-+pkgconfig_variables +=3D 'interfaces_dir=3D${pc_sysrootdir}${datadir}/d=
bus-1/interfaces/'
- pkgconfig_variables +=3D 'httpbackend=3D' + get_option('http_backend')
-=20
- pkgconfig.generate(
---=20
-2.34.1
-
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.4.bb
index f5a726a83..aac972fd3 100644
--- a/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.4.bb
@@ -3,10 +3,7 @@ HOMEPAGE =3D "http://flatpak.org"
 LICENSE =3D "LGPL-2.1-only"
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
=20
-SRC_URI =3D " \
-    gitsm://github.com/flatpak/flatpak;protocol=3Dhttps;nobranch=3D1 \
-    file://0001-flatpak-pc-add-pc_sysrootdir.patch \
-"
+SRC_URI =3D "gitsm://github.com/flatpak/flatpak;protocol=3Dhttps;nobranc=
h=3D1"
=20
 SRCREV =3D "e936e3100d406c50ba49f3ad6a0ecae455345ec0"
=20
@@ -14,7 +11,7 @@ S =3D "${WORKDIR}/git"
=20
 inherit meson pkgconfig gettext systemd gtk-doc gobject-introspection py=
thon3native useradd mime features_check
=20
-REQUIRED_DISTRO_FEATURES =3D "polkit"
+REQUIRED_DISTRO_FEATURES:class-target =3D "polkit"
=20
 DEPENDS =3D " \
     appstream \
@@ -36,8 +33,9 @@ DEPENDS =3D " \
     xmlto-native \
     zstd \
 "
+DEPENDS:remove:class-native =3D "polkit"
=20
-RDEPENDS:${PN} =3D " \
+RDEPENDS:${PN}:class-target =3D " \
     bubblewrap \
     ca-certificates \
     dconf \
@@ -56,7 +54,7 @@ PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfals=
e,xauth socat-native"
 PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
 PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Denabled,-Dseccomp=3Ddisabled,lib=
seccomp"
=20
-PACKAGECONFIG ?=3D " \
+PACKAGECONFIG:class-target ?=3D " \
     ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xauth', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'seccomp', 'seccomp', '', d)=
} \
 "
@@ -66,8 +64,11 @@ FILES:${PN} +=3D "${libdir} ${datadir}"
 USERADD_PACKAGES =3D "${PN}"
 USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
=20
-do_install:append() {
+do_install:append:class-target() {
     chmod 0700 ${D}/${datadir}/polkit-1/rules.d
     chown polkitd ${D}/${datadir}/polkit-1/rules.d
     chgrp root ${D}/${datadir}/polkit-1/rules.d
 }
+
+EXTRA_OEMESON:class-native +=3D "-Dsystem_helper=3Ddisabled"
+BBCLASSEXTEND =3D "native"
--=20
2.41.0


