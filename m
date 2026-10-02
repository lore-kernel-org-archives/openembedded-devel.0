Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C66CA5FDD
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 15:59:42 +0000 (UTC)
Received: from mta-64-227.siemens.flowmailer.net (mta-64-227.siemens.flowmailer.net [185.136.64.227])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15880.1790956772187028240
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 02 Oct 2026 08:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=BCXH37LY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.227, mailfrom: fm-256628-20261002155928bcd48dfb3d0002071a-1vey_s@rts-flowmailer.siemens.com)
Received: by mta-64-227.siemens.flowmailer.net with ESMTPSA id 20261002155928bcd48dfb3d0002071a
        for <openembedded-devel@lists.openembedded.org>;
        Fri, 02 Oct 2026 17:59:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=7Sq+Yt+Z6wtu/oONsUNg4JVC7urozSTCoqqy3jUt/as=;
 b=BCXH37LYIoKXe6u0bvBAtBPNzzRL6dkm4ZYyLlJULcWdb+byD/CWJJGdlqhj88tIFebLQo
 ctmZCpLo7brxo2znaV1WoodIJ8SaTXBofL/OjVOwsOEmFqwlOSbaiG2vvNlik7ZwG3mQinpb
 U8X39qEOGzPKtJrtt76G8DIFERWTciceXqBzStdS3nQ0bRnY8eIuBoZuw4Fo9kQiWZckKczg
 t6UaOIOXb1HQ0fFbIPd/TV6g1CyQPir9/2ZDD+e50KH0Fr01DPKhYAA2kx5iMQiEPb4PjTfB
 Z9ER4YIOcWSFaY91aV6D3niWtBo6fzOcKBqbGEKoRYmb55SIl1Gij9Qw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH] nginx: set status for CVE-2026-90439
Date: Fri,  2 Oct 2026 17:58:28 +0200
Message-ID: <20261002155828.11703-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 02 Oct 2026 15:59:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130607

From: Peter Marko <peter.marko@siemens.com>

CVE information now contains separate version range for mainline and
stable nginx version.
Problem is that mainline version range includes stable verion fix and
since cve-check marks CVE as applicable if one of ranges contains
current recipe version, it's reported as vulnerable.

* Affected 1.29.2 < 1.31.6 (semver) < matches 1.30.5, so false positive
* Affected 1.30.4 < 1.30.5 (semver) < correct fix version, but overridden

Add also a note to remove these explicit entries when new minor stable
version is available which does not fall into the mainline version range
(for all 3 currently explicitly handled CVEs).

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
index 4dda52c62d..6b638cdd96 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.5.bb
@@ -6,5 +6,7 @@ SRC_URI[sha256sum] = "6c20565aa2325cb82216ae804f4a4ff1875179014759a381c42ddc8e11
 
 inherit upstream-version-is-even
 
+# Remove following entries when upgrading recipe to 1.32
 CVE_STATUS[CVE-2026-42055] = "fixed-version: Fixed since 1.30.3"
 CVE_STATUS[CVE-2026-48142] = "fixed-version: Fixed since 1.30.3"
+CVE_STATUS[CVE-2026-90439] = "fixed-version: Fixed since 1.30.5"

