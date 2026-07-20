Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A878C4452D
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 19:27:52 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5598.1784575662284884129
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 12:27:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=RTVZ71yk;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20260720192739e1d5af260600020707-kqwhqr@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20260720192739e1d5af260600020707
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 21:27:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=VZOGQuL1mBqYHIUglMt9SWnNGpIaaW02b48xjOQX2vM=;
 b=RTVZ71yklf5qG8E95ved75TXNMxfY54WtT662mNKA+Bv7Y+PRqUnudnPgVAHld1KTpnjPC
 x2JpAihZFFWvMH+AZUDQysQW8VDP06XrTk5ZsZ4L6q7UHK7IkqDoCtA37XYUVAO8XuzE/xaN
 S7Mi2nAT/dqmUbCKnGHHJ8m6wHtdOj0oUxlTOS0vem3dfDQaeL4PL5T0YIPz7l1zZogV/1Jb
 a4B2ZH3hpm3/vFuq+bEkkrLuVRbXq05JrWo6lvYSTbUH0QKkJejKBx0WL6xX0PJdCIpPDfvV
 zneoZhotBUhOpWk3DZU3uNEvHSKJWmH013DNTPr+HsrDlxBevLF2zg6w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/6] grpc: set status for CVE-2023-33953 and CVE-2024-37168
Date: Mon, 20 Jul 2026 21:27:27 +0200
Message-ID: <20260720192732.28245-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 19:27:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128288

From: Peter Marko <peter.marko@siemens.com>

CVE-2023-33953 is fixed since 1.56.2 per [1].
FKIE sets "defaultStatus": "unknown" so it needs to be set explicitly.

CVE-2024-37168 description in [2] says grpc-js.
Even if (like FKIE added) grpc core would be affected, it would be in
old versions (also listed in [2]).

[1] https://nvd.nist.gov/vuln/detail/CVE-2023-33953
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-37168

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb b/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
index 14ead4ccf9..2213331a3e 100644
--- a/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
+++ b/meta-oe/recipes-devtools/grpc/grpc_1.80.0.bb
@@ -66,3 +66,6 @@ FILES:${PN}-compiler += " \
     ${bindir} \
     ${libdir}/libgrpc_plugin_support${SOLIBS} \
     "
+
+CVE_STATUS[CVE-2023-33953] = "fixed-version: Fixed since 1.56.2"
+CVE_STATUS[CVE-2024-37168] = "cpe-incorrect: This CVE is for grps-js"

