Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2DBCC54793
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.9261.1708419296047521362
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pcb1oQXS;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419296; x=1739955296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=S9cmMoYqxFb/Fw5dg2F/goI4IvcrIBU6BB6U1fRSltI=;
  b=pcb1oQXSL7pk/9vhk4NALlCS9iETeHh2G9y9+jXUm9dj4KK9OTcDBRCM
   B/29V5oL2kDl1Q0tjclU5To0s9dQGKGeT3icYrPKD5tMtyaQCvtOyPX5A
   Rdo80we4UPm36rnwS3RTiIpWHGi++WifTd7bGbmTAqZE4yh9oHeGxGCMO
   vQ9iPEoqZkf93gxSefYIori6US6mtOb06J/YfdNBttVVPBK+gKOag8Qsw
   0UysDyD++Hf1A/ExokZCp0589cpxz40qOsVawgL7BGKmw8lYL51NH2POp
   crvBuL5SkS3QUE5eOqUIxfW4WB3CIb6wdch+4HUiBJQ0WD0EWrVILLn6F
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="128668198"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="128668198"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:55 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6309D2E8B80
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:53 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A3D16F314D
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:52 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 27D7C200A7683
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:52 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id C80851A006B;
	Tue, 20 Feb 2024 16:54:51 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 07/26] python3-google-api-python-client: upgrade 2.116.0 -> 2.118.0
Date: Tue, 20 Feb 2024 16:54:22 +0800
Message-Id: <1708419281-26047-7-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5xn1
	8PawHBPzwr8QYbAmpjWMME96voF+BPGe0MxBL+q1oSedi1ABoLM8CLPJFCVDRDb9S/zxGxkpesH
	D91sB7jcV8qdAiU+1aCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108926

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.118.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.116.0.bb => python3-google-api-python-client_2.118.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.116.0.bb => python3-google-api-python-client_2.118.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.118.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.118.0.bb
index e4de12bae..90c19af3f 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.116.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.118.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "f9f32361e16114d62929638fe07f77be30216b079ad316dc2ced859d9f72e5ad"
+SRC_URI[sha256sum] = "ebf4927a3f5184096647be8f705d090e7f06d48ad82b0fa431a2fe80c2cbe182"
 
 inherit pypi setuptools3
 
-- 
2.34.1


