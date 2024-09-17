Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA08ACAC5AE
	for <webhook@archiver.kernel.org>; Tue, 17 Sep 2024 22:32:03 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.web11.2827.1726612314138593312
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 17 Sep 2024 15:31:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=NT10q3+m;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-20240917223150737b36d3925804747a-dlvzae@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 20240917223150737b36d3925804747a
        for <openembedded-devel@lists.openembedded.org>;
        Wed, 18 Sep 2024 00:31:51 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=OGOBgKANEeh5MIa8Xa0MLdLbxX7RTdRsLcUGK9wVihk=;
 b=NT10q3+mH4KhlgySHtBcW4sO8VFmv1rGX2szbHfXnLU+G/X4aQI5bY/RTZGcCcBRzzX1DN
 8hZbLwt3kRMHi2774gdu0rqqbMCxU/NXrZM8E04WAvb2fvp5dX2pZ80GmJBNnSKC27FXpo7g
 AxD7F0o5tjAed5UuIyXJH/BjKBvv7OeiZMiciSraXECGANlVGjM/8uokrMKv6Ale4x7LYnlP
 BQncrTxBuNoABtzHDuk9/OET7u5Kxm0tXCroB9RVSBmdodnqwqlKkDFc8ZkLzcKWzwXljmJn
 onBCErPpNo7TICOW8xRTXCXOlatP48f4ZXfeMpzSNv4wMQbvLPJATQ2g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH 1/2] nginx: Upgrade stable 1.26.0 -> 1.26.2
Date: Wed, 18 Sep 2024 00:30:58 +0200
Message-Id: <20240917223059.1570530-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 17 Sep 2024 22:32:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112353

From: Peter Marko <peter.marko@siemens.com>

Solves:
* CVE-2024-7347
* CVE-2024-31079
* CVE-2024-32760
* CVE-2024-34161
* CVE-2024-35200

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-httpd/nginx/{nginx_1.26.0.bb => nginx_1.26.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.26.0.bb => nginx_1.26.2.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.2.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.26.2.bb
index 0ce940d429..a279a3cf9b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.2.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
-SRC_URI[sha256sum] = "d2e6c8439d6c6db5015d8eaab2470ab52aef85a7bf363182879977e084370497"
+SRC_URI[sha256sum] = "627fe086209bba80a2853a0add9d958d7ebbdffa1a8467a5784c9a6b4f03d738"
 
-- 
2.30.2


