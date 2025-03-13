Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4BE3C2BA1B
	for <webhook@archiver.kernel.org>; Thu, 13 Mar 2025 10:32:09 +0000 (UTC)
Received: from mailout11.t-online.de (mailout11.t-online.de [194.25.134.85])
 by mx.groups.io with SMTP id smtpd.web11.11228.1741861928059269709
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 13 Mar 2025 03:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.85, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout11.t-online.de (Postfix) with SMTP id D5BF2ECC
	for <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 11:32:05 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([79.219.231.110]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tsfrB-3UGxs10; Thu, 13 Mar 2025 11:32:05 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][gnome48][meta-gnome][PATCH 1/3] localsearch: update 3.8.2 -> 3.9.rc
Date: Thu, 13 Mar 2025 11:32:46 +0100
Message-ID: <20250313103248.2116871-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1741861925-E17F8459-0F2378DB/0/0 CLEAN NORMAL
X-TOI-MSGID: 2b7ede99-e988-4313-bc70-4e575af75108
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 13 Mar 2025 10:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115963

- rework patches after directory refactor
- drop deprecated options

NEW in 3.9.rc - 2025-03-02
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D
  * Metadata extractor refactors
  * Fixed possible runtime warnings
  * Fixed possible indexer stall
  * Restructure project directories
  * Fix build with -Dwriteback=3Dfalse

NEW in 3.9.beta - 2025-02-04
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
  * Ditch GStreamer for metadata extraction, and switch to FFmpeg/libav f=
or
    many benefits in extraction speed, memory usage and sandbox friendlin=
ess.
    If this causes dependency/distribution issues, it is recommended to
    separate the following files to a standalone package:
    - $(datadir)/localsearch3/extract-rules/15-libav-guess.rule
    - $(datadir)/localsearch3/extract-rules/90-libav-audio-generic.rule
    - $(datadir)/localsearch3/extract-rules/90-libav-video-generic.rule
    - $(libdir)/localsearch-3.0/extract-modules/libextract-libav.so
  * Fix build issues with gcc 15.x
  * Updated README to new project name

Translations: fr, sl, sr

NEW in 3.9.alpha - 2025-01-11
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
  * Fix for folder updates happening while the daemon is not running
  * Improve memory usage when dealing with very large folders
  * Improve recovery after process interruption
  * Code improvements
  * Avoid GStreamer memory payload in indexer process
  * Improved performance when deleting stale resources
  * Test improvements

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...to-a-fixed-path-instead-of-a-host-pa.patch |  6 ++---
 .../0001-fix-reproducibility.patch            | 24 +++++++++----------
 ...lsearch_3.8.2.bb =3D> localsearch_3.9.rc.bb} | 12 ++++------
 3 files changed, 19 insertions(+), 23 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{localsearch_3.8.2.bb =3D> local=
search_3.9.rc.bb} (83%)

diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header=
-file-to-a-fixed-path-instead-of-a-host-pa.patch b/meta-gnome/recipes-gno=
me/tracker/localsearch/0001-Set-header-file-to-a-fixed-path-instead-of-a-=
host-pa.patch
index 606a3e9aac..87589a0e64 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header-file-t=
o-a-fixed-path-instead-of-a-host-pa.patch
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-Set-header-file-t=
o-a-fixed-path-instead-of-a-host-pa.patch
@@ -10,10 +10,10 @@ Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
  .../tracker-miners-enum-types.c.template                        | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
-diff --git a/src/libtracker-miners-common/tracker-miners-enum-types.c.te=
mplate b/src/libtracker-miners-common/tracker-miners-enum-types.c.templat=
e
+diff --git a/src/common/tracker-miners-enum-types.c.template b/src/commo=
n/tracker-miners-enum-types.c.template
 index 4db7ef1..7c44c13 100644
