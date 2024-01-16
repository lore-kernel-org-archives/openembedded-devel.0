Return-Path: <michael.haener@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B4CDC47077
	for <webhook@archiver.kernel.org>; Tue, 16 Jan 2024 14:13:15 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web11.15047.1705414390597633148
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Jan 2024 06:13:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=michael.haener@siemens.com header.s=fm1 header.b=KzbouanA;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-664519-202401161413078c05ef1bb7290d898a-9v_bxo@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202401161413078c05ef1bb7290d898a
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 16 Jan 2024 15:13:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=michael.haener@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=BzvxM2fiOB5jPOc9H+M2PweglTUJwbVAWbRefJLO948=;
 b=KzbouanAXfQsyAEKDwTlPad/0kn78AwSW4XHle4Q//XE1r2mC1igl/pi4RkNn4G1xayhxf
 Su0jzBsWLe5U9Ot9LvlIh+RvLwusvDYOrfsUFYQG2XYpsDKW9yZzRscWz39TZuD0T7y2diKM
 TS3WIXMIOOxtCWSNEN4abHJm/M9ko=;
From: "M. Haener" <michael.haener@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Michael Haener <michael.haener@siemens.com>
Subject: [oe][meta-oe][PATCH] nginx: add http sub module feature
Date: Tue, 16 Jan 2024 15:12:56 +0100
Message-ID: <20240116141256.243265-1-michael.haener@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-664519:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Jan 2024 14:13:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108303

From: Michael Haener <michael.haener@siemens.com>

Providing the http sub module feature. The module works as a filter which
replaces a specific character string in a response with another character
string.

Signed-off-by: Michael Haener <michael.haener@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 8890e0bea..f65c20971 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -47,6 +47,7 @@ PACKAGECONFIG[http-auth-request] = "--with-http_auth_request_module,,"
 PACKAGECONFIG[ipv6] = "--with-ipv6,,"
 PACKAGECONFIG[webdav] = "--with-http_dav_module,,"
 PACKAGECONFIG[stream] = "--with-stream,,"
+PACKAGECONFIG[http-sub-module] = "--with-http_sub_module,,"
 
 PACKAGECONFIG[xslt] = "--with-http_xslt_module,,libxslt"
 
-- 
2.42.0


