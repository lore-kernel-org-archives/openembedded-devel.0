Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D0A6C369D7
	for <webhook@archiver.kernel.org>; Thu, 24 Apr 2025 20:34:46 +0000 (UTC)
Received: from mailout01.t-online.de (mailout01.t-online.de [194.25.134.80])
 by mx.groups.io with SMTP id smtpd.web11.4209.1745526885909050399
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Apr 2025 13:34:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.80, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout01.t-online.de (Postfix) with SMTP id C6ECD16DA
	for <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 22:34:20 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.166.69]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1u83H2-38CNSV0; Thu, 24 Apr 2025 22:34:20 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 03/18] libde265: make use of virtual/libsdl2
Date: Thu, 24 Apr 2025 22:33:51 +0200
Message-ID: <20250424203406.2113462-3-f_l_k@t-online.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424203406.2113462-1-f_l_k@t-online.de>
References: <20250424203406.2113462-1-f_l_k@t-online.de>
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1745526860-977FDA5A-8A64A0A9/0/0 CLEAN NORMAL
X-TOI-MSGID: 36229030-7ebb-400e-a505-509628d051c9
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Apr 2025 20:34:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117116

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.=
bb b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
index 12bdb23354..e9d5107986 100644
--- a/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
+++ b/meta-multimedia/recipes-multimedia/libde265/libde265_1.0.15.bb
@@ -16,7 +16,7 @@ S =3D "${WORKDIR}/git"
 inherit cmake pkgconfig
=20
 PACKAGECONFIG ?=3D "libsdl"
-PACKAGECONFIG[libsdl] =3D "-DENABLE_SDL=3DON,-DENABLE_SDL=3DOFF,libsdl2"
+PACKAGECONFIG[libsdl] =3D "-DENABLE_SDL=3DON,-DENABLE_SDL=3DOFF,virtual/=
libsdl2"
=20
 FILES:${PN} +=3D "${libdir}/libde265.so"
 FILES:${PN}-dev =3D "${includedir} ${libdir}/cmake ${libdir}/pkgconfig"
--=20
2.49.0


