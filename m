Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49859CF9C4C
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:21 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.20394.1726844891939589806
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id D377F2E7E4
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEV-3JaG0c0; Fri, 20 Sep 2024 17:07:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 22/23] tracker: update 3.7.1 -> 3.8.0
Date: Fri, 20 Sep 2024 17:08:21 +0200
Message-ID: <20240920150822.1131707-22-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844863-A4FF7467-ADFB4A6C/0/0 CLEAN NORMAL
X-TOI-MSGID: d7888876-03a4-4c1c-833c-9cdf2cf333fa
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112425

- Dont inherit python3native. It seems to be unneeded
- Rename to tinysparql
- Drop dependencies for python3-pygobject-native and libarchive
- Disable tests by default
- Add PACKAGECONFIG for avahi
- Fix sed hack to keep buildpath out of enum-types.c
- Add patch that avoids to create compatibility links which would lead to=
 package_qa error:
Exception: Exception: KeyError: 'getpwuid(): uid not found: 1000'
Path /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/tinysparql/3=
.8.0/sstate-build-package/package/usr/lib/libtracker-sparql-3.0.so is own=
ed by uid 1000, gid 100, which doesn't match any user/group on target. Th=
is may be due to host contamination.
- Refresh fix-reproducibility.patch and additionally edit tracker-http.c =
to avoid another buildpath leakage
---
 .../0001-fix-reproducibility.patch            | 49 ++++++++++++++-----
 ...parql-meson.build-dont-create-compat.patch | 32 ++++++++++++
 .../{tracker_3.7.3.bb =3D> tinysparql_3.8.0.bb} | 28 +++++------
 3 files changed, 83 insertions(+), 26 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker =3D> tinysparql}/0001-f=
