Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B484C982F1
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 07:26:38 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4703.1790061997305027836
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 22 Sep 2026 00:26:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=HTYWg9FL;
 spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 9E4F71C7A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 09:26:34 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.249]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x8utW-3wjFf00; Tue, 22 Sep 2026 09:26:26 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2 3/3] convey: add recipe
Date: Tue, 22 Sep 2026 09:26:19 +0200
Message-ID: <20260922072619.228493-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922072619.228493-1-f_l_k@t-online.de>
References: <20260922072619.228493-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1790061986-837FD9F9-FD295EF5/0/0 CLEAN NORMAL
X-TOI-MSGID: f53dee31-f36a-42fc-a4dd-048a77fe214e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1790061994; i=f_l_k@t-online.de;
	bh=SfGsd2eKAOgZNY3J12D3cDGkL1SUJg4oHysTr5lnkRc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HTYWg9FL+bashZrMg5Vp4K9zvdVefa5U/9QM03BVqJSK8mlDXvbJPk7a/IiDbBP0W
	 K+l9vpr8AzXjXxeMsNgN7kskIT7wqTgh8knrB3JOZIVExgZDPpesYzl3HCBFtddFlk
	 vBIk7XhoHvPz8cUlFv0ovO1UUESINcIKkNNFKJ6+GnSPcN4zCBbjyuw/WQQJjM3vAT
	 I60bIgGvigq7OAzHHAgRuPJF+DYCDkNWua36M8IV/q+YTRNNcLyZhaIpf8mL+Y8L48
	 70Q2+D2yF+xf+25iCVm/vlvFL4TkKq9S7sfZGnEH/5JIIOypiRQSU3aT9wAO/H9pOA
	 xYQLhZX3yi9UQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 22 Sep 2026 07:26:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130175

Convey is a fork of geary ported to GTK4, libadwaita, gcr-4 and
webkitgtk 6.0. The patches keep build paths out of the binary, drop
host checks that do not apply when cross-compiling and let the vala-unit
subproject find g-ir-compiler through the cross file.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...-not-store-build-paths-in-the-binary.patch | 40 +++++++++++++
 ...ck-for-the-iso-xml-files-and-the-C.u.patch | 39 ++++++++++++
 ...k-up-g-ir-compiler-with-find_program.patch | 34 +++++++++++
 .../convey/convey_50.2.bb                     | 59 +++++++++++++++++++
 4 files changed, 172 insertions(+)
 create mode 100644 meta-gnome/recipes-connectivity/convey/convey/0001-me=
son-do-not-store-build-paths-in-the-binary.patch
 create mode 100644 meta-gnome/recipes-connectivity/convey/convey/0002-me=
son-do-not-check-for-the-iso-xml-files-and-the-C.u.patch
 create mode 100644 meta-gnome/recipes-connectivity/convey/convey/0003-va=
la-unit-look-up-g-ir-compiler-with-find_program.patch
 create mode 100644 meta-gnome/recipes-connectivity/convey/convey_50.2.bb

