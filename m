Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F081CC47077
	for <webhook@archiver.kernel.org>; Thu, 11 Jan 2024 12:52:40 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.10598.1704977558921464742
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Jan 2024 04:52:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NSb0AlBT;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-40e62425c60so1801825e9.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 04:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704977557; x=1705582357; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/fs4X2s0BaWJaAG2JNfNoXctAw/TBTuJFyuSJgBiXE=;
        b=NSb0AlBT5OjqTSKbgOk/Es7ozbadU/63r0aMq55714j/Sq8Q9hEavRM/27qy5oDQzw
         IPF9m+VnEtavesOV8HCO9M3Y+qp771wy4BdVN02ACwHrP1+F9ICNVa3mUWpbI8D+zacK
         ERaaPgDMnqd/G044qDDipdahNiuoxICyO1jF/MOBdaOykcaxLcpA34JdKUGdbV471qR/
         5x3Pp9tfWXrJXMeeyEJZMHVPHUqohyqA65E6yWwOOeVIO6crCHtM3KqopkvqS14WhGjm
         agEsE5iS4lkVeJ6XC/y7e7XPlC2HnMd7AY7WlI1c88qGAZlkCiq4e7GYvHvJMrFfrbZx
         fGvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704977557; x=1705582357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/fs4X2s0BaWJaAG2JNfNoXctAw/TBTuJFyuSJgBiXE=;
        b=YdldjbkyBSbao8ylyeJrQSyj0rGbhY9Feme9hjxde8Cd+h5XpjtZGabDZlSyg7PdVZ
         PH7qeCdZLwFfmMl3CTwm1tAZnMI05L1bb9iaVF+iV6dMGs5261Z4N99AT0tjpLXyR3lf
         99lYfLoaIkvGWVIN1z0+YdunmzLpHVPhxIfTMko1SzRPhlos5l0X70tMuRc92kFGtBYQ
         36g+4hEBgeOqEEEbZ2jHBF4NBtNF6dVt8cT107P82FRjteU0uXoVXqY7N9VoulmLOG2H
         JSPW3+f1mlcNV5XNxqpUFJs3XTqLWea5NeJ/oqqQTZJNRYP0P8WPYYzxXgAuaeCYO7Tz
         wL3g==
X-Gm-Message-State: AOJu0YxHU6W/RGaCI/+m6Rdo/WFKjrfaa9zWfBX7gAU/hT8RkdT/mmu9
	q1pbDwDA/pCaQemjkfdWc/T9AN6BSmA=
X-Google-Smtp-Source: AGHT+IGIpY9liioy5yJ1/LeUNqr7r/WTNQ9tp5BKnF3L4AFr2xyyfEnm+q49r1wN+7L9MDSQz2UKpg==
X-Received: by 2002:a05:600c:1986:b0:40d:77ed:c44a with SMTP id t6-20020a05600c198600b0040d77edc44amr411187wmq.42.1704977556649;
        Thu, 11 Jan 2024 04:52:36 -0800 (PST)
Received: from localhost.localdomain ([176.33.66.82])
        by smtp.gmail.com with ESMTPSA id fl13-20020a05600c0b8d00b0040d8cd116e4sm5762152wmb.37.2024.01.11.04.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 04:52:36 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-webserver][PATCHv2] nginx: fix CVE-2023-44487
Date: Thu, 11 Jan 2024 15:52:32 +0300
Message-Id: <20240111125232.572662-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 11 Jan 2024 12:52:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108224

Upstream-Status: Backport from [https://github.com/nginx/nginx/commit/6ceef192e7af1c507826ac38a2d43f08bf265fb9]

WARNING: nginx-1.24.0-r0 do_cve_check: Found unpatched CVE (CVE-2023-44487)

This vulnerability exists between the following versions -> From(including) 1.9.5 Up to(including) 1.25.2

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../nginx/files/CVE-2023-44487.patch          | 78 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  2 +
 2 files changed, 80 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
new file mode 100644
index 000000000..2fc6a60f6
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2023-44487.patch
@@ -0,0 +1,78 @@
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
+CVE: CVE-2023-44487
+
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


