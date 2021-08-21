Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web12.2161.1629573747218246829
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 21 Aug 2021 12:22:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iSqF5N+Q;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id o10so7901174plg.0
        for <openembedded-devel@lists.openembedded.org>; Sat, 21 Aug 2021 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMe0zjn6PA/vevnLQVXsTXmJS2bi5fuCwo7L0HJ+lww=;
        b=iSqF5N+QHFZlSTTdVeHDxYQw8UuZdcMFO7GSf4EM6BxolhIzD9HiwfocGdWTPBQvGs
         ZdqqQkjMvUCAy4+hMPkkwdZOvU8giRsQ3FyCA1xBauLF8wo4osoj/8PkeL3vgEPx4MrN
         BerSYdOkeem8SYRFvpcO0f+33pKqRdMOEznrUNikzYal4tofycPzFi5lFHaqBw78bcOm
         EO1tRBpsMGGbvQc4+L5QsyOgNJFB1y9lsaueTmtPuV4X00y7Xn2rXYJg3UojtaF1DJk1
         dMqzlOca1uloakOLFu7gpw8vsZ5StjebA7dShdZ7d5xpYYEYpnhGeWJE+2CO8XtjCWe/
         50wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=aMe0zjn6PA/vevnLQVXsTXmJS2bi5fuCwo7L0HJ+lww=;
        b=XIpbI7WikbLbBGtdqSd1C7T0hkV0KCZtgifzKRMO7nXIfQ3FDZix/x+Em0qrbR6ECt
         SNLa1Mvd3eJaHSAkQo3QlTXb8plrH4UHkrP+c9c5DM+nDW1ZXLnpcQ3xJqt0HCdoUoVg
         H4OObors2IsRrtCyrYv31DUnXSm/Je5uyvylswPzmrBs6tAuugTcLeEMwdjDto5cHLCQ
         fij0bAt1YOogqizpXXwS7mh0YqaujOvTfXANWy/BZHckuR7HCSdpHZ3B/Fd5ClYe43QQ
         +2H7eyjdzFALOsrMqgI9stLldm+tnKKwmIFasLvq9M1+AWgyb4VYYT22jpzguaM27Cou
         0Zxg==
X-Gm-Message-State: AOAM531kl72aRnK9+TBNF0+MBI+fK0jzKiaqeVZtQYiUsirb1W6IODgO
	ekZ6p2IjuLXIx/apVAFSSiV4xBNeOyA=
X-Google-Smtp-Source: ABdhPJybVOhoXwACVSCrhCEfrXZZRqjSn6lSqCUNVud9eRRyYyEKaW6w6IhlWAzTq0j5Q/uge0u8Bg==
X-Received: by 2002:a17:902:9b87:b029:12c:c3ed:8a1d with SMTP id y7-20020a1709029b87b029012cc3ed8a1dmr21485373plp.7.1629573746541;
        Sat, 21 Aug 2021 12:22:26 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.caveonetworks.com ([2601:202:4180:a5c0:43c0:2d24:85b:da13])
        by smtp.gmail.com with ESMTPSA id i1sm15280230pjs.31.2021.08.21.12.22.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 12:22:26 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Joe Slater <joe.slater@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][dunfell][PATCH] nginx: fix CVE-2021-3618
Date: Sat, 21 Aug 2021 12:22:24 -0700
Message-Id: <20210821192224.3764987-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Source: meta-openembedded.ort
MR: 112731
Type: Security Fix
Disposition: Backport from https://git.openembedded.org/meta-openembedded/commit/meta-webserver/recipes-httpd/nginx?id=f92dbcc4c2723e6ff4e308c8a2e6dc228a6cd7d5
ChangeID: dd3295b606d73e01dd09291d85d529dea17a1a9e
Description:

Backport with no change a patch from version 1.21.0.  This patch
was not cherry-picked by nginx to version 1.20.1.

