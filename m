Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52F0CE7718B
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:50:06 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.138537.1734641396222594907
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:49:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=OktzdDej;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241219204953badbdedca8d9923b61-99imby@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241219204953badbdedca8d9923b61
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:49:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=vw2v2dUM10fC6Zi403QfkCg/8gzbd42Kblr7QHAGCK0=;
 b=OktzdDej4pU4d5nVDVc9GDEO7jUN7j1Fq/FygXNtnrHUGXr48IJUVBsyBcbR1QwEjvy4cv
 knR+xCcAMZXT4uUNoT3CJLGt+7Ii6X3i9Z5g9PI1N7LG4PNv0Qj1lmKn7GW8zyz2+Binpahs
 3PxyfA4fOIu3wIjZAgl50jO/vNH0YVKaJyjqrSX4jL+1Y2KBP5Q9hv+WPdYxrln/fKuKSF0F
 OWY+ZYL46doYHWvdVbFE3WOI1lfg5lVBKHjO6kUnnpuwVV/pW/43YfDTpYP907qsdocZAXNc
 xpB0qBMQtn/qWVFhGm2kFIfXWrAFctiLcS8TQ7ZWF2oiirDGGVpQKWsw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH v2 01/12] ace: ignore CVE-2009-1147
Date: Thu, 19 Dec 2024 21:48:50 +0100
Message-Id: <20241219204901.347009-2-peter.marko@siemens.com>
In-Reply-To: <20241219204901.347009-1-peter.marko@siemens.com>
References: <20241219204901.347009-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:50:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114417

From: Peter Marko <peter.marko@siemens.com>

This CVE is for vmware ace.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-connectivity/ace/ace_8.0.2.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
index 64a4e7575f..2f3121e5a6 100644
--- a/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
+++ b/meta-oe/recipes-connectivity/ace/ace_8.0.2.bb
@@ -16,6 +16,8 @@ SRC_URI[sha256sum] = "dba38a905858ec4a44c04b4bbaef42b891adf061e8c0bbdaa1dce2c04f
 UPSTREAM_CHECK_URI = "https://github.com/DOCGroup/ACE_TAO/releases"
 UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)"
 
+CVE_STATUS[CVE-2009-1147] = "cpe-incorrect: this CVE is for vmware ace"
+
 COMPATIBLE_HOST:libc-musl = "null"
 
 S = "${WORKDIR}/ACE_wrappers"
-- 
2.30.2


