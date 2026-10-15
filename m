Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA53CCA464
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 19:31:55 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5854.1792092706772472973
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 12:31:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=LCN1FRxU;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202610151931434cb5a2653d000207b8-ys2l8h@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202610151931434cb5a2653d000207b8
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 15 Oct 2026 21:31:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LP36jtnMA7bArpJZ/d3mcY+ZByaZ3iMG7yQ4KlfoW/E=;
 b=LCN1FRxU0hi59oIxWJrMetOWoI1qpWFRHVVajRb5IedmFbGszOskHufQXHS7kBkNwWUdai
 /D3vOeadphhyNAILdHRhMNrnHK4HPGwTaXrIiuR1GW2fsmtI4WJJvvoYxC8rHiunEtpSe5eM
 BrUXrugkI1SApuDF9QDCdYsDb4x8qOY+Q/9EhcnC5DbUIJ2UY3MKvyj7bNpT4oNbLYEqlhcf
 H+L4DgOsPH0I7vL2etmaSrB7rorgfUwtkbMf1ArEWP5GOURYeiY5vJ4hF6CH9pdUT8RtMzmu
 0dWL/N1yRfuj7kIe9eV8RBq68Ncy5QGaRbpUQjmnGBn9X7Phy6nDc4hg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH] nginx: upgrade 1.30.5 -> 1.30.6
Date: Thu, 15 Oct 2026 21:31:29 +0200
Message-ID: <20261015193129.3731630-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 19:31:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131009

From: Peter Marko <peter.marko@siemens.com>

2026-10-14 nginx-1.30.6 stable and nginx-1.31.7 mainline versions have
been released, with fixes for buffer overflow vulnerability when using
alias with rewrite (CVE-2026-15176), buffer overflow vulnerability when
evaluating string expressions with variables (CVE-2026-93479), request
body injection vulnerability in HTTP/3 (CVE-2026-95101), session forgery
vulnerability when using TLS session ticket key rotation
(CVE-2026-97629), and use-after-free vulnerability when using
ngx_http_ssi_module with AIO (CVE-2026-97205).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.5.bb => nginx_1.30.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.5.bb => nginx_1.30.6.bb} (81%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
similarity index 81%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
index 6b638cdd96..5d699e63ce 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
@@ -2,7 +2,7 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "6c20565aa2325cb82216ae804f4a4ff1875179014759a381c42ddc8e11c4906d"
+SRC_URI[sha256sum] = "3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8"
 
 inherit upstream-version-is-even
 

