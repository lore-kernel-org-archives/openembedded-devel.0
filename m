Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF11DE9D83D
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 05:36:28 +0000 (UTC)
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.49154.1775453782099993348
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Apr 2026 22:36:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bs6hy+tv;
 spf=pass (domain: mvista.com, ip: 74.125.82.49, mailfrom: hprajapati@mvista.com)
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-126ea4b77adso3942967c88.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Apr 2026 22:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775453781; x=1776058581; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RwMpXshQVnYuIhtf3aYWx0VniSp8h5wJ4igno2ZBjxk=;
        b=bs6hy+tvwC4YpH8Bdn2YfCELa6VqxgbfjB9Kt94ODttO+ka3DSztbqNwCPlJlp1BLK
         RTEIC7LNb8rjowh2ayVXvYPLeIPscTEqOeKT9jB/Ww3uUvdlo2dnXLsxe50rQm04fkAw
         F7T6CVwkj2aylgw6FfBlF8/7kqOPZJau5LtI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775453781; x=1776058581;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RwMpXshQVnYuIhtf3aYWx0VniSp8h5wJ4igno2ZBjxk=;
        b=Lc7+cU+C441N38Ajn2XrQQRiITKUjG3Zctaa+FtWvYhA+zNPM2FZrZHKYWY0f1oHaU
         N721Th0eUr/uMosBxTPGsu1vA+t1NOIbfRxwt7tFrlGybx4U+IaCyW9EjEYrTjYZF67k
         Jdlzoe4hCeJJze+FDnEaP3y3znC69ea2tuVwC0VZsBRkae2KBQGYKvM0FjLkJm8q/sXi
         OXvTjXwGpmT5qsiwSOTWcf36ixY321uB8l3cXf05nG2iXPsJTMJV1mPhMzbBVggm6PCe
         fMpn12ByE//h1atwemaBuK1BNmWOSXiFvniwnnQZ8Jlbxvc4/iEDoGMGR4+buRkD977y
         3sxQ==
X-Gm-Message-State: AOJu0YwsaRBOxCNkKVxssVLpmEmc2hbDDhZqshNJwmsWNQUahXoZyx5E
	FxVRL4XO1nNJk9BY+gH+0EvL5W3yLq/qtOG6LIIGbMSbKqtIcXeXqkPeXvS6Y6zZqrdYSFwOm8b
	dHo73xAw=
X-Gm-Gg: AeBDietEj9+3lMc11l2YUYlCnrKWTBLWBRDQi3793UVS6Ql6iX4YDvWZq6ie8Ps3IeU
	p8PkEnSnFdt3gbXFJ4vH4Ky+oQ1DPIdPLbrpigaTR4keoVYKDU/us5mSzWnxUDTBeXiookHE462
	y8aTSq3hP5rPuBYZhGnu+fPYhzKtZS2YeVsX+HoHZXmPYXDYEgvCVNLM1MMfl+vrArZ5ZSycV4S
	9E9jCOpnc+Ofpmzfy9fG6UMgEh2E0hTa8oLU3bGdPOsi7IwicRHsiiEPJKSJS2QwHlzWX4mrIDY
	DxiTQE9Z6Ou/DJYfayqzXMVkC+FimkELApddN4We40f+ElG0yqmGWnZMXWAgZZKswlHviGeH1zr
	TC60BRBGzZrqxbbLE1Spbab1JiQkR4FXjeMY1qszCmQlRpWLMolutomo8WswIY2I3CpZw1bhpz6
	0B2i864PlUMayy48aiqu4sdkN3WObWpDUuS13q
X-Received: by 2002:a05:7022:fd05:b0:12a:b932:81d3 with SMTP id a92af1059eb24-12bfb76b48emr5436533c88.26.1775453781070;
        Sun, 05 Apr 2026 22:36:21 -0700 (PDT)
Received: from MVIN00013.mvista.com ([103.250.136.160])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c05a7beffsm4951322c88.15.2026.04.05.22.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 22:36:20 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-webserver][scarthgap][PATCH] nginx: Fix for CVE-2026-28755
Date: Mon,  6 Apr 2026 11:06:11 +0530
Message-ID: <20260406053611.103282-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Apr 2026 05:36:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126025

Pick patch from [1] which mentioned in debian report [2]
[1] https://github.com/nginx/nginx/commit/78f581487706f2e43eea5a060c516fc4d98090e8
[2] https://security-tracker.debian.org/tracker/CVE-2026-28755

Note: Add different patch for both version to resolve fuzz issue.

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../nginx/nginx-1.24.0/CVE-2026-28755.patch   | 48 +++++++++++++++++++
 .../nginx/nginx-1.25.5/CVE-2026-28755.patch   | 48 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.24.0.bb       |  5 +-
 .../recipes-httpd/nginx/nginx_1.25.5.bb       |  2 +
 4 files changed, 102 insertions(+), 1 deletion(-)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2026-28755.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
