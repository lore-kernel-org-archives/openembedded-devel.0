Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5763.1793689470937557005
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2026 23:04:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kPCkeyHx;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4124; q=dns/txt;
  s=iport01; t=1793689471; x=1794899071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2PONZU8wXLMlHEWRwRdVAeyEP2Grb3/26YG/o4vg1ms=;
  b=kPCkeyHxdzmvvZ1gCJfX1TLUDmseg/n+v3Turn8Dd/ahNuJoo9iTpClX
   GPFSO9qOcP4U+6KuhxXPyTc9bj/R74XztjUhGxjirN6bYRFFLj0tGnR4D
   ybP0yhsGp2FEC0GmNO9UWIzCjjrDj2Li/8Pl2jVvWUzUkNe5lYzLxZw6S
   YL0J147TH0N7GJltUGIm6taEoaK+m6KYJyQzpXZqOqHucSZCt9X5m4QIP
   BeAD0j+T/Suu7KWUFFMl08rX39DFN4L0RAg4+ywb+adyE5eShJMYNFCLH
   6XPsexC9HOZe3LP+8pwjRHbyNkmXLrc48Bny/ONoPYifnzeWcncD7qlkU
   g==;
X-CSE-ConnectionGUID: xG5R3OwpSq+zBI94L5rr8A==
X-CSE-MsgGUID: KMBcLC7VTqiZagbDVC5ZAw==
X-IPAS-Result: =?us-ascii?q?A0DLAgBdhulq/4v/Ja1aHgEBCxIMggULgld1YENJA5Vcb?=
 =?us-ascii?q?AOeH4F+DwEBAQ9EDQQBAYUFAo4cAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAycLARgBLRAcAwECLysjCBmDAgGCdAMRu?=
 =?us-ascii?q?x2BeTOBAYMpAT8CQ1DbMwELFAEFgTOFQIgjXRgBhH0nGxuBcoR+gQWBXAKBJ?=
 =?us-ascii?q?4Z/BIIigQyBWh6MfQKIG0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgR6BEoEHXYErKF0BIYEIgXYCglGCAAIBSUEOB0VTCSVDEkckIggSC?=
 =?us-ascii?q?QETGiwKgRo1PAkmPxUMZgsaBWEIAg0MdDkQMB4kLwUcJkAQGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hkg2DDQEGNxY7ASoBgTQRJkFJkkiQRIIhoQ8KKIN3jCOVOhozqnALmH2OC?=
 =?us-ascii?q?pU1TFCEaYFpATqBWXAVgyIJShkPji8KC4NgzlsmMgIJAy8BAQcCBw4DC4Fok?=
 =?us-ascii?q?ACBfgEB?=
IronPort-Data: A9a23:qu0zkKuYRoVygraFxuX3tDBqmOfnVAdfMUV32f8akzHdYApBsoF/q
 tZmKT3UOv2LYDbxet10b42090wCsZ7UyoQyQAZv/CxmQyMagMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656yYsjclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvb8ks11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw6skqOzpp6
 uQjMXMfRDHS28br2qjrY7w57igjBJGD0II3oHpsy3TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxGYH49tL/Aan3XcyFYoVGcv4I84nPYy0p6172F3N/9J4bbH5gFxRbHz
 o7A10fcKBo+H4Oh9SOEwHujjMPxtn7JcZ1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHt5SN
 UEQ0i4vtrQpskuzQ9/wWhe1rHKJslgbQdU4LgEhwBuGxqyR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWra1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:R8bsmqD4XNJxQaflHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:OMmFAWMQB0DawO5DSAY6zhUzBdgeaz7P5laBf2vlE3w5YejA
X-Talos-MUID: =?us-ascii?q?9a23=3AkTcN1g+CKIPFCoDRSmLOYc2Qf+RNya+KIx8zrYw?=
 =?us-ascii?q?HicCLPwBOEGqvpSviFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,192,1787011200"; 
   d="scan'208";a="529258387"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 03 Nov 2026 07:04:30 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id 03F951800036F;
	Tue,  3 Nov 2026 07:04:30 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id A4B99CBF203; Mon,  2 Nov 2026 23:04:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 3/3] nginx: fix CVE-2026-15176
Date: Mon,  2 Nov 2026 23:04:29 -0800
Message-Id: <20261103070429.1299769-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261103070429.1299769-1-hthakar@cisco.com>
References: <20261103070429.1299769-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Tue, 03 Nov 2026 07:04:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131759
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/nginx/nginx/commit/ce1da78900b07e72f37a25f55e6606220ac45902
[2] https://ubuntu.com/security/CVE-2026-15176

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-15176.patch          | 54 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 56 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-15176.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-15176.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-15176.patch
new file mode 100644
index 0000000000..19b9ab787d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-15176.patch
@@ -0,0 +1,54 @@
+From ce1da78900b07e72f37a25f55e6606220ac45902 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Fri, 10 Jul 2026 20:10:12 +0400
+Subject: [PATCH] Avoid post-rewrite URI to path mapping with alias
+
+Previously, after a "rewrite" had changed the URI, and before a new
+location was chosen, the new URI might not match the current location
+prefix.  This becomes a problem when the location uses "alias", which
+is why normally such inconsistency is detected by checking the
+r->valid_location flag.  Meanwhile this flag only handles the
+inconsistency when using the "break" directive or parameter.  However
+in absence of those, there's still an inconsistency window from URI
+change up until the end of the current set of rewrite directives.
+URI to path mapping within this window might result in a buffer
+overflow if location's prefix was longer than the rewritten URI.
+
+The following example resulted in a buffer overflow with the request
+"/foo/1":
+
+location /foo/ {
+    alias /bar/;
+    rewrite ^/foo/.*$ /x;
+    return 200 $request_filename;
+}
+
+Alternatively, $request_filename might be used in access log format,
+"set", "if", "add_header", etc.
+
+The fix is to reject URI mapping in ngx_http_map_uri_to_path() if the
+r->uri_changed flag is set.
+
+CVE: CVE-2026-15176
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/ce1da78900b07e72f37a25f55e6606220ac45902]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/ngx_http_core_module.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/http/ngx_http_core_module.c b/src/http/ngx_http_core_module.c
+index a5f4597294..385b84e1b3 100644
+--- a/src/http/ngx_http_core_module.c
++++ b/src/http/ngx_http_core_module.c
+@@ -1936,7 +1936,7 @@ ngx_http_map_uri_to_path(ngx_http_request_t *r, ngx_str_t *path,
+ 
+     alias = clcf->alias;
+ 
+-    if (alias && !r->valid_location) {
++    if (alias && (!r->valid_location || r->uri_changed)) {
+         ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
+                       "\"alias\" cannot be used in location \"%V\" "
+                       "where URI was rewritten", &clcf->name);
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 1ee9d41562..5b31fabc37 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -17,6 +17,7 @@ SRC_URI:append = " \
     file://CVE-2026-56434.patch \
     file://CVE-2026-95101.patch \
     file://CVE-2026-97629.patch \
+    file://CVE-2026-15176.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 77b6303a74..c2a6e2b6be 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -17,6 +17,7 @@ SRC_URI:append = " \
     file://CVE-2026-56434.patch \
     file://CVE-2026-95101.patch \
     file://CVE-2026-97629.patch \
+    file://CVE-2026-15176.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

