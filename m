Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9301CD37B4
	for <webhook@archiver.kernel.org>; Sun, 17 Sep 2023 14:16:01 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.30574.1694960151170120439
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 17 Sep 2023 07:15:51 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout11.t-online.de (Postfix) with SMTP id D5CA21864B
	for <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 16:15:33 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([79.219.232.208]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1qhsYd-1ICELK0; Sun, 17 Sep 2023 16:15:31 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 2/2] tracker-miners: upgrade 3.5.0 -> 3.6.0
Date: Sun, 17 Sep 2023 16:15:06 +0200
Message-ID: <20230917141520.3166264-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230917141520.3166264-1-f_l_k@t-online.de>
References: <20230917141520.3166264-1-f_l_k@t-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TOI-EXPURGATEID: 150726::1694960131-73FFC980-176BA974/0/0 CLEAN NORMAL
X-TOI-MSGID: 6a755478-609a-49f5-a28e-8864dfbf54c4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 17 Sep 2023 14:16:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104911

- fix various reproducibility issues
- build with sccomp by default and remove the according patch

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../0001-fix-reproducibility.patch            | 108 ++++++++++++++++++
 ...-warn-if-we-build-without-libseccomp.patch |  37 ------
 ...iners_3.5.0.bb =3D> tracker-miners_3.6.0.bb} |  10 +-
 3 files changed, 114 insertions(+), 41 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/tracker/tracker-miners/0001-=
fix-reproducibility.patch
 delete mode 100644 meta-gnome/recipes-gnome/tracker/tracker-miners/0001-=
