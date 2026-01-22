Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A67BBD3EE94
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 15:44:00 +0000 (UTC)
Received: from mailout10.t-online.de (mailout10.t-online.de [194.25.134.21])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40178.1769096637235189827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Jan 2026 07:43:57 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.21, mailfrom: f_l_k@t-online.de)
Received: from fwd76.aul.t-online.de (fwd76.aul.t-online.de [10.223.144.102])
	by mailout10.t-online.de (Postfix) with SMTP id BD52B3870D
	for <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 16:43:54 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.154.161.253]) by fwd76.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1viwqb-1auNgS0; Thu, 22 Jan 2026 16:43:49 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-gnome][PATCH 04/11] libde265: dont select sld2 support by default
Date: Thu, 22 Jan 2026 16:43:27 +0100
Message-ID: <20260122154334.1872038-4-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260122154334.1872038-1-f_l_k@t-online.de>
References: <20260122154334.1872038-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1769096629-0AFFA925-A99A1790/0/0 CLEAN NORMAL
X-TOI-MSGID: 083a09bb-4210-4284-a5dd-5fdc5e01aa2d
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Jan 2026 15:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123743

libsdl2 requires x11 and should not be selected by default anyway
---
 meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.=
bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
index f432888fad..5236ce284a 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
@@ -16,7 +16,7 @@ inherit cmake pkgconfig
=20
 EXTRA_OECMAKE =3D "-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5"
=20
-PACKAGECONFIG ?=3D "libsdl"
+PACKAGECONFIG ?=3D ""
 PACKAGECONFIG[libsdl] =3D "-DENABLE_SDL=3DON,-DENABLE_SDL=3DOFF,virtual/=
libsdl2"
=20
 FILES:${PN} +=3D "${libdir}/libde265.so"
--=20
2.52.0


