Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC1DEC4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 08:54:16 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.17803.1702544056054056738
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 00:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="142800564"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="142800564"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 17:54:14 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7AB0ED64BC
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:54:11 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A2231D6229
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 17:54:10 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 806E286A76;
	Thu, 14 Dec 2023 17:54:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-google-api-python-client: upgrade 2.108.0 -> 2.111.0
Date: Thu, 14 Dec 2023 16:54:01 +0800
Message-Id: <1702544041-27880-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10-0.228100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr9pLnYtQ99xKTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIOmHqf6ZGvCR1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0HTT
	+SR4FPAFTlDgv1FJXp8zjaKKsEPl2ExizqANKeJP8xZ17EbUHi2fw+IWVPnLTELk7RCWNd7W532
	Vccy+R1OUvTSECRDmzYTQA9ndwCDPIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 08:54:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107434

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
https://github.com/googleapis/google-api-python-client/releases/tag/v2.111.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.108.0.bb => python3-google-api-python-client_2.111.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.108.0.bb => python3-google-api-python-client_2.111.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.108.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.111.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.108.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.111.0.bb
index f8ccc9a68..89613516e 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.108.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.111.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "6396efca83185fb205c0abdbc1c2ee57b40475578c6af37f6d0e30a639aade99"
+SRC_URI[sha256sum] = "3a45a53c031478d1c82c7162dd25c9a965247bca6bd438af0838a9d9b8219405"
 
 inherit pypi setuptools3
 
-- 
2.34.1


