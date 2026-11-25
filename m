Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36733.1795587335132974201
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=I2INMgLu;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5969; q=dns/txt;
  s=iport01; t=1795587335; x=1796796935;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oE6RPjPq7ncgE2qekG+QgfrrHGYAaIlWTzLuti60ROo=;
  b=I2INMgLuSiwYwVBi7XUJvYbMDguGEWQ7/CSnjT29GvhXEZijs7jTFTIk
   qG4OutsS8lAn3ycEFqe6hNlzdRSMaSnBtBXmneS96uZ/1hENWAuqMXKCL
   K72RgTyE/v3JXBz0nDDYfTwYQ2QTu2v/39jgmmv/P6gTG5LmDTvzFVFDl
   xw66tdPh9DFyh/qigojIcVZUVz7MzXOx3VPzX8w7rAPkZcUblXuc58Vvo
   UnBGDW15Wd92Pwqk00/mJwfFjMuaegepAW9vuh2Bh4/9w7U8F0FxZaPOo
   yga70W7J99fTOHo/+VIRY6wEGp9N180yEXfdmgh3SnAfd6qI6ozMHpkGe
   w==;
X-CSE-ConnectionGUID: OXkeJC5ZQSmdRyFs1yzI+w==
X-CSE-MsgGUID: jALSQ/oJQDa/kR2jxfrCnQ==
X-IPAS-Result: =?us-ascii?q?A0BJAgBQewZr/9RK/pBaglmCV3VgQ0kDlCeBNWwDnimBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAT0cAwECLysjCBmDAgGCdAMRuWKBeTOBA?=
 =?us-ascii?q?YMpAT8CQ1DbMwELFAGBOIVCiCVdGAGEficbG4FyhAl2gQWBXAKBJ4Z/BIIig?=
 =?us-ascii?q?QyBVI0TAoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWIQs0G?=
 =?us-ascii?q?A1IESw3FRkEPm4HlBODGgE9UQEKIAGBZAdBpXWfU4E+CiiDeYwklToaM4QEl?=
 =?us-ascii?q?BqSVAuYfY4KlgFQhGqBaDyBWXAVgyIJShkPV41YCguDYIUTyUgmMgIJAy8BA?=
 =?us-ascii?q?QcCBw4DC4FokACBfgEB?=
IronPort-Data: A9a23:2YDNg6ID29EgRo8AFE+RhZQlxSXFcZb7ZxGr2PjKsXjdYENS1TJUn
 2JNDGvUO/fbNmbwL99zbYvkpEpX7cOGm9FrHgEd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea9k3wWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8gmQpajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1JPEI7H6ZFyN9MBG105
 NIDcSEfT1Oc0rfeLLKTEoGAh+wqIdOuOMYUvWttiGiAS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2NnwsYDUXUrsTIJIinO6rj2PXeDxDo1XTrq0yi4TW5FIpi+S9b4uIEjCMbcd8un2h4
 WXkxkjwRRIgbt6PxyCu9Ev504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflhcRQZ9UVuY98gzIk/OS6AeCDW9CRTlEADA7iPILqfUR/
 gfht7vU6fZH6dV5lVr1Gm+okA6P
IronPort-HdrOrdr: A9a23:3NJgJKAg3cUhudnlHemA55DYdb4zR+YMi2TDsHoBLSC9Hfb3qy
 nDppkmPFrP+VUssRIb6LW90de7IE80nKQdieJ6AV7hZniFhILCFu5fBOXZrwEIYxefysdtkY
 F9bqN5FNr8SXJ+jcr8/U2ENuxI+qjhzEht7t2utkuEimpRGsdd0zs=
X-Talos-CUID: 9a23:QyL6pG8Porx1RsDi1mWVv2kkGc0HWSDv9UzVL3WpJ30wWa+0CkDFrQ==
X-Talos-MUID: =?us-ascii?q?9a23=3AMmmV7QwGsgGYn+Iour3elPZfHOiaqKaHLHs01pI?=
 =?us-ascii?q?kguWNci9KYTWNgi6cRLZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,232,1787011200"; 
   d="scan'208";a="60348795"
Received: from aer-l-core-11.cisco.com ([144.254.74.212])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:31 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-11.cisco.com (Postfix) with ESMTPS id 447581800040B
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:31 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id EF5A5CBF204; Tue, 24 Nov 2026 22:15:29 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 05/10] nginx: fix CVE-2026-118899
Date: Tue, 24 Nov 2026 22:15:24 -0800
Message-Id: <20261125061529.2721522-5-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132992
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-118899. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].
The individual backported commit links are recorded in the
embedded patch headers.

