Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AFF8FB5E85
	for <webhook@archiver.kernel.org>; Mon, 16 Mar 2026 23:06:23 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64176.1773702382160265132
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Mar 2026 16:06:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=LSvwH/bY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20260316230619485f15d6bf0002070e-ttnwlf@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260316230619485f15d6bf0002070e
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 17 Mar 2026 00:06:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=42pKZoaZ9/UA77GBgeYwFj3XLMeO8wP8k4OdU6RzvyE=;
 b=LSvwH/bYPpJ88g7FjUR4tQVVyJYH+EEJ2mifj4KN2dWhJNtaOICRzrh92YiQSk1B04eajE
 pDUEUhQHlkhmRTY0RafnvQz6yx0fNCsUV0Q7FCU8IrHyI7ZyOh+mlwAFf25ouzX9y2ycCBHM
 4sq3KDdyZBmH3OpcbUikfJY5HQUjdVRiwb1XKUZRb6D3ibayfczSpyfI1CP6+iAzciBL62Tl
 Y+4cASpCMKcqbgIN+eMEihJFvGYfUS7W1+SQLRvnFr83bowJ9Xd3m2Y30ZPQ0A6kKyzy8yrI
 xzljW+sg1COIc62wEVP0covUhUvdJWN8MBi05BeUjTm4YNWuTTrdbTdA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 2/2] squid: upgrade 7.4 -> 7.5
Date: Tue, 17 Mar 2026 00:06:08 +0100
Message-Id: <20260316230608.944064-2-peter.marko@siemens.com>
In-Reply-To: <20260316230608.944064-1-peter.marko@siemens.com>
References: <20260316230608.944064-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Mar 2026 23:06:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125299

From: Peter Marko <peter.marko@siemens.com>

License-Update: updated to latest GPLv2 text version [1]

Changelog [2]
- Bug 5501: Squid may exit when ACLs decode an invalid URI
- ICP: Fix HttpRequest lifetime for ICP v3 queries
- ICP: Fix validation of packet sizes and URLs
- Do not escape malformed URI twice when sending ICP errors
- ... and some code, CI, and documentation cleanups

[1] https://github.com/squid-cache/squid/commit/765c7f4e7fa45ce87134b4a38ad175db4bda06dd
[2] https://github.com/squid-cache/squid/releases/tag/SQUID_7_5

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-daemons/squid/{squid_7.4.bb => squid_7.5.bb}      | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-daemons/squid/{squid_7.4.bb => squid_7.5.bb} (97%)

diff --git a/meta-networking/recipes-daemons/squid/squid_7.4.bb b/meta-networking/recipes-daemons/squid/squid_7.5.bb
similarity index 97%
rename from meta-networking/recipes-daemons/squid/squid_7.4.bb
rename to meta-networking/recipes-daemons/squid/squid_7.5.bb
index 3ba1895c45..3364c1f746 100644
--- a/meta-networking/recipes-daemons/squid/squid_7.4.bb
+++ b/meta-networking/recipes-daemons/squid/squid_7.5.bb
@@ -22,9 +22,9 @@ SRC_URI = "https://github.com/squid-cache/${BPN}/releases/download/SQUID_${PV_U}
            file://squid.nm \
            "
 
-SRC_URI[sha256sum] = "e31976edd755c295bd5842a349c9c7dad16a683d066337cc09033c1302b4fed4"
+SRC_URI[sha256sum] = "f6058907db0150d2f5d228482b5a9e5678920cf368ae0ccbcecceb2ff4c35106"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+LIC_FILES_CHKSUM = "file://COPYING;md5=570a9b3749dd0463a1778803b12a6dce \
                     file://errors/COPYRIGHT;md5=41d117978dbffedc893e8eeca12537d0 \
                     "
 

