Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4145CCA46C
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:02 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13829.1792120857841685084
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=PyZH5MbX;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4644; q=dns/txt;
  s=iport01; t=1792120858; x=1793330458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=f3sHwzXof3eLH70O0mQVLJyuJm6l6M66GKmd6wOLqHs=;
  b=PyZH5MbXHo/lD7MV+GMWxqxHpgAgPe16qbZG9uSaHHVOsUYvFKAXVWaB
   1BNA7L7WGC3OfzVgWyeUYb/V8rauZbhM0NX6sQcdmcCBYOQyGIjCapsRP
   K17LJypqXWOutikZwB0sQylrOPUNue3+gX44mJR67Tu/twOuItT8EdfQr
   LOF8nrQkIyO3g3u+BzS9ftVZtFHv4VKeVR6edpp3Vg2FhiiVbfsibMhP0
   kBcQTSFMjPxLxF1j90K9EY7LLqSRtd8/QGRDkCBrJZ4kbqHvgZNChCGfA
   BEGNJ5sf696rQcmRo6Qm6cErWKHa8rh+Na8Gj5+LQeMDsOxqITzJxgZAS
   A==;
X-CSE-ConnectionGUID: KkiLV0/BSOyAxu9rqHGoVw==
X-CSE-MsgGUID: HTVclbeVQaC35HIC+7wmxA==
X-IPAS-Result: =?us-ascii?q?A0CmAgBtltFq/5T/Ja1aglmCV3VgQ0kDjVeIBGwDnhwUg?=
 =?us-ascii?q?WoPAQEBD0QNBAEBhQUCjhUCJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAEtEBwDAQIvKyMIGYMCAYJ0AxEGvHOBe?=
 =?us-ascii?q?TOBAYMpAYFU2zIBCxQBBYEzhUCII10YAYR8JxsbgXKBFYNpgQWBXAEBAYFGh?=
 =?us-ascii?q?l4EgiKBDIFaiDmNDkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGB?=
 =?us-ascii?q?YEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5ITHoJeB?=
 =?us-ascii?q?z1RARMWAQGBNBEmk1KSZKEPCiiDdowilToaM6pvC5h9jgqVf1CEaYFoPIFZc?=
 =?us-ascii?q?BWDIglKGQ+OLgEKC4NghRPJRycyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:qbJEAKA2yb63eBVW/3jiw5YqxClBgxIJ4kV8jS/XYbTApDtw0TRTm
 zBLXT2FbPncNzSkLot0btzl9koAu5LWn98xOVdlrnsFo1CmBibm6XV1Cm+qYkt+++WaFBoPA
 /02M4eGcYZsCCCM/n9BC5C5xVFkz6aEW7HgP+DNPyF1VGdMRTwo4f5Zs7ZRbrVA357jXGthh
 fuo+5eBYQf8hWYtWo4pw/vrRC1H7ayaVAww5jTSVdgT1HfCmn8cCo4oJK3ZBxPQXolOE+emc
 P3Ixbe/83mx109F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq+kTe5p0G2M80Mi+7vdkmc+dZk
 72hvbToIesg0zaldO41C3G0GAkmVUFKFSOuzXWX6aSuI0P6n3TE4PZvKH9ueqcj3fdeEXwf7
 +U4BzczcUXW7w626OrTpuhEnM8vKozveYgYoHwllGifBvc9SpeFSKLPjTNa9G5v3YYVQrCEO
 pdfMGY/BPjDS0Un1lM/CI4+leShnFH0ciZTrxSeoq9fD237kVYogeaybYWEEjCMbeVpoE2cr
 G/4xm3SWUw6FffcliWA4lv504cjmgu+Aur+DoaQ8eZnhlCWzGEfBBAaEFe2v/S9okq/QM5Eb
 UsM9ywjqKI/+ECmQp/6RRLQnZKflgQXV9wVF6gx7xuAj/ONpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOf9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:F7pdEahTwT2Xd3mDrwjtcrDV8HBQXgIji2hC6mlwRA09TyVXra
 +TdZMgpHjJYVkqOU3I9ersBEDEewK/yXcX2/h0AV7dZmnbUQKTRekIh7cKgQeQfhEWndQy6U
 4PScRD4fTLfD5HZL7BkWqFOudl5sWb+6a1guqb5XJsQQZ2L5xE1W5Ce3+m+okcfng8OXL/f6
 DsnvZ6mw==
