Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BED14C79F85
	for <webhook@archiver.kernel.org>; Sun,  6 Sep 2026 09:37:30 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11207.1788687445630927399
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 06 Sep 2026 02:37:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Iv8It3Kb;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd94.aul.t-online.de (fwd94.aul.t-online.de [10.223.144.120])
	by mailout11.t-online.de (Postfix) with SMTP id AA7481C456
	for <openembedded-devel@lists.openembedded.org>; Sun,  6 Sep 2026 11:37:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.35.20]) by fwd94.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x39JP-22AhJu0; Sun, 6 Sep 2026 11:37:19 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 15/15] localsearch: replace the reproducibility patch with a meson option
Date: Sun,  6 Sep 2026 11:37:13 +0200
Message-ID: <20260906093713.797648-15-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260906093713.797648-1-f_l_k@t-online.de>
References: <20260906093713.797648-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1788687439-EAFFA956-04FAE96D/0/0 CLEAN NORMAL
X-TOI-MSGID: 63c2f895-0469-4bd1-89c8-13dd1faba973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1788687441; i=f_l_k@t-online.de;
	bh=OttArXxZoJzsi6X7ERqwR7WET9IGR9wLO36FZCGF7hM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Iv8It3KbBNcLmyZH0oPkYJCiS3Uet7eJIq/5Ol3g4epqQB46CAmQg9JgnRb6vy/84
	 v4e01b5z73MvM3pxpzh2vYmwLHAoZaHjYgg6Bm4odP0qqMxTGhoAsMnWkZ3F3g1wxb
	 MmVlVEMzw/+B4IR+47f1zkKzd008IvRmz0zCfXp8MvuiVLILH+zzEVuRkyyUoTUImu
	 mrxBQImTVf3Kxo/pvLzvvfdgr1mWMYjgbQTFFOp2z3b1F1Uv9FyexJrbSg0YOir4nV
	 MZoZbMlYtq3cDifHMPQ/xBrZ+Y5LeTaH6kQq1vXCcw5a9CjVEIGzH0DPrRaJQAa/hu
	 1In227XuszdwQ==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 06 Sep 2026 09:37:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129793

The old patch pointed the compiled-in build tree paths at made-up
locations and disabled the landlock in-tree rules with #if 0, which left
the real BUILDROOT definition in libtracker-miners-common in place. It
also touched test-only values that never reach the installed files.

The new patch adds an "uninstalled_helpers" meson option that leaves out
the build tree defines and compiles the in-tree code paths away. It
keeps the developer workflow intact by default and can be sent upstream.

Build tested on corei7-64, the packaged binaries contain no build paths.

AI-Generated: Uses Claude Code (Claude Fable 5.1)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...on-to-disable-the-uninstalled-helper.patch | 279 ++++++++++++++++++
 .../0001-fix-reproducibility.patch            |  98 ------
 .../tracker/localsearch_3.11.1.bb             |   4 +-
 3 files changed, 281 insertions(+), 100 deletions(-)
 create mode 100644 meta-gnome/recipes-gnome/tracker/localsearch/0001-bui=
ld-add-an-option-to-disable-the-uninstalled-helper.patch
 delete mode 100644 meta-gnome/recipes-gnome/tracker/localsearch/0001-fix=
