Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35BAFF327A7
	for <webhook@archiver.kernel.org>; Tue, 21 Apr 2026 05:58:07 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11882.1776751085575400708
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2026 22:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=FktCY2Jo;
 spf=pass (domain: mvista.com, ip: 74.125.82.41, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12c6df0b9bbso8328503c88.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2026 22:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1776751085; x=1777355885; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ayong8rRCrDHzSQmu4WM/Nf3SKK9/e/gMhNZrUvMT4w=;
        b=FktCY2Jo4NYTuoqaBm+R16japvM8QB0bThhbwxxU93a/iZtmnNcTgow2MRC9WSfIhb
         bEd5jl32wv5QGsOfdRHdcc/SWPsJMGRFt2QpF/KLD6o6LSoJ0QYD33YqBYPUSeZYfF3N
         qEsOMyUzqFUT9HwGWgrfEfZcQDXaAuy0ZQB8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776751085; x=1777355885;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ayong8rRCrDHzSQmu4WM/Nf3SKK9/e/gMhNZrUvMT4w=;
        b=cZNTnM6XNJH3t7s7HhtHL5IwZS4bPACahwOOtiiKHo42D3e140unaZRUCaC7FehgLZ
         LT5CQyRt5gWeR9ZuTx7hQj2XFKjjYF4iOUPc+BjV6YQRVji1UCIJIN851IpfxPzIDNeG
         VjgqYuSfn6TcyAs7XPaoLq7Ylmo06RVWJXxHoVJD9HV+32PqBWHMi9rZn2tZaRCTs33W
         wl1uQnTzdXlWiqQZXsUkVTQHZk2VitEOlCf60npdUBfd7BekTgu79iIAnCwFNOacxBay
         tEKLIcbsCCyb5ujYfBMzkBBssFhV8vW95VOGFngzjw/rcJtC8ykXMhzSR7NOb8WLJ8Us
         BGwA==
X-Gm-Message-State: AOJu0YykTkCKimkQIp9U1QENZAEsr9GfXtSyTNW3X61Nn+WkpSZOtuwT
	lc5OAVaxF9AfaALuPi5HYv9331nz21R3waxWE4QGwrzorx9V2EuhW6uIWJgCCLvQklrjHJyD+4c
	ms/yfQEs=
X-Gm-Gg: AeBDies0YWfwiMOtgDydkyExLonYAwxLCjEw+55XdGuzkI/0Iv9a1QvwL8ejLQbvPI6
	hinPNjdLknOHvunpn8gVVhNrX+7DCz65ZHjqDddjEbErKzK2isjVJQRCISDlXTp5F6WX5uTx0k6
	bXFsfkrLPDRXuDFHMCgeUK8ZXwLFjXasjw79h+MFQ2q6vyGBcDtKmmoFuechtRcMqjGkOLZ36pF
	kv8oGt1kGHYjLddZ6C22EhYO1kI2RUB0JOX/aJqbB3lOAhoaBK1aevoPgOHn9lslpo1PSY8RVqY
	bV+57EJG/iCZ99gZrktMug4QPcJmmwZQxCdGHvjZyb2DKMN6xOO0SwucL1TVlsDynBW/hZZk3fX
	zvK7/xRdELCCppgAgz9/iTKeKOptJMfmModOYZ508gUMHVxAF7n07Odg3QLjcacsWcN0hUd+xBb
	L9AKqc/rlB5XLRM0Ik0zhw92LlFkF1gLCTURHWp8K718VRH/yPyzhT2dUfrw==
X-Received: by 2002:a05:7300:8c9f:b0:2e2:3381:2fba with SMTP id 5a478bee46e88-2e4660475e5mr8744471eec.3.1776751084412;
        Mon, 20 Apr 2026 22:58:04 -0700 (PDT)
Received: from MVIN00013.mvista.com ([150.129.170.136])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ccce440sm17236422eec.14.2026.04.20.22.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 22:58:04 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][kirkstone][PATCH] nginx: fix multiple CVEs
Date: Tue, 21 Apr 2026 11:27:56 +0530
Message-ID: <20260421055757.9383-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 21 Apr 2026 05:58:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126523

Pick up patch from NVD report.

More details :
[1]: https://nvd.nist.gov/vuln/detail/CVE-2026-27651
[2]: https://nvd.nist.gov/vuln/detail/CVE-2026-27654
[3]: https://nvd.nist.gov/vuln/detail/CVE-2026-28753

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-27651.patch   | 34 +++++++
 .../nginx/nginx-1.24.0/CVE-2026-27654.patch   | 81 ++++++++++++++++
 .../nginx/nginx-1.24.0/CVE-2026-28753.patch   | 93 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  3 +
 4 files changed, 211 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
