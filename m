Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20073CCF2DA
	for <webhook@archiver.kernel.org>; Mon, 19 Jan 2026 10:28:10 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.32479.1768818481016942685
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Jan 2026 02:28:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PHldCdN9;
 spf=pass (domain: gmail.com, ip: 209.85.214.170, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a12ed4d205so24737915ad.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 02:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768818480; x=1769423280; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DcFIBh0VCVFNdSCFTqvrw+HFYAgx3fms0T/fbqajzak=;
        b=PHldCdN99K16wyALUo7dfNwuTK9uPv2ys3oAI5XnX2jNYIiPFS/jDVEfMVqaGf6rpG
         ye91icJKxQUnxz4LaM26Xs8oknb4rLkE58AkZsEbWcboEAIbEaMFjoEhgcyzdBK9x7R7
         GBPT1a8EBL6cVALzBma4zZK9onCTxkdphyzw1UN6XoGy0oU+YnLd7Bxu9jQJdb31Zefo
         ax8JE+lkFPdnNoWAow9HUVgFY6s2gee5I2sVThBu3JjhteAiIIrg9tq5edZ/36IVdLr5
         yd6FAJfxy4AdXnQZwk98botQrARJtjUWExp3HxLYQuSaZgnOyMdqXnMfeZTHU3IR3dGc
         RL/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768818480; x=1769423280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DcFIBh0VCVFNdSCFTqvrw+HFYAgx3fms0T/fbqajzak=;
        b=YSRalUK5CTLJY3X/Ib74vtyxHgvDB75fVlH0/nFw1INFurgcjHBEUulQhFcE9fREzS
         1MfZ9vofEBi45zhQSxaWu9DZzcZgkGh9gEZgy71+DSD+BrvCBzBwHe8n27tpNiT9+Z0j
         aefSms1sgsUbJ674lWp/6ek0IOIij9g138epp8NWzMiGEukTIUlpB8pQ75Z7eVzPt6+p
         7gf0y+kBgzJf1LzeSNR6ZqNpIQ/IOFC67kL2MhWaNQw3Ax0ug6+zRbPgTp0/53IrHfD8
         l18fFtB9pZwNydS8vTrsGEM2CVuo11Ib4HciKZxAcWuAiOQlvhrvKaYuF0wpxXjcXcab
         LOMQ==
X-Gm-Message-State: AOJu0Yy1uvEc8ER79pIb4e4TM1JzV+3zEFiACDND1t5KxgyYUwppCQq+
	G0tvKNwH0vrHdjVi5rnzCIU9jthFAM4zUTySeFIhOp41J8jvmMixc9CTqCkJuw==
X-Gm-Gg: AZuq6aKZHHqyDpdRu2cPE99O2cEVG5yYZxsa80CrO4We3c0XBif17oK4YDB2aKQVdTU
	Qz+q/0JuV/C/cUTPNNvO8dDo2/4MWrsRHlGCMO6IEVkRa/XjmzhwoQmM0NsIymCj8Y5tKqlTOOh
	2FGiy77d7nSaKWSVfkMg+woS091OXcN0VfrYnI0XU8o/C18IcLtvrbq03gokt6d/2GKZSsSsdf6
	0AbdaEr7KJjvFCs4rHq6QKaTLpzmKrJVoU9mJatP2VQgLvPHPHgdD9OWs2ylMoHZauIcYWy03jq
	leJWa+4ne77c8bOdyesM1/ogCMsLRRIOl3BKOSxOJD/GM8LZOtNGT/5zKI2RX6h/xt1Y8T5QMov
	CfCqKF4xz+HSzKNMpwJXdiGKeojUb3cpUiqg72TADWJYd0d2Ng/hZVZGwSqifVEZ7c3f1vPIPwe
	WjOttxhSSHyNPAWDlrxm0QL5g=
X-Received: by 2002:a17:903:38cc:b0:295:5668:2f27 with SMTP id d9443c01a7336-2a71885a0c4mr80758595ad.9.1768818480126;
        Mon, 19 Jan 2026 02:28:00 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([147.161.217.27])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941e3b6sm93628465ad.97.2026.01.19.02.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:27:59 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>,
	Khem Raj <raj.khem@gmail.com>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][whinlatter][PATCH 1/3] nginx: upgrade 1.28.0 -> 1.28.1
Date: Mon, 19 Jan 2026 23:27:45 +1300
Message-ID: <20260119102747.125302-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jan 2026 10:28:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123630

From: Jason Schonberg <schonm@gmail.com>

Drop CVE patch which has been integrated into this new version.

Solves:
* CVE-2025-53859

CHANGES:
https://nginx.org/en/CHANGES-1.28

Signed-off-by: Jason Schonberg <schonm@gmail.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 222c6425644a39c9b7757792b47e500ca55f85b0)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nginx/files/CVE-2025-53859.patch          | 131 ------------------
 .../recipes-httpd/nginx/nginx_1.28.0.bb       |   7 -
 .../recipes-httpd/nginx/nginx_1.28.1.bb       |   5 +
 3 files changed, 5 insertions(+), 138 deletions(-)
 delete mode 100755 meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
