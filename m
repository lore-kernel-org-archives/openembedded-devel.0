Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33EF8C36002
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 20:27:05 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.web10.4985.1742502423978998239
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 20 Mar 2025 13:27:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=F3B2Xja+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20250320202701424addd6eb1d7e4217-jaj1qk@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250320202701424addd6eb1d7e4217
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 20 Mar 2025 21:27:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NbGDMhRs+fTTnUWZjk74bYFrgIXC8VvXhMlAqZHie5g=;
 b=F3B2Xja+BfITzrKe1FupgZnIpjokQD61w6EOdfkkd8Bwqbld1ebUOXxSQW6kiwA6rgnP4T
 izOYW6sElKZxiu2ax58fbtOs0U61sqeU0aU6hAH3IR2se8Ox7pDopqRptKvpGxgtc2wlXb1E
 i+ZkyNmoWvQE6yBLf2FENXbjxXiCEqmUrIyyHs5ihpdGOGz6Z4rXKZoW1hpNCUbekGNLKmJE
 T+LcP7JZzXvUivlbcwSUL5rVkfMTkkzA0nPxY9wCqMFFfmnjWgwxGqT+r8Kk6G2jDkYRDvkU
 NbfduL1xcem5hBDkqYBPLbMyym4QLqxwZxyjSUjYzlVpKn4/8wH8i7hw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-something][PATCH 2/3] freerdp: mark CVE-2024-32662 as fixed
Date: Thu, 20 Mar 2025 21:26:05 +0100
Message-Id: <20250320202606.1679616-2-peter.marko@siemens.com>
In-Reply-To: <20250320202606.1679616-1-peter.marko@siemens.com>
References: <20250320202606.1679616-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 20 Mar 2025 20:27:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116143

From: Peter Marko <peter.marko@siemens.com>

2.x is not affected, bug was introduced in 3.0.0.
See e.g. https://security-tracker.debian.org/tracker/CVE-2024-32662

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
index 870c3ffe2f..5cc847134b 100644
--- a/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
+++ b/meta-oe/recipes-support/freerdp/freerdp_2.11.7.bb
@@ -93,3 +93,5 @@ python populate_packages:prepend () {
         description='FreeRDP plugin %s',
         prepend=True, extra_depends='')
 }
+
+CVE_STATUS[CVE-2024-32662] = "fixed-version: 2.x is not affected, bug was introduced in 3.0.0"

