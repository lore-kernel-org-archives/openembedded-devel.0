Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FFE1CC6B2D
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:02 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14025.1792120857867434225
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=hCXpn4JD;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4246; q=dns/txt;
  s=iport01; t=1792120857; x=1793330457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lZi2va1aVWpQB35e4AjRGFWtOGPKXe7UyQ5Ex7mSkYg=;
  b=hCXpn4JDz3MoalRRZ2pQcc5ZLNFvrvvJlWNO96ssEhNdHv7JZuFScT8R
   GGI7dqy+3cKwjUu4+Pw30L/zjVou/UD4+F0gPyQiVehy7CS4mzAnJxSVX
   c6BM4ri1Fmk5Rrndr/BrSt7WJsyzPIzE0kIcXasNH7WM11/xiR29affg5
   GYJddn6Ae39aFTF7dwL9LTf2r4S1ZxpAEfmjKvLOwxie/+OCkl1Kd+PEq
   yspzdOL79VbZiynFzqbrj2QU3JazFXJgSG36EQ3KRfDvIV0YY9+Z77L7S
   tMzLCHbYmtuIGq40cFBoji0mVqhI+oIAtmI9JpwTFMOxIEC5sqAWQEDEs
   g==;
X-CSE-ConnectionGUID: 61pNy04lTB6fBjuW7wTKcw==
X-CSE-MsgGUID: GgtQ3RqxRxev3qRbZjtSaQ==
X-IPAS-Result: =?us-ascii?q?A0CmAgCRl9Fq/4z/Ja1aglmCGD91YENJA41XiARsA54cg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYIqWAGCdAMRBrx0g?=
 =?us-ascii?q?XkzgQGDKQGBVNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FygRWDaYEFgVwBAQGIJ?=
 =?us-ascii?q?ASCIoEMgVqVR0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdg?=
 =?us-ascii?q?SCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJA?=
 =?us-ascii?q?RMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5ITHoJlPVEBE?=
 =?us-ascii?q?xYCgWsYBQKTUJJHgTWfWgoog3aMIpU6GjOqbwuYfY4Klg1ChGmBaDyBWXAVg?=
 =?us-ascii?q?yIJShkPji8KC4NghRPJRycyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:+ZOO16i/stdR0knrzlMmg95GX161MREKZh0ujC45NGQN5FlHY01je
 htvDWCOOvfeMDT8KIgiPIngoBlTvsOEzNdjQVBtqiFkQyhjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqVGo/5REDkS8
 cAydj4nbA282P2K47mkH7wEasQLdKEHPasFsX1miDWcBvE8TNWbGOPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZg9/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKIIYLTGZ4JwxbwS
 mTu0GvlO0ogLcyl2TebqWuWjN3NgRjyYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFmUHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:jSpu/KoT/7Y03MPGM6CZ4ZEaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: 9a23:7whW7mHZWo6gatwFqmI5rVYyC5h5dkH3knn6IVKHVnlVa7aKHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AwODRtg1Qxfwk6g4ZBhGVsM22LDUjzKuyMRs3iIU?=
 =?us-ascii?q?8q8SabjVKMQWfkA++e9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536143458"
Received: from rcdn-l-core-03.cisco.com ([173.37.255.140])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-03.cisco.com (Postfix) with ESMTPS id CE0DD18000616;
	Fri, 16 Oct 2026 03:20:56 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 75D47CBF201; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 01/11] nginx: Fix CVE-2026-40701
Date: Thu, 15 Oct 2026 20:20:46 -0700
Message-Id: <20261016032056.409095-2-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-03.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131024

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1].

[1] https://github.com/nginx/nginx/commit/d2b8d47741820c9fb134c6731ecb40b21f3085b1
[2] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-40701.patch          | 74 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  4 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  4 +
 3 files changed, 82 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-40701.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-40701.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-40701.patch
new file mode 100644
index 0000000000..23de07d87d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-40701.patch
@@ -0,0 +1,74 @@
+From d2b8d47741820c9fb134c6731ecb40b21f3085b1 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Tue, 21 Apr 2026 14:51:41 +0400
+Subject: [PATCH] OCSP: resolve cleanup on connection close
+
+Previously, when a client SSL connection was terminated (typically due to a
+timeout) while resolving an OCSP responder, the OCSP context was freed, but
+the resolve context was not.  This resulted in use-after-free on resolve
+completion.
+
+Reported by Leo Lin.
+
+CVE: CVE-2026-40701
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/d2b8d47741820c9fb134c6731ecb40b21f3085b1]
+
+(cherry picked from commit d2b8d47741820c9fb134c6731ecb40b21f3085b1)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/event/ngx_event_openssl_stapling.c | 11 +++++++++++
+ 1 file changed, 11 insertions(+)
+
+diff --git a/src/event/ngx_event_openssl_stapling.c b/src/event/ngx_event_openssl_stapling.c
+index a0a8031c7..231bdeceb 100644
+--- a/src/event/ngx_event_openssl_stapling.c
++++ b/src/event/ngx_event_openssl_stapling.c
+@@ -113,6 +113,7 @@ struct ngx_ssl_ocsp_ctx_s {
+ 
+     ngx_resolver_t              *resolver;
+     ngx_msec_t                   resolver_timeout;
++    ngx_resolver_ctx_t          *resolve;
+ 
+     ngx_msec_t                   timeout;
+ 
+@@ -1341,6 +1342,10 @@ ngx_ssl_ocsp_done(ngx_ssl_ocsp_ctx_t *ctx)
+     ngx_log_debug0(NGX_LOG_DEBUG_EVENT, ctx->log, 0,
+                    "ssl ocsp done");
+ 
++    if (ctx->resolve) {
++        ngx_resolve_name_done(ctx->resolve);
++    }
++
+     if (ctx->peer.connection) {
+         ngx_close_connection(ctx->peer.connection);
+     }
+@@ -1433,7 +1438,10 @@ ngx_ssl_ocsp_request(ngx_ssl_ocsp_ctx_t *ctx)
+         resolve->data = ctx;
+         resolve->timeout = ctx->resolver_timeout;
+ 
++        ctx->resolve = resolve;
++
+         if (ngx_resolve_name(resolve) != NGX_OK) {
++            ctx->resolve = NULL;
+             ngx_ssl_ocsp_error(ctx);
+             return;
+         }
+@@ -1522,6 +1530,7 @@ ngx_ssl_ocsp_resolve_handler(ngx_resolver_ctx_t *resolve)
+     }
+ 
+     ngx_resolve_name_done(resolve);
++    ctx->resolve = NULL;
+ 
+     ngx_ssl_ocsp_connect(ctx);
+     return;
+@@ -1529,6 +1538,8 @@ ngx_ssl_ocsp_resolve_handler(ngx_resolver_ctx_t *resolve)
+ failed:
+ 
+     ngx_resolve_name_done(resolve);
++    ctx->resolve = NULL;
++
+     ngx_ssl_ocsp_error(ctx);
+ }
+ 
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index f797f4a289..25493be747 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -1,5 +1,9 @@
 require nginx.inc
 
+SRC_URI:append = " \
+    file://CVE-2026-40701.patch \
+"
+
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
 
 SRC_URI[sha256sum] = "2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 4d884fcbb3..c8881a320e 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -1,5 +1,9 @@
 require nginx.inc
 
+SRC_URI:append = " \
+    file://CVE-2026-40701.patch \
+"
+
 # 1.28.x branch is the current stable branch, the recommended default
 # 1.29.x is the current mainline branches containing all new features
 DEFAULT_PREFERENCE = "-1"
-- 
2.35.6


