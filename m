Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36734.1795587335213063486
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IPHLPMeA;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7199; q=dns/txt;
  s=iport01; t=1795587335; x=1796796935;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=6HtMbv6lvid1yNoWjRB2ylmdcsU+uvZj+PdIFxOQ8oo=;
  b=IPHLPMeAN8VvXI5AcyP/+T5CX1LVqBe1JupE14YeoePTk37GpXbq4z+m
   p6ZcV3ch533rpEsJKqhfQv7dbvSAoMV+y83ssgdVwwmH2PDQZYTnx1G44
   +o31zm0TzbWIh0cEDprhvyNgBTjGi1GTL/LRijOJD9MX+gB+io7vD2ybE
   ksiPJxhrklFioIeOLyksVERQYzh+XiTtvkJ97o5fapZWg74K/nwujbl/T
   F+x+yykERYe7Al6ErJCk0Trz+/UjHNPiK2pmpVpeuUzlZRhDmurIjx221
   duQPx9xXu7GcieuFBi3ew4Xa5RcbE3eYFP7t/4qOO45huHJnf34p92ibj
   A==;
X-CSE-ConnectionGUID: 4g0YOOKcQBWEubjxr0D3Ww==
X-CSE-MsgGUID: xDFAps4tTJGfrU/9t6Sftw==
X-IPAS-Result: =?us-ascii?q?A0BFAgB5fAZr/9FK/pBaglmCGD91YENJA5QngTVsniyBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGTKQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBB?=
 =?us-ascii?q?wWBDhOGTw2QEgEtCwEYAVkDAQJaIyGCKlgBgnQDEbligXkzgQGDKQE/AkNQ2?=
 =?us-ascii?q?zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVg2qBBYFcAoE3AYZuBIIigQyBVIY3A?=
 =?us-ascii?q?4ZZAoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBHIEeg?=
 =?us-ascii?q?RKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKgRo1P?=
 =?us-ascii?q?AkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWIQs0GA1IE?=
 =?us-ascii?q?Sw3FRkEPm4HlBODGz1RASoBTzZmQaV1oREKKIN5jCSVOhozhASUGpJUC5h9j?=
 =?us-ascii?q?gqVPEVQhGqBaDyBWXAVgyIJShkPji8KC4NgzlsmMgIJAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?AABJ4FWAQE?=
IronPort-Data: A9a23:XheTbaMNMFPSuGPvrR3xlsFynXyQoLVcMsEvi/4bfWQNrUol1T0Ez
 TAdUDiGO/7cY2unfookPt7n9EoB7cCGx9A2G3M5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmM/ErF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb8gWMsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj66lhVHARGq4Tw8xILHxE9
 +wCcBxWUQ/W0opawJrjIgVtrs0uNozveYgYoHwllWGfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2I+BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237klYgjuexboC9ltqiVel7t16D+
 n763Uv3GCxdZcDB8jSZ7Sf57gPItWahMG4IL5W/7vNsjViZy2AfBRFTWValrP2Rjk+lR8kZL
 FQZ/Ccrp6U++EGnCN7nUHWFTGWstxMGHt4VGOog5UTVmuzf4h2SAS4PSTsphMEaifLajAcCj
 jeh9+4FzxQ12FFJYRpxLoupkA4=
IronPort-HdrOrdr: A9a23:Rh/9g6jrTyQ/bsb0ZdOh/FZNuHBQXuoji2hC6mlwRA09TyX+rb
 HNoB1173HJYVoqNU3I+urwW5VoP0m8yXcd2+B4Vt2ftWLd11dAQrsP0WKb+V3dMhy70PJB3q
 F9dKU7ItjxAV9myfve2mCDYrMdKB3tytHOuQ8YpE0dKT1XVw==
