Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF1BEC4707B
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 20:08:47 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.3955.1704917321995723499
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Jan 2024 12:08:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eUP3+kaL;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-40e5afc18f5so3784745e9.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 12:08:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704917320; x=1705522120; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bsJPx9Q+nn+6b7UO3f7w17rRG95T5ZYDD5/Hi6B3c7Y=;
        b=eUP3+kaLnvzf40t/BOUP7LBvDZIhIX9sEZjhPtQQNiEfEm275kfcuyq4AKQNTmNq2v
         vWoZW2o2Ct6SjfU4FAJM57+gi6zYrwUIU+ZvZhd6ssnb4/YFYIgprvJKRMCORwkHEp/x
         Xb9Il3rEV1cb3XOAz3C8M4hlz1yjQKlD2rqEG4m4UyQZbz/ds/+3nmEIPk2nT8e3Kido
         DjNQTBhWaClGZrM3YU/zS1/Ai09QUNABFaRntIdrwF7bmS21ttwBEmE19uAbFfqGRWcX
         FUu3U5NyZivI8kIhsiABzVOsBji0+Mpbaa8QS+SO/3pi9vV/cwz9rt2Knkzy+ihiIEHV
         txhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704917320; x=1705522120;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsJPx9Q+nn+6b7UO3f7w17rRG95T5ZYDD5/Hi6B3c7Y=;
        b=c/+hdaEo1zFr7Vuly2DdM3l8Y9C64h7JJx8oFXYtYdfnZv51nFS8kqdnqzC+7uuHDl
         lx09k5EhUN6pc09p8LnAfDUxS9WZGrX8/3CRkCaStqMgHREskQv+JE/eCzTCHuZKDMPo
         fFBuCH4O64gBaRzFOas3oiedS0ANpxGvNDJmPSU6lAtR5cwiCs/sIcr/A72kQGV96tLW
         U8Ex0DGpq8a0eGVoiqdP6EdBNSyOu8kS3Q651MAmTmshQB9nVFfOjuOriVF5ubVuKGUi
         M8lOEORE96rCpGHPK5aVg5wpUlxDjlVulEW01jM2UTFLHduCw5Pk0nc2Cg75Gkg75FiH
         iqaw==
X-Gm-Message-State: AOJu0YwbuLtX9gjxVi+sY7IiUJ0yBd18yroDNaytXd+SNi6cLoLAZH7H
	RIQn4AiBJLAWW43Vt4VF841Zco2Q2SHEfQ==
X-Google-Smtp-Source: AGHT+IE1T/dIuG815uQUoFXGNLaW7+jPY0F+KQY31ZR23ACrD4hJRnlttePuwKsBRPARP3Cpu8Putg==
X-Received: by 2002:a5d:6e81:0:b0:336:d8c3:a65c with SMTP id k1-20020a5d6e81000000b00336d8c3a65cmr12533wrz.36.1704917319562;
        Wed, 10 Jan 2024 12:08:39 -0800 (PST)
Received: from localhost.localdomain ([176.33.64.25])
        by smtp.gmail.com with ESMTPSA id cr8-20020a05600004e800b00336673a4153sm5595306wrb.80.2024.01.10.12.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 12:08:38 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-webserver][PATCH] nginx: fix CVE-2023-44487
Date: Wed, 10 Jan 2024 23:08:24 +0300
Message-Id: <20240110200824.225021-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Jan 2024 20:08:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108218

