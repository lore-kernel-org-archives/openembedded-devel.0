Return-Path: <benjamin.robin@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A53C43458
	for <webhook@archiver.kernel.org>; Wed,  1 Jul 2026 11:06:59 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.42511.1782904015662217770
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Jul 2026 04:06:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=MLfrUauh;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: benjamin.robin@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 12C06C79ABD
	for <openembedded-devel@lists.openembedded.org>; Wed,  1 Jul 2026 11:07:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 23E3D60288;
	Wed,  1 Jul 2026 11:06:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEA99104C9E12;
	Wed,  1 Jul 2026 13:06:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782904012; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=yIq1BN+UHgsx7rxg/FIFZ3G7j4SsBUyXYfkeNDX39ck=;
	b=MLfrUauhnxFDozh0DRn0ykBgtRntnrgI58rfYxHeuxrYdILDXzZ+OiEMEVnRvmYEC2DBmy
	vqB6g8wahCi/cCWFf3AFQ5jxxUYv6J/26KKmqxPCWzMGfiUEW1sIMPNkem56pObHrlxaS+
	Qkw/rhCKTvFD6ZDSl0pdNd2KiTsOTEudxxi+oPcAKjVjFUKBQR3qqMeWj21Y5URMrPPNQ3
	eYXzRCFds+a3c0foyBZYtazON2EOJqZDZKukM8eDPBoWP04jDpDK737C55msV07snY9E42
	g6OYSQRZiq9Rfnzl0y5gxVQWcOAZLpDQ1bWtK1+lJpYTPAlSqwiIUzHNUXa2UQ==
From: "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
Date: Wed, 01 Jul 2026 13:06:42 +0200
Subject: [scarthgap][meta-webserver][PATCH] nginx: fix CVE-2026-42055
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-nginx-cve-2026-42055-v1-1-3d46e5da4f1c@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWOwQ7CIBAFf6XZs5sAglp/hXCguKWYiA1QbNL03
 6V6nEne5G2QKQXKcO82SFRDDu/YgJ86cJONnjA8GoNg4sKujGP0Ia7oKuGhUAqmFEre9+7M1Cj
 tDdp0TjSG9ZfV5s95GZ7kytHS2dlUJm9no19ULH5oaDcqJQP7/gUEPVIxkwAAAA==
X-Change-ID: 20260701-nginx-cve-2026-42055-4199c305f4a8
To: openembedded-devel@lists.openembedded.org
Cc: olivier.benjamin@bootlin.com, mathieu.dubois-briand@bootlin.com, 
 pascal.eberhard@se.com, wahid.essid@se.com, 
 "Benjamin Robin (Schneider Electric)" <benjamin.robin@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 Jul 2026 11:06:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127992

A heap memory buffer overflow might occur in a worker process when using
a configuration with "ignore_invalid_headers off;" and
"large_client_header_buffers" with large configured values when
proxying a specially crafted request to gRPC backend, allowing an attacker
to cause worker process memory corruption or segmentation fault in a
worker process.

This is a partial cherry-pick of 131be8514da8985b15b74150521afedbf9cc4ea3
since ngx_http_proxy_v2_module.c does not exist in nginx 1.24