X-Talos-CUID: 9a23:4tLVcWBsrUxFGzX6E3VorH8zPeMuS1fi4WraIV+iUUoyd6LAHA==
X-Talos-MUID: 9a23:9sWctgYoERy+1+BTpxPCrSl5aNtUwYugEn1KwIlYgMeYKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62967462"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:31 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id 3776618000181
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:31 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id E0A31CC1611; Tue, 24 Nov 2026 22:15:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 01/10] nginx: fix CVE-2026-97205
Date: Tue, 24 Nov 2026 22:15:20 -0800
Message-Id: <20261125061529.2721522-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132993
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-97205. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/nginx/nginx/commit/587c47aed19ddec799eee953a38837936e585b39
[2] https://ubuntu.com/security/CVE-2026-97205

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-97205.patch          | 153 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |   1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |   1 +
 3 files changed, 155 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-97205.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-97205.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-97205.patch
new file mode 100644
index 0000000000..e40acc4a05
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-97205.patch
@@ -0,0 +1,153 @@
+From 587c47aed19ddec799eee953a38837936e585b39 Mon Sep 17 00:00:00 2001
+From: Vadim Zhestikov <v.zhestikov@f5.com>
+Date: Mon, 17 Aug 2026 09:19:46 -0700
+Subject: [PATCH] Limited the number of pending operations per request
+
+Each pending asynchronous operation holds a reference in
+r->main->blocked, an 8-bit field, and the increments were not checked.
+With 256 operations pending on a single request the counter wrapped to
+zero, after which the request could be freed while those operations
+still referenced its pool.  This is the same overflow that 4ec67cf86
+addressed for r->main->count, and left unaddressed for r->main->blocked.
+
+Operations beyond the limit are now performed synchronously where a
+synchronous path exists, and refused otherwise, so that the counter
+cannot overflow.
+
+Reported by cyberlancer.
+
+CVE: CVE-2026-97205
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/587c47aed19ddec799eee953a38837936e585b39]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/ngx_http_copy_filter_module.c | 36 ++++++++++++++++++++++++++
+ src/http/ngx_http_file_cache.c         | 12 +++++++--
+ src/http/ngx_http_request.h            |  1 +
+ src/http/ngx_http_upstream.c           |  6 +++++
+ 4 files changed, 53 insertions(+), 2 deletions(-)
+
+diff --git a/src/http/ngx_http_copy_filter_module.c b/src/http/ngx_http_copy_filter_module.c
+index 8e5de2bf70..6b233c48cc 100644
+--- a/src/http/ngx_http_copy_filter_module.c
++++ b/src/http/ngx_http_copy_filter_module.c
+@@ -87,6 +87,13 @@ ngx_http_copy_filter(ngx_http_request_t *r, ngx_chain_t *in)
+     ngx_output_chain_ctx_t       *ctx;
+     ngx_http_core_loc_conf_t     *clcf;
+     ngx_http_copy_filter_conf_t  *conf;
++#if (NGX_HAVE_FILE_AIO)
++    ngx_output_chain_aio_pt       aio_handler;
++#endif
++#if (NGX_THREADS)
++    ngx_int_t                   (*thread_handler)(ngx_thread_task_t *task,
++                                                  ngx_file_t *file);
++#endif
+ 
+     c = r->connection;
+ 
+@@ -140,10 +147,39 @@ ngx_http_copy_filter(ngx_http_request_t *r, ngx_chain_t *in)
+ 
+ #if (NGX_HAVE_FILE_AIO || NGX_THREADS)
+     ctx->aio = r->aio;
++
++#if (NGX_HAVE_FILE_AIO)
++    aio_handler = ctx->aio_handler;
++#endif
++#if (NGX_THREADS)
++    thread_handler = ctx->thread_handler;
++#endif
++
++    /*
++     * each pending operation holds a reference in r->main->blocked;
++     * with the counter close to its limit the file is read
++     * synchronously instead, so that it cannot overflow
++     */
++
++    if (r->main->blocked >= NGX_HTTP_MAX_BLOCKED) {
++#if (NGX_HAVE_FILE_AIO)
++        ctx->aio_handler = NULL;
++#endif
++#if (NGX_THREADS)
++        ctx->thread_handler = NULL;
++#endif
++    }
+ #endif
+ 
+     rc = ngx_output_chain(ctx, in);
+ 
++#if (NGX_HAVE_FILE_AIO)
++    ctx->aio_handler = aio_handler;
++#endif
++#if (NGX_THREADS)
++    ctx->thread_handler = thread_handler;
++#endif
++
+     if (ctx->in == NULL) {
+         r->buffered &= ~NGX_HTTP_COPY_BUFFERED;
+ 
+diff --git a/src/http/ngx_http_file_cache.c b/src/http/ngx_http_file_cache.c
+index 5209f003b0..d3d0f039cd 100644
+--- a/src/http/ngx_http_file_cache.c
++++ b/src/http/ngx_http_file_cache.c
+@@ -440,6 +440,10 @@ ngx_http_file_cache_lock(ngx_http_request_t *r, ngx_http_cache_t *c)
+         return NGX_HTTP_CACHE_SCARCE;
+     }
+ 
++    if (r->main->blocked >= NGX_HTTP_MAX_BLOCKED) {
++        return NGX_HTTP_CACHE_SCARCE;
++    }
++
+     c->waiting = 1;
+ 
+     if (c->wait_time == 0) {
+@@ -692,7 +696,9 @@ ngx_http_file_cache_aio_read(ngx_http_request_t *r, ngx_http_cache_t *c)
+ 
+ #if (NGX_HAVE_FILE_AIO)
+ 
+-    if (clcf->aio == NGX_HTTP_AIO_ON && ngx_file_aio) {
++    if (clcf->aio == NGX_HTTP_AIO_ON && ngx_file_aio
++        && r->main->blocked < NGX_HTTP_MAX_BLOCKED)
++    {
+         n = ngx_file_aio_read(&c->file, c->buf->pos, c->body_start, 0, r->pool);
+ 
+         if (n != NGX_AGAIN) {
+@@ -717,7 +723,9 @@ ngx_http_file_cache_aio_read(ngx_http_request_t *r, ngx_http_cache_t *c)
+ 
+ #if (NGX_THREADS)
+ 
+-    if (clcf->aio == NGX_HTTP_AIO_THREADS) {
++    if (clcf->aio == NGX_HTTP_AIO_THREADS
++        && r->main->blocked < NGX_HTTP_MAX_BLOCKED)
++    {
+         c->file.thread_task = c->thread_task;
+         c->file.thread_handler = ngx_http_cache_thread_handler;
+         c->file.thread_ctx = r;
+diff --git a/src/http/ngx_http_request.h b/src/http/ngx_http_request.h
+index 48eb43eb0f..84f3117dd5 100644
+--- a/src/http/ngx_http_request.h
++++ b/src/http/ngx_http_request.h
+@@ -11,6 +11,7 @@
+ 
+ #define NGX_HTTP_MAX_URI_CHANGES           10
+ #define NGX_HTTP_MAX_SUBREQUESTS           50
++#define NGX_HTTP_MAX_BLOCKED               250
+ 
+ /* must be 2^n */
+ #define NGX_HTTP_LC_HEADER_LEN             32
+diff --git a/src/http/ngx_http_upstream.c b/src/http/ngx_http_upstream.c
+index fe2c6b8956..449508ac7b 100644
+--- a/src/http/ngx_http_upstream.c
++++ b/src/http/ngx_http_upstream.c
+@@ -4184,6 +4184,12 @@ ngx_http_upstream_thread_handler(ngx_thread_task_t *task, ngx_file_t *file)
+     task->event.data = r;
+     task->event.handler = ngx_http_upstream_thread_event_handler;
+ 
++    if (r->main->blocked >= NGX_HTTP_MAX_BLOCKED) {
++        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                      "too many operations pending");
++        return NGX_ERROR;
++    }
++
+     if (ngx_thread_task_post(tp, task) != NGX_OK) {
+         return NGX_ERROR;
+     }
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 5b31fabc37..3b14e18d4b 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -18,6 +18,7 @@ SRC_URI:append = " \
     file://CVE-2026-95101.patch \
     file://CVE-2026-97629.patch \
     file://CVE-2026-15176.patch \
+    file://CVE-2026-97205.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index c2a6e2b6be..317981a6fa 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -18,6 +18,7 @@ SRC_URI:append = " \
     file://CVE-2026-95101.patch \
     file://CVE-2026-97629.patch \
     file://CVE-2026-15176.patch \
+    file://CVE-2026-97205.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

