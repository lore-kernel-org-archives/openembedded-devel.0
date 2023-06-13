Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 850DBC88CBD
	for <webhook@archiver.kernel.org>; Tue, 13 Jun 2023 01:41:03 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.3828.1686620455361391674
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Jun 2023 18:40:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10739"; a="121527765"
X-IronPort-AV: E=Sophos;i="6.00,238,1681138800"; 
   d="scan'208";a="121527765"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 10:40:57 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 03DCDC53CA
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:54 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D823BF4A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 10:40:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id AEBFF20074732;
	Tue, 13 Jun 2023 10:40:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-hexbytes: upgrade 0.3.0 -> 0.3.1
Date: Tue, 13 Jun 2023 09:40:13 +0800
Message-Id: <1686620422-29962-24-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
References: <1686620422-29962-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27688.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27688.004
X-TMASE-Result: 10-1.001800-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIOYgThO+DmX9z4cH5hW96YOwpfLMeBwRtV4BnlVId1nZsoi2XrUn/J8m+
	hzBStanvIM9mETCO70ydET58jp62SRyP5X9VEcjS/mXAuG9vVdNxMlyTXvAmCTwAN5MtYOQMhV0
	9e7C1PIQgJjxMx0Sg3Z8x0g8iGRm+L2RJ/6cYcpgN8OKhpTUTqS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jun 2023 01:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103241

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-hexbytes_0.3.0.bb => python3-hexbytes_0.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-hexbytes_0.3.0.bb => python3-hexbytes_0.3.1.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-hexbytes_0.3.0.bb b/meta-python/recipes-devtools/python/python3-hexbytes_0.3.1.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-hexbytes_0.3.0.bb
rename to meta-python/recipes-devtools/python/python3-hexbytes_0.3.1.bb
index 8402ddecd..19b5813ad 100644
--- a/meta-python/recipes-devtools/python/python3-hexbytes_0.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-hexbytes_0.3.1.bb
@@ -4,6 +4,6 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=287820ad3553117aa2f92bf84c219324"
 
-SRC_URI[sha256sum] = "afeebfb800f5f15a3ca5bab52e49eabcb4b6dac06ec8ff01a94fdb890c6c0712"
+SRC_URI[sha256sum] = "a3fe35c6831ee8fafd048c4c086b986075fc14fd46258fa24ecb8d65745f9a9d"
 
 inherit pypi setuptools3
-- 
2.34.1


