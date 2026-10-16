Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76AA9CCA466
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:02 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13829.1792120857841685084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ZofJTAEh;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=12118; q=dns/txt;
  s=iport01; t=1792120858; x=1793330458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nsaX5i6ugg8Qqni8zhnuDpMK0efWZ4icW8I1iYGWzY0=;
  b=ZofJTAEhoXuDVAvtdfzbakhM9La3OJ07wftow83UVmdt1mwyYfVG9yrW
   b7VoWMz0BX0bX6NEBdRXW2FuopAQL0j5XmBj/BW7+VsDRAdQF9YTGSvt8
   ccoMNld1e/3j2xEF4mvsSy6o/kWaVF3DnSgomeic56584uMVkVslu9X1B
   k2GpLFsk1Rj2hle1crHA2eIBS/zrlZ05TugEjnWpqPfCeFfWEYVbBi60S
   JDWEoWFrNxfmEZuxdOTIcF1Btdfs2Me9lXjS10cVh5xuW1pA8ShJg8Ow2
   BN+YFk6h8ZIEtppyhprs3E7xOE9P1qUXgwo0vSAI424Eg7GsZ26RTUcyQ
   w==;
X-CSE-ConnectionGUID: cd1crOvDQdKFNxOUJXoyKg==
X-CSE-MsgGUID: LrohbFJQQpKxhJGD4hraOw==
X-IPAS-Result: =?us-ascii?q?A0CmAgBtltFq/5P/Ja1aglmCV3VgQ0kDjVeIBGwDnhyBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYARsSEBwDAQIvKyMIGYMCAYJ0AxEGvHOBe?=
 =?us-ascii?q?TOBAYJmQwGBVNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FyhH6BBYFcAQEBgTeGb?=
 =?us-ascii?q?QSCIoEMgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?SCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJA?=
 =?us-ascii?q?RMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5ITHoJkARYXE?=
 =?us-ascii?q?FEBKQEBgWuTUhQSkB2CIaEPCiiDdowilToaM6pvC5h9jgqWT4RpgWg8gVlwF?=
 =?us-ascii?q?YMiCUoZD44vCguDYIUTyUcnMgIJAy8BAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:b0+SlK8WLpYoBC5h3YjmDrUD0X+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 2oYUD3SOqmJN2DzfYt0Pdvj808A7ZKHytNlQANu+39EQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rbei5xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtajtKs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k9MdQT4MFpLVhC1
 tI+OBcwTCCElsG5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/GdbIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0In1lQ/UPrSmM+omnn2cDRCgFmUvqEwpWPUyWSd1ZCwaoOEJIPXFZ09ckCwg
 njB/27XICgjLP+PyRiq3i6snObognauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzBCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:qRJLu6kRhyXw4eIjSE8x8EQVppzpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: 9a23:n3akkG/UViW7HQJ4+Z2Vv0UYQ8s/VWPx9XvzDWmoLltLeLqEalDFrQ==
X-Talos-MUID: 9a23:uvbF8QgEedMSX8fCxwtCScMpEN1v466AKnk0ibYWu+urGXBwIT66k2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521967580"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 3B56118000273;
	Fri, 16 Oct 2026 03:20:57 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 880B5CBEF8A; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 06/11] nginx: fix CVE-2026-42055
Date: Thu, 15 Oct 2026 20:20:51 -0700
Message-Id: <20261016032056.409095-7-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131033

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Use version-specific backports: nginx 1.28.3 contains only the affected
gRPC module, while nginx 1.29.7 also contains ngx_http_proxy_v2_module
and therefore carries the complete upstream changes for both modules.

[1] https://github.com/nginx/nginx/commit/131be8514da8985b15b74150521afedbf9cc4ea3
[2] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/nginx-1.28.3/CVE-2026-42055.patch   | 108 ++++++++++
 .../nginx/nginx-1.29.7/CVE-2026-42055.patch   | 188 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |   1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |   1 +
 4 files changed, 298 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42055.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42055.patch

diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42055.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42055.patch
new file mode 100644
index 0000000000..ce16a9279d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42055.patch
@@ -0,0 +1,108 @@
+From 131be8514da8985b15b74150521afedbf9cc4ea3 Mon Sep 17 00:00:00 2001
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
+
+Backport Changes:
+- Dropped the ngx_http_proxy_v2_module.c hunk because that module is not
+  available in nginx 1.28.3.  Retained the ngx_http_grpc_module.c fix.
+
+(cherry picked from commit 131be8514da8985b15b74150521afedbf9cc4ea3)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_grpc_module.c | 44 +++++++++++++++++++++++++
+ 1 file changed, 44 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_grpc_module.c b/src/http/modules/ngx_http_grpc_module.c
+index 80046d6a4..84ce51265 100644
+--- a/src/http/modules/ngx_http_grpc_module.c
++++ b/src/http/modules/ngx_http_grpc_module.c
+@@ -749,6 +749,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+@@ -769,6 +775,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+@@ -778,6 +790,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+@@ -808,6 +826,18 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+@@ -842,6 +872,20 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42055.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42055.patch
new file mode 100644
index 0000000000..c10ab2dbc0
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42055.patch
@@ -0,0 +1,188 @@
+From 131be8514da8985b15b74150521afedbf9cc4ea3 Mon Sep 17 00:00:00 2001
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
+
+(cherry picked from commit 131be8514da8985b15b74150521afedbf9cc4ea3)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_grpc_module.c     | 44 +++++++++++++++++++++
+ src/http/modules/ngx_http_proxy_v2_module.c | 44 +++++++++++++++++++++
+ 2 files changed, 88 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_grpc_module.c b/src/http/modules/ngx_http_grpc_module.c
+index cc3aebe59..1895ef31b 100644
+--- a/src/http/modules/ngx_http_grpc_module.c
++++ b/src/http/modules/ngx_http_grpc_module.c
+@@ -749,6 +749,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+@@ -769,6 +775,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+@@ -778,6 +790,12 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+@@ -808,6 +826,18 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+@@ -842,6 +872,20 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
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
+diff --git a/src/http/modules/ngx_http_proxy_v2_module.c b/src/http/modules/ngx_http_proxy_v2_module.c
+index 4c282a864..637fa9a0e 100644
+--- a/src/http/modules/ngx_http_proxy_v2_module.c
++++ b/src/http/modules/ngx_http_proxy_v2_module.c
+@@ -379,6 +379,12 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+         tmp_len = 0;
+ 
+     } else {
++        if (method.len > NGX_HTTP_V2_MAX_FIELD) {
++            ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                          "too long http2 method: \"%V\"", &method);
++            return NGX_ERROR;
++        }
++
+         len += 1 + NGX_HTTP_V2_INT_OCTETS + method.len;
+         tmp_len = method.len;
+     }
+@@ -419,6 +425,12 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+         return NGX_ERROR;
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
+@@ -430,6 +442,12 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+     host = &ctx->ctx.vars.host_header;
+ 
+     if (!plcf->host_set) {
++        if (host->len > NGX_HTTP_V2_MAX_FIELD) {
++            ngx_log_error(NGX_LOG_ERR, r->connection->log, 0,
++                          "too long http2 host: \"%V\"", host);
++            return NGX_ERROR;
++        }
++
+         len += 1 + NGX_HTTP_V2_INT_OCTETS + host->len;
+ 
+         if (tmp_len < host->len) {
+@@ -486,6 +504,18 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
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
+@@ -520,6 +550,20 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
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
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 94ca40e36f..a47e398422 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -7,6 +7,7 @@ SRC_URI:append = " \
     file://CVE-2026-42946_p2.patch \
     file://CVE-2026-42945.patch \
     file://CVE-2026-9256.patch \
+    file://CVE-2026-42055.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index c5f8ea2645..bfd82d5e31 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -7,6 +7,7 @@ SRC_URI:append = " \
     file://CVE-2026-42946_p2.patch \
     file://CVE-2026-42945.patch \
     file://CVE-2026-9256.patch \
+    file://CVE-2026-42055.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6


