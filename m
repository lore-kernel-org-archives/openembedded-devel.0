Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BEBCCF2C1
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:04 +0000 (UTC)
Received: from rcdn-iport-8.cisco.com (rcdn-iport-8.cisco.com [173.37.86.79])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13832.1792120861021132594
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:21:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=GabRYUBh;
 spf=pass (domain: cisco.com, ip: 173.37.86.79, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=7546; q=dns/txt;
  s=iport01; t=1792120861; x=1793330461;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=P9rldBZq6qbUNCKgDfq75W+G4qRnBhveNa6IwJ4wUT8=;
  b=GabRYUBhiovpuD9Cno1frLONWPiIl1O8Gpree2RNlB9lnhD+2E1AdzOm
   E2R3axIhErE4SXa0B47wlxLqWoM9/XHnFSjOS1U/FsvXx9ydrzpYtXgfa
   MA8Pj/50cBOwiSaR1AGydFThwZtaZNZiDp+25AvMvm1ni0twXxtnakCG7
   vMi6KCUs6U72EfDzYj6tBi4wzQCjgUBet0n+KvQR0EQBjpXC+eHR+Z/Q0
   2/FIS8Wjt8AvyD4D4dPtkQeEK2V3/3fJdPrWqEd5zPuNFJi7H0oLMkI/+
   xcBXWJuS4qAIgpUcQbGHRJcg/L6Wmz1XynuMUD4pSRP69kNhuHjZ258fM
   A==;
X-CSE-ConnectionGUID: TiiSp/3nR/G5bSvKrwt8ag==
X-CSE-MsgGUID: 5TWC0kC9TsWSJ3XJiFv4Kw==
X-IPAS-Result: =?us-ascii?q?A0CmAgCRl9Fq/4v/Ja1aglmCV3VgQ0kDjVeIBGwDnhwUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxEGvHSBe?=
 =?us-ascii?q?TOBAYMpAYFU2zIBCxQBBYEzhUCII10YAYR8JxsbgXKEfoEFgVwBAQGBRoZeB?=
 =?us-ascii?q?IIigQyBWo4khyNIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBH?=
 =?us-ascii?q?YEgghYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSC?=
 =?us-ascii?q?QETGjALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CZAE9U?=
 =?us-ascii?q?QEpAQEXgVQYph6hDwoog3aMIpU6GjOqbwuYfY4Klk+EaYFoPIFZcBWDIglKG?=
 =?us-ascii?q?Q+OLwoLg2CFE8lHJzICCQMvAQEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:M1c8F6zkRIetkFMWe9V6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkUCz
 WcYCmuGM6mDYWb8L4p3O4rj9ksH68eDn9ZkSldo+1hgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWcsazxMsspvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJH03PLYAvb1xOyZhq
 PYjNhMXcQzTju3jldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tOe0hnD8eidwo1OOrq1x6G/WpOB0+OW3YIKMKo3WFa25mG7Fm
 l3tp2fSUy0BC+e9kgqn81yy2szQyHaTtIU6UefQGuRRqFqLy2oeDRcbWVe2rby1h1CzX/pbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rAnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:oLNRqqopTwy0NaiXzMWxPVAaV5rzeYIsimQD101hICG9vPb2qy
 nIpoV96faaslcssR0b9OxofZPwI080lqQFhbX5Q43DYOCOggLBR+tfBMnZsljd8kbFmNK1u5
 0NT0FWMqyXMbEDt7eY3CCIV/A93dKA7Kekwc3az3trUEVWTpsI1XYBNu5eeXcGPzWvwvECZe
 Kh2vY=
X-Talos-CUID: =?us-ascii?q?9a23=3Ab26y4mqIr1R9npcP+bMQb2LmUfwkc0bFiyzWGQi?=
 =?us-ascii?q?XVGxSVp6PVkPA8awxxg=3D=3D?=
X-Talos-MUID: 9a23:OZoXEwmZwtIwOqEzLP42dno/CPhDu6eFWXwWrq4k4PmmNAJuZxSC2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="528018948"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id D345D1800023D;
	Fri, 16 Oct 2026 03:20:56 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 7CDBBCBF203; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 03/11] nginx: fix CVE-2026-42946
