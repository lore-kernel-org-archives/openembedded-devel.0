Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E525CAC5AC
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:16:52 +0000 (UTC)
Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.web10.3254.1758647810354642431
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:16:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=ese+pZGt;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2536; q=dns/txt;
  s=iport01; t=1758647810; x=1759857410;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uL+aCe6ZxTbmJVb8OLFb+ULVmFo0qEmORkyF3P0euG4=;
  b=ese+pZGtggL8Z2/x2hUVaaROgWsq5+i32nOuLOuFm5KXTYGjgRqW2id+
   QsPcxpXKXk30GWIDt7sH8lQII+fGKV/l3E+UWEGLMPZS3ddT/0DwGhhYX
   JrW5DgDoVW1R7AinYGoehLMqMT9ZAQoizJxpx7eJgU549NjOH21eYUNbK
   kUBvckxT77cl4DDyV5m6Re4MqKQNPjukmi6zPVTol45BYK7atIUTUEmwH
   JDJj1Pvt38F/aktshlnAMgFJvveFJyRcbxqBuXbUTkUkW+smPAfzFzRcB
   vlF5n12UihQSALaYXQ1mMdcZ2ginHJLEKOnrHUekrK4Y40qcR4UjO77qY
   g==;
X-CSE-ConnectionGUID: AnCQyVIkSceqw+6V51A8mw==
X-CSE-MsgGUID: 1uj5bR0IR2aHD3XmJm7M2Q==
X-IPAS-Result: =?us-ascii?q?A0AeAABm1dJo/5P/Ja1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfwQBAQEBAQsBgkZ7UwZDSYxwiGlsA4tkkjaCDgEBA?=
 =?us-ascii?q?Q89FAQBAZFJAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQMDMgEYAS0QHAMBAi8gCyMIGYMCAYI6AzUDEQa0P4IsgQGDK?=
 =?us-ascii?q?AE/AkPZEQ2CW4FJAYgxhRtvAYR3JzaBcoJQgi2BBYEaQgEBgSeBBoV3BIIig?=
 =?us-ascii?q?QIUi3+EMH2BXjGKBUhEAwkGAgICDy0GA1ksAVUTDQoLBwWBYwM1DAsuFW4iE?=
 =?us-ascii?q?B2BJ4NhgSqEHitPhQKBFYNWJGsPBoEVg1sGgTGGXRMtAwsYDUgRLDcUGwY+b?=
 =?us-ascii?q?geWSIMzAYENASuCLJMlE5I8oB1xByuDdIwejz2FfBozhVulEAuYe4s1glOEC?=
 =?us-ascii?q?ZFeaYRpgWg8gUcLB3CDNwlJGQ+OLgoLg16Bf8Y3JjICOgIHCwEBAwmRaoF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:RvpDmK6zkXSzNDnv4zqLjgxRtGjGchMFZxGqfqrLsTDasY5as4F+v
 mtOXGCPb62LZmL8etFwa4Wx901TvZTSnYMwGgU6pSkyZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH3dOG49xGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wr86UzBHf/g2QpajNOsPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eFIszw/dJIGJ1/
 vEBN3NTUE3arrKz3+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEQUrsUIMpWcOOAnWHiaD1Aq1u9rqss6G+Vxwt0uFToGIeIK4DXHJoNxS50o
 Eqf4makCCtCFebFwBqpqUKppOqQuHnCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFnhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:AFruM61hknfO7vI1udDnfQqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: 9a23:CpeaoWAdOwEuZQ76EwBh33cFJOEmSXbQ1WiTfXHlUE85TaLAHA==
X-Talos-MUID: 9a23:Fa7H5AQ8jLoaiYYFRXS1mTM/Pv0wwp70AWAhyqUDmczbEHZJbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,288,1751241600"; 
   d="scan'208";a="559451703"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Sep 2025 17:16:49 +0000
Received: from sjc-ads-6702.cisco.com (sjc-ads-6702.cisco.com [10.30.217.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 6CBA918000263;
	Tue, 23 Sep 2025 17:16:49 +0000 (GMT)
Received: by sjc-ads-6702.cisco.com (Postfix, from userid 1839047)
	id 14ABAC55F44; Tue, 23 Sep 2025 10:16:49 -0700 (PDT)
From: Shubham@cisco.com, Pushpkar@cisco.com, -X@cisco.com,
	spushpka@cisco.com (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [meta-openembedded] [walnascar] [PATCH] cjson 1.7.18: Fix CVE-2025-57052
Date: Tue, 23 Sep 2025 10:16:47 -0700
Message-Id: <20250923171647.21947-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20250921145000.21144-1-spushpka@cisco.com>
References: <20250921145000.21144-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.217.17, sjc-ads-6702.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119720

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


