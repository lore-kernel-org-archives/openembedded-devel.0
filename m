Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA784C77B7F
	for <webhook@archiver.kernel.org>; Sat, 25 Mar 2023 08:03:20 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web11.17414.1679731399688411659
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 25 Mar 2023 01:03:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd74.dcpf.telekom.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout04.t-online.de (Postfix) with SMTP id 5273B1E81F
	for <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 09:03:17 +0100 (CET)
Received: from flk-MS-7C91.fritz.box ([84.154.174.49]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1pfyrp-0RoPhi0; Sat, 25 Mar 2023 09:03:14 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-gnome][PATCH 26/32] tracker-miners: update 3.4.2 -> 3.5.0
Date: Sat, 25 Mar 2023 09:02:50 +0100
Message-Id: <20230325080256.923752-26-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230325080256.923752-1-f_l_k@t-online.de>
References: <20230325080256.923752-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1679731394-8656CC08-70275AE0/0/0 CLEAN NORMAL
X-TOI-MSGID: c2f4c4da-c644-4bb1-bf45-af1ad5ad259f
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Mar 2023 08:03:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101740

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...to-a-fixed-path-instead-of-a-host-pa.patch | 18 ++--------------
 ...iners_3.4.2.bb =3D> tracker-miners_3.5.0.bb} | 21 ++++++++++++-------
 2 files changed, 15 insertions(+), 24 deletions(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker-miners_3.4.2.bb =3D> tr=
acker-miners_3.5.0.bb} (75%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-hea=
der-file-to-a-fixed-path-instead-of-a-host-pa.patch b/meta-gnome/recipes-=
gnome/tracker/tracker-miners/0001-Set-header-file-to-a-fixed-path-instead=
-of-a-host-pa.patch
index 1332a9582..7a40ae338 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-fil=
e-to-a-fixed-path-instead-of-a-host-pa.patch
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners/0001-Set-header-fil=
e-to-a-fixed-path-instead-of-a-host-pa.patch
@@ -7,22 +7,8 @@ Upstream-Status: Inappropriate [embedded specific]
=20
 Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
 ---
- src/libtracker-miner/tracker-miner-enum-types.c.template        | 2 +-
- .../tracker-miners-enum-types.c.template                        | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/libtracker-miner/tracker-miner-enum-types.c.template b/=
src/libtracker-miner/tracker-miner-enum-types.c.template
-index 7be7a01..46a4dc9 100644
---- a/src/libtracker-miner/tracker-miner-enum-types.c.template
-+++ b/src/libtracker-miner/tracker-miner-enum-types.c.template
-@@ -7,7 +7,7 @@
-
- /*** BEGIN file-production ***/
- /* enumerations from "@basename@" */
--#include "@filename@"
-+#include "tracker-miner-enums.h"
- /*** END file-production ***/
-
+ src/libtracker-miners-common/tracker-miner-enum-types.c.template       =
 | 1 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
=20
 diff --git a/src/libtracker-miners-common/tracker-miners-enum-types.c.te=
mplate b/src/libtracker-miners-common/tracker-miners-enum-types.c.templat=
e
 index c712dda..cb449e2 100644
diff --git a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.2.bb b/m=
eta-gnome/recipes-gnome/tracker/tracker-miners_3.5.0.bb
similarity index 75%
rename from meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.2.bb
rename to meta-gnome/recipes-gnome/tracker/tracker-miners_3.5.0.bb
index cbd1d0ddb..d093697c1 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker-miners_3.4.2.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker-miners_3.5.0.bb
@@ -16,10 +16,9 @@ GNOMEBASEBUILDCLASS =3D "meson"
 inherit gnomebase gsettings gobject-introspection vala bash-completion f=
eatures_check
=20
 SRC_URI +=3D "file://0001-meson.build-Just-warn-if-we-build-without-libs=
eccomp.patch \
-            file://0001-Set-header-file-to-a-fixed-path-instead-of-a-hos=
t-pa.patch \
+	    file://0001-Set-header-file-to-a-fixed-path-instead-of-a-host-pa.pa=
tch \
            "
-
-SRC_URI[archive.sha256sum] =3D "101e3608f1c28bfed8ae25522f7a720b559f889a=
76e280afbe50a4d8b064f92c"
+SRC_URI[archive.sha256sum] =3D "17966603dc432a98526b490586a48acd7f9f5993=
5f7895dfc51729a46a6901a3"
=20
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES =3D "gobject-introspection-data"
@@ -36,25 +35,31 @@ PACKAGECONFIG ??=3D " \
     pdf \
     png \
     tiff \
+    raw \
     xml \
     ${@bb.utils.filter('DISTRO_FEATURES', 'seccomp', d)} \
+    battery \
+    networkmanager \
 "
=20
 PACKAGECONFIG[battery]     =3D "-Dbattery_detection=3Dupower,-Dbattery_d=
etection=3Dnone,upower"
-PACKAGECONFIG[ffmpeg]     =3D ",,ffmpeg"
+PACKAGECONFIG[cue]     =3D "-Dcue=3Denabled,-Dcue=3Ddisabled,libcue"
+PACKAGECONFIG[ffmpeg]     =3D "-Dgeneric_media_extractor=3Dlibav,,ffmpeg=
"
 PACKAGECONFIG[gexiv2]     =3D ",,gexiv2"
-PACKAGECONFIG[gstreamer]  =3D ",,gstreamer1.0 gstreamer1.0-plugins-base"
-PACKAGECONFIG[gupnp]      =3D ",,gupnp-dlna"
+PACKAGECONFIG[gstreamer]  =3D "-Dgeneric_media_extractor=3Dgstreamer,,gs=
treamer1.0 gstreamer1.0-plugins-base"
+PACKAGECONFIG[gupnp]      =3D "-Dgstreamer_backend=3Dgupnp,,gupnp-dlna"
 PACKAGECONFIG[gif]        =3D "-Dgif=3Denabled,-Dgif=3Ddisabled,giflib"
-PACKAGECONFIG[icu]        =3D ",,icu"
+PACKAGECONFIG[icu]        =3D "-Dcharset_detection=3Dicu,,icu"
+PACKAGECONFIG[iso]        =3D "-Diso=3Denabled,-Diso=3Ddisabled,libosinf=
o"
 PACKAGECONFIG[jpeg]       =3D "-Djpeg=3Denabled,-Djpeg=3Ddisabled,jpeg"
 PACKAGECONFIG[libexif]    =3D "-Dexif=3Denabled,-Dexif=3Ddisabled,libexi=
f"
 PACKAGECONFIG[libgsf]     =3D "-Dgsf=3Denabled,-Dgsf=3Ddisabled,libgsf"
 PACKAGECONFIG[pdf]        =3D "-Dpdf=3Denabled,-Dpdf=3Ddisabled,poppler"
 PACKAGECONFIG[png]        =3D "-Dpng=3Denabled,-Dpng=3Ddisabled,libpng"
 PACKAGECONFIG[tiff]       =3D "-Dtiff=3Denabled,-Dtiff=3Ddisabled,tiff"
+PACKAGECONFIG[raw]       =3D "-Draw=3Denabled,-Draw=3Ddisabled,libraw"
 PACKAGECONFIG[xml]        =3D "-Dxml=3Denabled,-Dxml=3Ddisabled,libxml2"
-PACKAGECONFIG[networkmanager] =3D "-Dnetwork_manager=3Denabled,-Dnetwork=
_manager=3Ddisabled,networkmanger"
+PACKAGECONFIG[networkmanager] =3D "-Dnetwork_manager=3Denabled,-Dnetwork=
_manager=3Ddisabled,networkmanager"
=20
 # For security reasons it is strongly recommended to set add meta-securi=
ty in
 # your layers and 'libseccomp' to PACKAGECONFIG".
--=20
2.34.1


