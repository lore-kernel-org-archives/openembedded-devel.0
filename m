Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA13C44512
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 20:18:10 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2734.1784492287134296947
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 13:18:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=IjmfVW1u;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20260719201803f1f19ed69200020744-gqrsm5@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20260719201803f1f19ed69200020744
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jul 2026 22:18:04 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=YYgpb4nyN1otMX7xO31GfkPWNpZ9tBvMLmaqA9lqq9E=;
 b=IjmfVW1uhYUGtQ001rw1mk39Nnt+4Y3xcdizVBZ5vIaamRAauqEdAfe0hq3Hq6xgqxEJvn
 PI8Kgjo+YL1788/EYIYb2QPg8c9teqm0LzJLtzdITRdfh53+eXQEJyyY8nTxo/PzIqVPfpWd
 U4BXpGdEpNCCmn+asebIH8M50/4GFO5t0b42FXpn4DyTecArvF0jzip0bdZad9IvXWZIzKM1
 kcnTuekwKYgbgBngGNDRQC8bxjscEc5ko1PsjtO+nSv4bTHkSB9rEJcCvqukisp4UllGyJN7
 8z3Buu0mNu40yvtztTg6pS53IBDRqz1Y81sL0Mnp5vETWUvhDWlt1cEA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] c-ares: set status for CVE-2025-31498
Date: Sun, 19 Jul 2026 22:16:42 +0200
Message-ID: <20260719201642.445965-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 20:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128266

From: Peter Marko <peter.marko@siemens.com>

This CVE was fixed in 1.34.5 as mentioned in release notes [1].

[1] https://github.com/c-ares/c-ares/releases/tag/v1.34.5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
index df994c83ae..058f3666e7 100644
--- a/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
+++ b/meta-oe/recipes-support/c-ares/c-ares_1.34.8.bb
@@ -28,3 +28,5 @@ PACKAGE_BEFORE_PN = "${PN}-utils"
 FILES:${PN}-utils = "${bindir}"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2025-31498] = "fixed-version: Fixed since 1.34.5"

