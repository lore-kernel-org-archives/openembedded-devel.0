Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C626CD8CAA
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 15:07:38 +0000 (UTC)
Received: from mailout08.t-online.de (mailout08.t-online.de [194.25.134.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.82019.1781017656212408629
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 08:07:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=f_l_k@t-online.de header.s=20260216 header.b=Bp5tk0b5;
 spf=pass (domain: t-online.de, ip: 194.25.134.20, mailfrom: f_l_k@t-online.de)
Received: from fwd80.aul.t-online.de (fwd80.aul.t-online.de [10.223.144.106])
	by mailout08.t-online.de (Postfix) with SMTP id 180B8F5F4
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 17:07:34 +0200 (CEST)
Received: from fedora.fritz.box ([84.154.170.36]) by fwd80.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1wWy3B-2BD6zR0; Tue, 9 Jun 2026 17:07:33 +0200
From: Markus Volk <f_l_k@t-online.de>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][PATCH] gd: disable maybe-uninitialized error
Date: Tue,  9 Jun 2026 17:07:28 +0200
Message-ID: <20260609150728.160065-1-f_l_k@t-online.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-TOI-EXPURGATEID: 150726::1781017653-1EFFB485-DEAFB899/0/0 CLEAN NORMAL
X-TOI-MSGID: 85374ef1-d068-4e6c-9fb4-534ba32179cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=t-online.de;
	s=20260216; t=1781017654; i=f_l_k@t-online.de;
	bh=T76C0cevTkcgiMlq+fzAnTIt7nmUD1VAAbNEwrDH1kY=;
	h=From:To:Subject:Date;
	b=Bp5tk0b5nAxVI6GeA4aDn/KEW5UH8gHw0Ux0nHjev4vKoBL3k8ApNkWpju5KoiNZm
	 u6+2ZgFpQdk9ZfJ/jc0ZwSmCZJCrvUg9p4UlamHN0HMLSkgKlZhKeQutexSMMQk+W+
	 f/bOe2SzDoR9ANO/CUkeaZnogmyH8FcbNVS6mrBOvOCwgFSHDMoPKcDLHn4TohtFNy
	 RAVhJkZWfHAUtXvE91ZbWbRO8AD1VC3DYYY7qrzFcparCY3JhTZdnNZ9TVcF6uBQ/b
	 eFo1ZSNTkvq3KI+qYnZ6zKVpfagDbp8yJHOyavnWAkQQGOBPAsqtbd4C16DGLbaa9m
	 mOcitXe2pWxvw==
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 15:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127501

This fixes build with gcc16 until a suitable solution is found:
https://github.com/libgd/libgd/issues/990

Signed-off-by: Markus Volk <f_l_k@t-online.de>
---
 meta-oe/recipes-support/gd/gd_2.3.3.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/gd/gd_2.3.3.bb b/meta-oe/recipes-sup=
port/gd/gd_2.3.3.bb
index 062c4b4a8f..884a2b54ac 100644
--- a/meta-oe/recipes-support/gd/gd_2.3.3.bb
+++ b/meta-oe/recipes-support/gd/gd_2.3.3.bb
@@ -43,6 +43,8 @@ EXTRA_OECONF +=3D "--disable-rpath"
=20
 EXTRA_OEMAKE =3D 'LDFLAGS=3D"${LDFLAGS}"'
=20
+CFLAGS +=3D "-Wno-error=3Dmaybe-uninitialized"
+
 DEBUG_OPTIMIZATION:append =3D " -Wno-error=3Dmaybe-uninitialized"
=20
 do_install:append:class-target() {
--=20
2.54.0


