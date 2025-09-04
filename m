Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1B07CA1012
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 22:12:41 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.web10.7350.1757023954336074302
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 15:12:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Hj4yZQAa;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20250904221230faa2c73791000207b7-4_wq8k@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20250904221230faa2c73791000207b7
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 05 Sep 2025 00:12:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RJHEMONRc+wV2lzLLmYkQ3p1a+/wN74GwNSSL7VRI4w=;
 b=Hj4yZQAaxGyojnxNPG4j3iYpjDxhFLDqTl5v+ukO7etvwEmK30Bq2tnk2lARVyAcrP3k8H
 Wy1VlOTZvVR4Yh4W+E/mr/ewub9k6XxQjqntKmz2Qiqm+QDq6ScLrWFfG13ia35mDj1zIhZy
 Btak6+1O3Gqtg3xAhUI4Oq/QPciNcIj8JswqFpJHfKt2b7KwfG9vZK3kOP/wf3sVNNO+oL4p
 QbGM/uTIjK5+T/roMZ39WcqWdhncw3A8dadbKPR8QDKPqNMPlaa2t2weT3ex9gaZNV+XB406
 wl6Fu/uSCsPTM8KRZFZs5OJvt7172Uoj5P/w5iAU4zyncMTUQxLFCMNg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 01/10] meta-oe-image-ptest: fix small typo
Date: Fri,  5 Sep 2025 00:11:30 +0200
Message-Id: <20250904221139.3131569-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 22:12:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119298

From: Peter Marko <peter.marko@siemens.com>

memroy -> memory

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-core/images/meta-oe-image-ptest.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/images/meta-oe-image-ptest.bb b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
index b32df0e221..6361562de4 100644
--- a/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
+++ b/meta-oe/recipes-core/images/meta-oe-image-ptest.bb
@@ -26,7 +26,7 @@ IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-poco = "1024288"
 
 # ptests need more memory than standard to avoid the OOM killer
 QB_MEM = "-m 1024"
-# If a particular ptest needs more memroy, it can be customized:
+# If a particular ptest needs more memory, it can be customized:
 #QB_MEM:virtclass-mcextend-<pn> = "-m 4096"
 
 TEST_SUITES = "ping ssh parselogs ptest"

