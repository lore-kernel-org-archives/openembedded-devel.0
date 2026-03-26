Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 954F510A88E6
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 16:48:17 +0000 (UTC)
Received: from mailout03.t-online.de (mailout03.t-online.de [194.25.134.81])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.52238.1774543687754283792
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 09:48:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=e3k7Q7Fj;
 spf=pass (domain: t-online.de, ip: 194.25.134.81, mailfrom: f_l_k@t-online.de)
Received: from fwd78.aul.t-online.de (fwd78.aul.t-online.de [10.223.144.104])
	by mailout03.t-online.de (Postfix) with SMTP id D19F2F212
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 17:48:04 +0100 (CET)
Received: from fedora.fritz.box ([79.219.228.172]) by fwd78.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1w5nsK-1aTyzJ0; Thu, 26 Mar 2026 17:48:04 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCHv2] localsearch: update 3.9.0 -> 3.11.0
Date: Thu, 26 Mar 2026 17:47:57 +0100
Message-ID: <20260326164757.97828-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1774543684-25FF889C-382BC6E2/0/0 CLEAN NORMAL
X-TOI-MSGID: e1c053df-0805-46ef-9a4a-f19a7895a298
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1774543684; i=f_l_k@t-online.de;
	bh=tkdvVqEvwX0FhNiQXcwmpiblM1BkvuZoISmTCZY3HXw=;
	h=From:To:Subject:Date;
	b=e3k7Q7Fj/S5jbzNZa3TPIElT3MKOCcD+zZDSFxje80fqEesTFCbnos05iM/tJ7EXS
	 THWpkwuwHh5eL2AMFRFDACxDuF8DSRuNE3jsnzInzLhgFTGl9QdUsnECA7EOFpRbZu
	 tjTEutd4bCU8j+h92tNcYNq8MyK8egyAYMKngfNOvpMhGLo62YJ/umHcI+tq7fbftC
	 ON+ARD4S8zMn3qOXjK4nIvgm+tL5J7MMlJOkY1ClS0+Q7tqN9x61i3O4zpUpckU7Og
	 evO2pCyNRpq5CbnGSAILcyWUvMOW3xjOqz5JKftejT6f/jmorIqWJXmfrbOtWpqJXz
	 QgZXIlrdnZ8yg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 16:48:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125761

- rework reproducibility patch
- disable functional_tests to avoid python3-dbusmock-native dependency
- add PACKAGECONFIG for libzip and enable by default

NEW in 3.11.0 - 2026-03-15
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  * Memory leak fixes
  * Stability fixes
  * Fixes to tv series/season extraction from video files

Translations: ca, da, en_GB, pl

Notable changes since 3.10.0:
  * Default configuration change, the user home directory will now be ind=
exed
    recursively as a whole, instead of XDG folders
  * Major change in handling of removable devices. When enabled, removabl=
e
    devices will get a `.localsearch3` folder with a self-contained datab=
ase
    for the removable device indexed data, instead of being included in t=
he
    main database in the user home folder. The setting default remains of=
f.
  * The set of dependencies was modernized and sanitized. GExiv2 is now u=
sed
    for more metadata, libzip is now used for bundled files.

NEW in 3.11.rc - 2026-03-03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
  * Reliability improvements to the test suite

Translations: es, hu, ko, ne, oc, pt

NEW in 3.11.beta - 2026-02-18
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
  * Fixes for possible buffer overflows and NULL pointer dereferences
    in MP3 extractor
  * Fix seccomp jail in database helper process for removable devices
  * Replace libgsf with libzip for ZIP content handling
  * Improve reliability of the test suite in slow scenarios (e.g. CI)

Translations: bg, ca, cs, el, eu, fa, fr, gl, he, ka, kk, lt, pt_BR, ro, =
ru,
  sl, sv, tr, ug, uk, zh_CN

NEW in 3.11.alpha - 2026-01-05
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
  * Default configuration change, the user home directory will now be ind=
exed
    recursively as a whole, instead of XDG folders
  * Major change in handling of removable devices. When enabled, removabl=
e
    devices will get a `.localsearch3` folder with a self-contained datab=
ase
    for the removable device indexed data, instead of being included in t=
he
    main database in the user home folder. The setting default remains of=
f.
  * Improved handling of indexed folder changes found on restart
  * Improved handling of indexing cancellation in deleted folders
  * Improved handling of BTRFS filesystems
  * Dropped libexif dependency, EXIF data is now extracted through gexiv2
  * Dropped libpiptcdata dependency, IPTC data is now extracted through
    gexiv2
  * Consistency improvements to extracted metadata
  * Fixes to SHSTK handling in the sandboxed process
  * Further extended test coverage

