Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F09BCCC6B38
	for <webhook@archiver.kernel.org>; Thu, 15 Oct 2026 21:46:59 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8918.1792100812650162932
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 14:46:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=X7HeOllr;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202610152146493326e766c30002074f-47ke2x@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202610152146493326e766c30002074f
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 15 Oct 2026 23:46:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=jmR41ta3J7nW434Wafp+TVkKjKoZZnERBh8/tLZL4oc=;
 b=X7HeOllr/3xQubGrELz23fSXgJGIVqwCk2UcTOl/vppqa7LgRf35nxOyPxPpcm5/dqanvB
 Cobq6pQS/XQSej+7dotKaGA3NyEEzcX8RmyqUoNclDuNeRb8t/EYL2IYslgqMhR2rxgH+4gT
 29upd7ZMTJN65IgBP0Bvu/E0cLh8u+IlqYJsrZK8qSbiJYlzk7ZOSg3A3zyenq2kEgydyY9u
 APn732TDXdrI38AQvtruPd8pnMuRX93Q+fo7pICqkAeHgk3lc5a/AirCgB+6eFmpBlb2O5aK
 VYKKIBJtgKq1xcU/d76pDB2O6SrUitwqwb2d7j+R1BWpnkNVB3t3bEcQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH] nginx: set CVE_STATUS for CVE-2026-95101 and CVE-2026-97629
Date: Thu, 15 Oct 2026 23:46:31 +0200
Message-ID: <20261015214631.3943220-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Oct 2026 21:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131011

From: Peter Marko <peter.marko@siemens.com>

These CVEs are fixed in latest release however still show-up in open
CVE reports. Reason is that the DB contains entries:
  {
    "lessThan": "*",
    "status": "affected",
    "version": "1.23.3",
    "versionType": "custom"
  }

Which should mean that the first affected release is 1.23.3, however
without the upper limit it will match all higher releases.
The entry with >= 1.30.0 && < 1.30.6 cannot change the result as it
works by flagging CVEs where at least one version match is present.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
index 5d699e63ce..73204da558 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.6.bb
@@ -6,6 +6,9 @@ SRC_URI[sha256sum] = "3cf46f5ed7504d460125866b7bea99fb357f31d887e2e63b35503310e9
 
 inherit upstream-version-is-even
 
+CVE_STATUS[CVE-2026-95101] = "fixed-version: Fixed since 1.30.6"
+CVE_STATUS[CVE-2026-97629] = "fixed-version: Fixed since 1.30.6"
+
 # Remove following entries when upgrading recipe to 1.32
 CVE_STATUS[CVE-2026-42055] = "fixed-version: Fixed since 1.30.3"
 CVE_STATUS[CVE-2026-48142] = "fixed-version: Fixed since 1.30.3"

