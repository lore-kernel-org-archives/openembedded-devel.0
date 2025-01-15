Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CA23C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 18:13:25 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.28913.1736964800513611096
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jan 2025 10:13:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=lKA4xNbq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-202501151813130cee80962f1fc2e8cf-zjjln5@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202501151813130cee80962f1fc2e8cf
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 15 Jan 2025 19:13:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=NZYS05mp+ugmrLgXvHygWoyfJ5LP9pSclJUi9BIvRRA=;
 b=lKA4xNbqCx5dRf1jkyuhzTBqLa7Y1U2qJKcz2Y4RhoqwSUCEfkm38+J0T4riPZnrAYYJJ1
 BGAQjtWdYINY1+a2YH0Qddnjbu0y4zI9Je0L1rHhTTe81vglPAXOtwkQ9/TV0/qnwiQWL/Vh
 jqEqlg4jkfxE4WE75cT0CjGGAGxsOAGvWPAP9QDdAgYZYKiHof9ZxHf5lPHlDbEdlNr56cuB
 jMTMsbDU5JgzhxhBnU8YB7yR5nb0jGMReqQhoowSFeZFGNlhfTJjD844D4RyiLysL8aKa86p
 Ba+5E+y+Dc+bWZFccmX3UO0nP++k5c6MIN+uoQAJXp3iEeNr69oHme3w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-networking][PATCH 3/3] proftpd: define suffix for CVE version comparison
Date: Wed, 15 Jan 2025 19:12:01 +0100
Message-Id: <20250115181201.438102-4-peter.marko@siemens.com>
In-Reply-To: <20250115181201.438102-1-peter.marko@siemens.com>
References: <20250115181201.438102-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jan 2025 18:13:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114902

From: Peter Marko <peter.marko@siemens.com>

Similarly to old openssl versions, proftpd has patch releases with
characters instead of numbers.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb
index ece5e14109..def5ca623f 100644
--- a/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb
+++ b/meta-networking/recipes-daemons/proftpd/proftpd_1.3.8c.bb
@@ -23,6 +23,7 @@ inherit autotools-brokensep useradd update-rc.d systemd multilib_script
 
 # patch releases have character after version
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(\d+(\.\d+)+\w?))"
+CVE_VERSION_SUFFIX = "alphabetical"
 
 CVE_STATUS[CVE-2001-0027] = "fixed-version: version 1.2.0rc3 removed affected module"
 
-- 
2.30.2


