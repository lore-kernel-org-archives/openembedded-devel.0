Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72ADEC3ABA6
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:26 +0000 (UTC)
Received: from mailout09.t-online.de (mailout09.t-online.de [194.25.134.84])
 by mx.groups.io with SMTP id smtpd.web10.4134.1745526863076693239
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.84, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout09.t-online.de (Postfix) with SMTP id 57C0B1A04
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:21 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H3-38CNSd0; Thu, 24 Apr 2025 22:34:21 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 11/18] libvncserver: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:59 +0200
Message-ID: <20250424203406.2113462-11-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526861-2A7FBA5A-6CB5748F/0/0 CLEAN NORMAL
X-TOI-MSGID: 510d0a53-9597-43a4-9539-b1c3b831c4e1
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117106

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb=
 b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
index ce01593b8b..e518461d7d 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.14.bb
@@ -35,7 +35,7 @@ PACKAGECONFIG[png] =3D "-DWITH_PNG=3DON,-DWITH_PNG=3DOF=
F,libpng,libpng"
 PACKAGECONFIG[pthread] =3D "-DWITH_THREADS=3DON,-DWITH_THREADS=3DOFF,"
 PACKAGECONFIG[systemd] =3D "-DWITH_SYSTEMD=3DON,-DWITH_SYSTEMD=3DOFF,sys=
temd"
 PACKAGECONFIG[sasl] =3D "-DWITH_SASL=3DON,-DWITH_SASL=3DOFF,cyrus-sasl"
-PACKAGECONFIG[sdl] =3D "-DWITH_SDL=3DON,-DWITH_SDL=3DOFF,libsdl2"
+PACKAGECONFIG[sdl] =3D "-DWITH_SDL=3DON,-DWITH_SDL=3DOFF,virtual/libsdl2=
"
 PACKAGECONFIG[websockets] =3D "-DWITH_WEBSOCKETS=3DON,-DWITH_WEBSOCKETS=3D=
OFF,"
 PACKAGECONFIG[zlib] =3D "-DWITH_ZLIB=3DON,-DWITH_ZLIB=3DOFF,zlib"
=20
--=20
2.49.0