-reproducibility.patch

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-build-add-=
an-option-to-disable-the-uninstalled-helper.patch b/meta-gnome/recipes-gn=
ome/tracker/localsearch/0001-build-add-an-option-to-disable-the-uninstall=
ed-helper.patch
new file mode 100644
index 0000000000..994a6ef167
--- /dev/null
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-build-add-an-opti=
on-to-disable-the-uninstalled-helper.patch
@@ -0,0 +1,279 @@
+From 673ee0734c5aec9afbe24dc50a7436f67e42b7aa Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Sun, 6 Sep 2026 11:18:10 +0200
+Subject: [PATCH] build: add an option to disable the uninstalled helper =
paths
+
+The daemons and the command line tool compare their working directory
+with the compiled-in build root and, when they match, run the helpers
+from the build tree instead of libexecdir. That is convenient for
+development, but distribution builds have no use for it and the build
+directory ends up as a string in every installed binary, which breaks
+reproducible builds.
+
+Add a meson option "uninstalled_helpers" (default: true) that controls
+whether BUILDROOT, SRCROOT, BUILDDIR and BUILD_EXTRACTDIR are defined,
+and guard the in-tree code paths with #ifdef BUILDROOT so they compile
+away when it is disabled.
+
+Upstream-Status: Pending
+
+AI-Generated: Uses Claude Code (Claude Fable 5.1)
+---
+ meson.build                            | 12 ++++++++++++
+ meson_options.txt                      |  2 ++
+ src/cli/meson.build                    |  3 +--
+ src/cli/tracker-cli-utils.c            |  4 ++++
+ src/cli/tracker-extract.c              |  5 ++++-
+ src/cli/tracker-info.c                 |  5 ++++-
+ src/common/meson.build                 |  4 +---
+ src/common/tracker-landlock.c          |  4 +++-
+ src/indexer/meson.build                | 14 +++++++++++---
+ src/indexer/tracker-application.c      |  4 +++-
+ src/indexer/tracker-extract-watchdog.c |  4 +++-
+ 11 files changed, 48 insertions(+), 13 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 7a311d4..fd29c73 100644
+--- a/meson.build
++++ b/meson.build
+@@ -355,6 +355,18 @@ srcinc =3D include_directories('src/')
+=20
+ build_root =3D meson.current_build_dir()
+=20
++# Compiled-in build tree paths that let the daemons and tools run unins=
talled.
++# Distribution builds disable this so the build directory does not end =
up in
++# the binaries.
++if get_option('uninstalled_helpers')
++  build_tree_c_args =3D [
++    '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
++    '-DSRCROOT=3D"@0@"'.format(meson.global_source_root()),
++  ]
++else
++  build_tree_c_args =3D []
++endif
++
+ # We use tracker-miners-3.0 rather than tracker3-miners inside the lib6=
4
+ # directory, following the existing convention in that directory.
+ tracker_api_versioned_name =3D 'localsearch-@0@'.format(tracker_api_ver=
sion)
+diff --git a/meson_options.txt b/meson_options.txt
+index 70e764a..621d7ce 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -99,3 +99,5 @@ option('tests_tap_protocol', type: 'boolean', value: f=
alse,
+        description: 'Whether to enable TAP protocol on tests')
+ option('test_utils_dir', type: 'string', value: '',
+        description: 'Directory to install trackertestutils Python packa=
ge (or empty to use the default)')
++option('uninstalled_helpers', type: 'boolean', value: true,
++       description: 'Let the daemons and tools find their helpers in th=
e build tree when run uninstalled')
+diff --git a/src/cli/meson.build b/src/cli/meson.build
+index dd6177d..851ce05 100644
+--- a/src/cli/meson.build
++++ b/src/cli/meson.build
+@@ -44,11 +44,10 @@ executable(main_command_name,
+     sparql_gresource,
+     indexer_dbus_proxy,
+     control_dbus_proxy,
+-    c_args: tracker_c_args + [
++    c_args: tracker_c_args + build_tree_c_args + [
+         '-DMAIN_COMMAND_NAME=3D"@0@"'.format(main_command_name),
+         '-DLIBEXECDIR=3D"@0@"'.format(join_paths(get_option('prefix'), =
get_option('libexecdir'))),
+         '-DPYTHON_UTILS_DIR=3D"@0@"'.format(testutils_dir / 'trackertes=
tutils'),
+-        '-DBUILDROOT=3D"@0@"'.format(build_root),
+         '-DMANDIR=3D"@0@"'.format(join_paths(get_option('prefix'), get_=
option('datadir'), 'man')),
+         '-DBINDIR=3D"@0@"'.format(join_paths(get_option('prefix'), get_=
option('bindir'))),
+     ],
+diff --git a/src/cli/tracker-cli-utils.c b/src/cli/tracker-cli-utils.c
+index 735bb4b..a941921 100644
+--- a/src/cli/tracker-cli-utils.c
++++ b/src/cli/tracker-cli-utils.c
+@@ -199,6 +199,7 @@ tracker_cli_print_errors (GList    *keyfiles,
+ gboolean
+ tracker_cli_check_inside_build_tree (const gchar* argv0)
+ {
++#ifdef BUILDROOT
+ 	g_autoptr (GFile) build_root =3D NULL;
+ 	g_autoptr (GFile) path =3D NULL;
+=20
+@@ -206,4 +207,7 @@ tracker_cli_check_inside_build_tree (const gchar* ar=
gv0)
+ 	path =3D g_file_new_for_path (argv0);
+=20
+ 	return g_file_has_prefix (path, build_root);
++#else
++	return FALSE;
++#endif
+ }
+diff --git a/src/cli/tracker-extract.c b/src/cli/tracker-extract.c
+index 7342b24..cb74e9b 100644
+--- a/src/cli/tracker-extract.c
++++ b/src/cli/tracker-extract.c
+@@ -72,10 +72,13 @@ extract_files (char *output_format)
+=20
+ 	tracker_term_pipe_to_pager ();
+=20
++#ifdef BUILDROOT
+ 	if (inside_build_tree) {
+ 		/* Developer convenience - use uninstalled version if running from bu=
ild tree */
+ 		tracker_extract_path =3D g_build_filename(BUILDROOT, "src", "extracto=
r", EXTRACTOR_NAME, NULL);
+-	} else {
++	} else
++#endif
++	{
+ 		tracker_extract_path =3D g_build_filename(LIBEXECDIR, EXTRACTOR_NAME,=
 NULL);
+ 	}
+=20
+diff --git a/src/cli/tracker-info.c b/src/cli/tracker-info.c
+index 6b46f1f..18fadbd 100644
+--- a/src/cli/tracker-info.c
++++ b/src/cli/tracker-info.c
+@@ -311,10 +311,13 @@ output_eligible_status_for_file (gchar   *path,
+ {
+ 	g_autofree char *tracker_miner_fs_path =3D NULL;
+=20
++#ifdef BUILDROOT
+ 	if (inside_build_tree) {
+ 		/* Developer convenience - use uninstalled version if running from bu=
ild tree */
+ 		tracker_miner_fs_path =3D g_build_filename (BUILDROOT, "src", "indexe=
r", "localsearch-3", NULL);
+-	} else {
++	} else
++#endif
++	{
+ 		tracker_miner_fs_path =3D g_build_filename (LIBEXECDIR, "localsearch-=
3", NULL);
+ 	}
+=20
+diff --git a/src/common/meson.build b/src/common/meson.build
+index 93da66e..73b7388 100644
+--- a/src/common/meson.build
++++ b/src/common/meson.build
+@@ -52,13 +52,11 @@ endif
+ libtracker_miners_common =3D static_library('tracker-miners-common',
+   tracker_miners_common_sources,
+   dependencies: tracker_miners_common_dependencies + tracker_miners_com=
mon_private_dependencies,
+-  c_args: tracker_c_args + [
++  c_args: tracker_c_args + build_tree_c_args + [
+     '-DTRACKERSHAREDIR=3D"@0@"'.format(tracker_versioned_name),
+     '-DLIBDIR=3D"@0@"'.format(get_option ('libdir')),
+     '-DDATADIR=3D"@0@"'.format(get_option ('datadir')),
+     '-DPREFIX=3D"@0@"'.format(get_option ('prefix')),
+-    '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
+-    '-DSRCROOT=3D"@0@"'.format(meson.global_source_root()),
+     '-DLIBEXECDIR=3D"@0@"'.format(join_paths(get_option('prefix'), get_=
option('libexecdir'))),
+     '-DTRACKER_EXTRACTOR_RULES_DIR=3D"@0@"'.format(tracker_extract_rule=
s_dir),
+     '-DTRACKER_EXTRACTORS_DIR=3D"@0@"'.format(tracker_extract_modules_d=
ir)
+diff --git a/src/common/tracker-landlock.c b/src/common/tracker-landlock=
.c
+index a3f3905..3f136a3 100644
+--- a/src/common/tracker-landlock.c
++++ b/src/common/tracker-landlock.c
+@@ -234,7 +234,7 @@ tracker_landlock_init (const gchar         *executab=
le_name,
+ 		{ ".pki", LANDLOCK_ACCESS_FS_READ_DIR },
+ 		{ ".gnupg", LANDLOCK_ACCESS_FS_READ_DIR },
+ 	};
+-	g_autofree gchar *current_dir =3D NULL, *cache_dir =3D NULL, *executab=
le_path =3D NULL;
++	g_autofree gchar *current_dir G_GNUC_UNUSED =3D NULL, *cache_dir =3D N=
ULL, *executable_path =3D NULL;
+ 	g_auto (GStrv) library_paths =3D NULL;
+ 	const gchar *ld_library_path =3D NULL;
+ 	int i, landlock_fd;
+@@ -300,6 +300,7 @@ tracker_landlock_init (const gchar         *executab=
le_name,
+ 		}
+ 	}
+=20
++#ifdef BUILDROOT
+ 	current_dir =3D g_get_current_dir ();
+=20
+ 	/* Detect running in-tree */
+@@ -319,6 +320,7 @@ tracker_landlock_init (const gchar         *executab=
le_name,
+ 			          in_tree_rules[i].flags);
+ 		}
+ 	}
++#endif
+=20
+ 	/* Add user cache for readonly databases */
+ #ifdef MINER_FS_CACHE_LOCATION
+diff --git a/src/indexer/meson.build b/src/indexer/meson.build
+index 55ff6ab..0879e41 100644
+--- a/src/indexer/meson.build
++++ b/src/indexer/meson.build
+@@ -84,6 +84,15 @@ executable('localsearch-endpoint-@0@'.format(tracker_=
api_major),
+     install_rpath: tracker_internal_libs_dir,
+ )
+=20
++if get_option('uninstalled_helpers')
++  indexer_build_tree_c_args =3D [
++    '-DBUILDDIR=3D"@0@"'.format(meson.current_build_dir()),
++    '-DBUILD_EXTRACTDIR=3D"@0@"'.format(meson.project_build_root() / 's=
rc' / 'extractor'),
++  ]
++else
++  indexer_build_tree_c_args =3D []
++endif
++
+ executable('localsearch-@0@'.format(tracker_api_major),
+     sources,
+     miner_fs_resources[0], miner_fs_resources[1],
+@@ -91,9 +100,8 @@ executable('localsearch-@0@'.format(tracker_api_major=
),
+     dependencies: tracker_miner_fs_deps,
+     c_args: [
+         tracker_c_args,
+-        '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
+-        '-DBUILDDIR=3D"@0@"'.format(meson.current_build_dir()),
+-        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(meson.project_build_root() =
/ 'src' / 'extractor'),
++        build_tree_c_args,
++        indexer_build_tree_c_args,
+         '-DLIBEXECDIR=3D"@0@"'.format(get_option('prefix') / get_option=
('libexecdir')),
+     ],
+     install: true,
+diff --git a/src/indexer/tracker-application.c b/src/indexer/tracker-app=
lication.c
+index d3caf3d..c00ffaa 100644
+--- a/src/indexer/tracker-application.c
++++ b/src/indexer/tracker-application.c
+@@ -270,7 +270,7 @@ open_connection (TrackerApplication  *app,
+ 		g_autoptr (GSocket) socket =3D NULL;
+ 		g_autoptr (GIOStream) stream =3D NULL;
+ 		g_autoptr (GFile) location =3D NULL;
+-		g_autofree char *guid =3D NULL, *current_dir =3D NULL;
++		g_autofree char *guid =3D NULL, *current_dir G_GNUC_UNUSED =3D NULL;
+ 		const char *helper_path;
+=20
+ 		g_assert (instance->root);
+@@ -298,11 +298,13 @@ open_connection (TrackerApplication  *app,
+=20
+ 		guid =3D g_dbus_generate_guid ();
+=20
++#ifdef BUILDROOT
+ 		current_dir =3D g_get_current_dir ();
+=20
+ 		if (g_strcmp0 (current_dir, BUILDROOT) =3D=3D 0)
+ 			helper_path =3D BUILDDIR "/localsearch-endpoint-3";
+ 		else
++#endif
+ 			helper_path =3D LIBEXECDIR "/localsearch-endpoint-3";
+=20
+ 		location =3D g_file_get_child (instance->root, ".localsearch3");
+diff --git a/src/indexer/tracker-extract-watchdog.c b/src/indexer/tracke=
r-extract-watchdog.c
+index 27f6b49..37da365 100644
+--- a/src/indexer/tracker-extract-watchdog.c
++++ b/src/indexer/tracker-extract-watchdog.c
+@@ -488,7 +488,7 @@ void
+ tracker_extract_watchdog_ensure_started (TrackerExtractWatchdog *watchd=
og)
+ {
+ 	g_autoptr (GError) error =3D NULL;
+-	g_autofree gchar *current_dir =3D NULL;
++	g_autofree gchar *current_dir G_GNUC_UNUSED =3D NULL;
+ 	g_autoptr (GStrvBuilder) strv_builder =3D NULL;
+ 	g_auto (GStrv) arguments =3D NULL;
+ 	const gchar *extract_path;
+@@ -516,11 +516,13 @@ tracker_extract_watchdog_ensure_started (TrackerEx=
tractWatchdog *watchdog)
+ 		return;
+ 	}
+=20
++#ifdef BUILDROOT
+ 	current_dir =3D g_get_current_dir ();
+=20
+ 	if (g_strcmp0 (current_dir, BUILDROOT) =3D=3D 0)
+ 		extract_path =3D BUILD_EXTRACTDIR "/" EXECUTABLE_NAME;
+ 	else
++#endif
+ 		extract_path =3D LIBEXECDIR "/" EXECUTABLE_NAME;
+=20
+ 	strv_builder =3D g_strv_builder_new ();
+--=20
+2.55.0
+
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reprod=
ucibility.patch b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-r=
eproducibility.patch
deleted file mode 100644
index f90dafea82..0000000000
--- a/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibili=
ty.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 7affd66ff09747ad95b2e6de0b86ab06c97ca8f1 Mon Sep 17 00:00:00 2001
-From: Markus Volk <f_l_k@t-online.de>
-Date: Tue, 12 Sep 2023 17:00:41 +0200
-Subject: [PATCH] meson: fix reproducibility
-
-Tracker's design seems to be strictly for non-cross builds and leaks bui=
ldpaths into the
-binaries at various places. Avoid this to improve binary reproducibility=
.
-
-todo: Some of these paths may need to be adjusted to make the test envir=
onment work
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Markus Volk <f_l_k@t-online.de>
----
- meson.build | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index fe65280b6..6af5abec9 100644
---- a/meson.build
-+++ b/meson.build
-@@ -323,7 +323,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.pro=
ject_version()))
- conf.set('TRACKER_VERSION', '"@0@"'.format(meson.project_version()))
-=20
- # Config that goes in some other generated files (.desktop, .pc, etc)
--conf.set('abs_top_builddir', meson.current_build_dir())
-+conf.set('abs_top_builddir', '')
- conf.set('exec_prefix', get_option('prefix'))
- conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir'=
)))
- conf.set('datadir', datadir)
-@@ -353,7 +353,7 @@ tracker_c_args =3D [
- configinc =3D include_directories('./')
- srcinc =3D include_directories('src/')
-=20
--build_root =3D meson.current_build_dir()
-+build_root =3D ''
-=20
- # We use tracker-miners-3.0 rather than tracker3-miners inside the lib6=
4
- # directory, following the existing convention in that directory.
-@@ -378,8 +378,8 @@ subdir('src')
- subdir('docs')
-=20
- test_c_args =3D tracker_c_args + [
--  '-DTOP_BUILDDIR=3D"@0@/"'.format(meson.project_build_root()),
--  '-DTOP_SRCDIR=3D"@0@/"'.format(meson.project_source_root()),
-+  '-DTOP_BUILDDIR=3D"@0@/"'.format(''),
-+  '-DTOP_SRCDIR=3D"@0@/"'.format('/usr/src/debug/tracker'),
- ]
-=20
- if get_option('tests_tap_protocol')
-diff --git a/src/common/tracker-landlock.c b/src/common/tracker-landlock=
.c
-index a3f390585..778ae62d9 100644
---- a/src/common/tracker-landlock.c	2026-03-15 01:40:56.000000000 +0100
-+++ b/src/common/tracker-landlock.c	2026-03-26 16:49:16.948259117 +0100
-@@ -299,7 +299,7 @@
- 			          LANDLOCK_ACCESS_FS_READ_DIR);
- 		}
- 	}
--
-+#if 0
- 	current_dir =3D g_get_current_dir ();
-=20
- 	/* Detect running in-tree */
-@@ -319,7 +319,7 @@
- 			          in_tree_rules[i].flags);
- 		}
- 	}
--
-+#endif
- 	/* Add user cache for readonly databases */
- #ifdef MINER_FS_CACHE_LOCATION
- 	add_rule (landlock_fd, MINER_FS_CACHE_LOCATION,
---- a/src/indexer/meson.build	2026-03-15 01:40:56.000000000 +0100
-+++ b/src/indexer/meson.build	2026-03-26 16:55:09.020362168 +0100
-@@ -91,9 +91,9 @@ executable('localsearch-@0@'.format(tracker_api_major)=
,
-     dependencies: tracker_miner_fs_deps,
-     c_args: [
-         tracker_c_args,
--        '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
--        '-DBUILDDIR=3D"@0@"'.format(meson.current_build_dir()),
--        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(meson.project_build_root() =
/ 'src' / 'extractor'),
-+        '-DBUILDROOT=3D"@0@"'.format(get_option('prefix') / 'src'),
-+        '-DBUILDDIR=3D"@0@"'.format(''),
-+        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(get_option('prefix') / 'src=
' / 'extractor'),
-         '-DLIBEXECDIR=3D"@0@"'.format(get_option('prefix') / get_option=
('libexecdir')),
-     ],
-     install: true,
---- a/tests/indexer/meson.build	2026-03-15 01:40:56.000000000 +0100
-+++ b/tests/indexer/meson.build	2026-03-26 17:01:29.686224071 +0100
-@@ -18,7 +18,7 @@
- ]
-=20
- libtracker_miner_test_environment =3D environment()
--libtracker_miner_test_environment.set('GSETTINGS_SCHEMA_DIR', join_path=
s(meson.project_build_root(), 'data'))
-+libtracker_miner_test_environment.set('GSETTINGS_SCHEMA_DIR', '/usr/src=
/debug/tracker-miners/data')
-=20
- libtracker_miner_test_deps =3D [tracker_miners_common_dep, tracker_mine=
r_dep, tracker_sparql]
-=20
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb b/met=
a-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
index 4353ff1373..c5c463a54b 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
@@ -15,7 +15,7 @@ DEPENDS =3D " \
 inherit gnomebase gsettings gobject-introspection vala bash-completion f=
eatures_check
=20
 SRC_URI:append =3D " \
-	file://0001-fix-reproducibility.patch \
+	file://0001-build-add-an-option-to-disable-the-uninstalled-helper.patch=
 \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch =
\
 "
 SRC_URI[archive.sha256sum] =3D "7b39a6c28a8acf2b172f15b2fb5ee7c7a3764c44=
7c2f4a14caa239b7ebe61942"
@@ -71,7 +71,7 @@ PACKAGECONFIG[landlock]        =3D "-Dlandlock=3Denable=
d,-Dlandlock=3Ddisabled"
 PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Dtrue,-Dseccomp=3Dfalse,libseccom=
p"
=20
 EXTRA_OEMESON +=3D " \
-    -Dman=3Dfalse -Dfunctional_tests=3Dfalse \
+    -Dman=3Dfalse -Dfunctional_tests=3Dfalse -Duninstalled_helpers=3Dfal=
se \
     -Dsystemd_user_services=3D${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', 'true', 'false', d)} \
     -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
 "
--=20
2.55.0


