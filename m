Return-Path: <louis.rannou@semalibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2606ACD37AC
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 11:53:30 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.48023.1778500400990778817
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 11 May 2026 04:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@semalibre.com header.s=dkim header.b=F+EeveAP;
 spf=pass (domain: semalibre.com, ip: 185.246.84.56, mailfrom: louis.rannou@semalibre.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 8214E1A3507;
	Mon, 11 May 2026 11:53:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4DCF760646;
	Mon, 11 May 2026 11:53:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AE25F11AE8014;
	Mon, 11 May 2026 13:53:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=semalibre.com;
	s=dkim; t=1778500397;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=eNJhYtqc6nPY9Q8CXWRK3ZULy8n3qo+rxBgBEqdQ7js=;
	b=F+EeveAPGRQ1t109UIXhKB1DarAnvNrfglIIzDO1426EBrIXBi+P8ahzS6r4j6JwL/+FBS
	5g+HAMGVBA3AihmL+0irGCEVDly0HtMjgWlA8RrtQqwq7TZ3Fkjh0pT4NkkEUT0a78ELpD
	MhnNC4+Ipw/y9O5QDGaWaHaCYU2lNOciwJJqVzLCsEGWEQa83BHlnzNd1kxBuFoSCR6LDc
	RDJB3ZFYR9ACGiQIrVeXqXC2ugOH77T2GULO5f2d7uy5O3X2cZ13qwVMl6sgeWA+PJ/2QR
	HIi5amu/nGGG6YZsIHO5nfW6bI71s9j1dCJw7r/vTYbuyX27oasTc3chxoMFnA==
From: Louis Rannou <louis.rannou@semalibre.com>
To: openembedded-devel@lists.openembedded.org
Cc: Louis Rannou <louis.rannou@non.se.com>,
	pascal.eberhard@non.se.com
Subject: [meta-oe][PATCH] lvm2: move scripts to lvm2-scripts package
Date: Mon, 11 May 2026 13:52:47 +0200
Message-ID: <20260511-bash-lvm2-v1-1-96c2cf2c1dee@non.se.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778494322; l=1006; i=louis.rannou@non.se.com; s=20250630; h=from:subject:message-id; bh=AymERopy7jFIH/5As4+dQM1XIMRn23jXoL9JEm5h28k=; b=ViE13TziEMsWniIT67bfua1KNqcn+KNBCOwta8TEU9mamKVAATPhzK/QpH2hiISEUkdhW4Gsn eEywU605lTLDwIE1TyktnBzv8wcU6ntNPAA5rCOegB8J2XckN0GdVAh
X-Developer-Key: i=louis.rannou@non.se.com; a=ed25519; pk=WWYN5/DFKqyCKdv6oTYNuq0gROqwZVfNfw2OMI3tUlc=
Content-Type: text/plain; charset="utf-8"
X-Last-TLS-Session-Version: TLSv1.3
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 11 May 2026 11:53:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126848

From: Louis Rannou <louis.rannou@non.se.com>

Move bash scripts to the lvm2-scripts package and remove the dependency t=
o
bash.

Signed-off-by: Louis Rannou <louis.rannou@non.se.com>
---
 meta-oe/recipes-support/lvm2/lvm2.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/lvm2/lvm2.bb b/meta-oe/recipes-suppo=
rt/lvm2/lvm2.bb
index f569424e27..4bdf5f37fb 100644
--- a/meta-oe/recipes-support/lvm2/lvm2.bb
+++ b/meta-oe/recipes-support/lvm2/lvm2.bb
@@ -86,9 +86,11 @@ FILES:${PN}-scripts =3D " \
     ${sbindir}/fsadm \
     ${sbindir}/lvmconf \
     ${sbindir}/lvmdump \
+    ${sbindir}/lvm_import_vdo \
+    ${sbindir}/lvmpersist \
+    ${libexecdir}/lvresize_fs_helper \
 "
=20
-RDEPENDS:${PN} =3D "bash"
 RDEPENDS:${PN}:append:class-target =3D " libdevmapper"
 RDEPENDS:${PN}:append:class-nativesdk =3D " libdevmapper"
=20

---
base-commit: 420222862f5a6d95023b8f5f3b7e1808b2264ef9
change-id: 20260511-bash-lvm2-f4d3b50e9adf

Best regards,
--=20
Louis Rannou <louis.rannou@non.se.com>

