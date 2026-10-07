Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 334CACA5FF1
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 14:13:16 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10615.1791382386901276716
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Oct 2026 07:13:07 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=T6/tt0YY;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout04.t-online.de (Postfix) with SMTP id B8102992
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Oct 2026 16:12:40 +0200 (CEST)
Received: from intel-corei7-64.fritz.box ([84.154.167.22]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1xESNs-4FG7zk0; Wed, 7 Oct 2026 16:12:40 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libtsm: upgrade 4.7.1 -> 4.8.0
Date: Wed,  7 Oct 2026 16:12:32 +0200
Message-ID: <20261007141233.4288-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1791382360-EAFFA9F5-796E4727/0/0 CLEAN NORMAL
X-TOI-MSGID: 522ee34d-4c01-4042-8d17-d8d07f57d8e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1791382360; i=f_l_k@t-online.de;
	bh=hm13ClDyaDasrZjwspvfrxamyWtLG/y/+MGKxdoB/OA=;
	h=From:To:Subject:Date;
	b=T6/tt0YYSBs2wa02BhAZDbNKgvVwsgGHXEdwuOp3spT7XrlgSPTcYFFQQtu8URf0+
	 /y8MyRZ+POcXP3n/vX6Fy8flO1LmVZEYiIiyNzbESfyKWIWWnwTv0tpxdYvHkTjNQE
	 i9b41L35z5IyGfXm6rOVTscvtJZ9waLTan+DyalhCIME3obSFNX3OdUQqog3OtH26c
	 XYK21GKHCrf5sZym52CRK+E9EqnPnxfjrsPpyH/p15LdTFiCabyeJaLKq+J7XyDCX1
	 drVs6GC9pNMgADb+VSLceAlmWj5fDSiXLcFocB1OXYfROX5VtA7Zsq4kAjTcOMZcC4
	 nrcpQwnKjiGMg==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Oct 2026 14:13:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130658

kmscon 10.0.4 requires libtsm 4.8.0.

AI-Generated: Uses Claude Code (Claude Opus 5.5)
Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 .../libtsm/{libtsm_4.7.1.bb =3D> libtsm_4.8.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.7.1.bb =3D> libtsm_4.8.=
0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.7.1.bb b/meta-oe/re=
cipes-graphics/libtsm/libtsm_4.8.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.7.1.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.8.0.bb
index 3c493bca0a..66f1a11a2b 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.7.1.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.8.0.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM =3D "\
 DEPENDS =3D "xkeyboard-config"
=20
 SRC_URI =3D "git://github.com/kmscon/libtsm;protocol=3Dhttps;branch=3Dma=
in;tag=3Dv${PV}"
-SRCREV =3D "ef0a1a40c30d164913f413c47de5bbd8383a6daa"
+SRCREV =3D "ef2365d0f9f1a370d721a82470d69c3646fe97f0"
=20
 inherit meson pkgconfig
=20
--=20
2.55.0


