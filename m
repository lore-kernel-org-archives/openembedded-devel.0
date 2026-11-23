Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.57685.1795451469548907410
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Nov 2026 08:31:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kernel.org header.s=k20260515 header.b=UUOZkbcl;
 spf=pass (domain: kernel.org, ip: 172.105.4.254, mailfrom: devnull+patrick.vogelaar.belden.com@kernel.org)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6B496236B;
	Mon, 23 Nov 2026 16:31:08 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795451468;
	b=dXRBjMJVbRUwMkCtOdgkZYIl8U7ecgJyvC5SkUUm/HEmbYAWXS+v4OAeM8hePUdFbWwV
	 RWJVbTSkVCQ+QEdujYwOiPz2N7CoMOvzfvAsCI2TbI4ujG6IZ3W6j5r6Rer9f11tprvnC
	 OM/hDYN/DsYGVLAdh2YXjBtl1G+D2UZEULMCEoeAdrNT6qqKcge8oe/xMsbyyJa/iselQ
	 yOtPw4YCeffx4YY9xHvmhfmqiu7dgE5k3dHExxyUdtaHkNrb6P1Kup/4QVB6eDF3IyZv7
	 E0fQgduYK2gRrQAtCoyKRk8gZez9l+0Z86tnN/91rlQK8Qdomhuw7Jyw5UKn/RxuRMg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795451468;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=M7H95aoM6TqcfJVes2iJkkJ4cF1cNpvTGemm4pkwZNU=;
	b=JE2oNPLhaBoLK2MTYN+5Ewwmn4Z7NX42DMu/lAd2bVQ6EFDZnTEE/jOXoQPEKD2jyn78
	 ygjmoh2Fz9K0LgszICzzLB3831NBl3PqicxKvkYC7uJ+6Q3yO600n/CIGrHmcBUb9/y3P
	 +wIxn/lwZAkAFDGNwMszmUv/rStxD6x+zQ0Bw6Hl7Tl6zhXADCNsAWpHnDoX8E/W9sgAb
	 UiT2z4WepNwd0Tyy0VT5AHTV/oCCKtBzOPomc+4y2X33iRcJejI+iYiaU9HW3PpBh69jY
	 hCCa8qLorbFcPdnkbe0Sk6Dh2gMU6hOPBTIP3fct2rApH90FvQJgHeqbq0GSvOpXcfw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B22991F000D1;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795451468;
	bh=M7H95aoM6TqcfJVes2iJkkJ4cF1cNpvTGemm4pkwZNU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UUOZkbclc2rPlHqoXAmlpgx3V9G2xPqHQve37MKue7dBm1d3gqU9TCe4X9fh41VAi
	 eXhLnpUV2XHxhVdNaj+GhDjx7exsPZw8Zw31mlTcLYmfbmfClCaRw+OkRzj26hY85i
	 8o4Qb3T+/Evx8HmXFjKpTsj4epPj7eSAUDZ+U5u7CCtQTwTKHvdLIzZ/1Oo7kdl528
	 n6RMueH92eqkbkbP5sAsM2aGHhwoUgVRO+huJTJ8QRPSTBT/DY+9yz1Uyq7VOujOiA
	 RPPjV4lwBgDFxZUvlidVawcpQk5rGtT/1StDAUCymXj4rUFndzUbwGc6nyu2eOJ+/Z
	 DmE/DBbqucKUw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 41AC94C560;
	Mon, 23 Nov 2026 16:30:54 +0000 (UTC)
From: Patrick Vogelaar via B4 Relay <devnull+patrick.vogelaar.belden.com@kernel.org>
Date: Mon, 23 Nov 2026 17:30:41 +0100
Subject: [meta-webserver][scarthgap][PATCH 2/5] nginx: fix for
 CVE-2026-123634
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-fix_nginx2root-v1-2-1b30332ed757@belden.com>
References: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
In-Reply-To: <20261123-fix_nginx2root-v1-0-1b30332ed757@belden.com>
To: openembedded-devel@lists.openembedded.org
Cc: Patrick Vogelaar <patrick.vogelaar@belden.com>, 
 patrick.vogelaar.dev@mailbox.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795451453; l=9456;
 i=patrick.vogelaar@belden.com; s=20240201; h=from:subject:message-id;
 bh=Foy6MEvO8Vi4LDJjwGREg5W12ATygmpqSrryiB/Rx/A=;
 b=XPW1FRch3ctF74If0CrQBgncT5PydP17osXbuS0tu+/F0lbranP4LGU6YwY9rea3N7n/QvneL
 x5nbqSMneu4BBzsWj7CJixwgsOuq3eX0XRoKx3k39aPo6oGjEKrhyZP
