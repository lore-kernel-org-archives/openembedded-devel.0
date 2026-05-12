Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2069CD343F
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 16:37:34 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.79914.1778603851709672280
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 09:37:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=AwTO080m;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D63DA1655
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 09:37:25 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 850E53F836
	for <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 09:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778603851; bh=LIYKBdJ2AdGK2s8YTy2htgGFXs3qeQCYIlSGkgSqc8s=;
	h=From:To:Subject:Date:From;
	b=AwTO080mZiWQ66CyPGK9VbJ/W2W9rSZAhHNps4jC04xC8V51mu+6DqGS+p2OshKE2
	 DtyuDS6723rKCFyc4beIxf4Q7ZwKRHR0zhOn/H4ntvJONdhKQjvD9ofA4thHsGMqOU
	 Ua68q3NYHTnfDxcfc9DWyczWrCQcyFZ5MpgX4LqI=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH 1/3] iwd: depend on the regulatory database
Date: Tue, 12 May 2026 17:37:25 +0100
Message-ID: <20260512163727.3832144-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 12 May 2026 16:37:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126872

Doing wifi without the regulatory database is not good, so add a runtime
dependency to iwd to ensure that it gets pulled into the image for the
kernel drivers to use.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 meta-oe/recipes-connectivity/iwd/iwd_3.12.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb b/meta-oe/recip=
es-connectivity/iwd/iwd_3.12.bb
index a53137537e..073814d89d 100644
--- a/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
+++ b/meta-oe/recipes-connectivity/iwd/iwd_3.12.bb
@@ -59,4 +59,5 @@ RRECOMMENDS:${PN} =3D "\
     kernel-module-pkcs7-message \
     kernel-module-pkcs8-key-parser \
     kernel-module-x509-key-parser \
+    wireless-regdb-static \
 "
--=20
2.43.0


