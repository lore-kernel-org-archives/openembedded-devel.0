Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E157ACD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 14:15:41 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web10.30328.1694960133526858126
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 07:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout06.t-online.de (Postfix) with SMTP id 38AA415381
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 16:15:30 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhsYa-1ICELJ0; Sun, 17 Sep 2023 16:15:28 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] tracker: upgrade 3.5.1 -> 3.6.0
Date: Sun, 17 Sep 2023 16:15:05 +0200
Message-ID: <20230917141520.3166264-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1694960128-72FFA980-E0CBA5AC/0/0 CLEAN NORMAL
X-TOI-MSGID: 02455f08-7054-44ba-b4f5-ba5b28da7cd9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 14:15:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104910

- fix various reproducibility issues
- fix gobject-introspection build
- build vapi dependent on GI_DATA_ENABLED

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tracker/0001-fix-reproducibility.patch    | 84 +++++++++++++++++++
 .../0001-meson-Do-not-define-TOP_SRCDIR.patch | 24 ------
 .../{tracker_3.5.1.bb =3D> tracker_3.6.0.bb}    | 19 +++--
 3 files changed, 96 insertions(+), 31 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker/0001-fix-rep=
roducibility.patch
 delete mode 100644 meta-gnome/recipes-gnome/tracker/tracker/0001-meson-D=
