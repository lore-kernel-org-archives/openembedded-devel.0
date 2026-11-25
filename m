Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36767.1795587335121627206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:36 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=cLa0+TQy;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=9113; q=dns/txt;
  s=iport01; t=1795587336; x=1796796936;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=svlo+Z7kiglSNnf6GktRAshBk4C2K9I/i0JwpkyyYqg=;
  b=cLa0+TQygCl/jUBYBd5kGuK9M/1sH1S4Sg2pXvxifBH6RH6V/zne37Y1
   dSvKLdErGhiU9iZwPO1Otaq3oxmZusNz42p+BolnvuvBhCJTdK09hqIhg
   HCORe0dsqI0Y7Xz58cA2AC5UesfCftqyXi6GzhEywGeZLOv1PM7pr2QZV
   Xoy9LB2rSURch8wsBC4ISd2Jfhh8azG5AjEL48UzEFM6POupLcrf4CFQy
   VYM0J82OZXyoayB9omT7VffiLTSyWoTCAqpjwDwh0WFms/LwDb1aGZVyY
   SEilfpwFbj3NgYDGqToKMRYQ+s+v9IfLwUO5W6RBOYSE7O66w031Mp205
   g==;
X-CSE-ConnectionGUID: V5pvGNIwRdO24sioZLG6jg==
X-CSE-MsgGUID: CaocjdU7Rz+7YblkTYqYdA==
X-IPAS-Result: =?us-ascii?q?A0BKAgB5fAZr/9FK/pBaHgEBCxIMggULghg/dWBDSQOUJ?=
 =?us-ascii?q?4E1bAORUIxZFIFqDwEBAQ9EDQQBAYUFAo4iAiY0CQ4BAgQDAgMBAQEBAQEBA?=
 =?us-ascii?q?QEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBPRwDAQIvKyMIGYIqW?=
 =?us-ascii?q?AGCdAMRuWKBeTOBAYMpAT8CQ1DbMwELFAGBOIVCiCVdGAGEficbG4FygRWDa?=
 =?us-ascii?q?oEFgVwCgUeGXwSCIoEMgVSNEwKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVb?=
 =?us-ascii?q?jIdgSM7F4EHGwYFgRyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQ?=
 =?us-ascii?q?xJHJCIIEgkBExosCoEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBD?=
 =?us-ascii?q?CcdHhkOAikGFiELNBgNSBEsNxUZBD5uB5QTgikaSAkHPT4JCgETGIFFJh0kI?=
 =?us-ascii?q?pMKApAmgiGBNZ9cCiiDeYwklToaM4VbpRcLmH2OCpYBDkKEaoFoPIFZcBWDI?=
 =?us-ascii?q?glKGQ9XjVcBCguBFAECgkmCZMt3JjICCQMvAQEHAgcOAwuBaJEeYAEB?=
IronPort-Data: A9a23:REEPS6I4ftfqlRqQFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS1zBWn
 GAWDDyCPq7YajfwfI8kOY3koU8F6MeAyNZjQVcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQvajh8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1QUVkoEqs55dx7JjsS7
 v0fGhQiMBKM0rfeLLKTEoGAh+wqIdOuOMYUvWttiGmJS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A3PXwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FIpi+e2b4SNEjCMbe5cmU2aq
 l+ZxXa6XSAQMN+j+CO0/lv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIkvqS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:g+anOK9p+c8QCFjYseZuk+D0I+orL9Y04lQ7vn2ZLiYlFvBw+P
 rBoB1273LJYXMqKRIdcLO7Scy9qA3nlKKdiLN5VdzJYOClghrLEGgI1+TfKlPbdxEWjtQ86Y
 5QN45jFdb3EV92yez+4AW+DpIc5ePvytHOuQ8bpE0dND2DrMpbnmFENjo=
X-Talos-CUID: 9a23:A1UOp2HaAmFKahS8qmJZqVYKNeYEbUfR6y2MOE6/O0JGFr+aHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AQUlz9w0DwQ7f64y1cK8IVo+v1jUjyK2pA0IBrMo?=
 =?us-ascii?q?8qYrbBCZ0OAuslQW7a9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60373760"
Received: from aer-l-core-08.cisco.com ([144.254.74.209])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:33 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-08.cisco.com (Postfix) with ESMTPS id BD4BB18000181
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:32 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id F2A9ECBF21E; Tue, 24 Nov 2026 22:15:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 06/10] nginx: fix CVE-2026-123634
Date: Tue, 24 Nov 2026 22:15:25 -0800
Message-Id: <20261125061529.2721522-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-08.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132995
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-123634. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].
The individual backported commit links are recorded in the
embedded patch headers.

