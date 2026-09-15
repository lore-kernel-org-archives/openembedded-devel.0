Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6D5C982C3
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 07:44:28 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18104.1789458262659627480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2026 00:44:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=hUV5bUsO;
 spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd81.aul.t-online.de (fwd81.aul.t-online.de [10.223.144.107])
	by mailout11.t-online.de (Postfix) with SMTP id C30421C4BB
	for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 09:44:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.162.202]) by fwd81.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1x6Nps-00ds660; Tue, 15 Sep 2026 09:44:12 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 27/31] localsearch: upgrade 3.11.1 -> 3.12.0
Date: Tue, 15 Sep 2026 09:43:43 +0200
Message-ID: <20260915074347.6003-27-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915074347.6003-1-f_l_k@t-online.de>
References: <20260915074347.6003-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1789458252-0AFFA9B9-0DE3D59C/0/0 CLEAN NORMAL
X-TOI-MSGID: de44151a-a880-41de-b2b2-3e0daf5a2e3f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1789458260; i=f_l_k@t-online.de;
	bh=C6N9Sp8HJAKa/y51eaaHufLBmegomps1iMKplKXG0To=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=hUV5bUsOQ9MEqy86/lH1mMs67nYqf1a7swuMmFARC/iRsGTeEP/ZTFIa2kwLp6nH8
	 xLquM/tuyXwNafZw8juOZrsf9i3ZcogVqSymeYTVZgTXWSEn6NdUbGgl7dVKJ9crJX
	 ph22fU+Nsk/JFAM4L/qAWQLLF+GfKOK5oFTexaHsodRCbnf5H/Pp6Qwbr+ZqgbOqdz
	 jJ3SxxDBuBrjVnM03dKS869NoUkL4P7OdKejWVMxAgO5T8X2nagiGbW4rQFc2yN9TS
	 y2G4fw9hprTo9xpicscJY7exa9PMr0hQVKXRG3KBC3iwbnlz6PiGFw1mjTlcaeRDb7
	 JsSN9jS3A/w8A==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2026 07:44:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130042

The enum types template the host path patch fixed no longer exists.
Refresh the remaining patch against the new sources.

AI-Generated: Uses Claude Code (Claude Opus 5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...to-a-fixed-path-instead-of-a-host-pa.patch | 25 ----------
 ...on-to-disable-the-uninstalled-helper.patch | 49 +++++++++----------
 ...search_3.11.1.bb =3D> localsearch_3.12.0.bb} |  3 +-
 3 files changed, 25 insertions(+), 52 deletions(-)
 delete mode 100644 meta-gnome/recipes-gnome/tracker/localsearch/0001-Set=
-header-file-to-a-fixed-path-instead-of-a-host-pa.patch
 rename meta-gnome/recipes-gnome/tracker/{localsearch_3.11.1.bb =3D> loca=
lsearch_3.12.0.bb} (94%)

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header=
-file-to-a-fixed-path-instead-of-a-host-pa.patch b/meta-gnome/recipes-gno=
me/tracker/localsearch/0001-Set-header-file-to-a-fixed-path-instead-of-a-=
host-pa.patch
deleted file mode 100644
index 23675075f8..0000000000
--- a/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header-file-t=
o-a-fixed-path-instead-of-a-host-pa.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 78c089de4bef7d8f07cc6def1202dcec949521b5 Mon Sep 17 00:00:00 2001
-From: Lei Maohui <leimaohui@fujitsu.com>
-Date: Thu, 15 Sep 2022 16:35:39 +0900
-Subject: [PATCH] Set header file to a fixed path instead of a host path.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
----
- src/common/tracker-miners-enum-types.c.template | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/common/tracker-miners-enum-types.c.template b/src/commo=
n/tracker-miners-enum-types.c.template
-index 4db7ef1..7c44c13 100644
---- a/src/common/tracker-miners-enum-types.c.template
-+++ b/src/common/tracker-miners-enum-types.c.template
-@@ -7,7 +7,7 @@
-=20
- /*** BEGIN file-production ***/
- /* enumerations from "@basename@" */
--#include "@filename@"
-+#include "tracker-enums.h"
- /*** END file-production ***/
-=20
-=20
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-build-add-=
an-option-to-disable-the-uninstalled-helper.patch b/meta-gnome/recipes-gn=
ome/tracker/localsearch/0001-build-add-an-option-to-disable-the-uninstall=
ed-helper.patch
index 994a6ef167..b783a2128a 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch/0001-build-add-an-opti=
on-to-disable-the-uninstalled-helper.patch
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-build-add-an-opti=
on-to-disable-the-uninstalled-helper.patch
@@ -1,6 +1,6 @@
-From 673ee0734c5aec9afbe24dc50a7436f67e42b7aa Mon Sep 17 00:00:00 2001
+From de9c9544076bfaff637869610a79a74e86183332 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
-Date: Sun, 6 Sep 2026 11:18:10 +0200
+Date: Tue, 15 Sep 2026 07:52:03 +0200
 Subject: [PATCH] build: add an option to disable the uninstalled helper =