ix-reproducibility.patch (67%)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-=
libtracker-sparql-meson.build-dont-create-compat.patch
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.7.3.bb =3D> tinysparq=
l_3.8.0.bb} (68%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducib=
ility.patch b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reprod=
ucibility.patch
similarity index 67%
rename from meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibi=
lity.patch
rename to meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducib=
ility.patch
index 4527f9efa..23da5bb97 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker/0001-fix-reproducibility.p=
atch
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-fix-reproducibilit=
y.patch
@@ -1,4 +1,4 @@
-From ae34fb111e1f2498f37b21c0c32ace6c9928ad66 Mon Sep 17 00:00:00 2001
+From 1eec06fc1ef26e4954507001c1c2f981eab8d77d Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Mon, 18 Sep 2023 02:47:55 +0200
 Subject: [PATCH] tracker: fix reproducibility issue
@@ -12,16 +12,18 @@ Upstream-Status: Inappropriate [oe-specific]
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
- meson.build                       | 6 +++---
- src/libtracker-common/meson.build | 4 ++--
- src/libtracker-sparql/meson.build | 4 ++--
- 3 files changed, 7 insertions(+), 7 deletions(-)
+ meson.build                        | 6 +++---
+ src/libtracker-common/meson.build  | 4 ++--
+ src/libtracker-http/meson.build    | 8 ++++----
+ src/libtracker-http/tracker-http.c | 4 ++--
+ src/libtracker-sparql/meson.build  | 4 ++--
+ 5 files changed, 13 insertions(+), 13 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index bc9f93a..6c86e5a 100644
+index 41c00fafc..6e7282cb7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -357,7 +357,7 @@ have_rtld_noload =3D cc.has_header_symbol('dlfcn.h',=
 'RTLD_NOLOAD')
+@@ -333,7 +333,7 @@ have_rtld_noload =3D cc.has_header_symbol('dlfcn.h',=
 'RTLD_NOLOAD')
  conf.set('HAVE_RTLD_NOLOAD', have_rtld_noload)
 =20
  # Config that goes in some other generated files (.desktop, .service, e=
tc)
@@ -30,7 +32,7 @@ index bc9f93a..6c86e5a 100644
  conf.set('libexecdir', join_paths(get_option('prefix'), get_option('lib=
execdir')))
 =20
  configure_file(input: 'config.h.meson.in',
-@@ -396,8 +396,8 @@ subdir('docs')
+@@ -372,8 +372,8 @@ subdir('docs')
  subdir('utils')
 =20
  test_c_args =3D tracker_c_args + [
@@ -42,7 +44,7 @@ index bc9f93a..6c86e5a 100644
 =20
  tracker_uninstalled_cli_dir =3D join_paths(meson.current_build_dir(), '=
src', 'tracker')
 diff --git a/src/libtracker-common/meson.build b/src/libtracker-common/m=
eson.build
-index 9355d1c..cdbc05f 100644
+index 72c2ae073..12218c870 100644
 --- a/src/libtracker-common/meson.build
 +++ b/src/libtracker-common/meson.build
 @@ -51,10 +51,10 @@ libtracker_common =3D static_library('tracker-common=
',
@@ -58,11 +60,31 @@ index 9355d1c..cdbc05f 100644
    ] + tracker_c_args,
    include_directories: [configinc, srcinc],
    gnu_symbol_visibility: 'hidden',
+diff --git a/src/libtracker-http/tracker-http.c b/src/libtracker-http/tr=
acker-http.c
+index dd82e9928..3cc68b240 100644
+--- a/src/libtracker-http/tracker-http.c
++++ b/src/libtracker-http/tracker-http.c
+@@ -53,13 +53,13 @@ ensure_types (void)
+=20
+ 		current_dir =3D g_get_current_dir ();
+=20
+-		if (g_strcmp0 (current_dir, BUILDROOT) =3D=3D 0) {
++		if (0) {
+ 			/* Detect in-build runtime of this code, this may happen
+ 			 * building introspection information or running tests.
+ 			 * We want the in-tree modules to be loaded then.
+ 			 */
+ 			module_path =3D g_strdup_printf (BUILD_LIBDIR "/%s", modules[i]);
+-		} else {
++		} else {
+ 			module_path =3D g_strdup_printf (PRIVATE_LIBDIR "/%s", modules[i]);
+ 		}
+=20
 diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/m=
eson.build
-index 4143eac..b73f1c9 100644
+index 5eccb92fc..161f6ea21 100644
 --- a/src/libtracker-sparql/meson.build
 +++ b/src/libtracker-sparql/meson.build
-@@ -98,10 +98,10 @@ libtracker_sparql_private =3D static_library('tracke=
r-sparql-private',
+@@ -102,10 +102,10 @@ libtracker_sparql_private =3D static_library('trac=
ker-sparql-private',
      c_args: [
  	'-include', 'libtracker-sparql/tracker-private.h',
          '-DPRIVATE_LIBDIR=3D"@0@"'.format(tracker_internal_libs_dir),
@@ -74,4 +96,7 @@ index 4143eac..b73f1c9 100644
 +        '-DBUILDROOT=3D"@0@"'.format('/usr/src/debug/tracker'),
      ] + tracker_c_args,
 =20
-     dependencies: [libtracker_sparql_dependencies, gvdb_dep],
+     dependencies: [libtracker_sparql_dependencies],
+--=20
+2.46.0
+
diff --git a/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtrac=
ker-sparql-meson.build-dont-create-compat.patch b/meta-gnome/recipes-gnom=
e/tracker/tinysparql/0001-src-libtracker-sparql-meson.build-dont-create-c=
ompat.patch
new file mode 100644
index 000000000..d6cc4f45d
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql/0001-src-libtracker-spa=
rql-meson.build-dont-create-compat.patch
@@ -0,0 +1,32 @@
+From 0dfdbeef174c18e846b98af816a9675c12a42845 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Fri, 20 Sep 2024 16:43:44 +0200
+Subject: [PATCH] src/libtracker-sparql/meson.build: dont create compatib=
ility
+ symlinks
+
+Using the sh script will cause package_qa error:
+Exception: Exception: KeyError: 'getpwuid(): uid not found: 1000'
+Path /home/flk/poky/build-hypr/tmp/work/corei7-64-poky-linux/tinysparql/=
3.8.0/sstate-build-package/package/usr/lib/libtracker-sparql-3.0.so is ow=
ned by uid 1000, gid 100, which doesn't match any user/group on target. T=
his may be due to host contamination.
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ src/libtracker-sparql/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libtracker-sparql/meson.build b/src/libtracker-sparql/m=
eson.build
+index 5eccb92fc..6ed7c2b1f 100644
+--- a/src/libtracker-sparql/meson.build
++++ b/src/libtracker-sparql/meson.build
+@@ -247,6 +247,6 @@ endif
+=20
+ tracker_sparql_uninstalled_dir =3D meson.current_build_dir()
+=20
+-meson.add_install_script('symlink-libtracker-sparql.sh', get_option('li=
bdir'), meson.current_build_dir())
++#meson.add_install_script('symlink-libtracker-sparql.sh', get_option('l=
ibdir'), meson.current_build_dir())
+=20
+ meson.override_dependency('tinysparql-3.0', tracker_sparql_dep)
+--=20
+2.46.0
+
diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb b/meta-gno=
me/recipes-gnome/tracker/tinysparql_3.8.0.bb
similarity index 68%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
rename to meta-gnome/recipes-gnome/tracker/tinysparql_3.8.0.bb
index 885f3515d..628384464 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.7.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/tinysparql_3.8.0.bb
@@ -7,22 +7,20 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D " \
     dbus-native \
-    python3-pygobject-native \
     glib-2.0 \
     sqlite3 \
-    libarchive \
     dbus \
     icu \
     json-glib \
-    libsoup-3.0 \
+    libsoup \
     libstemmer \
 "
=20
-
-inherit gettext gnomebase gobject-introspection vala gtk-doc bash-comple=
tion python3native
+inherit gettext gnomebase gobject-introspection vala gtk-doc bash-comple=
tion
=20
 SRC_URI +=3D "file://0001-fix-reproducibility.patch"
-SRC_URI[archive.sha256sum] =3D "ab3d4a50937e04c5ed7846f6dbb999e290981940=
2f389ca592ee6b77dd28d1f9"
+SRC_URI +=3D "file://0001-src-libtracker-sparql-meson.build-dont-create-=
compat.patch"
+SRC_URI[archive.sha256sum] =3D "c0fcda77520f531548b2395137dcd193ee9cde5e=
222d3c9d273f030d1762a504"
=20
 # text search is not an option anymore and requires sqlite3 build with
 # PACKAGECONFIG[fts5] set (default)
@@ -39,21 +37,23 @@ EXTRA_OEMESON =3D " \
     -Dman=3Dfalse \
     -Dsystemd_user_services=3D${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', 'true', 'false', d)} \
     -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
-    -Dsoup=3Dsoup3 \
+    -Dtests=3Dfalse \
     ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '-Dvapi=3Denabled', =
'-Dvapi=3Ddisabled', d)} \
 "
=20
-do_install:prepend() {
-    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/src/li=
btracker-sparql/tracker-sparql-enum-types.c
-    sed -i -e 's|${B}/../${PN}-${PV}|${TARGET_DBGSRC_DIR}|g' ${B}/src/li=
btracker-sparql/core/tracker-data-enum-types.c
-}
-
 GIR_MESON_ENABLE_FLAG =3D 'enabled'
 GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
+PACKAGECONFIG ??=3D "${@bb.utils.contains("DISTRO_FEATURES", "zeroconf",=
 "avahi", "", d)}"
+PACKAGECONFIG[avahi] =3D "-Davahi=3Denabled,-Davahi=3Ddisabled,avahi,"
+
+do_install:prepend() {
+    sed -i -e 's|${B}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtracker-sparql=
/tracker-sparql-enum-types.c
+    sed -i -e 's|${B}|${TARGET_DBGSRC_DIR}|g' ${B}/src/libtracker-sparql=
/core/tracker-data-enum-types.c
+}
+
 FILES:${PN} +=3D " \
     ${datadir}/dbus-1 \
-    ${datadir}/tracker3 \
-    ${libdir}/tracker-3.0 \
+    ${libdir}/tinysparql-3.0 \
     ${systemd_user_unitdir} \
 "
--=20
2.46.0


