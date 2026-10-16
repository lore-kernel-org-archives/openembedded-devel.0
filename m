Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75CDCCA473
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:03 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14027.1792120858265249906
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=g8VHR4lo;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4379; q=dns/txt;
  s=iport01; t=1792120858; x=1793330458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pRJxJ4H/vCKzUhCly9cVEXCgZwDlF6+zKEPcLZmlJRo=;
  b=g8VHR4loD41VPGQ0F9UUNL5hUPl5KxXHQWucLAn2pyXHfdRksnic2GSX
   QoDlFoXd8GSBp9QE1tXtMkb1308LTmSCwhJ/0ukP4GpOvLt2aEEvJPKrg
   T2pm8dAQj0nexQyQ90g/AvdpnKQhz3HMstNkMl4SpwKEStWKNQN3va0Hr
   ejemIaqamXcrF8xT/gHk4LxxNzA8gD0lUqx/4T8pWyqJ0RWu6cCYRrKz9
   5yqsZdhtRk3b0BOAl7kEMrf1pN2Cn9Kuenk0l1lI9ATplawiLNtD34xKC
   9fU3cuLv5t2A99nDD8A+dT/oppPzIxR2/OfOy+jYyqsNVaH1YY9EQntTi
   g==;
X-CSE-ConnectionGUID: tsFgxTF9RQGqORjg90qE5g==
X-CSE-MsgGUID: XFyX6UdzT6qb8AMfyaaZEg==
X-IPAS-Result: =?us-ascii?q?A0CoAgCRl9Fq/4r/Ja1aglmCV3VgQ0kDjVeIBGwDgx2af?=
 =?us-ascii?q?4F+DwEBAQ9EDQQBAYQwVQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMnCwEZLRAcAgEBAi8kByMIGYMCAYJxAwMRA?=
 =?us-ascii?q?wO8dIF5M4EBgyqBVNsyAQsUAQWBM4Fzg02II10YAYR8JxsbgXKBFYNpgQVNg?=
 =?us-ascii?q?Q8BAQEBiCMEgiKBDIFaHjKUd0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5ITHoJlPVEBKQEBgWumNqEPCiiDdowilToaM6pvmQiOCoJuhhWNTIRpgWg8g?=
 =?us-ascii?q?VlwFYMiCUoZD44uAQoLg2CFE8lHJzICCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:B2H4wawQiw7pE5m6ull6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUDm
 DcaXm2Oa/6Ka2XxL40lOtix904HuJTVmNZgTwZsrFhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJF0tE4IIxsgmO1hh7
 NsiKj9cNgmu2u3jldpXSsE07igiBNPgMIVavjRryivUSK5/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bM3WjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW2boaOIILTG625mG6oi
 HP2oVn1EC1ELdbP4B+L43ultMLAyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:2aoiJ6ndkCs9k9c8kujTNPHd0RLpDfL03DAbv31ZSRFFG/FwWf
 rAoB19726StN9/YhAdcLy7VZVoBEmsl6KdgrNhWYtKIjOHhILAFugLhuHfKn/bakjDH4Vmu5
 uIHZITNDTYNykdsS+D2njaL/8QhP+a7auvmeDSi11pTQ1sduVcyj0RMHfjLqWzLzM2fqbQ0/
 Gnl7J6mwY=
X-Talos-CUID: =?us-ascii?q?9a23=3Ay4FylWmNahz6ZYfPdbDPj2ZHYBnXOWHG4njAH2H?=
 =?us-ascii?q?pM19GUZqvS1DBoLpJzsU7zg=3D=3D?=
X-Talos-MUID: 9a23:YaLgtQZme/BZGuBThxH9tG9fONVUvb2kWGkon4QPsvupOnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536432616"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 37E71180001DB;
	Fri, 16 Oct 2026 03:20:57 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 83DF2CBF21E; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 05/11] nginx: fix CVE-2026-9256
