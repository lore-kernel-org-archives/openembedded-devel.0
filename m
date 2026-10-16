Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55541CCF2C0
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:04 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14026.1792120858133391716
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EbhIcaXa;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3682; q=dns/txt;
  s=iport01; t=1792120858; x=1793330458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hzEJXWnNtlwLE+0POE3rjUSMhaqHItyLpCEVYRI2w+8=;
  b=EbhIcaXaykWqyuFjhph6BW+in5rxFcoH6KPNhW8nOp9pt5t17F0rTlXE
   KJypvwEBkeMrvBfkm3RlOc08VcNz9CxVcLFo9gYcSZtqFQqO8XPebXfHe
   dGkSIuq2s9bhd3Qgcm9jKzWf25/CcXVtDlvvN5Gp5QwtUpf/gQ9n3zNP0
   +tT/Nle8Qq14jmbuSXz5yX6IwfZMi2TJfR/MVN8H+vgJjkHadGIrf3YaR
   UA0qVSpSSuRlbwzAgdFaOt7xG3B5cGwTJtfdzCXj+0WBh89XiJImr7sxo
   ta4EJFNtuujVM8vG2PAfUWZ8nR/ZeZumXoELCdhz5304KB6auhM0uNtJZ
   Q==;
X-CSE-ConnectionGUID: 7dep1ew6RLSVULy73ueSVg==
X-CSE-MsgGUID: IYR2nMqcQk+yx0SaLrvQEA==
X-IPAS-Result: =?us-ascii?q?A0A/AwD1ltFq/5T/Ja1aglmCV3VgQ0kDjVeIBGwDnhyBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOFQImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYASAKAxAcAwECLysjCBmDAgGCdAMRBrx0g?=
 =?us-ascii?q?XkzgQGDKQGBVNsyAQsUAQWBM4VAiCNdGAGEfCcbG4FyhH6BBYFcAQEBiCQEg?=
 =?us-ascii?q?iKBDIFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETG?=
 =?us-ascii?q?jALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CXgcWJzUcA?=
 =?us-ascii?q?SkBAReBVJN4kj6hDwoog3aMIpU6GjOqbwuYfY4Klk+EaYFpATqBWXAVgyIJS?=
 =?us-ascii?q?hkPji8KC4NghRPJRycyAgkDLwEBBwIHDgMLgWiEYY0dAQE?=
IronPort-Data: A9a23:+Od2n6IRilBQnOd7FE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS0jAHy
 WEXXDiAM/eNambwetAlb4Ww9EID75HUm9JhQQAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN0xAEwuZIAHpNxTOl9z0
 e1Hcy0AVS6M0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLo+gOehhXDlWzZZs1mS46Ew5gA/ySQsi+W3YIONI4biqcN9v3ei/
 GTj5m/AAVILJISkwB6f7EuBr7qa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRul/fDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:UBTJVq0a2DZ+gOvTEfLh/AqjBGokLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmoFFebvN5CBB/KXHyTj9Nco8y9+a963tr+Lfw3BxCTxOUchbnn5E4sLxKDwMeOGAbqBJbK
 ah2g==
X-Talos-CUID: =?us-ascii?q?9a23=3AbQ7awGr70SuxEpld8wXb+C3mUZ8pf2WEwWiOGWu?=
 =?us-ascii?q?DN1tNWeLOVFKrxqwxxg=3D=3D?=
X-Talos-MUID: 9a23:GAvYWAkoCns/334l26ABdnpDBf0y5YG3A3kO0oQW4/KNETZuAhq02WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="535281012"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 3C1271800016D;
	Fri, 16 Oct 2026 03:20:57 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 8C10BCBEF98; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 07/11] nginx: fix CVE-2026-48142
Date: Thu, 15 Oct 2026 20:20:52 -0700
Message-Id: <20261016032056.409095-8-hthakar@cisco.com>
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
 <openembedded-devel@lists.openembedded.org>; Fri, 16 Oct 2026 03:21:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131027

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/nginx/nginx/commit/60c4243eb8775d51662a01def8a7dad5d9fb34a7
[2] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-48142.patch          | 42 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 44 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-48142.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-48142.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-48142.patch
new file mode 100644
index 0000000000..1c39940fb7
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-48142.patch
@@ -0,0 +1,42 @@
+From 60c4243eb8775d51662a01def8a7dad5d9fb34a7 Mon Sep 17 00:00:00 2001
+From: Sergey Kandaurov <pluknet@nginx.com>
+Date: Mon, 1 Jun 2026 21:46:48 +0400
+Subject: [PATCH] Charset: fixed another rare buffer overread in
+ recode_from_utf8()
+
+With prerequisites similar to 696a7f1b9, it was possible to gain 1-byte
+overread on invalid UTF-8 sequences.  The reason is ngx_utf8_decode()
+stops advancing the pointer position on the first encountered invalid
+byte.  The fix is to adjust the advanced pointer up to the whole saved
+sequence in this case.  Note that this may result in different output
+compared to complete invalid UTF-8 sequences, which we can disregard
+at this point.
+
+Reported by Han Yan of Xiaomi and p4p3r of CYBERONE.
+
+CVE: CVE-2026-48142
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/60c4243eb8775d51662a01def8a7dad5d9fb34a7]
+
+(cherry picked from commit 60c4243eb8775d51662a01def8a7dad5d9fb34a7)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/modules/ngx_http_charset_filter_module.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/http/modules/ngx_http_charset_filter_module.c b/src/http/modules/ngx_http_charset_filter_module.c
+index edb2db568..e0115e1e4 100644
+--- a/src/http/modules/ngx_http_charset_filter_module.c
++++ b/src/http/modules/ngx_http_charset_filter_module.c
+@@ -855,6 +855,10 @@ ngx_http_charset_recode_from_utf8(ngx_pool_t *pool, ngx_buf_t *buf,
+         ngx_log_debug0(NGX_LOG_DEBUG_HTTP, pool->log, 0,
+                        "http charset invalid utf 1");
+ 
++        if (saved < &ctx->saved[ctx->saved_len]) {
++            saved = &ctx->saved[ctx->saved_len];
++        }
++
+     } else {
+         dst = ngx_sprintf(dst, "&#%uD;", n);
+     }
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index a47e398422..628e8f65b8 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -8,6 +8,7 @@ SRC_URI:append = " \
     file://CVE-2026-42945.patch \
     file://CVE-2026-9256.patch \
     file://CVE-2026-42055.patch \
+    file://CVE-2026-48142.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index bfd82d5e31..8ba04167c2 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -8,6 +8,7 @@ SRC_URI:append = " \
     file://CVE-2026-42945.patch \
     file://CVE-2026-9256.patch \
     file://CVE-2026-42055.patch \
+    file://CVE-2026-48142.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6


