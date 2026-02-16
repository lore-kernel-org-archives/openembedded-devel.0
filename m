Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59A31E81A4F
	for <webhook@archiver.kernel.org>; Mon, 16 Feb 2026 17:08:44 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24519.1771261717265345574
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 16 Feb 2026 09:08:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GwgD30em;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso26015735e9.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 09:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771261716; x=1771866516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oVuTebC9KNu03eyFPpFtXVIFJ8VN47170kq5+wTQR5E=;
        b=GwgD30emhLhuYsRVHYtYv5UA8vDGm93bYx4QF57UaRkGrszXgIi+lTE0cm2hfpWDW3
         AqhsJVTpHzAKkCbREAB1RxL2kuCQBAjrtq67xcKFlEwtnDxRgzKLo/XuQfIUoPEENj2m
         M0m8SPah6aCbyd4yCYsgzBhrhcJKuRtJfVJz2qHreY5gLFjNqtMcc3GcC5/3LYjipAOC
         i2oK/coih7PCXBbFlpxwegSx0sgSsqcKhrjILlcNPCyBQdaPIeK0AJ87UWDQtkjXErN9
         YhJokOGcj1deJYjgnLRCnf0T5pghAxFreXwRKTqUUEgptIhLl0w4VXLhQxUWJhAMXdW6
         Rjmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771261716; x=1771866516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oVuTebC9KNu03eyFPpFtXVIFJ8VN47170kq5+wTQR5E=;
        b=K6CpK3J7VIhHbr6vOOJL5dgwLUOGlh0lB+JQEFPuIv/Pqmf3hfGvAI99ph5CQpfDHe
         +jEIUOGT3qXCFM28yGJfiTBfmgrmAtrHW5rLZwAY34yShKEamG2O+UQzUs8VLzAmXLbz
         iJ87QKGQeSkmXYMV1KswGIZO+h19L9Wclwjw7Si0yq09blQG/YPxwtkMBlyAG/cxtDyN
         DQgIoJO3Ua585ywX0a2tNj9Xl3sbSXrZvl54YWkLo8HCh8IVdeYW92494DPrPy416XS4
         EPgzAfUkeHbx+2XvUZ11AzimgaSCTUvCWaQeqjy58LYLK6bIIh/PfEBe1ZRtI5CJ6rDb
         /5fw==
X-Gm-Message-State: AOJu0YzdwsmFbDQYKdqZGd1i9+afbJXar/C+RGX0f3EIO9EmHrq2Af/C
	9FnytIqoQ5+B1DraIe9h6vRM3wrphRHQaMTJ0MKIkF0daGYRpcKZyoOIlEIyoQ==
X-Gm-Gg: AZuq6aL8gU/ZWwIfKXFDhBNvYUNLnpeQcvDp6BRJkA+EKmkQyXStAfoZtFWXaHN5wsy
	B3T63hPwXbsXCgcdbxKOKKQIjYS9b/hH1GrnJVjlyowfTG3Jn1o5CRKwR67pZaG4RQPw4kQJLNb
	Wk1jYONFPSbiMCY3egKnaJkfr23lQ7946TPog6wB9t/3c4RlMUHiK84EazqNXX6LoXrVMTxnVYw
	0GpvPtMUdT4iKM5yrXimdphHngcIa9eV5NfFEw1OAMVaOEIR+eJc9L8ZEWQvlkaf96x68ydssyu
	orJTvwTjZ4XBlAQdt/6LNSwM6AVFFuPEU4yYkwlQI5gNWlDVKhZtw3tRBrQ0Wu98zzJ/OQ8E4wC
	ximsaaHGt01elzIxzYC7EcOrRZQ3RrQzsyOlHRZqmm4/MlxPz4sD5uWqz2ag9jUo/gLLwgE0oAT
	4Rmr2ZE4af8XxsObUKaZf3Qcf1qIeF2M8=
X-Received: by 2002:a05:600c:1c12:b0:477:7925:f7fb with SMTP id 5b1f17b1804b1-48373a1b999mr233406755e9.10.1771261715453;
        Mon, 16 Feb 2026 09:08:35 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48371998777sm327090995e9.1.2026.02.16.09.08.34
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 09:08:34 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][scarthgap][PATCH] nginx: patch CVE-2026-1642
Date: Mon, 16 Feb 2026 18:08:34 +0100
Message-ID: <20260216170834.3087649-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 16 Feb 2026 17:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124428

Details: https://nvd.nist.gov/vuln/detail/CVE-2026-1642

Pick the commit that was identified by the reporter on the oss-sec
mailing list[1]

[1]: https://www.openwall.com/lists/oss-security/2026/02/05/1

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../nginx/files/CVE-2026-1642.patch           | 46 +++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx.inc  |  1 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
new file mode 100644
index 0000000000..7cbdda6adc
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-1642.patch
@@ -0,0 +1,46 @@
+From 12a0f6a27e77b09807c93d9e4f8605c0dc37e21f Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 29 Jan 2026 13:27:32 +0400
+Subject: [PATCH] Upstream: detect premature plain text response from SSL
+ backend.
+
+When connecting to a backend, the connection write event is triggered
+first in most cases.  However if a response arrives quickly enough, both
+read and write events can be triggered together within the same event loop
+iteration.  In this case the read event handler is called first and the
+write event handler is called after it.
+
+SSL initialization for backend connections happens only in the write event
+handler since SSL handshake starts with sending Client Hello.  Previously,
+if a backend sent a quick plain text response, it could be parsed by the
+read event handler prior to starting SSL handshake on the connection.
+The change adds protection against parsing such responses on SSL-enabled
+connections.
+
+CVE: CVE-2026-1642
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/a59f5f099a89dc8eaebd48077292313f9f7e33e3]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/http/ngx_http_upstream.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/src/http/ngx_http_upstream.c b/src/http/ngx_http_upstream.c
+index 3ae822b..6c310d8 100644
+--- a/src/http/ngx_http_upstream.c
++++ b/src/http/ngx_http_upstream.c
+@@ -2441,6 +2441,15 @@ ngx_http_upstream_process_header(ngx_http_request_t *r, ngx_http_upstream_t *u)
+             return;
+         }
+ 
++#if (NGX_HTTP_SSL)
++        if (u->ssl && c->ssl == NULL) {
++            ngx_log_error(NGX_LOG_ERR, c->log, 0,
++                          "upstream prematurely sent response");
++            ngx_http_upstream_next(r, u, NGX_HTTP_UPSTREAM_FT_ERROR);
++            return;
++        }
++#endif
++
+         u->state->bytes_received += n;
+ 
+         u->buffer.last += n;
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index 865d7f86ee..722e2508d4 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -27,6 +27,7 @@ SRC_URI = " \
     file://CVE-2024-7347-2.patch \
     file://CVE-2025-53859.patch \
     file://CVE-2025-23419.patch \
+    file://CVE-2026-1642.patch \
 "
 
 inherit siteinfo update-rc.d useradd systemd