[1] https://github.com/nginx/nginx/commit/1b723277aa556ba4c6e40cc8f0f0b465e29c0a13
[2] https://ubuntu.com/security/CVE-2026-118899

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-118899_p1.patch      | 43 +++++++++++++++++++
 .../nginx/files/CVE-2026-118899_p2.patch      | 37 ++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  2 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  2 +
 4 files changed, 84 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-118899_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-118899_p2.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-118899_p1.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-118899_p1.patch
new file mode 100644
index 0000000000..797e7a59e1
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-118899_p1.patch
@@ -0,0 +1,43 @@
+From 1b723277aa556ba4c6e40cc8f0f0b465e29c0a13 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Sat, 30 Mar 2024 05:06:59 +0300
+Subject: [PATCH] Request body: explicit handling of NGX_AGAIN.
+
+Request body reading indirectly uses the "do { c->recv() } while
+(c->read->ready)" form, which is not really correct, as for example with
+SSL c->read->ready may be still set when c->recv() returns NGX_AGAIN due
+to SSL_ERROR_WANT_WRITE (see 7351:2b5528023f6b), and therefore this form
+might be an infinite loop.
+
+Added explicit NGX_AGAIN handling for the sake of correctness.
+
+CVE: CVE-2026-118899
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/1b723277aa556ba4c6e40cc8f0f0b465e29c0a13]
+
+Signed-off-by: Elijah Zupancic <e.zupancic@f5.com>
+Origin: <https://freenginx.org/hg/nginx/rev/392e8e2fd22a8461e75a67d5d33d85c07974e1e3>
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/ngx_http_request_body.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+diff --git a/src/http/ngx_http_request_body.c b/src/http/ngx_http_request_body.c
+index 93c69220c5..6e24131518 100644
+--- a/src/http/ngx_http_request_body.c
++++ b/src/http/ngx_http_request_body.c
+@@ -307,6 +307,7 @@ ngx_http_do_read_client_request_body(ngx_http_request_t *r)
+     c = r->connection;
+     rb = r->request_body;
+     flush = 1;
++    n = NGX_AGAIN;
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, c->log, 0,
+                    "http read client request body");
+@@ -432,7 +433,7 @@ ngx_http_do_read_client_request_body(ngx_http_request_t *r)
+             break;
+         }
+ 
+-        if (!c->read->ready || rb->rest == 0) {
++        if (n == NGX_AGAIN || !c->read->ready || rb->rest == 0) {
+ 
+             clcf = ngx_http_get_module_loc_conf(r, ngx_http_core_module);
+             ngx_add_timer(c->read, clcf->client_body_timeout);
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-118899_p2.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-118899_p2.patch
new file mode 100644
index 0000000000..3f524f15ad
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-118899_p2.patch
@@ -0,0 +1,37 @@
+From d1640655f46c5a2d32fefc2c818583f203e47536 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Tue, 27 Oct 2026 15:02:12 +0400
+Subject: [PATCH] HTTP/3: explicit handling of NGX_AGAIN
+
+Following the previous change, this change adds explicit handling
+of NGX_AGAIN while reading HTTP/3 request body for the sake of
+correctness.
+
+CVE: CVE-2026-118899
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/d1640655f46c5a2d32fefc2c818583f203e47536]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/v3/ngx_http_v3_request.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+diff --git a/src/http/v3/ngx_http_v3_request.c b/src/http/v3/ngx_http_v3_request.c
+index 7bb61311d9..2685af53f7 100644
+--- a/src/http/v3/ngx_http_v3_request.c
++++ b/src/http/v3/ngx_http_v3_request.c
+@@ -1351,6 +1351,7 @@ ngx_http_v3_do_read_client_request_body(ngx_http_request_t *r)
+     c = r->connection;
+     rb = r->request_body;
+     flush = 1;
++    n = NGX_AGAIN;
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, c->log, 0,
+                    "http3 read client request body");
+@@ -1474,7 +1475,7 @@ ngx_http_v3_do_read_client_request_body(ngx_http_request_t *r)
+             break;
+         }
+ 
+-        if (!c->read->ready || rb->rest == 0) {
++        if (n == NGX_AGAIN || !c->read->ready || rb->rest == 0) {
+ 
+             clcf = ngx_http_get_module_loc_conf(r, ngx_http_core_module);
+             ngx_add_timer(c->read, clcf->client_body_timeout);
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index d6a30764ab..5110a2a0f7 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -23,6 +23,8 @@ SRC_URI:append = " \
     file://CVE-2026-123640_p1.patch \
     file://CVE-2026-123640_p2.patch \
     file://CVE-2026-120967.patch \
+    file://CVE-2026-118899_p1.patch \
+    file://CVE-2026-118899_p2.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index d38199ba49..c9e7a9095f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -23,6 +23,8 @@ SRC_URI:append = " \
     file://CVE-2026-123640_p1.patch \
     file://CVE-2026-123640_p2.patch \
     file://CVE-2026-120967.patch \
+    file://CVE-2026-118899_p1.patch \
+    file://CVE-2026-118899_p2.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

