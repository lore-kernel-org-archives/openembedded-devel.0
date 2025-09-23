Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AFCECAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 16:04:21 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web10.1543.1758643452524201000
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 09:04:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=JRchSOny;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2536; q=dns/txt;
  s=iport01; t=1758643452; x=1759853052;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uL+aCe6ZxTbmJVb8OLFb+ULVmFo0qEmORkyF3P0euG4=;
  b=JRchSOnyMCpwmjxQtlK1qlbOjlgyxk5nj+oi6JHzmk5IuT02bYgT8W4f
   YByFfbyuVlN874ZmwM62My/xeZr30SD8X7CQZckvzD33ftT5rv19Tbhyq
   ClUi2Bbin6vzvwGc4gGzLxeG/YZAQW9SfkoN2LNrzRrjZeakzUaJ85c/2
   hUst2j8NuxhgAjQmdsk0J7ZT7BfudKjhoMhcaMuWmj5vQuBJrlU62i44r
   pxdrCB3Vx0qeyhjxbyZDF4nd/KHMjdb0+C1lONw5fSiBoDPJLjNJwdBDh
   +jfPY4na0oIIL4oQbTGLZTChqDwQIv/6ew1MrzxRiMVpyI3vXRp2/egTs
   w==;
X-CSE-ConnectionGUID: PV4jUzlLQB+ZkLR/diF8tQ==
X-CSE-MsgGUID: XskbB7ByQzKs+L/ljKc97Q==
X-IPAS-Result: =?us-ascii?q?A0AeAADUw9Jo/5T/Ja1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfwQBAQEBAQsBgkZ7UwZDSYxwiGlsA4tkkjaCDgEBA?=
 =?us-ascii?q?Q89FAQBAZFJAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQMDMgEYAS0QHAMBAi8gCyMIGYMCAYI6AzUDEQa0O4IsgQGDK?=
 =?us-ascii?q?AE/AkPZEQ2CW4FJAYgxhRtvAYR3JzaBcoJQgi2BBYEaQgEBgSeBBoV3BIIig?=
 =?us-ascii?q?QIUi3+EMH2BXjGKAUhEAwkGAgICDy0GA1ksAVUTDQoLBwWBYwM1DAsuFW4iE?=
 =?us-ascii?q?B2BJ4NhgSqEHitPhQKBFYNWJGsPBoEVg1sGgTGGVxMtAwsYDUgRLDcUGwY+b?=
 =?us-ascii?q?geWRIMxAYENASuCLJMlE5I8oB1xByuDdIwejz2FfBozhVulEAuYe4s1glOEC?=
 =?us-ascii?q?ZFeaYRpgWg8gUcLB3CDNwlJGQ+OLgoLg16Bf8ZOJjICOgIHCwEBAwmRaoF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:CHwqYqy5sGRzD6ZomBF6t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUAm
 zMdXG2DOvbbajH3KN0iaIq1/UsDuJ/cn95hHgZo+FhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/FH0a+KJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 IOaT/H3Ygf/hmYlaDlMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJHkIYY8l6OJTOEsNx
 /88EncBbz7Tm9vjldpXSsE07igiBNPgMIVavjRryivUSK9/B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2cM3WjOX9PYH46tPywm2L/az5RgFmUvqEwpWPUyWSd1ZCwbYuOJoPUHps9ckCwl
 nnF9U6mKAAjJv+Eih7C9nCPjb6QpHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8hkOgVtZ3L
 00P5jFoqrA/8kGuRNTxUxC05nmesXYht8F4CeY27kSJj6HT+QvcXzFCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1r994cRva1fApEFI/
IronPort-HdrOrdr: A9a23:SVcaK6CdzdwVPI7lHemr55DYdb4zR+YMi2TDGXofdfUzSL3+qy
 nAppUmPHPP5Qr5HUtQ++xoW5PwJU80i6QU3WB5B97LN2PbUSmTXeRfBODZrQEIdReTygck79
 YCT0C7Y+eAdGSTSq3BkW+FL+o=
