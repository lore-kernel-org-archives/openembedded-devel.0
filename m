Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36767.1795587335121627206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:37 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=YzBG55GN;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=19020; q=dns/txt;
  s=iport01; t=1795587336; x=1796796936;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ybSC6oyLQsnZbxQcAAQ8l1sy/Ozrqz+qXze5iOSPNkI=;
  b=YzBG55GNsKN5d0RY2DbSB3A8O55xs0SOwwqXTcVzh0O4aW7RTjzlF3np
   TqaOvgO10tcbc45dfT6WJZUVZVS6CoNSYYDWEnprhKNkeTCJvQ/bM3Kx8
   s1mJwLtGGxnoka8fHEMEPaoHJDu1DaGXYT0tbBOgT+diQm/wozzoD2afB
   +HR4zlvb4G+WUNX0jcD+N7oI5Xqg5SJ1bMQKLik9tbZvAop9gM0vnorv4
   BLNUg9heH4xECpJ5VrzfANQDKalgaQAuY98CrAjk7AjLZZQ0v1EnYUbrM
   HG5Z4KfAGJgGUGAQQu6ibV5CGVY2NpLBFPZGYvcP9NiFs+EKZZ9q+H17j
   A==;
X-CSE-ConnectionGUID: 5xjkSsy/SsiWxJ7ymMLB3w==
X-CSE-MsgGUID: zYjCcz5fQM+yG8unhvctdA==
X-IPAS-Result: =?us-ascii?q?A0BMAgB5fAZr/9VK/pBaHgE8DA4LgVmCGD91YENJA5Qng?=
 =?us-ascii?q?TVsA5FQjFkUgWoPAQEBD0QNBAEBhQUCjiICJjQJDgECBAMCAwEBAQEBAQEBA?=
 =?us-ascii?q?QEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgipYA?=
 =?us-ascii?q?YJ0AxG5YoF5M4EBgykBPwJDUNszAQsUAYE4hUKIJV0YAYR+JxsbgXKBFYNqg?=
 =?us-ascii?q?QWBXAKBPgEBB4ZfBIIigQyBVI0TAoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSK?=
 =?us-ascii?q?hVuMh2BIzsXgQcbBgWBHIEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTC?=
 =?us-ascii?q?SVDEkckIggSCQETGiwKgRo1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbC?=
 =?us-ascii?q?oEMJx0eGQ4CKQYWIQs0GA1IESw3FRkEPm4HlBOCExZSIA4vPhMBExcBIjaBE?=
 =?us-ascii?q?xcqBghAkkUbCAEBkByCIYE1n1wKKIN5jCSVOhozhASBV5JDklQLmH2OCpU3B?=
 =?us-ascii?q?UVQhGqBaDyBWXAVgyIJShkPV4ZGhxEBCguDYIJkgi/JSCYyAgkDLwEBBwIHD?=
 =?us-ascii?q?gMLgWiQAAQDgXcBAQ?=
IronPort-Data: A9a23:8+qqUKyBuRmFhz98iON6t+djxyrEfRIJ4+MujC+fZmUNrF6WrkVUy
 jMeCj/VM6uLYWGhc9ByOd6+pk0E78fdy4VmQFFoqVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lH9aOWJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBwmP44j4fcwOnpPy
 uw6dyEISzSp3P3jldpXSsE07igiBMDmJsYb/3pn1zycVKxgSpHYSKKM7thdtNsyrpkSQbCEO
 pZfNmYpNk2bC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjuC2b4GKJIbiqcN9jHeaj
 WnUomrAJ1ILG4yCzzqb+W6gr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0UtdKVul/4waXx++NuUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXOIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:lcQA46NNIcRMV8BcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: =?us-ascii?q?9a23=3Ad0uhdWpsrmWKu7vK/WnSU1nmUZ01cH7m12aXGFS?=
 =?us-ascii?q?5NnZLF6yQbHu6o7wxxg=3D=3D?=
