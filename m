Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60A4BC44515
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 16:35:43 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17327.1784219739360570655
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Jul 2026 09:35:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=jOiYQioD;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20260716163535a598f89f8800020714-2siwdn@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20260716163535a598f89f8800020714
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 16 Jul 2026 18:35:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=JfmcjdK5KBUxZos94fMJJvXRanKjTxjYShElGGShybs=;
 b=jOiYQioDnXUrPvz2egiVq3LgBf2+okMqNIoF6HkxXNY6+RiRj1KmthSJjXKOSIZqXGkup5
 3Rc5Q9+ZEF3NYFWPg1o7Tvy3pgKOAe+PPNbqevRxnliDjMdrESjljO6QEX2AEvey7/u2ixOS
 5za+RzaDzDIoNqBG182SBipN6YTJuET/21JplJ2f2hd4/treb+vnNKCzN7o9l9FOOcVvXfnd
 DiDfXcTaVjyp4WBmARDtLWMiUBwiaAQV65PbXIFtjwOwDJbhBDx1VdFiQ+4LAAI3McKBFMUe
 ffo5jnJzUMbHVp9VfWgwOLBXDJ3VVs6GZOGILkmns7fb+23nRw7PzSaQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH 1/2] nginx: inherit upstream-version-is-even
Date: Thu, 16 Jul 2026 18:35:04 +0200
Message-ID: <20260716163505.801585-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Jul 2026 16:35:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128233

From: Peter Marko <peter.marko@siemens.com>

Since mainline version has been deleted, devtool tries to upgrade stable
recipe to mainline version.
Prevent it by telling it that even version needs to be used.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb
index 981b3f6477..0c07560c4c 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.30.3.bb
@@ -4,3 +4,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=79da1c70d587d3a199af9255ad393f99"
 
 SRC_URI[sha256sum] = "e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f"
 
+inherit upstream-version-is-even