diff --git a/meta-gnome/recipes-connectivity/convey/convey/0001-meson-do-=
not-store-build-paths-in-the-binary.patch b/meta-gnome/recipes-connectivi=
ty/convey/convey/0001-meson-do-not-store-build-paths-in-the-binary.patch
new file mode 100644
index 0000000000..91e21fd0ec
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/convey/convey/0001-meson-do-not-sto=
re-build-paths-in-the-binary.patch
@@ -0,0 +1,40 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 22 Sep 2026 07:43:41 +0200
+Subject: [PATCH] meson: do not store build paths in the binary
+
+The build root and source root are only used when convey runs
+uninstalled, but storing them puts TMPDIR into the binary and breaks
+reproducibility. Point them to /usr/src and the schema directory to the
+installed location instead.
+
+AI-Generated: Uses Claude Code (Claude Fable 5.1)
+Upstream-Status: Inappropriate [oe-specific]
+---
+ src/meson.build | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/meson.build b/src/meson.build
+index 87690ada..ce722126 100644
+--- a/src/meson.build
++++ b/src/meson.build
+@@ -4,8 +4,8 @@ conf =3D configuration_data()
+ conf.set_quoted('GETTEXT_PACKAGE', meson.project_name())
+ conf.set_quoted('G_LOG_DOMAIN', meson.project_name())
+ conf.set_quoted('APP_ID', convey_id)
+-conf.set_quoted('BUILD_ROOT_DIR', meson.project_build_root())
+-conf.set_quoted('GSETTINGS_DIR', meson.project_build_root() / 'desktop'=
)
++conf.set_quoted('BUILD_ROOT_DIR', '/usr/src')
++conf.set_quoted('GSETTINGS_DIR', data_dir / 'glib-2.0' / 'schemas')
+ conf.set_quoted('INSTALL_PREFIX', convey_prefix)
+ conf.set_quoted('ISO_CODE_3166_XML', iso_3166_xml)
+ conf.set_quoted('ISO_CODE_639_XML', iso_639_xml)
+@@ -14,7 +14,7 @@ conf.set_quoted('NAME_SUFFIX', name_suffix)
+ conf.set_quoted('PLUGINS_DIR', plugins_dir)
+ conf.set_quoted('PROFILE', profile)
+ conf.set_quoted('REVNO', revno)
+-conf.set_quoted('SOURCE_ROOT_DIR', meson.project_source_root())
++conf.set_quoted('SOURCE_ROOT_DIR', '/usr/src')
+ conf.set_quoted('VERSION', convey_version)
+ conf.set_quoted('WEB_EXTENSIONS_DIR', web_extensions_dir)
+ config_h =3D configure_file(output: 'config.h', configuration: conf)
diff --git a/meta-gnome/recipes-connectivity/convey/convey/0002-meson-do-=
not-check-for-the-iso-xml-files-and-the-C.u.patch b/meta-gnome/recipes-co=
nnectivity/convey/convey/0002-meson-do-not-check-for-the-iso-xml-files-an=
d-the-C.u.patch
new file mode 100644
index 0000000000..15836a7c52
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/convey/convey/0002-meson-do-not-che=
ck-for-the-iso-xml-files-and-the-C.u.patch
@@ -0,0 +1,39 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 22 Sep 2026 09:15:56 +0200
+Subject: [PATCH] meson: do not check for the iso xml files and the C.utf=
8
+ locale during build
+
+The iso xml files are needed at runtime and live in the staging area
+when cross-compiling, and the locale check runs the host's locale
+command against the host's locales. Neither says anything about the
+target, so drop both build-time checks.
+
+AI-Generated: Uses Claude Code (Claude Fable 5.1)
+Upstream-Status: Pending
+---
+ meson.build | 11 -----------
+ 1 file changed, 11 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index dfd919a7..51ab9015 100644
+--- a/meson.build
++++ b/meson.build
+@@ -195,17 +195,6 @@ if iso_3166_xml =3D=3D ''
+   iso_3166_xml =3D iso_codes_dir / 'iso_3166.xml'
+ endif
+=20
+-files(iso_639_xml, iso_3166_xml) # Check to make sure these exist
+-
+-# Make sure the locale C.UTF-8 is installed on the system
+-
+-c_utf8_check =3D run_command('locale', '-a', check: true).stdout()
+-have_c_utf8 =3D 'C.utf8' in c_utf8_check.split('\n')
+-
+-if not have_c_utf8
+-  warning('C.utf8 locale not available on this system.')
+-endif
+-
+ # Post-install script
+ gnome.post_install(
+   gtk_update_icon_cache: true,
diff --git a/meta-gnome/recipes-connectivity/convey/convey/0003-vala-unit=
-look-up-g-ir-compiler-with-find_program.patch b/meta-gnome/recipes-conne=
ctivity/convey/convey/0003-vala-unit-look-up-g-ir-compiler-with-find_prog=
ram.patch
new file mode 100644
index 0000000000..a07887c67c
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/convey/convey/0003-vala-unit-look-u=
p-g-ir-compiler-with-find_program.patch
@@ -0,0 +1,34 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 22 Sep 2026 09:15:10 +0200
+Subject: [PATCH] vala-unit: look up g-ir-compiler with find_program
+
+The path taken from the g_ir_compiler pkg-config variable is the
+target path and is not usable when cross-compiling. find_program
+honours the cross file, which is where the wrapper is set.
+
+AI-Generated: Uses Claude Code (Claude Fable 5.1)
+Upstream-Status: Pending
+---
+ subprojects/vala-unit/meson.build | 8 +-------
+ 1 file changed, 1 insertion(+), 7 deletions(-)
+
+diff --git a/subprojects/vala-unit/meson.build b/subprojects/vala-unit/m=
eson.build
+index a1822aa8..d04cc307 100644
+--- a/subprojects/vala-unit/meson.build
++++ b/subprojects/vala-unit/meson.build
+@@ -31,13 +31,7 @@ gee =3D dependency('gee-0.8')
+ gio =3D dependency('gio-2.0')
+ glib =3D dependency('glib-2.0', version: '>=3D' + target_glib)
+ gobject =3D dependency('gobject-2.0')
+-gobject_introspection =3D dependency('gobject-introspection-1.0', requi=
red: false)
+-
+-if gobject_introspection.found()
+-  g_ir_compiler =3D gobject_introspection.get_variable('g_ir_compiler')
+-else
+-  g_ir_compiler =3D find_program('g-ir-compiler')
+-endif
++g_ir_compiler =3D find_program('g-ir-compiler')
+ if enable_valadoc
+   valadoc =3D find_program('valadoc')
+ endif
diff --git a/meta-gnome/recipes-connectivity/convey/convey_50.2.bb b/meta=
-gnome/recipes-connectivity/convey/convey_50.2.bb
new file mode 100644
index 0000000000..2a28f5aef5
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/convey/convey_50.2.bb
@@ -0,0 +1,59 @@
+SUMMARY =3D "Email application built around conversations for the GNOME =
desktop"
+HOMEPAGE =3D "https://gitlab.gnome.org/donnybeelo/convey"
+SECTION =3D "network"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D2a2244d5a13871ad950c55877546a=
6a2"
+
+DEPENDS =3D " \
+    appstream-native \
+    cairo \
+    desktop-file-utils-native \
+    enchant2 \
+    folks \
+    gcr \
+    gmime \
+    gnome-online-accounts \
+    gstreamer1.0 \
+    gstreamer1.0-plugins-bad \
+    gtk4 \
+    icu \
+    iso-codes \
+    json-glib \
+    libadwaita \
+    libpeas \
+    libsecret \
+    libsoup \
+    libstemmer \
+    libxml2 \
+    sqlite3 \
+    webkitgtk \
+"
+
+inherit meson pkgconfig mime-xdg gsettings gtk-icon-cache gobject-intros=
pection gnome-help vala features_check
+
+SRC_URI =3D " \
+    git://gitlab.gnome.org/donnybeelo/convey.git;protocol=3Dhttps;branch=
=3Dmain;tag=3D${PV}-1 \
+    file://0001-meson-do-not-store-build-paths-in-the-binary.patch \
+    file://0002-meson-do-not-check-for-the-iso-xml-files-and-the-C.u.pat=
ch \
+    file://0003-vala-unit-look-up-g-ir-compiler-with-find_program.patch =
\
+"
+SRCREV =3D "2a0b661bf1d7fde57b6dfcb7e09ce33d7b4b9f42"
+
+REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data opengl"
+
+GTKIC_VERSION =3D "4"
+GIR_MESON_OPTION =3D ""
+
+EXTRA_OEMESON =3D " \
+    -Dprofile=3Drelease \
+    -Drevno=3D${PV} \
+    -Diso_639_xml=3D${datadir}/xml/iso-codes/iso_639.xml \
+    -Diso_3166_xml=3D${datadir}/xml/iso-codes/iso_3166.xml \
+    -Dvaladoc=3Ddisabled \
+"
+
+PACKAGECONFIG ??=3D ""
+PACKAGECONFIG[libunwind] =3D "-Dlibunwind=3Denabled,-Dlibunwind=3Ddisabl=
ed,libunwind"
+PACKAGECONFIG[tnef] =3D "-Dtnef=3Denabled,-Dtnef=3Ddisabled,libytnef"
+
+FILES:${PN} +=3D "${datadir}"
--=20
2.55.0