new file mode 100644
index 0000000000..37e6d5b3b4
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.24.0/CVE-2026-28755.patch
@@ -0,0 +1,48 @@
+From 78f581487706f2e43eea5a060c516fc4d98090e8 Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Tue, 17 Mar 2026 19:20:03 +0400
+Subject: [PATCH] Stream: fixed client certificate validation with OCSP.
+
+Check for OCSP status was missed in 581cf2267, resulting
+in a broken validation.
+
+Reported by Mufeed VH of Winfunc Research.
+
+CVE: CVE-2026-28755
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/78f581487706f2e43eea5a060c516fc4d98090e8]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/stream/ngx_stream_ssl_module.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/stream/ngx_stream_ssl_module.c b/src/stream/ngx_stream_ssl_module.c
+index 1ba1825..c8e8323 100644
+--- a/src/stream/ngx_stream_ssl_module.c
++++ b/src/stream/ngx_stream_ssl_module.c
+@@ -335,6 +335,7 @@ ngx_stream_ssl_handler(ngx_stream_session_t *s)
+     long                    rc;
+     X509                   *cert;
+     ngx_int_t               rv;
++    const char		    *str;
+     ngx_connection_t       *c;
+     ngx_stream_ssl_conf_t  *sslcf;
+ 
+@@ -385,6 +386,15 @@ ngx_stream_ssl_handler(ngx_stream_session_t *s)
+ 
+             X509_free(cert);
+         }
++
++        if (ngx_ssl_ocsp_get_status(c, &str) != NGX_OK) {
++            ngx_log_error(NGX_LOG_INFO, c->log, 0,
++                          "client SSL certificate verify error: %s", str);
++
++            ngx_ssl_remove_cached_session(c->ssl->session_ctx,
++                                       (SSL_get0_session(c->ssl->connection)));
++            return NGX_ERROR;
++        }
+     }
+ 
+     return NGX_OK;
+-- 
+2.50.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2026-28755.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2026-28755.patch
new file mode 100644
index 0000000000..fdb3dbb7e5
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.25.5/CVE-2026-28755.patch
@@ -0,0 +1,48 @@
+From 78f581487706f2e43eea5a060c516fc4d98090e8 Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Tue, 17 Mar 2026 19:20:03 +0400
+Subject: [PATCH] Stream: fixed client certificate validation with OCSP.
+
+Check for OCSP status was missed in 581cf2267, resulting
+in a broken validation.
+
+Reported by Mufeed VH of Winfunc Research.
+
+CVE: CVE-2026-28755
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/78f581487706f2e43eea5a060c516fc4d98090e8]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/stream/ngx_stream_ssl_module.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/stream/ngx_stream_ssl_module.c b/src/stream/ngx_stream_ssl_module.c
+index 6dee106..9357d09 100644
+--- a/src/stream/ngx_stream_ssl_module.c
++++ b/src/stream/ngx_stream_ssl_module.c
+@@ -342,6 +342,7 @@ ngx_stream_ssl_handler(ngx_stream_session_t *s)
+     long                        rc;
+     X509                       *cert;
+     ngx_int_t                   rv;
++    const char			*str;
+     ngx_connection_t           *c;
+     ngx_stream_ssl_srv_conf_t  *sscf;
+ 
+@@ -392,6 +393,15 @@ ngx_stream_ssl_handler(ngx_stream_session_t *s)
+ 
+             X509_free(cert);
+         }
++
++        if (ngx_ssl_ocsp_get_status(c, &str) != NGX_OK) {
++            ngx_log_error(NGX_LOG_INFO, c->log, 0,
++                          "client SSL certificate verify error: %s", str);
++
++            ngx_ssl_remove_cached_session(c->ssl->session_ctx,
++                                       (SSL_get0_session(c->ssl->connection)));
++            return NGX_ERROR;
++        }
+     }
+ 
+     return NGX_OK;
+-- 
+2.50.1
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index e5666f6fe6..ac1178318a 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -2,7 +2,10 @@ require nginx.inc
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=175abb631c799f54573dc481454c8632"
 
-SRC_URI:append = " file://CVE-2023-44487.patch"
+SRC_URI:append = " \
+		  file://CVE-2023-44487.patch \
+		  file://CVE-2026-28755.patch \
+		  "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"
 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
index b8ab1ef59e..bb2dda0c13 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.25.5.bb
@@ -6,5 +6,7 @@ DEFAULT_PREFERENCE = "-1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a6547d7e5628787ee2a9c5a3480eb628"
 
+SRC_URI:append = " file://CVE-2026-28755.patch"
+
 SRC_URI[sha256sum] = "2fe2294f8af4144e7e842eaea884182a84ee7970e11046ba98194400902bbec0"
 
-- 
2.50.1