meson.build-Just-warn-if-we-build-without-libseccomp.patch
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.5.0.bb =3D> tr=
acker-miners_3.6.0.bb} (91%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-rep=
roducibility.patch b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001=
-fix-reproducibility.patch
new file mode 100644
index 000000000..dd5525616
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducib=
ility.patch
@@ -0,0 +1,108 @@
+From 2bbd07843e8ec34311cafab35f21b40c86e0dd7f Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 12 Sep 2023 17:00:41 +0200
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
+ meson.build                        | 20 ++++++++++----------
+ src/tracker-extract/meson.build    |  2 +-
+ tests/tracker-miner-fs/meson.build |  2 +-
+ 3 files changed, 12 insertions(+), 12 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 935584185..aa6126081 100644
+--- a/meson.build
++++ b/meson.build
+@@ -380,7 +380,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.pro=
ject_version()))
+ conf.set('TRACKER_VERSION', '"@0@"'.format(meson.project_version()))
+=20
+ # Config that goes in some other generated files (.desktop, .pc, etc)
+-conf.set('abs_top_builddir', meson.current_build_dir())
++conf.set('abs_top_builddir', '')
+ conf.set('exec_prefix', get_option('prefix'))
+ conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir'=
)))
+ conf.set('datadir', datadir)
+@@ -409,7 +409,7 @@ tracker_c_args =3D [
+ configinc =3D include_directories('./')
+ srcinc =3D include_directories('src/')
+=20
+-build_root =3D meson.current_build_dir()
++build_root =3D ''
+=20
+ # We use tracker-miners-3.0 rather than tracker3-miners inside the lib6=
4
+ # directory, following the existing convention in that directory.
+@@ -421,10 +421,10 @@ tracker_writeback_modules_dir =3D join_paths(get_o=
ption('prefix'), get_option('lib
+ tracker_extract_rules_dir =3D join_paths(get_option('prefix'), get_opti=
on('datadir'), tracker_versioned_name, 'extract-rules')
+ tracker_miner_services_dir =3D join_paths(get_option('prefix'), get_opt=
ion('datadir'), tracker_versioned_name, 'miners')
+=20
+-tracker_uninstalled_cli_subcommands_dir =3D meson.current_build_dir() /=
 'src' / 'tracker' / 'subcommands'
+-tracker_uninstalled_extract_rules_dir =3D join_paths(meson.current_buil=
d_dir(), 'src', 'tracker-extract', 'uninstalled-rules')
+-tracker_uninstalled_writeback_modules_dir =3D join_paths(meson.current_=
build_dir(), 'src', 'tracker-writeback')
+-uninstalled_tracker_extract_path =3D join_paths(meson.current_build_dir=
(), 'src', 'tracker-extract', 'tracker-extract-3')
++tracker_uninstalled_cli_subcommands_dir =3D '/usr/src/debug/tracker/src=
/tracker/subcommands'
++tracker_uninstalled_extract_rules_dir =3D join_paths('usr', 'src', 'deb=
ug', 'tracker', 'src', 'tracker-extract', 'uninstalled-rules')
++tracker_uninstalled_writeback_modules_dir =3D join_paths('usr', 'src', =
'debug', 'tracker', 'src', 'tracker-writeback')
++uninstalled_tracker_extract_path =3D join_paths('usr', 'src', 'debug', =
'tracker', 'src', 'tracker-extract', 'tracker-extract-3')
+=20
+ gsettings_schema_dir =3D join_paths(get_option('prefix'), get_option('d=
atadir'), 'glib-2.0', 'schemas')
+ po_dir =3D join_paths(meson.current_source_dir(), 'po')
+@@ -438,8 +438,8 @@ subdir('data')
+ subdir('docs')
+=20
+ test_c_args =3D tracker_c_args + [
+-  '-DTOP_BUILDDIR=3D"@0@/"'.format(meson.build_root()),
+-  '-DTOP_SRCDIR=3D"@0@/"'.format(meson.source_root()),
++  '-DTOP_BUILDDIR=3D"@0@/"'.format(''),
++  '-DTOP_SRCDIR=3D"@0@/"'.format('/usr/src/debug/tracker'),
+ ]
+=20
+ if get_option('tests_tap_protocol')
+@@ -454,9 +454,9 @@ run_uninstalled_conf =3D configuration_data()
+ run_uninstalled_conf.set('tracker_sparql_uninstalled_dir', tracker_spar=
ql_uninstalled_dir)
+ run_uninstalled_conf.set('tracker_uninstalled_cli_dir', tracker_uninsta=
lled_cli_dir)
+ run_uninstalled_conf.set('tracker_uninstalled_cli_subcommands_dir', tra=
cker_uninstalled_cli_subcommands_dir)
+-run_uninstalled_conf.set('tracker_uninstalled_domain_rule', meson.curre=
nt_build_dir() / 'tests' / 'functional-tests' / 'config' / 'test-domain.r=
ule')
++run_uninstalled_conf.set('tracker_uninstalled_domain_rule', '/usr/src/d=
ebug/tracker/tests/functional-tests/config/test-domain.rule')
+ run_uninstalled_conf.set('tracker_uninstalled_extract_rules_dir', track=
er_uninstalled_extract_rules_dir)
+-run_uninstalled_conf.set('tracker_uninstalled_extractors_dir', meson.cu=
rrent_build_dir() / 'src' / 'tracker-extract')
++run_uninstalled_conf.set('tracker_uninstalled_extractors_dir', '/usr/sr=
c/debug/tracker/src/tracker-extract')
+ run_uninstalled_conf.set('tracker_uninstalled_miner_services_dir', trac=
ker_uninstalled_miner_services_dir)
+ run_uninstalled_conf.set('tracker_uninstalled_testutils_dir', tracker_u=
ninstalled_testutils_dir)
+ run_uninstalled_conf.set('tracker_uninstalled_writeback_modules_dir', t=
racker_uninstalled_writeback_modules_dir)
+diff --git a/src/tracker-extract/meson.build b/src/tracker-extract/meson=
.build
+index 4aaad5c41..d17cce221 100644
+--- a/src/tracker-extract/meson.build
++++ b/src/tracker-extract/meson.build
+@@ -159,7 +159,7 @@ endif
+ executable('tracker-extract-@0@'.format(tracker_api_major),
+   tracker_extract_sources,
+   # Manually add the root dir to work around https://github.com/mesonbu=
ild/meson/issues/1387
+-  c_args: tracker_c_args + ['-I' + meson.build_root()],
++  c_args: tracker_c_args,
+   export_dynamic: true,
+   dependencies: tracker_extract_dependencies,
+   install: true,
+diff --git a/tests/tracker-miner-fs/meson.build b/tests/tracker-miner-fs=
/meson.build
+index e131b85ad..59e509fa6 100644
+--- a/tests/tracker-miner-fs/meson.build
++++ b/tests/tracker-miner-fs/meson.build
+@@ -19,7 +19,7 @@ libtracker_miner_test_c_args =3D [
+ ]
+=20
+ libtracker_miner_test_environment =3D environment()
+-libtracker_miner_test_environment.set('GSETTINGS_SCHEMA_DIR', join_path=
s(meson.build_root(), 'data'))
++libtracker_miner_test_environment.set('GSETTINGS_SCHEMA_DIR', '/usr/src=
/debug/tracker-miners/data')
+=20
+ libtracker_miner_test_deps =3D [tracker_miners_common_dep, tracker_mine=
r_dep, tracker_sparql]
+=20
+--=20
+2.41.0
+
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.b=
uild-Just-warn-if-we-build-without-libseccomp.patch b/meta-gnome/recipes-=
gnome/tracker/tracker-miners/0001-meson.build-Just-warn-if-we-build-witho=
ut-libseccomp.patch
deleted file mode 100644
index 53c5f2664..000000000
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-meson.build-Ju=
st-warn-if-we-build-without-libseccomp.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 54ea2cabf85ad1bd5695cdbd1935115c9495e80c Mon Sep 17 00:00:00 2001
-From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@gmail.c=
om>
-Date: Sun, 1 Dec 2019 17:06:59 +0100
-Subject: [PATCH] meson.build: Just warn if we build without libseccomp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-libseccomp lives in meta-security currently and we cannot make it a mand=
atory
-dependency. Once somebody moves libseccomp to meta-oe and adjusts all th=
e
-target specific knobs this patch can go. For discussion see [1].
-
-[1] http://lists.openembedded.org/pipermail/openembedded-devel/2019-Nove=
mber/203234.html
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Andreas M=C3=BCller <schnitzeltony@gmail.com>
----
- meson.build | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/meson.build b/meson.build
-index 71a9df4..1eaa1a0 100644
---- a/meson.build
-+++ b/meson.build
-@@ 299,7 +299,7 @@ cpu_supports_seccomp =3D not unsupported_cpus.contain=
s(host_cpu)
- seccomp_required =3D system_supports_seccomp and cpu_supports_seccomp a=
nd get_option('seccomp') and get_option('extract')
-=20
- if not libseccomp.found() and seccomp_required
--  error('Libseccomp is mandatory for sandboxed metadata extraction')
-+  warning('Building without Libseccomp might cause security issues!')
- endif
-=20
- ####################################################################
---=20
-2.21.0
-
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.5.0.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb
similarity index 91%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.5.0.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb
index d093697c1..d89915502 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.5.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.6.0.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D " \
     intltool-native \
+    libseccomp \
     tracker \
     zlib \
 "
@@ -15,10 +16,11 @@ GNOMEBASEBUILDCLASS =3D "meson"
=20
 inherit gnomebase gsettings gobject-introspection vala bash-completion f=
eatures_check
=20
-SRC_URI +=3D "file://0001-meson.build-Just-warn-if-we-build-without-libs=
eccomp.patch \
-	    file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.pa=
tch \
-           "
-SRC_URI[archive.sha256sum] =3D "17966603dc432a98526b490586a48acd7f9f5993=
5f7895dfc51729a46a6901a3"
+SRC_URI:append =3D " \
+	file://0001-fix-reproducibility.patch \
+	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch =
\
+"
+SRC_URI[archive.sha256sum] =3D "c2ed9f6b0410195863b84c7b5467c5bc1255e96d=
658741192b5e92568a3bebd0"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.41.0