X-Talos-CUID: 9a23:o1jFNmONI9206e5Deypm0HBMXeoeVWz03GqBOVaYJmFXV+jA
X-Talos-MUID: 9a23:VVIFyQbJBCyaXeBTlwPSjzVoOflR6o/1VWAsutZZpMyUHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="521967579"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 412181800024A;
	Fri, 16 Oct 2026 03:20:57 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 9411DCBEFBF; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 09/11] nginx: fix CVE-2026-56434
Date: Thu, 15 Oct 2026 20:20:54 -0700
Message-Id: <20261016032056.409095-10-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016032056.409095-1-hthakar@cisco.com>
References: <20261016032056.409095-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131032

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/nginx/nginx/commit/ddde692db11ab8238e9ca661007f64c9f6d764d2
[2] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-56434.patch          | 71 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 73 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-56434.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-56434.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-56434.patch
new file mode 100644
index 0000000000..ccf19a7745
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-56434.patch
@@ -0,0 +1,71 @@
+From ddde692db11ab8238e9ca661007f64c9f6d764d2 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Mon, 29 Jun 2026 21:49:27 +0400
+Subject: [PATCH] Avoid duplicate subrequest finalization
+
+Previously, if a subrequest was posted twice, it could be finalized in
+both calls, excessively reducing r->main->count and potentially leading
+to a use-after-free.
+
+The fix is to avoid posting a request if it's already posted.  Also,
+as a hardening measure, r->write_event_handler is now reset to a no-op
+handler during active subrequest finalization.
+
+The problem manifests itself in ngx_http_ssi_filter_module during
+unbuffered proxying.  If a subrequest is created for an SSI include
+statement while the main request has some data postponed by another
+include, this subrequest becomes double-posted when the main request
+data is flushed.  The first post comes from ngx_http_subrequest() and
+the second one comes from ngx_http_postpone_filter().  In case of a
+quick subrequest finalization, the above mentioned problem happens.
+
+Reported by P4P3R-HAK.
+
+CVE: CVE-2026-56434
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/ddde692db11ab8238e9ca661007f64c9f6d764d2]
+
+(cherry picked from commit ddde692db11ab8238e9ca661007f64c9f6d764d2)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/ngx_http_request.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/src/http/ngx_http_request.c b/src/http/ngx_http_request.c
+index ceac8d307..6dc275757 100644
+--- a/src/http/ngx_http_request.c
++++ b/src/http/ngx_http_request.c
+@@ -2501,6 +2501,14 @@ ngx_http_post_request(ngx_http_request_t *r, ngx_http_posted_request_t *pr)
+ {
+     ngx_http_posted_request_t  **p;
+ 
++    for (p = &r->main->posted_requests; *p; p = &(*p)->next) {
++        if ((*p)->request == r) {
++            ngx_log_debug0(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
++                           "http request already posted");
++            return NGX_OK;
++        }
++    }
++
+     if (pr == NULL) {
+         pr = ngx_palloc(r->pool, sizeof(ngx_http_posted_request_t));
+         if (pr == NULL) {
+@@ -2511,8 +2519,6 @@ ngx_http_post_request(ngx_http_request_t *r, ngx_http_posted_request_t *pr)
+     pr->request = r;
+     pr->next = NULL;
+ 
+-    for (p = &r->main->posted_requests; *p; p = &(*p)->next) { /* void */ }
+-
+     *p = pr;
+ 
+     return NGX_OK;
+@@ -2632,6 +2638,8 @@ ngx_http_finalize_request(ngx_http_request_t *r, ngx_int_t rc)
+ 
+             r->main->count--;
+ 
++            r->write_event_handler = ngx_http_request_empty_handler;
++
+             if (pr->postponed && pr->postponed->request == r) {
+                 pr->postponed = pr->postponed->next;
+             }
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index bcceedf820..56050b84eb 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -14,6 +14,7 @@ SRC_URI:append = " \
     file://CVE-2026-42533_p3.patch \
     file://CVE-2026-42533_p4.patch \
     file://CVE-2026-42533_p5.patch \
+    file://CVE-2026-56434.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 1e0b889dcd..68015a12fa 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -14,6 +14,7 @@ SRC_URI:append = " \
     file://CVE-2026-42533_p3.patch \
     file://CVE-2026-42533_p4.patch \
     file://CVE-2026-42533_p5.patch \
+    file://CVE-2026-56434.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6


