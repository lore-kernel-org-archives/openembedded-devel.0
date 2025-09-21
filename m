Return-Path: <spushpka@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C112CAC59A
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 15:11:42 +0000 (UTC)
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
 by mx.groups.io with SMTP id smtpd.web10.30536.1758467498002530015
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 21 Sep 2025 08:11:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=b70IB/Do;
 spf=pass (domain: cisco.com, ip: 173.37.142.92, mailfrom: spushpka@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=2627; q=dns/txt;
  s=iport01; t=1758467498; x=1759677098;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ILtbPkn9uUcUF8yecUoZ7uTOT31ATiSEhufvWXHjw78=;
  b=b70IB/DoyEAnDEwSThhAEU3zV9bMfzCaZC4jipKIPq5VIJkX/YRzwwJU
   QXe2gDBBxyYBfX6jxcYSYbF2EOGMk/9Y+2DLp8Nidpy/Htpl4e2HF7vGW
   SN3zipMjb9TRCh9KauFDZNV1uXGh9LI4hzE+mIv0MimsYvX1YtgUZ5FOk
   6nS0/+SOY6qnnHYKfwWgzQZKBX9bFrTOaLVoAN7eTiYvOt54ULVzrbGzZ
   C/W/zpgEYMLyTSq6sMXDM04tkCiqbtNT+EmKBK6T0mARX2gO3BuMySkoA
   0UMyJoEzH/hYqWsNW+SA73bZDTNXTp1J6PX+npM8WiLhb1Oxw6DZuDkdh
   Q==;
X-CSE-ConnectionGUID: NSkIpj2vRhm4nEhV0YbHSA==
X-CSE-MsgGUID: ioF6qTqxR+eqjNx4u+Ji7g==
X-IPAS-Result: =?us-ascii?q?A0ADAACFFNBo/4oQJK1aGQEBAQEBAQEBAQEBAQEBAQEBA?=
 =?us-ascii?q?RIBAQEBAQEBAQEBAQGBfwQBAQEBAQsBgkZ7WUNJjHCIaWyLZxCSJoF/DwEBA?=
 =?us-ascii?q?Q89FAQBAYUHjD8CJjQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECA?=
 =?us-ascii?q?QcFgQ4Thk8NhloBAgE1ARgBLSwDAQJPCyMhgwIBgjoDNQMRBrVPgiyBAYMoA?=
 =?us-ascii?q?T8CQ0/YQg1ugW2BSQGIMYUbbwGEdycbgUlEglCCLYEFgRpCAQGBJ4EGhXcEg?=
 =?us-ascii?q?ziLf4QwfYFeIBGJYkiBHgNZLAFVEw0KCwcFgWMDNQwLLhVuMh2BJ4NhgSqEH?=
 =?us-ascii?q?itPhQKEayRrDwaBFYNbBoExhX1AAwsYDUgRLDcUGwY+bgeWJIMxAYENASuCL?=
 =?us-ascii?q?JMlE5I8oB1xhCaMHo89hXwaM4VbpRALmHuLNYJThAmRXmmEaYFoPIFHCwdNI?=
 =?us-ascii?q?xWDIglJGQ+OLgoLg16Bf8VEJjICOgIHCwEBAwmRaoF9AQE?=
IronPort-Data: A9a23:WTcJHalddnDffgCJQaw+uhro5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJMWWrUMveNZDf1eosiO9u380tXvp6Dn4c1GQRr/C4zE1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raP649CMUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+p231GONgWYubzpFsfvb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fasj+cdvAztQz
 /wddDYgbi7btuiW+5vuH4GAhux7RCXqFIobvnclyXTSCuwrBMiaBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkYfUrsUIMpWcOOAnWHiaD1Aq1u9rqss6G+Vxwt0uFToGIeIKozTGJsKxi50o
 ErH+EqnGy0DJObcxCOH1GLwm6ztnHz0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hguyVsxSL
 2QQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUz7AWLj66R6AGDCy1cF3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:rQyDX67jA/v6xMbp/gPXwMPXdLJyesId70hD6qm+c3Nom6uj5q
 WTdZsgtCMc5Ax9ZJhCo6HjBED/exPhHPdOiOF7V4tKNzOJhILHFu1fBPPZsl7d8+mUzJ876U
 +mGJIObOHNMQ==
X-Talos-CUID: 9a23:LgxDa2xmvjeyyjd1/L3lBgUyIcMEan+H0k3QJhO+JGZXEIyfaWS5rfY=
X-Talos-MUID: 9a23:D9u2yAW2KJWV+O3q/D7rqm97CN542eejEUIrgckb+OuFaiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.18,283,1751241600"; 
   d="scan'208";a="558815670"
Received: from alln-l-core-01.cisco.com ([173.36.16.138])
  by alln-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 21 Sep 2025 15:11:36 +0000
Received: from sjc-ads-6702.cisco.com (sjc-ads-6702.cisco.com [10.30.217.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-01.cisco.com (Postfix) with ESMTPS id BFA72180001A7;
	Sun, 21 Sep 2025 15:11:36 +0000 (GMT)
Received: by sjc-ads-6702.cisco.com (Postfix, from userid 1839047)
	id 59DE4C57B1B; Sun, 21 Sep 2025 08:11:36 -0700 (PDT)
From: Shubham Pushpkar <spushpka@cisco.com>
To: openembedded-devel@lists.openembedded.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: [meta-openembedded] [kirkstone] [PATCH] cjson 1.7.18: Fix CVE-2025-57052
Date: Sun, 21 Sep 2025 08:11:35 -0700
Message-Id: <20250921151135.55865-1-spushpka@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.217.17, sjc-ads-6702.cisco.com
X-Outbound-Node: alln-l-core-01.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 15:11:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119629

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


