Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E83A6C4450A
	for <webhook@archiver.kernel.org>; Sun, 19 Jul 2026 20:18:40 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2684.1784492313695535169
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Jul 2026 13:18:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=iC9kL9Cq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260719201831b8464b7abf000207f2-w3ea18@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260719201831b8464b7abf000207f2
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 19 Jul 2026 22:18:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=YYgpb4nyN1otMX7xO31GfkPWNpZ9tBvMLmaqA9lqq9E=;
 b=iC9kL9CqloypgIoRLbi9zzpHRa6RJyGPRr8ePCeHEwvKfZGj2MCWwlMmqLEaNAcZD5jIX6
 7qoUxHLBONc3J/tiD8PbGkU0OAo4G+/qogq68NItP/Is3RYSgpWXX6z09LX8qcUvLwpScCFY
 Ad0rl2KcxdfDjdZEfuhQV/sxefHdSVpQj1mr/7/reW1dwY2YRQIgUNP9hINbbnpzbByPAXO1
 Ygd9aW5/iPh7K+EhlCJcGJRV1d5VfVC0rJrIWNoBB6+cBhzF27UhH2CDiTuZbsHD7m7CgADl
 +bvCCvRTbVMA9RyA4evwrOi2GFekuhevXmNl4UmRzCGsAR52Xwt+5B6A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: peter.marko@siemens.com
Subject: [meta-oe][wrynose][PATCH 2/2] c-ares: set status for CVE-2025-31498
Date: Sun, 19 Jul 2026 22:18:24 +0200
Message-ID: <20260719201824.446043-2-peter.marko@siemens.com>
In-Reply-To: <20260719201824.446043-1-peter.marko@siemens.com>
References: <20260719201824.446043-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 19 Jul 2026 20:18:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128268

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

