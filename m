Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1BEC44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:28:12 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5610.1784575683689356840
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=SlmAflfL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-2026072019280186f5ed8b6c0002078e-mq5ynl@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 2026072019280186f5ed8b6c0002078e
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:28:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NOS2MO8qNky5JWKzytEVR3XzAJJA0lHVR8fxMnkWPg8=;
 b=SlmAflfLBJuNE2qJ1vgsy1jrtBmABG5igB7HaE10RPsdWpr/lQQ7TflrVuhFLn/J9B7wSm
 1ljqOvsYvaR4wzLtFoN1sf6kQ7j4dz4ux4Xn994NljXDbm385XOdorMFZ/LoPlOkoADZxD4f
 o57n+RQfkbNioGPtLpSnFb5FNZD5XLQcmgaxLrxqISsx6267sAZ9DMMdGtB9WjcJ1kSvJHWL
 /wIz3my0/kJUoCU8dGrjme95CGOmI5rveTq3D/Iol6AHZJgWVZ7Jlqfq+EPTGWj4k6FpBRgA
 HOmBg3ZRPxfjqqKRZmvRm2NbwzPQBs4wZ8l/m+0HLntGbBzA4vwevawg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 6/6] libcoap: set status for CVE-2023-51847
Date: Mon, 20 Jul 2026 21:27:32 +0200
Message-ID: <20260720192732.28245-6-peter.marko@siemens.com>
In-Reply-To: <20260720192732.28245-1-peter.marko@siemens.com>
References: <20260720192732.28245-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:28:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128293

From: Peter Marko <peter.marko@siemens.com>

Reuse investigation of Debian security group.
As mentioned by [1], this was never present in any release because it
was introduces in 4.3.5 development, however also fixed before release.

[1] https://security-tracker.debian.org/tracker/CVE-2023-51847

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
index 7ea3eba1b0..7252be8b1e 100644
--- a/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
+++ b/meta-networking/recipes-devtools/libcoap/libcoap_4.3.5b.bb
@@ -63,5 +63,6 @@ PACKAGE_BEFORE_PN += "\
 FILES:${PN}-bin = "${bindir}"
 FILES:${PN}-dev += "${datadir}/${BPN}/examples"
 
+CVE_STATUS[CVE-2023-51847] = "fixed-version: both introduced and fixed in 4.3.5"
 CVE_STATUS[CVE-2025-50518] = "disputed: happens only when library is used incorrectly"
 CVE_STATUS[CVE-2026-29013] = "fixed-version: fixed in 4.3.5b"

