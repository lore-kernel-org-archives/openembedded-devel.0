Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ACEACD8C9D
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 20:56:26 +0000 (UTC)
Received: from mailout02.t-online.de (mailout02.t-online.de [194.25.134.17])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.56621.1781211382049324232
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jun 2026 13:56:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Vz3aQucT;
 spf=pass (domain: t-online.de, ip: 194.25.134.17, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout02.t-online.de (Postfix) with SMTP id EDF62E86A
	for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 22:56:19 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.168.237]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wXmRm-4WmaED0; Thu, 11 Jun 2026 22:56:18 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH 1/2] cairomm: fix LIC_FILES_CHECKSUM
Date: Thu, 11 Jun 2026 22:56:06 +0200
Message-ID: <20260611205607.2081431-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781211378-C6FFA9CC-97AE716D/0/0 CLEAN NORMAL
X-TOI-MSGID: 49aa7a03-0be2-4203-969a-1b01d5a5237d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781211379; i=f_l_k@t-online.de;
	bh=10c27mSFASUM0uo8LIwFnxw9fFMoQBmUt6x2Ij8xurc=;
	h=From:To:Subject:Date;
	b=Vz3aQucTDlN1tkd5FNxbkishYUGmRtFS3DnKZaCHTnK40t3jkIpN4xoxl70wm4sUX
	 d1U35UkKgGXN8oVXEUe6RVSpZbBDR3MvCvCbuHFAhX8wadksYitSoOQFj3wmRCFX7O
	 jwoIBy0h0kjshPOIdp8iA+SdtD2HMuaAj3jJ0iauxOTNnJpQmwX4saolHmZQRJKwNc
	 1TyEYQSLDm5wGXyOVUJfpK8s5uWM2Qw1ebO1xFo0sM2ybVKmmd7FQHbPCivmWJoauC
	 YP/wGdMBAqv3Rp/anSUsNmTRTmNUXWkY0+F/h8NLRtCvqz7S6G9XXOCyL6Tutotztm
	 1VdWhgV+p7OQA==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jun 2026 20:56:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127534

License changed from LGPL-2.0 to LGPL-2.1

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb b/meta-oe/r=
ecipes-graphics/cairo/cairomm_1.14.6.bb
index a076c217f5..b5e337e9b5 100644
--- a/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
+++ b/meta-oe/recipes-graphics/cairo/cairomm_1.14.6.bb
@@ -1,7 +1,7 @@
 SUMMARY =3D "C++ bindings for Cairo graphics library"
=20
-LICENSE =3D "LGPL-2.0-only"
-LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Dc46bda00ffbb0ba1dac22f8d087f5=
4d9"
+LICENSE =3D "LGPL-2.1-only"
+LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21"
=20
 inherit gnomebase
=20
--=20
2.54.0


