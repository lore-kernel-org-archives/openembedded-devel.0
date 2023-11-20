Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04001C2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 17:47:24 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.web10.5209.1700502436783919891
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Nov 2023 09:47:17 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd84.aul.t-online.de (fwd84.aul.t-online.de [10.223.144.110])
	by mailout10.t-online.de (Postfix) with SMTP id A92262B2B9
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 18:47:12 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.37.47]) by fwd84.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1r58MX-1lMn0T0; Mon, 20 Nov 2023 18:47:09 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-multimedia][PATCHv2] musicpd: unbreak build with ffmpeg 6.1
Date: Mon, 20 Nov 2023 18:47:25 +0100
Message-ID: <20231120174725.2758863-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1700502429-2F7FD9FB-E1669718/0/0 CLEAN NORMAL
X-TOI-MSGID: 7e2e9628-6254-4626-a6ac-1430c27f6651
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 17:47:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106965

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 ...tch-src_decoder_plugins_FfmpegIo.cxx.patch | 26 +++++++++++++++++++
 .../recipes-multimedia/musicpd/mpd_0.23.14.bb |  1 +
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
diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb b/=
meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
index 310b5f7c3..a762fc832 100644
--- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
+++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.23.14.bb
@@ -19,6 +19,7 @@ DEPENDS +=3D " \
 "
=20
 SRC_URI =3D "git://github.com/MusicPlayerDaemon/MPD;branch=3Dmaster;prot=
ocol=3Dhttps \
+           file://0001-patch-src_decoder_plugins_FfmpegIo.cxx.patch \
            file://mpd.conf.in \
            "
 SRCREV =3D "feac1a3f56591ccfb00870aba66c9ac3abac4773"
--=20
2.42.0


