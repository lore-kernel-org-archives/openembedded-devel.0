Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BEED41153
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 09:56:12 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32151.1768470966925327346
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jan 2026 01:56:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd74.aul.t-online.de (fwd74.aul.t-online.de [10.223.144.100])
	by mailout05.t-online.de (Postfix) with SMTP id 8BF28261
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 10:56:04 +0100 (CET)
Received: from intel-corei7-64.fritz.box ([84.163.47.171]) by fwd74.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1vgK5A-0lbNvF0; Thu, 15 Jan 2026 10:56:01 +0100
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [RFC][meta-oe][PATCH] libtoml11: build with CMAKE_CXX_STANDARD 20
Date: Thu, 15 Jan 2026 10:55:52 +0100
Message-ID: <20260115095552.566834-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1768470961-6DFF885C-C7CAE479/0/0 CLEAN NORMAL
X-TOI-MSGID: a6b016ba-1fac-4761-8648-bcb7a279bc85
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jan 2026 09:56:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123498

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb b/meta=
-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
index 38786b79ed..973a39fc21 100644
--- a/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
+++ b/meta-oe/recipes-devtools/libtoml11/libtoml11_4.4.0.bb
@@ -28,6 +28,7 @@ inherit cmake ptest
=20
 EXTRA_OECMAKE +=3D "-DTOML11_PRECOMPILE=3DON \
                   -DTOML11_BUILD_TESTS=3D${@bb.utils.contains("DISTRO_FE=
ATURES", "ptest", "ON", "OFF", d)} \
+                  -DCMAKE_CXX_STANDARD=3D20 \
 "
=20
 ALLOW_EMPTY:${PN} =3D "1"
--=20
2.52.0


