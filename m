Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4051EEA3C5D
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 11:22:42 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.129836.1775733756930084517
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 04:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=MSpiAP5W;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c76bde70ec9so321843a12.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 04:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775733756; x=1776338556; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0E+5NPe5QWe2CClN0gn9UN84+uYDhtJF8Z4fHHyOACM=;
        b=MSpiAP5WE+XIqKdLsrX4FmzrEIvnHNQWI4qnoqdKNPx9uyyWLV49zttkKwIrBxXRmY
         pUxpr0liP1yQz8smruEhl+mt8toSsyUK5T/QIiRzSEAEUQRn/1i19UGMPlD6XL9MjAWi
         seN2BslRW0h/CsKcMuOUy6coi/IS9jFKLi2B7bGRPmxpw5rO7ABgP/xRLkXaMSy5mjmg
         Ac8WTgfNbyv/gUBkRgseEFK5UDvm/gLJBScYi+31J85iauDR5jO0f3X51UfX65XCJ/mm
         E+nR9vNim2adAvzIfDCYkPMpDyCV/WhFU4TfmZz2isei62SbLE0kBn98Ui8Hh+BbVvD4
         SW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775733756; x=1776338556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0E+5NPe5QWe2CClN0gn9UN84+uYDhtJF8Z4fHHyOACM=;
        b=EnD8FwMgCH0i5xKUmmc9XujislI1Bi2Z+P8x504hSJL+UaBSoXr1yfvcNU4wUL/2wE
         3Ei4HjuvBCWdzdf2X4TVj5BxvUyeYHifRnZQC6PAAPNdyjT4xaHVyC/ADuIT92maHlJ1
         beabW3IE+223R/hKDnCkYC5NhziB6iSoYGPmi93bgD/pwynO3Flm7QAJE/2srwOL/pUL
         KqeWnfDZCMdq9548/5Ezh9bs+YPpcE8TXIKOxKYy3U+S3HHuTEuKdSt2P7OQr2xgEEAJ
         lbq2Dgu8/gSRbGoQSjVPNKAgx8cgGEwC/pVihpsti/D6vNqXO0hBEk+5F3Ro433ol5hb
         u3Lw==
X-Gm-Message-State: AOJu0YyqGUNmQb7FIzsrkSxdU6lGTxe/bXoOVRZGAVuSBqZgHNf4EgRB
	wb93AHBypWByZfCYLn/oAC3CbaZXi+5aQ7mEuRkMnpPSC107YJAz4rLETDbl1RrF
X-Gm-Gg: AeBDieuWsFY8fGwn5lHdJqiYrEIiTmXHezrrkz3iBOvobzS78BbTQZeXtygjQP5d/z1
	fMNgshi9G8+Y/v2b36hY6+g1P226C0UVAsu8MExw5eUiTqzkzyWEXyOod9vYgNGNTDGQ77GCalI
	gjt4Ey1wx1qI12Djx3OW88cGmkvWtJ4vl8S0Txejm51Rxpkq9g22rfeHkMVPjVGWqZHRC2v+9hW
	T/cECFclWitbLaJ4R2v+ffNuGXB7jpGNBcyx5/rtl48aisCyvlDWDc/tXcvfzFtC/vbNTrS6tzk
	2C1BygKuRzMcLyVwSt+TPIVCYlu/w/I0WJuMNsXLvovStIbIc4b1YJ7XDu6TEoq6c2EyKrAn9rA
	IMU/fhgSGp99ejzmxV/MdLYqzuok2YZ1KBBvWGuP1xk11UjSGAHTl53nGVCjlYjaCAbAzDYG2N6
	f68IG7rBNsxkPhQhZmrKj0PkK8mbYUqCmQonU=
X-Received: by 2002:a05:6a20:1611:b0:398:9794:32ed with SMTP id adf61e73a8af0-39fc80ddc96mr4358613637.12.1775733756130;
        Thu, 09 Apr 2026 04:22:36 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.108.51])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3ccc8sm30046666b3a.19.2026.04.09.04.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 04:22:35 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 7/8] nginx: fix CVE-2026-28753
Date: Thu,  9 Apr 2026 23:22:07 +1200
Message-ID: <20260409112208.1119823-7-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
References: <20260409112208.1119823-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 11:22:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126194

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

As per the advisory[1] mentioned in NVD[2], version 1.28.3 contains the fix.
Backport the commit[3] from 1.28.3 changelog matching the description.

[1] https://my.f5.com/manage/s/article/K000160367
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-28753
[3] https://github.com/nginx/nginx/commit/6a8513761fb327f67fcc6cfcf1ad216887e2589f

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-28753.patch   | 93 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28753.patch

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
index b1f4f8d009..80cd5e1609 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 SRC_URI:append = " file://CVE-2023-44487.patch \
                    file://CVE-2026-27651.patch \
                    file://CVE-2026-27654.patch \
+                   file://CVE-2026-28753.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"

