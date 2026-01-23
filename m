Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF243D7236E
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 10:28:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.64471.1769163951486955222
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 02:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bootlin.com header.s=dkim header.b=gdBa8KPj;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: joaomarcos.costa@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 92D201A2B25
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 10:25:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 69EEF60760
	for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 10:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6FF42119A87A6;
	Fri, 23 Jan 2026 11:25:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769163948; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FoLET5qLp4kzDFkArZd5PFynOCWO4cHZLKRKGnf/p3o=;
	b=gdBa8KPj2vrsLN2Re4WVuii3sFOvVNdhh1e16BR1FDMjDDOPV4KcD7KjsFYIv3ffm6VJuN
	aE3tskjOIIDWl4pBM171difF6cHUZT2w9pTq9zwziaWQ1MXtZpNKK53zirDHqQEGVgwGxu
	0nR/i+fqqJZRO+DRifTibdo2USW5tBHgRvsU87c8gJcIUOuigKIID6zvBAZFfQPamOhuLv
	EeIBk7vFP2M6mCSSAVyDxDktrukX7XSNF037h6f9X1onRERRf2+3pfMIopbqBcsrN96S4u
	04JMTD8g6kRvWViFB2bP5AwQBNh0rfvd8cl2VovG1wHqf/w4GKqd121WHbjgJw==
From: "Joao Marcos Costa" <joaomarcos.costa@bootlin.com>
To: openembedded-devel@lists.openembedded.org
Cc: thomas.petazzoni@bootlin.com,
	=?UTF-8?q?Jo=C3=A3o=20Marcos=20Costa?= <joaomarcos.costa@bootlin.com>
Subject: [meta-oe][scarthgap][PATCH] linuxptp: add missing prefix to CVE ID
Date: Fri, 23 Jan 2026 11:25:30 +0100
Message-ID: <20260123102530.906390-1-joaomarcos.costa@bootlin.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 10:28:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123780

The ID should be in the CVE-YYYY-NNNNN format, as in the other
CVE_STATUS[] settings.

Add 'CVE-' to avoid potential parsing errors in tools that provide CVE
scaning/analysis.

Signed-off-by: Jo=C3=A3o Marcos Costa <joaomarcos.costa@bootlin.com>
---
 meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb b/meta=
-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
index d7d90bba25..56f8551c05 100644
--- a/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
+++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp_4.1.bb
@@ -61,4 +61,4 @@ PACKAGES =3D+ "${PN}-configs"
=20
 FILES:${PN}-configs +=3D "${docdir}"
=20
-CVE_STATUS[2024-42861] =3D "disputed: Considered to be bogus by upstream=
 and major distros"
+CVE_STATUS[CVE-2024-42861] =3D "disputed: Considered to be bogus by upst=
ream and major distros"
--=20
2.47.0


