Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B00CCA491
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:04 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13832.1792120861021132594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ejX7bJmE;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=86705; q=dns/txt;
  s=iport01; t=1792120861; x=1793330461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=A9aKx75umZggPoP7ivm5xSR5PMLS/2fQbS8CxKVkNGw=;
  b=ejX7bJmEQuzSI00hX5yUs6nym0VNNDuHE1+400zlzi6DrKrylAAlAdnW
   l0XO9faRR7nCaDaC6nQcVMW3u3OAaKb82gQ8hgazqDP3lpyQTbMayiecX
   Nr8WYhU9sR6Yuy4hsJ2/oeLvbQ8eyFLNfKcXEmPA8RmeUN+8kEsXcouPd
   3PkrUW6nDym6cmz9/PRWvwnOEG8aW/Ap6RiNPvIszxirwFget9s9aTU8m
   4otRJXVc7NBFi9qdJJdPzLrYMKWqSUnhOp6MSf+quEV4vahsmwty0GAnE
   ObuR7B1Mv2m8ksH6P4KmTa2uoORGVg5nuOFSRjaedGmqg29ZI+g6/JvaG
   Q==;
X-CSE-ConnectionGUID: 3qVXnAHrTxOkMWy0naeNyg==
X-CSE-MsgGUID: DcvbFblkRsWpPLVOuvW+XA==
X-IPAS-Result: =?us-ascii?q?A0CoAgCRl9Fq/5L/Ja1aglmCGD91YENJA41XiARsA5FKj?=
 =?us-ascii?q?FKBfg8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMaAQwLARgBLRAcAwECLysjCBmCKlgBgnQDE?=
 =?us-ascii?q?Qa8dIF5M4EBgykBgVTbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoEVg2mBBYFcA?=
 =?us-ascii?q?QEBiCQEgiKBDIFaHjKUd0iBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBB?=
 =?us-ascii?q?xsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSR?=
 =?us-ascii?q?yYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5ITH?=
 =?us-ascii?q?oJkAQEsBAwbNgEpAQEigTUJC0+TAyYBB5AVgiGhDwoog3aMIpU6GjOqbwuYf?=
 =?us-ascii?q?Y4KlTNMGTeEaYFoPIFDDwdwFYMiCUoZD44rAgEBCguDYIUTyUcnMgIJAy8BA?=
 =?us-ascii?q?QcCBw4DC4FohGGNHQEB?=
IronPort-Data: A9a23:K+/DfKn+ehdGeiJGq77FTZPo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWWmiHaKuLYzagfN1yPI6y/U8H68PTn9cySQc4qCgyQltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdYBxNZxKEFUy
 ew/KxUyf0iFju+Q0b3uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZD/7C7pm9AusrnnjczRboUi9rqss6G+Vxwt0uFToGIePKoTTFZQIxy50o
 Erq9HrzLBseN+aE9iK91kyLm/Hw3hPSDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1cH3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Kxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:VIgifKyJYlNujRSaUX/vKrPw9L1zdoMgy1knxilNoNJuHfBw8P
 re+8jzuiWUtN98YhwdcJW7Scu9qBDnhPpICPcqXYtKNTOO0ADDEGgh1/qG/9SKIUPDH4BmuZ
 uIWpIObuEYdWIK7vrS0U2fD8sqxsWB/eSDgOfTyGoocCRRApsQljuQzm2gYzZLrM4sP+tAKK
 ah
X-Talos-CUID: =?us-ascii?q?9a23=3AoSIB1GvV4KB6K4KeCE0B8lIX6It+a0Ptyl7wOXO?=
 =?us-ascii?q?oLmVMd6zNT1ad3rJrxp8=3D?=
X-Talos-MUID: 9a23:kBYYmAjMiyEojXInOyY8YcMpGMx26YqkDEM3iqoeg+26EjFuBHStpWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528018951"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 3D1DF18000202;
	Fri, 16 Oct 2026 03:20:57 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 90A49CBEFAB; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 08/11] nginx: fix CVE-2026-42533
Date: Thu, 15 Oct 2026 20:20:53 -0700
Message-Id: <20261016032056.409095-9-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131035

From: Hetvi Thakar <hthakar@cisco.com>

These patches apply the upstream fix sequence as referenced in [6],
using the commits shown in [1] through [5].

Use version-specific fourth patches: nginx 1.28.3 lacks
ngx_http_proxy_v2_module, while the nginx 1.29.7 backport retains the
applicable proxy-v2 bounds checks with its older request-body layout.

[1] https://github.com/nginx/nginx/commit/ea47fabf55e2bc9192ddc27f52486b4e58d5e007
[2] https://github.com/nginx/nginx/commit/7ac67898bdfed2140a1bedcda252074cca11f494
[3] https://github.com/nginx/nginx/commit/78950bdcd443830bde00f6844dba3033c18862b1
[4] https://github.com/nginx/nginx/commit/326b17b0038321c29252e79bf4c53d4773fcb8b5
[5] https://github.com/nginx/nginx/commit/97e40e59b7b4ad6aa36f54ce4f1e64d1e98f24cb
[6] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-42533_p1.patch       | 127 +++
 .../nginx/files/CVE-2026-42533_p2.patch       | 381 +++++++++
 .../nginx/files/CVE-2026-42533_p3.patch       | 704 +++++++++++++++++
 .../nginx/files/CVE-2026-42533_p5.patch       | 254 ++++++
 .../nginx-1.28.3/CVE-2026-42533_p4.patch      | 587 ++++++++++++++
 .../nginx-1.29.7/CVE-2026-42533_p4.patch      | 723 ++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |   5 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |   5 +
 8 files changed, 2786 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p2.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p3.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p5.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42533_p4.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42533_p4.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p1.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p1.patch
