Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16664C77B6C
	for <webhook@archiver.kernel.org>; Sat,  8 Apr 2023 15:20:15 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.web10.14213.1680967211710566125
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Apr 2023 08:20:12 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd87.dcpf.telekom.de (fwd87.aul.t-online.de [10.223.144.113])
	by mailout02.t-online.de (Postfix) with SMTP id 155DB550F
	for <openembedded-devel@lists.openembedded.org>; Sat,  8 Apr 2023 17:20:10 +0200 (CEST)
Received: from flk-MS-7C91.fritz.box ([79.219.229.22]) by fwd87.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1plAMK-4aRAWn0; Sat, 8 Apr 2023 17:20:08 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Cc: Markus Volk <f_l_k@t-online.de>
Subject: [meta-oe][PATCH 1/2] freerdp: set PROXY_PLUGINDIR
Date: Sat,  8 Apr 2023 17:19:56 +0200
Message-Id: <20230408151957.10322-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1680967208-EF7FDC53-2CFB3443/0/0 CLEAN NORMAL
X-TOI-MSGID: 2c4a651e-c7c2-4680-844b-8c5f8ffb06f3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Apr 2023 15:20:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101995

This avoids buildpath in freerdp-proxy binary

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb b/meta-oe/=
recipes-support/freerdp/freerdp_2.10.0.bb
index a1bf67ca1..0fc779a60 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.10.0.bb
@@ -28,6 +28,7 @@ EXTRA_OECMAKE +=3D " \
     -DBUILD_STATIC_LIBS=3DOFF \
     -DCMAKE_POSITION_INDEPENDANT_CODE=3DON \
     -DWITH_MANPAGES=3DOFF \
+    -DPROXY_PLUGINDIR=3D${libdir}/freerdp/proxy/plugins \
 "
=20
 PACKAGECONFIG ??=3D " \
--=20
2.34.1