Translations: ca, el, fur, id, oc, sr, sr@latin

NEW in 3.10.1 - 2025-10-13
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  * Improvements to the handling of corrupted databases
  * Avoid session startup issues if database initialization takes long
  * Handle compressed Abiword documents
  * Memory usage improvements indexing WEBP files
  * Support gexiv2 >=3D 0.16
  * Unify metadata extraction deadline mechanisms
  * Test suite improvements

Translations: bg, ca, es, kab, pt, ro, tr, ug

NEW in 3.10.0 - 2025-09-14
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  * Fixes to handling of configuration changes
  * Improvements to the test suite

Translations: da, en_GB, eo, es, eu, fa, he, hu, ka, ko, lt, nl, pt_BR, r=
u, sv, tr, uk, zh_CN

Notable changes since 3.9.0:
  * A number of behavioral settings has been deprecated
  * Webp file format now has a metadata extractor

NEW in 3.10.rc - 2025-09-01
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
  * Webp file format now has a metadata extractor
  * Indexer refactors and cleanups

Translations: ca, cs, gl, pl, sl

NEW in 3.10.beta - 2025-08-03
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
  * Fix service files with -Ddomain-ontology option
  * Fixes for Alpine and similar distributions without merged /usr

NEW in 3.10.alpha - 2025-07-01
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
  * Systemd integration improvements
  * A number of behavioral settings has been deprecated
  * Fixes handling /var/home directories
  * Many improvements to the command line tool
  * The tracker:available property is again set on all graphs, for
    indexed folders
  * Fixes handling XML documents
  * Fixes for possible crashes handling large PDF files
  * Fixes for coverity warnings
  * Code cleanups and refactors

Translations: be, ca, uz

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...to-a-fixed-path-instead-of-a-host-pa.patch |  4 +-
 .../0001-fix-reproducibility.patch            | 67 +++++++------------
 ...lsearch_3.9.0.bb =3D> localsearch_3.11.0.bb} |  6 +-
 3 files changed, 30 insertions(+), 47 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{localsearch_3.9.0.bb =3D> local=
search_3.11.0.bb} (92%)

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header=
-file-to-a-fixed-path-instead-of-a-host-pa.patch b/meta-gnome/recipes-gno=
me/tracker/localsearch/0001-Set-header-file-to-a-fixed-path-instead-of-a-=
host-pa.patch
index 87589a0e64..23675075f8 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header-file-t=
o-a-fixed-path-instead-of-a-host-pa.patch
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header-file-t=
o-a-fixed-path-instead-of-a-host-pa.patch
@@ -1,4 +1,4 @@
-From bad93f7aec96b1819f4027dbc06b337d2e2227f2 Mon Sep 17 00:00:00 2001
+From 78c089de4bef7d8f07cc6def1202dcec949521b5 Mon Sep 17 00:00:00 2001
 From: Lei Maohui <leimaohui@fujitsu.com>
 Date: Thu, 15 Sep 2022 16:35:39 +0900
 Subject: [PATCH] Set header file to a fixed path instead of a host path.
@@ -7,7 +7,7 @@ Upstream-Status: Inappropriate [embedded specific]
=20
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
- .../tracker-miners-enum-types.c.template                        | 2 +-
+ src/common/tracker-miners-enum-types.c.template | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/common/tracker-miners-enum-types.c.template b/src/commo=
n/tracker-miners-enum-types.c.template
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reprod=
ucibility.patch b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-r=
eproducibility.patch
index 1bab34e126..f90dafea82 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibili=
ty.patch
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibili=
ty.patch
@@ -1,4 +1,4 @@
-From 57f4279008394831826ea2ff449b06b29c08ce68 Mon Sep 17 00:00:00 2001
+From 7affd66ff09747ad95b2e6de0b86ab06c97ca8f1 Mon Sep 17 00:00:00 2001
 From: Markus Volk <f_l_k@t-online.de>
 Date: Tue, 12 Sep 2023 17:00:41 +0200
 Subject: [PATCH] meson: fix reproducibility
@@ -12,18 +12,14 @@ Upstream-Status: Inappropriate [oe-specific]
=20
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
- meson.build                                     | 8 ++++----
- src/common/tracker-landlock.c | 4 ++--
- src/miners/fs/meson.build                       | 4 ++--
- src/tracker-extract/meson.build                 | 2 +-
- tests/tracker-miner-fs/meson.build              | 2 +-
- 5 files changed, 10 insertions(+), 10 deletions(-)
+ meson.build | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
=20
 diff --git a/meson.build b/meson.build
