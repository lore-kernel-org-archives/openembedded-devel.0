Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C97C4345F
	for <webhook@archiver.kernel.org>; Tue, 30 Apr 2024 21:50:19 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.824.1714513812657333667
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Apr 2024 14:50:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=G09VcXPI;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20240430215009abef59c3dee1d6563b-kogqik@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20240430215009abef59c3dee1d6563b
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 30 Apr 2024 23:50:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=PYRxS1jwR2XrotZm/xltUVeYbLDD+xF4kCUiOt9MWGg=;
 b=G09VcXPIM2uVlzCwbyUzpilYLEVk5Fnm5oAK5fe3NIgQK8yEx/YcjnjQSkHYPmNKlH8ScC
 8Pw/F49lly4FyM5Y0aS+lPiRT/mkXkUot3QWn5bigVOTDbQ/8A1bkJ/m1L20EmSrLCo8Vi38
 R1qznlMMly6blV23zKd0vlgafYhIc=;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-oe][PATCH] nginx: Upgrade stable 1.24.0 -> 1.26.0
Date: Tue, 30 Apr 2024 23:49:21 +0200
Message-Id: <20240430214921.2190109-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Apr 2024 21:50:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110198

From: Peter Marko <peter.marko@siemens.com>

nginx-1.26.0 stable version has been released, incorporating new
features and bug fixes from the 1.25.x mainline branch -
including experimental HTTP/3 support, HTTP/2 on a per-server basis
virtual servers in the stream module, passing stream connections to
listen sockets, and more.

License-Update: copyright years refreshed

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nginx/files/CVE-2023-44487.patch          | 78 -------------------
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  8 --
 .../recipes-httpd/nginx/nginx_1.26.0.bb       |  6 ++
 3 files changed, 6 insertions(+), 86 deletions(-)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
deleted file mode 100644
index 2fc6a60f6f..0000000000
--- a/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-From 6ceef192e7af1c507826ac38a2d43f08bf265fb9 Mon Sep 17 00:00:00 2001
-From: Maxim Dounin <mdounin@mdounin.ru>
-Date: Wed, 10 Jan 2024 18:52:11 +0000
-Subject: [PATCH] HTTP/2: per-iteration stream handling limit.
-
-To ensure that attempts to flood servers with many streams are detected
-early, a limit of no more than 2 * max_concurrent_streams new streams per one
-event loop iteration was introduced.  This limit is applied even if
-max_concurrent_streams is not yet reached - for example, if corresponding
-streams are handled synchronously or reset.
-
-Further, refused streams are now limited to maximum of max_concurrent_streams
-and 100, similarly to priority_limit initial value, providing some tolerance
-to clients trying to open several streams at the connection start, yet
-low tolerance to flooding attempts.
-
-Upstream-Status: Backport [https://github.com/nginx/nginx/commit/6ceef192e7af1c507826ac38a2d43f08bf265fb9]
-CVE: CVE-2023-44487
-
-Signed-off-by: alperak <alperyasinak1@gmail.com>
----
- src/http/v2/ngx_http_v2.c | 15 +++++++++++++++
- src/http/v2/ngx_http_v2.h |  2 ++
- 2 files changed, 17 insertions(+)
-
-diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
-index ea3f27c..1116e56 100644
---- a/src/http/v2/ngx_http_v2.c
-+++ b/src/http/v2/ngx_http_v2.c
-@@ -361,6 +361,7 @@ ngx_http_v2_read_handler(ngx_event_t *rev)
-     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, c->log, 0, "http2 read handler");
- 
-     h2c->blocked = 1;
-+    h2c->new_streams = 0;
- 
-     if (c->close) {
-         c->close = 0;
-@@ -1321,6 +1322,14 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_t *h2c, u_char *pos,
-         goto rst_stream;
-     }
- 
-+    if (h2c->new_streams++ >= 2 * h2scf->concurrent_streams) {
-+        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
-+                      "client sent too many streams at once");
-+
-+        status = NGX_HTTP_V2_REFUSED_STREAM;
-+        goto rst_stream;
-+    }
-+
-     if (!h2c->settings_ack
-         && !(h2c->state.flags & NGX_HTTP_V2_END_STREAM_FLAG)
-         && h2scf->preread_size < NGX_HTTP_V2_DEFAULT_WINDOW)
-@@ -1386,6 +1395,12 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_t *h2c, u_char *pos,
- 
- rst_stream:
- 
-+    if (h2c->refused_streams++ > ngx_max(h2scf->concurrent_streams, 100)) {
-+        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
-+                      "client sent too many refused streams");
-+        return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_NO_ERROR);
-+    }
-+
-     if (ngx_http_v2_send_rst_stream(h2c, h2c->state.sid, status) != NGX_OK) {
-         return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_INTERNAL_ERROR);
-     }
-diff --git a/src/http/v2/ngx_http_v2.h b/src/http/v2/ngx_http_v2.h
-index 4e25293..b9daf92 100644
---- a/src/http/v2/ngx_http_v2.h
-+++ b/src/http/v2/ngx_http_v2.h
-@@ -124,6 +124,8 @@ struct ngx_http_v2_connection_s {
-     ngx_uint_t                       processing;
-     ngx_uint_t                       frames;
-     ngx_uint_t                       idle;
-+    ngx_uint_t                       new_streams;
-+    ngx_uint_t                       refused_streams;
-     ngx_uint_t                       priority_limit;
- 
-     ngx_uint_t                       pushing;
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
deleted file mode 100644
index e5666f6fe6..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ /dev/null
@@ -1,8 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
-
-SRC_URI:append = " file://CVE-2023-44487.patch"
-
-SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
new file mode 100644
index 0000000000..0ce940d429
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
@@ -0,0 +1,6 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
+
+SRC_URI[sha256sum] = "d2e6c8439d6c6db5015d8eaab2470ab52aef85a7bf363182879977e084370497"
+
-- 
2.30.2


