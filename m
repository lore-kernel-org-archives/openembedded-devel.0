Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FD7CF9C51
	for <webhook@archiver.kernel.org>; Fri, 20 Sep 2024 15:08:31 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.20598.1726844891964489484
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Sep 2024 08:08:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout01.t-online.de (Postfix) with SMTP id D51232E7E5
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 17:07:43 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.38.23]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1srfEV-3JaG0d0; Fri, 20 Sep 2024 17:07:43 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 23/23] tracker-miners: update 3.7.3 -> 3.8.0
Date: Fri, 20 Sep 2024 17:08:22 +0200
Message-ID: <20240920150822.1131707-23-f_l_k@t-online.de>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920150822.1131707-1-f_l_k@t-online.de>
References: <20240920150822.1131707-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1726844863-BF7FC467-FC854B31/0/0 CLEAN NORMAL
X-TOI-MSGID: a971d770-883a-4973-98d6-0ca728332075
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Sep 2024 15:08:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112423

- Rename to localsearch
- Refresh patches

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...to-a-fixed-path-instead-of-a-host-pa.patch |  5 +----
 .../0001-fix-reproducibility.patch            | 20 +++++++++----------
 ...r-miners_3.7.3.bb =3D> localsearch_3.8.0.bb} |  6 +++---
 3 files changed, 14 insertions(+), 17 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners =3D> localsearch=
}/0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch (92%)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners =3D> localsearch=
}/0001-fix-reproducibility.patch (90%)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.7.3.bb =3D> lo=
calsearch_3.8.0.bb} (95%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-hea=
der-file-to-a-fixed-path-instead-of-a-host-pa.patch b/meta-gnome/recipes-=
gnome/tracker/localsearch/0001-Set-header-file-to-a-fixed-path-instead-of=
-a-host-pa.patch
similarity index 92%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-head=
er-file-to-a-fixed-path-instead-of-a-host-pa.patch
rename to meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header-fi=
le-to-a-fixed-path-instead-of-a-host-pa.patch
index 36dd4a588..606a3e9aa 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-fil=
e-to-a-fixed-path-instead-of-a-host-pa.patch
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header-file-t=
o-a-fixed-path-instead-of-a-host-pa.patch
@@ -1,4 +1,4 @@
-From 6f6d7e3995c370b8121206a7f9cc0d234553bbfe Mon Sep 17 00:00:00 2001
+From bad93f7aec96b1819f4027dbc06b337d2e2227f2 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Thu, 15 Sep 2022 16:35:39 +0900
 Subject: [PATCH] Set header file to a fixed path instead of a host path.
@@ -23,6 +23,3 @@ index 4db7ef1..7c44c13 100644
  /*** END file-production ***/
 =20
 =20
---=20
-2.34.1
-
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-rep=
roducibility.patch b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fi=
x-reproducibility.patch
similarity index 90%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-repr=
oducibility.patch
rename to meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproduci=
bility.patch
index 0812e88a9..8f9dcdc3e 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-fix-reproducib=
ility.patch
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibili=
ty.patch
@@ -1,4 +1,4 @@
-From 1b7a34b7de9eb2ae776f7cf4dc6221f49b2395ee Mon Sep 17 00:00:00 2001
+From db5149a0c9297d1053c2d0c01ed116cdcf5d14f0 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 12 Sep 2023 17:00:41 +0200
 Subject: [PATCH] meson: fix reproducibility
@@ -20,10 +20,10 @@ Signed-off-by: Markus Volk <f_l_k@t-online.de>
  5 files changed, 10 insertions(+), 10 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 37f5148..18f4bfa 100644
+index 4a2994a..31b1798 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -393,7 +393,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.pro=
ject_version()))
+@@ -371,7 +371,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.pro=
ject_version()))
  conf.set('TRACKER_VERSION', '"@0@"'.format(meson.project_version()))
 =20
  # Config that goes in some other generated files (.desktop, .pc, etc)
@@ -32,7 +32,7 @@ index 37f5148..18f4bfa 100644
  conf.set('exec_prefix', get_option('prefix'))
  conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir'=
)))
  conf.set('datadir', datadir)
