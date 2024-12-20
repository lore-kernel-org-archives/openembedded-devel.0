Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A4BE7718C
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 15:38:03 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.154488.1734709081625973718
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Dec 2024 07:38:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Gs2VUUVV;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202412201537593671b7836008badad3-jxnjma@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202412201537593671b7836008badad3
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 20 Dec 2024 16:37:59 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=B8MfPY5x4uV1i9ksGCgB0c/29N0IzSwOjxhcmxRbIE0=;
 b=Gs2VUUVVxcff057WTpLIBHR3M9B2ovgaMeJMIOGtTyFFu7t/2I7W+52XPwFffR0z8GUafX
 r5EJuw14CGenKupc4lCsxGn8GjTGQ75L6qm/wi18pOdXFkqdVc6NHhacZgbtLylWWfm+55hE
 jCg6kjIZdSkGYWK1mr1lNV3FvZTxGpIYZMJsUxOx8xpUSlgp2NA+6kvUiDKs3mWjK15pYHUs
 txhm3NCVDUu9CY+E3UwWxSyZIwajPPcBQdnEX8n1PUJQQ48yte/OrdraLUBkZnJmCy9Sxu39
 e1myyik6LwomiAIEkBv/YfNO2yKFzCzmXCPsvGgnSuYV0kkTasLGIx7w==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 10/11] wireshark: upgrade 4.2.8 -> 4.2.9
Date: Fri, 20 Dec 2024 16:36:28 +0100
Message-Id: <20241220153629.2499631-11-peter.marko@siemens.com>
In-Reply-To: <20241220153629.2499631-1-peter.marko@siemens.com>
References: <20241220153629.2499631-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 20 Dec 2024 15:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114446

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2024-9781

Release notes:
https://www.wireshark.org/docs/relnotes/wireshark-4.2.7.html
https://www.wireshark.org/docs/relnotes/wireshark-4.2.8.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-support/wireshark/{wireshark_4.2.7.bb => wireshark_4.2.9.bb} (97%)

diff --git a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb b/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
similarity index 97%
rename from meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
rename to meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
index 0109fe6d2e..535dd21bf6 100644
--- a/meta-networking/recipes-support/wireshark/wireshark_4.2.7.bb
+++ b/meta-networking/recipes-support/wireshark/wireshark_4.2.9.bb
@@ -17,7 +17,7 @@ SRC_URI = "https://1.eu.dl.wireshark.org/src/wireshark-${PV}.tar.xz \
 
 UPSTREAM_CHECK_URI = "https://1.as.dl.wireshark.org/src"
 
-SRC_URI[sha256sum] = "2c5de08e19081bd666a2ce3f052c023274d06acaabc5d667a3c3051a9c618f86"
+SRC_URI[sha256sum] = "62c2b6652d7f9a50668867bd57b21609c9a9b6950f26e7f30a24b2de0e72ded3"
 
 PE = "1"
 
-- 
2.30.2


