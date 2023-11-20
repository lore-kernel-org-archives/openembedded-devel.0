Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 997B7C197A0
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:53:03 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web10.1075.1700499182372984967
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout01.t-online.de (Postfix) with SMTP id 7B0663DD94
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 17:52:58 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.47]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r57W5-0VrCIj0; Mon, 20 Nov 2023 17:52:57 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCH] musicpd: unbreak build with ffmpeg 6.1
Date: Mon, 20 Nov 2023 17:53:24 +0100
Message-ID: <20231120165324.2214368-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700499177-3B7FD95D-C2DF7144/0/0 CLEAN NORMAL
X-TOI-MSGID: 803cf129-ddd6-4aba-9287-1213e8ac4c22
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 16:53:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106963

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...tch-src_decoder_plugins_FfmpegIo.cxx.patch | 26 +++++++++++++++++++
 .../recipes-multimedia/musicpd/mpd_0.23.12.bb |  1 +
 2 files changed, 27 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/musicpd/mpd/0001-p=
atch-src_decoder_plugins_FfmpegIo.cxx.patch

diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-patch-sr=
c_decoder_plugins_FfmpegIo.cxx.patch b/meta-multimedia/recipes-multimedia=
/musicpd/mpd/0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch
new file mode 100644
index 000000000..b2dea331e
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd/0001-patch-src_decod=
er_plugins_FfmpegIo.cxx.patch
@@ -0,0 +1,26 @@
+From e62fd0eefe8b475e70d87a673a7216aac3bb622f Mon Sep 17 00:00:00 2001
+From: Markus Volk <f_l_k@t-online.de>
+Date: Mon, 20 Nov 2023 17:49:59 +0100
+Subject: [PATCH] patch src_decoder_plugins_FfmpegIo.cxx
+
+Signed-off-by: Markus Volk <f_l_k@t-online.de>
+Upstream-Status: Pending [https://github.com/MusicPlayerDaemon/MPD/issue=
s/1898]
+---
+ src/decoder/plugins/FfmpegIo.cxx | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/decoder/plugins/FfmpegIo.cxx b/src/decoder/plugins/Ffmp=
egIo.cxx
+index 572f1a86a..3e2347fec 100644
+--- a/src/decoder/plugins/FfmpegIo.cxx
++++ b/src/decoder/plugins/FfmpegIo.cxx
+@@ -25,6 +25,7 @@
+ #include "input/InputStream.hxx"
+=20
+ extern "C" {
++#include <libavutil/error.h>
+ #include <libavutil/mem.h>
+ }
+=20
+--=20
+2.42.0
+
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
index 0c309ded0..4e9cb9090 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.12.bb
@@ -23,6 +23,7 @@ SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;bra=
nch=3Dmaster;protocol=3Dhttps \
            file://minor-fixup-for-libfmt10.patch \
            file://fix-build-error-when-fmt-updated.patch \
            file://0001-SndfileDecoderPlugin-Fix-type-mismatch-for-std-sp=
an.patch \
+           file://0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch \
            "
 SRCREV =3D "b1422fbda40a1831d397fb161e7a555443c2a072"
 S =3D "${WORKDIR}/git"
--=20
2.42.0


