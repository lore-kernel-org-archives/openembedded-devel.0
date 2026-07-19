Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D1D7C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 19:50:51 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2183.1784490643972061277
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 12:50:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NNph6hM/;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-202607191950408115e4a2e70002072e-fapp3r@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 202607191950408115e4a2e70002072e
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jul 2026 21:50:40 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=cS30LdzB08lGkaaFXlq7Gzn/uftvqFNDgLT/kwdHekk=;
 b=NNph6hM/3uozUJOvmjDXi37DShjuOM3juU5j8juclS8oKF5QOD2cCxmHLi4EqTjVgZe53f
 bGgMrZH4YiCiXJgEDMsr4+MI0+eCWlSOd6FdDV8Oxc+9qOuefzfjyq9DNy/2riO5HEnLD8K4
 bQ3HEqv7qiztjM8EbkjP2PaOXUD6KvzQ4I4WQ5EoA2W8NtPj6k1U+3+OyB9IlYbC1VA0Upar
 Vs2BpWpi+3TziWDyZLze/IWkclk6cAkffqF46BdmTLcx2SAuYTBy8BhZ3pGzZAL6cwUreH13
 qTxGzQ2FQpF9mZlOupT999QCx8SPOmGdGqOmHk+FrFaoINOHP7p+CRaQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] bit7z: set status for CVE-2026-45380 and CVE-2026-45384
Date: Sun, 19 Jul 2026 21:50:19 +0200
Message-ID: <20260719195019.443445-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 19:50:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128264

From: Peter Marko <peter.marko@siemens.com>

These CVEs were fixed in 4.0.12 as seen in release notes [1].
Current CVE-CHECK still reports them as unfixed, correct it.

[1] https://github.com/rikyoz/bit7z/releases/tag/v4.0.12

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
index 31202d0ea2..1399130e11 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
@@ -82,3 +82,6 @@ ALLOW_EMPTY:${PN} = "1"
 RDEPENDS:${PN}-ptest += "libstdc++ 7zip"
 # test data contains various file types with different architectures
 INSANE_SKIP:${PN}-ptest += "arch"
+
+CVE_STATUS[CVE-2026-45380] = "fixed-version: Fixed since 4.0.12"
+CVE_STATUS[CVE-2026-45384] = "fixed-version: Fixed since 4.0.12"