Upstream-Status: Backport from [https://github.com/nginx/nginx/commit/6ceef192e7af1c507826ac38a2d43f08bf265fb9]
CVE: CVE-2023-44487

WARNING: nginx-1.24.0-r0 do_cve_check: Found unpatched CVE (CVE-2023-44487)

This vulnerability exists between the following versions -> From(including) 1.9.5 Up to(including) 1.25.2

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../nginx/files/CVE-2023-44487.patch          | 76 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  2 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
new file mode 100644
index 000000000..4e006b5db
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
@@ -0,0 +1,76 @@
+From 6ceef192e7af1c507826ac38a2d43f08bf265fb9 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Wed, 10 Jan 2024 18:52:11 +0000
+Subject: [PATCH] HTTP/2: per-iteration stream handling limit.
+
+To ensure that attempts to flood servers with many streams are detected
+early, a limit of no more than 2 * max_concurrent_streams new streams per one
+event loop iteration was introduced.  This limit is applied even if
+max_concurrent_streams is not yet reached - for example, if corresponding
+streams are handled synchronously or reset.
+
+Further, refused streams are now limited to maximum of max_concurrent_streams
+and 100, similarly to priority_limit initial value, providing some tolerance
+to clients trying to open several streams at the connection start, yet
+low tolerance to flooding attempts.
+
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/6ceef192e7af1c507826ac38a2d43f08bf265fb9]
+Signed-off-by: alperak <alperyasinak1@gmail.com>
+---
+ src/http/v2/ngx_http_v2.c | 15 +++++++++++++++
+ src/http/v2/ngx_http_v2.h |  2 ++
+ 2 files changed, 17 insertions(+)
+
+diff --git a/src/http/v2/ngx_http_v2.c b/src/http/v2/ngx_http_v2.c
+index ea3f27c..1116e56 100644
+--- a/src/http/v2/ngx_http_v2.c
++++ b/src/http/v2/ngx_http_v2.c
+@@ -361,6 +361,7 @@ ngx_http_v2_read_handler(ngx_event_t *rev)
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, c->log, 0, "http2 read handler");
+ 
+     h2c->blocked = 1;
++    h2c->new_streams = 0;
+ 
+     if (c->close) {
+         c->close = 0;
+@@ -1321,6 +1322,14 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_t *h2c, u_char *pos,
+         goto rst_stream;
+     }
+ 
++    if (h2c->new_streams++ >= 2 * h2scf->concurrent_streams) {
++        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
++                      "client sent too many streams at once");
++
++        status = NGX_HTTP_V2_REFUSED_STREAM;
++        goto rst_stream;
++    }
++
+     if (!h2c->settings_ack
+         && !(h2c->state.flags & NGX_HTTP_V2_END_STREAM_FLAG)
+         && h2scf->preread_size < NGX_HTTP_V2_DEFAULT_WINDOW)
+@@ -1386,6 +1395,12 @@ ngx_http_v2_state_headers(ngx_http_v2_connection_t *h2c, u_char *pos,
+ 
+ rst_stream:
+ 
++    if (h2c->refused_streams++ > ngx_max(h2scf->concurrent_streams, 100)) {
++        ngx_log_error(NGX_LOG_INFO, h2c->connection->log, 0,
++                      "client sent too many refused streams");
++        return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_NO_ERROR);
++    }
++
+     if (ngx_http_v2_send_rst_stream(h2c, h2c->state.sid, status) != NGX_OK) {
+         return ngx_http_v2_connection_error(h2c, NGX_HTTP_V2_INTERNAL_ERROR);
+     }
+diff --git a/src/http/v2/ngx_http_v2.h b/src/http/v2/ngx_http_v2.h
+index 4e25293..b9daf92 100644
+--- a/src/http/v2/ngx_http_v2.h
++++ b/src/http/v2/ngx_http_v2.h
+@@ -124,6 +124,8 @@ struct ngx_http_v2_connection_s {
+     ngx_uint_t                       processing;
+     ngx_uint_t                       frames;
+     ngx_uint_t                       idle;
++    ngx_uint_t                       new_streams;
++    ngx_uint_t                       refused_streams;
+     ngx_uint_t                       priority_limit;
+ 
+     ngx_uint_t                       pushing;
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index 2e865e400..e5666f6fe 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -2,5 +2,7 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
+SRC_URI:append = " file://CVE-2023-44487.patch"
+
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 
-- 
2.25.1