X-Developer-Key: i=patrick.vogelaar@belden.com; a=ed25519;
 pk=w0QU8RmOR3hQv1DxMcz6KmySeE8yqbvO0xC1ZSSUNqY=
X-Endpoint-Received: by B4 Relay for patrick.vogelaar@belden.com/20240201
 with auth_id=125
X-Original-From: Patrick Vogelaar <patrick.vogelaar@belden.com>
Reply-To: patrick.vogelaar@belden.com
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Mon, 23 Nov 2026 16:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132907

From: Patrick Vogelaar <patrick.vogelaar@belden.com>

Pick patch [0] and [1] as mentioned in [2].

[0] https://github.com/nginx/nginx/commit/338f6231e347c17a07c381802b1bc3c20c55b529
[1] https://github.com/nginx/nginx/commit/7426c29f140c330dd6c6cdfeb2943be1978c69e0
[2] https://security-tracker.debian.org/tracker/CVE-2026-123634

Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
---
 .../nginx/nginx-1.26.3/CVE-2026-123634-01.patch    |  75 +++++++++++
 .../nginx/nginx-1.26.3/CVE-2026-123634-02.patch    | 139 +++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb |   2 +
 3 files changed, 216 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123634-01.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123634-01.patch
new file mode 100644
index 0000000000..4307fc9a53
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123634-01.patch
@@ -0,0 +1,75 @@
+From 8ef79a87cb5818efd6dfde6a3618b36596ec5617 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Fri, 6 Nov 2026 20:02:09 +0400
+Subject: [PATCH 03/10] Resolver: report error on CNAME restart failure
+
+Previously, if restarting a resolve with a CNAME name failed due to a
+memory allocation error, no error was reported.  The waiting requests
+were left detached from any node until their timeouts expired.
+
+Now the error is reported to the waiting requests immediately.
+
+(cherry picked from commit 338f6231e347c17a07c381802b1bc3c20c55b529)
+CVE:CVE-2026-123634
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/338f6231e347c17a07c381802b1bc3c20c55b529]
+
+Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
+---
+ src/core/ngx_resolver.c | 34 ++++++++++++++++++++++++++++++++--
+ 1 file changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
+index c76c17852..b957cd892 100644
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
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123634-02.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123634-02.patch
new file mode 100644
index 0000000000..5467ff3d4c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-123634-02.patch
@@ -0,0 +1,139 @@
+From cd2559987468b6d78622927fe342be14985bfc9b Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Wed, 28 Oct 2026 21:51:48 +0400
+Subject: [PATCH 04/10] Resolver: fix non-current resolve finalization from
+ resolve handler
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
+(cherry picked from commit 7426c29f140c330dd6c6cdfeb2943be1978c69e0)
+CVE:CVE-2026-123634
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/7426c29f140c330dd6c6cdfeb2943be1978c69e0]
+
+Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
+---
+ src/core/ngx_resolver.c | 37 +++++++++++++++++++++++++++++++------
+ 1 file changed, 31 insertions(+), 6 deletions(-)
+
+diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
+index b957cd892..c3467cf7e 100644
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
+@@ -590,9 +593,12 @@ done:
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
+@@ -1225,9 +1235,12 @@ done:
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
+-- 
+2.43.0
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
index 18cd8bbfde..2b392fd6d6 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
@@ -9,6 +9,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 SRC_URI:append = " \
                   file://CVE-2026-28755.patch \
                   file://CVE-2026-123007.patch \
+                  file://CVE-2026-123634-01.patch \
+                  file://CVE-2026-123634-02.patch \
                   "
 
 SRC_URI[sha256sum] = "69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa"

-- 
2.43.0


