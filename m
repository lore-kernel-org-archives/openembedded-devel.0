Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8E71E7C6F8
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 22:21:00 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18934.1769898051696938774
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 14:20:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PemT0Dzh;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202601312220493509f8453b00020715-_kksda@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202601312220493509f8453b00020715
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 31 Jan 2026 23:20:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=/ui34JF4gwrqgI1ROfY/4XrgYeW+/Mrwh9D9ImeZM8U=;
 b=PemT0DzhS05xzRrIKE9XTqgeyBV85P0rLnJdgd7m3Bu2yOL08X9lBigfj/NqN+RqC3QY6T
 mGmxmn08BvYMnJa+5TvNeE2aLcBiwYIsCA9g7PsLGif5eYPnAeUGO4GZ8Y45G88vv5ZJFqPS
 Kkmoob3gUv7AEuU5icQ1Cffj/Tlk1OEPF+S6wMMVOACHxgC/TvY2SsTFkVLCJyysm5jurctk
 I0y4RfzEDwm9b7kA9st+ITZ/TO9KFJSBqKV6A5KOcGDh7ItTB5rpMatwnvbtQAGoO7o2tdiH
 xfY7Q8VeiUSIYvat+LwZYrAxmc4IPodBNam8sbW8Oa84Iygd6kccH6dA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-python][whinlatter][PATCH] python3-protobuf: upgrade 6.33.2 -> 6.33.5
Date: Sat, 31 Jan 2026 23:20:46 +0100
Message-Id: <20260131222046.307246-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 22:21:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124028

From: Peter Marko <peter.marko@siemens.com>

Solves CVE-2026-0994.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../{python3-protobuf_6.33.2.bb => python3-protobuf_6.33.5.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-protobuf_6.33.2.bb => python3-protobuf_6.33.5.bb} (95%)

diff --git a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
similarity index 95%
rename from meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
rename to meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
index d0ef7753b0..af30165f81 100644
--- a/meta-python/recipes-devtools/python/python3-protobuf_6.33.2.bb
+++ b/meta-python/recipes-devtools/python/python3-protobuf_6.33.5.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = " \
 "
 
 inherit pypi setuptools3
-SRC_URI[sha256sum] = "56dc370c91fbb8ac85bc13582c9e373569668a290aa2e66a590c2a0d35ddb9e4"
+SRC_URI[sha256sum] = "6ddcac2a081f8b7b9642c09406bc6a4290128fce5f471cddd165960bb9119e5c"
 
 CVE_PRODUCT += "google:protobuf protobuf:protobuf google-protobuf protobuf-python"
 

