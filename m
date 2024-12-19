Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0ACE7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:29:15 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web10.138175.1734640142927868016
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:29:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=rUQc6Mrd;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202412192029008222437bd7e39f3706-rkm5p5@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202412192029008222437bd7e39f3706
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:29:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=kjCysLd5go4DSZo5G/gE1KWqsvuNtE+rvEqbnOv1R5Q=;
 b=rUQc6MrdrGSVWJjoiNBm8RUX2pdZXpLU4CU+zLe2JG+Wz0vh8VrY+L0sJET9YsnfYwrJJf
 9xPIOWsJqbdKLFehRAdES6qi55eh1+AI7vfV4O5eLlYQ7gkT87iqzU0XClRgLg3RJzBZnu9x
 MINgPbq7B9mp1Jn+zHpZvt6cT0Gomgr38FTdhHgwOOEu9kSS2EVqGuftcRASDv/922MVae6S
 OXiWNkYGbgfqVKihpTggONGL1HAY4EeaskkRQTE8lZLIuJBQUbwzSYEW/zL/eQgsWgHHsBLI
 yfHaM5GZ3xDdTAkcG5GwFGGf7WrGrPwHvwStR3j2ujSsSmxH7KkfIC/Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 07/12] redis: ignore CVE-2022-0543
Date: Thu, 19 Dec 2024 21:27:33 +0100
Message-Id: <20241219202738.346121-8-peter.marko@siemens.com>
In-Reply-To: <20241219202738.346121-1-peter.marko@siemens.com>
References: <20241219202738.346121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:29:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114408

From: Peter Marko <peter.marko@siemens.com>

This is Debian-specific CVE.
NVD tracks this CVE as version-less.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-extended/redis/redis_7.2.6.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-oe/recipes-extended/redis/redis_7.2.6.bb b/meta-oe/recipes-extended/redis/redis_7.2.6.bb
index dcfd532cff..b52381c7aa 100644
--- a/meta-oe/recipes-extended/redis/redis_7.2.6.bb
+++ b/meta-oe/recipes-extended/redis/redis_7.2.6.bb
@@ -71,3 +71,4 @@ INITSCRIPT_PARAMS = "defaults 87"
 SYSTEMD_SERVICE:${PN} = "redis.service"
 
 CVE_STATUS[CVE-2022-3734] = "not-applicable-platform: CVE only applies for Windows."
+CVE_STATUS[CVE-2022-0543] = "not-applicable-platform: Debian-specific CVE"
-- 
2.30.2