Information about this CVE comes from
https://ubuntu.com/security/CVE-2021-3618.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit f92dbcc4c2723e6ff4e308c8a2e6dc228a6cd7d5)
[refesh patch for Dunfell context]
Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 .../nginx/files/CVE-2021-3618.patch           | 89 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
new file mode 100644
index 0000000000..3fab8bac6c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2021-3618.patch
@@ -0,0 +1,89 @@
+From 6dafcdebde58577f4fcb190be46a0eb910cf1b96 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Wed, 19 May 2021 03:13:31 +0300
+Subject: [PATCH 1/1] Mail: max_errors directive.
+
+Similarly to smtpd_hard_error_limit in Postfix and smtp_max_unknown_commands
+in Exim, specifies the number of errors after which the connection is closed.
+Index: nginx-1.16.1/src/mail/ngx_mail.h
+===================================================================
+--- nginx-1.16.1.orig/src/mail/ngx_mail.h
++++ nginx-1.16.1/src/mail/ngx_mail.h
+@@ -113,6 +113,8 @@ typedef struct {
+     ngx_msec_t              timeout;
+     ngx_msec_t              resolver_timeout;
+ 
++    ngx_uint_t              max_errors;
++
+     ngx_str_t               server_name;
+ 
+     u_char                 *file_name;
+@@ -225,6 +227,7 @@ typedef struct {
+     ngx_uint_t              command;
+     ngx_array_t             args;
+ 
++    ngx_uint_t              errors;
+     ngx_uint_t              login_attempt;
+ 
+     /* used to parse POP3/IMAP/SMTP command */
+Index: nginx-1.16.1/src/mail/ngx_mail_core_module.c
+===================================================================
+--- nginx-1.16.1.orig/src/mail/ngx_mail_core_module.c
++++ nginx-1.16.1/src/mail/ngx_mail_core_module.c
+@@ -85,6 +85,13 @@ static ngx_command_t  ngx_mail_core_comm
+       offsetof(ngx_mail_core_srv_conf_t, resolver_timeout),
+       NULL },
+ 
++    { ngx_string("max_errors"),
++      NGX_MAIL_MAIN_CONF|NGX_MAIL_SRV_CONF|NGX_CONF_TAKE1,
++      ngx_conf_set_num_slot,
++      NGX_MAIL_SRV_CONF_OFFSET,
++      offsetof(ngx_mail_core_srv_conf_t, max_errors),
++      NULL },
++
+       ngx_null_command
+ };
+ 
+@@ -163,6 +170,8 @@ ngx_mail_core_create_srv_conf(ngx_conf_t
+     cscf->timeout = NGX_CONF_UNSET_MSEC;
+     cscf->resolver_timeout = NGX_CONF_UNSET_MSEC;
+ 
++    cscf->max_errors = NGX_CONF_UNSET_UINT;
++
+     cscf->resolver = NGX_CONF_UNSET_PTR;
+ 
+     cscf->file_name = cf->conf_file->file.name.data;
+@@ -182,6 +191,7 @@ ngx_mail_core_merge_srv_conf(ngx_conf_t
+     ngx_conf_merge_msec_value(conf->resolver_timeout, prev->resolver_timeout,
+                               30000);
+ 
++    ngx_conf_merge_uint_value(conf->max_errors, prev->max_errors, 5);
+ 
+     ngx_conf_merge_str_value(conf->server_name, prev->server_name, "");
+ 
+Index: nginx-1.16.1/src/mail/ngx_mail_handler.c
+===================================================================
+--- nginx-1.16.1.orig/src/mail/ngx_mail_handler.c
++++ nginx-1.16.1/src/mail/ngx_mail_handler.c
+@@ -753,7 +753,20 @@ ngx_mail_read_command(ngx_mail_session_t
+         return NGX_MAIL_PARSE_INVALID_COMMAND;
+     }
+ 
+-    if (rc == NGX_IMAP_NEXT || rc == NGX_MAIL_PARSE_INVALID_COMMAND) {
++    if (rc == NGX_MAIL_PARSE_INVALID_COMMAND) {
++
++        s->errors++;
++
++        if (s->errors >= cscf->max_errors) {
++            ngx_log_error(NGX_LOG_INFO, c->log, 0,
++                          "client sent too many invalid commands");
++            s->quit = 1;
++        }
++
++        return rc;
++    }
++
++    if (rc == NGX_IMAP_NEXT) {
+         return rc;
+     }
+ 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index a4583ed8f8..903a62b3d7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
     file://CVE-2021-23017.patch \
+    file://CVE-2021-3618.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd
-- 
2.25.1

