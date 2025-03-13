Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF309C28B28
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:32:09 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.11230.1741861928316254698
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 03:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id D7932EF9
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 11:32:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsfrB-3UGxs20; Thu, 13 Mar 2025 11:32:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][gnome48][meta-gnome][PATCH 2/3] tinysparql: update 3.8.2 -> 3.9.rc
Date: Thu, 13 Mar 2025 11:32:47 +0100
Message-ID: <20250313103248.2116871-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250313103248.2116871-1-f_l_k@t-online.de>
References: <20250313103248.2116871-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741861925-08FF7459-66F7E0D8/0/0 CLEAN NORMAL
X-TOI-MSGID: 2146e3f0-46fb-424a-a391-63bfd54a7c77
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 10:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115965

- rework patches after directory refactor
- use gi-docgen instead of gtk-doc
- add graphviz-native as a dependency for api-documentation as we now nee=
d to provide dot

NEW in 3.9.rc - 2025-03-02
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  * Multiple fixes to issues found by OSS fuzz
  * Restructure project directories
  * Error handling fixes in SPARQL updates via D-Bus
NEW in 3.9.alpha - 2025-01-11
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
  * Hide again unintentionally leaked tracker_http_* symbols
  * A number of fixes to static linking

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../tinysparql/0001-fix-reproducibility.patch | 46 +++++++++----------
 ...parql-meson.build-dont-create-compat.patch |  8 ++--
 ...nysparql_3.8.2.bb =3D> tinysparql_3.9.rc.bb} | 15 ++++--
 3 files changed, 37 insertions(+), 32 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tinysparql_3.8.2.bb =3D> tinysp=
arql_3.9.rc.bb} (70%)

diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reprodu=
cibility.patch b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-rep=
roducibility.patch
index 28e66af7d6..20211cecf4 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibilit=
y.patch
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibilit=
y.patch
@@ -1,4 +1,4 @@
-From dd163864c5ee28e153e982e47502039dad2f3787 Mon Sep 17 00:00:00 2001
+From 186d91759dd0e0815f5a9d3a709e2ececa24ff3d Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 18 Sep 2023 02:47:55 +0200
 Subject: [PATCH] tracker: fix reproducibility issue
@@ -12,17 +12,17 @@ Upstream-Status: Inappropriate [oe-specific]
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
- meson.build                        | 6 +++---
- src/libtracker-common/meson.build  | 4 ++--
- src/libtracker-http/tracker-http.c | 2 +-
- src/libtracker-sparql/meson.build  | 4 ++--
+ meson.build                   | 6 +++---
+ src/common/meson.build        | 4 ++--
+ src/http/tracker-http.c       | 2 +-
+ src/libtinysparql/meson.build | 4 ++--
  4 files changed, 8 insertions(+), 8 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 3a624ad..8c02aad 100644
+index 308ada3..0120be7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -333,7 +333,7 @@ have_rtld_noload =3D cc.has_header_symbol('dlfcn.h',=
 'RTLD_NOLOAD')
+@@ -341,7 +341,7 @@ have_rtld_noload =3D cc.has_header_symbol('dlfcn.h',=
 'RTLD_NOLOAD')
  conf.set('HAVE_RTLD_NOLOAD', have_rtld_noload)
 =20
  # Config that goes in some other generated files (.desktop, .service, e=