Date: Thu, 15 Oct 2026 20:20:48 -0700
Message-Id: <20261016032056.409095-4-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131034

From: Hetvi Thakar <hthakar@cisco.com>

These patches apply the upstream fix sequence as
referenced in [3], using the commits shown in [1] and [2].

[1] https://github.com/nginx/nginx/commit/baef7fdac28e4e1fe26509b50b8d15603393e28e
[2] https://github.com/nginx/nginx/commit/39d7d0ba0799fcff6baee52b6525f45739593cfd
[3] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-42946_p1.patch       | 47 ++++++++++
 .../nginx/files/CVE-2026-42946_p2.patch       | 92 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  2 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  2 +
 4 files changed, 143 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p1.patch
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p2.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p1.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p1.patch
new file mode 100644
index 0000000000..68f7627ef5
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p1.patch
@@ -0,0 +1,47 @@
+From baef7fdac28e4e1fe26509b50b8d15603393e28e Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Wed, 29 Apr 2026 21:56:51 +0400
+Subject: [PATCH] Upstream: reset parsing state after invalid status line
+
+Previously, it was possible to start parsing headers with a wrong
+parsing state after status line was not recognized, as a fallback
+used in the scgi and uwsgi modules.
+
+Reported by Leo Lin.
+
+CVE: CVE-2026-42946
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/baef7fdac28e4e1fe26509b50b8d15603393e28e]
+
+(cherry picked from commit baef7fdac28e4e1fe26509b50b8d15603393e28e)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_scgi_module.c  | 1 +
+ src/http/modules/ngx_http_uwsgi_module.c | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_scgi_module.c b/src/http/modules/ngx_http_scgi_module.c
+index 49977b07b..038380798 100644
+--- a/src/http/modules/ngx_http_scgi_module.c
++++ b/src/http/modules/ngx_http_scgi_module.c
+@@ -1029,6 +1029,7 @@ ngx_http_scgi_process_status_line(ngx_http_request_t *r)
+ 
+     if (rc == NGX_ERROR) {
+         u->process_header = ngx_http_scgi_process_header;
++        r->state = 0;
+         return ngx_http_scgi_process_header(r);
+     }
+ 
+diff --git a/src/http/modules/ngx_http_uwsgi_module.c b/src/http/modules/ngx_http_uwsgi_module.c
+index c1d0035cc..05c08b6c4 100644
+--- a/src/http/modules/ngx_http_uwsgi_module.c
++++ b/src/http/modules/ngx_http_uwsgi_module.c
+@@ -1266,6 +1266,7 @@ ngx_http_uwsgi_process_status_line(ngx_http_request_t *r)
+ 
+     if (rc == NGX_ERROR) {
+         u->process_header = ngx_http_uwsgi_process_header;
++        r->state = 0;
+         return ngx_http_uwsgi_process_header(r);
+     }
+ 
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p2.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p2.patch
new file mode 100644
index 0000000000..1f25ebab15
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42946_p2.patch
@@ -0,0 +1,92 @@
+From 39d7d0ba0799fcff6baee52b6525f45739593cfd Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Wed, 29 Apr 2026 23:02:20 +0400
+Subject: [PATCH] Upstream: fixed parsing of split status lines
+
+If the first response line was split across reads and it didn't appear
+a status line, the portion already processed was lost.  To preserve ABI,
+the change reuses r->header_name_start for proper backtracking on status
+line fallback.
+
+CVE: CVE-2026-42946
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/39d7d0ba0799fcff6baee52b6525f45739593cfd]
+
+(cherry picked from commit 39d7d0ba0799fcff6baee52b6525f45739593cfd)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_proxy_module.c | 5 +++++
+ src/http/modules/ngx_http_scgi_module.c  | 5 +++++
+ src/http/modules/ngx_http_uwsgi_module.c | 5 +++++
+ 3 files changed, 15 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_proxy_module.c b/src/http/modules/ngx_http_proxy_module.c
+index 0778ec728..454ef6270 100644
+--- a/src/http/modules/ngx_http_proxy_module.c
++++ b/src/http/modules/ngx_http_proxy_module.c
+@@ -1835,6 +1835,10 @@ ngx_http_proxy_process_status_line(ngx_http_request_t *r)
+ 
+     u = r->upstream;
+ 
++    if (r->state == 0) {
++        r->header_name_start = u->buffer.pos;
++    }
++
+     rc = ngx_http_parse_status_line(r, &u->buffer, &ctx->status);
+ 
+     if (rc == NGX_AGAIN) {
+@@ -1842,6 +1846,7 @@ ngx_http_proxy_process_status_line(ngx_http_request_t *r)
+     }
+ 
+     if (rc == NGX_ERROR) {
++        u->buffer.pos = r->header_name_start;
+ 
+ #if (NGX_HTTP_CACHE)
+ 
+diff --git a/src/http/modules/ngx_http_scgi_module.c b/src/http/modules/ngx_http_scgi_module.c
+index 038380798..7477df317 100644
+--- a/src/http/modules/ngx_http_scgi_module.c
++++ b/src/http/modules/ngx_http_scgi_module.c
+@@ -1021,6 +1021,10 @@ ngx_http_scgi_process_status_line(ngx_http_request_t *r)
+ 
+     u = r->upstream;
+ 
++    if (r->state == 0) {
++        r->header_name_start = u->buffer.pos;
++    }
++
+     rc = ngx_http_parse_status_line(r, &u->buffer, status);
+ 
+     if (rc == NGX_AGAIN) {
+@@ -1029,6 +1033,7 @@ ngx_http_scgi_process_status_line(ngx_http_request_t *r)
+ 
+     if (rc == NGX_ERROR) {
+         u->process_header = ngx_http_scgi_process_header;
++        u->buffer.pos = r->header_name_start;
+         r->state = 0;
+         return ngx_http_scgi_process_header(r);
+     }
+diff --git a/src/http/modules/ngx_http_uwsgi_module.c b/src/http/modules/ngx_http_uwsgi_module.c
+index 05c08b6c4..d012f4fd4 100644
+--- a/src/http/modules/ngx_http_uwsgi_module.c
++++ b/src/http/modules/ngx_http_uwsgi_module.c
+@@ -1258,6 +1258,10 @@ ngx_http_uwsgi_process_status_line(ngx_http_request_t *r)
+ 
+     u = r->upstream;
+ 
++    if (r->state == 0) {
++        r->header_name_start = u->buffer.pos;
++    }
++
+     rc = ngx_http_parse_status_line(r, &u->buffer, status);
+ 
+     if (rc == NGX_AGAIN) {
+@@ -1266,6 +1270,7 @@ ngx_http_uwsgi_process_status_line(ngx_http_request_t *r)
+ 
+     if (rc == NGX_ERROR) {
+         u->process_header = ngx_http_uwsgi_process_header;
++        u->buffer.pos = r->header_name_start;
+         r->state = 0;
+         return ngx_http_uwsgi_process_header(r);
+     }
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 25d8784c48..0d6996adfc 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -3,6 +3,8 @@ require nginx.inc
 SRC_URI:append = " \
     file://CVE-2026-40701.patch \
     file://CVE-2026-42934.patch \
+    file://CVE-2026-42946_p1.patch \
+    file://CVE-2026-42946_p2.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index ae7bfaee9f..9867ebea3d 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -3,6 +3,8 @@ require nginx.inc
 SRC_URI:append = " \
     file://CVE-2026-40701.patch \
     file://CVE-2026-42934.patch \
+    file://CVE-2026-42946_p1.patch \
+    file://CVE-2026-42946_p2.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6


