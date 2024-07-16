Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3127BC3DA49
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 09:06:19 +0000 (UTC)
Received: from mailout06.t-online.de (mailout06.t-online.de [194.25.134.19])
 by mx.groups.io with SMTP id smtpd.web11.6506.1721120773726256102
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jul 2024 02:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.19, mailfrom: f_l_k@t-online.de)
Received: from fwd86.aul.t-online.de (fwd86.aul.t-online.de [10.223.144.112])
	by mailout06.t-online.de (Postfix) with SMTP id 63FA92A0DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 11:05:47 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.173.141]) by fwd86.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1sTe82-0zw7zV0; Tue, 16 Jul 2024 11:05:46 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH] geary: update 44.1 -> 46.0
Date: Tue, 16 Jul 2024 11:06:55 +0200
Message-ID: <20240716090655.1602506-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1721120746-A9B32350-9284B7D1/0/0 CLEAN NORMAL
X-TOI-MSGID: ceedd4aa-fb8d-4d84-a2d0-643cd6e28351
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jul 2024 09:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111371

- Remove 0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch
  Using it pulls buildpath into the client library and thus breaks reprod=
ucibility
- Add a patch to fix more reproducibility issues
- Add soup3 dependency
- inherit gsettings
- remove CFLAGS:append, tested to be working with clang 18.1.6 for x86_64=
 musl

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...tion-client.vala-hardcode-some-paths.patch | 40 +++++++++++++++
 ...NFIG_SYSROOT_DIR-when-using-pkg-conf.patch | 51 -------------------
 .../geary/{geary_44.1.bb =3D> geary_46.0.bb}    | 11 ++--
 3 files changed, 44 insertions(+), 58 deletions(-)
 create mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-appl=
ication-client.vala-hardcode-some-paths.patch
 delete mode 100644 meta-gnome/recipes-connectivity/geary/geary/0001-meso=
n-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch
 rename meta-gnome/recipes-connectivity/geary/{geary_44.1.bb =3D> geary_4=
6.0.bb} (68%)

diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-application=
-client.vala-hardcode-some-paths.patch b/meta-gnome/recipes-connectivity/=
geary/geary/0001-application-client.vala-hardcode-some-paths.patch
new file mode 100644
index 000000000..8162e50d9
--- /dev/null
+++ b/meta-gnome/recipes-connectivity/geary/geary/0001-application-client=
.vala-hardcode-some-paths.patch
@@ -0,0 +1,40 @@
+From 98243ca43e40116c22f7b867e32ad27ffd314505 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 16 Jul 2024 07:30:09 +0200
+Subject: [PATCH] application-client.vala: hardcode some paths
+
+Otherwise the build values will be stored in the binary and used if gear=
y was not installed
+https://gitlab.gnome.org/GNOME/geary/-/blob/main/src/client/application/=
application-client.vala?ref_type=3Dheads#L798
+https://gitlab.gnome.org/GNOME/geary/-/blob/main/src/client/application/=
application-client.vala?ref_type=3Dheads#L365
+
+This breaks reproducibility
+WARNING: geary-46.0-r0 do_package_qa: QA Issue: File /usr/lib/geary/libg=
eary-client-46.0.so in package geary contains reference to TMPDIR [buildp=
aths]
+WARNING: geary-46.0-r0 do_package_qa: QA Issue: File /usr/lib/geary/.deb=
ug/libgeary-client-46.0.so in package geary-dbg contains reference to TMP=
DIR [buildpaths]
+
+Upstream-Status: Inappropriate [oe-specific]
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+---
+ src/client/application/application-client.vala | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/client/application/application-client.vala b/src/client=
/application/application-client.vala
+index 51d0f632e..acc53a65f 100644
+--- a/src/client/application/application-client.vala
++++ b/src/client/application/application-client.vala
+@@ -39,9 +39,9 @@ public class Application.Client : Gtk.Application {
+=20
+     public const string VERSION =3D _VERSION;
+     public const string INSTALL_PREFIX =3D _INSTALL_PREFIX;
+-    public const string GSETTINGS_DIR =3D _GSETTINGS_DIR;
+-    public const string SOURCE_ROOT_DIR =3D _SOURCE_ROOT_DIR;
+-    public const string BUILD_ROOT_DIR =3D _BUILD_ROOT_DIR;
++    public const string GSETTINGS_DIR =3D "/usr/share/applications";
++    public const string SOURCE_ROOT_DIR =3D "/usr/src";
++    public const string BUILD_ROOT_DIR =3D "/usr/src";
+=20
+     // keep these in sync with meson_options.txt
+     public const string PROFILE_RELEASE =3D "release";
+--=20
+2.45.2
+
diff --git a/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Use-P=
KG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch b/meta-gnome/recipes-conn=
ectivity/geary/geary/0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg=
-conf.patch
deleted file mode 100644
index 1e0640a66..000000000
--- a/meta-gnome/recipes-connectivity/geary/geary/0001-meson-Use-PKG_CONF=
IG_SYSROOT_DIR-when-using-pkg-conf.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From a300be5877f35379bb569313eec901bda9c8d762 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 30 Apr 2023 22:08:39 -0700
-Subject: [PATCH] meson: Use PKG_CONFIG_SYSROOT_DIR when using pkg-config
-
-OE cross-builds and absolute paths found by pkg-config points to
-non-sysroot'ed locations which are not correct as they point into native
-sysroot from build machine which is incorrect.
-
-Upstream-Status: Inappropriate [OE-specific]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 8 +++++---
- 1 file changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index d563dd08..9b72aeb4 100644
---- a/meson.build
-+++ b/meson.build
-@@ -38,6 +38,9 @@ metadata_dir =3D meson.project_source_root() / 'bindin=
gs'/ 'metadata'
- po_dir =3D meson.project_source_root() / 'po'
- vapi_dir =3D meson.project_source_root() / 'bindings' / 'vapi'
-=20
-+# pkg-config sysroot location
-+pkgconf_sysroot =3D run_command('python3', '-c', 'import os; print(os.e=
nviron.get("PKG_CONFIG_SYSROOT_DIR"))').stdout().strip()
-+
- # Compiler configuration
- add_project_arguments([
-     # Make sure Meson can find custom VAPIs
-@@ -120,7 +123,7 @@ icu_uc =3D declare_dependency(
- if libunwind_dep.found()
-   # We need to add native lib to the search path for these so Flatpak
-   # builds can find it.
--  unwind_lib =3D libunwind_dep.get_variable(pkgconfig: 'libdir')
-+  unwind_lib =3D pkgconf_sysroot + libunwind_dep.get_variable(pkgconfig=
: 'libdir')
-   libunwind =3D declare_dependency(
-      dependencies: [
-        valac.find_library('libunwind', dirs: [vapi_dir, unwind_lib]),
-@@ -207,8 +210,7 @@ vala_unit_proj =3D subproject(
- vala_unit_dep =3D vala_unit_proj.get_variable('vala_unit_dep')
-=20
- # Language detection
--
--iso_codes_dir =3D iso_codes.get_variable(pkgconfig: 'prefix')/'share'/'=
xml'/'iso-codes'
-+iso_codes_dir =3D pkgconf_sysroot + iso_codes.get_variable(pkgconfig: '=
prefix')/'share'/'xml'/'iso-codes'
-=20
- iso_639_xml =3D get_option('iso_639_xml')
- if iso_639_xml =3D=3D ''
---=20
-2.40.1
-
diff --git a/meta-gnome/recipes-connectivity/geary/geary_44.1.bb b/meta-g=
nome/recipes-connectivity/geary/geary_46.0.bb
similarity index 68%
rename from meta-gnome/recipes-connectivity/geary/geary_44.1.bb
rename to meta-gnome/recipes-connectivity/geary/geary_46.0.bb
index decae6b2c..d8d48ef51 100644
--- a/meta-gnome/recipes-connectivity/geary/geary_44.1.bb
+++ b/meta-gnome/recipes-connectivity/geary/geary_46.0.bb
@@ -23,6 +23,7 @@ DEPENDS =3D " \
     libical \
     libpeas \
     libsecret \
+    libsoup \
     libstemmer \
     libxml2 \
     sqlite3 \
@@ -31,15 +32,15 @@ DEPENDS =3D " \
=20
 RDEPENDS:${PN} =3D "gnome-keyring"
=20
-inherit meson pkgconfig mime-xdg gtk-icon-cache gobject-introspection va=
la features_check
+inherit meson pkgconfig mime-xdg gsettings gtk-icon-cache gobject-intros=
pection vala features_check
=20
 SRC_URI =3D " \
 	git://github.com/GNOME/geary.git;nobranch=3D1;protocol=3Dhttps \
-	file://0001-meson-Use-PKG_CONFIG_SYSROOT_DIR-when-using-pkg-conf.patch =
\
+	file://0001-application-client.vala-hardcode-some-paths.patch \
 "
=20
 S =3D "${WORKDIR}/git"
-SRCREV =3D "37c378a563d5b1c269d57c34671edc940d1cd180"
+SRCREV =3D "46e93c0c0dafc381e8a308b1befb07e908121722"
=20
 ANY_OF_DISTRO_FEATURES =3D "${GTK3DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data opengl"
@@ -52,10 +53,6 @@ PACKAGECONFIG[tnef] =3D "-Dtnef=3Denabled,-Dtnef=3Ddis=
abled,libytnef"
 PACKAGECONFIG[valadoc] =3D "-Dvaladoc=3Denabled,-Dvaladoc=3Ddisabled"
=20
 PACKAGECONFIG ??=3D ""
-# rfc822/rfc822-message.c:2097:12: error: incompatible pointer to intege=
r conversion returning 'void *' from a function with result type 'gboolea=
n' (aka 'int') [-Wint-conversion]
-#|                                 return NULL;
-#|                                        ^~~~
-CFLAGS:append:toolchain-clang =3D " -Wno-error=3Dint-conversion"
=20
 FILES:${PN} +=3D "${datadir}"
=20
--=20
2.45.1


