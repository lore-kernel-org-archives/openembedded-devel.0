Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802FEE77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 12:45:23 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.32652.1735044319222209266
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 04:45:19 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=g1DR1ZrP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20241224124516e5e97a6aa392be36df-enqcef@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20241224124516e5e97a6aa392be36df
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Dec 2024 13:45:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=OKdaboZj+aXRQ3EfGn96WNAbL5XmV+voFz9eN0BqPZo=;
 b=g1DR1ZrPA1IKwG5EoLrFxOdT7jdNrb/S/9oSOo4X6nSYIKDhO2t/WVyo9QRlomYmQNsFET
 PZXTWC5DUP6P9KrmbEpNXStgPqmTQdmnWUGOM+GaQra6xKOSaNkBcHxG62Ie56VKjBKzn2Zt
 /1Dc/HV0j7iJLTOH6KIzaMHIa40W+XDZSrM281UCMZMb704JWLt5dPIFMtytcOKbV6JvduzF
 PWnczXNZpBkmPmG0D78oHuEWIfn1t6zN1q1/b2WlBr0gUR9YXh02ndXzfE0vsD2z0fBuJoba
 gWGjb1Sqq/ehT9ooGeTLsJlX0mtfDytZBTA608vTVWChkDfWLBvHFO/w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH 1/6] apache2: ignore CVE-1999-1237
Date: Tue, 24 Dec 2024 13:44:12 +0100
Message-Id: <20241224124417.2547005-2-peter.marko@siemens.com>
In-Reply-To: <20241224124417.2547005-1-peter.marko@siemens.com>
References: <20241224124417.2547005-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 12:45:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114542

From: Peter Marko <peter.marko@siemens.com>

This vulnerability is for Apache-AuthenSmb module.
Fixed in 0.9, current version is 0.72.
In any case, not part of Apache2 sources.

[1] points to [2], which is archived under [3]

[1] https://nvd.nist.gov/vuln/detail/CVE-1999-1237
[2] http://www.securityfocus.com/archive/1/14384
[3] https://web.archive.org/web/20020618143426/http://online.securityfocus.com/archive/1/14384

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
index bba00fb95c..4db672c9ab 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.62.bb
@@ -39,6 +39,7 @@ CVE_PRODUCT = "apache:http_server"
 
 CVE_STATUS[CVE-1999-0289] = "not-applicable-platform: The current version is not affected. It only applies for Windows"
 CVE_STATUS[CVE-1999-0678] = "not-applicable-platform: this CVE is for Debian packaging configuration"
+CVE_STATUS[CVE-1999-1237] = "cpe-incorrect: This is vulnerability of Apache AuthenSmb module, fixed in 0.9"
 CVE_STATUS[CVE-1999-1412] = "not-applicable-platform: this CVE is for MAC OS X specific problem"
 CVE_STATUS[CVE-2007-0086] = "disputed: this CVE is officially disputed by Redhat"
 CVE_STATUS[CVE-2007-0450] = "not-applicable-platform: The current version is not affected. It only applies for Windows."
-- 
2.30.2