Date: Thu, 15 Oct 2026 20:20:50 -0700
Message-Id: <20261016032056.409095-6-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131031

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/nginx/nginx/commit/3f135ae2eb60ce376196c898a6c7cb4d774f7068
[2] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-9256.patch           | 77 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 79 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-9256.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-9256.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-9256.patch
new file mode 100644
index 0000000000..7ffa188abf
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-9256.patch
@@ -0,0 +1,77 @@
+From 3f135ae2eb60ce376196c898a6c7cb4d774f7068 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Thu, 14 May 2026 18:42:18 +0400
+Subject: [PATCH] Rewrite: fix buffer overflow with overlapping captures
+
+When the rewrite replacement string had no variables, but had
+overlapping captures, the length of the allocated buffer could be
+smaller than the replacement string.  This could happen either
+when the "redirect" parameter is specified, or when arguments are
+present in the replacement string.
+
+The following configurations resulted in heap buffer overflow when
+using URI "/++++++++++++++++++++++++++++++":
+
+    location / {
+        rewrite ^/((.*))$ http://127.0.0.1:8080/$1$2 redirect;
+        return 200 foo;
+    }
+
+    location / {
+        rewrite ^/((.*))$ http://127.0.0.1:8080/?$1$2;
+        return 200 foo;
+    }
+
+Reported by Mufeed VH of Winfunc Research.
+
+CVE: CVE-2026-9256
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/3f135ae2eb60ce376196c898a6c7cb4d774f7068]
+
+(cherry picked from commit 3f135ae2eb60ce376196c898a6c7cb4d774f7068)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/ngx_http_script.c | 20 +++++++++++++-------
+ 1 file changed, 13 insertions(+), 7 deletions(-)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+index 2ea611373..8a28e23a6 100644
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -1037,6 +1037,8 @@ ngx_http_script_start_args_code(ngx_http_script_engine_t *e)
+ void
+ ngx_http_script_regex_start_code(ngx_http_script_engine_t *e)
+ {
++    int                           *cap;
++    u_char                        *p;
+     size_t                         len;
+     ngx_int_t                      rc;
+     ngx_uint_t                     n;
+@@ -1143,15 +1145,19 @@ ngx_http_script_regex_start_code(ngx_http_script_engine_t *e)
+     if (code->lengths == NULL) {
+         e->buf.len = code->size;
+ 
+-        if (code->uri) {
+-            if (r->ncaptures && (r->quoted_uri || r->plus_in_uri)) {
+-                e->buf.len += 2 * ngx_escape_uri(NULL, r->uri.data, r->uri.len,
+-                                                 NGX_ESCAPE_ARGS);
+-            }
+-        }
++        cap = r->captures;
++        p = r->captures_data;
+ 
+         for (n = 2; n < r->ncaptures; n += 2) {
+-            e->buf.len += r->captures[n + 1] - r->captures[n];
++            e->buf.len += cap[n + 1] - cap[n];
++
++            if (code->uri) {
++                if (r->quoted_uri || r->plus_in_uri) {
++                    e->buf.len += 2 * ngx_escape_uri(NULL, &p[cap[n]],
++                                                     cap[n + 1] - cap[n],
++                                                     NGX_ESCAPE_ARGS);
++                }
++            }
+         }
+ 
+     } else {
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 308edd96bd..94ca40e36f 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -6,6 +6,7 @@ SRC_URI:append = " \
     file://CVE-2026-42946_p1.patch \
     file://CVE-2026-42946_p2.patch \
     file://CVE-2026-42945.patch \
+    file://CVE-2026-9256.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 4a3d524346..c5f8ea2645 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -6,6 +6,7 @@ SRC_URI:append = " \
     file://CVE-2026-42946_p1.patch \
     file://CVE-2026-42946_p2.patch \
     file://CVE-2026-42945.patch \
+    file://CVE-2026-9256.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6