o-not-define-TOP_SRCDIR.patch
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.5.1.bb =3D> tracker_3=
.6.0.bb} (63%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducib=
ility.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproduci=
bility.patch
new file mode 100644
index 000000000..75065ed77
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.p=
atch
@@ -0,0 +1,84 @@
+From 52e6a20252e7a1df9b451db7690f0a50da9f0ca2 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 12 Sep 2023 16:54:54 +0200
+Subject: [PATCH] meson: fix reproducibility
+
+Tracker's design seems to be strictly for non-cross builds and leaks bui=
ldpaths into the
+binaries at various places. Avoid this to improve binary reproducibility=
.
+
+todo: Some of these paths may need to be adjusted to make the test envir=
onment work
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ meson.build                       | 6 +++---
+ src/libtracker-common/meson.build | 6 +++---
+ src/libtracker-sparql/meson.build | 6 +++---
+ 3 files changed, 9 insertions(+), 9 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 8442a216f..1665acf35 100644
+--- a/meson.build
++++ b/meson.build
+@@ -348,7 +348,7 @@ have_rtld_noload =3D cc.has_header_symbol('dlfcn.h',=
 'RTLD_NOLOAD')
+ conf.set('HAVE_RTLD_NOLOAD', have_rtld_noload)
+=20
+ # Config that goes in some other generated files (.desktop, .service, e=
tc)
+-conf.set('abs_top_builddir', meson.current_build_dir())
++conf.set('abs_top_builddir', '/usr/src/debug/tracker/build')
+ conf.set('libexecdir', join_paths(get_option('prefix'), get_option('lib=
execdir')))
+=20
+ configure_file(input: 'config.h.meson.in',
+@@ -388,8 +388,8 @@ subdir('docs')
+ subdir('utils')
+=20
+ test_c_args =3D tracker_c_args + [
+-    '-DTOP_BUILDDIR=3D"@0@"'.format(build_root),
+-    '-DTOP_SRCDIR=3D"@0@"'.format(source_root),
++    '-DTOP_BUILDDIR=3D"@0@/"'.format('/usr/src/debug/tracker/build'),
++    '-DTOP_SRCDIR=3D"@0@/"'.format('/usr/src/debug/tracker'),
+ ]
+=20
+ tracker_uninstalled_cli_dir =3D join_paths(meson.current_build_dir(), '=
src', 'tracker')
+diff --git a/src/libtracker-common/meson.build b/src/libtracker-common/m=
eson.build
+index 9355d1c0d..236a619be 100644
+--- a/src/libtracker-common/meson.build
++++ b/src/libtracker-common/meson.build
+@@ -50,11 +50,11 @@ libtracker_common =3D static_library('tracker-common=
',
+   tracker_common_sources,
+   dependencies: [tracker_common_dependencies, gmodule],
+   c_args: [
+-    '-DPRIVATE_LIBDIR=3D"@0@"'.format(tracker_internal_libs_dir),
+-    '-DBUILD_LIBDIR=3D"@0@"'.format(meson.current_build_dir()),
++    '-DPRIVATE_LIBDIR=3D"@0@"'.format(''),
++    '-DBUILD_LIBDIR=3D"@0@"'.format(''),
+     # Global build root is required to detect noinst situations (tests/=
introspection),
+     # event when built as a subproject
+-    '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
++    '-DBUILDROOT=3D"@0@"'.format('/usr/src/debug/tracker/build'),
+   ] + tracker_c_args,
+   include_directories: [configinc, srcinc],
+   gnu_symbol_visibility: 'hidden',
+diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/m=
eson.build
+index 36288f5c3..416105b28 100644
+--- a/src/libtracker-sparql/meson.build
++++ b/src/libtracker-sparql/meson.build
+@@ -95,11 +95,11 @@ libtracker_sparql_private =3D static_library('tracke=
r-sparql-private',
+=20
+     c_args: [
+ 	'-include', 'libtracker-sparql/tracker-private.h',
+-        '-DPRIVATE_LIBDIR=3D"@0@"'.format(tracker_internal_libs_dir),
+-        '-DBUILD_LIBDIR=3D"@0@"'.format(meson.current_build_dir()),
++        '-DPRIVATE_LIBDIR=3D"@0@"'.format(''),
++        '-DBUILD_LIBDIR=3D"@0@"'.format(''),
+         # Global build root is required to detect noinst situations (te=
sts/introspection),
+         # event when built as a subproject
+-        '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
++        '-DBUILDROOT=3D"@0@"'.format('/usr/src/debug/tracker/build'),
+     ] + tracker_c_args,
+=20
+     dependencies: [libtracker_sparql_dependencies, gvdb_dep],
+--=20
+2.41.0
+
diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-d=
efine-TOP_SRCDIR.patch b/meta-gnome/recipes-gnome/tracker/tracker/0001-me=
son-Do-not-define-TOP_SRCDIR.patch
deleted file mode 100644
index 5c6ab71a9..000000000
--- a/meta-gnome/recipes-gnome/tracker/tracker/0001-meson-Do-not-define-T=
OP_SRCDIR.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 3e262192ffebf5d6fec92d5b7ba08348a94df1ae Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 25 May 2023 20:54:47 -0700
-Subject: [PATCH] meson: Do not define TOP_SRCDIR
-
-This is passed from build env
-
-Upstream-Status: Inappropriate [Cross compile specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 1 -
- 1 file changed, 1 deletion(-)
-
---- a/meson.build
-+++ b/meson.build
-@@ -353,7 +353,7 @@ subdir('utils')
-=20
- test_c_args =3D tracker_c_args + [
-     '-DTOP_BUILDDIR=3D"@0@"'.format(build_root),
--    '-DTOP_SRCDIR=3D"@0@"'.format(source_root),
-+    '-DTOP_SRCDIR=3D"@0@"'.format('/usr/src/debug/tracker'),
- ]
-=20
- tracker_uninstalled_cli_dir =3D join_paths(meson.current_build_dir(), '=
src', 'tracker')
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb b/meta-gno=
me/recipes-gnome/tracker/tracker_3.6.0.bb
similarity index 63%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
index 6dd8af239..d2eb392a0 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.5.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.6.0.bb
@@ -20,14 +20,10 @@ DEPENDS =3D " \
=20
 GNOMEBASEBUILDCLASS =3D "meson"
=20
-inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages =
bash-completion features_check python3native
+inherit gettext gnomebase gsettings gobject-introspection vala gtk-doc  =
bash-completion python3native
=20
-SRC_URI +=3D "file://0001-meson-Do-not-define-TOP_SRCDIR.patch"
-SRC_URI[archive.sha256sum] =3D "f972d50ac7bafdccf113b1eb99dcae35404685a9=
9e55bfef16f3ac83b4de974d"
-
-# gobject-introspection is mandatory and cannot be configured
-REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
-GIR_MESON_OPTION =3D ""
+SRC_URI +=3D "file://0001-fix-reproducibility.patch"
+SRC_URI[archive.sha256sum] =3D "52592cfe19baffd16dbe47475be7da750dbd0b63=
33fd7acb60faa9da5bc40df2"
=20
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
@@ -45,8 +41,17 @@ EXTRA_OEMESON =3D " \
     -Dsystemd_user_services=3D${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', 'true', 'false', d)} \
     -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
     -Dsoup=3Dsoup3 \
+    ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=3Denabled', =
'-Dvapi=3Ddisabled', d)} \
 "
=20
+do_install:prepend() {
+    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/src/libtracker-sparql/tracker-sparql-enum-types.c
+    sed -i -e 's|${B}/../${PN}-${PV}|/usr/src/debug/${PN}/${PV}-${PR}|g'=
 ${B}/src/libtracker-sparql/core/tracker-data-enum-types.c
+}
+
+GIR_MESON_ENABLE_FLAG =3D 'enabled'
+GIR_MESON_DISABLE_FLAG =3D 'disabled'
+
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
     ${datadir}/tracker3 \
--=20
2.41.0