X-Talos-CUID: 9a23:K3lsIm/Q1UO//8NLk7uVv3YqRsIYYHn59V2TEUycMyFlSZPFVWbFrQ==
X-Talos-MUID: 9a23:uXNQogsvQY7HY9djys2ntCphPu03ybWXGmMW0rFBv8unPn0vAmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,288,1751241600"; 
   d="scan'208";a="559347636"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Sep 2025 16:04:11 +0000
Received: from sjc-ads-6702.cisco.com (sjc-ads-6702.cisco.com [10.30.217.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 306651800015D;
	Tue, 23 Sep 2025 16:04:11 +0000 (GMT)
Received: by sjc-ads-6702.cisco.com (Postfix, from userid 1839047)
	id C9060C56065; Tue, 23 Sep 2025 09:04:10 -0700 (PDT)
From: Shubham@cisco.com, Pushpkar@cisco.com, -X@cisco.com,
	spushpka@cisco.com (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [meta-openembedded] [scarthgap] [PATCH] cjson 1.7.18: Fix CVE-2025-57052
Date: Tue, 23 Sep 2025 09:04:08 -0700
Message-Id: <20250923160408.46988-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <4853c446e6ab7d5451db06684f6adf0ae77d1503.camel@intel.com>
References: <4853c446e6ab7d5451db06684f6adf0ae77d1503.camel@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.217.17, sjc-ads-6702.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 16:04:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119717

From: Shubham Pushpkar <spushpka@cisco.com>

Upstream Repository: https://github.com/DaveGamble/cJSON.git

Bug Details: https://nvd.nist.gov/vuln/detail/CVE-2025-57052
Type: Security Fix
CVE: CVE-2025-57052
Score: 9.8
Patch: https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa

Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
---
 .../cjson/cjson/CVE-2025-57052.patch          | 33 +++++++++++++++++++
 .../recipes-devtools/cjson/cjson_1.7.18.bb    |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch

diff --git a/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
new file mode 100644
index 0000000000..ed3d4a7eba
--- /dev/null
+++ b/meta-oe/recipes-devtools/cjson/cjson/CVE-2025-57052.patch
@@ -0,0 +1,33 @@
+From e53a1413304382d562176bed91609e00b4fcf87e Mon Sep 17 00:00:00 2001
+From: Lee <peteralfredlee@gmail.com>
+Date: Fri, 5 Sep 2025 14:53:20 +0800
+Subject: [PATCH] fix the incorrect check in decode_array_index_from_pointer
+ (#957)
+
+this fixes CVE-2025-57052
+
+CVE: CVE-2025-57052
+Upstream-Status: Backport [https://github.com/DaveGamble/cJSON/commit/74e1ff4994aa]
+
+(cherry picked from commit 74e1ff4994aa4139126967f6d289b675b4b36fef)
+Signed-off-by: Shubham Pushpkar <spushpka@cisco.com>
+---
+ cJSON_Utils.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/cJSON_Utils.c b/cJSON_Utils.c
+index 63651df..8fa24f8 100644
+--- a/cJSON_Utils.c
++++ b/cJSON_Utils.c
+@@ -282,7 +282,7 @@ static cJSON_bool decode_array_index_from_pointer(const unsigned char * const po
+         return 0;
+     }
+ 
+-    for (position = 0; (pointer[position] >= '0') && (pointer[0] <= '9'); position++)
++    for (position = 0; (pointer[position] >= '0') && (pointer[position] <= '9'); position++)
+     {
+         parsed_index = (10 * parsed_index) + (size_t)(pointer[position] - '0');
+ 
+-- 
+2.44.1
+
diff --git a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
index bdeab3055c..67d536cf24 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
 SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
            file://run-ptest \
+           file://CVE-2025-57052.patch \
          "
 SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 
-- 
2.35.6


