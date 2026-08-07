Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AE63C5AC82
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 07:10:26 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37558.1786086620834422240
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2026 00:10:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=ZuVAA0/y;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848479c9bd5so2786906b3a.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 00:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786086620; x=1786691420; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jqv9EAiMCYCZ1Addd+liThRE8NXLEDdipIPqsqvX8jk=;
        b=ZuVAA0/yg7SzWyiOse0oVKb3DItaPcGnxB21facYn5Z+9Xgi4So1qC3zrwR1oNFLFG
         1eKQOGMRz3GCpv5WW0fDWjuBcF5uuyIMGPHu5phPUYsxtsMlaDanTVuH/tL9U4vPIEXr
         UHMcoEyOUCzaXwM3Kccec5Ws+5DEZ0ekOuTuCXyL0xohiSgtKKZZ7bdUHnWHlpq4m+oQ
         nWIi7nGLA+Lpwz8ZRDBHoEaD2eMfD0igsrixBzhxNvTtGdIAsK/D5GVZDO4mQ/MtFc7I
         hgeqBTfVv6RhqOI8JCjLgVNcjXYnubhCHbQoaeA3CvRP3v8Tf3CtHyscCL+62xLvEch2
         y2qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786086620; x=1786691420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jqv9EAiMCYCZ1Addd+liThRE8NXLEDdipIPqsqvX8jk=;
        b=o1vAS56Pe5S8imliHPaOW7787p+BDZmwPX3Au581OhPUeezq+LbELcsOVuWDtwbIPP
         Xsobu14uBeNH5khdfnkBnzYccpjSzQmV/I+6plVhTBCzqIAgU6U17Ub7DG4OGi9USTmq
         eNZEyZzsTpa3tFd/XMYusFpjInvWG/d6zM37WUQ3BMqIimaZwSGXh7eSMK8ITIOulARN
         VN5tZk/iect8IMVKOGILc1jZnYcw4hLtjwy/yrMUZnPsuY/9KcMpRWaXk5OZu5tYvcJm
         1Mm7QDf3LCIB9qUor44HUn2E8jWbi+VV7e3SorYF7yo5StfVwuRFJfePapdhXGNhFRBC
         4D2g==
X-Gm-Message-State: AOJu0Yxva8rPFKc935KkZK7SAoc2+/5U2rtgRWZjda50tVDe+Ljz738n
	dU4wKYGifANHoh16YIJQPO+8UrRJMokw1rj7G51xfNZQignVAu2Bxmeb0Q/zFZHd
X-Gm-Gg: AR+sD10dlyd5e+v/Q9q2ubprhE2OUQj2zCx6mGpUjgGdVD0mnd+r8QQzvR2tpzrqnuy
	mp0CQH33z34NfhOLK/fdLfKeU5BR12g9mrqENh7Bv8JHGHd70yYi+TqIel6IpES2d9TOvKMKzz1
	PC5wdVuTfRqGXq/aBR3R2nYzoZxeftQkdlB5AY30UYi2aMCNgxODPy8Y3X4ZNgT4uElNZKbn357
	FEjfr+dCst5LKqNB7B4NzDA+7zPW/ERaRaiPZUrLQ+2JNZv8fEe9gFHAjPiMwI+s1CpXMkbjz+x
	FhWjpyrLPp/eOlLE5hdeZyp1dwZ3PW61lHa/rIfJP07kQPGxNFRTQBrgx7ojt55fWl60yRCN3po
	gRzP3OTomHPyV0HvrM2WQa9OTkQ8i7bFLAECHJzUNZ6/7fUAcwTkz54gAzvI1RrlnCy5LETvQDD
	3XAvmg/BvYYNcWWpREbtTjETFVb6V3S7Ui5J4CWQQDDfoeybN2vHHEMW2lKd1AYA7uGc0+esCOC
	6ji3PvUUHYc1A==
X-Received: by 2002:a05:6a00:2441:b0:848:5951:ff78 with SMTP id d2e1a72fcca58-84f2e1525d0mr22089337b3a.36.1786086620008;
        Fri, 07 Aug 2026 00:10:20 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a51e99asm520440b3a.33.2026.08.07.00.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:10:18 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-webserver][scarthgap][PATCH 5/6] nginx: upgrade 1.26.0 -> 1.26.3
Date: Fri,  7 Aug 2026 19:09:50 +1200
Message-ID: <20260807070953.2275518-5-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
References: <20260807070953.2275518-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2026 07:10:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128862

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Made patches for CVE-2024-7347, CVE-2025-23419 specific for v1.24.0 as
these vulnerabilities are fixed in v1.26.3.

