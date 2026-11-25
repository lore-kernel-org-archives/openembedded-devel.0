Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.36767.1795587335121627206
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Nov 2026 22:15:35 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=CspxSKH/;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=4618; q=dns/txt;
  s=iport01; t=1795587335; x=1796796935;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=oUmA/E5DrBxDpCvQXL0ONHaUhYy7SUY4fpKoc/MWSZw=;
  b=CspxSKH/vIoE9vCdNpXbDbH3AUFCvi/SP/dBgn4SjFwimZdm4gV8Aohz
   eWJLuH4gzZHtG9VHzKBe6sf8yuplcDnWMU6c4V+daX1oHBk4Jlrcllj1C
   Uwvw8G5TQo0tjk7BBtVxfrO3519WJt8DoLe4IdjmmXvJU77vKc1vMA01n
   jum9fR2RoGWjlJErVzQQMEK/EAueP+JLM56LmXUsf66y3MeCCB0t3YnR5
   tixfPQoH3OYXdDd6SxoHeSzeJZKYi1yO6kGEPzTdv/GfWpa49vCm2uCBY
   dsnZfnmxhjk4bh4sAohseq9KxyC1y7O2dO++cX27YC6J7/BAIbQ006sRc
   Q==;
X-CSE-ConnectionGUID: VK1aok+BQb2qZ8cjvNKteg==
X-CSE-MsgGUID: SIRoRpZqSiKQBIrznEQUSg==
X-IPAS-Result: =?us-ascii?q?A0BJAgB5fAZr/81K/pBaglmCGD91YENJA5QngTVsA54pg?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhQUCjiICJjQJDgECBAMCAwEBAQEBAQEBAQEBAQoBAQUBA?=
 =?us-ascii?q?QECAQcFgQ4Thk8NkBIBAgEDJwsBGAE9HAMBAi8rIwgZgipYAYJ0AxG5YoF5M?=
 =?us-ascii?q?4EBgykBPwJDUNszAQsUAYE4hUKIJV0YAYR+JxsbgXKBFYNqgQWBXAKIJgSCI?=
 =?us-ascii?q?oEMgVSNEwKBSYhSSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM7F4EHGwYFg?=
 =?us-ascii?q?RyBHoESgQNdgSsoXiGBCIF1AoJRggACAUlBDgdFUwklQxJHJCIIEgkBExosC?=
 =?us-ascii?q?oEaNTwJJj8VDGcLGgVhCAINDHQ5EDAcJC8FGSY8GwqBDCcdHhkOAikGFiELN?=
 =?us-ascii?q?BgNSBEsNxUZBD5uB5QTgxs9UQETGIFrQZMRJpI+n1OBPgoog3mMJJU6GjOFW?=
 =?us-ascii?q?6UXC5h9jgqWUYRqgWg8gVlwFYMiCUoZD44vCguDYIJky3cmMgIJAy8BAQcCB?=
 =?us-ascii?q?w4DC4FohGGNHQEB?=
IronPort-Data: A9a23:o5TbqqurM6yVZYidyEGffn8cqOfnVAJfMUV32f8akzHdYApBsoF/q
 tZmKWGCP/2OYmX2ftsib4m29h8PvcKEytdmTABk/ys3QX9DgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrb/656ykmiMlkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZzdJ5xYuajhKsvvZ80s11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIwxMUuCGZNt
 tYhImoUXECIhfyQ4662Rbw57igjBJGD0II3s3x6iDWcBvE8TNWbH+PB5MRT23E7gcUm8fT2P
 pZFL2AyMFKfP1sVYgp/5JEWxI9EglH/bz1Rq1uPjaE2+GPUigd21dABNfKLIofVHpoLxy50o
 Er93l7+OAkoLeee6gOv02i+gML2oBj0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz5RvIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Vo1XQ6FLv3LO++yYpLqExMeALOsnbusQ8zAXPidKOHhom6Oj+f
 xG8M536fawskdzZJhCo6HkBED/exLhHPdOiOF7V4tKHjOW2ldAR7sM0WKN+VHd8lXFltJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3ASbaolmiNLfYbkvl03mE1XAvRsjJuTF6ExXDTYGW?=
 =?us-ascii?q?BAzxweu2eS0G2279pnJ87?=
