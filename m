Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66493D3EE82
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40181.1769096637760522003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout02.t-online.de (Postfix) with SMTP id BC3DEF0B5
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqb-1auNgQ0; Thu, 22 Jan 2026 16:43:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 02/11] libcanberra: fix build without x11
Date: Thu, 22 Jan 2026 16:43:25 +0100
Message-ID: <20260122154334.1872038-2-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096629-8AFFA925-F8E6E573/0/0 CLEAN NORMAL
X-TOI-MSGID: b1d91d42-9d5a-4f2c-97cc-323100bdeb25
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123750

gtk3-module and xwayland require x11

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb b=
/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
index 19900d6cbe..2c063fd995 100644
--- a/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
+++ b/meta-oe/recipes-support/libcanberra/libcanberra_0.30-19.bb
@@ -23,7 +23,8 @@ EXTRA_OECONF =3D "\
=20
 PACKAGECONFIG ??=3D " \
 	${@bb.utils.filter('DISTRO_FEATURES', 'alsa pulseaudio', d)} \
-	${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gtk3 gstrea=
mer', '', d)} \
+	${@bb.utils.contains_any('DISTRO_FEATURES', 'x11 wayland', 'gstreamer',=
 '', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'gtk3', '', d)} \
 "
 PACKAGECONFIG[alsa] =3D "--enable-alsa, --disable-alsa, alsa-lib"
 PACKAGECONFIG[pulseaudio] =3D "--enable-pulse, --disable-pulse, pulseaud=
io"
--=20
2.52.0