-index 7ae103c..cc61e84 100644
+index fe65280b6..6af5abec9 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -371,7 +371,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.pro=
ject_version()))
+@@ -323,7 +323,7 @@ conf.set('PACKAGE_VERSION', '"@0@"'.format(meson.pro=
ject_version()))
  conf.set('TRACKER_VERSION', '"@0@"'.format(meson.project_version()))
 =20
  # Config that goes in some other generated files (.desktop, .pc, etc)
@@ -32,7 +28,7 @@ index 7ae103c..cc61e84 100644
  conf.set('exec_prefix', get_option('prefix'))
  conf.set('bindir', join_paths(get_option('prefix'), get_option('bindir'=
)))
  conf.set('datadir', datadir)
-@@ -400,7 +400,7 @@ tracker_c_args =3D [
+@@ -353,7 +353,7 @@ tracker_c_args =3D [
  configinc =3D include_directories('./')
  srcinc =3D include_directories('src/')
 =20
@@ -41,22 +37,22 @@ index 7ae103c..cc61e84 100644
 =20
  # We use tracker-miners-3.0 rather than tracker3-miners inside the lib6=
4
  # directory, following the existing convention in that directory.
-@@ -430,8 +430,8 @@ subdir('data')
+@@ -378,8 +378,8 @@ subdir('src')
  subdir('docs')
 =20
  test_c_args =3D tracker_c_args + [
--  '-DTOP_BUILDDIR=3D"@0@/"'.format(meson.build_root()),
--  '-DTOP_SRCDIR=3D"@0@/"'.format(meson.source_root()),
+-  '-DTOP_BUILDDIR=3D"@0@/"'.format(meson.project_build_root()),
+-  '-DTOP_SRCDIR=3D"@0@/"'.format(meson.project_source_root()),
 +  '-DTOP_BUILDDIR=3D"@0@/"'.format(''),
 +  '-DTOP_SRCDIR=3D"@0@/"'.format('/usr/src/debug/tracker'),
  ]
 =20
  if get_option('tests_tap_protocol')
 diff --git a/src/common/tracker-landlock.c b/src/common/tracker-landlock=
.c
-index 0ad90d0..354f5d1 100644
---- a/src/common/tracker-landlock.c
-+++ b/src/common/tracker-landlock.c
-@@ -283,7 +283,7 @@ tracker_landlock_init (const gchar * const *indexed_=
folders)
+index a3f390585..778ae62d9 100644
+--- a/src/common/tracker-landlock.c	2026-03-15 01:40:56.000000000 +0100
++++ b/src/common/tracker-landlock.c	2026-03-26 16:49:16.948259117 +0100
+@@ -299,7 +299,7 @@
  			          LANDLOCK_ACCESS_FS_READ_DIR);
  		}
  	}
@@ -65,7 +61,7 @@ index 0ad90d0..354f5d1 100644
  	current_dir =3D g_get_current_dir ();
 =20
  	/* Detect running in-tree */
-@@ -303,7 +303,7 @@ tracker_landlock_init (const gchar * const *indexed_=
folders)
+@@ -319,7 +319,7 @@
  			          in_tree_rules[i].flags);
  		}
  	}
