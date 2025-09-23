Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141C5CAC5B5
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 17:20:02 +0000 (UTC)
Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web11.3326.1758647994418412430
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 10:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Tt4ZISni;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2674; q=dns/txt;
  s=iport01; t=1758647994; x=1759857594;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=t/xYPHFW4H6IP8jLjHU1jFPvGmlhhuAhWNjvXXAICnc=;
  b=Tt4ZISni2xBA5dTsznrZvXKBBHNLpvC12lU2GSmi4Fg680sl5B1m7mLm
   /VIN8ZbzVbFj4cn+53STN7/G+hULtJjg3EWhRV71MjCx7eQclolPHVdoW
   toSRHb9lIdpou8YuuHppjJyn/xXwOW8pzeVy2uZJObmUTJ7/4PLUnqjhN
   ZJEBirjZqq3m+0CjlZdcEHudcJ/OFi7yDsGchmnlJc727uW2k14ZBLOti
   yy2YpVDoriuxrDotEEj2nZoxjuDFEBRZBzyj/tfN3MqmBPy1ah7c5+h4l
   Hum9CX4Y7i5TBM2IGAZBA2nuEHHiR9rtFd1MNccL/PvAV0Q/rxFa4r5sJ
   w==;
X-CSE-ConnectionGUID: dHMQ2O8+Q0aJzWGHBgOhpg==
X-CSE-MsgGUID: PXjluAeAQ+m6yeMp1nn6MA==
X-IPAS-Result: =?us-ascii?q?A0AeAABm1dJo/5X/Ja1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfwQBAQEBAQsBgkZ7UwZDSYxwiGlsA4tkkjaCDgEBA?=
 =?us-ascii?q?Q89FAQBAZFJAiY0CQ4BAgQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQMDMgEYAS0QHAMBAi8gCyMIGYMCAYI6AzUDEQa0P4IsgQGDK?=
 =?us-ascii?q?AE/AkPZEQ2CW4FJAYgxhRtvAYR3JzaBcoJQgi2BBYEaQgEBgSeBBoV3BIIig?=
 =?us-ascii?q?RaLf4QwfYFeIBGKBUhEAwkGAgICDy0GA1ksAVUTDQoLBwWBYwM1DAsuFW4iE?=
 =?us-ascii?q?B2BJ4NhgSqEHitPhQKBFYNWJGsPBoEVg1sGgTGGXRMtAwsYDUgRLDcUGwY+b?=
 =?us-ascii?q?geWSIMzAYENASuCLJMlE5I8oB1xByuDdIwejz2FfBozhVulEAuYe4s1glOEC?=
 =?us-ascii?q?ZFeaYRpgWg8gUcLB3CDNwlJGQ+OLgoLg16Bf8Y3JjICOgIHCwEBAwmRaoF9A?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:KbvmwK/28e77TJyMtS2dDrUD0H+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 WEfCmyFPqrZMGCjKtFzaIWy9RgGscSHn9Q3HFNkrChEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4E3ra+G7xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4qiyyHjEAX9gWMsYzhPs/jrRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k6HaghoMEnQlgW/
 N4KFx8tRB+kh/q5lefTpulE3qzPLeHxN48Z/3UlxjbDALN/G9bIQr7B4plT2zJYasJmRKmFI
 ZFGL2AyMVKZP0wn1lQ/UPrSmM+znmTkcyVboXqepLE85C7YywkZPL3FbYeEIYPUHJQK9qqej
 lr2/WDkKxwzDZ+alyuI12r1gOmRuAquDer+E5X9rJaGmma7wXQeDhATX1a3rfS1z0KzRd9bA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzFeCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u38Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:iyi1+q0rvtIQuKG7KwrfEAqjBLUkLtp133Aq2lEZdPWaSKOlfq
 eV7ZMmPHDP6Qr5NEtMpTnEAtjjfZq+z+8Q3WBuB9eftWDd0QPCRr2Kr7GSpgEIcBeRygcy78
 tdmtBFeb7N5ZwQt7eC3OF+eOxQpuW6zA==
X-Talos-CUID: 9a23:hJNFRGFRakHsbMpSqmJr1GstQOd1MUSFxVXCHGCYI2lOSKWaHAo=
X-Talos-MUID: 9a23:RPQvHAqG6FGZIwgjxbYezwlSNsN1yqmHMQMIz4QLntHdMyouHh7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,288,1751241600"; 
   d="scan'208";a="559376197"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by alln-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Sep 2025 17:19:53 +0000
Received: from sjc-ads-6702.cisco.com (sjc-ads-6702.cisco.com [10.30.217.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 5D317180001DB;
	Tue, 23 Sep 2025 17:19:53 +0000 (GMT)
Received: by sjc-ads-6702.cisco.com (Postfix, from userid 1839047)
	id 061E6C55F44; Tue, 23 Sep 2025 10:19:53 -0700 (PDT)
From: Shubham@cisco.com, Pushpkar@cisco.com, -X@cisco.com,
	spushpka@cisco.com (spushpka - E INFOCHIPS PRIVATE LIMITED at Cisco)
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [meta-openembedded] [kirkstone] [PATCH] cjson 1.7.18: Fix CVE-2025-57052
Date: Tue, 23 Sep 2025 10:19:51 -0700
Message-Id: <20250923171951.26646-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20250921151135.55865-1-spushpka@cisco.com>
References: <20250921151135.55865-1-spushpka@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.217.17, sjc-ads-6702.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 17:20:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119721

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
 .../recipes-devtools/cjson/cjson_1.7.18.bb    |  4 ++-
 2 files changed, 36 insertions(+), 1 deletion(-)
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
index 797ab028cd..6c335a988a 100644
--- a/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
+++ b/meta-oe/recipes-devtools/cjson/cjson_1.7.18.bb
@@ -5,7 +5,9 @@ SECTION = "libs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=218947f77e8cb8e2fa02918dc41c50d0"
 
-SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https"
+SRC_URI = "git://github.com/DaveGamble/cJSON.git;branch=master;protocol=https \
+           file://CVE-2025-57052.patch \
+         "
 SRCREV = "acc76239bee01d8e9c858ae2cab296704e52d916"
 
 S = "${WORKDIR}/git"
-- 
2.35.6