tc)
@@ -31,8 +31,8 @@ index 3a624ad..8c02aad 100644
  conf.set('libexecdir', join_paths(get_option('prefix'), get_option('lib=
execdir')))
 =20
  configure_file(input: 'config.h.meson.in',
-@@ -372,8 +372,8 @@ subdir('docs')
- subdir('utils')
+@@ -382,8 +382,8 @@ subdir('utils')
+ subdir('fuzzing')
 =20
  test_c_args =3D tracker_c_args + [
 -    '-DTOP_BUILDDIR=3D"@0@"'.format(build_root),
@@ -41,12 +41,12 @@ index 3a624ad..8c02aad 100644
 +    '-DTOP_SRCDIR=3D"@0@/"'.format('/usr/src/debug/tracker'),
  ]
 =20
- tracker_uninstalled_cli_dir =3D join_paths(meson.current_build_dir(), '=
src', 'tracker')
-diff --git a/src/libtracker-common/meson.build b/src/libtracker-common/m=
eson.build
-index 72c2ae0..12218c8 100644
---- a/src/libtracker-common/meson.build
-+++ b/src/libtracker-common/meson.build
-@@ -51,10 +51,10 @@ libtracker_common =3D static_library('tracker-common=
',
+ tracker_uninstalled_testutils_dir =3D join_paths(meson.current_source_d=
ir(), 'utils')
+diff --git a/src/common/meson.build b/src/common/meson.build
+index b961ec3..edd76ce 100644
+--- a/src/common/meson.build
++++ b/src/common/meson.build
+@@ -70,10 +70,10 @@ libtracker_common =3D static_library('tracker-common=
',
    dependencies: [tracker_common_dependencies, gmodule],
    c_args: [
      '-DPRIVATE_LIBDIR=3D"@0@"'.format(tracker_internal_libs_dir),
@@ -59,10 +59,10 @@ index 72c2ae0..12218c8 100644
    ] + tracker_c_args,
    include_directories: [configinc, srcinc],
    gnu_symbol_visibility: 'hidden',
-diff --git a/src/libtracker-http/tracker-http.c b/src/libtracker-http/tr=
acker-http.c
+diff --git a/src/http/tracker-http.c b/src/http/tracker-http.c
 index dd82e99..cb3f1f7 100644
---- a/src/libtracker-http/tracker-http.c
-+++ b/src/libtracker-http/tracker-http.c
+--- a/src/http/tracker-http.c
++++ b/src/http/tracker-http.c
 @@ -53,7 +53,7 @@ ensure_types (void)
 =20
  		current_dir =3D g_get_current_dir ();
@@ -72,13 +72,13 @@ index dd82e99..cb3f1f7 100644
  			/* Detect in-build runtime of this code, this may happen
  			 * building introspection information or running tests.
  			 * We want the in-tree modules to be loaded then.
-diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/m=
eson.build
-index bafc2ac..859da3e 100644
---- a/src/libtracker-sparql/meson.build
-+++ b/src/libtracker-sparql/meson.build
+diff --git a/src/libtinysparql/meson.build b/src/libtinysparql/meson.bui=
ld
+index e229b51..031f7e1 100644
+--- a/src/libtinysparql/meson.build
++++ b/src/libtinysparql/meson.build
 @@ -103,10 +103,10 @@ libtracker_sparql_private =3D static_library('trac=
ker-sparql-private',
      c_args: [
- 	'-include', 'libtracker-sparql/tracker-private.h',
+ 	'-include', 'tracker-private.h',
          '-DPRIVATE_LIBDIR=3D"@0@"'.format(tracker_internal_libs_dir),
 -        '-DBUILD_LIBDIR=3D"@0@"'.format(meson.current_build_dir()),
 +        '-DBUILD_LIBDIR=3D"@0@"'.format('/usr/src/debug/tracker'),
diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtrac=
ker-sparql-meson.build-dont-create-compat.patch b/meta-gnome/recipes-gnom=
e/tracker/tinysparql/0001-src-libtracker-sparql-meson.build-dont-create-c=
ompat.patch
index d6cc4f45d2..e8c1904565 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtracker-spa=
rql-meson.build-dont-create-compat.patch
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtracker-spa=
rql-meson.build-dont-create-compat.patch
@@ -12,13 +12,13 @@ Upstream-Status: Inappropriate [oe-specific]
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
- src/libtracker-sparql/meson.build | 2 +-
+ src/libtinysparql/meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
-diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/m=
eson.build
+diff --git a/src/libtinysparql/meson.build b/src/libtinysparql/meson.bui=
ld
 index 5eccb92fc..6ed7c2b1f 100644
---- a/src/libtracker-sparql/meson.build
-+++ b/src/libtracker-sparql/meson.build
+--- a/src/libtinysparql/meson.build
++++ b/src/libtinysparql/meson.build
 @@ -247,6 +247,6 @@ endif
 =20
  tracker_sparql_uninstalled_dir =3D meson.current_build_dir()
diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.2.bb b/meta-=
gnome/recipes-gnome/tracker/tinysparql_3.9.rc.bb
similarity index 70%
rename from meta-gnome/recipes-gnome/tracker/tinysparql_3.8.2.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.9.rc.bb
index 16c7bfd0d1..7941bc7ce2 100644
--- a/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.9.rc.bb
@@ -16,11 +16,11 @@ DEPENDS =3D " \
     libstemmer \
 "
=20
-inherit gettext gnomebase gobject-introspection vala gtk-doc bash-comple=
tion
+inherit gettext gnomebase gobject-introspection vala gi-docgen bash-comp=
letion
=20
 SRC_URI +=3D "file://0001-fix-reproducibility.patch"
 SRC_URI +=3D "file://0001-src-libtracker-sparql-meson.build-dont-create-=
compat.patch"
-SRC_URI[archive.sha256sum] =3D "bb8643386c8edc591a03205d4a0eda661dcdd209=
4473bffb9bbdb94e93589cb2"
+SRC_URI[archive.sha256sum] =3D "216c4c442d5dd3d476b74615a4cc2b392b38fb6d=
4d16d16aa3b915dc92f2d213"
=20
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
@@ -43,13 +43,18 @@ EXTRA_OEMESON =3D " \
=20
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
+GIDOCGEN_MESON_OPTION =3D "docs"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "zeroconf",=
 "avahi", "", d)}"
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.contains("DISTRO_FEATURES", "zeroconf", "avahi", "", d)} \
+	${@bb.utils.contains("DISTRO_FEATURES", "api-documentation", "docs", ""=
, d)} \
+"
 PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi,"
+PACKAGECONFIG[docs] =3D ",,graphviz-native"
=20
 do_install:prepend() {
-    sed -i -e 's|${B}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtracker-sparql=
/tracker-sparql-enum-types.c
-    sed -i -e 's|${B}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtracker-sparql=
/core/tracker-data-enum-types.c
+    sed -i -e 's|${B}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtinysparql/tra=
cker-sparql-enum-types.c
+    sed -i -e 's|${B}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtinysparql/cor=
e/tracker-data-enum-types.c
 }
=20
 FILES:${PN} +=3D " \
--=20
2.48.1


