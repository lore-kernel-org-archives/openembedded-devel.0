Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD4A0EB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 20:25:28 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.web10.6775.1689107124635859655
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jul 2023 13:25:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=AU2IyXK+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-664519-2023071120252202805e5da8a0371f4e-4deoro@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2023071120252202805e5da8a0371f4e
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 11 Jul 2023 22:25:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6S4TvnwPQFvgIjoI3VZf/gmyURIQjGeFCwac7LO/15E=;
 b=AU2IyXK+o5Rnd94NF6WSrb+949COXtF9uzSdjdRcnawXw02Fg7xtAvBsatiNlEjfIbKUhj
 o0TerMLlc788TadTeJiFQ5GcxpF+Vmd3lj4QYgyp4uIYwtS5YgT8cymwBheRzM6IWIbY8vgr
 3aosA0bb1UBIKAlioSvMMT5+R/FO8=;
From: "M. Haener" <michael.haener@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>
Subject: [meta-oe][PATCH 1/1] nginx: upgrade to 1.24.0 release
Date: Tue, 11 Jul 2023 22:24:34 +0200
Message-ID: <20230711202447.68336-2-michael.haener@siemens.com>
In-Reply-To: <20230711202447.68336-1-michael.haener@siemens.com>
References: <20230711202447.68336-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Jul 2023 20:25:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103733

From: Michael Haener <michael.haener@siemens.com>

Brings nginx to the current stable version.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
---
 .../recipes-httpd/nginx/{nginx_1.23.4.bb => nginx_1.24.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.23.4.bb => nginx_1.24.0.bb} (51%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.23.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
similarity index 51%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.23.4.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index 422b6f390..2e865e400 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.23.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -2,5 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
-SRC_URI[sha256sum] = "d43300e36bb249a7e6edc60bca1b0fc372a0bafce2f346d76acfb677a8790fc0"
+SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 
-- 
2.41.0


