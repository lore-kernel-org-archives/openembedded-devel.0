Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D8CCAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 14:50:12 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.web11.30529.1758466205668996818
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 07:50:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=XEtoThop;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2489; q=dns/txt;
  s=iport01; t=1758466205; x=1759675805;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y8MXrkMUR5omYWqT8rrLS85IX4xCq5JvFW2BQ/dp+O4=;
  b=XEtoThoppvSrV5hDnbDMNlGpWJZxlQp3TshPUzBwIKlK2Gwukd6XFAPn
   oKtUF1/kk+1CszwZ1S6S9/7TdJRc8SWYfY7Rc+gwAwneXhUdPtm2qzeCo
   207ALY9SfcbZi088QLoVyoE1rj8WG2vxRDJZwZeGN/o9Orrq0VvF4dnam
   /2+LKGbOi3EVQV5cKy3QNbp6Sv6Ef4HejmgFUga/kP7sxoSV5VrSSbchU
   9CeuzSuSp3H1oHZ7WWqiE2zAgNDZ2OtldIWohf/Zw0PUwOaRAHrmSSouM
   D5Ymgfb/lXXhhnk4OcIfO90FNlUZ//rx7qW0RKmjWW4fxGZ8hvyCdt/Lc
   w==;
X-CSE-ConnectionGUID: Qqj5nq62Ro+gaKwFLLAYbw==
X-CSE-MsgGUID: L7AXpnC/SZagvr/kcXI7dg==
X-IPAS-Result: =?us-ascii?q?A0ADAAC9D9Bo/5UQJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfwQBAQEBAQsBgkZ7WUNJjHCIaWyLZxCSJoF/DwEBA?=
 =?us-ascii?q?Q89FAQBAYUHjD8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgE1ARgBLSwDAQJPCyMhgwIBgjoDNQMRBrU9giyBAYMoA?=
 =?us-ascii?q?T8CQ0/YQg1ugW2BSQGIMYUbbwGEdycbgUlEglCCLYEFgRpCAQGBJ4EGhXcEg?=
 =?us-ascii?q?yQUi3+EMH2BXjGJYkiBHgNZLAFVEw0KCwcFgWMDNQwLLhVuMh2BJ4NhgSqEH?=
 =?us-ascii?q?itPhQKEayRrDwaBFYNbBoExhX1AAwsYDUgRLDcUGwY+bgeWJIMxAYENASuCL?=
 =?us-ascii?q?JMlE5I8oB1xhCaMHo89hXwaM4VbpRALmHuLNYJThAmRXmmEaYFoPIFHCwdNI?=
 =?us-ascii?q?xWDIglJGQ+OLgoLg16Bf8VDJjICOgIHCwEBAwmRaoF9AQE?=
IronPort-Data: A9a23:RLXmO6I9km8aBGkqFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3jdWm
 zcfUG6FPPmNZGryfNF3O9yzpBgF7Z/UytBkTVQd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCWa/073WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVrd0
 T/Oi5eHYgL9imQtajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1XFUNrO5RGoNxwQm5H1
 uM2DBQkXxqc0rfeLLKTEoGAh+wqKM3teYdasXZ6wHSAV7AtQIvIROPB4towMDUY358VW62AI
 ZNHL2MzPXwsYDUXUrsTIIkmgfyonnr2WzZZs1mS46Ew5gA/ySQsjeezbICKI4DiqcN9uhmxl
 nrA1CPCMBgVKsbYyjG10y2gibqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+rfSnh0qWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0Ut5UFag+rQqK0KeRulzfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9FRpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:rp5yJq9tjTGe2g1zpmtuk+DTI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJ8U7ndQtsp
 uJtMNFebnNMWQ=
X-Talos-CUID: 9a23:VjMbn25Xbg9eOpFZHtsszVcWR8Y8LCfnyzTfKmynJ0JNYYyfVgrF
X-Talos-MUID: =?us-ascii?q?9a23=3AGXR0WA0ypr3GgVyvla5P9AnyAjUjx/uHOFgLutI?=
 =?us-ascii?q?9icCLKzY3ODytrWu7Tdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,283,1751241600"; 
   d="scan'208";a="557642714"
Received: from alln-l-core-12.cisco.com ([173.36.16.149])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Sep 2025 14:50:04 +0000
Received: from sjc-ads-6702.cisco.com (sjc-ads-6702.cisco.com [10.30.217.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-12.cisco.com (Postfix) with ESMTPS id 5C56D18004734;
	Sun, 21 Sep 2025 14:50:03 +0000 (GMT)
Received: by sjc-ads-6702.cisco.com (Postfix, from userid 1839047)
	id EBDBCC57B1B; Sun, 21 Sep 2025 07:50:01 -0700 (PDT)
From: Shubham Pushpkar <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [meta-openembedded] [walnascar] [PATCH] cjson 1.7.18: Fix CVE-2025-57052
Date: Sun, 21 Sep 2025 07:50:00 -0700
Message-Id: <20250921145000.21144-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.217.17, sjc-ads-6702.cisco.com
X-Outbound-Node: alln-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 14:50:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119628

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


