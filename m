Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8051.1792577264640540119
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:07:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=AczxBrQ1;
 spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd71.aul.t-online.de (fwd71.aul.t-online.de [10.223.144.97])
	by mailout10.t-online.de (Postfix) with SMTP id 58D7537E3C
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 12:07:40 +0200 (CEST)
Received: from localhost.localdomain ([84.163.40.237]) by fwd71.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xJTEM-0cELaO0; Wed, 21 Oct 2026 12:07:34 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 21/26] gnome-tweaks: upgrade 40.10 -> 49.0
Date: Wed, 21 Oct 2026 12:07:09 +0200
Message-ID: <20261021100717.11068-21-f_l_k@t-online.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261021100717.11068-1-f_l_k@t-online.de>
References: <20261021100717.11068-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1792577254-877FD903-AD660E69/0/0 CLEAN NORMAL
X-TOI-MSGID: 1f07408c-a5c2-4936-b8e0-40061ff96f8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1792577260; i=f_l_k@t-online.de;
	bh=lAItBbk7s+oFhhMPdEyFIJS6Y+3wlRtTKBK5W0TkMc0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=AczxBrQ1u1W01PUdPFm7AeKe2ZY/nkLuZm25WcQYkURehjWfFhSafLtRDCruecpGV
	 +CWlekRvn/3wzPcIRdq7NQfZs3qMb+vejVpXp9ih3c8nuh37KASzWG+GEhZPky1GTn
	 uxOMrZITYtuUjQxe+Rp1mtLy4DVpxvX8/eZYogEPt+uNdmoKlhKceuXYD9hHTNbuOJ
	 fJSb8H0xEwWpXKvq3R7+JMb5BZr/2QEoHU+ciSPvUKC12kqa9huFaB7nIHDDkJiRUL
	 mDpz3Iax8tNC4skL48OL9lxzequwQYfAqYXjkeq6qIyxHYsIitMk7r3Vx17FKDZtjm
	 s4k/W6jCQ1KFQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 21 Oct 2026 10:07:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131251

gnome-tweaks is ported to GTK 4 and libadwaita. Update DEPENDS and
RDEPENDS and package the new D-Bus service file. The python path patch is
dropped: meson installs the python module into the configured
site-packages directory itself.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-Make-python-path-configurable.patch  | 41 -------------------
 ...e-tweaks_40.10.bb =3D> gnome-tweaks_49.0.bb} | 13 ++----
 2 files changed, 4 insertions(+), 50 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/00=
01-Make-python-path-configurable.patch
 rename meta-gnome/recipes-gnome/gnome-tweaks/{gnome-tweaks_40.10.bb =3D>=
 gnome-tweaks_49.0.bb} (70%)

diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0001-Make=
-python-path-configurable.patch b/meta-gnome/recipes-gnome/gnome-tweaks/g=
nome-tweaks/0001-Make-python-path-configurable.patch
deleted file mode 100644
index 733249c7e6..0000000000
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks/0001-Make-python=
-path-configurable.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From db94983c93f38bd8494b47d9fa1b3e5368dc9abe Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Wed, 11 Dec 2019 01:34:01 +0100
-Subject: [PATCH] Make python path configurable
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-Upstream-Status: Inappropriate [Configuration]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- meson.build       | 2 +-
- meson_options.txt | 2 ++
- 2 files changed, 3 insertions(+), 1 deletion(-)
- create mode 100644 meson_options.txt
-
-diff --git a/meson.build b/meson.build
-index 5b824e9..a673d9c 100644
---- a/meson.build
-+++ b/meson.build
-@@ -18,7 +18,7 @@ bindir =3D join_paths(prefix, get_option('bindir'))
- datadir =3D join_paths(prefix, get_option('datadir'))
- libexecdir =3D join_paths(prefix, get_option('libexecdir'))
- localedir =3D join_paths(prefix, get_option('localedir'))
--pythondir =3D join_paths(prefix, python3.get_path('purelib'))
-+pythondir =3D get_option('python_site_dir')
-=20
- pkgdatadir =3D join_paths(datadir, meson.project_name())
-=20
-diff --git a/meson_options.txt b/meson_options.txt
-new file mode 100644
-index 0000000..03455ca
---- /dev/null
-+++ b/meson_options.txt
-@@ -0,0 +1,2 @@
-+option('python_site_dir', type: 'string', value: '')
-+
---=20
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb =
b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_49.0.bb
similarity index 70%
rename from meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
rename to meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_49.0.bb
index 6395a34f85..ebfe8231d6 100644
--- a/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_40.10.bb
+++ b/meta-gnome/recipes-gnome/gnome-tweaks/gnome-tweaks_49.0.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM =3D " \
     file://LICENSES/GPL-3.0;md5=3D9eef91148a9b14ec7f9df333daebc746 \
 "
=20
-DEPENDS =3D "libhandy"
-
+DEPENDS =3D "glib-2.0 gtk4 libadwaita libgudev python3-pygobject gsettin=
gs-desktop-schemas"
=20
 inherit gnomebase gtk-icon-cache gobject-introspection features_check
=20
@@ -17,12 +16,7 @@ REQUIRED_DISTRO_FEATURES =3D "x11 polkit systemd pam"
 REQUIRED_DISTRO_FEATURES +=3D "gobject-introspection-data"
 GIR_MESON_OPTION =3D ""
=20
-SRC_URI[archive.sha256sum] =3D "cffd3b33a399577fbb4491ce8fbd02f54c5924f1=
056f30114e8d420290ef23fc"
-SRC_URI +=3D " \
-    file://0001-Make-python-path-configurable.patch \
-"
-
-EXTRA_OEMESON =3D "-Dpython_site_dir=3D${PYTHON_SITEPACKAGES_DIR}"
+SRC_URI[archive.sha256sum] =3D "b3909bdcb4905b68427d6ab581e01f436dff8e5c=
0a389b1e0b14500f18806ebb"
=20
 # The optimised .pyc files contain buildpaths, delete them and leave the
 # normal ones to be packaged.
@@ -31,8 +25,9 @@ do_install:append() {
 }
=20
 FILES:${PN} +=3D " \
+    ${datadir}/dbus-1 \
     ${datadir}/metainfo \
     ${PYTHON_SITEPACKAGES_DIR} \
 "
=20
-RDEPENDS:${PN} +=3D "gnome-shell python3-core python3-logging libhandy"
+RDEPENDS:${PN} +=3D "gnome-shell python3-core python3-logging python3-py=
gobject gtk4 libadwaita gnome-desktop libgudev libnotify"
--=20
2.56.0