new file mode 100644
index 0000000000..b639b1a158
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27651.patch
@@ -0,0 +1,34 @@
+From 4f32484e99671d107d0d6c27c0c674f528d8c9ca Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Wed, 18 Mar 2026 16:39:37 +0400
+Subject: [PATCH] Mail: fixed clearing s->passwd in auth http requests.
+
+Previously, it was not properly cleared retaining length as part of
+authenticating with CRAM-MD5 and APOP methods that expect to receive
+password in auth response.  This resulted in null pointer dereference
+and worker process crash in subsequent auth attempts with CRAM-MD5.
+
+Reported by Arkadi Vainbrand.
+
+(cherry picked from commit 0f71dd8ea94ab8c123413b2e465be12a35392e9c)
+
+CVE: CVE-2026-27651
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/0f71dd8ea94ab8c123413b2e465be12a35392e9c]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/mail/ngx_mail_auth_http_module.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/mail/ngx_mail_auth_http_module.c b/src/mail/ngx_mail_auth_http_module.c
+index 27f64b92e..d931183ae 100644
+--- a/src/mail/ngx_mail_auth_http_module.c
++++ b/src/mail/ngx_mail_auth_http_module.c
+@@ -1325,7 +1325,7 @@ ngx_mail_auth_http_create_request(ngx_mail_session_t *s, ngx_pool_t *pool,
+         b->last = ngx_cpymem(b->last, "Auth-Salt: ", sizeof("Auth-Salt: ") - 1);
+         b->last = ngx_copy(b->last, s->salt.data, s->salt.len);
+ 
+-        s->passwd.data = NULL;
++        ngx_str_null(&s->passwd);
+     }
+ 
+     b->last = ngx_cpymem(b->last, "Auth-Protocol: ",
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
new file mode 100644
index 0000000000..b85c6621e9
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-27654.patch
@@ -0,0 +1,81 @@
+From be39034fa93a4d44b52de9b7a463754eda56e712 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Mon, 16 Mar 2026 20:13:03 +0400
+Subject: [PATCH] Dav: destination length validation for COPY and MOVE.
+
+Previously, when alias was used in a location with Dav COPY or MOVE
+enabled, and the destination URI was shorter than the alias, integer
+underflow could happen in ngx_http_map_uri_to_path(), which could
+result in heap buffer overwrite, followed by a possible segfault.
+With some implementations of memcpy(), the segfault could be avoided
+and the overwrite could result in a change of the source or destination
+file names to be outside of the location root.
+
+Reported by Calif.io in collaboration with Claude and Anthropic Research.
+
+(cherry picked from commit a1d18284e0a173c4ef2b28425535d0f640ae0a82)
+
+CVE: CVE-2026-27654
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/a1d18284e0a173c4ef2b28425535d0f640ae0a82]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/http/modules/ngx_http_dav_module.c | 39 +++++++++++++++++---------
+ 1 file changed, 26 insertions(+), 13 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_dav_module.c b/src/http/modules/ngx_http_dav_module.c
+index cfb98929e..4619b139a 100644
+--- a/src/http/modules/ngx_http_dav_module.c
++++ b/src/http/modules/ngx_http_dav_module.c
+@@ -535,19 +535,20 @@ ngx_http_dav_mkcol_handler(ngx_http_request_t *r, ngx_http_dav_loc_conf_t *dlcf)
+ static ngx_int_t
+ ngx_http_dav_copy_move_handler(ngx_http_request_t *r)
+ {
+-    u_char                   *p, *host, *last, ch;
+-    size_t                    len, root;
+-    ngx_err_t                 err;
+-    ngx_int_t                 rc, depth;
+-    ngx_uint_t                overwrite, slash, dir, flags;
+-    ngx_str_t                 path, uri, duri, args;
+-    ngx_tree_ctx_t            tree;
+-    ngx_copy_file_t           cf;
+-    ngx_file_info_t           fi;
+-    ngx_table_elt_t          *dest, *over;
+-    ngx_ext_rename_file_t     ext;
+-    ngx_http_dav_copy_ctx_t   copy;
+-    ngx_http_dav_loc_conf_t  *dlcf;
++    u_char                    *p, *host, *last, ch;
++    size_t                     len, root;
++    ngx_err_t                  err;
++    ngx_int_t                  rc, depth;
++    ngx_uint_t                 overwrite, slash, dir, flags;
++    ngx_str_t                  path, uri, duri, args;
++    ngx_tree_ctx_t             tree;
++    ngx_copy_file_t            cf;
++    ngx_file_info_t            fi;
++    ngx_table_elt_t           *dest, *over;
++    ngx_ext_rename_file_t      ext;
++    ngx_http_dav_copy_ctx_t    copy;
++    ngx_http_dav_loc_conf_t   *dlcf;
++    ngx_http_core_loc_conf_t  *clcf;
+ 
+     if (r->headers_in.content_length_n > 0 || r->headers_in.chunked) {
+         ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
+@@ -644,6 +645,18 @@ destination_done:
+         return NGX_HTTP_CONFLICT;
+     }
+ 
++    clcf = ngx_http_get_module_loc_conf(r, ngx_http_core_module);
++
++    if (clcf->alias
++        && clcf->alias != NGX_MAX_SIZE_T_VALUE
++        && duri.len < clcf->alias)
++    {
++        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                      "client sent invalid \"Destination\" header: \"%V\"",
++                      &dest->value);
++        return NGX_HTTP_BAD_REQUEST;
++    }
++
+     depth = ngx_http_dav_depth(r, NGX_HTTP_DAV_INFINITY_DEPTH);
+ 
+     if (depth != NGX_HTTP_DAV_INFINITY_DEPTH) {
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch
new file mode 100644
index 0000000000..de27ffad2a
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch
@@ -0,0 +1,93 @@
+From 7e705808a8568a091a8ecf418ed9f77914304fcc Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 26 Feb 2026 11:52:53 +0400
+Subject: [PATCH] Mail: host validation.
+
+Now host name resolved from client address is validated to only contain
+the characters specified in RFC 1034, Section 3.5.  The validation allows
+to avoid injections when using the resolved host name in auth_http and
+smtp proxy.
+
+Reported by Asim Viladi Oglu Manizada, Colin Warren,
+Xiao Liu (Yunnan University), Yuan Tan (UC Riverside), and
+Bird Liu (Lanzhou University).
+
+(cherry picked from commit 6a8513761fb327f67fcc6cfcf1ad216887e2589f)
+
+CVE: CVE-2026-28753
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/6a8513761fb327f67fcc6cfcf1ad216887e2589f]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/mail/ngx_mail_smtp_handler.c | 45 ++++++++++++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+
+diff --git a/src/mail/ngx_mail_smtp_handler.c b/src/mail/ngx_mail_smtp_handler.c
+index e68ceedfd..e477741c8 100644
+--- a/src/mail/ngx_mail_smtp_handler.c
++++ b/src/mail/ngx_mail_smtp_handler.c
+@@ -13,6 +13,7 @@
+ 
+ 
+ static void ngx_mail_smtp_resolve_addr_handler(ngx_resolver_ctx_t *ctx);
++static ngx_int_t ngx_mail_smtp_validate_host(ngx_str_t *name);
+ static void ngx_mail_smtp_resolve_name(ngx_event_t *rev);
+ static void ngx_mail_smtp_resolve_name_handler(ngx_resolver_ctx_t *ctx);
+ static void ngx_mail_smtp_block_reading(ngx_event_t *rev);
+@@ -127,6 +128,20 @@ ngx_mail_smtp_resolve_addr_handler(ngx_resolver_ctx_t *ctx)
+         return;
+     }
+ 
++    if (ngx_mail_smtp_validate_host(&ctx->name) != NGX_OK) {
++        ngx_log_error(NGX_LOG_ERR, c->log, 0,
++                      "%V resolved to invalid host name \"%V\"",
++                      &c->addr_text, &ctx->name);
++
++        s->host = smtp_tempunavail;
++
++        ngx_resolve_addr_done(ctx);
++
++        ngx_mail_smtp_greeting(s, s->connection);
++
++        return;
++    }
++
+     c->log->action = "in resolving client hostname";
+ 
+     s->host.data = ngx_pstrdup(c->pool, &ctx->name);
+@@ -149,6 +164,36 @@ ngx_mail_smtp_resolve_addr_handler(ngx_resolver_ctx_t *ctx)
+ }
+ 
+ 
++static ngx_int_t
++ngx_mail_smtp_validate_host(ngx_str_t *name)
++{
++    u_char      ch;
++    ngx_uint_t  i;
++
++    if (name->len == 0) {
++        return NGX_DECLINED;
++    }
++
++    for (i = 0; i < name->len; i++) {
++        ch = name->data[i];
++
++        /* allow only characters from RFC 1034, Section 3.5 */
++
++        if ((ch >= 'a' && ch <= 'z')
++            || (ch >= 'A' && ch <= 'Z')
++            || (ch >= '0' && ch <= '9')
++            || ch == '-' || ch == '.')
++        {
++            continue;
++        }
++
++        return NGX_DECLINED;
++    }
++
++    return NGX_OK;
++}
++
++
+ static void
+ ngx_mail_smtp_resolve_name(ngx_event_t *rev)
+ {
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index c843b67975..a8bbfae9f5 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -5,6 +5,9 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 SRC_URI:append = " \
 		  file://CVE-2026-27784.patch \
 		  file://CVE-2026-28755.patch \
+		  file://CVE-2026-27651.patch \
+		  file://CVE-2026-27654.patch \
+		  file://CVE-2026-28753.patch \
 		"
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
-- 
2.50.1


