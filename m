Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.25281.1795543560355951584
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 10:06:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=g6a9EGe+;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-20261124180557914252a61300020766-vy_zn_@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20261124180557914252a61300020766
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Nov 2026 19:05:57 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=3O/6hS3t7IEBhZab2CexqVdKxhGYIM7TB3NIXcNKaMM=;
 b=g6a9EGe+xyhzQGLnILsWrqibQleUDIuB5PhYPAeYEgCvyYR4H8HosKJPmnvSXgCcTuHsPZ
 sfSTaehUz2IKaRC51NMWnFwlpiMSE5R4LzYcOjNJj5ASSi7Z2EXSspQGfxK/05+tbEgDhjTb
 xUAoT3fAh6Y8rDZKn+82P0VfmU9jW+xFQ7T9UeBLuZj2/LTC7b/54OweG2oGIVpiNepK0OnB
 YT5E6b9wiNsHJwqiYFe8kQWm91o2N02TApNjv2HocfPrbfl44K3hPV+1UHdpagMWEV1hojag
 sZSCQyDRdpf45PG2snxHgwOtegymRLXs0x7v0i5Uq2ilNAH4EuPOQn2A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH 1/2] nginx: set status for CVEs fixed in 1.30.7
Date: Tue, 24 Nov 2026 19:05:42 +0100
Message-ID: <20261124180543.25925-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 24 Nov 2026 18:06:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132957
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

All these have CPE entries like "0.9.6 < *", which tries to say which is
the minimal verison affected.
This however marks the CVE as vulnerable, becuase it is in range (less
than *), entry like "1.30.0 < 1.30.7" cannot overrule that.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb
index 9c2ec8cddb..93a1e00ed7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb
@@ -13,3 +13,10 @@ CVE_STATUS[CVE-2026-97629] = "fixed-version: Fixed since 1.30.6"
 CVE_STATUS[CVE-2026-42055] = "fixed-version: Fixed since 1.30.3"
 CVE_STATUS[CVE-2026-48142] = "fixed-version: Fixed since 1.30.3"
 CVE_STATUS[CVE-2026-90439] = "fixed-version: Fixed since 1.30.5"
+CVE_STATUS[CVE-2026-113425] = "fixed-version: Fixed since 1.30.7"
+CVE_STATUS[CVE-2026-121810] = "fixed-version: Fixed since 1.30.7"
+CVE_STATUS[CVE-2026-123007] = "fixed-version: Fixed since 1.30.7"
+CVE_STATUS[CVE-2026-123633] = "fixed-version: Fixed since 1.30.7"
+CVE_STATUS[CVE-2026-123634] = "fixed-version: Fixed since 1.30.7"
+CVE_STATUS[CVE-2026-123640] = "fixed-version: Fixed since 1.30.7"
+CVE_STATUS[CVE-2026-125283] = "fixed-version: Fixed since 1.30.7"
