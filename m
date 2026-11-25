Received: from aer-iport-4.cisco.com (aer-iport-4.cisco.com [173.38.203.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36732.1795587333543104124
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bEG9xX1f;
 spf=pass (domain: cisco.com, ip: 173.38.203.54, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8235; q=dns/txt;
  s=iport01; t=1795587333; x=1796796933;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gnA56RlP10eJs1R5J5fnAV7HhpuyCu/fEu4q0TI2d00=;
  b=bEG9xX1fK+T0REYB5uikz6/1cITI6fvIxxqVDnFBjvrdqkPwt42B2tMR
   LmJ8TKWQ7g3TmDhLGrIRMTJUVkriJDWSLH35miMZbubXYHi6RSHNDIh40
   L4b8jJj5QLHCNuqEOxV5mA4ChR8L49U8k93oU7hopxUVqa58hK5h1m0IS
   H0eDAToP0uMbS/SFvpQ76pVtmNKsFdWsLMASrUA1zAf77SZq4uw9uU52z
   95hRU5mBB1vueyEM9J+pVy+81Z+TeVb44DucMQ/gqa6Of6pNszeh/m7Al
   hY34UkN9Fysb1nBs7kPFaHDxPGVVGh/aX2OV3OZ0d56KBJDSf6Y9rC6zR
   Q==;
X-CSE-ConnectionGUID: Q71YZ3e+SEyV9PPU1xAQ5g==
X-CSE-MsgGUID: 1OucEvh6R5GlWsrfcl5IqA==
X-IPAS-Result: =?us-ascii?q?A0BJAgBQewZr/8tK/pBaglmCV3VgQ0kDlCeBNWwDnimBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRuWKBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMwELFAGBOIVCiCVdGAGEficbG4FygRWDaoEFgVwCiCYEgiKBD?=
 =?us-ascii?q?IFUjRMCgUmIUkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjOxeBBxsGBYEcg?=
 =?us-ascii?q?R6BEoEDXYErKF4hgQiBdQKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaLAqBG?=
 =?us-ascii?q?jU8CSY/FQxnCxoFYQgCDQx0ORAwHCQvBRkmPBsKgQwnHR4ZDgIpBhYhCzQYD?=
 =?us-ascii?q?UgRLDcVGQQ+bgeUE4MUBz0+EwErgWsZKKV1oREKKIN5jCSVOhozqnILmH2OC?=
 =?us-ascii?q?pZRhGqBaDyBWXAVgyIJShkPV41YCguDYM5bJjICCQMvAQEHAgcOAwuBaJF+A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:ht0RLK/ViUzZoJd1vfktDrUD1H+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 zdMUTjXb67eMzT0et52ao2z9E4Dvp+Ay4RnQFZkqilEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmB4E/rYuK8xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mtyyHjEAX9gWAtazhJs/vrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2kPYtQpyL16Qlpj5
 MJJEAgwNwCqvr+5lefTpulE3qzPLeHiMZlavjRryivUSK58B5vCWK7No9Rf2V/chOgXQaqYP
 ZdFL2UzKk6YOHWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+Oa3YYOEJ4zULSlTth+/u
 2nr4WSnOEw1MOOE0zSO9i+Nn8aayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc9NdCag+rQqK0KeRu1zfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:YCMGo6O/tbDTQsBcTu2jsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoRpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3D398Y87
 t8eK5jD9C1J117gcHmpDScKb8bsb66GGTCv5am85+rJjsaDZ1d0w==
X-Talos-CUID: 9a23:wMHn+mO0jVYSAe5DYXY+xXxPF4MeX2zjnU/oHhaoIF80R+jA
X-Talos-MUID: =?us-ascii?q?9a23=3AnXVEww0K+IAzKInp0iGL5Fxi1TUjuoOzA20Tkcs?=
 =?us-ascii?q?85uaACjdqNTyZ0RWua9py?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="62919586"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:31 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id 3E1D3180005F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:31 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id E8968CBF202; Tue, 24 Nov 2026 22:15:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 03/10] nginx: fix CVE-2026-123640
Date: Tue, 24 Nov 2026 22:15:22 -0800
Message-Id: <20261125061529.2721522-3-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132988
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-123640. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].
The individual backported commit links are recorded in the
embedded patch headers.

[1] https://github.com/nginx/nginx/commit/63d74d545295faa3d147ef704d740da4805f13f4
[2] https://ubuntu.com/security/CVE-2026-123640

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-123640_p1.patch      | 121 ++++++++++++++++++
 .../nginx/files/CVE-2026-123640_p2.patch      |  61 +++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |   2 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |   2 +
 4 files changed, 186 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-123640_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-123640_p2.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123640_p1.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123640_p1.patch
new file mode 100644
index 0000000000..4c93e66f60
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123640_p1.patch
@@ -0,0 +1,121 @@
+From 63d74d545295faa3d147ef704d740da4805f13f4 Mon Sep 17 00:00:00 2001
+From: Aleksei Bavshin <a.bavshin@nginx.com>
+Date: Mon, 21 Sep 2026 09:57:19 -0700
+Subject: [PATCH] Stream ssl_preread: forbid trailing data in extensions
+
+As required explicitly in RFC 9846 Section 4.3 and implicitly in all the
+previous versions of TLS extensions specification.
+
+Reported by Vivek Parikh, BreachX Zero Day Labs using Typhon AI Mil v2.
+
+CVE: CVE-2026-123640
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/63d74d545295faa3d147ef704d740da4805f13f4]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/stream/ngx_stream_ssl_preread_module.c | 40 +++++++++++++++++++---
+ 1 file changed, 35 insertions(+), 5 deletions(-)
+
+diff --git a/src/stream/ngx_stream_ssl_preread_module.c b/src/stream/ngx_stream_ssl_preread_module.c
+index 3fc83ff..8f2d333 100644
+--- a/src/stream/ngx_stream_ssl_preread_module.c
++++ b/src/stream/ngx_stream_ssl_preread_module.c
+@@ -224,6 +224,7 @@ ngx_stream_ssl_preread_parse_record(ngx_stream_ssl_preread_ctx_t *ctx,
+         sw_cs,              /* cipher_suites */
+         sw_cm_len,          /* compression_methods length */
+         sw_cm,              /* compression_methods */
++        sw_ext_len,         /* extensions length */
+         sw_ext,             /* extension */
+         sw_ext_header,      /* extension_type, extension_data length */
+         sw_sni_len,         /* SNI length */
+@@ -330,11 +331,20 @@ ngx_stream_ssl_preread_parse_record(ngx_stream_ssl_preread_ctx_t *ctx,
+                 return NGX_OK;
+             }
+ 
+-            state = sw_ext;
++            state = sw_ext_len;
+             dst = p;
+             size = 2;
+             break;
+ 
++        case sw_ext_len:
++            if (left != (size_t) (p[0] << 8) + p[1]) {
++                ngx_log_debug0(NGX_LOG_DEBUG_STREAM, ctx->log, 0,
++                               "ssl preread: extensions length error");
++                return NGX_DECLINED;
++            }
++
++            /* fall through */
++
+         case sw_ext:
+             if (left == 0) {
+                 return NGX_OK;
+@@ -346,6 +356,8 @@ ngx_stream_ssl_preread_parse_record(ngx_stream_ssl_preread_ctx_t *ctx,
+             break;
+ 
+         case sw_ext_header:
++            ext = (p[2] << 8) + p[3];
++
+             if (p[0] == 0 && p[1] == 0 && ctx->host.data == NULL) {
+                 /* SNI extension */
+                 state = sw_sni_len;
+@@ -372,11 +384,17 @@ ngx_stream_ssl_preread_parse_record(ngx_stream_ssl_preread_ctx_t *ctx,
+ 
+             state = sw_ext;
+             dst = NULL;
+-            size = (p[2] << 8) + p[3];
++            size = ext;
+             break;
+ 
+         case sw_sni_len:
+-            ext = (p[0] << 8) + p[1];
++            if (ext < 5 || ext != 2 + (size_t) (p[0] << 8) + p[1]) {
++                ngx_log_debug0(NGX_LOG_DEBUG_STREAM, ctx->log, 0,
++                               "ssl preread: SNI format error");
++                return NGX_DECLINED;
++            }
++            ext -= 2;
++
+             state = sw_sni_host_head;
+             dst = p;
+             size = 3;
+@@ -416,7 +434,12 @@ ngx_stream_ssl_preread_parse_record(ngx_stream_ssl_preread_ctx_t *ctx,
+             break;
+ 
+         case sw_alpn_len:
+-            ext = (p[0] << 8) + p[1];
++            if (ext < 4 || ext != 2 + (size_t) (p[0] << 8) + p[1]) {
++                ngx_log_debug0(NGX_LOG_DEBUG_STREAM, ctx->log, 0,
++                               "ssl preread: ALPN format error");
++                return NGX_DECLINED;
++            }
++            ext -= 2;
+ 
+             ctx->alpn.data = ngx_pnalloc(ctx->pool, ext);
+             if (ctx->alpn.data == NULL) {
+@@ -469,6 +492,14 @@ ngx_stream_ssl_preread_parse_record(ngx_stream_ssl_preread_ctx_t *ctx,
+             break;
+ 
+         case sw_supver_len:
++            size = p[0];
++
++            if (ext < 3 || ext != 1 + size) {
++                ngx_log_debug0(NGX_LOG_DEBUG_STREAM, ctx->log, 0,
++                               "ssl preread: supported_versions format error");
++                return NGX_DECLINED;
++            }
++
+             ngx_log_debug0(NGX_LOG_DEBUG_STREAM, ctx->log, 0,
+                            "ssl preread: supported_versions");
+ 
+@@ -478,7 +509,6 @@ ngx_stream_ssl_preread_parse_record(ngx_stream_ssl_preread_ctx_t *ctx,
+ 
+             state = sw_ext;
+             dst = NULL;
+-            size = p[0];
+             break;
+         }
+ 
+-- 
+2.35.6
+
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123640_p2.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123640_p2.patch
new file mode 100644
index 0000000000..f906117236
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-123640_p2.patch
@@ -0,0 +1,61 @@
+From 1e668b7e856198f89a2eec0b94b54b826eb5c4f7 Mon Sep 17 00:00:00 2001
+From: Aleksei Bavshin <a.bavshin@nginx.com>
+Date: Tue, 29 Sep 2026 09:19:30 -0700
+Subject: [PATCH] Stream ssl_preread: forbid duplicate SNI and ALPN
+
+As stated in the TLS Extensions specification (RFC 3546) and all
+subsequent TLS specification updates,
+
+: There MUST NOT be more than one extension of the same type.
+
+Such a ClientHello is now treated as malformed, as with other parsing
+errors.
+
+CVE: CVE-2026-123640
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/1e668b7e856198f89a2eec0b94b54b826eb5c4f7]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/stream/ngx_stream_ssl_preread_module.c | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/src/stream/ngx_stream_ssl_preread_module.c b/src/stream/ngx_stream_ssl_preread_module.c
+index 8f2d333..7aa8669 100644
+--- a/src/stream/ngx_stream_ssl_preread_module.c
++++ b/src/stream/ngx_stream_ssl_preread_module.c
+@@ -358,16 +358,30 @@ ngx_stream_ssl_preread_parse_record(ngx_stream_ssl_preread_ctx_t *ctx,
+         case sw_ext_header:
+             ext = (p[2] << 8) + p[3];
+ 
+-            if (p[0] == 0 && p[1] == 0 && ctx->host.data == NULL) {
++            if (p[0] == 0 && p[1] == 0) {
+                 /* SNI extension */
++
++                if (ctx->host.data != NULL) {
++                    ngx_log_debug0(NGX_LOG_DEBUG_STREAM, ctx->log, 0,
++                                   "ssl preread: duplicate SNI");
++                    return NGX_DECLINED;
++                }
++
+                 state = sw_sni_len;
+                 dst = p;
+                 size = 2;
+                 break;
+             }
+ 
+-            if (p[0] == 0 && p[1] == 16 && ctx->alpn.data == NULL) {
++            if (p[0] == 0 && p[1] == 16) {
+                 /* ALPN extension */
++
++                if (ctx->alpn.data != NULL) {
++                    ngx_log_debug0(NGX_LOG_DEBUG_STREAM, ctx->log, 0,
++                                   "ssl preread: duplicate ALPN");
++                    return NGX_DECLINED;
++                }
++
+                 state = sw_alpn_len;
+                 dst = p;
+                 size = 2;
+-- 
+2.35.6
+
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index d7a4ac0820..717e651e13 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -20,6 +20,8 @@ SRC_URI:append = " \
     file://CVE-2026-15176.patch \
     file://CVE-2026-97205.patch \
     file://CVE-2026-123633.patch \
+    file://CVE-2026-123640_p1.patch \
+    file://CVE-2026-123640_p2.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 59a395f670..d0766e4d20 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -20,6 +20,8 @@ SRC_URI:append = " \
     file://CVE-2026-15176.patch \
     file://CVE-2026-97205.patch \
     file://CVE-2026-123633.patch \
+    file://CVE-2026-123640_p1.patch \
+    file://CVE-2026-123640_p2.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