deleted file mode 100755
index 6f689938f4..0000000000
--- a/meta-webserver/recipes-httpd/nginx/files/CVE-2025-53859.patch
+++ /dev/null
@@ -1,131 +0,0 @@
-CVE: CVE-2025-53859
-Upstream-Status: Backport [https://nginx.org/download/patch.2025.smtp.txt]
-Signed-off-by: Peter Marko <peter.marko@siemens.com>
-
-diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
-index 1167df3fb..d3be7f3b3 100644
---- a/src/mail/ngx_mail_handler.c
-+++ b/src/mail/ngx_mail_handler.c
-@@ -523,7 +523,7 @@ ngx_mail_starttls_only(ngx_mail_session_t *s, ngx_connection_t *c)
- ngx_int_t
- ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
- {
--    u_char     *p, *last;
-+    u_char     *p, *pos, *last;
-     ngx_str_t  *arg, plain;
- 
-     arg = s->args.elts;
-@@ -555,7 +555,7 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
--    s->login.data = p;
-+    pos = p;
- 
-     while (p < last && *p) { p++; }
- 
-@@ -565,7 +565,8 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
--    s->login.len = p++ - s->login.data;
-+    s->login.len = p++ - pos;
-+    s->login.data = pos;
- 
-     s->passwd.len = last - p;
-     s->passwd.data = p;
-@@ -583,24 +584,26 @@ ngx_int_t
- ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
-     ngx_uint_t n)
- {
--    ngx_str_t  *arg;
-+    ngx_str_t  *arg, login;
- 
-     arg = s->args.elts;
- 
-     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
-                    "mail auth login username: \"%V\"", &arg[n]);
- 
--    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
--    if (s->login.data == NULL) {
-+    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
-+    if (login.data == NULL) {
-         return NGX_ERROR;
-     }
- 
--    if (ngx_decode_base64(&s->login, &arg[n]) != NGX_OK) {
-+    if (ngx_decode_base64(&login, &arg[n]) != NGX_OK) {
-         ngx_log_error(NGX_LOG_INFO, c->log, 0,
-             "client sent invalid base64 encoding in AUTH LOGIN command");
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
-+    s->login = login;
-+
-     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
-                    "mail auth login username: \"%V\"", &s->login);
- 
-@@ -611,7 +614,7 @@ ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
- ngx_int_t
- ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
- {
--    ngx_str_t  *arg;
-+    ngx_str_t  *arg, passwd;
- 
-     arg = s->args.elts;
- 
-@@ -620,18 +623,19 @@ ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
-                    "mail auth login password: \"%V\"", &arg[0]);
- #endif
- 
--    s->passwd.data = ngx_pnalloc(c->pool,
--                                 ngx_base64_decoded_length(arg[0].len));
--    if (s->passwd.data == NULL) {
-+    passwd.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
-+    if (passwd.data == NULL) {
-         return NGX_ERROR;
-     }
- 
--    if (ngx_decode_base64(&s->passwd, &arg[0]) != NGX_OK) {
-+    if (ngx_decode_base64(&passwd, &arg[0]) != NGX_OK) {
-         ngx_log_error(NGX_LOG_INFO, c->log, 0,
-             "client sent invalid base64 encoding in AUTH LOGIN command");
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
-+    s->passwd = passwd;
-+
- #if (NGX_DEBUG_MAIL_PASSWD)
-     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
-                    "mail auth login password: \"%V\"", &s->passwd);
-@@ -674,24 +678,26 @@ ngx_int_t
- ngx_mail_auth_cram_md5(ngx_mail_session_t *s, ngx_connection_t *c)
- {
-     u_char     *p, *last;
--    ngx_str_t  *arg;
-+    ngx_str_t  *arg, login;
- 
-     arg = s->args.elts;
- 
-     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
-                    "mail auth cram-md5: \"%V\"", &arg[0]);
- 
--    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
--    if (s->login.data == NULL) {
-+    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
-+    if (login.data == NULL) {
-         return NGX_ERROR;
-     }
- 
--    if (ngx_decode_base64(&s->login, &arg[0]) != NGX_OK) {
-+    if (ngx_decode_base64(&login, &arg[0]) != NGX_OK) {
-         ngx_log_error(NGX_LOG_INFO, c->log, 0,
-             "client sent invalid base64 encoding in AUTH CRAM-MD5 command");
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
-+    s->login = login;
-+
-     p = s->login.data;
-     last = p + s->login.len;
- 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
deleted file mode 100644
index 84fc08b5fb..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.0.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-require nginx.inc
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
-
-SRC_URI[sha256sum] = "c6b5c6b086c0df9d3ca3ff5e084c1d0ef909e6038279c71c1c3e985f576ff76a"
-
-SRC_URI += "file://CVE-2025-53859.patch"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
new file mode 100644
index 0000000000..b34b81b9b2
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.1.bb
@@ -0,0 +1,5 @@
+require nginx.inc
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
+
+SRC_URI[sha256sum] = "40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e"