---- a/src/libtracker-miners-common/tracker-miners-enum-types.c.template
-+++ b/src/libtracker-miners-common/tracker-miners-enum-types.c.template
+--- a/src/common/tracker-miners-enum-types.c.template
++++ b/src/common/tracker-miners-enum-types.c.template
 @@ -7,7 +7,7 @@
 =20
  /*** BEGIN file-production ***/
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reprod=
ucibility.patch b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-r=
eproducibility.patch
index 6c1d978135..1bab34e126 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibili=
ty.patch
+++ b/meta-gnome/recipes-gnome/tracker/localsearch/0001-fix-reproducibili=
ty.patch
@@ -13,7 +13,7 @@ Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Markus Volk <f_l_k@t-online.de>
 ---
  meson.build                                     | 8 ++++----
- src/libtracker-miners-common/tracker-landlock.c | 4 ++--
+ src/common/tracker-landlock.c | 4 ++--
  src/miners/fs/meson.build                       | 4 ++--
  src/tracker-extract/meson.build                 | 2 +-
  tests/tracker-miner-fs/meson.build              | 2 +-
@@ -52,10 +52,10 @@ index 7ae103c..cc61e84 100644
  ]
 =20
  if get_option('tests_tap_protocol')
-diff --git a/src/libtracker-miners-common/tracker-landlock.c b/src/libtr=
acker-miners-common/tracker-landlock.c
+diff --git a/src/common/tracker-landlock.c b/src/common/tracker-landlock=
.c
 index 0ad90d0..354f5d1 100644
---- a/src/libtracker-miners-common/tracker-landlock.c
-+++ b/src/libtracker-miners-common/tracker-landlock.c
+--- a/src/common/tracker-landlock.c
++++ b/src/common/tracker-landlock.c
 @@ -283,7 +283,7 @@ tracker_landlock_init (const gchar * const *indexed_=
folders)
  			          LANDLOCK_ACCESS_FS_READ_DIR);
  		}