paths
=20
 The daemons and the command line tool compare their working directory
@@ -33,10 +33,10 @@ AI-Generated: Uses Claude Code (Claude Fable 5.1)
  11 files changed, 48 insertions(+), 13 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 7a311d4..fd29c73 100644
+index a7fbced..3e5fb4b 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -355,6 +355,18 @@ srcinc =3D include_directories('src/')
+@@ -356,6 +356,18 @@ srcinc =3D include_directories('src/')
 =20
  build_root =3D meson.current_build_dir()
 =20
@@ -56,10 +56,10 @@ index 7a311d4..fd29c73 100644
  # directory, following the existing convention in that directory.
  tracker_api_versioned_name =3D 'localsearch-@0@'.format(tracker_api_ver=
sion)
 diff --git a/meson_options.txt b/meson_options.txt
-index 70e764a..621d7ce 100644
+index ac90fd0..77f304e 100644
 --- a/meson_options.txt
 +++ b/meson_options.txt
-@@ -99,3 +99,5 @@ option('tests_tap_protocol', type: 'boolean', value: f=
alse,
+@@ -101,3 +101,5 @@ option('tests_tap_protocol', type: 'boolean', value:=
 false,
         description: 'Whether to enable TAP protocol on tests')
  option('test_utils_dir', type: 'string', value: '',
         description: 'Directory to install trackertestutils Python packa=
ge (or empty to use the default)')
@@ -83,10 +83,10 @@ index dd6177d..851ce05 100644
          '-DBINDIR=3D"@0@"'.format(join_paths(get_option('prefix'), get_=
option('bindir'))),
      ],
 diff --git a/src/cli/tracker-cli-utils.c b/src/cli/tracker-cli-utils.c
-index 735bb4b..a941921 100644
+index 721b5cc..3399dc8 100644
 --- a/src/cli/tracker-cli-utils.c
 +++ b/src/cli/tracker-cli-utils.c
-@@ -199,6 +199,7 @@ tracker_cli_print_errors (GList    *keyfiles,
+@@ -209,6 +209,7 @@ tracker_cli_print_errors (GList    *keyfiles,
  gboolean
  tracker_cli_check_inside_build_tree (const gchar* argv0)
  {
@@ -94,7 +94,7 @@ index 735bb4b..a941921 100644
  	g_autoptr (GFile) build_root =3D NULL;
  	g_autoptr (GFile) path =3D NULL;
 =20
-@@ -206,4 +207,7 @@ tracker_cli_check_inside_build_tree (const gchar* ar=
gv0)
+@@ -216,6 +217,9 @@ tracker_cli_check_inside_build_tree (const gchar* ar=
gv0)
  	path =3D g_file_new_for_path (argv0);
 =20
  	return g_file_has_prefix (path, build_root);
@@ -102,6 +102,8 @@ index 735bb4b..a941921 100644
 +	return FALSE;
 +#endif
  }
+=20
+ TrackerSparqlConnection *
 diff --git a/src/cli/tracker-extract.c b/src/cli/tracker-extract.c
 index 7342b24..cb74e9b 100644
 --- a/src/cli/tracker-extract.c
@@ -122,10 +124,10 @@ index 7342b24..cb74e9b 100644
  	}
 =20
 diff --git a/src/cli/tracker-info.c b/src/cli/tracker-info.c
-index 6b46f1f..18fadbd 100644
+index 4d9bf19..3190016 100644
 --- a/src/cli/tracker-info.c
 +++ b/src/cli/tracker-info.c
-@@ -311,10 +311,13 @@ output_eligible_status_for_file (gchar   *path,
+@@ -313,10 +313,13 @@ output_eligible_status_for_file (gchar   *path,
  {
  	g_autofree char *tracker_miner_fs_path =3D NULL;
 =20
@@ -141,10 +143,10 @@ index 6b46f1f..18fadbd 100644
  	}
 =20
 diff --git a/src/common/meson.build b/src/common/meson.build
-index 93da66e..73b7388 100644
+index 483fb74..f99b163 100644
 --- a/src/common/meson.build
 +++ b/src/common/meson.build
-@@ -52,13 +52,11 @@ endif
+@@ -37,13 +37,11 @@ endif
  libtracker_miners_common =3D static_library('tracker-miners-common',
    tracker_miners_common_sources,
    dependencies: tracker_miners_common_dependencies + tracker_miners_com=
mon_private_dependencies,
@@ -189,10 +191,10 @@ index a3f3905..3f136a3 100644
  	/* Add user cache for readonly databases */
  #ifdef MINER_FS_CACHE_LOCATION
 diff --git a/src/indexer/meson.build b/src/indexer/meson.build
-index 55ff6ab..0879e41 100644
+index 9470018..9ea9cff 100644
 --- a/src/indexer/meson.build
 +++ b/src/indexer/meson.build
-@@ -84,6 +84,15 @@ executable('localsearch-endpoint-@0@'.format(tracker_=
api_major),
+@@ -81,6 +81,15 @@ executable('localsearch-endpoint-@0@'.format(tracker_=
api_major),
      install_rpath: tracker_internal_libs_dir,
  )
 =20
@@ -208,7 +210,7 @@ index 55ff6ab..0879e41 100644
  executable('localsearch-@0@'.format(tracker_api_major),
      sources,
      miner_fs_resources[0], miner_fs_resources[1],
-@@ -91,9 +100,8 @@ executable('localsearch-@0@'.format(tracker_api_major=
),
+@@ -88,9 +97,8 @@ executable('localsearch-@0@'.format(tracker_api_major)=
,
      dependencies: tracker_miner_fs_deps,
      c_args: [
          tracker_c_args,
@@ -221,10 +223,10 @@ index 55ff6ab..0879e41 100644
      ],
      install: true,
 diff --git a/src/indexer/tracker-application.c b/src/indexer/tracker-app=
lication.c
-index d3caf3d..c00ffaa 100644
+index 3c73450..6bb5565 100644
 --- a/src/indexer/tracker-application.c
 +++ b/src/indexer/tracker-application.c
-@@ -270,7 +270,7 @@ open_connection (TrackerApplication  *app,
+@@ -265,7 +265,7 @@ open_connection (TrackerApplication  *app,
  		g_autoptr (GSocket) socket =3D NULL;
  		g_autoptr (GIOStream) stream =3D NULL;
  		g_autoptr (GFile) location =3D NULL;
@@ -233,7 +235,7 @@ index d3caf3d..c00ffaa 100644
  		const char *helper_path;
 =20
  		g_assert (instance->root);
-@@ -298,11 +298,13 @@ open_connection (TrackerApplication  *app,
+@@ -293,11 +293,13 @@ open_connection (TrackerApplication  *app,
 =20
  		guid =3D g_dbus_generate_guid ();
 =20
@@ -248,10 +250,10 @@ index d3caf3d..c00ffaa 100644
 =20
  		location =3D g_file_get_child (instance->root, ".localsearch3");
 diff --git a/src/indexer/tracker-extract-watchdog.c b/src/indexer/tracke=
r-extract-watchdog.c
-index 27f6b49..37da365 100644
+index d203952..315059e 100644
 --- a/src/indexer/tracker-extract-watchdog.c
 +++ b/src/indexer/tracker-extract-watchdog.c
-@@ -488,7 +488,7 @@ void
+@@ -496,7 +496,7 @@ void
  tracker_extract_watchdog_ensure_started (TrackerExtractWatchdog *watchd=
og)
  {
  	g_autoptr (GError) error =3D NULL;
@@ -260,7 +262,7 @@ index 27f6b49..37da365 100644
  	g_autoptr (GStrvBuilder) strv_builder =3D NULL;
  	g_auto (GStrv) arguments =3D NULL;
  	const gchar *extract_path;
-@@ -516,11 +516,13 @@ tracker_extract_watchdog_ensure_started (TrackerEx=
tractWatchdog *watchdog)
+@@ -524,11 +524,13 @@ tracker_extract_watchdog_ensure_started (TrackerEx=
tractWatchdog *watchdog)
  		return;
  	}
 =20
@@ -274,6 +276,3 @@ index 27f6b49..37da365 100644
  		extract_path =3D LIBEXECDIR "/" EXECUTABLE_NAME;
 =20
  	strv_builder =3D g_strv_builder_new ();
---=20
-2.55.0
-
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb b/met=
a-gnome/recipes-gnome/tracker/localsearch_3.12.0.bb
similarity index 94%
rename from meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
rename to meta-gnome/recipes-gnome/tracker/localsearch_3.12.0.bb
index c5c463a54b..e9cb1ff10a 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.11.1.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.12.0.bb
@@ -16,9 +16,8 @@ inherit gnomebase gsettings gobject-introspection vala =
bash-completion features_
=20
 SRC_URI:append =3D " \
 	file://0001-build-add-an-option-to-disable-the-uninstalled-helper.patch=
 \
-	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch =
\
 "
-SRC_URI[archive.sha256sum] =3D "7b39a6c28a8acf2b172f15b2fb5ee7c7a3764c44=
7c2f4a14caa239b7ebe61942"
+SRC_URI[archive.sha256sum] =3D "4bf45440ce7a899f2eca4d20343d31fc620fa2a3=
fe53bb929de244305330e930"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
--=20
2.55.0


