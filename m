Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28D5C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 17:46:18 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3417.1784569577201943435
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Jul 2026 10:46:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=J+Klnd5q;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260720174613181a94952d0002078a-jm_qsv@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260720174613181a94952d0002078a
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 20 Jul 2026 19:46:14 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=W43/VJ2x6xAWSNbKM4RVyjYsNeZAKLPNAFgEbCfQgAQ=;
 b=J+Klnd5q7nfQMuxtajoHp/RCx2u0Wrf/zmsrhs417t9LJCVGW2dvQ+PbYCIvIO4cZaxCol
 iWKupAEjslCz7pkpZJj9JhLD7eI67AGrzWz7vBpC8wzUZBQqMc15qoLmPpYmbZFmHA63sZvp
 Q7mtWsVs69DGUwaYyYrDHXCe2Zj+CORmB58e55+RdCSQr0WSNeEOAJWSERZjrXHmUGPcuB/a
 dsnEWolBOrLSllEiYIBFml9W4+YFIx2Dbwi6RrG43/BzhefXPTznMKGJqojkUjhtLNaWgOap
 HWA9BRQtCBHlq36Z/O7iNZW3xTzgOVW9GQz3/K6Fkj2qmUyZfXtWgQvQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH] nginx: set status for CVE-2026-42055 and CVE-2026-48142
Date: Mon, 20 Jul 2026 19:46:02 +0200
Message-ID: <20260720174602.18893-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Jul 2026 17:46:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128284

From: Peter Marko <peter.marko@siemens.com>

These CVEs were fixed in 1.30.3 but still showing in cve reports.
Fixed version information is e.g. in [1].

[1] https://nginx.org/en/security_advisories.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb
index bef176949f..7b24e05f0d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.4.bb
@@ -5,3 +5,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 SRC_URI[sha256sum] = "4261dc90e9e47c1c4041276e9aaa3d48ebe2e664f728e14fa95ae6c67d57a08b"
 
 inherit upstream-version-is-even
+
+CVE_STATUS[CVE-2026-42055] = "fixed-version: Fixed since 1.30.3"
+CVE_STATUS[CVE-2026-48142] = "fixed-version: Fixed since 1.30.3"