-@@ -422,7 +422,7 @@ tracker_c_args =3D [
+@@ -400,7 +400,7 @@ tracker_c_args =3D [
  configinc =3D include_directories('./')
  srcinc =3D include_directories('src/')
 =20
@@ -41,7 +41,7 @@ index 37f5148..18f4bfa 100644
 =20
  # We use tracker-miners-3.0 rather than tracker3-miners inside the lib6=
4
  # directory, following the existing convention in that directory.
-@@ -451,8 +451,8 @@ subdir('data')
+@@ -430,8 +430,8 @@ subdir('data')
  subdir('docs')
 =20
  test_c_args =3D tracker_c_args + [
@@ -53,7 +53,7 @@ index 37f5148..18f4bfa 100644
 =20
  if get_option('tests_tap_protocol')
 diff --git a/src/libtracker-miners-common/tracker-landlock.c b/src/libtr=
acker-miners-common/tracker-landlock.c
-index 6d4510b..189d2fb 100644
+index 0aca8ed..e6c28b6 100644
 --- a/src/libtracker-miners-common/tracker-landlock.c
 +++ b/src/libtracker-miners-common/tracker-landlock.c
 @@ -282,7 +282,7 @@ tracker_landlock_init (const gchar * const *indexed_=
folders)
@@ -75,10 +75,10 @@ index 6d4510b..189d2fb 100644
  #ifdef MINER_FS_CACHE_LOCATION
  	add_rule (landlock_fd, MINER_FS_CACHE_LOCATION,
 diff --git a/src/miners/fs/meson.build b/src/miners/fs/meson.build
-index 6e58832..04750f8 100644
+index 42c4573..73577c3 100644
 --- a/src/miners/fs/meson.build
 +++ b/src/miners/fs/meson.build
-@@ -67,8 +67,8 @@ executable('tracker-miner-fs-@0@'.format(tracker_api_m=
ajor),
+@@ -68,8 +68,8 @@ executable('localsearch-@0@'.format(tracker_api_major)=
,
      dependencies: tracker_miner_fs_deps,
      c_args: [
          tracker_c_args,
@@ -90,11 +90,11 @@ index 6e58832..04750f8 100644
      ],
      install: true,
 diff --git a/src/tracker-extract/meson.build b/src/tracker-extract/meson=
.build
-index 2e4f61d..b47581c 100644
+index 2584881..31411f2 100644
 --- a/src/tracker-extract/meson.build
 +++ b/src/tracker-extract/meson.build
 @@ -158,7 +158,7 @@ endif
- executable('tracker-extract-@0@'.format(tracker_api_major),
+ executable('localsearch-extractor-@0@'.format(tracker_api_major),
    tracker_extract_sources,
    # Manually add the root dir to work around https://github.com/mesonbu=
ild/meson/issues/1387
 -  c_args: tracker_c_args + ['-I' + meson.build_root()],
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb b/m=
eta-gnome/recipes-gnome/tracker/localsearch_3.8.0.bb
similarity index 95%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb
rename to meta-gnome/recipes-gnome/tracker/localsearch_3.8.0.bb
index 2b2dc7c4b..916e48961 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.7.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.8.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D " \
=20
 DEPENDS =3D " \
     intltool-native \
-    tracker \
+    tinysparql \
     zlib \
 "
=20
@@ -18,7 +18,7 @@ SRC_URI:append =3D " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch =
\
 "
-SRC_URI[archive.sha256sum] =3D "e74388154b5c197b4b7ee42f0dce8c5fbbddd4d3=
61093ef88d4fb303e33da5fe"
+SRC_URI[archive.sha256sum] =3D "e4e83a1daebb5263915b45b719731e3f7041d959=
cbd637ea29afbe910c92bbf9"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
@@ -81,6 +81,6 @@ EXTRA_OEMESON +=3D " \
=20
 FILES:${PN} +=3D " \
     ${datadir} \
-    ${libdir}/tracker-miners-3.0 \
+    ${libdir}/localsearch-3.0 \
     ${systemd_user_unitdir} \
 "
--=20
2.46.0


