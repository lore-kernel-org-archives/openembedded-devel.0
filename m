Return-Path: <kory.maincent@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B7A1C5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 14:20:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.31334.1786976422238951471
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Aug 2026 07:20:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=C9k36lxT;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: kory.maincent@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F15221A16E1;
	Mon, 17 Aug 2026 14:20:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C5AE760352;
	Mon, 17 Aug 2026 14:20:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5E8011C72B4D;
	Mon, 17 Aug 2026 16:20:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786976419; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=SfTw7IEIZSDfD6p3MR75VgIx3ba1/8Ai9qnB2YKm91M=;
	b=C9k36lxTQ1+Ps3XUad2juaGdehvfkDVuCskFU9Nx331DlGyJ3M8Cr4pD5HDExZHR/rxUJl
	WARKrKgfcdS41AHMt9eSWVV9KFtFGLYJ9H2OmirlS0/eOGukeFfvfLUKiblHAf0gTW6LOi
	9Zt8AUL90LWbTm0jfZIkxtIQ2kYAO0RXpeFlMKwjRW8IRR45T1dfLqFrGVBIWhdq+27IDo
	cXnIZc6rA6oGvxGKXxKN1CyvIRqypL/8o9/FXJwBvBipArHk26brou+V9NmwOLUq6rksT2
	uAMp9I5eH+BibykQWIKNExarWblXejkeNvDXMNKM22A29ng1fHnBy1pHQ4MCVg==
From: Kory Maincent <kory.maincent@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	antonin.godard@bootlin.com,
	jeremie.dautheribes@bootlin.com,
	Khem Raj <khem.raj@oss.qualcomm.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Kory Maincent <kory.maincent@bootlin.com>
Subject: [oe][meta-oe][PATCH] libspdm: skip unsupported architectures instead of erroring
Date: Mon, 17 Aug 2026 16:20:05 +0200
Message-ID: <20260817142005.1005693-1-kory.maincent@bootlin.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 17 Aug 2026 14:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129194

Change bb.error to bb.parse.SkipRecipe so the recipe is skipped at parse
time for unsupported architectures, rather than raising a fatal error
that breaks parsing even when the recipe is not in use.

Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
---
 meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb b/meta-oe/r=
ecipes-support/libspdm/libspdm_3.8.2.bb
index 7d227d4148..f77057d9fd 100644
--- a/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
+++ b/meta-oe/recipes-support/libspdm/libspdm_3.8.2.bb
@@ -43,7 +43,7 @@ def get_spdm_multiarch(bb, d):
     if target_arch in multiarch_options :
         return multiarch_options[target_arch]
=20
-    bb.error("unsupported architecture '%s'" % target_arch)
+    raise bb.parse.SkipRecipe("unsupported architecture '%s'" % target_a=
rch)
=20
 EXTRA_OECMAKE +=3D "\
     -DARCH=3D${@get_spdm_multiarch(bb, d)} \
--=20
2.43.0


