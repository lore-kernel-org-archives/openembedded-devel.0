Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFEAE68179
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 22:52:51 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23854.1771800766887250376
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Feb 2026 14:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=V3Tvul4n;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20260222225243afb4f52fcd00020716-m7qylb@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20260222225243afb4f52fcd00020716
        for <openembedded-devel@lists.openembedded.org>;
        Sun, 22 Feb 2026 23:52:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=81PC0TFVlmXHE1AQ8S3cdyqosrbi9Esww1PZw+y/5fA=;
 b=V3Tvul4nLUgYa5dhJr4iEtNVWRwKQmyvBfCL906RoK9CI2rxq1QO+P4SKKxqbxtnAq29f8
 RT8eSgVxpLuFuVHfW1ACWnokSxgyRJsc2VX6r5fNPzsYbW0qRb8F8FECaJJd0va4BOyvJOLV
 fr3kYS9FmI5wDJVd2wrOoOJqo5BPVaZl4v3wGCSacO0HLwlBm3wFr8deSzLvo3mGKptqT40I
 kD0h/P3daIdqwgGPxcE/quVvoUSNpxgYP9FLVjLx0eznU2SyAGd6VaT4D6UFK5xQBNlOkl0o
 ZbACSb/+1ILJxtlrAuROaiXaUavJzrFQhixLsMj6TgQNChxvOcqdAcYQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][kirkstone][PATCH v2] nginx: patch CVE-2026-1642
Date: Sun, 22 Feb 2026 23:52:39 +0100
Message-Id: <20260222225239.3882166-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 22:52:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124537

From: Peter Marko <peter.marko@siemens.com>

Pick patch accorting to [1].

[1] https://security-tracker.debian.org/tracker/CVE-2026-1642

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
v2: added patch annotations

 .../nginx/files/CVE-2026-1642.patch           | 46 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
new file mode 100644
index 0000000000..d6c636e54d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
@@ -0,0 +1,46 @@
+From 784fa05025cb8cd0c770f99bc79d2794b9f85b6e Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 29 Jan 2026 13:27:32 +0400
+Subject: [PATCH] Upstream: detect premature plain text response from SSL
+ backend.
+
+When connecting to a backend, the connection write event is triggered
+first in most cases.  However if a response arrives quickly enough, both
+read and write events can be triggered together within the same event loop
+iteration.  In this case the read event handler is called first and the
+write event handler is called after it.
+
+SSL initialization for backend connections happens only in the write event
+handler since SSL handshake starts with sending Client Hello.  Previously,
+if a backend sent a quick plain text response, it could be parsed by the
+read event handler prior to starting SSL handshake on the connection.
+The change adds protection against parsing such responses on SSL-enabled
+connections.
+
+CVE: CVE-2026-1642
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/784fa05025cb8cd0c770f99bc79d2794b9f85b6e]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/http/ngx_http_upstream.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/http/ngx_http_upstream.c b/src/http/ngx_http_upstream.c
+index df577ad67..cadc74479 100644
+--- a/src/http/ngx_http_upstream.c
++++ b/src/http/ngx_http_upstream.c
+@@ -2441,6 +2441,15 @@ ngx_http_upstream_process_header(ngx_http_request_t *r, ngx_http_upstream_t *u)
+             return;
+         }
+ 
++#if (NGX_HTTP_SSL)
++        if (u->ssl && c->ssl == NULL) {
++            ngx_log_error(NGX_LOG_ERR, c->log, 0,
++                          "upstream prematurely sent response");
++            ngx_http_upstream_next(r, u, NGX_HTTP_UPSTREAM_FT_ERROR);
++            return;
++        }
++#endif
++
+         u->state->bytes_received += n;
+ 
+         u->buffer.last += n;
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index e288b19da3..93a27ebd56 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -3,6 +3,7 @@ require nginx.inc
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
 SRC_URI:append = " file://CVE-2025-23419.patch"
+SRC_URI:append = " file://CVE-2026-1642.patch"
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 

