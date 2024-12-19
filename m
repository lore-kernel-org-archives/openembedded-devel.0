Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C54F2E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 20:29:25 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web10.138184.1734640158367521957
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Dec 2024 12:29:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ZwbikYfn;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241219202920b3dc21880eaf03d166-8sn6a_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241219202920b3dc21880eaf03d166
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Dec 2024 21:29:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eIRcIhOQXyt7HWnN9kEN0Sasr6gzdtwJ351HnmzuX5M=;
 b=ZwbikYfnCrFw8cqfNEZ7yWNP4y+ei4QjRH56YdxRfQHwuXNDk8mO21Igh4RFYm6ZlLoEUE
 MFiWY1b9qut8wTkgmNVF8DwGoP7oD7D0Q8rCqEURO/Dh6THrqTXvT4mmmTYfCvKO0CnWMwnK
 IkJKSQ3T2bjuY0cZ4uum/f7p2tTBpUzMpRJL9m7jtwOCVCxQOPWSI8ewCE6rRHtlJ9nuxIZf
 77EAYPxLdf7N4x82M5JJlkquucoBB8YgidtMXikLlokiJeIxB1ZILrtvdoCLV8MYwsiO7kbV
 +EbgK92mU1JhKjgkUATgAccEh0x6AW9/aAlEP6H8MFXcY2V9meg36SzQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 12/12] emlog: set CVE_PRODUCT
Date: Thu, 19 Dec 2024 21:27:38 +0100
Message-Id: <20241219202738.346121-13-peter.marko@siemens.com>
In-Reply-To: <20241219202738.346121-1-peter.marko@siemens.com>
References: <20241219202738.346121-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Dec 2024 20:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114413

From: Peter Marko <peter.marko@siemens.com>

This will remove false-positive CVE-2024-50655 from reports.
There are different emlog components from other vendors around.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-oe/recipes-core/emlog/emlog.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/emlog/emlog.inc b/meta-oe/recipes-core/emlog/emlog.inc
index 631e52f388..ec78a11086 100644
--- a/meta-oe/recipes-core/emlog/emlog.inc
+++ b/meta-oe/recipes-core/emlog/emlog.inc
@@ -8,6 +8,8 @@ SRCREV = "a9bbf324fde131ff4cf064e32674086c4ced4dca"
 PV = "0.70+git"
 S = "${WORKDIR}/git"
 
+CVE_PRODUCT = "nicupavel:emlog"
+
 EXTRA_OEMAKE += " \
     CFLAGS='${TARGET_CFLAGS}' \
 "
-- 
2.30.2


