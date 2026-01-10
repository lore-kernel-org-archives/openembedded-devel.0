Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79ED9D25023
	for <webhook@archiver.kernel.org>; Sat, 10 Jan 2026 20:29:46 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15864.1768076980865462234
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Jan 2026 12:29:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=PoEGL/0b;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20260110202937717274521b0002070b-3zxpig@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20260110202937717274521b0002070b
        for <openembedded-devel@lists.openembedded.org>;
        Sat, 10 Jan 2026 21:29:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=vw8w6w1+sau6rFg62//DLgIeJwQveQ29UNwqhGZE/L4=;
 b=PoEGL/0bzO32esTL0WRlN2hX3MJuiP3IWSsJwSw4SG8U4LRvPGyNGtNIrHlnLW/ogcFP6e
 PUDtn6HwodWXt1n4aKT2sNq9d8tbXwD95rxgE5QoAH5vtMLj2TSVDEB7928d/bTYVL9OBNtd
 JVCp7NmYuInN4uVPY0Pfh5FoTAoRGABOV9vxBVcSqs8lLFHql1yPl3LpJGyxjODw1CC1rZa4
 fOsh0pNKJqUXmtsbiQWO/E396IHDdk95JsvOe27PFuAmE6Qdaj6RC/S/j50S48JLXSaMHxiC
 DPKNymRBVe9hlLd0CmWjBNH0p4HxT8qlrD+Hgp9MKtmpqIvoaeL8+U7g==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH] nginx: ignore CVE-2025-53859 for 1.28.1
Date: Sat, 10 Jan 2026 21:29:19 +0100
Message-Id: <20260110202919.3948238-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Jan 2026 20:29:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123336

From: Peter Marko <peter.marko@siemens.com>

Fix is included via commit [1].

[1] https://github.com/nginx/nginx/commit/fbbbf189dadf3bd59c2462af68c16f2c2874d4ee

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
index b34b81b9b2..eaaf2b75e9 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
@@ -3,3 +3,5 @@ require nginx.inc
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
 SRC_URI[sha256sum] = "40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e"
+
+CVE_STATUS[CVE-2025-53859] = "cpe-stable-backport: Fix is included in 1.28.1"

