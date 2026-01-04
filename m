Return-Path: <schonm@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CF3C2A062
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 18:58:25 +0000 (UTC)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48340.1767553100418731764
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jan 2026 10:58:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QjMHyOn4;
 spf=pass (domain: gmail.com, ip: 209.85.128.169, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-78fb7704cb4so92562317b3.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 10:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767553099; x=1768157899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7qGcycNROIq57CsraHJorEjCXLVgjampIdcaDjTkV1U=;
        b=QjMHyOn4S6Y+wXVRcsGvrSu/GkElctRtDC2mwHU56L9yTOKKPjgrsVqCxBvM17aE+g
         L6U23154VRlxr5d59vvfQ+E9GEKtREtOEV1Af1mZVKs3I4FUVeeckke8zV9pVOncn2va
         afYb5ONzk4jsNVc/JJxFVn+CHo+/5OxSaZ+kNi46tpGq750WFkLPRLHfRfcFnW+628bj
         6CThSatKcGKp94bYrQMMgDLSyzVj8Ox5cCEeg+Tpjc/bBmi9DoO/Q8qf8S51tgmesOSD
         BXv9heFsOjOmrC7qf3Wx4bT1AD9whZVK3F3j9wIyfEJ7WEWmo2qnJnJw8+7GO3UjUuI0
         qTaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767553099; x=1768157899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7qGcycNROIq57CsraHJorEjCXLVgjampIdcaDjTkV1U=;
        b=SWtSqhLPYuSaSa7XCEt4Qb7fYk9uMG33snB49lm5Utc3OH6qBBsCUD25UtWgCK3qol
         brHtUPF+2N0j+PNWm4uZHY1gvJ77ee9M10ileehzNKcqbGD0iUfKu/qlA/rspbOtO/4+
         liVrNNU6GFlIVGfCef4gU/JdK4K74Tww5bLTACsKbdYFcnDcX7MeH9r2ZELcwAimDGnu
         WdT3h+finR9w7Gh/8q1iXvFOxj4KNEIuLuUF+kR5gs2X96xazbZJ7HzJEb8vEfsSacJe
         5yMqr5adpbdq4mUaT8HbDxjJbuRoTO/zcTfz38fjqa6qD4A/9bQBPoR06zLXTK+CvirI
         I/4w==
X-Gm-Message-State: AOJu0Yw84fhDCLoVMcDKtmEdNYgYMLak31QcuIKU5l9B1XK9Ji47OAbL
	yCwoSWdJ/f80YnW/u3L5aj9aKWETkn9ZDKjZ8BqpxvNQq3oOO0d55Dp/HQcWW5SQ
X-Gm-Gg: AY/fxX4AfnPKLuap/NRBOvhrof8qK8YULAalIr77UZ/O/FZLOQGqchWmkUn6rt+6CVp
	TMLX9V6CUl9XlZdkthARRkCikACmGLVlKNS8uxbZHYPTvmHgRwTRA29q6LL15MpovytkCBx8/Eo
	wDlp0IUqnMUZ3m4hgxczzKsw6yTkMe8FQOxD2BV8g6JIHRqDrCZXWc5rFZG5XEEG24JCcRJuDNF
	5tx9bZ6DId0yLBfwBBOba97/8DZ6eXi1vLL3EQadTfL12EiK6HMxK1jHwTBa6MGuQsekpJmJdQN
	ELDN63D946ute4KaPFPFSOCpHuvIR/whjVYR3nQ0uR0OYdva+lD+nvTc7WrQv5nM83hDm6Rh5nY
	hG9lxkT//ZCcE+yoUnIHKHtqMylrNxEcuw5lEltWY0qWvJUNjpgPMgy7qfj8IGBoUIdVcvkrNE6
	njuwhMCngJYZGabQJRD8Zz/n2jR4ZfB369FEOWS7v+u0qq/hHJ8a1vLvSwvpiho3VqwuER37gi2
	iGcD01pNDYy+bf24LtowSwGGegBHLSOcSedvuKYx+3Ih9Pr/In/nRKXa3qsGDFJAdYXQtOmugmY
X-Google-Smtp-Source: AGHT+IE2R9pWwuizrCZ4GhXxrckiUD17RiNyrhLtJx7w5gy20vI/yhzTdTNKEjQ5bhdssOsqCQgUNg==
X-Received: by 2002:a05:690c:6310:b0:787:edc1:ce4d with SMTP id 00721157ae682-78fb4006914mr392304067b3.36.1767553099087;
        Sun, 04 Jan 2026 10:58:19 -0800 (PST)
Received: from localhost.localdomain (71-208-41-41.ftmy.qwest.net. [71.208.41.41])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fd48c1e74sm150824437b3.43.2026.01.04.10.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 10:58:18 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] nginx: upgrade 1.28.0 -> 1.28.1
Date: Sun,  4 Jan 2026 13:58:11 -0500
Message-ID: <20260104185811.24006-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 18:58:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123119

Drop CVE patch which has been integrated into this new version.

Solves:
* CVE-2025-53859

CHANGES:
https://nginx.org/en/CHANGES-1.28

Signed-off-by: Jason Schonberg <schonm@gmail.com>
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
-- 
2.43.0


