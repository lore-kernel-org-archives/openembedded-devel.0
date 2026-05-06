Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9074CCD343B
	for <webhook@archiver.kernel.org>; Wed,  6 May 2026 16:07:40 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.22510.1778083653408444861
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 May 2026 09:07:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@semalibre.com header.s=dkim header.b=dtY4A2l4;
 spf=pass (domain: semalibre.com, ip: 185.171.202.116, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E270AC5DC4C;
	Wed,  6 May 2026 16:08:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8C3B16053C;
	Wed,  6 May 2026 16:07:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3AC18102F279D;
	Wed,  6 May 2026 18:07:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1778083650;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=6WOSR7Ao/lBcPbDeHiW89OlrmDsQiEGAC+jnNdtTX2s=;
	b=dtY4A2l4ignPJ/9y/OLL7MWhPCPgSd1teLDzMEV2lOGaaHspmUHHQuplTDQQw3USLwRDJC
	dq2kUQhm7+F7/wdgi7ZFw7WTOWF4TQtahjGLSFkZJDDbytmBzZDVeWFXWqk3jWmGn5m34o
	5/Rv+IaCXpRJwuiT8/n93gsp8Z92oZ1qTulujWPBZ4otZuRe6GvQKHP94Ky1s3dWH8M22y
	9VOJZgmki4Ja/wayij4/nAm+JZZB8UbT12FPTWBrHmEHBcutkuFIY0AmsMSsMaGDHsP/hI
	LD5NaSscvLD3DIN7drKnlFgOuwtwghNVPJBmndFqQ+jtIRyoo5f1m+fFbou7/Q==
From: Louis Rannou <louis.rannou@semalibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>,
	pascal.eberhard@se.com
Subject: [meta-networking][PATCH] openvpn: change bash rdepends to rrecommends
Date: Wed,  6 May 2026 18:07:04 +0200
Message-ID: <20260506-bash-rr-v1-1-507ee57b7fe7@non.se.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778080886; l=1153; i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id; bh=pPiegtL6S/ONbMbw5rcVVPD9ZYjW1UVXSS5ZhNa8i1Y=; b=7C7iD+JElyUbdDVf+t6PWwM/f0W+Rl6It5j/vGA6/fNzEasr0ubktaMGJbusYcZ/5Iyxn5F1u 90hWmq7gKnqDQ8X3NRJ6WG8Vub6E7g7qfmREkItWR3dTFb8aZd5Qn1a
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519; pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 May 2026 16:07:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126806

From: Louis Rannou <louis.rannou@non.se.com>

The dependency to bash is only required for dns-updown scripts. As bash i=
s
under the GPLv3 license, it might be preferred to exclude it.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb b/m=
eta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
index 0cbe4641cd..d967a0dc12 100644
--- a/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
+++ b/meta-networking/recipes-support/openvpn/openvpn_2.7.0.bb
@@ -47,7 +47,7 @@ PACKAGECONFIG[iproute2] =3D "--enable-iproute2,,iproute=
2,iproute2-ip"
 PACKAGECONFIG[systemd] =3D "--enable-systemd,--disable-systemd,systemd"
 PACKAGECONFIG[selinux] =3D "--enable-selinux,--disable-selinux,libselinu=
x"
=20
-RDEPENDS:${PN}:append =3D " bash"
+RRECOMMENDS:${PN}:append =3D " bash"
 RDEPENDS:${PN}-ptest:append =3D " bash"
=20
 do_install:append() {

---
base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
change-id: 20260506-bash-rr-5fd0820519e4

Best regards,
--=20
Louis Rannou <louis.rannou@non.se.com>

