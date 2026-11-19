Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10263.1795076497365247330
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Nov 2026 00:21:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=NKREqlqE;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-2026111908213379c09de8c9000207ea-aztphe@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 2026111908213379c09de8c9000207ea
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 19 Nov 2026 09:21:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HZJoV41GxDsOmXeyOVVm0nAPI8j96efmL39XvfC7DX4=;
 b=NKREqlqE7q2z3ASb+SOq8yx0wfhQCUPR9mibcDZHTZAvuAWrAtWkba5/NphxZEtVuojuCm
 PfhJuLBEukAkogHsdgy4IOaFNpyzEf0wHouNYkw7+tjRzyAJiYbdpWmqurTrP7EylyXU+Ftq
 +bhNj34e7y+Soa7hpOpfxNXcGDBgcSC2MmLcvhkIYQX1WujpTSHY8FSnSjIrX+7/OF9CRMkF
 zXS2gbk0JJOp/dRN10DY5DvUfKeTeoounNrVpzuiCio5niaTiBmgduhiQp/r7QRJ4dMFQWoY
 AsHKg+L7mheDDxA16aClvOpD9GmXKONTLtAh1xe0VLVsnIzP4yoq8VRg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH] nginx: upgrade 1.30.6 -> 1.30.7
Date: Thu, 19 Nov 2026 09:21:17 +0100
Message-ID: <20261119082117.13064-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 19 Nov 2026 08:21:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132670
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

2026-11-18 nginx-1.30.7 stable and nginx-1.31.9 mainline versions have
been released, with vulnerability fixes for use-after-free in resolver
(CVE-2026-123634), memory corruption in HTTP/2 flow control
(CVE-2026-123007), use-after-free in HTTP/3 (CVE-2026-121810),
use-after-free in HTTP/2 (CVE-2026-123633), infinite loop while reading
client request body over TLS 1.3 (CVE-2026-118899), use-after-free in
mail proxy module (CVE-2026-113425), NULL pointer dereference when using
PROXY protocol version 2 (CVE-2026-120993), buffer overflow when using
alias with try_files (CVE-2026-125283), SNI bypass in client certificate
validation in stream module (CVE-2026-120967), and insufficient
validation in stream ssl_preread module (CVE-2026-123640).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.6.bb => nginx_1.30.7.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.6.bb => nginx_1.30.7.bb} (85%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb
similarity index 85%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb
index 73204da5588..9c2ec8cddbe 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.7.bb
@@ -2,7 +2,7 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9b8b6c8"
+SRC_URI[sha256sum] = "2565b5c837050e958f70fb0f73c48e2bca4542ad349fd356f46fb0c72610bc6e"
 
 inherit upstream-version-is-even
 
