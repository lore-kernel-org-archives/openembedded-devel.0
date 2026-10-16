Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24AECCA48B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 03:21:03 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14024.1792120857866428002
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Oct 2026 20:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=EN8kwwBD;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=3554; q=dns/txt;
  s=iport01; t=1792120857; x=1793330457;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ck2UzoshakPePwKTGxiILBsUhnFkP/W7vv4WPff9n7M=;
  b=EN8kwwBDLbSPt0urbuw7W09NGdvW46M9C9Zhl0fxoQJVnLAQ4PXw4iKL
   MZoNoQGtWRPrMZp9sEbo7qnwsqUth0KuL5CYoV2Gb990k4zbvQtz3diL+
   1AT2wLVA+0YwL1cz7lzNWuDx8cgx4MNRw6hWYiHLAEhihwxMETf5fjm3o
   dcaEjEjF+/hW265TDzbagZDsJ66xbXk5BnHsg//zuKxTWNXJiBuRTPFAF
   2Q3rYGTjwlWqQ7ZPwrbFmM5XqByRsX/SGGR3VKgIR74slBh2LxE3G0ewp
   WKuIP/ScgQzjvhSpBqyQId+JVpUQ+RPuvb71HeWT/Ap2Gw1QrNph1PrYr
   Q==;
X-CSE-ConnectionGUID: IMkHhEb3Th+my7PtDh5XGA==
X-CSE-MsgGUID: oF/Ng0iGT4qMMUcxcg8I/w==
X-IPAS-Result: =?us-ascii?q?A0CmAgCRl9Fq/4r/Ja1aglmCV3VgQ0kDjVeIBGwDnhyBf?=
 =?us-ascii?q?g8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBBQEBA?=
 =?us-ascii?q?QIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEQa8dIF5M?=
 =?us-ascii?q?4EBgykBgVTbMgELFAEFgTOFQIgjXRgBhHwnGxuBcoR+gQWBXAEBAYgkBIIig?=
 =?us-ascii?q?QyBWh4ylHdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbBgWBHYEgg?=
 =?us-ascii?q?hYjGTZ6gQlegSspYAEQF4EJggcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETG?=
 =?us-ascii?q?jALgRs4PAkoQRcMcwwdBXIIAg0JBykYDUgRLDcVGQQ+bgeSEx6CZT1RASkBA?=
 =?us-ascii?q?SCBQAumNqEPCiiDdowilToaM6pvC5h9jgqVZhlQhGmBaDyBWXAVgyIJShkPj?=
 =?us-ascii?q?i8KC4NghRPJRycyAgkDLwEBBwIHDgMLgWiRfgEB?=
IronPort-Data: A9a23:axUuiK01kXDoyihB5/bD5YJwkn2cJEfYwER7XKvMYLTBsI5bp2YBz
 moeCGuDPP7fMzb1edwnPoXn9k8OsMDVmtA2TAY53Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmYtbDpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLWQ1HY018L1LASJL5
 KMgNBwNMyCsrrfjqF67YrEEasULNsLnOsYb/3pn1zycVa9gSpHYSKKM7thdtNsyrpkRRrCFO
 IxDNGcpNU+QC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZjeOzboWMIoLVLSlTtkG24
 UTJp2XWPk0DEfmiwiqO/SKNwfCayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PW0lEO6c9ZeM
 FAPvC02oK4/8UamQtXwU1u/unHsg/IHc8BbH+t/7ESGzbDZpl7AQGMFVTVGLtchsafaWAAX6
 7NApPuxbRQHjVFfYSv1Gmu8xd9qBRUoEA==
IronPort-HdrOrdr: A9a23:ero/MKBVz2gwHSnlHel055DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygd179
 YHT0EHMqySMXFKyeDn/QK/D9EshPOD8KyumKPi6k0Fd3ASV0mlhD0JcTpy1SZNNXF7OaY=