X-Talos-MUID: 9a23:Y6CAvwssUu4qn01iAM2nvxBYM/1w0b2VCWM0u7Qcqc+pDBFLNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60373761"
Received: from aer-l-core-04.cisco.com ([144.254.74.205])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 06:15:33 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-04.cisco.com (Postfix) with ESMTPS id C420E18000348
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:32 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 08E85CBEF98; Tue, 24 Nov 2026 22:15:30 -0800 (PST)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-webserver][wrynose][PATCH 09/10] nginx: fix CVE-2026-121810
Date: Tue, 24 Nov 2026 22:15:28 -0800
Message-Id: <20261125061529.2721522-9-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125061529.2721522-1-hthakar@cisco.com>
References: <20261125061529.2721522-1-hthakar@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5245.cisco.com [10.28.23.9];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.23.9, sjc-ads-5245.cisco.com
X-Outbound-Node: aer-l-core-04.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2026 06:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132991
Content-Type: text/plain; charset="utf-8"

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream nginx stable backport for
CVE-2026-121810. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/nginx/nginx/commit/c58d2a22d12350766185c94f2245bf4be5bcfb7d
[2] https://ubuntu.com/security/CVE-2026-121810

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-121810.patch         | 64 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 66 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-121810.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-121810.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-121810.patch
new file mode 100644
index 0000000000..3de6c04a3c
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-121810.patch
@@ -0,0 +1,64 @@
+From c58d2a22d12350766185c94f2245bf4be5bcfb7d Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Sun, 1 Nov 2026 16:46:22 +0400
+Subject: [PATCH] QUIC: avoid main connection reuse after creating a stream
+
+Previously, ngx_quic_create_stream() cleared the main connection's
+reusable flag and then called ngx_get_connection() before inserting the
+new stream into the tree.  If the worker was low on free connections,
+the drain inside ngx_get_connection() could close an idle stream of the
+same main connection.  Since the new stream was not in the tree yet,
+that close found no remaining streams and marked the main connection
+reusable again.  Once reusable, the connection could later be drained
+while processing one of its streams, for example when connecting to an
+upstream, freeing it while still in use.
+
+Fix is to insert the new stream into the tree before calling
+ngx_get_connection(), so the main connection is not considered idle.
+
+Reported by Xint.io.
+
+CVE: CVE-2026-121810
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/c58d2a22d12350766185c94f2245bf4be5bcfb7d]
+
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/event/quic/ngx_event_quic_streams.c | 6 ++++--
+ 1 file changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/event/quic/ngx_event_quic_streams.c b/src/event/quic/ngx_event_quic_streams.c
+--- a/src/event/quic/ngx_event_quic_streams.c
++++ b/src/event/quic/ngx_event_quic_streams.c
+@@ -731,12 +731,15 @@ ngx_quic_create_stream(ngx_connection_t *c, uint64_t id)
+         addr_text.data = NULL;
+     }
+ 
++    ngx_rbtree_insert(&qc->streams.tree, &qs->node);
++
+     reusable = c->reusable;
+     ngx_reusable_connection(c, 0);
+ 
+     sc = ngx_get_connection(c->fd, log);
+     if (sc == NULL) {
+         ngx_destroy_pool(pool);
++        ngx_rbtree_delete(&qc->streams.tree, &qs->node);
+         ngx_queue_insert_tail(&qc->streams.free, &qs->queue);
+         ngx_reusable_connection(c, reusable);
+         return NULL;
+@@ -803,6 +806,7 @@ ngx_quic_create_stream(ngx_connection_t *c, uint64_t id)
+     if (cln == NULL) {
+         ngx_close_connection(sc);
+         ngx_destroy_pool(pool);
++        ngx_rbtree_delete(&qc->streams.tree, &qs->node);
+         ngx_queue_insert_tail(&qc->streams.free, &qs->queue);
+         ngx_reusable_connection(c, reusable);
+         return NULL;
+@@ -811,8 +815,6 @@ ngx_quic_create_stream(ngx_connection_t *c, uint64_t id)
+     cln->handler = ngx_quic_stream_cleanup_handler;
+     cln->data = sc;
+ 
+-    ngx_rbtree_insert(&qc->streams.tree, &qs->node);
+-
+     return qs;
+ }
+ 
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index a84c01bee5..761c0edfd0 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -33,6 +33,7 @@ SRC_URI:append = " \
     file://CVE-2026-113425_p2.patch \
     file://CVE-2026-113425_p3.patch \
     file://CVE-2026-113425_p4.patch \
+    file://CVE-2026-121810.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 0e05ccc6bd..e030fb3ec8 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -33,6 +33,7 @@ SRC_URI:append = " \
     file://CVE-2026-113425_p2.patch \
     file://CVE-2026-113425_p3.patch \
     file://CVE-2026-113425_p4.patch \
+    file://CVE-2026-121810.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6