Dropped CVE-2025-2341.patch for nginx-1.26.3

Changelog:
https://nginx.org/en/CHANGES-1.26

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../CVE-2024-7347-1.patch                     |   0
 .../CVE-2024-7347-2.patch                     |   0
 .../nginx/nginx-1.26.0/CVE-2025-23419.patch   | 119 ------------------
 .../CVE-2026-28755.patch                      |   0
 meta-webserver/recipes-httpd/nginx/nginx.inc  |   3 -
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |   3 +
 .../{nginx_1.26.0.bb => nginx_1.26.3.bb}      |   2 +-
 7 files changed, 4 insertions(+), 123 deletions(-)
 rename meta-webserver/recipes-httpd/nginx/{files => nginx-1.24.0}/CVE-2024-7347-1.patch (100%)
 rename meta-webserver/recipes-httpd/nginx/{files => nginx-1.24.0}/CVE-2024-7347-2.patch (100%)
 delete mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2025-23419.patch
 rename meta-webserver/recipes-httpd/nginx/{nginx-1.26.0 => nginx-1.26.3}/CVE-2026-28755.patch (100%)
 rename meta-webserver/recipes-httpd/nginx/{nginx_1.26.0.bb => nginx_1.26.3.bb} (77%)

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2024-7347-1.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-1.patch
rename to meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2024-7347-1.patch
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2024-7347-2.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/nginx/files/CVE-2024-7347-2.patch
rename to meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2024-7347-2.patch
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2025-23419.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2025-23419.patch
deleted file mode 100644
index d1c5bd9b40..0000000000
--- a/meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2025-23419.patch
+++ /dev/null
@@ -1,119 +0,0 @@
-From 2de0d3fd114e9d3d6a56bd7298aff8c637063509 Mon Sep 17 00:00:00 2001
-From: Sergey Kandaurov <pluknet@nginx.com>
-Date: Wed, 22 Jan 2025 18:55:44 +0400
-Subject: [PATCH] SNI: added restriction for TLSv1.3 cross-SNI session
- resumption.
-
-In OpenSSL, session resumption always happens in the default SSL context,
-prior to invoking the SNI callback.  Further, unlike in TLSv1.2 and older
-protocols, SSL_get_servername() returns values received in the resumption
-handshake, which may be different from the value in the initial handshake.
-Notably, this makes the restriction added in b720f650b insufficient for
-sessions resumed with different SNI server name.
-
-Considering the example from b720f650b, previously, a client was able to
-request example.org by presenting a certificate for example.org, then to
-resume and request example.com.
-
-The fix is to reject handshakes resumed with a different server name, if
-verification of client certificates is enabled in a corresponding server
-configuration.
-
-CVE: CVE-2025-23419
-Upstream-Status: Backport [https://github.com/nginx/nginx/commit/13935cf9fdc3c8d8278c70716417d3b71c36140e]
-Signed-off-by: Colin Pinnell McAllister <colin.mcallister@garmin.com>
----
- src/http/ngx_http_request.c        | 27 +++++++++++++++++++++++++--
- src/stream/ngx_stream_ssl_module.c | 27 +++++++++++++++++++++++++--
- 2 files changed, 50 insertions(+), 4 deletions(-)
-
-diff --git a/src/http/ngx_http_request.c b/src/http/ngx_http_request.c
-index 3cca57cf5..9593b7fb5 100644
---- a/src/http/ngx_http_request.c
-+++ b/src/http/ngx_http_request.c
-@@ -932,6 +932,31 @@ ngx_http_ssl_servername(ngx_ssl_conn_t *ssl_conn, int *ad, void *arg)
-         goto done;
-     }
- 
-+    sscf = ngx_http_get_module_srv_conf(cscf->ctx, ngx_http_ssl_module);
-+
-+#if (defined TLS1_3_VERSION                                                   \
-+     && !defined LIBRESSL_VERSION_NUMBER && !defined OPENSSL_IS_BORINGSSL)
-+
-+    /*
-+     * SSL_SESSION_get0_hostname() is only available in OpenSSL 1.1.1+,
-+     * but servername being negotiated in every TLSv1.3 handshake
-+     * is only returned in OpenSSL 1.1.1+ as well
-+     */
-+
-+    if (sscf->verify) {
-+        const char  *hostname;
-+
-+        hostname = SSL_SESSION_get0_hostname(SSL_get0_session(ssl_conn));
-+
-+        if (hostname != NULL && ngx_strcmp(hostname, servername) != 0) {
-+            c->ssl->handshake_rejected = 1;
-+            *ad = SSL_AD_ACCESS_DENIED;
-+            return SSL_TLSEXT_ERR_ALERT_FATAL;
-+        }
-+    }
-+
-+#endif
-+
-     hc->ssl_servername = ngx_palloc(c->pool, sizeof(ngx_str_t));
-     if (hc->ssl_servername == NULL) {
-         goto error;
-@@ -945,8 +970,6 @@ ngx_http_ssl_servername(ngx_ssl_conn_t *ssl_conn, int *ad, void *arg)
- 
-     ngx_set_connection_log(c, clcf->error_log);
- 
--    sscf = ngx_http_get_module_srv_conf(hc->conf_ctx, ngx_http_ssl_module);
--
-     c->ssl->buffer_size = sscf->buffer_size;
- 
-     if (sscf->ssl.ctx) {
-diff --git a/src/stream/ngx_stream_ssl_module.c b/src/stream/ngx_stream_ssl_module.c
-index ba444776a..6dee106de 100644
---- a/src/stream/ngx_stream_ssl_module.c
-+++ b/src/stream/ngx_stream_ssl_module.c
-@@ -521,12 +521,35 @@ ngx_stream_ssl_servername(ngx_ssl_conn_t *ssl_conn, int *ad, void *arg)
-         goto done;
-     }
- 
-+    sscf = ngx_stream_get_module_srv_conf(cscf->ctx, ngx_stream_ssl_module);
-+
-+#if (defined TLS1_3_VERSION                                                   \
-+     && !defined LIBRESSL_VERSION_NUMBER && !defined OPENSSL_IS_BORINGSSL)
-+
-+    /*
-+     * SSL_SESSION_get0_hostname() is only available in OpenSSL 1.1.1+,
-+     * but servername being negotiated in every TLSv1.3 handshake
-+     * is only returned in OpenSSL 1.1.1+ as well
-+     */
-+
-+    if (sscf->verify) {
-+        const char  *hostname;
-+
-+        hostname = SSL_SESSION_get0_hostname(SSL_get0_session(ssl_conn));
-+
-+        if (hostname != NULL && ngx_strcmp(hostname, servername) != 0) {
-+            c->ssl->handshake_rejected = 1;
-+            *ad = SSL_AD_ACCESS_DENIED;
-+            return SSL_TLSEXT_ERR_ALERT_FATAL;
-+        }
-+    }
-+
-+#endif
-+
-     s->srv_conf = cscf->ctx->srv_conf;
- 
-     ngx_set_connection_log(c, cscf->error_log);
- 
--    sscf = ngx_stream_get_module_srv_conf(s, ngx_stream_ssl_module);
--
-     if (sscf->ssl.ctx) {
-         if (SSL_set_SSL_CTX(ssl_conn, sscf->ssl.ctx) == NULL) {
-             goto error;
--- 
-2.52.0
-
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2026-28755.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-28755.patch
similarity index 100%
rename from meta-webserver/recipes-httpd/nginx/nginx-1.26.0/CVE-2026-28755.patch
rename to meta-webserver/recipes-httpd/nginx/nginx-1.26.3/CVE-2026-28755.patch
diff --git a/meta-webserver/recipes-httpd/nginx/nginx.inc b/meta-webserver/recipes-httpd/nginx/nginx.inc
index e392ed107c..401a207103 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx.inc
+++ b/meta-webserver/recipes-httpd/nginx/nginx.inc
@@ -23,10 +23,7 @@ SRC_URI = " \
     file://nginx.service \
     file://nginx-fix-pidfile.patch \
     file://0001-configure-libxslt-conf.patch \
-    file://CVE-2024-7347-1.patch \
-    file://CVE-2024-7347-2.patch \
     file://CVE-2025-53859.patch \
-    file://CVE-2025-23419.patch \
     file://CVE-2026-1642.patch \
     file://CVE-2026-27784.patch \
 "
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index f28a00df5b..b5707d83eb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -3,6 +3,9 @@ require nginx.inc
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
 SRC_URI:append = " \
+                  file://CVE-2024-7347-1.patch \
+                  file://CVE-2024-7347-2.patch \
+                  file://CVE-2025-23419.patch \
                   file://CVE-2023-44487.patch \
                   file://CVE-2026-28755.patch \
                   file://CVE-2026-27651.patch \
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
similarity index 77%
rename from meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
rename to meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
index 75e05fac6f..658b1c0fce 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.26.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.26.3.bb
@@ -8,5 +8,5 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
 SRC_URI:append = " file://CVE-2026-28755.patch"
 
-SRC_URI[sha256sum] = "d2e6c8439d6c6db5015d8eaab2470ab52aef85a7bf363182879977e084370497"
+SRC_URI[sha256sum] = "69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa"
 