X-Talos-MUID: 9a23:Lq13dwaCLSQiOOBTpQ7urzpwaclRxue/JxAQl5UYsNWIHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60373762"
Received: from aer-l-core-12.cisco.com ([144.254.74.213])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:33 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-12.cisco.com (Postfix) with ESMTPS id CE93D18000371
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:32 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 05745CBEF8A; Tue, 24 Nov 2026 22:15:30 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 08/10] nginx: fix CVE-2026-113425
Date: Tue, 24 Nov 2026 22:15:27 -0800
Message-Id: <20261125061529.2721522-8-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132997
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-113425. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].
The individual backported commit links are recorded in the
embedded patch headers.

[1] https://github.com/nginx/nginx/commit/df9d8d940ecb83a50b1e55ccc296d0a29cfe774c
[2] https://ubuntu.com/security/CVE-2026-113425

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../files/CVE-2026-113425-dependent.patch     |  88 ++++++++++++++
 .../nginx/files/CVE-2026-113425_p1.patch      |  40 +++++++
 .../nginx/files/CVE-2026-113425_p2.patch      |  83 +++++++++++++
 .../nginx/files/CVE-2026-113425_p3.patch      |  67 +++++++++++
 .../nginx/files/CVE-2026-113425_p4.patch      | 112 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |   5 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |   5 +
 7 files changed, 400 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425-dependent.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p2.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p3.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p4.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425-dependent.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425-dependent.patch