X-Talos-CUID: 9a23:Dw9cnGHiFS0AJAUEqmJG0U00Gu0vKUHdj3LBfHekJWY0eJK8HAo=
X-Talos-MUID: 9a23:qj2YHwZTWLz8oeBTsBGroj46NehUv72LLX0GgZ4J6+jDKnkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536671067"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 03:20:57 +0000
Received: from sjc-ads-5245.cisco.com (sjc-ads-5245.cisco.com [10.28.23.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id D77FB180001DB;
	Fri, 16 Oct 2026 03:20:56 +0000 (GMT)
Received: by sjc-ads-5245.cisco.com (Postfix, from userid 1887505)
	id 80481CBF204; Thu, 15 Oct 2026 20:20:56 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [meta-webserver][wrynose][PATCH 04/11] nginx: fix CVE-2026-42945
Date: Thu, 15 Oct 2026 20:20:49 -0700
Message-Id: <20261016032056.409095-5-hthakar@cisco.com>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131025

From: Hetvi Thakar <hthakar@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

[1] https://github.com/nginx/nginx/commit/524977e7c534e87e5b55739fa74601c9f1102686
[2] https://nginx.org/en/security_advisories.html

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../nginx/files/CVE-2026-42945.patch          | 47 +++++++++++++++++++
 .../recipes-httpd/nginx/nginx_1.28.3.bb       |  1 +
 .../recipes-httpd/nginx/nginx_1.29.7.bb       |  1 +
 3 files changed, 49 insertions(+)
 create mode 100644 meta-webserver/recipes-httpd/nginx/files/CVE-2026-42945.patch

diff --git a/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42945.patch b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42945.patch
new file mode 100644
index 0000000000..df26fd79dc
--- /dev/null
+++ b/meta-webserver/recipes-httpd/nginx/files/CVE-2026-42945.patch
@@ -0,0 +1,47 @@
+From 524977e7c534e87e5b55739fa74601c9f1102686 Mon Sep 17 00:00:00 2001
+From: Roman Arutyunyan <arut@nginx.com>
+Date: Wed, 22 Apr 2026 09:39:31 +0400
+Subject: [PATCH] Rewrite: fixed escaping and possible buffer overrun
+
+The following code resulted in incorrect escaping of $1 and possible
+segfault:
+
+    location / {
+        rewrite ^(.*) /new?c=1;
+        set $myvar $1;
+        return 200 $myvar;
+    }
+
+If there were arguments in a rewrite's replacement string, the is_args flag
+was set and incorrectly never cleared.  This resulted in escaping applied
+to any captures evaluated afterwards in set or if.  Additionally buffer was
+allocated by ngx_http_script_complex_value_code() without escaping expected,
+thus this also resulted in buffer overrun and possible segfault.
+
+A similar issue was fixed in 74d939974d43.
+
+Reported by Leo Lin.
+
+CVE: CVE-2026-42945
+Upstream-Status: Backport [https://github.com/nginx/nginx/commit/524977e7c534e87e5b55739fa74601c9f1102686]
+
+(cherry picked from commit 524977e7c534e87e5b55739fa74601c9f1102686)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ src/http/ngx_http_script.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/http/ngx_http_script.c b/src/http/ngx_http_script.c
+index a2b9f1b7b..2ea611373 100644
+--- a/src/http/ngx_http_script.c
++++ b/src/http/ngx_http_script.c
+@@ -1202,6 +1202,7 @@ ngx_http_script_regex_end_code(ngx_http_script_engine_t *e)
+ 
+     r = e->request;
+ 
++    e->is_args = 0;
+     e->quote = 0;
+ 
+     ngx_log_debug0(NGX_LOG_DEBUG_HTTP, r->connection->log, 0,
+-- 
+2.35.6
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
index 0d6996adfc..308edd96bd 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.28.3.bb
@@ -5,6 +5,7 @@ SRC_URI:append = " \
     file://CVE-2026-42934.patch \
     file://CVE-2026-42946_p1.patch \
     file://CVE-2026-42946_p2.patch \
+    file://CVE-2026-42945.patch \
 "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=3dc49537b08b14c8b66ad247bb4c4593"
diff --git a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
index 9867ebea3d..4a3d524346 100644
--- a/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
+++ b/meta-webserver/recipes-httpd/nginx/nginx_1.29.7.bb
@@ -5,6 +5,7 @@ SRC_URI:append = " \
     file://CVE-2026-42934.patch \
     file://CVE-2026-42946_p1.patch \
     file://CVE-2026-42946_p2.patch \
+    file://CVE-2026-42945.patch \
 "
 
 # 1.28.x branch is the current stable branch, the recommended default
-- 
2.35.6