new file mode 100644
index 0000000000..bef2916e84
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p1.patch
@@ -0,0 +1,127 @@
+From ea47fabf55e2bc9192ddc27f52486b4e58d5e007 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:54:19 +0300
+Subject: [PATCH] Script: simplified copy capture codes.
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/0fd5e6155817>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/ea47fabf55e2bc9192ddc27f52486b4e58d5e007]
+
+(cherry picked from commit ea47fabf55e2bc9192ddc27f52486b4e58d5e007)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/ngx_http_script.c     | 22 ++++++++++++----------
+ src/stream/ngx_stream_script.c | 10 +++++++---
+ 2 files changed, 19 insertions(+), 13 deletions(-)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+index 8a28e23a6..6b33d01dd 100644
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -1343,6 +1343,7 @@ ngx_http_script_copy_capture_len_code(ngx_http_script_engine_t *e)
+ {
+     int                                  *cap;
+     u_char                               *p;
++    size_t                                len;
+     ngx_uint_t                            n;
+     ngx_http_request_t                   *r;
+     ngx_http_script_copy_capture_code_t  *code;
+@@ -1358,17 +1359,17 @@ ngx_http_script_copy_capture_len_code(ngx_http_script_engine_t *e)
+     if (n < r->ncaptures) {
+ 
+         cap = r->captures;
++        len = cap[n + 1] - cap[n];
+ 
+         if ((e->is_args || e->quote)
+             && (e->request->quoted_uri || e->request->plus_in_uri))
+         {
+-            p = r->captures_data;
++            p = r->captures_data + cap[n];
++
++            return len + 2 * ngx_escape_uri(NULL, p, len, NGX_ESCAPE_ARGS);
+ 
+-            return cap[n + 1] - cap[n]
+-                   + 2 * ngx_escape_uri(NULL, &p[cap[n]], cap[n + 1] - cap[n],
+-                                        NGX_ESCAPE_ARGS);
+         } else {
+-            return cap[n + 1] - cap[n];
++            return len;
+         }
+     }
+ 
+@@ -1381,6 +1382,7 @@ ngx_http_script_copy_capture_code(ngx_http_script_engine_t *e)
+ {
+     int                                  *cap;
+     u_char                               *p, *pos;
++    size_t                                len;
+     ngx_uint_t                            n;
+     ngx_http_request_t                   *r;
+     ngx_http_script_copy_capture_code_t  *code;
+@@ -1398,16 +1400,16 @@ ngx_http_script_copy_capture_code(ngx_http_script_engine_t *e)
+     if (n < r->ncaptures) {
+ 
+         cap = r->captures;
+-        p = r->captures_data;
++        len = cap[n + 1] - cap[n];
++        p = r->captures_data + cap[n];
+ 
+         if ((e->is_args || e->quote)
+             && (e->request->quoted_uri || e->request->plus_in_uri))
+         {
+-            e->pos = (u_char *) ngx_escape_uri(pos, &p[cap[n]],
+-                                               cap[n + 1] - cap[n],
+-                                               NGX_ESCAPE_ARGS);
++            e->pos = (u_char *) ngx_escape_uri(pos, p, len, NGX_ESCAPE_ARGS);
++
+         } else {
+-            e->pos = ngx_copy(pos, &p[cap[n]], cap[n + 1] - cap[n]);
++            e->pos = ngx_copy(pos, p, len);
+         }
+     }
+ 
+diff --git a/src/stream/ngx_stream_script.c b/src/stream/ngx_stream_script.c
+index c447e152f..2cd8b08c7 100644
+--- a/src/stream/ngx_stream_script.c
++++ b/src/stream/ngx_stream_script.c
+@@ -894,6 +894,7 @@ size_t
+ ngx_stream_script_copy_capture_len_code(ngx_stream_script_engine_t *e)
+ {
+     int                                    *cap;
++    size_t                                  len;
+     ngx_uint_t                              n;
+     ngx_stream_session_t                   *s;
+     ngx_stream_script_copy_capture_code_t  *code;
+@@ -908,7 +909,8 @@ ngx_stream_script_copy_capture_len_code(ngx_stream_script_engine_t *e)
+ 
+     if (n < s->ncaptures) {
+         cap = s->captures;
+-        return cap[n + 1] - cap[n];
++        len = cap[n + 1] - cap[n];
++        return len;
+     }
+ 
+     return 0;
+@@ -920,6 +922,7 @@ ngx_stream_script_copy_capture_code(ngx_stream_script_engine_t *e)
+ {
+     int                                    *cap;
+     u_char                                 *p, *pos;
++    size_t                                  len;
+     ngx_uint_t                              n;
+     ngx_stream_session_t                   *s;
+     ngx_stream_script_copy_capture_code_t  *code;
+@@ -936,8 +939,9 @@ ngx_stream_script_copy_capture_code(ngx_stream_script_engine_t *e)
+ 
+     if (n < s->ncaptures) {
+         cap = s->captures;
+-        p = s->captures_data;
+-        e->pos = ngx_copy(pos, &p[cap[n]], cap[n + 1] - cap[n]);
++        len = cap[n + 1] - cap[n];
++        p = s->captures_data + cap[n];
++        e->pos = ngx_copy(pos, p, len);
+     }
+ 
+     ngx_log_debug2(NGX_LOG_DEBUG_STREAM, e->session->connection->log, 0,
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p2.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p2.patch
new file mode 100644
index 0000000000..c28eca55de
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p2.patch
@@ -0,0 +1,381 @@
+From 7ac67898bdfed2140a1bedcda252074cca11f494 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:54:27 +0300
+Subject: [PATCH] Script: buffer overrun protection.
+
+With this change, all script copy operations now check if there is
+enough room in the buffer.  To do so, the script engine now provides the
+e->end pointer, which specifies expected buffer end, and each copy
+operation is checked against it with the ngx_http_script_check_length()
+function.
+
+The e->end pointer is optional and only checked when set, thus
+introducing no incompatible API changes.  All standard functions were
+updated to use it, notably ngx_http_complex_value(), ngx_http_script_run(),
+ngx_http_script_regex_start_code(), ngx_http_script_complex_value_code().
+Direct script evaluation in the proxy, fastcgi, scgi, uwsgi, grpc proxy,
+index, and try_files modules will be updated by a separate patch.
+
+In particular, this catches issues as observed when evaluating variables
+with side effects, such as in the following configuration:
+
+    map $uri $map {
+        ~(?<capture>.*) $capture;
+    }
+
+    set $capture "";
+    set $temp "$capture $map";
+
+As well as when evaluating non-cacheable variables, where length of a
+variable might change between length and copy codes, such as in the
+following configuration:
+
+    map prefix:$capture $map_volatile {
+        volatile;
+        ~(?<capture>.*) $capture;
+    }
+
+    set $capture "";
+    set $temp "$map_volatile";
+
+Similar changes were made in the stream module.
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/d172f506ab5f>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/7ac67898bdfed2140a1bedcda252074cca11f494]
+
+(cherry picked from commit 7ac67898bdfed2140a1bedcda252074cca11f494)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/ngx_http_script.c     | 63 ++++++++++++++++++++++++++++++++++
+ src/http/ngx_http_script.h     |  4 +++
+ src/stream/ngx_stream_script.c | 45 ++++++++++++++++++++++++
+ src/stream/ngx_stream_script.h |  5 +++
+ 4 files changed, 117 insertions(+)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+index 6b33d01dd..d3af4408d 100644
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -92,12 +92,17 @@ ngx_http_complex_value(ngx_http_request_t *r, ngx_http_complex_value_t *val,
+     e.ip = val->values;
+     e.pos = value->data;
+     e.buf = *value;
++    e.end = value->data + len;
+ 
+     while (*(uintptr_t *) e.ip) {
+         code = *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+     }
+ 
++    if (e.status) {
++        return NGX_ERROR;
++    }
++
+     *value = e.buf;
+ 
+     return NGX_OK;
+@@ -650,12 +655,17 @@ ngx_http_script_run(ngx_http_request_t *r, ngx_str_t *value,
+ 
+     e.ip = code_values;
+     e.pos = value->data;
++    e.end = value->data + len;
+ 
+     while (*(uintptr_t *) e.ip) {
+         code = *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+     }
+ 
++    if (e.status) {
++        return NULL;
++    }
++
+     return e.pos;
+ }
+ 
+@@ -805,6 +815,25 @@ ngx_http_script_add_code(ngx_array_t *codes, size_t size, void *code)
+ }
+ 
+ 
++ngx_int_t
++ngx_http_script_check_length(ngx_http_script_engine_t *e, size_t len)
++{
++    if (e->end == NULL) {
++        return NGX_OK;
++    }
++
++    if (e->end - e->pos < (ssize_t) len) {
++        ngx_log_error(NGX_LOG_ALERT, e->request->connection->log, 0,
++                      "no buffer space in script copy");
++        e->ip = ngx_http_script_exit;
++        e->status = NGX_HTTP_INTERNAL_SERVER_ERROR;
++        return NGX_ERROR;
++    }
++
++    return NGX_OK;
++}
++
++
+ static ngx_int_t
+ ngx_http_script_add_copy_code(ngx_http_script_compile_t *sc, ngx_str_t *value,
+     ngx_uint_t last)
+@@ -873,6 +902,11 @@ ngx_http_script_copy_code(ngx_http_script_engine_t *e)
+     p = e->pos;
+ 
+     if (!e->skip) {
++
++        if (ngx_http_script_check_length(e, code->len) != NGX_OK) {
++            return;
++        }
++
+         e->pos = ngx_copy(p, e->ip + sizeof(ngx_http_script_copy_code_t),
+                           code->len);
+     }
+@@ -976,6 +1010,11 @@ ngx_http_script_copy_var_code(ngx_http_script_engine_t *e)
+         }
+ 
+         if (value && !value->not_found) {
++
++            if (ngx_http_script_check_length(e, value->len) != NGX_OK) {
++                return;
++            }
++
+             p = e->pos;
+             e->pos = ngx_copy(p, value->data, value->len);
+ 
+@@ -1192,6 +1231,7 @@ ngx_http_script_regex_start_code(ngx_http_script_engine_t *e)
+     e->quote = code->redirect;
+ 
+     e->pos = e->buf.data;
++    e->end = e->buf.data + e->buf.len;
+ 
+     e->ip += sizeof(ngx_http_script_regex_code_t);
+ }
+@@ -1229,6 +1269,11 @@ ngx_http_script_regex_end_code(ngx_http_script_engine_t *e)
+         e->pos = dst;
+ 
+         if (code->add_args && r->args.len) {
++
++            if (ngx_http_script_check_length(e, r->args.len + 1) != NGX_OK) {
++                return;
++            }
++
+             *e->pos++ = (u_char) (code->args ? '&' : '?');
+             e->pos = ngx_copy(e->pos, r->args.data, r->args.len);
+         }
+@@ -1262,6 +1307,11 @@ ngx_http_script_regex_end_code(ngx_http_script_engine_t *e)
+         e->buf.len = e->args - e->buf.data;
+ 
+         if (code->add_args && r->args.len) {
++
++            if (ngx_http_script_check_length(e, r->args.len + 1) != NGX_OK) {
++                return;
++            }
++
+             *e->pos++ = '&';
+             e->pos = ngx_copy(e->pos, r->args.data, r->args.len);
+         }
+@@ -1383,6 +1433,7 @@ ngx_http_script_copy_capture_code(ngx_http_script_engine_t *e)
+     int                                  *cap;
+     u_char                               *p, *pos;
+     size_t                                len;
++    uintptr_t                             escape;
+     ngx_uint_t                            n;
+     ngx_http_request_t                   *r;
+     ngx_http_script_copy_capture_code_t  *code;
+@@ -1406,9 +1457,20 @@ ngx_http_script_copy_capture_code(ngx_http_script_engine_t *e)
+         if ((e->is_args || e->quote)
+             && (e->request->quoted_uri || e->request->plus_in_uri))
+         {
++            escape = 2 * ngx_escape_uri(NULL, p, len, NGX_ESCAPE_ARGS);
++
++            if (ngx_http_script_check_length(e, len + escape) != NGX_OK) {
++                return;
++            }
++
+             e->pos = (u_char *) ngx_escape_uri(pos, p, len, NGX_ESCAPE_ARGS);
+ 
+         } else {
++
++            if (ngx_http_script_check_length(e, len) != NGX_OK) {
++                return;
++            }
++
+             e->pos = ngx_copy(pos, p, len);
+         }
+     }
+@@ -1792,6 +1854,7 @@ ngx_http_script_complex_value_code(ngx_http_script_engine_t *e)
+     }
+ 
+     e->pos = e->buf.data;
++    e->end = e->buf.data + len;
+ 
+     e->sp->len = e->buf.len;
+     e->sp->data = e->buf.data;
+diff --git a/src/http/ngx_http_script.h b/src/http/ngx_http_script.h
+index 43600383c..b086b266f 100644
+--- a/src/http/ngx_http_script.h
++++ b/src/http/ngx_http_script.h
+@@ -17,6 +17,7 @@
+ typedef struct {
+     u_char                     *ip;
+     u_char                     *pos;
++    u_char                     *end;
+     ngx_http_variable_value_t  *sp;
+ 
+     ngx_str_t                   buf;
+@@ -240,6 +241,9 @@ void *ngx_http_script_start_code(ngx_pool_t *pool, ngx_array_t **codes,
+     size_t size);
+ void *ngx_http_script_add_code(ngx_array_t *codes, size_t size, void *code);
+ 
++ngx_int_t ngx_http_script_check_length(ngx_http_script_engine_t *e,
++    size_t len);
++
+ size_t ngx_http_script_copy_len_code(ngx_http_script_engine_t *e);
+ void ngx_http_script_copy_code(ngx_http_script_engine_t *e);
+ size_t ngx_http_script_copy_var_len_code(ngx_http_script_engine_t *e);
+diff --git a/src/stream/ngx_stream_script.c b/src/stream/ngx_stream_script.c
+index 2cd8b08c7..2e31102df 100644
+--- a/src/stream/ngx_stream_script.c
++++ b/src/stream/ngx_stream_script.c
+@@ -92,6 +92,7 @@ ngx_stream_complex_value(ngx_stream_session_t *s,
+ 
+     e.ip = val->values;
+     e.pos = value->data;
++    e.end = value->data + len;
+     e.buf = *value;
+ 
+     while (*(uintptr_t *) e.ip) {
+@@ -99,6 +100,10 @@ ngx_stream_complex_value(ngx_stream_session_t *s,
+         code((ngx_stream_script_engine_t *) &e);
+     }
+ 
++    if (e.status) {
++        return NGX_ERROR;
++    }
++
+     *value = e.buf;
+ 
+     return NGX_OK;
+@@ -526,12 +531,17 @@ ngx_stream_script_run(ngx_stream_session_t *s, ngx_str_t *value,
+ 
+     e.ip = code_values;
+     e.pos = value->data;
++    e.end = value->data + len;
+ 
+     while (*(uintptr_t *) e.ip) {
+         code = *(ngx_stream_script_code_pt *) e.ip;
+         code((ngx_stream_script_engine_t *) &e);
+     }
+ 
++    if (e.status) {
++        return NULL;
++    }
++
+     return e.pos;
+ }
+ 
+@@ -668,6 +678,25 @@ ngx_stream_script_add_code(ngx_array_t *codes, size_t size, void *code)
+ }
+ 
+ 
++ngx_int_t
++ngx_stream_script_check_length(ngx_stream_script_engine_t *e, size_t len)
++{
++    if (e->end == NULL) {
++        return NGX_OK;
++    }
++
++    if (e->end - e->pos < (ssize_t) len) {
++        ngx_log_error(NGX_LOG_ALERT, e->session->connection->log, 0,
++                      "no buffer space in script copy");
++        e->ip = ngx_stream_script_exit;
++        e->status = NGX_STREAM_INTERNAL_SERVER_ERROR;
++        return NGX_ERROR;
++    }
++
++    return NGX_OK;
++}
++
++
+ static ngx_int_t
+ ngx_stream_script_add_copy_code(ngx_stream_script_compile_t *sc,
+     ngx_str_t *value, ngx_uint_t last)
+@@ -737,6 +766,11 @@ ngx_stream_script_copy_code(ngx_stream_script_engine_t *e)
+     p = e->pos;
+ 
+     if (!e->skip) {
++
++        if (ngx_stream_script_check_length(e, code->len) != NGX_OK) {
++            return;
++        }
++
+         e->pos = ngx_copy(p, e->ip + sizeof(ngx_stream_script_copy_code_t),
+                           code->len);
+     }
+@@ -841,6 +875,11 @@ ngx_stream_script_copy_var_code(ngx_stream_script_engine_t *e)
+         }
+ 
+         if (value && !value->not_found) {
++
++            if (ngx_stream_script_check_length(e, value->len) != NGX_OK) {
++                return;
++            }
++
+             p = e->pos;
+             e->pos = ngx_copy(p, value->data, value->len);
+ 
+@@ -941,6 +980,11 @@ ngx_stream_script_copy_capture_code(ngx_stream_script_engine_t *e)
+         cap = s->captures;
+         len = cap[n + 1] - cap[n];
+         p = s->captures_data + cap[n];
++
++        if (ngx_stream_script_check_length(e, len) != NGX_OK) {
++            return;
++        }
++
+         e->pos = ngx_copy(pos, p, len);
+     }
+ 
+@@ -1013,6 +1057,7 @@ ngx_stream_script_full_name_code(ngx_stream_script_engine_t *e)
+         != NGX_OK)
+     {
+         e->ip = ngx_stream_script_exit;
++        e->status = NGX_STREAM_INTERNAL_SERVER_ERROR;
+         return;
+     }
+ 
+diff --git a/src/stream/ngx_stream_script.h b/src/stream/ngx_stream_script.h
+index d8f374047..dc6de9c72 100644
+--- a/src/stream/ngx_stream_script.h
++++ b/src/stream/ngx_stream_script.h
+@@ -17,6 +17,7 @@
+ typedef struct {
+     u_char                       *ip;
+     u_char                       *pos;
++    u_char                       *end;
+     ngx_stream_variable_value_t  *sp;
+ 
+     ngx_str_t                     buf;
+@@ -25,6 +26,7 @@ typedef struct {
+     unsigned                      flushed:1;
+     unsigned                      skip:1;
+ 
++    ngx_int_t                     status;
+     ngx_stream_session_t         *session;
+ } ngx_stream_script_engine_t;
+ 
+@@ -127,6 +129,9 @@ void ngx_stream_script_flush_no_cacheable_variables(ngx_stream_session_t *s,
+ 
+ void *ngx_stream_script_add_code(ngx_array_t *codes, size_t size, void *code);
+ 
++ngx_int_t ngx_stream_script_check_length(ngx_stream_script_engine_t *e,
++    size_t len);
++
+ size_t ngx_stream_script_copy_len_code(ngx_stream_script_engine_t *e);
+ void ngx_stream_script_copy_code(ngx_stream_script_engine_t *e);
+ size_t ngx_stream_script_copy_var_len_code(ngx_stream_script_engine_t *e);
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p3.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p3.patch
new file mode 100644
index 0000000000..2787cadb2d
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p3.patch
@@ -0,0 +1,704 @@
+From 78950bdcd443830bde00f6844dba3033c18862b1 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:55:38 +0300
+Subject: [PATCH] Access log: buffer overrun protection.
+
+Similarly to generic script operations, access log script copy operations
+now check if there is enough room in the buffer.
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/ceff7ca7785a>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/78950bdcd443830bde00f6844dba3033c18862b1]
+
+(cherry picked from commit 78950bdcd443830bde00f6844dba3033c18862b1)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_log_module.c | 185 ++++++++++++++++++++-----
+ src/stream/ngx_stream_log_module.c     | 101 +++++++++++---
+ 2 files changed, 235 insertions(+), 51 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_log_module.c b/src/http/modules/ngx_http_log_module.c
+index f7c4bd2f5..d282362ea 100644
+--- a/src/http/modules/ngx_http_log_module.c
++++ b/src/http/modules/ngx_http_log_module.c
+@@ -17,7 +17,7 @@
+ typedef struct ngx_http_log_op_s  ngx_http_log_op_t;
+ 
+ typedef u_char *(*ngx_http_log_op_run_pt) (ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ 
+ typedef size_t (*ngx_http_log_op_getlen_pt) (ngx_http_request_t *r,
+     uintptr_t data);
+@@ -112,39 +112,42 @@ static void ngx_http_log_flush(ngx_open_file_t *file, ngx_log_t *log);
+ static void ngx_http_log_flush_handler(ngx_event_t *ev);
+ 
+ static u_char *ngx_http_log_pipe(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_time(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_iso8601(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_msec(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_request_time(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_status(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_bytes_sent(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
+-static u_char *ngx_http_log_body_bytes_sent(ngx_http_request_t *r,
+-    u_char *buf, ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
++static u_char *ngx_http_log_body_bytes_sent(ngx_http_request_t *r, u_char *buf,
++    u_char *end, ngx_http_log_op_t *op);
+ static u_char *ngx_http_log_request_length(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ 
+ static ngx_int_t ngx_http_log_variable_compile(ngx_conf_t *cf,
+     ngx_http_log_op_t *op, ngx_str_t *value, ngx_uint_t escape);
+ static size_t ngx_http_log_variable_getlen(ngx_http_request_t *r,
+     uintptr_t data);
+ static u_char *ngx_http_log_variable(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static uintptr_t ngx_http_log_escape(u_char *dst, u_char *src, size_t size);
+ static size_t ngx_http_log_json_variable_getlen(ngx_http_request_t *r,
+     uintptr_t data);
+ static u_char *ngx_http_log_json_variable(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op);
++    u_char *end, ngx_http_log_op_t *op);
+ static size_t ngx_http_log_unescaped_variable_getlen(ngx_http_request_t *r,
+     uintptr_t data);
+ static u_char *ngx_http_log_unescaped_variable(ngx_http_request_t *r,
+-    u_char *buf, ngx_http_log_op_t *op);
++    u_char *buf, u_char *end, ngx_http_log_op_t *op);
++
++static ngx_int_t ngx_http_log_check_length(ngx_http_request_t *r,
++    u_char *buf, u_char *end, size_t len);
+ 
+ 
+ static void *ngx_http_log_create_main_conf(ngx_conf_t *cf);
+@@ -253,7 +256,7 @@ static ngx_http_log_var_t  ngx_http_log_vars[] = {
+ static ngx_int_t
+ ngx_http_log_handler(ngx_http_request_t *r)
+ {
+-    u_char                   *line, *p;
++    u_char                   *line, *p, *end;
+     size_t                    len, size;
+     ssize_t                   n;
+     ngx_str_t                 val;
+@@ -309,6 +312,8 @@ ngx_http_log_handler(ngx_http_request_t *r)
+             }
+         }
+ 
++        len += NGX_LINEFEED_SIZE;
++
+         if (log[l].syslog_peer) {
+ 
+             /* length of syslog's PRI and HEADER message parts */
+@@ -319,8 +324,6 @@ ngx_http_log_handler(ngx_http_request_t *r)
+             goto alloc_line;
+         }
+ 
+-        len += NGX_LINEFEED_SIZE;
+-
+         buffer = log[l].file ? log[l].file->data : NULL;
+ 
+         if (buffer) {
+@@ -336,13 +339,18 @@ ngx_http_log_handler(ngx_http_request_t *r)
+             if (len <= (size_t) (buffer->last - buffer->pos)) {
+ 
+                 p = buffer->pos;
++                end = p + len - NGX_LINEFEED_SIZE;
+ 
+                 if (buffer->event && p == buffer->start) {
+                     ngx_add_timer(buffer->event, buffer->flush);
+                 }
+ 
+-                for (i = 0; i < log[l].format->ops->nelts; i++) {
+-                    p = op[i].run(r, p, &op[i]);
++                for (i = 0; i < log[l].format->ops->nelts && p; i++) {
++                    p = op[i].run(r, p, end, &op[i]);
++                }
++
++                if (p == NULL) {
++                    return NGX_ERROR;
+                 }
+ 
+                 ngx_linefeed(p);
+@@ -365,13 +373,18 @@ ngx_http_log_handler(ngx_http_request_t *r)
+         }
+ 
+         p = line;
++        end = line + len - NGX_LINEFEED_SIZE;
+ 
+         if (log[l].syslog_peer) {
+             p = ngx_syslog_add_header(log[l].syslog_peer, line);
+         }
+ 
+-        for (i = 0; i < log[l].format->ops->nelts; i++) {
+-            p = op[i].run(r, p, &op[i]);
++        for (i = 0; i < log[l].format->ops->nelts && p; i++) {
++            p = op[i].run(r, p, end, &op[i]);
++        }
++
++        if (p == NULL) {
++            return NGX_ERROR;
+         }
+ 
+         if (log[l].syslog_peer) {
+@@ -770,7 +783,7 @@ ngx_http_log_flush_handler(ngx_event_t *ev)
+ 
+ 
+ static u_char *
+-ngx_http_log_copy_short(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_copy_short(ngx_http_request_t *r, u_char *buf, u_char *end,
+     ngx_http_log_op_t *op)
+ {
+     size_t     len;
+@@ -779,6 +792,10 @@ ngx_http_log_copy_short(ngx_http_request_t *r, u_char *buf,
+     len = op->len;
+     data = op->data;
+ 
++    if (ngx_http_log_check_length(r, buf, end, len) != NGX_OK) {
++        return NULL;
++    }
++
+     while (len--) {
+         *buf++ = (u_char) (data & 0xff);
+         data >>= 8;
+@@ -789,16 +806,25 @@ ngx_http_log_copy_short(ngx_http_request_t *r, u_char *buf,
+ 
+ 
+ static u_char *
+-ngx_http_log_copy_long(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_copy_long(ngx_http_request_t *r, u_char *buf, u_char *end,
+     ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, op->len) != NGX_OK) {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, (u_char *) op->data, op->len);
+ }
+ 
+ 
+ static u_char *
+-ngx_http_log_pipe(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
++ngx_http_log_pipe(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, 1) != NGX_OK) {
++        return NULL;
++    }
++
+     if (r->pipeline) {
+         *buf = 'p';
+     } else {
+@@ -810,24 +836,43 @@ ngx_http_log_pipe(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
+ 
+ 
+ static u_char *
+-ngx_http_log_time(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
++ngx_http_log_time(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, ngx_cached_http_log_time.len)
++        != NGX_OK)
++    {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, ngx_cached_http_log_time.data,
+                       ngx_cached_http_log_time.len);
+ }
+ 
+ static u_char *
+-ngx_http_log_iso8601(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
++ngx_http_log_iso8601(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, ngx_cached_http_log_iso8601.len)
++        != NGX_OK)
++    {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, ngx_cached_http_log_iso8601.data,
+                       ngx_cached_http_log_iso8601.len);
+ }
+ 
+ static u_char *
+-ngx_http_log_msec(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
++ngx_http_log_msec(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
+     ngx_time_t  *tp;
+ 
++    if (ngx_http_log_check_length(r, buf, end, NGX_TIME_T_LEN + 4) != NGX_OK) {
++        return NULL;
++    }
++
+     tp = ngx_timeofday();
+ 
+     return ngx_sprintf(buf, "%T.%03M", tp->sec, tp->msec);
+@@ -835,12 +880,16 @@ ngx_http_log_msec(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
+ 
+ 
+ static u_char *
+-ngx_http_log_request_time(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_request_time(ngx_http_request_t *r, u_char *buf, u_char *end,
+     ngx_http_log_op_t *op)
+ {
+     ngx_time_t      *tp;
+     ngx_msec_int_t   ms;
+ 
++    if (ngx_http_log_check_length(r, buf, end, NGX_TIME_T_LEN + 4) != NGX_OK) {
++        return NULL;
++    }
++
+     tp = ngx_timeofday();
+ 
+     ms = (ngx_msec_int_t)
+@@ -852,10 +901,15 @@ ngx_http_log_request_time(ngx_http_request_t *r, u_char *buf,
+ 
+ 
+ static u_char *
+-ngx_http_log_status(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
++ngx_http_log_status(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
+     ngx_uint_t  status;
+ 
++    if (ngx_http_log_check_length(r, buf, end, NGX_INT_T_LEN) != NGX_OK) {
++        return NULL;
++    }
++
+     if (r->err_status) {
+         status = r->err_status;
+ 
+@@ -874,9 +928,13 @@ ngx_http_log_status(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
+ 
+ 
+ static u_char *
+-ngx_http_log_bytes_sent(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_bytes_sent(ngx_http_request_t *r, u_char *buf, u_char *end,
+     ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, NGX_OFF_T_LEN) != NGX_OK) {
++        return NULL;
++    }
++
+     return ngx_sprintf(buf, "%O", r->connection->sent);
+ }
+ 
+@@ -887,11 +945,15 @@ ngx_http_log_bytes_sent(ngx_http_request_t *r, u_char *buf,
+  */
+ 
+ static u_char *
+-ngx_http_log_body_bytes_sent(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_body_bytes_sent(ngx_http_request_t *r, u_char *buf, u_char *end,
+     ngx_http_log_op_t *op)
+ {
+     off_t  length;
+ 
++    if (ngx_http_log_check_length(r, buf, end, NGX_OFF_T_LEN) != NGX_OK) {
++        return NULL;
++    }
++
+     length = r->connection->sent - r->header_size;
+ 
+     if (length > 0) {
+@@ -905,9 +967,13 @@ ngx_http_log_body_bytes_sent(ngx_http_request_t *r, u_char *buf,
+ 
+ 
+ static u_char *
+-ngx_http_log_request_length(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_request_length(ngx_http_request_t *r, u_char *buf, u_char *end,
+     ngx_http_log_op_t *op)
+ {
++    if (ngx_http_log_check_length(r, buf, end, NGX_OFF_T_LEN) != NGX_OK) {
++        return NULL;
++    }
++
+     return ngx_sprintf(buf, "%O", r->request_length);
+ }
+ 
+@@ -968,21 +1034,39 @@ ngx_http_log_variable_getlen(ngx_http_request_t *r, uintptr_t data)
+ 
+ 
+ static u_char *
+-ngx_http_log_variable(ngx_http_request_t *r, u_char *buf, ngx_http_log_op_t *op)
++ngx_http_log_variable(ngx_http_request_t *r, u_char *buf, u_char *end,
++    ngx_http_log_op_t *op)
+ {
++    uintptr_t                   len;
+     ngx_http_variable_value_t  *value;
+ 
+     value = ngx_http_get_indexed_variable(r, op->data);
+ 
+     if (value == NULL || value->not_found) {
++        if (ngx_http_log_check_length(r, buf, end, 1) != NGX_OK) {
++            return NULL;
++        }
++
+         *buf = '-';
+         return buf + 1;
+     }
+ 
+     if (value->escape == 0) {
++        if (ngx_http_log_check_length(r, buf, end, value->len) != NGX_OK) {
++            return NULL;
++        }
++
+         return ngx_cpymem(buf, value->data, value->len);
+ 
+     } else {
++        len = ngx_http_log_escape(NULL, value->data, value->len);
++
++        if (ngx_http_log_check_length(r, buf, end, value->len + len * 3)
++            != NGX_OK)
++        {
++            return NULL;
++        }
++
+         return (u_char *) ngx_http_log_escape(buf, value->data, value->len);
+     }
+ }
+@@ -1069,9 +1153,10 @@ ngx_http_log_json_variable_getlen(ngx_http_request_t *r, uintptr_t data)
+ 
+ 
+ static u_char *
+-ngx_http_log_json_variable(ngx_http_request_t *r, u_char *buf,
++ngx_http_log_json_variable(ngx_http_request_t *r, u_char *buf, u_char *end,
+     ngx_http_log_op_t *op)
+ {
++    uintptr_t                   len;
+     ngx_http_variable_value_t  *value;
+ 
+     value = ngx_http_get_indexed_variable(r, op->data);
+@@ -1081,9 +1166,21 @@ ngx_http_log_json_variable(ngx_http_request_t *r, u_char *buf,
+     }
+ 
+     if (value->escape == 0) {
++        if (ngx_http_log_check_length(r, buf, end, value->len) != NGX_OK) {
++            return NULL;
++        }
++
+         return ngx_cpymem(buf, value->data, value->len);
+ 
+     } else {
++        len = ngx_escape_json(NULL, value->data, value->len);
++
++        if (ngx_http_log_check_length(r, buf, end, value->len + len)
++            != NGX_OK)
++        {
++            return NULL;
++        }
++
+         return (u_char *) ngx_escape_json(buf, value->data, value->len);
+     }
+ }
+@@ -1108,7 +1205,7 @@ ngx_http_log_unescaped_variable_getlen(ngx_http_request_t *r, uintptr_t data)
+ 
+ static u_char *
+ ngx_http_log_unescaped_variable(ngx_http_request_t *r, u_char *buf,
+-    ngx_http_log_op_t *op)
++    u_char *end, ngx_http_log_op_t *op)
+ {
+     ngx_http_variable_value_t  *value;
+ 
+@@ -1118,10 +1215,28 @@ ngx_http_log_unescaped_variable(ngx_http_request_t *r, u_char *buf,
+         return buf;
+     }
+ 
++    if (ngx_http_log_check_length(r, buf, end, value->len) != NGX_OK) {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, value->data, value->len);
+ }
+ 
+ 
++static ngx_int_t
++ngx_http_log_check_length(ngx_http_request_t *r, u_char *buf, u_char *end,
++    size_t len)
++{
++    if (end - buf < (ssize_t) len) {
++        ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                      "no buffer space in log script copy");
++        return NGX_ERROR;
++    }
++
++    return NGX_OK;
++}
++
++
+ static void *
+ ngx_http_log_create_main_conf(ngx_conf_t *cf)
+ {
+diff --git a/src/stream/ngx_stream_log_module.c b/src/stream/ngx_stream_log_module.c
+index 0ff7f4244..774bc7e93 100644
+--- a/src/stream/ngx_stream_log_module.c
++++ b/src/stream/ngx_stream_log_module.c
+@@ -17,7 +17,7 @@
+ typedef struct ngx_stream_log_op_s  ngx_stream_log_op_t;
+ 
+ typedef u_char *(*ngx_stream_log_op_run_pt) (ngx_stream_session_t *s,
+-    u_char *buf, ngx_stream_log_op_t *op);
++    u_char *buf, u_char *end, ngx_stream_log_op_t *op);
+ 
+ typedef size_t (*ngx_stream_log_op_getlen_pt) (ngx_stream_session_t *s,
+     uintptr_t data);
+@@ -115,16 +115,19 @@ static ngx_int_t ngx_stream_log_variable_compile(ngx_conf_t *cf,
+ static size_t ngx_stream_log_variable_getlen(ngx_stream_session_t *s,
+     uintptr_t data);
+ static u_char *ngx_stream_log_variable(ngx_stream_session_t *s, u_char *buf,
+-    ngx_stream_log_op_t *op);
++    u_char *end, ngx_stream_log_op_t *op);
+ static uintptr_t ngx_stream_log_escape(u_char *dst, u_char *src, size_t size);
+ static size_t ngx_stream_log_json_variable_getlen(ngx_stream_session_t *s,
+     uintptr_t data);
+ static u_char *ngx_stream_log_json_variable(ngx_stream_session_t *s,
+-    u_char *buf, ngx_stream_log_op_t *op);
++    u_char *buf, u_char *end, ngx_stream_log_op_t *op);
+ static size_t ngx_stream_log_unescaped_variable_getlen(ngx_stream_session_t *s,
+     uintptr_t data);
+ static u_char *ngx_stream_log_unescaped_variable(ngx_stream_session_t *s,
+-    u_char *buf, ngx_stream_log_op_t *op);
++    u_char *buf, u_char *end, ngx_stream_log_op_t *op);
++
++static ngx_int_t ngx_stream_log_check_length(ngx_stream_session_t *s,
++    u_char *buf, u_char *end, size_t len);
+ 
+ 
+ static void *ngx_stream_log_create_main_conf(ngx_conf_t *cf);
+@@ -200,7 +203,7 @@ ngx_module_t  ngx_stream_log_module = {
+ static ngx_int_t
+ ngx_stream_log_handler(ngx_stream_session_t *s)
+ {
+-    u_char                     *line, *p;
++    u_char                     *line, *p, *end;
+     size_t                      len, size;
+     ssize_t                     n;
+     ngx_str_t                   val;
+@@ -257,6 +260,8 @@ ngx_stream_log_handler(ngx_stream_session_t *s)
+             }
+         }
+ 
++        len += NGX_LINEFEED_SIZE;
++
+         if (log[l].syslog_peer) {
+ 
+             /* length of syslog's PRI and HEADER message parts */
+@@ -267,8 +272,6 @@ ngx_stream_log_handler(ngx_stream_session_t *s)
+             goto alloc_line;
+         }
+ 
+-        len += NGX_LINEFEED_SIZE;
+-
+         buffer = log[l].file ? log[l].file->data : NULL;
+ 
+         if (buffer) {
+@@ -284,13 +287,18 @@ ngx_stream_log_handler(ngx_stream_session_t *s)
+             if (len <= (size_t) (buffer->last - buffer->pos)) {
+ 
+                 p = buffer->pos;
++                end = p + len - NGX_LINEFEED_SIZE;
+ 
+                 if (buffer->event && p == buffer->start) {
+                     ngx_add_timer(buffer->event, buffer->flush);
+                 }
+ 
+-                for (i = 0; i < log[l].format->ops->nelts; i++) {
+-                    p = op[i].run(s, p, &op[i]);
++                for (i = 0; i < log[l].format->ops->nelts && p; i++) {
++                    p = op[i].run(s, p, end, &op[i]);
++                }
++
++                if (p == NULL) {
++                    return NGX_ERROR;
+                 }
+ 
+                 ngx_linefeed(p);
+@@ -313,13 +321,18 @@ ngx_stream_log_handler(ngx_stream_session_t *s)
+         }
+ 
+         p = line;
++        end = p + len - NGX_LINEFEED_SIZE;
+ 
+         if (log[l].syslog_peer) {
+             p = ngx_syslog_add_header(log[l].syslog_peer, line);
+         }
+ 
+-        for (i = 0; i < log[l].format->ops->nelts; i++) {
+-            p = op[i].run(s, p, &op[i]);
++        for (i = 0; i < log[l].format->ops->nelts && p; i++) {
++            p = op[i].run(s, p, end, &op[i]);
++        }
++
++        if (p == NULL) {
++            return NGX_ERROR;
+         }
+ 
+         if (log[l].syslog_peer) {
+@@ -663,7 +676,7 @@ ngx_stream_log_flush_handler(ngx_event_t *ev)
+ 
+ 
+ static u_char *
+-ngx_stream_log_copy_short(ngx_stream_session_t *s, u_char *buf,
++ngx_stream_log_copy_short(ngx_stream_session_t *s, u_char *buf, u_char *end,
+     ngx_stream_log_op_t *op)
+ {
+     size_t     len;
+@@ -672,6 +685,10 @@ ngx_stream_log_copy_short(ngx_stream_session_t *s, u_char *buf,
+     len = op->len;
+     data = op->data;
+ 
++    if (ngx_stream_log_check_length(s, buf, end, len) != NGX_OK) {
++        return NULL;
++    }
++
+     while (len--) {
+         *buf++ = (u_char) (data & 0xff);
+         data >>= 8;
+@@ -682,9 +699,13 @@ ngx_stream_log_copy_short(ngx_stream_session_t *s, u_char *buf,
+ 
+ 
+ static u_char *
+-ngx_stream_log_copy_long(ngx_stream_session_t *s, u_char *buf,
++ngx_stream_log_copy_long(ngx_stream_session_t *s, u_char *buf, u_char *end,
+     ngx_stream_log_op_t *op)
+ {
++    if (ngx_stream_log_check_length(s, buf, end, op->len) != NGX_OK) {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, (u_char *) op->data, op->len);
+ }
+ 
+@@ -745,22 +766,39 @@ ngx_stream_log_variable_getlen(ngx_stream_session_t *s, uintptr_t data)
+ 
+ 
+ static u_char *
+-ngx_stream_log_variable(ngx_stream_session_t *s, u_char *buf,
++ngx_stream_log_variable(ngx_stream_session_t *s, u_char *buf, u_char *end,
+     ngx_stream_log_op_t *op)
+ {
++    uintptr_t                     len;
+     ngx_stream_variable_value_t  *value;
+ 
+     value = ngx_stream_get_indexed_variable(s, op->data);
+ 
+     if (value == NULL || value->not_found) {
++        if (ngx_stream_log_check_length(s, buf, end, 1) != NGX_OK) {
++            return NULL;
++        }
++
+         *buf = '-';
+         return buf + 1;
+     }
+ 
+     if (value->escape == 0) {
++        if (ngx_stream_log_check_length(s, buf, end, value->len) != NGX_OK) {
++            return NULL;
++        }
++
+         return ngx_cpymem(buf, value->data, value->len);
+ 
+     } else {
++        len = ngx_stream_log_escape(NULL, value->data, value->len);
++
++        if (ngx_stream_log_check_length(s, buf, end, value->len + len * 3)
++            != NGX_OK)
++        {
++            return NULL;
++        }
++
+         return (u_char *) ngx_stream_log_escape(buf, value->data, value->len);
+     }
+ }
+@@ -847,9 +885,10 @@ ngx_stream_log_json_variable_getlen(ngx_stream_session_t *s, uintptr_t data)
+ 
+ 
+ static u_char *
+-ngx_stream_log_json_variable(ngx_stream_session_t *s, u_char *buf,
++ngx_stream_log_json_variable(ngx_stream_session_t *s, u_char *buf, u_char *end,
+     ngx_stream_log_op_t *op)
+ {
++    uintptr_t                     len;
+     ngx_stream_variable_value_t  *value;
+ 
+     value = ngx_stream_get_indexed_variable(s, op->data);
+@@ -859,9 +898,21 @@ ngx_stream_log_json_variable(ngx_stream_session_t *s, u_char *buf,
+     }
+ 
+     if (value->escape == 0) {
++        if (ngx_stream_log_check_length(s, buf, end, value->len) != NGX_OK) {
++            return NULL;
++        }
++
+         return ngx_cpymem(buf, value->data, value->len);
+ 
+     } else {
++        len = ngx_escape_json(NULL, value->data, value->len);
++
++        if (ngx_stream_log_check_length(s, buf, end, value->len + len)
++            != NGX_OK)
++        {
++            return NULL;
++        }
++
+         return (u_char *) ngx_escape_json(buf, value->data, value->len);
+     }
+ }
+@@ -887,7 +938,7 @@ ngx_stream_log_unescaped_variable_getlen(ngx_stream_session_t *s,
+ 
+ static u_char *
+ ngx_stream_log_unescaped_variable(ngx_stream_session_t *s, u_char *buf,
+-                                  ngx_stream_log_op_t *op)
++    u_char *end, ngx_stream_log_op_t *op)
+ {
+     ngx_stream_variable_value_t  *value;
+ 
+@@ -897,10 +948,28 @@ ngx_stream_log_unescaped_variable(ngx_stream_session_t *s, u_char *buf,
+         return buf;
+     }
+ 
++    if (ngx_stream_log_check_length(s, buf, end, value->len) != NGX_OK) {
++        return NULL;
++    }
++
+     return ngx_cpymem(buf, value->data, value->len);
+ }
+ 
+ 
++static ngx_int_t
++ngx_stream_log_check_length(ngx_stream_session_t *s, u_char *buf, u_char *end,
++    size_t len)
++{
++    if (end - buf < (ssize_t) len) {
++        ngx_log_error(NGX_LOG_ALERT, s->connection->log, 0,
++                      "no buffer space in log script copy");
++        return NGX_ERROR;
++    }
++
++    return NGX_OK;
++}
++
++
+ static void *
+ ngx_stream_log_create_main_conf(ngx_conf_t *cf)
+ {
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p5.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p5.patch
new file mode 100644
index 0000000000..d9d4f730cd
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42533_p5.patch
@@ -0,0 +1,254 @@
+From 97e40e59b7b4ad6aa36f54ce4f1e64d1e98f24cb Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Fri, 3 Jul 2026 15:11:09 +0400
+Subject: [PATCH] Script: avoid garbage at the end of the result string
+
+If the script result turned out to be shorter than its predicted
+length, the result string contained uninitialized bytes at the end.
+The fix is to cut the result string by its actual size.
+
+The following locations returned trailing garbage to the client with
+URI "/1234abcd".
+
+    map $uri $foo {
+        ~^/(?<bar>[0-9]).*$ $bar;
+    }
+
+    location ~(?<bar>[0-9]*)[a-z]*$ {
+        return 200 $1:$foo;
+    }
+
+    location ~(?<bar>[0-9]*)[a-z]*$ {
+        set $qux $1:$foo;
+        return 200 $qux;
+    }
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/97e40e59b7b4ad6aa36f54ce4f1e64d1e98f24cb]
+
+(cherry picked from commit 97e40e59b7b4ad6aa36f54ce4f1e64d1e98f24cb)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_rewrite_module.c | 18 ++++++++++---
+ src/http/ngx_http_script.c                 | 30 +++++++++++++++++-----
+ src/http/ngx_http_script.h                 |  6 +++++
+ src/stream/ngx_stream_script.c             | 18 +++++++++----
+ 4 files changed, 57 insertions(+), 15 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_rewrite_module.c b/src/http/modules/ngx_http_rewrite_module.c
+index ff3b68716..eefe4c8c8 100644
+--- a/src/http/modules/ngx_http_rewrite_module.c
++++ b/src/http/modules/ngx_http_rewrite_module.c
+@@ -966,10 +966,11 @@ static char *
+ ngx_http_rewrite_value(ngx_conf_t *cf, ngx_http_rewrite_loc_conf_t *lcf,
+     ngx_str_t *value)
+ {
+-    ngx_int_t                              n;
+-    ngx_http_script_compile_t              sc;
+-    ngx_http_script_value_code_t          *val;
+-    ngx_http_script_complex_value_code_t  *complex;
++    ngx_int_t                                  n;
++    ngx_http_script_compile_t                  sc;
++    ngx_http_script_value_code_t              *val;
++    ngx_http_script_complex_value_code_t      *complex;
++    ngx_http_script_complex_value_end_code_t  *complex_end;
+ 
+     n = ngx_http_script_variables_count(value);
+ 
+@@ -1016,5 +1017,14 @@ ngx_http_rewrite_value(ngx_conf_t *cf, ngx_http_rewrite_loc_conf_t *lcf,
+         return NGX_CONF_ERROR;
+     }
+ 
++    complex_end = ngx_http_script_add_code(lcf->codes,
++                              sizeof(ngx_http_script_complex_value_end_code_t),
++                              &complex);
++    if (complex_end == NULL) {
++        return NGX_CONF_ERROR;
++    }
++
++    complex_end->code = ngx_http_script_complex_value_end_code;
++
+     return NGX_CONF_OK;
+ }
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+index d3af4408d..9c97a5b08 100644
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -103,7 +103,8 @@ ngx_http_complex_value(ngx_http_request_t *r, ngx_http_complex_value_t *val,
+         return NGX_ERROR;
+     }
+ 
+-    *value = e.buf;
++    value->data = e.buf.data;
++    value->len = e.pos - e.buf.data;
+ 
+     return NGX_OK;
+ }
+@@ -620,6 +621,7 @@ u_char *
+ ngx_http_script_run(ngx_http_request_t *r, ngx_str_t *value,
+     void *code_lengths, size_t len, void *code_values)
+ {
++    size_t                        n;
+     ngx_uint_t                    i;
+     ngx_http_script_code_pt       code;
+     ngx_http_script_len_code_pt   lcode;
+@@ -641,21 +643,23 @@ ngx_http_script_run(ngx_http_request_t *r, ngx_str_t *value,
+     e.request = r;
+     e.flushed = 1;
+ 
++    n = len;
++
+     while (*(uintptr_t *) e.ip) {
+         lcode = *(ngx_http_script_len_code_pt *) e.ip;
+-        len += lcode(&e);
++        n += lcode(&e);
+     }
+ 
+ 
+-    value->len = len;
+-    value->data = ngx_pnalloc(r->pool, len);
++    value->len = n;
++    value->data = ngx_pnalloc(r->pool, n);
+     if (value->data == NULL) {
+         return NULL;
+     }
+ 
+     e.ip = code_values;
+     e.pos = value->data;
+-    e.end = value->data + len;
++    e.end = value->data + n;
+ 
+     while (*(uintptr_t *) e.ip) {
+         code = *(ngx_http_script_code_pt *) e.ip;
+@@ -666,6 +670,8 @@ ngx_http_script_run(ngx_http_request_t *r, ngx_str_t *value,
+         return NULL;
+     }
+ 
++    value->len = e.pos + len - value->data;
++
+     return e.pos;
+ }
+ 
+@@ -1548,6 +1554,8 @@ ngx_http_script_full_name_code(ngx_http_script_engine_t *e)
+     }
+ 
+     e->buf = value;
++    e->pos = value.data + value.len;
++    e->end = e->pos;
+ 
+     ngx_log_debug1(NGX_LOG_DEBUG_HTTP, e->request->connection->log, 0,
+                    "http script fullname: \"%V\"", &value);
+@@ -1855,8 +1863,18 @@ ngx_http_script_complex_value_code(ngx_http_script_engine_t *e)
+ 
+     e->pos = e->buf.data;
+     e->end = e->buf.data + len;
++}
++
++
++void
++ngx_http_script_complex_value_end_code(ngx_http_script_engine_t *e)
++{
++    e->ip += sizeof(ngx_http_script_complex_value_end_code_t);
++
++    ngx_log_debug0(NGX_LOG_DEBUG_HTTP, e->request->connection->log, 0,
++                   "http script complex value end");
+ 
+-    e->sp->len = e->buf.len;
++    e->sp->len = e->pos - e->buf.data;
+     e->sp->data = e->buf.data;
+     e->sp++;
+ }
+diff --git a/src/http/ngx_http_script.h b/src/http/ngx_http_script.h
+index b086b266f..4f2fbd16e 100644
+--- a/src/http/ngx_http_script.h
++++ b/src/http/ngx_http_script.h
+@@ -200,6 +200,11 @@ typedef struct {
+ } ngx_http_script_complex_value_code_t;
+ 
+ 
++typedef struct {
++    ngx_http_script_code_pt     code;
++} ngx_http_script_complex_value_end_code_t;
++
++
+ typedef struct {
+     ngx_http_script_code_pt     code;
+     uintptr_t                   value;
+@@ -263,6 +268,7 @@ void ngx_http_script_equal_code(ngx_http_script_engine_t *e);
+ void ngx_http_script_not_equal_code(ngx_http_script_engine_t *e);
+ void ngx_http_script_file_code(ngx_http_script_engine_t *e);
+ void ngx_http_script_complex_value_code(ngx_http_script_engine_t *e);
++void ngx_http_script_complex_value_end_code(ngx_http_script_engine_t *e);
+ void ngx_http_script_value_code(ngx_http_script_engine_t *e);
+ void ngx_http_script_set_var_code(ngx_http_script_engine_t *e);
+ void ngx_http_script_var_set_handler_code(ngx_http_script_engine_t *e);
+diff --git a/src/stream/ngx_stream_script.c b/src/stream/ngx_stream_script.c
+index 2e31102df..559b8b9fb 100644
+--- a/src/stream/ngx_stream_script.c
++++ b/src/stream/ngx_stream_script.c
+@@ -104,7 +104,8 @@ ngx_stream_complex_value(ngx_stream_session_t *s,
+         return NGX_ERROR;
+     }
+ 
+-    *value = e.buf;
++    value->data = e.buf.data;
++    value->len = e.pos - e.buf.data;
+ 
+     return NGX_OK;
+ }
+@@ -496,6 +497,7 @@ u_char *
+ ngx_stream_script_run(ngx_stream_session_t *s, ngx_str_t *value,
+     void *code_lengths, size_t len, void *code_values)
+ {
++    size_t                          n;
+     ngx_uint_t                      i;
+     ngx_stream_script_code_pt       code;
+     ngx_stream_script_engine_t      e;
+@@ -517,21 +519,23 @@ ngx_stream_script_run(ngx_stream_session_t *s, ngx_str_t *value,
+     e.session = s;
+     e.flushed = 1;
+ 
++    n = len;
++
+     while (*(uintptr_t *) e.ip) {
+         lcode = *(ngx_stream_script_len_code_pt *) e.ip;
+-        len += lcode(&e);
++        n += lcode(&e);
+     }
+ 
+ 
+-    value->len = len;
+-    value->data = ngx_pnalloc(s->connection->pool, len);
++    value->len = n;
++    value->data = ngx_pnalloc(s->connection->pool, n);
+     if (value->data == NULL) {
+         return NULL;
+     }
+ 
+     e.ip = code_values;
+     e.pos = value->data;
+-    e.end = value->data + len;
++    e.end = value->data + n;
+ 
+     while (*(uintptr_t *) e.ip) {
+         code = *(ngx_stream_script_code_pt *) e.ip;
+@@ -542,6 +546,8 @@ ngx_stream_script_run(ngx_stream_session_t *s, ngx_str_t *value,
+         return NULL;
+     }
+ 
++    value->len = e.pos + len - value->data;
++
+     return e.pos;
+ }
+ 
+@@ -1062,6 +1068,8 @@ ngx_stream_script_full_name_code(ngx_stream_script_engine_t *e)
+     }
+ 
+     e->buf = value;
++    e->pos = value.data + value.len;
++    e->end = e->pos;
+ 
+     ngx_log_debug1(NGX_LOG_DEBUG_STREAM, e->session->connection->log, 0,
+                    "stream script fullname: \"%V\"", &value);
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42533_p4.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42533_p4.patch
new file mode 100644
index 0000000000..599970bafa
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.28.3/CVE-2026-42533_p4.patch
@@ -0,0 +1,587 @@
+From 326b17b0038321c29252e79bf4c53d4773fcb8b5 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:54:46 +0300
+Subject: [PATCH] Script: buffer overrun protection in direct script usage.
+
+Following the previous change, this change adds script overrun
+protection to direct script evaluation in the proxy, fastcgi, scgi,
+uwsgi, grpc proxy, index, and try_files modules.
+
+This change is a modified version of a patch by Maxim Dounin.  The
+modifications include ngx_http_proxy_v2_module and hardened size checks.
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/7e4d7feb4c77>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/326b17b0038321c29252e79bf4c53d4773fcb8b5]
+
+Backport Changes:
+- Dropped the ngx_http_proxy_v2_module.c hunk because that module is not
+  available in nginx 1.28.3.
+
+(cherry picked from commit 326b17b0038321c29252e79bf4c53d4773fcb8b5)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_fastcgi_module.c   | 26 ++++++++--
+ src/http/modules/ngx_http_grpc_module.c      | 52 ++++++++++++++++++--
+ src/http/modules/ngx_http_index_module.c     | 13 ++++-
+ src/http/modules/ngx_http_proxy_module.c     | 31 ++++++++++--
+ src/http/modules/ngx_http_scgi_module.c      | 27 +++++++++-
+ src/http/modules/ngx_http_try_files_module.c | 17 ++++++-
+ src/http/modules/ngx_http_uwsgi_module.c     | 30 ++++++++++-
+ 7 files changed, 180 insertions(+), 16 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_fastcgi_module.c b/src/http/modules/ngx_http_fastcgi_module.c
+index 6b1977340..ea8542caf 100644
+--- a/src/http/modules/ngx_http_fastcgi_module.c
++++ b/src/http/modules/ngx_http_fastcgi_module.c
+@@ -836,8 +836,8 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+ {
+     off_t                         file_pos;
+     u_char                        ch, sep, *pos, *lowcase_key;
+-    size_t                        size, len, key_len, val_len, padding,
+-                                  allocated;
++    size_t                        size, len, params_len,
++                                  key_len, val_len, padding, allocated;
+     ngx_uint_t                    i, n, next, hash, skip_empty, header_params;
+     ngx_buf_t                    *b;
+     ngx_chain_t                  *cl, *body;
+@@ -852,6 +852,7 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+     ngx_http_script_len_code_pt   lcode;
+ 
+     len = 0;
++    params_len = 0;
+     header_params = 0;
+     ignored = NULL;
+ 
+@@ -891,8 +892,10 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
+-            len += 1 + key_len + ((val_len > 127) ? 4 : 1) + val_len;
++            params_len += 1 + key_len + ((val_len > 127) ? 4 : 1) + val_len;
+         }
++
++        len += params_len;
+     }
+ 
+     if (flcf->upstream.pass_request_headers) {
+@@ -1048,6 +1051,7 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+ 
+         e.ip = params->values->elts;
+         e.pos = b->last;
++        e.end = b->last + params_len;
+         e.request = r;
+         e.flushed = 1;
+ 
+@@ -1080,6 +1084,12 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
++            if (ngx_http_script_check_length(&e, 1 + ((val_len > 127) ? 4 : 1))
++                != NGX_OK)
++            {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ = (u_char) key_len;
+ 
+             if (val_len > 127) {
+@@ -1098,12 +1108,22 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+             }
+             e.ip += sizeof(uintptr_t);
+ 
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+             ngx_log_debug4(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
+                            "fastcgi param: \"%*s: %*s\"",
+                            key_len, e.pos - (key_len + val_len),
+                            val_len, e.pos - val_len);
+         }
+ 
++        if (e.pos != e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "fastcgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+diff --git a/src/http/modules/ngx_http_grpc_module.c b/src/http/modules/ngx_http_grpc_module.c
+index 84ce51265..fba2a517b 100644
+--- a/src/http/modules/ngx_http_grpc_module.c
++++ b/src/http/modules/ngx_http_grpc_module.c
+@@ -717,8 +717,10 @@ ngx_http_grpc_eval(ngx_http_request_t *r, ngx_http_grpc_ctx_t *ctx,
+ static ngx_int_t
+ ngx_http_grpc_create_request(ngx_http_request_t *r)
+ {
+-    u_char                       *p, *tmp, *key_tmp, *val_tmp, *headers_frame;
+-    size_t                        len, tmp_len, key_len, val_len, uri_len;
++    u_char                       *p, *tmp, *key_tmp, *val_tmp, *headers_frame,
++                                 *headers_end;
++    size_t                        len, headers_len, tmp_len,
++                                  key_len, val_len, uri_len;
+     uintptr_t                     escape;
+     ngx_buf_t                    *b;
+     ngx_uint_t                    i, next;
+@@ -742,6 +744,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+     len = sizeof(ngx_http_grpc_connection_start) - 1
+           + sizeof(ngx_http_grpc_frame_t);             /* headers frame */
+ 
++    headers_len = 0;
++
+     /* :method header */
+ 
+     if (r->method == NGX_HTTP_GET || r->method == NGX_HTTP_POST) {
+@@ -838,8 +842,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+             return NGX_ERROR;
+         }
+ 
+-        len += 1 + NGX_HTTP_V2_INT_OCTETS + key_len
+-                 + NGX_HTTP_V2_INT_OCTETS + val_len;
++        headers_len += 1 + NGX_HTTP_V2_INT_OCTETS + key_len
++                         + NGX_HTTP_V2_INT_OCTETS + val_len;
+ 
+         if (tmp_len < key_len) {
+             tmp_len = key_len;
+@@ -850,6 +854,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+         }
+     }
+ 
++    len += headers_len;
++
+     if (glcf->upstream.pass_request_headers) {
+         part = &r->headers_in.headers.part;
+         header = part->elts;
+@@ -1046,6 +1052,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+ 
+     le.ip = glcf->headers.lengths->elts;
+ 
++    headers_end = b->last + headers_len;
++
+     while (*(uintptr_t *) le.ip) {
+ 
+         lcode = *(ngx_http_script_len_code_pt *) le.ip;
+@@ -1070,16 +1078,38 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+             continue;
+         }
+ 
++        if (headers_end - b->last < 1) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         *b->last++ = 0;
+ 
+         e.pos = key_tmp;
++        e.end = key_tmp + tmp_len;
+ 
+         code = *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        key_len = e.pos - key_tmp;
++
++        if (headers_end - b->last
++            < (ssize_t) (NGX_HTTP_V2_INT_OCTETS + key_len))
++        {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         b->last = ngx_http_v2_write_name(b->last, key_tmp, key_len, tmp);
+ 
+         e.pos = val_tmp;
++        e.end = val_tmp + tmp_len;
+ 
+         while (*(uintptr_t *) e.ip) {
+             code = *(ngx_http_script_code_pt *) e.ip;
+@@ -1087,6 +1117,20 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+         }
+         e.ip += sizeof(uintptr_t);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        val_len = e.pos - val_tmp;
++
++        if (headers_end - b->last
++            < (ssize_t) (NGX_HTTP_V2_INT_OCTETS + val_len))
++        {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         b->last = ngx_http_v2_write_value(b->last, val_tmp, val_len, tmp);
+ 
+ #if (NGX_DEBUG)
+diff --git a/src/http/modules/ngx_http_index_module.c b/src/http/modules/ngx_http_index_module.c
+index 18e7049c5..149b44725 100644
+--- a/src/http/modules/ngx_http_index_module.c
++++ b/src/http/modules/ngx_http_index_module.c
+@@ -126,6 +126,7 @@ ngx_http_index_handler(ngx_http_request_t *r)
+     name = NULL;
+     /* suppress MSVC warning */
+     path.data = NULL;
++    e.status = 0;
+ 
+     index = ilcf->indices->elts;
+     for (i = 0; i < ilcf->indices->nelts; i++) {
+@@ -180,18 +181,28 @@ ngx_http_index_handler(ngx_http_request_t *r)
+         } else {
+             e.ip = index[i].values->elts;
+             e.pos = name;
++            e.end = name + allocated;
+ 
+             while (*(uintptr_t *) e.ip) {
+                 code = *(ngx_http_script_code_pt *) e.ip;
+                 code((ngx_http_script_engine_t *) &e);
+             }
+ 
++            if (e.status) {
++                return NGX_HTTP_INTERNAL_SERVER_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             if (*name == '/') {
+-                uri.len = len - 1;
++                uri.len = e.pos - name;
+                 uri.data = name;
+                 return ngx_http_internal_redirect(r, &uri, &r->args);
+             }
+ 
++            len = e.pos - name + 1;
+             path.len = e.pos - path.data;
+ 
+             *e.pos = '\0';
+diff --git a/src/http/modules/ngx_http_proxy_module.c b/src/http/modules/ngx_http_proxy_module.c
+index 454ef6270..b336b8be7 100644
+--- a/src/http/modules/ngx_http_proxy_module.c
++++ b/src/http/modules/ngx_http_proxy_module.c
+@@ -1256,7 +1256,7 @@ ngx_http_proxy_create_key(ngx_http_request_t *r)
+ static ngx_int_t
+ ngx_http_proxy_create_request(ngx_http_request_t *r)
+ {
+-    size_t                        len, uri_len, loc_len, body_len,
++    size_t                        len, uri_len, loc_len, body_len, headers_len,
+                                   key_len, val_len;
+     uintptr_t                     escape;
+     ngx_buf_t                    *b;
+@@ -1310,6 +1310,8 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+     escape = 0;
+     loc_len = 0;
+     unparsed_uri = 0;
++    body_len = 0;
++    headers_len = 0;
+ 
+     if (plcf->proxy_lengths && ctx->vars.uri.len) {
+         uri_len = ctx->vars.uri.len;
+@@ -1348,7 +1350,6 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+         le.ip = plcf->body_lengths->elts;
+         le.request = r;
+         le.flushed = 1;
+-        body_len = 0;
+ 
+         while (*(uintptr_t *) le.ip) {
+             lcode = *(ngx_http_script_len_code_pt *) le.ip;
+@@ -1384,9 +1385,11 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+             continue;
+         }
+ 
+-        len += key_len + sizeof(": ") - 1 + val_len + sizeof(CRLF) - 1;
++        headers_len += key_len + sizeof(": ") - 1 + val_len + sizeof(CRLF) - 1;
+     }
+ 
++    len += headers_len;
++
+ 
+     if (plcf->upstream.pass_request_headers) {
+         part = &r->headers_in.headers.part;
+@@ -1478,6 +1481,7 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+ 
+     e.ip = headers->values->elts;
+     e.pos = b->last;
++    e.end = b->last + headers_len;
+     e.request = r;
+     e.flushed = 1;
+ 
+@@ -1510,6 +1514,14 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+         code = *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        if (ngx_http_script_check_length(&e, 2) != NGX_OK) {
++            return NGX_ERROR;
++        }
++
+         *e.pos++ = ':'; *e.pos++ = ' ';
+ 
+         while (*(uintptr_t *) e.ip) {
+@@ -1518,6 +1530,14 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+         }
+         e.ip += sizeof(uintptr_t);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        if (ngx_http_script_check_length(&e, 2) != NGX_OK) {
++            return NGX_ERROR;
++        }
++
+         *e.pos++ = CR; *e.pos++ = LF;
+     }
+ 
+@@ -1568,6 +1588,7 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+     if (plcf->body_values) {
+         e.ip = plcf->body_values->elts;
+         e.pos = b->last;
++        e.end = b->last + body_len;
+         e.skip = 0;
+ 
+         while (*(uintptr_t *) e.ip) {
+@@ -1575,6 +1596,10 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+             code((ngx_http_script_engine_t *) &e);
+         }
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+diff --git a/src/http/modules/ngx_http_scgi_module.c b/src/http/modules/ngx_http_scgi_module.c
+index 7477df317..1f0ebb468 100644
+--- a/src/http/modules/ngx_http_scgi_module.c
++++ b/src/http/modules/ngx_http_scgi_module.c
+@@ -634,7 +634,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+ {
+     off_t                         content_length_n;
+     u_char                        ch, sep, *key, *val, *lowcase_key;
+-    size_t                        len, key_len, val_len, allocated;
++    size_t                        len, params_len, key_len, val_len, allocated;
+     ngx_buf_t                    *b;
+     ngx_str_t                     content_length;
+     ngx_uint_t                    i, n, hash, skip_empty, header_params;
+@@ -661,6 +661,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+ 
+     len = sizeof("CONTENT_LENGTH") + content_length.len + 1;
+ 
++    params_len = 0;
+     header_params = 0;
+     ignored = NULL;
+ 
+@@ -698,8 +699,10 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
+-            len += key_len + val_len + 1;
++            params_len += key_len + val_len + 1;
+         }
++
++        len += params_len;
+     }
+ 
+     if (scf->upstream.pass_request_headers) {
+@@ -814,6 +817,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+ 
+         e.ip = params->values->elts;
+         e.pos = b->last;
++        e.end = b->last + params_len;
+         e.request = r;
+         e.flushed = 1;
+ 
+@@ -852,6 +856,10 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+             code = *(ngx_http_script_code_pt *) e.ip;
+             code((ngx_http_script_engine_t *) &e);
+ 
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+ #if (NGX_DEBUG)
+             val = e.pos;
+ #endif
+@@ -859,6 +867,15 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                 code = *(ngx_http_script_code_pt *) e.ip;
+                 code((ngx_http_script_engine_t *) &e);
+             }
++
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ = '\0';
+             e.ip += sizeof(uintptr_t);
+ 
+@@ -866,6 +883,12 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                            "scgi param: \"%s: %s\"", key, val);
+         }
+ 
++        if (e.pos != e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "scgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+diff --git a/src/http/modules/ngx_http_try_files_module.c b/src/http/modules/ngx_http_try_files_module.c
+index ce783a24d..bbdab8598 100644
+--- a/src/http/modules/ngx_http_try_files_module.c
++++ b/src/http/modules/ngx_http_try_files_module.c
+@@ -78,7 +78,7 @@ ngx_module_t  ngx_http_try_files_module = {
+ static ngx_int_t
+ ngx_http_try_files_handler(ngx_http_request_t *r)
+ {
+-    size_t                          len, root, alias, reserve, allocated;
++    size_t                          len, root, alias, reserve, allocated, n;
+     u_char                         *p, *name;
+     ngx_str_t                       path, args;
+     ngx_uint_t                      test_dir;
+@@ -162,8 +162,15 @@ ngx_http_try_files_handler(ngx_http_request_t *r)
+             path.len = (name + tf->name.len - 1) - path.data;
+ 
+         } else {
++            n = allocated;
++
++            if (alias != NGX_MAX_SIZE_T_VALUE) {
++                n += (r->uri.len - alias);
++            }
++
+             e.ip = tf->values->elts;
+             e.pos = name;
++            e.end = name + n;
+             e.flushed = 1;
+ 
+             while (*(uintptr_t *) e.ip) {
+@@ -171,6 +178,14 @@ ngx_http_try_files_handler(ngx_http_request_t *r)
+                 code((ngx_http_script_engine_t *) &e);
+             }
+ 
++            if (e.status) {
++                return NGX_HTTP_INTERNAL_SERVER_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             path.len = e.pos - path.data;
+ 
+             *e.pos = '\0';
+diff --git a/src/http/modules/ngx_http_uwsgi_module.c b/src/http/modules/ngx_http_uwsgi_module.c
+index d012f4fd4..3b83fb2af 100644
+--- a/src/http/modules/ngx_http_uwsgi_module.c
++++ b/src/http/modules/ngx_http_uwsgi_module.c
+@@ -857,7 +857,7 @@ static ngx_int_t
+ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+ {
+     u_char                        ch, sep, *lowcase_key;
+-    size_t                        key_len, val_len, len, allocated;
++    size_t                        key_len, val_len, len, params_len, allocated;
+     ngx_uint_t                    i, n, hash, skip_empty, header_params;
+     ngx_buf_t                    *b;
+     ngx_chain_t                  *cl, *body;
+@@ -870,6 +870,7 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+     ngx_http_script_len_code_pt   lcode;
+ 
+     len = 0;
++    params_len = 0;
+     header_params = 0;
+     ignored = NULL;
+ 
+@@ -907,8 +908,10 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
+-            len += 2 + key_len + 2 + val_len;
++            params_len += 2 + key_len + 2 + val_len;
+         }
++
++        len += params_len;
+     }
+ 
+     if (uwcf->upstream.pass_request_headers) {
+@@ -1040,6 +1043,7 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+ 
+         e.ip = params->values->elts;
+         e.pos = b->last;
++        e.end = b->last + params_len;
+         e.request = r;
+         e.flushed = 1;
+ 
+@@ -1072,12 +1076,24 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
++            if (ngx_http_script_check_length(&e, 2) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ = (u_char) (key_len & 0xff);
+             *e.pos++ = (u_char) ((key_len >> 8) & 0xff);
+ 
+             code = *(ngx_http_script_code_pt *) e.ip;
+             code((ngx_http_script_engine_t *) &e);
+ 
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 2) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ = (u_char) (val_len & 0xff);
+             *e.pos++ = (u_char) ((val_len >> 8) & 0xff);
+ 
+@@ -1086,6 +1102,10 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+                 code((ngx_http_script_engine_t *) &e);
+             }
+ 
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+             e.ip += sizeof(uintptr_t);
+ 
+             ngx_log_debug4(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
+@@ -1094,6 +1114,12 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+                            val_len, e.pos - val_len);
+         }
+ 
++        if (e.pos != e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "uwsgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42533_p4.patch b/meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42533_p4.patch
new file mode 100644
index 0000000000..4f94d11674
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/nginx-1.29.7/CVE-2026-42533_p4.patch
@@ -0,0 +1,723 @@
+From 326b17b0038321c29252e79bf4c53d4773fcb8b5 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Fri, 19 Jun 2026 22:54:46 +0300
+Subject: [PATCH] Script: buffer overrun protection in direct script usage.
+
+Following the previous change, this change adds script overrun
+protection to direct script evaluation in the proxy, fastcgi, scgi,
+uwsgi, grpc proxy, index, and try_files modules.
+
+This change is a modified version of a patch by Maxim Dounin.  The
+modifications include ngx_http_proxy_v2_module and hardened size checks.
+
+Signed-off-by: Roman Arutyunyan <arut@nginx.com>
+Origin: <https://freenginx.org/hg/nginx/rev/7e4d7feb4c77>
+
+CVE: CVE-2026-42533
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/326b17b0038321c29252e79bf4c53d4773fcb8b5]
+
+Backport Changes:
+- Applied the proxy-v2 request-body buffer-end and script-status checks to
+  nginx 1.29.7's existing initial-buffer path; later nginx versions perform
+  the same body rendering in a separate chain buffer.
+
+(cherry picked from commit 326b17b0038321c29252e79bf4c53d4773fcb8b5)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_fastcgi_module.c   | 26 +++++++--
+ src/http/modules/ngx_http_grpc_module.c      | 52 ++++++++++++++++--
+ src/http/modules/ngx_http_index_module.c     | 13 ++++-
+ src/http/modules/ngx_http_proxy_module.c     | 31 +++++++++--
+ src/http/modules/ngx_http_proxy_v2_module.c  | 57 ++++++++++++++++++--
+ src/http/modules/ngx_http_scgi_module.c      | 27 +++++++++-
+ src/http/modules/ngx_http_try_files_module.c | 17 +++++-
+ src/http/modules/ngx_http_uwsgi_module.c     | 30 ++++++++++-
+ 8 files changed, 233 insertions(+), 20 deletions(-)
+
+diff --git a/src/http/modules/ngx_http_fastcgi_module.c b/src/http/modules/ngx_http_fastcgi_module.c
+index f7f0696a8..21c106778 100644
+--- a/src/http/modules/ngx_http_fastcgi_module.c
++++ b/src/http/modules/ngx_http_fastcgi_module.c
+@@ -845,8 +845,8 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+ {
+     off_t                         file_pos;
+     u_char                        ch, sep, *pos, *lowcase_key;
+-    size_t                        size, len, key_len, val_len, padding,
+-                                  allocated;
++    size_t                        size, len, params_len,
++                                  key_len, val_len, padding, allocated;
+     ngx_uint_t                    i, n, next, hash, skip_empty, header_params;
+     ngx_buf_t                    *b;
+     ngx_chain_t                  *cl, *body;
+@@ -861,6 +861,7 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+     ngx_http_script_len_code_pt   lcode;
+ 
+     len = 0;
++    params_len = 0;
+     header_params = 0;
+     ignored = NULL;
+ 
+@@ -900,8 +901,10 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
+-            len += 1 + key_len + ((val_len > 127) ? 4 : 1) + val_len;
++            params_len += 1 + key_len + ((val_len > 127) ? 4 : 1) + val_len;
+         }
++
++        len += params_len;
+     }
+ 
+     if (flcf->upstream.pass_request_headers) {
+@@ -1057,6 +1060,7 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+ 
+         e.ip = params->values->elts;
+         e.pos = b->last;
++        e.end = b->last + params_len;
+         e.request = r;
+         e.flushed = 1;
+ 
+@@ -1089,6 +1093,12 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
++            if (ngx_http_script_check_length(&e, 1 + ((val_len > 127) ? 4 : 1))
++                != NGX_OK)
++            {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ = (u_char) key_len;
+ 
+             if (val_len > 127) {
+@@ -1107,12 +1117,22 @@ ngx_http_fastcgi_create_request(ngx_http_request_t *r)
+             }
+             e.ip += sizeof(uintptr_t);
+ 
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+             ngx_log_debug4(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
+                            "fastcgi param: \"%*s: %*s\"",
+                            key_len, e.pos - (key_len + val_len),
+                            val_len, e.pos - val_len);
+         }
+ 
++        if (e.pos != e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "fastcgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+diff --git a/src/http/modules/ngx_http_grpc_module.c b/src/http/modules/ngx_http_grpc_module.c
+index 1895ef31b..681828109 100644
+--- a/src/http/modules/ngx_http_grpc_module.c
++++ b/src/http/modules/ngx_http_grpc_module.c
+@@ -717,8 +717,10 @@ ngx_http_grpc_eval(ngx_http_request_t *r, ngx_http_grpc_ctx_t *ctx,
+ static ngx_int_t
+ ngx_http_grpc_create_request(ngx_http_request_t *r)
+ {
+-    u_char                       *p, *tmp, *key_tmp, *val_tmp, *headers_frame;
+-    size_t                        len, tmp_len, key_len, val_len, uri_len;
++    u_char                       *p, *tmp, *key_tmp, *val_tmp, *headers_frame,
++                                 *headers_end;
++    size_t                        len, headers_len, tmp_len,
++                                  key_len, val_len, uri_len;
+     uintptr_t                     escape;
+     ngx_buf_t                    *b;
+     ngx_uint_t                    i, next;
+@@ -742,6 +744,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+     len = sizeof(ngx_http_grpc_connection_start) - 1
+           + sizeof(ngx_http_grpc_frame_t);             /* headers frame */
+ 
++    headers_len = 0;
++
+     /* :method header */
+ 
+     if (r->method == NGX_HTTP_GET || r->method == NGX_HTTP_POST) {
+@@ -838,8 +842,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+             return NGX_ERROR;
+         }
+ 
+-        len += 1 + NGX_HTTP_V2_INT_OCTETS + key_len
+-                 + NGX_HTTP_V2_INT_OCTETS + val_len;
++        headers_len += 1 + NGX_HTTP_V2_INT_OCTETS + key_len
++                         + NGX_HTTP_V2_INT_OCTETS + val_len;
+ 
+         if (tmp_len < key_len) {
+             tmp_len = key_len;
+@@ -850,6 +854,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+         }
+     }
+ 
++    len += headers_len;
++
+     if (glcf->upstream.pass_request_headers) {
+         part = &r->headers_in.headers.part;
+         header = part->elts;
+@@ -1046,6 +1052,8 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+ 
+     le.ip = glcf->headers.lengths->elts;
+ 
++    headers_end = b->last + headers_len;
++
+     while (*(uintptr_t *) le.ip) {
+ 
+         lcode = *(ngx_http_script_len_code_pt *) le.ip;
+@@ -1070,16 +1078,38 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+             continue;
+         }
+ 
++        if (headers_end - b->last < 1) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         *b->last++ = 0;
+ 
+         e.pos = key_tmp;
++        e.end = key_tmp + tmp_len;
+ 
+         code = *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        key_len = e.pos - key_tmp;
++
++        if (headers_end - b->last
++            < (ssize_t) (NGX_HTTP_V2_INT_OCTETS + key_len))
++        {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         b->last = ngx_http_v2_write_name(b->last, key_tmp, key_len, tmp);
+ 
+         e.pos = val_tmp;
++        e.end = val_tmp + tmp_len;
+ 
+         while (*(uintptr_t *) e.ip) {
+             code = *(ngx_http_script_code_pt *) e.ip;
+@@ -1087,6 +1117,20 @@ ngx_http_grpc_create_request(ngx_http_request_t *r)
+         }
+         e.ip += sizeof(uintptr_t);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        val_len = e.pos - val_tmp;
++
++        if (headers_end - b->last
++            < (ssize_t) (NGX_HTTP_V2_INT_OCTETS + val_len))
++        {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in grpc create request");
++            return NGX_ERROR;
++        }
++
+         b->last = ngx_http_v2_write_value(b->last, val_tmp, val_len, tmp);
+ 
+ #if (NGX_DEBUG)
+diff --git a/src/http/modules/ngx_http_index_module.c b/src/http/modules/ngx_http_index_module.c
+index 18e7049c5..149b44725 100644
+--- a/src/http/modules/ngx_http_index_module.c
++++ b/src/http/modules/ngx_http_index_module.c
+@@ -126,6 +126,7 @@ ngx_http_index_handler(ngx_http_request_t *r)
+     name = NULL;
+     /* suppress MSVC warning */
+     path.data = NULL;
++    e.status = 0;
+ 
+     index = ilcf->indices->elts;
+     for (i = 0; i < ilcf->indices->nelts; i++) {
+@@ -180,18 +181,28 @@ ngx_http_index_handler(ngx_http_request_t *r)
+         } else {
+             e.ip = index[i].values->elts;
+             e.pos = name;
++            e.end = name + allocated;
+ 
+             while (*(uintptr_t *) e.ip) {
+                 code = *(ngx_http_script_code_pt *) e.ip;
+                 code((ngx_http_script_engine_t *) &e);
+             }
+ 
++            if (e.status) {
++                return NGX_HTTP_INTERNAL_SERVER_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             if (*name == '/') {
+-                uri.len = len - 1;
++                uri.len = e.pos - name;
+                 uri.data = name;
+                 return ngx_http_internal_redirect(r, &uri, &r->args);
+             }
+ 
++            len = e.pos - name + 1;
+             path.len = e.pos - path.data;
+ 
+             *e.pos = '\0';
+diff --git a/src/http/modules/ngx_http_proxy_module.c b/src/http/modules/ngx_http_proxy_module.c
+index 276cc0750..f3263cd5f 100644
+--- a/src/http/modules/ngx_http_proxy_module.c
++++ b/src/http/modules/ngx_http_proxy_module.c
+@@ -1173,7 +1173,7 @@ ngx_http_proxy_create_key(ngx_http_request_t *r)
+ static ngx_int_t
+ ngx_http_proxy_create_request(ngx_http_request_t *r)
+ {
+-    size_t                        len, uri_len, loc_len, body_len,
++    size_t                        len, uri_len, loc_len, body_len, headers_len,
+                                   key_len, val_len;
+     uintptr_t                     escape;
+     ngx_buf_t                    *b;
+@@ -1227,6 +1227,8 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+     escape = 0;
+     loc_len = 0;
+     unparsed_uri = 0;
++    body_len = 0;
++    headers_len = 0;
+ 
+     if (plcf->proxy_lengths && ctx->vars.uri.len) {
+         uri_len = ctx->vars.uri.len;
+@@ -1265,7 +1267,6 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+         le.ip = plcf->body_lengths->elts;
+         le.request = r;
+         le.flushed = 1;
+-        body_len = 0;
+ 
+         while (*(uintptr_t *) le.ip) {
+             lcode = *(ngx_http_script_len_code_pt *) le.ip;
+@@ -1301,9 +1302,11 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+             continue;
+         }
+ 
+-        len += key_len + sizeof(": ") - 1 + val_len + sizeof(CRLF) - 1;
++        headers_len += key_len + sizeof(": ") - 1 + val_len + sizeof(CRLF) - 1;
+     }
+ 
++    len += headers_len;
++
+ 
+     if (plcf->upstream.pass_request_headers) {
+         part = &r->headers_in.headers.part;
+@@ -1395,6 +1398,7 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+ 
+     e.ip = headers->values->elts;
+     e.pos = b->last;
++    e.end = b->last + headers_len;
+     e.request = r;
+     e.flushed = 1;
+ 
+@@ -1427,6 +1431,14 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+         code = *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        if (ngx_http_script_check_length(&e, 2) != NGX_OK) {
++            return NGX_ERROR;
++        }
++
+         *e.pos++ = ':'; *e.pos++ = ' ';
+ 
+         while (*(uintptr_t *) e.ip) {
+@@ -1435,6 +1447,14 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+         }
+         e.ip += sizeof(uintptr_t);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        if (ngx_http_script_check_length(&e, 2) != NGX_OK) {
++            return NGX_ERROR;
++        }
++
+         *e.pos++ = CR; *e.pos++ = LF;
+     }
+ 
+@@ -1485,6 +1505,7 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+     if (plcf->body_values) {
+         e.ip = plcf->body_values->elts;
+         e.pos = b->last;
++        e.end = b->last + body_len;
+         e.skip = 0;
+ 
+         while (*(uintptr_t *) e.ip) {
+@@ -1492,6 +1513,10 @@ ngx_http_proxy_create_request(ngx_http_request_t *r)
+             code((ngx_http_script_engine_t *) &e);
+         }
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+diff --git a/src/http/modules/ngx_http_proxy_v2_module.c b/src/http/modules/ngx_http_proxy_v2_module.c
+index 637fa9a0e..1952e48d1 100644
+--- a/src/http/modules/ngx_http_proxy_v2_module.c
++++ b/src/http/modules/ngx_http_proxy_v2_module.c
+@@ -317,8 +317,10 @@ ngx_http_proxy_v2_handler(ngx_http_request_t *r)
+ static ngx_int_t
+ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+ {
+-    u_char                       *p, *tmp, *key_tmp, *val_tmp, *headers_frame;
+-    size_t                        len, tmp_len, key_len, val_len, uri_len,
++    u_char                       *p, *tmp, *key_tmp, *val_tmp, *headers_frame,
++                                 *headers_end;
++    size_t                        len, headers_len, tmp_len,
++                                  key_len, val_len, uri_len,
+                                   loc_len, body_len;
+     uintptr_t                     escape;
+     ngx_buf_t                    *b;
+@@ -370,6 +372,8 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+     len = sizeof(ngx_http_proxy_v2_connection_start) - 1
+           + sizeof(ngx_http_proxy_v2_frame_t);             /* headers frame */
+ 
++    headers_len = 0;
++
+     /* :method header */
+ 
+     if ((method.len == 3 && ngx_strncmp(method.data, "GET", 3) == 0)
+@@ -516,8 +520,8 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+             return NGX_ERROR;
+         }
+ 
+-        len += 1 + NGX_HTTP_V2_INT_OCTETS + key_len
+-                 + NGX_HTTP_V2_INT_OCTETS + val_len;
++        headers_len += 1 + NGX_HTTP_V2_INT_OCTETS + key_len
++                         + NGX_HTTP_V2_INT_OCTETS + val_len;
+ 
+         if (tmp_len < key_len) {
+             tmp_len = key_len;
+@@ -528,6 +532,8 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+         }
+     }
+ 
++    len += headers_len;
++
+     if (plcf->upstream.pass_request_headers) {
+         part = &r->headers_in.headers.part;
+         header = part->elts;
+@@ -730,6 +736,8 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+ 
+     le.ip = headers->lengths->elts;
+ 
++    headers_end = b->last + headers_len;
++
+     while (*(uintptr_t *) le.ip) {
+ 
+         lcode = *(ngx_http_script_len_code_pt *) le.ip;
+@@ -754,16 +762,38 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+             continue;
+         }
+ 
++        if (headers_end - b->last < 1) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in HTTP/2 create request");
++            return NGX_ERROR;
++        }
++
+         *b->last++ = 0;
+ 
+         e.pos = key_tmp;
++        e.end = key_tmp + tmp_len;
+ 
+         code = *(ngx_http_script_code_pt *) e.ip;
+         code((ngx_http_script_engine_t *) &e);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        key_len = e.pos - key_tmp;
++
++        if (headers_end - b->last
++            < (ssize_t) (NGX_HTTP_V2_INT_OCTETS + key_len))
++        {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in HTTP/2 create request");
++            return NGX_ERROR;
++        }
++
+         b->last = ngx_http_v2_write_name(b->last, key_tmp, key_len, tmp);
+ 
+         e.pos = val_tmp;
++        e.end = val_tmp + tmp_len;
+ 
+         while (*(uintptr_t *) e.ip) {
+             code = *(ngx_http_script_code_pt *) e.ip;
+@@ -771,6 +801,20 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+         }
+         e.ip += sizeof(uintptr_t);
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
++        val_len = e.pos - val_tmp;
++
++        if (headers_end - b->last
++            < (ssize_t) (NGX_HTTP_V2_INT_OCTETS + val_len))
++        {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "no buffer space in HTTP/2 create request");
++            return NGX_ERROR;
++        }
++
+         b->last = ngx_http_v2_write_value(b->last, val_tmp, val_len, tmp);
+ 
+ #if (NGX_DEBUG)
+@@ -894,6 +938,7 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+ 
+         e.ip = plcf->body_values->elts;
+         e.pos = b->last;
++        e.end = b->last + body_len;
+         e.request = r;
+         e.flushed = 1;
+         e.skip = 0;
+@@ -903,6 +948,10 @@ ngx_http_proxy_v2_create_request(ngx_http_request_t *r)
+             code((ngx_http_script_engine_t *) &e);
+         }
+ 
++        if (e.status) {
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+diff --git a/src/http/modules/ngx_http_scgi_module.c b/src/http/modules/ngx_http_scgi_module.c
+index b4a73a5a6..7276b4a6f 100644
+--- a/src/http/modules/ngx_http_scgi_module.c
++++ b/src/http/modules/ngx_http_scgi_module.c
+@@ -643,7 +643,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+ {
+     off_t                         content_length_n;
+     u_char                        ch, sep, *key, *val, *lowcase_key;
+-    size_t                        len, key_len, val_len, allocated;
++    size_t                        len, params_len, key_len, val_len, allocated;
+     ngx_buf_t                    *b;
+     ngx_str_t                     content_length;
+     ngx_uint_t                    i, n, hash, skip_empty, header_params;
+@@ -668,6 +668,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+ 
+     len = sizeof("CONTENT_LENGTH") + content_length.len + 1;
+ 
++    params_len = 0;
+     header_params = 0;
+     ignored = NULL;
+ 
+@@ -705,8 +706,10 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
+-            len += key_len + val_len + 1;
++            params_len += key_len + val_len + 1;
+         }
++
++        len += params_len;
+     }
+ 
+     if (scf->upstream.pass_request_headers) {
+@@ -821,6 +824,7 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+ 
+         e.ip = params->values->elts;
+         e.pos = b->last;
++        e.end = b->last + params_len;
+         e.request = r;
+         e.flushed = 1;
+ 
+@@ -859,6 +863,10 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+             code = *(ngx_http_script_code_pt *) e.ip;
+             code((ngx_http_script_engine_t *) &e);
+ 
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+ #if (NGX_DEBUG)
+             val = e.pos;
+ #endif
+@@ -866,6 +874,15 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                 code = *(ngx_http_script_code_pt *) e.ip;
+                 code((ngx_http_script_engine_t *) &e);
+             }
++
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ = '\0';
+             e.ip += sizeof(uintptr_t);
+ 
+@@ -873,6 +890,12 @@ ngx_http_scgi_create_request(ngx_http_request_t *r)
+                            "scgi param: \"%s: %s\"", key, val);
+         }
+ 
++        if (e.pos != e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "scgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+diff --git a/src/http/modules/ngx_http_try_files_module.c b/src/http/modules/ngx_http_try_files_module.c
+index ce783a24d..bbdab8598 100644
+--- a/src/http/modules/ngx_http_try_files_module.c
++++ b/src/http/modules/ngx_http_try_files_module.c
+@@ -78,7 +78,7 @@ ngx_module_t  ngx_http_try_files_module = {
+ static ngx_int_t
+ ngx_http_try_files_handler(ngx_http_request_t *r)
+ {
+-    size_t                          len, root, alias, reserve, allocated;
++    size_t                          len, root, alias, reserve, allocated, n;
+     u_char                         *p, *name;
+     ngx_str_t                       path, args;
+     ngx_uint_t                      test_dir;
+@@ -162,8 +162,15 @@ ngx_http_try_files_handler(ngx_http_request_t *r)
+             path.len = (name + tf->name.len - 1) - path.data;
+ 
+         } else {
++            n = allocated;
++
++            if (alias != NGX_MAX_SIZE_T_VALUE) {
++                n += (r->uri.len - alias);
++            }
++
+             e.ip = tf->values->elts;
+             e.pos = name;
++            e.end = name + n;
+             e.flushed = 1;
+ 
+             while (*(uintptr_t *) e.ip) {
+@@ -171,6 +178,14 @@ ngx_http_try_files_handler(ngx_http_request_t *r)
+                 code((ngx_http_script_engine_t *) &e);
+             }
+ 
++            if (e.status) {
++                return NGX_HTTP_INTERNAL_SERVER_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 1) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             path.len = e.pos - path.data;
+ 
+             *e.pos = '\0';
+diff --git a/src/http/modules/ngx_http_uwsgi_module.c b/src/http/modules/ngx_http_uwsgi_module.c
+index ecd6dd0d7..71a658c30 100644
+--- a/src/http/modules/ngx_http_uwsgi_module.c
++++ b/src/http/modules/ngx_http_uwsgi_module.c
+@@ -866,7 +866,7 @@ static ngx_int_t
+ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+ {
+     u_char                        ch, sep, *lowcase_key;
+-    size_t                        key_len, val_len, len, allocated;
++    size_t                        key_len, val_len, len, params_len, allocated;
+     ngx_uint_t                    i, n, hash, skip_empty, header_params;
+     ngx_buf_t                    *b;
+     ngx_chain_t                  *cl, *body;
+@@ -879,6 +879,7 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+     ngx_http_script_len_code_pt   lcode;
+ 
+     len = 0;
++    params_len = 0;
+     header_params = 0;
+     ignored = NULL;
+ 
+@@ -916,8 +917,10 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
+-            len += 2 + key_len + 2 + val_len;
++            params_len += 2 + key_len + 2 + val_len;
+         }
++
++        len += params_len;
+     }
+ 
+     if (uwcf->upstream.pass_request_headers) {
+@@ -1049,6 +1052,7 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+ 
+         e.ip = params->values->elts;
+         e.pos = b->last;
++        e.end = b->last + params_len;
+         e.request = r;
+         e.flushed = 1;
+ 
+@@ -1081,12 +1085,24 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+                 continue;
+             }
+ 
++            if (ngx_http_script_check_length(&e, 2) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ = (u_char) (key_len & 0xff);
+             *e.pos++ = (u_char) ((key_len >> 8) & 0xff);
+ 
+             code = *(ngx_http_script_code_pt *) e.ip;
+             code((ngx_http_script_engine_t *) &e);
+ 
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
++            if (ngx_http_script_check_length(&e, 2) != NGX_OK) {
++                return NGX_ERROR;
++            }
++
+             *e.pos++ = (u_char) (val_len & 0xff);
+             *e.pos++ = (u_char) ((val_len >> 8) & 0xff);
+ 
+@@ -1095,6 +1111,10 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+                 code((ngx_http_script_engine_t *) &e);
+             }
+ 
++            if (e.status) {
++                return NGX_ERROR;
++            }
++
+             e.ip += sizeof(uintptr_t);
+ 
+             ngx_log_debug4(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
+@@ -1103,6 +1123,12 @@ ngx_http_uwsgi_create_request(ngx_http_request_t *r)
+                            val_len, e.pos - val_len);
+         }
+ 
++        if (e.pos != e.end) {
++            ngx_log_error(NGX_LOG_ALERT, r->connection->log, 0,
++                          "uwsgi request length mismatch");
++            return NGX_ERROR;
++        }
++
+         b->last = e.pos;
+     }
+ 
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 628e8f65b8..bcceedf820 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -9,6 +9,11 @@ SRC_URI:append = " \
     file://CVE-2026-9256.patch \
     file://CVE-2026-42055.patch \
     file://CVE-2026-48142.patch \
+    file://CVE-2026-42533_p1.patch \
+    file://CVE-2026-42533_p2.patch \
+    file://CVE-2026-42533_p3.patch \
+    file://CVE-2026-42533_p4.patch \
+    file://CVE-2026-42533_p5.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 8ba04167c2..1e0b889dcd 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -9,6 +9,11 @@ SRC_URI:append = " \
     file://CVE-2026-9256.patch \
     file://CVE-2026-42055.patch \
     file://CVE-2026-48142.patch \
+    file://CVE-2026-42533_p1.patch \
+    file://CVE-2026-42533_p2.patch \
+    file://CVE-2026-42533_p3.patch \
+    file://CVE-2026-42533_p4.patch \
+    file://CVE-2026-42533_p5.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6


