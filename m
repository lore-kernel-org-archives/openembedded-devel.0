Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCBE7CAC592
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 11:33:36 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web10.14036.1758281613259274609
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 19 Sep 2025 04:33:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=WZY5j4Nj;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2489; q=dns/txt;
  s=iport01; t=1758281613; x=1759491213;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=y8MXrkMUR5omYWqT8rrLS85IX4xCq5JvFW2BQ/dp+O4=;
  b=WZY5j4Nj6t4O2ERGq/1FaquWlU5J1NwrmZjhmzG1MI97OvDsep4E2lHT
   ufcDM7dcpTTIqBVXNFJSncTE3wSNpCbFHhXc6JoTvEPs1K5NLvwnLaCkY
   Bq7DGQAieXAsg8Zh8X2Lnr1IVSsl0MV9s9Z4YJM6Q82NRApHWqJU9ZhyF
   C0uYjrslPyR/2m/CFhtHizfn4oq3O8PhGd8UzIv8cbt3TAVyx5qBL3Ihx
   b5w33p1I+EYU9/IK+ZUTf/Ox5SGbb6JUnh3Wsed/1IQ8YJh34QIZgvlC4
   2fcDPUNzksNweXBuCCZWPBlsKGn1DHPMBlN2oztqYFGfeUwUEscsvXy/M
   A==;
X-CSE-ConnectionGUID: s6uu22nzT9y3JxGB0s5cCg==
X-CSE-MsgGUID: WWAqNhuyS5S/r3cdWoKXYQ==
X-IPAS-Result: =?us-ascii?q?A0ADAADpPs1o/5L/Ja1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfwQBAQEBAQsBgkZ7WUNJjHCIaWyLZxCSJoF/DwEBA?=
 =?us-ascii?q?Q89FAQBAYUHjDkCJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgE1ARgBLSwDAQJPCyMhgwIBgjoDNQMRBrcFgiyBAYMoA?=
 =?us-ascii?q?T8CQ0/YQg1ugW2BSQGIMYUbbwGEdycbgUlEglCCLYEFgRpCAQGBJ4EGhXcEg?=
 =?us-ascii?q?yQUjACEMH2BXjSJTkiBHgNZLAFVEw0KCwcFgWMDNQwLLhVuMh2BJ4NhgSqEH?=
 =?us-ascii?q?StPhQKEayRrDwaBFYNbBoExhWpAAwsYDUgRLDcUGwY+bgeWE4MyAYENASuCL?=
 =?us-ascii?q?JMlE5I8oB1xhCaMHo89hXwaM4VbpRALmHuLNYJThAmRXmmEaYFoPIFHCwdNI?=
 =?us-ascii?q?xWDIglJGQ+OLgoLg16Bf8MSJjICOgIHCwEBAwmRaoF9AQE?=
IronPort-Data: A9a23:nGignqkI+ZpCM9PbTIBk+kXo5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIfDzvTOqneZDf8fY9ybt7g8xgOuJCHn4Q2S1Q9r3szEFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raP649CMUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+p231GONgWYubzpFsvPb8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FZZG5/stW2dcy
 a0JcxIdQTrbnL+9673uH4GAhux7RCXqFJkUtnclyXTSCuwrBMiSBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTZD/7C7pm9AusrmLnbiZYsFGcjaE2+GPUigd21dABNfKIJYfQHZgMxx7wS
 mTuwFvQGzcaKc2klAHC6CmnitDIvhPKYddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7V99BJ
 kg8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBFm8HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:7Kr976n0UZh23LEeCznCdZSmw1PpDfIn3DAbv31ZSRFFG/FwWf
 rAoB19726QtN9/YhAdcLy7VZVoIkmsl6Kdn7NwAV7KZmCP0wGVxepZg7cKrQeNJ8SHzJ8/6U
 +lGJIOb+EZyjNB/KLH3DU=
X-Talos-CUID: 9a23:M1PY8G5G7+39Tp9hO9ss7xAJB5p/dG/hnWaLAV+XIz5yFba+RgrF
X-Talos-MUID: =?us-ascii?q?9a23=3A+h/JfQ/ttwF1HN1qrQfRiYCQf/hXyr2ICF0cqsg?=
 =?us-ascii?q?9/NPfPiBPPBStvQ3iFw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,277,1751241600"; 
   d="scan'208";a="573205110"
Received: from rcdn-l-core-09.cisco.com ([173.37.255.146])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Sep 2025 11:33:32 +0000
Received: from sjc-ads-6702.cisco.com (sjc-ads-6702.cisco.com [10.30.217.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-09.cisco.com (Postfix) with ESMTPS id 518DC18000497;
	Fri, 19 Sep 2025 11:33:32 +0000 (GMT)
Received: by sjc-ads-6702.cisco.com (Postfix, from userid 1839047)
	id 00937C56040; Fri, 19 Sep 2025 04:33:31 -0700 (PDT)
From: Shubham Pushpkar <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [meta-openembedded] [scarthgap] [PATCH] cjson 1.7.18: Fix CVE-2025-57052
Date: Fri, 19 Sep 2025 04:33:31 -0700
Message-Id: <20250919113331.2357-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.217.17, sjc-ads-6702.cisco.com
X-Outbound-Node: rcdn-l-core-09.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 19 Sep 2025 11:33:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119593

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