[1] https://github.com/nginx/nginx/commit/7426c29f140c330dd6c6cdfeb2943be1978c69e0
[2] https://ubuntu.com/security/CVE-2026-123634

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../files/CVE-2026-123634-dependent.patch     |  71 +++++++++
 .../nginx/files/CVE-2026-123634.patch         | 135 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |   2 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |   2 +
 4 files changed, 210 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-123634-dependent.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-123634.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123634-dependent.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123634-dependent.patch
new file mode 100644
index 0000000000..52024bb423
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123634-dependent.patch
@@ -0,0 +1,71 @@
+From 338f6231e347c17a07c381802b1bc3c20c55b529 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Fri, 6 Nov 2026 20:02:09 +0400
+Subject: [PATCH] Resolver: report error on CNAME restart failure
+
+Previously, if restarting a resolve with a CNAME name failed due to a
+memory allocation error, no error was reported.  The waiting requests
+were left detached from any node until their timeouts expired.
+
+Now the error is reported to the waiting requests immediately.
+
+CVE: CVE-2026-123634
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/338f6231e347c17a07c381802b1bc3c20c55b529]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/core/ngx_resolver.c | 34 ++++++++++++++++++++++++++++++++--
+ 1 file changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
+index f8f677878a..ec3df0e875 100644
+--- a/src/core/ngx_resolver.c
++++ b/src/core/ngx_resolver.c
+@@ -2550,7 +2550,22 @@ ngx_resolver_process_a(ngx_resolver_t *r, u_char *buf, size_t n,
+                 next->node = NULL;
+             }
+ 
+-            (void) ngx_resolve_name_locked(r, ctx, &name);
++            if (ngx_resolve_name_locked(r, ctx, &name) == NGX_ERROR) {
++
++                /* unlock name mutex */
++
++                do {
++                    ctx->state = NGX_ERROR;
++                    ctx->valid = ngx_time() + (r->valid ? r->valid : 10);
++                    next = ctx->next;
++
++                    ctx->handler(ctx);
++
++                    ctx = next;
++                } while (ctx);
++
++                return;
++            }
+         }
+ 
+         /* unlock name mutex */
+@@ -2935,7 +2950,22 @@ ngx_resolver_process_srv(ngx_resolver_t *r, u_char *buf, size_t n,
+                 next->node = NULL;
+             }
+ 
+-            (void) ngx_resolve_name_locked(r, ctx, &name);
++            if (ngx_resolve_name_locked(r, ctx, &name) == NGX_ERROR) {
++
++                /* unlock name mutex */
++
++                do {
++                    ctx->state = NGX_ERROR;
++                    ctx->valid = ngx_time() + (r->valid ? r->valid : 10);
++                    next = ctx->next;
++
++                    ctx->handler(ctx);
++
++                    ctx = next;
++                } while (ctx);
++
++                return;
++            }
+         }
+ 
+         /* unlock name mutex */
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123634.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123634.patch
new file mode 100644
index 0000000000..a5eee6b37c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123634.patch
@@ -0,0 +1,135 @@
+From 7426c29f140c330dd6c6cdfeb2943be1978c69e0 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Wed, 28 Oct 2026 21:51:48 +0400
+Subject: [PATCH] Resolver: fix non-current resolve finalization from resolve
+ handler
+
+Previously, when a resolve handler called ngx_resolve_name_done() or
+ngx_resolve_addr_done() for another resolve of the same name/address,
+a use-after-free could happen while reporting the finalized resolve.
+This may happen with upstream resolve when at least one subrequest is
+resolving the same name, and the request is terminated from the
+upstream resolve handler.
+
+The problem occurs when finalizing a non-current resolve that is
+already detached from rn->waiting and is about to be reported.  Such
+cases produced "could not cancel" alerts.  The resolve may also be
+detached with its node reset, while following a CNAME, in which case
+no alert was produced.
+
+Now the alerts are converted to debug messages and a finalizer is
+installed into ctx->handler to release the context memory later.
+
+Reported by Xint.io.
+
+CVE: CVE-2026-123634
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/7426c29f140c330dd6c6cdfeb2943be1978c69e0]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/core/ngx_resolver.c | 37 +++++++++++++++++++++++++++++++------
+ 1 file changed, 31 insertions(+), 6 deletions(-)
+
+diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
+index ec3df0e875..1cf772772f 100644
+--- a/src/core/ngx_resolver.c
++++ b/src/core/ngx_resolver.c
+@@ -106,6 +106,7 @@ static ngx_int_t ngx_resolver_copy(ngx_resolver_t *r, ngx_str_t *name,
+ static ngx_int_t ngx_resolver_set_timeout(ngx_resolver_t *r,
+     ngx_resolver_ctx_t *ctx);
+ static void ngx_resolver_timeout_handler(ngx_event_t *ev);
++static void ngx_resolver_free_handler(ngx_resolver_ctx_t *ctx);
+ static void ngx_resolver_free_node(ngx_resolver_t *r, ngx_resolver_node_t *rn);
+ static void *ngx_resolver_alloc(ngx_resolver_t *r, size_t size);
+ static void *ngx_resolver_calloc(ngx_resolver_t *r, size_t size);
+@@ -570,9 +571,11 @@ ngx_resolve_name_done(ngx_resolver_ctx_t *ctx)
+                 w = w->next;
+             }
+ 
+-            ngx_log_error(NGX_LOG_ALERT, r->log, 0,
+-                          "could not cancel %V resolving", &ctx->name);
++            ngx_log_debug1(NGX_LOG_DEBUG_CORE, r->log, 0,
++                           "could not cancel %V resolving", &ctx->name);
+         }
++
++        ctx->handler = ngx_resolver_free_handler;
+     }
+ 
+ done:
+@@ -590,9 +593,12 @@ ngx_resolve_name_done(ngx_resolver_ctx_t *ctx)
+ 
+     if (ctx->event) {
+         ngx_resolver_free_locked(r, ctx->event);
++        ctx->event = NULL;
+     }
+ 
+-    ngx_resolver_free_locked(r, ctx);
++    if (ctx->handler != ngx_resolver_free_handler) {
++        ngx_resolver_free_locked(r, ctx);
++    }
+ 
+     /* unlock alloc mutex */
+ 
+@@ -1202,6 +1208,7 @@ ngx_resolve_addr_done(ngx_resolver_ctx_t *ctx)
+             }
+         }
+ 
++#if (NGX_DEBUG)
+         {
+             u_char     text[NGX_SOCKADDR_STRLEN];
+             ngx_str_t  addrtext;
+@@ -1210,9 +1217,12 @@ ngx_resolve_addr_done(ngx_resolver_ctx_t *ctx)
+             addrtext.len = ngx_sock_ntop(ctx->addr.sockaddr, ctx->addr.socklen,
+                                          text, NGX_SOCKADDR_STRLEN, 0);
+ 
+-            ngx_log_error(NGX_LOG_ALERT, r->log, 0,
+-                          "could not cancel %V resolving", &addrtext);
++            ngx_log_debug1(NGX_LOG_DEBUG_CORE, r->log, 0,
++                           "could not cancel %V resolving", &addrtext);
+         }
++#endif
++
++        ctx->handler = ngx_resolver_free_handler;
+     }
+ 
+ done:
+@@ -1225,9 +1235,12 @@ ngx_resolve_addr_done(ngx_resolver_ctx_t *ctx)
+ 
+     if (ctx->event) {
+         ngx_resolver_free_locked(r, ctx->event);
++        ctx->event = NULL;
+     }
+ 
+-    ngx_resolver_free_locked(r, ctx);
++    if (ctx->handler != ngx_resolver_free_handler) {
++        ngx_resolver_free_locked(r, ctx);
++    }
+ 
+     /* unlock alloc mutex */
+ 
+@@ -3005,6 +3018,11 @@ ngx_resolver_resolve_srv_names(ngx_resolver_ctx_t *ctx, ngx_resolver_node_t *rn)
+     ngx_resolver_ctx_t       *cctx;
+     ngx_resolver_srv_name_t  *srvs;
+ 
++    if (ctx->handler == ngx_resolver_free_handler) {
++        ctx->handler(ctx);
++        return;
++    }
++
+     r = ctx->resolver;
+ 
+     ctx->node = NULL;
+@@ -4136,6 +4154,13 @@ ngx_resolver_timeout_handler(ngx_event_t *ev)
+ }
+ 
+ 
++static void
++ngx_resolver_free_handler(ngx_resolver_ctx_t *ctx)
++{
++    ngx_resolver_free(ctx->resolver, ctx);
++}
++
++
+ static void
+ ngx_resolver_free_node(ngx_resolver_t *r, ngx_resolver_node_t *rn)
+ {
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 5110a2a0f7..3df753313c 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -25,6 +25,8 @@ SRC_URI:append = " \
     file://CVE-2026-120967.patch \
     file://CVE-2026-118899_p1.patch \
     file://CVE-2026-118899_p2.patch \
+    file://CVE-2026-123634-dependent.patch \
+    file://CVE-2026-123634.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index c9e7a9095f..36c9e25072 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -25,6 +25,8 @@ SRC_URI:append = " \
     file://CVE-2026-120967.patch \
     file://CVE-2026-118899_p1.patch \
     file://CVE-2026-118899_p2.patch \
+    file://CVE-2026-123634-dependent.patch \
+    file://CVE-2026-123634.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

