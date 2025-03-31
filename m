Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08543C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 06:21:59 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.web10.45862.1743402117686962519
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Mar 2025 23:21:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd72.aul.t-online.de (fwd72.aul.t-online.de [10.223.144.98])
	by mailout08.t-online.de (Postfix) with SMTP id 88DE38BC
	for <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 08:21:55 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.164.73]) by fwd72.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1tz8Ws-0eB43F0; Mon, 31 Mar 2025 08:21:50 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 1/2] mpv: build libmpv by default
Date: Mon, 31 Mar 2025 08:22:36 +0200
Message-ID: <20250331062237.8115-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1743402110-567F3ACD-0DF75ECC/0/0 CLEAN NORMAL
X-TOI-MSGID: e039cedf-4062-46eb-ac74-0d6cc22d3293
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 31 Mar 2025 06:21:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116393

Add libmpv to PACKAGECONFIG. It is the default setting for mpv_0.40.0
and will be a requirement for recipes like mpvpaper or celluloid

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb b/meta-oe/r=
ecipes-multimedia/mplayer/mpv_0.40.0.bb
index 1fa6a6da65..3d54bbb341 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.40.0.bb
@@ -34,6 +34,7 @@ LUA:powerpc  =3D ""
=20
 # Note: lua is required to get on-screen-display (controls)
 PACKAGECONFIG ??=3D " \
+    libmpv \
     ${LUA} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland opengl pipewire p=
ulseaudio vulkan', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'egl', '',=
 d)} \
--=20
2.49.0


