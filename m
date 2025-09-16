Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79AABCAC599
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 07:44:32 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.web10.13677.1758008666643099859
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Sep 2025 00:44:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd88.aul.t-online.de (fwd88.aul.t-online.de [10.223.144.114])
	by mailout04.t-online.de (Postfix) with SMTP id 987E6F348
	for <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 09:44:24 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.163.32.95]) by fwd88.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1uyQMR-1GgjiL0; Tue, 16 Sep 2025 09:44:23 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] mpv: fix build with ffmpeg 8.0
Date: Tue, 16 Sep 2025 09:44:18 +0200
Message-ID: <20250916074418.3024526-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1758008663-D672E9B4-68BE2722/0/0 CLEAN NORMAL
X-TOI-MSGID: b9922cf1-0116-40b8-804c-3e20430725e4
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Sep 2025 07:44:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119420

---
 .../0001-mpv-fix-build-with-ffmpeg-8.0.patch  | 41 +++++++++++++++++++
 .../recipes-multimedia/mplayer/mpv_0.40.0.bb  |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-b=
uild-with-ffmpeg-8.0.patch

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-wi=
th-ffmpeg-8.0.patch b/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix=
-build-with-ffmpeg-8.0.patch
new file mode 100644
index 0000000000..ea705a4c73
--- /dev/null
+++ b/meta-oe/recipes-multimedia/mplayer/mpv/0001-mpv-fix-build-with-ffmp=
eg-8.0.patch
@@ -0,0 +1,41 @@
+From dd80e5841894f854e2d994601016151531521d9a Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Tue, 16 Sep 2025 09:37:48 +0200
+Subject: [PATCH] mpv: fix build with ffmpeg 8.0
+
+quick fix, only compile tested
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+
+Upstream-Status: Pending
+---
+ demux/demux_mkv.c | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/demux/demux_mkv.c b/demux/demux_mkv.c
+index 135edcc23d..cc7ce3e98f 100644
+--- a/demux/demux_mkv.c
++++ b/demux/demux_mkv.c
+@@ -2200,16 +2200,16 @@ static int demux_mkv_open_sub(demuxer_t *demuxer=
, mkv_track_t *track)
+             // [0x30..0x37] are component tags utilized for
+             // non-mobile captioning service ("profile A").
+             if (component_tag >=3D 0x30 && component_tag <=3D 0x37)
+-                lav->profile =3D FF_PROFILE_ARIB_PROFILE_A;
++                lav->profile =3D AV_PROFILE_ARIB_PROFILE_A;
+             break;
+         case 0x0012:
+             // component tag 0x87 signifies a mobile/partial reception
+             // (1seg) captioning service ("profile C").
+             if (component_tag =3D=3D 0x87)
+-                lav->profile =3D FF_PROFILE_ARIB_PROFILE_C;
++                lav->profile =3D AV_PROFILE_ARIB_PROFILE_C;
+             break;
+         }
+-        if (lav->profile =3D=3D FF_PROFILE_UNKNOWN)
++        if (lav->profile =3D=3D AV_PROFILE_UNKNOWN)
+             MP_WARN(demuxer, "ARIB caption profile %02x / %04x not supp=
orted.\n",
+                     component_tag, data_component_id);
+     }
+--=20
+2.50.1
+
diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.40.0.bb
index 3223dd69d7..117395b371 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
@@ -18,6 +18,7 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D570a9b37=
49dd0463a1778803b12a6dce"
=20
 SRCREV =3D "e48ac7ce08462f5e33af6ef9deeac6fa87eef01e"
 SRC_URI =3D "git://github.com/mpv-player/mpv;name=3Dmpv;branch=3Drelease=
/${@oe.utils.trim_version('${PV}', 2)};protocol=3Dhttps"
+SRC_URI +=3D "file://0001-mpv-fix-build-with-ffmpeg-8.0.patch"
=20
 inherit meson pkgconfig mime-xdg
=20
--=20
2.50.1