@@ -76,23 +76,23 @@ index 0ad90d0..354f5d1 100644
  	add_rule (landlock_fd, MINER_FS_CACHE_LOCATION,
 diff --git a/src/miners/fs/meson.build b/src/miners/fs/meson.build
 index 1e16618..286580a 100644
---- a/src/miners/fs/meson.build
-+++ b/src/miners/fs/meson.build
+--- a/src/indexer/meson.build
++++ b/src/indexer/meson.build
 @@ -68,8 +68,8 @@ executable('localsearch-@0@'.format(tracker_api_major)=
,
      dependencies: tracker_miner_fs_deps,
      c_args: [
          tracker_c_args,
 -        '-DBUILDROOT=3D"@0@"'.format(meson.global_build_root()),
--        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(meson.build_root() / 'src' =
/ 'tracker-extract'),
+-        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(meson.build_root() / 'src' =
/ 'extractor'),
 +        '-DBUILDROOT=3D"@0@"'.format(get_option('prefix') / 'src'),
-+        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(get_option('prefix') / 'src=
' / 'tracker-extract'),
++        '-DBUILD_EXTRACTDIR=3D"@0@"'.format(get_option('prefix') / 'src=
' / 'extractor'),
          '-DLIBEXECDIR=3D"@0@"'.format(get_option('prefix') / get_option=
('libexecdir')),
      ],
      install: true,
 diff --git a/src/tracker-extract/meson.build b/src/tracker-extract/meson=
.build
 index 2584881..31411f2 100644
---- a/src/tracker-extract/meson.build
-+++ b/src/tracker-extract/meson.build
+--- a/src/extractor/meson.build
++++ b/src/extractor/meson.build
 @@ -158,7 +158,7 @@ endif
  executable('localsearch-extractor-@0@'.format(tracker_api_major),
    tracker_extract_sources,
@@ -104,8 +104,8 @@ index 2584881..31411f2 100644
    install: true,
 diff --git a/tests/tracker-miner-fs/meson.build b/tests/tracker-miner-fs=
/meson.build
 index 8c081fd..9792082 100644
---- a/tests/tracker-miner-fs/meson.build
-+++ b/tests/tracker-miner-fs/meson.build
+--- a/tests/indexer/meson.build
++++ b/tests/indexer/meson.build
 @@ -18,7 +18,7 @@ libtracker_miner_test_c_args =3D [
  ]
 =20
diff --git a/meta-gnome/recipes-gnome/tracker/localsearch_3.8.2.bb b/meta=
-gnome/recipes-gnome/tracker/localsearch_3.9.rc.bb
similarity index 83%
rename from meta-gnome/recipes-gnome/tracker/localsearch_3.8.2.bb
rename to meta-gnome/recipes-gnome/tracker/localsearch_3.9.rc.bb
index bcc5a30501..26f3188b0a 100644
--- a/meta-gnome/recipes-gnome/tracker/localsearch_3.8.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/localsearch_3.9.rc.bb
@@ -18,7 +18,7 @@ SRC_URI:append =3D " \
 	file://0001-fix-reproducibility.patch \
 	file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.patch =
\
 "
-SRC_URI[archive.sha256sum] =3D "cda69195f6845357a8d91c023670efe92238f4d1=
38a1ef7a1401f45a2a8403ce"
+SRC_URI[archive.sha256sum] =3D "511a84603e514f889c17b3271f9bc3fbd7547b2a=
e4281144d138f28dd31998cb"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
@@ -40,7 +40,6 @@ PACKAGECONFIG ??=3D " \
     xml \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
     battery \
-    networkmanager \
 "
 # Needs tgkill API which musl does not support
 # see https://www.openwall.com/lists/musl/2019/08/02/1
@@ -48,9 +47,9 @@ PACKAGECONFIG:remove:libc-musl =3D "seccomp"
=20
 PACKAGECONFIG[battery]     =3D "-Dbattery_detection=3Dupower,-Dbattery_d=
etection=3Dnone,upower"
 PACKAGECONFIG[cue]     =3D "-Dcue=3Denabled,-Dcue=3Ddisabled,libcue"
-PACKAGECONFIG[ffmpeg]     =3D "-Dgeneric_media_extractor=3Dlibav,,ffmpeg=
"
+PACKAGECONFIG[ffmpeg]     =3D "-Dlibav=3Denabled,-Dlibav=3Ddisabled,ffmp=
eg"
 PACKAGECONFIG[gexiv2]     =3D ",,gexiv2"
-PACKAGECONFIG[gstreamer]  =3D "-Dgeneric_media_extractor=3Dgstreamer,,gs=
treamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gstreamer]  =3D ",,gstreamer1.0 gstreamer1.0-plugins-base"
 PACKAGECONFIG[gupnp]      =3D "-Dgstreamer_backend=3Dgupnp,,gupnp-dlna"
 PACKAGECONFIG[gif]        =3D "-Dgif=3Denabled,-Dgif=3Ddisabled,giflib"
 PACKAGECONFIG[icu]        =3D "-Dcharset_detection=3Dicu,,icu"
@@ -63,14 +62,11 @@ PACKAGECONFIG[png]        =3D "-Dpng=3Denabled,-Dpng=3D=
disabled,libpng"
 PACKAGECONFIG[tiff]       =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
 PACKAGECONFIG[raw]       =3D "-Draw=3Denabled,-Draw=3Ddisabled,libraw"
 PACKAGECONFIG[xml]        =3D "-Dxml=3Denabled,-Dxml=3Ddisabled,libxml2"
-PACKAGECONFIG[networkmanager] =3D "-Dnetwork_manager=3Denabled,-Dnetwork=
_manager=3Ddisabled,networkmanager"
 PACKAGECONFIG[landlock]        =3D "-Dlandlock=3Denabled,-Dlandlock=3Ddi=
sabled"
=20
 # For security reasons it is strongly recommended to set add meta-securi=
ty in
-# your layers and 'libseccomp' to PACKAGECONFIG".
+# your layers and 'libseccomp + landlock' to PACKAGECONFIG".
 PACKAGECONFIG[seccomp] =3D "-Dseccomp=3Dtrue,-Dseccomp=3Dfalse,libseccom=
p"
-# not yet in meta-gnome
-PACKAGECONFIG[rss]        =3D "-Dminer_rss=3Dtrue,-Dminer_rss=3Dfalse,li=
bgrss"
=20
 EXTRA_OEMESON +=3D " \
     -Dman=3Dfalse \
--=20
2.48.1


