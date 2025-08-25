Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2766CA0EFA
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 13:19:28 +0000 (UTC)
Received: from mta-65-228.siemens.flowmailer.net (mta-65-228.siemens.flowmailer.net [185.136.65.228])
 by mx.groups.io with SMTP id smtpd.web11.38851.1756127960345106393
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Aug 2025 06:19:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=GIbRPRss;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.228, mailfrom: fm-256628-20250825131918eb264b5680fe3c880b-9ey2xo@rts-flowmailer.siemens.com)
Received: by mta-65-228.siemens.flowmailer.net with ESMTPSA id 20250825131918eb264b5680fe3c880b
        for <openembedded-devel@lists.openembedded.org>;
        Mon, 25 Aug 2025 15:19:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=8uDZZft3OQgOF90eJtC21BChOJkJKvJjtgSzjkmaQtc=;
 b=GIbRPRssWZJEHpFBZPGkZkR36Xrr+7U8J5aViRAaNadzVT3W5OZ35dXyOtbkqtlDSDHO6h
 XeAOc2ajdWURDIrga19q46l16ssJUmVKuIfJ9Qsv8cMAPeUeWJ/JP22SSOZWnf+4easpdQup
 igjb2MM++uzCJRRcSKd9Ef4AG5t8588VacqhIrpXZYShhns8HobmcqqF8x/9DUgpmU6tVBIP
 lj5O8+76Ya8O0Sby1f4LXthi7+8dQDwvDlD3w9LFfedUVugcy0/3I9h4DrdeSbh8nbgFHriR
 RLd3w4vbHf2ys65xA5IWALQvduz/grQI3sWl69vuHiIH4ezxOKgfv4BQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-webserver][PATCH 3/3] nginx: patch CVE-2025-53859 in stable
Date: Mon, 25 Aug 2025 15:18:05 +0200
Message-Id: <20250825131805.230223-3-peter.marko@siemens.com>
In-Reply-To: <20250825131805.230223-1-peter.marko@siemens.com>
References: <20250825131805.230223-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Aug 2025 13:19:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119098

From: Peter Marko <peter.marko@siemens.com>

Pick patch from nginx site which is also mentioned in [1].

[1] https://security-tracker.debian.org/tracker/CVE-2025-53859

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../nginx/files/CVE-2025-53859.patch          | 131 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.0.bb       |   1 +
 2 files changed, 132 insertions(+)
 create mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
new file mode 100755
index 0000000000..6f689938f4
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
@@ -0,0 +1,131 @@
+CVE: CVE-2025-53859
+Upstream-Status: Backport [https://nginx.org/download/patch.2025.smtp.txt]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+
+diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
+index 1167df3fb..d3be7f3b3 100644
+--- a/src/mail/ngx_mail_handler.c
++++ b/src/mail/ngx_mail_handler.c
+@@ -523,7 +523,7 @@ ngx_mail_starttls_only(ngx_mail_session_t *s, ngx_connection_t *c)
+ ngx_int_t
+ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+ {
+-    u_char     *p, *last;
++    u_char     *p, *pos, *last;
+     ngx_str_t  *arg, plain;
+ 
+     arg = s->args.elts;
+@@ -555,7 +555,7 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
+-    s->login.data = p;
++    pos = p;
+ 
+     while (p < last && *p) { p++; }
+ 
+@@ -565,7 +565,8 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
+-    s->login.len = p++ - s->login.data;
++    s->login.len = p++ - pos;
++    s->login.data = pos;
+ 
+     s->passwd.len = last - p;
+     s->passwd.data = p;
+@@ -583,24 +584,26 @@ ngx_int_t
+ ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
+     ngx_uint_t n)
+ {
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, login;
+ 
+     arg = s->args.elts;
+ 
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login username: \"%V\"", &arg[n]);
+ 
+-    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
+-    if (s->login.data == NULL) {
++    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
++    if (login.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->login, &arg[n]) != NGX_OK) {
++    if (ngx_decode_base64(&login, &arg[n]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH LOGIN command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->login = login;
++
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login username: \"%V\"", &s->login);
+ 
+@@ -611,7 +614,7 @@ ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
+ ngx_int_t
+ ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
+ {
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, passwd;
+ 
+     arg = s->args.elts;
+ 
+@@ -620,18 +623,19 @@ ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
+                    "mail auth login password: \"%V\"", &arg[0]);
+ #endif
+ 
+-    s->passwd.data = ngx_pnalloc(c->pool,
+-                                 ngx_base64_decoded_length(arg[0].len));
+-    if (s->passwd.data == NULL) {
++    passwd.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
++    if (passwd.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->passwd, &arg[0]) != NGX_OK) {
++    if (ngx_decode_base64(&passwd, &arg[0]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH LOGIN command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->passwd = passwd;
++
+ #if (NGX_DEBUG_MAIL_PASSWD)
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth login password: \"%V\"", &s->passwd);
+@@ -674,24 +678,26 @@ ngx_int_t
+ ngx_mail_auth_cram_md5(ngx_mail_session_t *s, ngx_connection_t *c)
+ {
+     u_char     *p, *last;
+-    ngx_str_t  *arg;
++    ngx_str_t  *arg, login;
+ 
+     arg = s->args.elts;
+ 
+     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
+                    "mail auth cram-md5: \"%V\"", &arg[0]);
+ 
+-    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
+-    if (s->login.data == NULL) {
++    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
++    if (login.data == NULL) {
+         return NGX_ERROR;
+     }
+ 
+-    if (ngx_decode_base64(&s->login, &arg[0]) != NGX_OK) {
++    if (ngx_decode_base64(&login, &arg[0]) != NGX_OK) {
+         ngx_log_error(NGX_LOG_INFO, c->log, 0,
+             "client sent invalid base64 encoding in AUTH CRAM-MD5 command");
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
++    s->login = login;
++
+     p = s->login.data;
+     last = p + s->login.len;
+ 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
index dd585f3714..84fc08b5fb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
@@ -4,3 +4,4 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
 SRC_URI[sha256sum] = "c6b5c6b086c0df9d3ca3ff5e084c1d0ef909e6038279c71c1c3e985f576ff76a"
 
+SRC_URI += "file://CVE-2025-53859.patch"

