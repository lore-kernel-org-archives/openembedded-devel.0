Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E567CD3427
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 15:52:15 +0000 (UTC)
Received: from mailout04.t-online.de (mailout04.t-online.de [194.25.134.18])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.83.1777996331808463972
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2026 08:52:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=uX+RZQ5o;
 spf=pass (domain: t-online.de, ip: 194.25.134.18, mailfrom: f_l_k@t-online.de)
Received: from fwd75.aul.t-online.de (fwd75.aul.t-online.de [10.223.144.101])
	by mailout04.t-online.de (Postfix) with SMTP id AB6A5112B
	for <openembedded-devel@lists.openembedded.org>; Tue,  5 May 2026 17:52:09 +0200 (CEST)
Received: from fedora.fritz.box ([79.219.234.37]) by fwd75.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wKI49-0vmTAH0; Tue, 5 May 2026 17:52:09 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] libtsm: update 4.4.3 -> 4.5.0
Date: Tue,  5 May 2026 17:51:59 +0200
Message-ID: <20260505155200.43091-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1777996329-527FB814-F7BFECCE/0/0 CLEAN NORMAL
X-TOI-MSGID: f0773668-2175-439a-b41a-d6af3f148a2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1777996329; i=f_l_k@t-online.de;
	bh=EbU+6rI4ApP2SwutjHPvyIjo2aF89lkO1caenxcYf/A=;
	h=From:To:Subject:Date;
	b=uX+RZQ5oDcm04kFODts+p124WcyrVqHQfOxBq9BhOW36xlZj+5Uc7tHl7OyomkErp
	 WalpyNY+yv6dO2ur07koP7/snRfosWgUQoRur4gQ0zIRmrMYMr780dehM1voP1CqAz
	 V+M6gvDk74iEPQXxAI/nwu4vy2Et/i8AQpmOrSI3IFgTSp+nbUBzZaKAyPbSJERUSz
	 hSxUn+edR2NOphRdYD3IGZzbFAFJR//AQ/lTLu688pKsOcOSZB3X74KZpDdDu5yNsU
	 RVAOumU+KuteekIbzVSaYjhqsinJlkF+gKUaCc5UmSmIm6F0EsQlYuU1HREZYoucYb
	 FjY0jDxNDdvfw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2026 15:52:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126793

---
 .../libtsm/{libtsm_4.4.3.bb =3D> libtsm_4.5.0.bb}                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/libtsm/{libtsm_4.4.3.bb =3D> libtsm_4.5.=
0.bb} (95%)

diff --git a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb b/meta-oe/re=
cipes-graphics/libtsm/libtsm_4.5.0.bb
similarity index 95%
rename from meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
rename to meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
index 8168360dec..9e999fe970 100644
--- a/meta-oe/recipes-graphics/libtsm/libtsm_4.4.3.bb
+++ b/meta-oe/recipes-graphics/libtsm/libtsm_4.5.0.bb
@@ -22,7 +22,7 @@ LIC_FILES_CHKSUM =3D "\
 DEPENDS =3D "xkeyboard-config"
=20
 SRC_URI =3D "git://github.com/kmscon/libtsm;protocol=3Dhttps;branch=3Dma=
in;tag=3Dv${PV}"
-SRCREV =3D "6cdacfc452bf29d98e297fe3a96e55e94a88ce3e"
+SRCREV =3D "556373437d1c5f57f4dfc7c6cc1330e5088a4174"
=20
 inherit meson pkgconfig
=20
--=20
2.54.0