@@ -74,43 +70,28 @@ index 0ad90d0..354f5d1 100644
  	/* Add user cache for readonly databases */
  #ifdef MINER_FS_CACHE_LOCATION
  	add_rule (landlock_fd, MINER_FS_CACHE_LOCATION,
-diff --git a/src/miners/fs/meson.build b/src/miners/fs/meson.build
-index 1e16618..286580a 100644
---- a/src/indexer/meson.build
-+++ b/src/indexer/meson.build
-@@ -68,8 +68,8 @@ executable('localsearch-@0@'.format(tracker_api_major)=
,
+--- a/src/indexer/meson.build	2026-03-15 01:40:56.000000000 +0100
++++ b/src/indexer/meson.build	2026-03-26 16:55:09.020362168 +0100
+@@ -91,9 +91,9 @@ executable('localsearch-@0@'.format(tracker_api_major)=
,
      dependencies: tracker_miner_fs_deps,
      c_args: [
          tracker_c_args,
 -        '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
--        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(meson.build_root() / 'src' =
/ 'extractor'),
+-        '-DBUILDDIR=3D"@0@"'.format(meson.current_build_dir()),
+-        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(meson.project_build_root() =
/ 'src' / 'extractor'),
 +        '-DBUILDROOT=3D"@0@"'.format(get_option('prefix') / 'src'),
++        '-DBUILDDIR=3D"@0@"'.format(''),
 +        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(get_option('prefix') / 'src=
' / 'extractor'),
          '-DLIBEXECDIR=3D"@0@"'.format(get_option('prefix') / get_option=
('libexecdir')),
      ],
      install: true,
-diff --git a/src/tracker-extract/meson.build b/src/tracker-extract/meson=
.build
-index 2584881..31411f2 100644
---- a/src/extractor/meson.build
-+++ b/src/extractor/meson.build
-@@ -158,7 +158,7 @@ endif
- executable('localsearch-extractor-@0@'.format(tracker_api_major),
-   tracker_extract_sources,
-   # Manually add the root dir to work around https://github.com/mesonbu=
ild/meson/issues/1387
--  c_args: tracker_c_args + ['-I' + meson.build_root()],
-+  c_args: tracker_c_args,
-   export_dynamic: true,
-   dependencies: tracker_extract_dependencies,
-   install: true,
-diff --git a/tests/tracker-miner-fs/meson.build b/tests/tracker-miner-fs=
/meson.build
-index 8c081fd..9792082 100644
---- a/tests/indexer/meson.build
-+++ b/tests/indexer/meson.build
-@@ -18,7 +18,7 @@ libtracker_miner_test_c_args =3D [
+--- a/tests/indexer/meson.build	2026-03-15 01:40:56.000000000 +0100
++++ b/tests/indexer/meson.build	2026-03-26 17:01:29.686224071 +0100
+@@ -18,7 +18,7 @@
  ]
 =20
  libtracker_miner_test_environment =3D environment()
--libtracker_miner_test_environment.set('GSETTINGS_SCHEMA_DIR', join_path=
s(meson.build_root(), 'data'))
+-libtracker_miner_test_environment.set('GSETTINGS_SCHEMA_DIR', join_path=
s(meson.project_build_root(), 'data'))
 +libtracker_miner_test_environment.set('GSETTINGS_SCHEMA_DIR', '/usr/src=
/debug/tracker-miners/data')
 =20
  libtracker_miner_test_deps =3D [tracker_miners_common_dep, tracker_mine=
r_dep, tracker_sparql]
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb b/meta=
-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb
similarity index 92%
rename from meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
rename to meta-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb
index ffea1f76b3..d49482cfec 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.9.0.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.11.0.bb
@@ -18,7 +18,7 @@ SRC_URI:append =3D " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch =
\
 "
-SRC_URI[archive.sha256sum] =3D "d42f408dc3fb28fe54f5a9abbf5f1decf5818db9=
c2e9ec51c09464bdfd0c14b9"
+SRC_URI[archive.sha256sum] =3D "c6774761a8b9f4a06f6812f1c8078bee2e937d65=
e376c3d2338b78993e5f4666"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
@@ -38,6 +38,7 @@ PACKAGECONFIG ??=3D " \
     tiff \
     raw \
     xml \
+    zip \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
     battery \
 "
@@ -62,6 +63,7 @@ PACKAGECONFIG[png]        =3D "-Dpng=3Denabled,-Dpng=3D=
disabled,libpng"
 PACKAGECONFIG[tiff]       =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
 PACKAGECONFIG[raw]       =3D "-Draw=3Denabled,-Draw=3Ddisabled,libraw"
 PACKAGECONFIG[xml]        =3D "-Dxml=3Denabled,-Dxml=3Ddisabled,libxml2"
+PACKAGECONFIG[zip]        =3D "-Dzip=3Denabled,-Dzip=3Ddisabled,libzip"
 PACKAGECONFIG[landlock]        =3D "-Dlandlock=3Denabled,-Dlandlock=3Ddi=
sabled"
=20
 # For security reasons it is strongly recommended to set add meta-securi=
ty in
@@ -69,7 +71,7 @@ PACKAGECONFIG[landlock]        =3D "-Dlandlock=3Denable=
d,-Dlandlock=3Ddisabled"
 PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Dtrue,-Dseccomp=3Dfalse,libseccom=
p"
=20
 EXTRA_OEMESON +=3D " \
-    -Dman=3Dfalse \
+    -Dman=3Dfalse -Dfunctional_tests=3Dfalse \
     -Dsystemd_user_services=3D${@bb.utils.contains('DISTRO_FEATURES', 's=
ystemd', 'true', 'false', d)} \
     -Dsystemd_user_services_dir=3D${systemd_user_unitdir} \
 "
--=20
2.53.0


