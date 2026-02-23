Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22649EC110B
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 16:49:07 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39711.1771865341806479134
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Feb 2026 08:49:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=BPxn8oT5;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-2026022316485802e280f61e00020790-kwhv0f@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 2026022316485802e280f61e00020790
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 23 Feb 2026 17:48:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=XhTDexf0st0/b+rjM/A959wUg68933tlWQwCthS7sX4=;
 b=BPxn8oT5ppVJ19T0c9YOx29isY6qq6twclrPFQEQ2zD2CkdpiqAuOkrxsD2yC2Pvpl/245
 cgG8w7xFm0ZSmi5cG5foBuqvTEZDxfxPCh/FZpkaytXENiAsnxfbIXeeexbkL3JDMWxPC6Uq
 gHcIIJEGzljfLn/XYtgWXVSNP6a6DLOGO0XrDSs1VK5WM6C6svGkjQPJYuNRpRoZYut7vGZU
 HitVIwI0FqKAbejlfZwZqFMekH01V9R7Hn22g3ekJf1jUGLipBXMO8oEFnRTxRMxrMJEsF7f
 NuVe0kd6WWk4eWydKSyW8PEbfC40lIcDZY5ILX0rnQfFbMdc5Vsw3Aiw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][kirkstone][PATCH] nginx: apply patchs for CVE-2025-23419 and CVE-2026-1642 to all versions
Date: Mon, 23 Feb 2026 17:48:54 +0100
Message-Id: <20260223164854.39462-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Feb 2026 16:49:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124552

From: Peter Marko <peter.marko@siemens.com>

There is no reason to apply them only to single version when they apply
properly to all versions.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta-webserver/recipes-httpd/nginx/nginx.inc       | 2 ++
 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 94cecabd54..6a53a50505 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -27,6 +27,8 @@ SRC_URI = " \
     file://CVE-2024-7347-1.patch \
     file://CVE-2024-7347-2.patch \
     file://CVE-2025-53859.patch \
+    file://CVE-2025-23419.patch \
+    file://CVE-2026-1642.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index 93a27ebd56..2e865e400e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -2,8 +2,5 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
-SRC_URI:append = " file://CVE-2025-23419.patch"
-SRC_URI:append = " file://CVE-2026-1642.patch"
-
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 

