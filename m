Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB4AC44511
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 16:35:43 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17409.1784219741964852080
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 09:35:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=VHV74WkP;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-202607161635397fbd700d1a00020776-jhc8ho@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 202607161635397fbd700d1a00020776
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 16 Jul 2026 18:35:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=wqfWXLcpBGC33ugYTAWULDNTGZP1jTjb8/7DjERsdCA=;
 b=VHV74WkPZnRrgNlsOu7ChCdYG5eBzWvmTtg7MSgzq43QTbJNqTTkZLfNVpF4g6umDmQjOs
 VU6KUhmFiVHzHOKb6rGf7dgYRg+GdWcfadaXa0HIPQV9pyX8HicZEHyKJrHCrT99UkPDkjWq
 MRYyVsTWDLF9M3KZzgHC5l2p7n0MaDzz7t76hmt32aw8tiMQf418AATGUoLs+nKpVPjJKmeH
 95ej/vxfqeMZEl34qh5UVBeocOdhEQmQOcn9nRv3tjvECtliPlG1EPUwxL8Pm+VKVULJXcG3
 DFJJkgjvBQVAbuZQ0y1h6oJD9rclE2Ly/hqIq7ZOYN2tDxCI5tNdFRsg==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH 2/2] nginx: upgrade 1.30.3 -> 1.30.4
Date: Thu, 16 Jul 2026 18:35:05 +0200
Message-ID: <20260716163505.801585-2-peter.marko@siemens.com>
In-Reply-To: <20260716163505.801585-1-peter.marko@siemens.com>
References: <20260716163505.801585-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 16:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128234

From: Peter Marko <peter.marko@siemens.com>

This resolves CVE-2026-42533, CVE-2026-60005 and CVE-2026-56434.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../recipes-httpd/nginx/{nginx_1.30.3.bb => nginx_1.30.4.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.30.3.bb => nginx_1.30.4.bb} (59%)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb
similarity index 59%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb
index 0c07560c4c..bef176949f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb
@@ -2,6 +2,6 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
-SRC_URI[sha256sum] = "e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f"
+SRC_URI[sha256sum] = "4261dc90e9e47c1c4041276e9aaa3d48ebe2e664f728e14fa95ae6c67d57a08b"
 
 inherit upstream-version-is-even

