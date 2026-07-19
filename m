Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C336AC4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 19:36:00 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1961.1784489753757423528
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 12:35:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=DktSLjmP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202607191935510454a2cb3d000207a7-gl7cky@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202607191935510454a2cb3d000207a7
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jul 2026 21:35:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=WyuZk+wOzbVUvI6AS84JVl07bXzlUvKN3n4iEBs9pI0=;
 b=DktSLjmPHWaDDTilWdaRpbMy9g8FjTCg8yIjJqAR/RzEMJ2Ne24SluwPj0Sjs1qjDuZwet
 PwFo/z7hybj+cElVUe9SusHkPg6GTCGdUrNPUeqL4Y/Z3Of0qBsck/aj9/4rooTMVGRGvDIY
 3CZY8soyu8QuonUkVW07FE49CkQXaopkz3pnCw1+4v2z5dsjtrYPeM+CJ2gmJ8d3P6jjjWHF
 1OjLyuogRJsD/Sedtkr2D99v+dQfPCYeB/d0QHWbhOxhtBJUxxO0g6nV2IQL0ExNkrTtYJW3
 yBzxjvv7RBf4LzAWq5V5kAC8+9q8pp0wUjsNQWZKAnwq7bxIukXPoCEQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][wrynose][PATCH] 7zip: set status for CVE-2026-58052
Date: Sun, 19 Jul 2026 21:35:33 +0200
Message-ID: <20260719193533.440493-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 19:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128263

From: Peter Marko <peter.marko@siemens.com>

Per Debian team investogations, this can only occur on Windows.
See main CVE page [1] which links to detailed explanation [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-58052
[2] https://lists.debian.org/debian-lts/2026/07/msg00038.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/7zip/7zip_26.00.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-extended/7zip/7zip_26.00.bb b/meta-oe/recipes-extended/7zip/7zip_26.00.bb
index 85219b5052..0f1e741625 100644
--- a/meta-oe/recipes-extended/7zip/7zip_26.00.bb
+++ b/meta-oe/recipes-extended/7zip/7zip_26.00.bb
@@ -69,3 +69,5 @@ RPROVIDES:${PN} += "lib7z.so()(64bit) 7z lib7z.so p7zip"
 RPROVIDES:${PN}-dev += "lib7z.so()(64bit) 7z lib7z.so"
 
 BBCLASSEXTEND = "native nativesdk"
+
+CVE_STATUS[CVE-2026-58052] = "not-applicable-platform: Issue only applies on Windows"

