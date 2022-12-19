Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2152DC3DA7B
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 13:12:16 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web11.21090.1671455525858395510
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Dec 2022 05:12:06 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd72.dcpf.telekom.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout09.t-online.de (Postfix) with SMTP id 6CCA720732
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 14:11:22 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.163.36.130]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1p7FvN-2FOh9v0; Mon, 19 Dec 2022 14:11:21 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 03/10] flatpak: add recipe
Date: Mon, 19 Dec 2022 14:10:34 +0100
Message-Id: <20221219131041.452949-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221219131041.452949-1-f_l_k@t-online.de>
References: <20221219131041.452949-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1671455482-68DE2991-C514E19B/0/0 CLEAN NORMAL
X-TOI-MSGID: bc0e9166-1fb6-4b3a-ae12-58b9d2966a12
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Dec 2022 13:12:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100101

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-flatpak-pc-add-pc_sysrootdir.patch   | 26 ++++++++
 .../flatpak/flatpak_1.15.1.bb                 | 65 +++++++++++++++++++
 2 files changed, 91 insertions(+)
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak=
-pc-add-pc_sysrootdir.patch
 create mode 100644 meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb

diff --git a/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add=
-pc_sysrootdir.patch b/meta-oe/recipes-extended/flatpak/flatpak/0001-flat=
pak-pc-add-pc_sysrootdir.patch
new file mode 100644
index 000000000..99e9cd23b
--- /dev/null
+++ b/meta-oe/recipes-extended/flatpak/flatpak/0001-flatpak-pc-add-pc_sys=
rootdir.patch
@@ -0,0 +1,26 @@
+From 3a1ab02d821cd4b0af44c0dad87e290ebaabef83 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 14 Dec 2022 06:50:40 +0100
+Subject: [PATCH] flatpak.pc: add pc_sysrootdir
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 4a0b865e..5f69b1d9 100644
+--- a/meson.build
++++ b/meson.build
+@@ -509,7 +509,7 @@ pkgconfig_variables +=3D 'exec_prefix=3D${prefix}'
+ pkgconfig_variables +=3D 'datadir=3D' + ('${prefix}' / get_option('data=
dir'))
+=20
+ pkgconfig_variables +=3D 'datarootdir=3D' + ('${prefix}' / get_option('=
datadir'))
+-pkgconfig_variables +=3D 'interfaces_dir=3D${datadir}/dbus-1/interfaces=
/'
++pkgconfig_variables +=3D 'interfaces_dir=3D${pc_sysrootdir}${datadir}/d=
bus-1/interfaces/'
+ pkgconfig_variables +=3D 'httpbackend=3D' + get_option('http_backend')
+=20
+ pkgconfig.generate(
+--=20
+2.34.1
+
diff --git a/meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb b/meta-oe=
/recipes-extended/flatpak/flatpak_1.15.1.bb
new file mode 100644
index 000000000..b6a619b09
--- /dev/null
+++ b/meta-oe/recipes-extended/flatpak/flatpak_1.15.1.bb
@@ -0,0 +1,65 @@
+DESCRIPTION =3D "Desktop containment framework."
+HOMEPAGE =3D "http://flatpak.org"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4fbd65380cdd255951079008b3645=
16c"
+
+SRC_URI =3D " \
+    gitsm://github.com/flatpak/flatpak;protocol=3Dhttps;nobranch=3D1 \
+    file://0001-flatpak-pc-add-pc_sysrootdir.patch \
+"
+
+SRCREV =3D "47ea3934c0e055605b8dff93edad2136141e48ec"
+
+S =3D "${WORKDIR}/git"
+
+inherit meson pkgconfig gettext systemd gobject-introspection python3nat=
ive useradd mime features_check
+
+REQUIRED_DISTRO_FEATURES =3D "polkit"
+
+DEPENDS =3D " \
+    appstream \
+    bison-native \
+    curl \
+    dconf \
+    fuse3 \
+    gdk-pixbuf \
+    glib-2.0 \
+    gpgme \
+    json-glib \
+    libarchive \
+    libcap \
+    libxslt-native \
+    ostree \
+    polkit \
+    python3-pyparsing-native \
+    xmlto-native \
+"
+
+RDEPENDS:${PN} =3D " \
+    bubblewrap \
+    ca-certificates \
+    dconf \
+    xdg-desktop-portal \
+"
+
+GIR_MESON_OPTION =3D ""
+
+PACKAGECONFIG[tests] =3D "-Dtests=3Dtrue,-Dtests=3Dfalse,xauth"
+PACKAGECONFIG[xauth] =3D "-Dxauth=3Denabled,-Dxauth=3Ddisabled,xauth"
+PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Denabled,-Dseccomp=3Ddisabled,lib=
seccomp"
+
+PACKAGECONFIG ?=3D " \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'xauth', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'security', 'seccomp', '', d=
)} \
+"
+
+FILES:${PN} +=3D "${libdir} ${datadir}"
+
+USERADD_PACKAGES =3D "${PN}"
+USERADD_PARAM:${PN} =3D "--system --no-create-home --user-group --home-d=
ir ${sysconfdir}/polkit-1 polkitd"
+
+do_install:append() {
+        chmod 0700 ${D}/${datadir}/polkit-1/rules.d
+	chown polkitd ${D}/${datadir}/polkit-1/rules.d
+	chgrp root ${D}/${datadir}/polkit-1/rules.d
+}
--=20
2.34.1


