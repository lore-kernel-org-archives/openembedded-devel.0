Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEBDC3600B
	for <webhook@archiver.kernel.org>; Thu, 27 Mar 2025 23:27:55 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.256.1743118067114245236
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Mar 2025 16:27:47 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout02.t-online.de (Postfix) with SMTP id E648C980;
	Fri, 28 Mar 2025 00:27:44 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.173.104]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1txwdN-4NwXkv0; Fri, 28 Mar 2025 00:27:37 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-gnome][PATCHv6] gimp: update 2.10.38 - 3.0.2
Date: Fri, 28 Mar 2025 00:28:22 +0100
Message-ID: <20250327232822.401507-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1743118057-AD7F1ACD-8C1C844A/10/3626336762 SUSPECT URL
X-TOI-MSGID: 549e8848-b6e0-4ac6-ae7a-14f4b8fbd706
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Mar 2025 23:27:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116333

At long last, the first release of GIMP 3.0 is here! This is the end resu=
lt of seven years of hard work
by volunteer developers, designers, artists, and community members (for r=
eference, GIMP 2.10
was first published in 2018 and the initial development version of GIMP 3=
.0 was released in 2020).
With GIMP 3.0 you can do more than ever before, more easily, more quickly=
!

Highlights

- Need to tweak a filter you applied hours ago? New in GIMP 3.0 is non-de=
structive editing for most commonly-used filters. See the changes in real=
 time with on-canvas preview.
- Exchange files with more applications, including BC7 DDS files as well =
as better PSD export and many new formats.
- Don=E2=80=99t know how big to make your drawing? Simply set your paint =
tool to expand layers automatically as needed.
- Making pro-quality text got easier, too. Style your text, apply outline=
s, shadows, bevels, and more, and you can still edit your text, change fo=
nt and size, and even tweak the style settings.
- Organizing your layers has become much easier with the ability to selec=
t multiple items at once, move them or transform them all together!
- Color Management was again improved, as our long-term project to make G=
IMP an advanced image editor for all usages.
- Updated graphical toolkit (GTK3) for modern desktop usage.
- New Wilber logo!

https://gitlab.gnome.org/GNOME/gimp/-/blob/GIMP_3_0_0/NEWS?ref_type=3Dtag=
s

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...irst-line-of-compiler-version-string.patch |  30 ----
 ...f-load-fix-mismatching-variable-type.patch |  24 ----
 .../0001-gimp-cross-compile-fix-for-bz2.patch |  30 ++++
 ...1-gimptool-allow-default-CC-override.patch |  85 ------------
 ...dd-build-time-library-paths-to-LD_LI.patch |  34 -----
 .../0001-meson.build-dont-check-for-lgi.patch |  35 +++++
 ...001-metadata-shut-up-a-weird-warning.patch |  22 ---
 ...0002-meson.build-reproducibility-fix.patch |  56 ++++++++
 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb  | 101 --------------
 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb    | 131 ++++++++++++++++++
 10 files changed, 252 insertions(+), 296 deletions(-)
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep=
-first-line-of-compiler-version-string.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load=
-fix-mismatching-variable-type.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-com=
pile-fix-for-bz2.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow=
-default-CC-override.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not=
-add-build-time-library-paths-to-LD_LI.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-do=
nt-check-for-lgi.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-=
up-a-weird-warning.patch
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-re=
producibility-fix.patch
 delete mode 100644 meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
 create mode 100644 meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb

diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-=
line-of-compiler-version-string.patch b/meta-gnome/recipes-gimp/gimp/gimp=
/0001-configure-Keep-first-line-of-compiler-version-string.patch
deleted file mode 100644
index 618b4cc7a7..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-configure-Keep-first-line-of=
-compiler-version-string.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5711ccfab40e304ced7f5be39a4083e3fcecff91 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 May 2023 22:22:41 -0700
-Subject: [PATCH] configure: Keep first line of compiler version string
-
-Full output of cc -v may contain additional information which could
-contain build path information, which is unnessasary
-
-Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gimp/-/merge_=
requests/926]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index c25415d..68707a0 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -599,7 +599,7 @@ fi
- for CC_VERSION_OPT in $CC_VERSION_OPTS; do
-   # We run $CC, and escape and format its output, in a single step,
-   # since some shells expand escape sequences in "echo" arguments.
--  CC_VERSION=3D"`$CC $CC_VERSION_OPT 2>&1 | sed -e 's/\\\\/\\\\\\\\\\\\=
\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
-+  CC_VERSION=3D"`$CC $CC_VERSION_OPT 2>&1 | head -1 | sed -e 's/\\\\/\\=
\\\\\\\\\\\\\\/g;s/^/\\\\t/;s/$/\\\\n/' | tr -d '\n'`"
-   if test $? -eq 0; then
-     break
-   fi
---=20
-2.40.1
-
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mi=
smatching-variable-type.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-fi=
le-tiff-load-fix-mismatching-variable-type.patch
deleted file mode 100644
index 13b3dda144..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-file-tiff-load-fix-mismatchi=
ng-variable-type.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From a2458f1528e5733574bb26ff5452b1329116e6db Mon Sep 17 00:00:00 2001
-From: Simon Budig <simon@budig.de>
-Date: Sat, 20 May 2023 18:40:41 +0200
-Subject: [PATCH] file-tiff-load: fix mismatching variable type
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
a2458f1528e5733574bb26ff5452b1329116e6db]
-Signed-off-by: Khem Raj <raj.khem@gmai.com>
----
- plug-ins/file-tiff/file-tiff-load.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
---- a/plug-ins/file-tiff/file-tiff-load.c
-+++ b/plug-ins/file-tiff/file-tiff-load.c
-@@ -1301,8 +1301,8 @@ load_image (GFile        *file,
-=20
-       /* any resolution info in the file? */
-       {
--        gfloat   xres =3D 72.0;
--        gfloat   yres =3D 72.0;
-+        gdouble   xres =3D 72.0;
-+        gdouble   yres =3D 72.0;
-         gushort  read_unit;
-         GimpUnit unit =3D GIMP_UNIT_PIXEL; /* invalid unit */
-=20
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fi=
x-for-bz2.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compi=
le-fix-for-bz2.patch
new file mode 100644
index 0000000000..721225c8b3
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimp-cross-compile-fix-for-b=
z2.patch
@@ -0,0 +1,30 @@
+From a7e40e19d17404cf5ec4135fc1becd5a90f5e1e1 Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Wed, 25 Dec 2024 07:27:04 +0100
+Subject: [PATCH] gimp: cross-compile fix for bz2
+
+autotools bzip2 build does not create pkgconfig files so looking for the=
 dependency fails.
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [can probably be removed once bzip2 is bu=
ilt with meson or cmake]
+---
+ meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index 4e48f8c64c..d5dce47015 100644
+--- a/meson.build
++++ b/meson.build
+@@ -765,7 +765,7 @@ zlib =3D dependency('zlib')
+ MIMEtypes +=3D 'image/x-psp'
+=20
+ # Compiler-provided headers can't be found in crossroads environment
+-if not meson.is_cross_build()
++if true
+   bz2 =3D cc.find_library('bz2')
+ else
+   bz2 =3D dependency('bzip2')
+--=20
+2.47.1
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-defaul=
t-CC-override.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-all=
ow-default-CC-override.patch
deleted file mode 100644
index b04a16cec7..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-gimptool-allow-default-CC-ov=
erride.patch
+++ /dev/null
@@ -1,85 +0,0 @@
-From 7e5b986cb7797a6535fe2471b9a5fb7c00821f51 Mon Sep 17 00:00:00 2001
-From: Yoann Congal <yoann.congal@smile.fr>
-Date: Sun, 13 Oct 2024 01:00:10 +0200
-Subject: [PATCH] gimptool: allow default CC override
-
-From: Yoann Congal <yoann.congal@smile.fr>
-
-In OE, CC contains sysroot path. Storing CC in binary then leads to
-non-reproducibility.
-
-This commit add a new configure option "--with-default-cc=3D'cmd'" for
-force the CC stored in gimptool to a reproducible value.
-
-Upstream-Status: Inappropriate [does not apply on master (upstream has m=
oved to meson)]
-Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
----
- app-tools/Makefile.am |  2 +-
- configure.ac          | 13 +++++++++++++
- tools/Makefile.am     |  2 +-
- tools/gimptool.c      |  2 +-
- 4 files changed, 16 insertions(+), 3 deletions(-)
-
-diff --git a/app-tools/Makefile.am b/app-tools/Makefile.am
-index a7cd4ce..81a3a00 100644
---- a/app-tools/Makefile.am
-+++ b/app-tools/Makefile.am
-@@ -67,7 +67,7 @@ AM_CPPFLAGS =3D \
- 	-DMANDIR=3D\""$(mandir)"\"				\
- 	-DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\"			\
- 	-DGIMPDATADIR=3D\""$(gimpdatadir)"\"			\
--	-DCC=3D\""$(CC)"\"					\
-+	-DDEFAULT_CC=3D\""@DEFAULT_CC@"\"				\
- 	-DGIMPDIR=3D\""$(gimpdir)"\"				\
- 	-DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\"	\
- 	-I$(top_srcdir)						\
-diff --git a/configure.ac b/configure.ac
-index a88b7cc..d90b6db 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -2457,6 +2457,19 @@ fi
- AM_CONDITIONAL(DESKTOP_DATADIR, test "x$with_desktop_dir" !=3D xno)
- AC_SUBST(DESKTOP_DATADIR)
-=20
-+######################
-+# Determine default CC
-+######################
-+
-+AC_ARG_WITH(default-cc, [ --with-default-cc=3D"cmd" default CC to print=
 in gimptool (default=3DCC)])
-+
-+if test "x$with_default_cc" !=3D x; then
-+  DEFAULT_CC=3D$with_default_cc
-+else
-+  DEFAULT_CC=3DCC
-+fi
-+
-+AC_SUBST(DEFAULT_CC)
-=20
- #####################
- # Check for XML tools
-diff --git a/tools/Makefile.am b/tools/Makefile.am
-index 420b9b1..ccabde8 100644
---- a/tools/Makefile.am
-+++ b/tools/Makefile.am
-@@ -87,7 +87,7 @@ AM_CPPFLAGS =3D \
- 	-DMANDIR=3D\""$(mandir)"\"				\
- 	-DGIMPPLUGINDIR=3D\""$(gimpplugindir)"\"			\
- 	-DGIMPDATADIR=3D\""$(gimpdatadir)"\"			\
--	-DCC=3D\""$(CC)"\"					\
-+	-DDEFAULT_CC=3D\""@DEFAULT_CC@"\"				\
- 	-DGIMPDIR=3D\""$(gimpdir)"\"				\
- 	-DGIMP_PLUGIN_VERSION=3D\""$(GIMP_PLUGIN_VERSION)"\"	\
- 	-I$(top_srcdir)						\
-diff --git a/tools/gimptool.c b/tools/gimptool.c
-index 21fc043..bbf3fa5 100644
---- a/tools/gimptool.c
-+++ b/tools/gimptool.c
-@@ -280,7 +280,7 @@ find_out_env_flags (void)
-   else if (msvc_syntax)
-     env_cc =3D "cl -MD";
-   else
--    env_cc =3D CC;
-+    env_cc =3D DEFAULT_CC;
-=20
-   if (g_ascii_strncasecmp (env_cc, "cl", 2)    =3D=3D 0 &&
-       g_ascii_strncasecmp (env_cc, "clang", 5) !=3D 0)
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-bu=
ild-time-library-paths-to-LD_LI.patch b/meta-gnome/recipes-gimp/gimp/gimp=
/0001-libtool-Do-not-add-build-time-library-paths-to-LD_LI.patch
deleted file mode 100644
index cec0055284..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-libtool-Do-not-add-build-tim=
e-library-paths-to-LD_LI.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From c720df90dfe3a3e92e34bfb36a04cc792064a501 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 24 May 2023 22:39:02 -0700
-Subject: [PATCH] libtool: Do not add build time library paths to
- LD_LIBRARY_PATH
-
-This does not serve much purpose on cross builds as it will add build
-time paths which are only useful when trying to run these tools from
-build area but when they are cross built this is not possible to run
-them like this.
-
-Upstream-Status: Inappropriate [Cross-compile specific]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ltmain.sh | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/ltmain.sh b/ltmain.sh
-index 134902c..068d74a 100644
---- a/ltmain.sh
-+++ b/ltmain.sh
-@@ -5748,7 +5748,7 @@ func_exec_program ()
- 	if test yes =3D "$shlibpath_overrides_runpath" && test -n "$shlibpath_=
var" && test -n "$temp_rpath"; then
- 	  $ECHO "\
-     # Add our own library path to $shlibpath_var
--    $shlibpath_var=3D\"$temp_rpath\$$shlibpath_var\"
-+    $shlibpath_var=3D\"$shlibpath_var\"
-=20
-     # Some systems cannot cope with colon-terminated $shlibpath_var
-     # The second colon is a workaround for a bug in BeOS R4 sed
---=20
-2.40.1
-
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-chec=
k-for-lgi.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont=
-check-for-lgi.patch
new file mode 100644
index 0000000000..63a9159a43
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0001-meson.build-dont-check-for-l=
gi.patch
@@ -0,0 +1,35 @@
+From e56a6330f1e29e489601ea3e7cb31bfd2ebb787a Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Thu, 27 Mar 2025 21:02:22 +0100
+Subject: [PATCH] meson.build: dont check for lgi
+
+Checking if host can run lgi is pointless for cross-compile
+Set to be always true because we ensure to install lgi via PACKAGECONFIG
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build | 6 +-----
+ 1 file changed, 1 insertion(+), 5 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index c91e8fc97d..efbc2d8175 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1235,11 +1235,7 @@ if have_lua
+       endif
+=20
+       if is_supported_lua
+-        have_lua_lgi =3D run_command(lua, '-e',
+-                                   '''
+-                                   local lgi =3D require 'lgi'
+-                                   ''',
+-                                   check: false).returncode() =3D=3D 0
++        have_lua_lgi =3D true
+       endif
+=20
+       if have_lua_lgi
+--=20
+2.49.0
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-we=
ird-warning.patch b/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-=
up-a-weird-warning.patch
deleted file mode 100644
index 4f04ac8250..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp/0001-metadata-shut-up-a-weird-war=
ning.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-From 51311f913d9f417d121f59b83d560c7b4b853d1c Mon Sep 17 00:00:00 2001
-From: Simon Budig <simon@budig.de>
-Date: Sat, 20 May 2023 22:25:40 +0200
-Subject: [PATCH] metadata: shut up a weird warning
-
-Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/gimp/-/commit/=
51311f913d9f417d121f59b83d560c7b4b853d1c]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- plug-ins/metadata/metadata-editor.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
---- a/plug-ins/metadata/metadata-editor.c
-+++ b/plug-ins/metadata/metadata-editor.c
-@@ -2140,7 +2140,7 @@ metadata_dialog_editor_set_metadata (GEx
-                             }
-                           else
-                             {
--                              if (! g_strv_contains (values, equiv_valu=
es[evi]))
-+                              if (! g_strv_contains ((const gchar * con=
st *) values, equiv_values[evi]))
-                                 {
-                                   gchar *tmpvalue;
-=20
diff --git a/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproduci=
bility-fix.patch b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-rep=
roducibility-fix.patch
new file mode 100644
index 0000000000..532715d588
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp/0002-meson.build-reproducibility-=
fix.patch
@@ -0,0 +1,56 @@
+From bf19c5687703769e406a8086036d4ed6421c33cb Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 13 Jan 2025 10:04:33 +0100
+Subject: [PATCH] meson.build: reproducibility fix
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Inappropriate [oe-specific]
+---
+ meson.build | 28 ++++++++++++++--------------
+ 1 file changed, 14 insertions(+), 14 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 97cd621780..e47180db87 100644
+--- a/meson.build
++++ b/meson.build
+@@ -1599,23 +1599,23 @@ conf.set('HAVE_FUNC_ATTRIBUTE_DESTRUCTOR',
+ conf.set_quoted('CC',             cc.get_id())
+=20
+ cc_version=3D''
+-if cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D 'clang'
+-  cc_cmd =3D run_command(cc, '-v', check: false)
++#if cc.get_id() =3D=3D 'gcc' or cc.get_id() =3D=3D 'clang'
++#  cc_cmd =3D run_command(cc, '-v', check: false)
+   # Note: the call might actually fail when using ccache.
+   # See: https://github.com/mesonbuild/meson/issues/6174
+-  if cc_cmd.returncode() =3D=3D 0
+-    cc_version =3D cc_cmd.stdout() + cc_cmd.stderr()
+-  endif
+-else
++#  if cc_cmd.returncode() =3D=3D 0
++#    cc_version =3D cc_cmd.stdout() + cc_cmd.stderr()
++#  endif
++#else
+   # Various compilers have various options. Try most common ones. This
+   # list of options comes from autotools checks.
+-  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
+-    cc_cmd =3D run_command(cc, arg, check: false)
+-    if cc_cmd.returncode() =3D=3D 0
+-      cc_version =3D cc_cmd.stdout()
+-    endif
+-  endforeach
+-endif
++#  foreach arg : [ '--version', '-v', '-V', '-qversion' ]
++#    cc_cmd =3D run_command(cc, arg, check: false)
++#    if cc_cmd.returncode() =3D=3D 0
++#      cc_version =3D cc_cmd.stdout()
++#    endif
++#  endforeach
++#endif
+ if cc_version =3D=3D ''
+   # We didn't manage to get a meaningful verbose version from the
+   # compiler. Just save its name and version.
+--=20
+2.47.1
+
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb b/meta-gnome/re=
cipes-gimp/gimp/gimp_2.10.38.bb
deleted file mode 100644
index 0272e05e96..0000000000
--- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
+++ /dev/null
@@ -1,101 +0,0 @@
-SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
-HOMEPAGE =3D "http://www.gimp.org"
-SECTION =3D "x11/graphics"
-LICENSE =3D "GPL-3.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e"
-
-DEPENDS =3D " \
-    alsa-lib \
-    atk \
-    cairo \
-    fontconfig \
-    freetype \
-    gdk-pixbuf-native \
-    intltool-native \
-    libxslt-native \
-    gegl-native \
-    dbus-glib \
-    gtk+ \
-    babl \
-    gegl \
-    libmypaint \
-    mypaint-brushes-1.0 \
-    gexiv2 \
-    jpeg \
-    libmng \
-    libpng \
-    libexif \
-    tiff \
-    lcms \
-    poppler \
-    poppler-data \
-    jasper \
-    bzip2 \
-    libgudev \
-    libmng \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libxmu libxpm', '', =
d)} \
-"
-DEPENDS:append:libc-musl =3D " libexecinfo"
-
-GNOMEBASEBUILDCLASS =3D "autotools"
-inherit features_check gnomebase gtk-icon-cache gtk-doc mime-xdg
-
-REQUIRED_DISTRO_FEATURES =3D "x11"
-
-SHPV =3D "${@gnome_verdir("${PV}")}"
-
-SRC_URI =3D "https://download.gimp.org/pub/${BPN}/v${SHPV}/${BP}.tar.bz2=
 \
-           file://0001-configure-Keep-first-line-of-compiler-version-str=
ing.patch \
-           file://0001-libtool-Do-not-add-build-time-library-paths-to-LD=
_LI.patch \
-           file://0001-file-tiff-load-fix-mismatching-variable-type.patc=
h \
-           file://0001-metadata-shut-up-a-weird-warning.patch \
-           file://0001-gimptool-allow-default-CC-override.patch \
-           "
-SRC_URI[sha256sum] =3D "50a845eec11c8831fe8661707950f5b8446e35f30edfb9ac=
f98f85c1133f856e"
-
-EXTRA_OECONF =3D "--disable-python \
-                --without-webkit \
-                --disable-check-update \
-                --without-wmf"
-
-EXTRA_OECONF +=3D "${@oe.utils.conditional('SITEINFO_BITS', '32', ' --di=
sable-vector-icons', '', d)}"
-
-do_configure:append() {
-    find ${B} -name Makefile | xargs sed -i s:'-I$(includedir)':'-I.':g
-    find ${B} -name Makefile | xargs sed -i s:'-I/usr/include':'-I${STAG=
ING_INCDIR}':g
-}
-
-do_compile:prepend() {
-    # Let native babl/gegl find their plugins
-    export BABL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name =
'babl-*'`
-    export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1 -name =
'gegl-*'`
-}
-
-FILES:${PN}  +=3D "${datadir}/metainfo"
-
-RDEPENDS:${PN} +=3D "mypaint-brushes-1.0"
-
-
-# gimptool
-
-# gimptool needs a CC definition, use current CC without sysroot
-python __anonymous() {
-    import shlex
-    CC_WITHOUT_SYSROOT =3D shlex.join(filter(lambda x: not x.startswith(=
"--sysroot=3D"), shlex.split(d.getVar("CC"))))
-    d.setVar("CC_WITHOUT_SYSROOT", CC_WITHOUT_SYSROOT)
-}
-EXTRA_OECONF +=3D "--with-default-cc=3D'${CC_WITHOUT_SYSROOT}'"
-
-# Split gimptool in its own package
-PACKAGE_BEFORE_PN +=3D "${PN}-gimptool"
-FILES:${PN}-gimptool +=3D "${bindir}/gimptool-2.0"
-
-# gimptool depends on gimp .pc file being installed and tools to build t=
he plugin.
-RDEPENDS:${PN}-gimptool +=3D "${PN}-dev packagegroup-core-buildessential=
"
-INSANE_SKIP:${PN}-gimptool +=3D "dev-deps"
-
-
-CVE_STATUS[CVE-2007-3741] =3D "not-applicable-platform: This only applie=
s for Mandriva Linux"
-CVE_STATUS[CVE-2009-0581] =3D "cpe-incorrect: The current version (2.10.=
38) is not affected."
-CVE_STATUS[CVE-2009-0723] =3D "cpe-incorrect: The current version (2.10.=
38) is not affected."
-CVE_STATUS[CVE-2009-0733] =3D "cpe-incorrect: The current version (2.10.=
38) is not affected."
diff --git a/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb b/meta-gnome/reci=
pes-gimp/gimp/gimp_3.0.2.bb
new file mode 100644
index 0000000000..5ae50f7ccc
--- /dev/null
+++ b/meta-gnome/recipes-gimp/gimp/gimp_3.0.2.bb
@@ -0,0 +1,131 @@
+SUMMARY =3D "The GIMP is the GNU Image Manipulation Program"
+HOMEPAGE =3D "http://www.gimp.org"
+SECTION =3D "graphics"
+LICENSE =3D "GPL-3.0-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc678957b0c8e964aa6c70fd77641a=
71e"
+
+DEPENDS =3D " \
+    appstream-glib \
+    atk \
+    babl \
+    bzip2 \
+    bison-native \
+    cairo \
+    fontconfig \
+    freetype \
+    gdk-pixbuf-native \
+    gegl \
+    gexiv2 \
+    glib-2.0 \
+    glib-2.0-native \
+    gtk+3 \
+    harfbuzz \
+    iso-codes \
+    jpeg \
+    json-glib \
+    lcms \
+    libarchive \
+    libexif \
+    libmypaint \
+    libpng \
+    librsvg \
+    librsvg-native \
+    libxmu \
+    libxslt-native \
+    mypaint-brushes-1.0 \
+    pango \
+    poppler \
+    poppler-data \
+    python3-pygobject-native \
+    tiff \
+    xz \
+    zlib \
+"
+
+DEPENDS:append:libc-musl =3D " libexecinfo"
+
+inherit meson gtk-icon-cache mime-xdg pkgconfig gettext gobject-introspe=
ction vala
+
+GIR_MESON_OPTION =3D 'can-crosscompile-gir'
+VALA_MESON_OPTION =3D "vala"
+VALA_MESON_ENABLE_FLAG =3D "enabled"
+VALA_MESON_DISABLE_FLAG =3D "disabled"
+GIDOCGEN_MESON_OPTION =3D "gi-docgen"
+GIDOCGEN_MESON_ENABLE_FLAG =3D "enabled"
+GIDOCGEN_MESON_DISABLE_FLAG =3D "disabled"
+
+SRC_URI =3D "https://download.gimp.org/gimp/v${@oe.utils.trim_version('$=
{PV}', 2)}/gimp-${PV}.tar.xz"
+SRC_URI +=3D "file://0001-gimp-cross-compile-fix-for-bz2.patch"
+SRC_URI +=3D "file://0002-meson.build-reproducibility-fix.patch"
+SRC_URI +=3D "file://0001-meson.build-dont-check-for-lgi.patch"
+SRC_URI[sha256sum] =3D "546ddc30cb2d0e79123c7fcb4d78211e1ee7a6aace91a6a0=
ad8cbcbf6ea571a2"
+
+PACKAGECONFIG[aa] =3D "-Daa=3Denabled,-Daa=3Ddisabled,aalib"
+PACKAGECONFIG[alsa] =3D "-Dalsa=3Denabled,-Dalsa=3Ddisabled,alsa-lib"
+PACKAGECONFIG[appdata-test] =3D "-Dappdata-test=3Denabled,-Dappdata-test=
=3Ddisabled,appstream-native"
+PACKAGECONFIG[cairo-pdf] =3D "-Dcairo-pdf=3Denabled,-Dcairo-pdf=3Ddisabl=
ed"
+PACKAGECONFIG[check-update] =3D "-Dcheck-update=3Dyes,-Dcheck-update=3Dn=
o"
+PACKAGECONFIG[ghostscript] =3D "-Dghostscript=3Denabled,-Dghostscript=3D=
disabled,ghostscript,ghostscript"
+PACKAGECONFIG[gudev] =3D "-Dgudev=3Denabled,-Dgudev=3Ddisabled,libgudev"
+PACKAGECONFIG[heif] =3D "-Dheif=3Denabled,-Dheif=3Ddisabled,libheif"
+PACKAGECONFIG[javascript] =3D "-Djavascript=3Denabled,-Djavascript=3Ddis=
abled,,gjs"
+PACKAGECONFIG[jpeg2000] =3D "-Djpeg2000=3Denabled,-Djpeg2000=3Ddisabled,=
jasper"
+PACKAGECONFIG[jpeg-xl] =3D "-Djpeg-xl=3Denabled,-Djpeg-xl=3Ddisabled,lib=
jxl"
+PACKAGECONFIG[libunwind] =3D "-Dlibunwind=3Dtrue,-Dlibunwind=3Dfalse,lib=
unwind"
+PACKAGECONFIG[libbacktrace] =3D "-Dlibbacktrace=3Dtrue,-Dlibbacktrace=3D=
false,libbacktrace"
+PACKAGECONFIG[lua] =3D "-Dlua=3Dtrue,-Dlua=3Dfalse,,luajit lua-lgi"
+PACKAGECONFIG[mng] =3D "-Dmng=3Denabled,-Dmng=3Ddisabled,libmng"
+PACKAGECONFIG[openmp] =3D "-Dopenmp=3Denabled,-Dopenmp=3Ddisabled,gcc-ru=
ntime"
+PACKAGECONFIG[vector-icons] =3D "-Dvector-icons=3Dtrue,-Dvector-icons=3D=
false,librsvg shared-mime-info"
+PACKAGECONFIG[webp] =3D "-Dwebp=3Denabled,-Dwebp=3Ddisabled,libwebp"
+PACKAGECONFIG[xcursor] =3D "-Dxcursor=3Denabled,-Dxcursor=3Ddisabled,lib=
xcursor"
+PACKAGECONFIG[x11] =3D "-Dxpm=3Denabled,-Dxpm=3Ddisabled,libxpm libxext =
libxfixes"
+
+PACKAGECONFIG ?=3D " \
+    alsa \
+    cairo-pdf \
+    ghostscript \
+    gudev \
+    javascript \
+    jpeg2000 \
+    jpeg-xl \
+    lua \
+    mng \
+    webp \
+    ${@oe.utils.conditional('SITEINFO_BITS', '32', '', 'vector-icons', d=
)} \
+    ${@bb.utils.contains('LICENSE_FLAGS_ACCEPTED', 'commercial', 'heif',=
 '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcursor', '', d)=
} \
+"
+
+PACKAGECONFIG:remove:riscv32 =3D "lua"
+PACKAGECONFIG:remove:riscv64 =3D "lua"
+PACKAGECONFIG:remove:powerpc64 =3D "lua"
+PACKAGECONFIG:remove:powerpc64le =3D "lua"
+
+EXTRA_OEMESON +=3D " \
+    -Dshmem-type=3Dposix \
+    -Dlinux-input=3Denabled \
+    --buildtype release \
+    --cross-file=3D${WORKDIR}/meson-${PN}.cross \
+"
+
+do_write_config:append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+gjs =3D '${bindir}/gjs'
+luajit =3D '${bindir}/luajit'
+EOF
+}
+
+do_configure:append () {
+    sed -i -e "s|build_by_default: true|build_by_default: false|" ${S}/g=
imp-data/images/meson.build
+}
+
+do_install:prepend() {
+    sed -i -e "s|${B}||" ${B}/app/widgets/gimplanguagestore-data.h
+    sed -i -e "s|${B}||" ${B}/plug-ins/file-bmp/huffman.h
+}
+
+FILES:${PN} +=3D "${datadir}/metainfo"
+
+RDEPENDS:${PN} =3D "mypaint-brushes-1.0 glib-networking python3-pygobjec=
t"
--=20
2.49.0