Signed-off-by: Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>
---
 .../recipes-httpd/nginx/files/CVE-2026-42055.patch | 102 +++++++++++++++++++++
 meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb |   1 +
 2 files changed, 103 insertions(+)

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42055.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42055.patch
new file mode 100644
index 000000000000..5bb8e94063cd
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42055.patch
@@ -0,0 +1,102 @@
+From 2782212e79ea4d1bdd4ab0f13ac24555a5ebbc0c Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Tue, 2 Jun 2026 19:37:17 +0400
+Subject: [PATCH] Upstream: limit header length for HTTP/2 and gRPC
+
+The change applies the HTTP/2 header length limits to avoid buffer
+overflow.  See 58a7bc3406ac for details.
+
+Reported by Mufeed VH of Winfunc Research.
+
+CVE: CVE-2026-42055
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/131be8514da8985b15b74150521afedbf9cc4ea3]
+Signed-off-by: Benjamin Robin <benjamin.robin@bootlin.com>
+---
+ src/http/modules/ngx_http_grpc_module.c | 44 +++++++++++++++++++++++++
+ 1 file changed, 44 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_grpc_module.c b/src/http/modules/ngx_http_grpc_module.c
+index dfe49c58618c..f7473b11aa3e 100644
+--- a/src/http/modules/ngx_http_grpc_module.c
++++ b/src/http/modules/ngx_http_grpc_module.c
+@@ -740,6 +740,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+         tmp_len = 0;
+
+     } else {
++        if (r->method_name.len > NGX_HTTP_V2_MAX_FIELD) {
++            ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                          "too long http2 method: \"%V\"", &r->method_name);
++            return NGX_ERROR;
++        }
++
+         len += 1 + NGX_HTTP_V2_INT_OCTETS + r->method_name.len;
+         tmp_len = r->method_name.len;
+     }
+@@ -760,6 +766,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+         uri_len = r->uri.len + escape + sizeof("?") - 1 + r->args.len;
+     }
+
++    if (uri_len > NGX_HTTP_V2_MAX_FIELD) {
++        ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                      "too long http2 URI");
++        return NGX_ERROR;
++    }
++
+     len += 1 + NGX_HTTP_V2_INT_OCTETS + uri_len;
+
+     if (tmp_len < uri_len) {
+@@ -769,6 +781,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+     /* :authority header */
+
+     if (!glcf->host_set) {
++        if (ctx->host.len > NGX_HTTP_V2_MAX_FIELD) {
++            ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                          "too long http2 host: \"%V\"", &ctx->host);
++            return NGX_ERROR;
++        }
++
+         len += 1 + NGX_HTTP_V2_INT_OCTETS + ctx->host.len;
+
+         if (tmp_len < ctx->host.len) {
+@@ -799,6 +817,18 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+             continue;
+         }
+
++        if (key_len > NGX_HTTP_V2_MAX_FIELD) {
++            ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                          "too long http2 header name");
++            return NGX_ERROR;
++        }
++
++        if (val_len > NGX_HTTP_V2_MAX_FIELD) {
++            ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                          "too long http2 header value");
++            return NGX_ERROR;
++        }
++
+         len += 1 + NGX_HTTP_V2_INT_OCTETS + key_len
+                  + NGX_HTTP_V2_INT_OCTETS + val_len;
+
+@@ -833,6 +863,20 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+
++            if (header[i].key.len > NGX_HTTP_V2_MAX_FIELD) {
++                ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                              "too long http2 header name: \"%V\"",
++                              &header[i].key);
++                return NGX_ERROR;
++            }
++
++            if (header[i].value.len > NGX_HTTP_V2_MAX_FIELD) {
++                ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                              "too long http2 header value: \"%V: %V\"",
++                              &header[i].key, &header[i].value);
++                return NGX_ERROR;
++            }
++
+             len += 1 + NGX_HTTP_V2_INT_OCTETS + header[i].key.len
+                      + NGX_HTTP_V2_INT_OCTETS + header[i].value.len;
+
+--
+2.54.0
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
index dee6c6618e37..e407c1d083bc 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.24.0.bb
@@ -15,6 +15,7 @@ SRC_URI:append = " \
                   file://CVE-2026-42946-01.patch \
                   file://CVE-2026-42946-02.patch \
                   file://CVE-2026-9256.patch \
+                  file://CVE-2026-42055.patch \
 "
 
 SRC_URI[sha256sum] = "77a2541637b92a621e3ee76776c8b7b40cf6d707e69ba53a940283e30ff2f55d"

---
base-commit: b0c2c648a1af89e7a8dd4c2ec841f3bc0ed0ccb9
change-id: 20260701-nginx-cve-2026-42055-4199c305f4a8

Best regards,
--  
Benjamin Robin (Schneider Electric) <benjamin.robin@bootlin.com>