new file mode 100644
index 0000000000..a14bf9c96e
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425-dependent.patch
@@ -0,0 +1,88 @@
+From 9e811a43119ac902f0d0296fb4afb34bb063cf1b Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Sat, 20 Jun 2026 05:04:41 +0300
+Subject: [PATCH] Mail: updated ngx_mail_send() to set handlers on s->quit.
+
+Most notably, this fixes potential issues when a fatal error message is
+sent with ngx_mail_send() with s->quit set, but the read handler is not
+updated.  Despite s->quit, ngx_mail_send() might not be able to send the
+error message immediately, and the read handler might be called on read
+events.  In particular, in ngx_mail_auth_http_block_read() and in
+ngx_mail_proxy_block_read() this could potentially cause accesses to
+freed memory or already closed connections in ngx_handle_read_event()
+error handling code paths.
+
+Reported by Evan Hellman,
+https://github.com/freenginx/nginx/issues/23
+https://github.com/freenginx/nginx/issues/24
+
+CVE: CVE-2026-113425
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/9e811a43119ac902f0d0296fb4afb34bb063cf1b]
+
+Signed-off-by: Vadim Zhestikov <v.zhestikov@f5.com>
+Origin: <https://freenginx.org/hg/nginx/rev/87725983f346>
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/mail/ngx_mail_handler.c | 21 +++++++++++++++++----
+ 1 file changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
+index a88e6c2873..c167360ca3 100644
+--- a/src/mail/ngx_mail_handler.c
++++ b/src/mail/ngx_mail_handler.c
+@@ -14,6 +14,7 @@
+ static void ngx_mail_proxy_protocol_handler(ngx_event_t *rev);
+ static void ngx_mail_init_session_handler(ngx_event_t *rev);
+ static void ngx_mail_init_session(ngx_connection_t *c);
++static void ngx_mail_block_read(ngx_event_t *rev);
+ 
+ #if (NGX_MAIL_SSL)
+ static void ngx_mail_ssl_init_connection(ngx_ssl_t *ssl, ngx_connection_t *c);
+@@ -415,8 +416,6 @@ ngx_mail_verify_cert(ngx_mail_session_t *s, ngx_connection_t *c)
+         s->out = cscf->protocol->cert_error;
+         s->quit = 1;
+ 
+-        c->write->handler = ngx_mail_send;
+-
+         ngx_mail_send(s->connection->write);
+         return NGX_ERROR;
+     }
+@@ -436,8 +435,6 @@ ngx_mail_verify_cert(ngx_mail_session_t *s, ngx_connection_t *c)
+             s->out = cscf->protocol->no_cert;
+             s->quit = 1;
+ 
+-            c->write->handler = ngx_mail_send;
+-
+             ngx_mail_send(s->connection->write);
+             return NGX_ERROR;
+         }
+@@ -824,6 +821,11 @@ ngx_mail_send(ngx_event_t *wev)
+ 
+     ngx_add_timer(c->write, cscf->timeout);
+ 
++    if (s->quit) {
++        c->read->handler = ngx_mail_block_read;
++        c->write->handler = ngx_mail_send;
++    }
++
+     if (ngx_handle_write_event(c->write, 0) != NGX_OK) {
+         ngx_mail_close_connection(c);
+         return;
+@@ -942,6 +944,17 @@ ngx_mail_session_internal_server_error(ngx_mail_session_t *s)
+ }
+ 
+ 
++static void
++ngx_mail_block_read(ngx_event_t *rev)
++{
++    ngx_log_debug0(NGX_LOG_DEBUG_MAIL, rev->log, 0, "mail block read");
++
++    if (ngx_handle_read_event(rev, 0) != NGX_OK) {
++        ngx_mail_close_connection(rev->data);
++    }
++}
++
++
+ void
+ ngx_mail_close_connection(ngx_connection_t *c)
+ {
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p1.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p1.patch
new file mode 100644
index 0000000000..f392db8050
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p1.patch
@@ -0,0 +1,40 @@
+From df9d8d940ecb83a50b1e55ccc296d0a29cfe774c Mon Sep 17 00:00:00 2001
+From: Vadim Zhestikov <v.zhestikov@f5.com>
+Date: Wed, 4 Nov 2026 09:54:11 -0800
+Subject: [PATCH] Mail: fixed use-after-free on client reset during auth_http
+ request
+
+When a client command starts an auth_http request, the default reply
+set by the POP3, IMAP and SMTP auth state handlers remains in s->out,
+though it is never used: the actual reply depends on the auth_http
+response.  With ngx_mail_send() as the client write handler, the reply
+could be sent before the authentication result was known, and if the
+client reset the connection, the failed send destroyed the session
+while the auth_http connection still referenced it.
+
+The queued reply is now discarded when the auth_http request starts,
+similarly to ngx_mail_proxy_init().
+
+Reported by Xint.io.
+
+CVE: CVE-2026-113425
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/df9d8d940ecb83a50b1e55ccc296d0a29cfe774c]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/mail/ngx_mail_auth_http_module.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/mail/ngx_mail_auth_http_module.c b/src/mail/ngx_mail_auth_http_module.c
+index 3e5095a2d2..ba166cdb26 100644
+--- a/src/mail/ngx_mail_auth_http_module.c
++++ b/src/mail/ngx_mail_auth_http_module.c
+@@ -216,6 +216,8 @@ ngx_mail_auth_http_init(ngx_mail_session_t *s)
+     ctx->peer.connection->data = s;
+     ctx->peer.connection->pool = s->connection->pool;
+ 
++    s->out.len = 0;
++
+     s->connection->read->handler = ngx_mail_auth_http_block_read;
+     ctx->peer.connection->read->handler = ngx_mail_auth_http_read_handler;
+     ctx->peer.connection->write->handler = ngx_mail_auth_http_write_handler;
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p2.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p2.patch
new file mode 100644
index 0000000000..c9f5b6247c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p2.patch
@@ -0,0 +1,83 @@
+From e2d23d45fa93ed236a9cdedcb54271e0a064c4f3 Mon Sep 17 00:00:00 2001
+From: Vadim Zhestikov <v.zhestikov@f5.com>
+Date: Wed, 4 Nov 2026 09:54:11 -0800
+Subject: [PATCH] Mail: blocked client writes while waiting for auth_http
+ response
+
+While waiting for the auth_http response, the client read handler is
+ngx_mail_auth_http_block_read(), but the write handler was left as
+ngx_mail_send(), so a client write event during the wait was handled
+by a function which can close the client connection, destroying the
+session while the auth_http connection still referenced it.
+
+The client write handler is now blocked while waiting for the auth_http
+response, with proper cleanup on errors, and restored right after the
+auth_http connection is closed.
+
+CVE: CVE-2026-113425
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/e2d23d45fa93ed236a9cdedcb54271e0a064c4f3]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/mail/ngx_mail_auth_http_module.c | 27 +++++++++++++++++++++++++++
+ 1 file changed, 27 insertions(+)
+
+diff --git a/src/mail/ngx_mail_auth_http_module.c b/src/mail/ngx_mail_auth_http_module.c
+index ba166cdb26..130ee37d2d 100644
+--- a/src/mail/ngx_mail_auth_http_module.c
++++ b/src/mail/ngx_mail_auth_http_module.c
+@@ -70,6 +70,7 @@ static void ngx_mail_auth_sleep_handler(ngx_event_t *rev);
+ static ngx_int_t ngx_mail_auth_http_parse_header_line(ngx_mail_session_t *s,
+     ngx_mail_auth_http_ctx_t *ctx);
+ static void ngx_mail_auth_http_block_read(ngx_event_t *rev);
++static void ngx_mail_auth_http_block_write(ngx_event_t *wev);
+ static void ngx_mail_auth_http_dummy_handler(ngx_event_t *ev);
+ static ngx_buf_t *ngx_mail_auth_http_create_request(ngx_mail_session_t *s,
+     ngx_pool_t *pool, ngx_mail_auth_http_conf_t *ahcf);
+@@ -219,6 +220,7 @@ ngx_mail_auth_http_init(ngx_mail_session_t *s)
+     s->out.len = 0;
+ 
+     s->connection->read->handler = ngx_mail_auth_http_block_read;
++    s->connection->write->handler = ngx_mail_auth_http_block_write;
+     ctx->peer.connection->read->handler = ngx_mail_auth_http_read_handler;
+     ctx->peer.connection->write->handler = ngx_mail_auth_http_write_handler;
+ 
+@@ -690,6 +692,8 @@ ngx_mail_auth_http_process_headers(ngx_mail_session_t *s,
+ 
+             ngx_close_connection(ctx->peer.connection);
+ 
++            s->connection->write->handler = ngx_mail_send;
++
+             if (ctx->err.len) {
+ 
+                 ngx_log_error(NGX_LOG_INFO, s->connection->log, 0,
+@@ -1122,6 +1126,29 @@ ngx_mail_auth_http_block_read(ngx_event_t *rev)
+ }
+ 
+ 
++static void
++ngx_mail_auth_http_block_write(ngx_event_t *wev)
++{
++    ngx_connection_t          *c;
++    ngx_mail_session_t        *s;
++    ngx_mail_auth_http_ctx_t  *ctx;
++
++    ngx_log_debug0(NGX_LOG_DEBUG_MAIL, wev->log, 0,
++                   "mail auth http block write");
++
++    if (ngx_handle_write_event(wev, 0) != NGX_OK) {
++        c = wev->data;
++        s = c->data;
++
++        ctx = ngx_mail_get_module_ctx(s, ngx_mail_auth_http_module);
++
++        ngx_close_connection(ctx->peer.connection);
++        ngx_destroy_pool(ctx->pool);
++        ngx_mail_session_internal_server_error(s);
++    }
++}
++
++
+ static void
+ ngx_mail_auth_http_dummy_handler(ngx_event_t *ev)
+ {
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p3.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p3.patch
new file mode 100644
index 0000000000..786dbaf152
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p3.patch
@@ -0,0 +1,67 @@
+From 5deda780a9d5d1bcd5c6731d3118fa090ae900cc Mon Sep 17 00:00:00 2001
+From: Vadim Zhestikov <v.zhestikov@f5.com>
+Date: Wed, 4 Nov 2026 09:54:11 -0800
+Subject: [PATCH] Mail: blocked client writes while connecting to upstream
+
+While connecting to the upstream and reading its greeting, the client
+read handler is ngx_mail_proxy_block_read(), but the client write
+handler was left as it was.  If ngx_handle_write_event() failed in it,
+the client connection was closed without the upstream one, and the next
+upstream event accessed the freed session.
+
+The client write handler is now ngx_mail_proxy_block_write(), which
+closes both connections on errors the same way
+ngx_mail_proxy_block_read() does.
+
+CVE: CVE-2026-113425
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/5deda780a9d5d1bcd5c6731d3118fa090ae900cc]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/mail/ngx_mail_proxy_module.c | 19 +++++++++++++++++++
+ 1 file changed, 19 insertions(+)
+
+diff --git a/src/mail/ngx_mail_proxy_module.c b/src/mail/ngx_mail_proxy_module.c
+index aa3baeb7e3..b3560e21fa 100644
+--- a/src/mail/ngx_mail_proxy_module.c
++++ b/src/mail/ngx_mail_proxy_module.c
+@@ -24,6 +24,7 @@ typedef struct {
+ 
+ 
+ static void ngx_mail_proxy_block_read(ngx_event_t *rev);
++static void ngx_mail_proxy_block_write(ngx_event_t *wev);
+ static void ngx_mail_proxy_pop3_handler(ngx_event_t *rev);
+ static void ngx_mail_proxy_imap_handler(ngx_event_t *rev);
+ static void ngx_mail_proxy_smtp_handler(ngx_event_t *rev);
+@@ -165,6 +166,7 @@ ngx_mail_proxy_init(ngx_mail_session_t *s, ngx_addr_t *peer)
+     p->upstream.connection->pool = s->connection->pool;
+ 
+     s->connection->read->handler = ngx_mail_proxy_block_read;
++    s->connection->write->handler = ngx_mail_proxy_block_write;
+     p->upstream.connection->write->handler = ngx_mail_proxy_write_handler;
+ 
+     pcf = ngx_mail_get_module_srv_conf(s, ngx_mail_proxy_module);
+@@ -223,6 +225,23 @@ ngx_mail_proxy_block_read(ngx_event_t *rev)
+ }
+ 
+ 
++static void
++ngx_mail_proxy_block_write(ngx_event_t *wev)
++{
++    ngx_connection_t    *c;
++    ngx_mail_session_t  *s;
++
++    ngx_log_debug0(NGX_LOG_DEBUG_MAIL, wev->log, 0, "mail proxy block write");
++
++    if (ngx_handle_write_event(wev, 0) != NGX_OK) {
++        c = wev->data;
++        s = c->data;
++
++        ngx_mail_proxy_close_session(s);
++    }
++}
++
++
+ static void
+ ngx_mail_proxy_pop3_handler(ngx_event_t *rev)
+ {
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p4.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p4.patch
new file mode 100644
index 0000000000..45d91ae012
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-113425_p4.patch
@@ -0,0 +1,112 @@
+From 4c5ace9f1d5419334a2e6772a0885ee7ed3d6e91 Mon Sep 17 00:00:00 2001
+From: Vadim Zhestikov <v.zhestikov@f5.com>
+Date: Wed, 4 Nov 2026 09:54:11 -0800
+Subject: [PATCH] Mail: blocked client writes while resolving SMTP client
+
+While the SMTP client address and name are being resolved, the client
+read handler is ngx_mail_smtp_block_reading(), but the client write
+handler was ngx_mail_send().  If ngx_handle_write_event() failed in it,
+the client connection was closed, but the resolver context was not
+cancelled, and the resolver handler accessed the freed session when the
+resolving completed or timed out.
+
+The client write handler is now ngx_mail_smtp_block_writing(), which
+cancels the resolver context on errors the same way
+ngx_mail_smtp_block_reading() does.  ngx_mail_send() is restored in
+ngx_mail_smtp_greeting(), which is also needed with smtp_greeting_delay,
+where the error is sent without s->quit, and in
+ngx_mail_smtp_resolve_addr_handler() before the posted name resolving,
+where s->resolver_ctx still points to a context which is already done.
+
+CVE: CVE-2026-113425
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/4c5ace9f1d5419334a2e6772a0885ee7ed3d6e91]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/mail/ngx_mail_smtp_handler.c | 38 ++++++++++++++++++++++++++++++++
+ 1 file changed, 38 insertions(+)
+
+diff --git a/src/mail/ngx_mail_smtp_handler.c b/src/mail/ngx_mail_smtp_handler.c
+index 8158c4fa1f..7cb4eee784 100644
+--- a/src/mail/ngx_mail_smtp_handler.c
++++ b/src/mail/ngx_mail_smtp_handler.c
+@@ -17,6 +17,7 @@ static ngx_int_t ngx_mail_smtp_validate_host(ngx_str_t *name);
+ static void ngx_mail_smtp_resolve_name(ngx_event_t *rev);
+ static void ngx_mail_smtp_resolve_name_handler(ngx_resolver_ctx_t *ctx);
+ static void ngx_mail_smtp_block_reading(ngx_event_t *rev);
++static void ngx_mail_smtp_block_writing(ngx_event_t *wev);
+ static void ngx_mail_smtp_greeting(ngx_mail_session_t *s, ngx_connection_t *c);
+ static void ngx_mail_smtp_invalid_pipelining(ngx_event_t *rev);
+ static ngx_int_t ngx_mail_smtp_create_buffer(ngx_mail_session_t *s,
+@@ -92,6 +93,7 @@ ngx_mail_smtp_init_session(ngx_mail_session_t *s, ngx_connection_t *c)
+ 
+     s->resolver_ctx = ctx;
+     c->read->handler = ngx_mail_smtp_block_reading;
++    c->write->handler = ngx_mail_smtp_block_writing;
+ 
+     if (ngx_resolve_addr(ctx) != NGX_OK) {
+         ngx_mail_close_connection(c);
+@@ -159,6 +161,7 @@ ngx_mail_smtp_resolve_addr_handler(ngx_resolver_ctx_t *ctx)
+                    "address resolved: %V", &s->host);
+ 
+     c->read->handler = ngx_mail_smtp_resolve_name;
++    c->write->handler = ngx_mail_send;
+ 
+     ngx_post_event(c->read, &ngx_posted_events);
+ }
+@@ -220,6 +223,7 @@ ngx_mail_smtp_resolve_name(ngx_event_t *rev)
+ 
+     s->resolver_ctx = ctx;
+     c->read->handler = ngx_mail_smtp_block_reading;
++    c->write->handler = ngx_mail_smtp_block_writing;
+ 
+     if (ngx_resolve_name(ctx) != NGX_OK) {
+         ngx_mail_close_connection(c);
+@@ -322,6 +326,38 @@ ngx_mail_smtp_block_reading(ngx_event_t *rev)
+ }
+ 
+ 
++static void
++ngx_mail_smtp_block_writing(ngx_event_t *wev)
++{
++    ngx_connection_t    *c;
++    ngx_mail_session_t  *s;
++    ngx_resolver_ctx_t  *ctx;
++
++    c = wev->data;
++    s = c->data;
++
++    ngx_log_debug0(NGX_LOG_DEBUG_MAIL, c->log, 0, "smtp writing blocked");
++
++    if (ngx_handle_write_event(wev, 0) != NGX_OK) {
++
++        if (s->resolver_ctx) {
++            ctx = s->resolver_ctx;
++
++            if (ctx->handler == ngx_mail_smtp_resolve_addr_handler) {
++                ngx_resolve_addr_done(ctx);
++
++            } else if (ctx->handler == ngx_mail_smtp_resolve_name_handler) {
++                ngx_resolve_name_done(ctx);
++            }
++
++            s->resolver_ctx = NULL;
++        }
++
++        ngx_mail_close_connection(c);
++    }
++}
++
++
+ static void
+ ngx_mail_smtp_greeting(ngx_mail_session_t *s, ngx_connection_t *c)
+ {
+@@ -347,6 +383,8 @@ ngx_mail_smtp_greeting(ngx_mail_session_t *s, ngx_connection_t *c)
+         ngx_post_event(c->read, &ngx_posted_events);
+     }
+ 
++    c->write->handler = ngx_mail_send;
++
+     if (sscf->greeting_delay) {
+          c->read->handler = ngx_mail_smtp_invalid_pipelining;
+          return;
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index a7b628d6b3..a84c01bee5 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -28,6 +28,11 @@ SRC_URI:append = " \
     file://CVE-2026-123634-dependent.patch \
     file://CVE-2026-123634.patch \
     file://CVE-2026-123007.patch \
+    file://CVE-2026-113425-dependent.patch \
+    file://CVE-2026-113425_p1.patch \
+    file://CVE-2026-113425_p2.patch \
+    file://CVE-2026-113425_p3.patch \
+    file://CVE-2026-113425_p4.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index a2d09a7a78..0e05ccc6bd 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -28,6 +28,11 @@ SRC_URI:append = " \
     file://CVE-2026-123634-dependent.patch \
     file://CVE-2026-123634.patch \
     file://CVE-2026-123007.patch \
+    file://CVE-2026-113425-dependent.patch \
+    file://CVE-2026-113425_p1.patch \
+    file://CVE-2026-113425_p2.patch \
+    file://CVE-2026-113425_p3.patch \
+    file://CVE-2026-113425_p4.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

