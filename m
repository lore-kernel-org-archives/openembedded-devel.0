Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25281.1795543560355951584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 10:06:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=ISzzsdqL;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261124180602a30d589a3b000207da-4ixewg@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261124180602a30d589a3b000207da
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Nov 2026 19:06:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=2TuL61xXHrzIEQHukh7qys0TSEqmtZLkeMkuFzvaHYU=;
 b=ISzzsdqLEmLKQyBcG9KKTO72ZgWVo+mpjOD4GbKn3vkMw/3SWxxjaj2UDO1UYuFe2oXwGc
 /Pm7YWo9OSY69n8A8WZt3uWkMeR0BwOJsp5BvImc9+IBPgKKbdlUOHzAKZORTn6YzFWA/Yck
 8ZaPMpPoP5Ww74yJ/2rl7/Dihmw4JthGPrwwta33tw1VTXKEKNsFuIp8BfFrZ+REGQk2ZjqQ
 2sM99IiRVZMmKR6LCHlxyjgYmaD1IXi9cb3hctCm2wQRPpIuYk3iUgv1TZe55CYIZJcz+JDW
 52aEK5t9WQTv0euLWgbbSMJXwo/IT+bEAWD9FhvuHC745MwzaJx62tyA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH 2/2] nginx: upgrade 1.30.7 -> 1.30.8
Date: Tue, 24 Nov 2026 19:05:43 +0100
Message-ID: <20261124180543.25925-2-peter.marko@siemens.com>
In-Reply-To: <20261124180543.25925-1-peter.marko@siemens.com>
References: <20261124180543.25925-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 18:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132958
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

2026-11-23 nginx-1.30.8 stable and nginx-1.31.10 mainline versions have
           been released, with a fix for excessive CPU usage
           vulnerability when using ssl_early_data (CVE-2026-132779).

Also add CVE_STATUS for fixed CVE, similar as for all other recent CVEs.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.7.bb => nginx_1.30.8.bb}   | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.7.bb => nginx_1.30.8.bb} (86%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.8.bb
similarity index 86%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.8.bb
index 93a1e00ed7..ef737edcf9 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.8.bb
@@ -2,7 +2,7 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "2565b5c837050e958f70fb0f73c48e2bca4542ad349fd356f46fb0c72610bc6e"
+SRC_URI[sha256sum] = "f867314ada32e717b949930859656c48a72dc6657aec598db58af2f98a40e1c1"
 
 inherit upstream-version-is-even
 
@@ -20,3 +20,4 @@ CVE_STATUS[CVE-2026-123633] = "fixed-version: Fixed since 1.30.7"
 CVE_STATUS[CVE-2026-123634] = "fixed-version: Fixed since 1.30.7"
 CVE_STATUS[CVE-2026-123640] = "fixed-version: Fixed since 1.30.7"
 CVE_STATUS[CVE-2026-125283] = "fixed-version: Fixed since 1.30.7"
+CVE_STATUS[CVE-2026-132779] = "fixed-version: Fixed since 1.30.8"
