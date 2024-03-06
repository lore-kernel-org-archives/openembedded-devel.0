Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6F8C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 08:44:27 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.7756.1709714663673700947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 00:44:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=uImo0Gri;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1709714664; x=1741250664;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=U9DHuEkJvvsTnQl108pP7MPaEhN2qv5DXo/25ZtkrLE=;
  b=uImo0GriTqLlUaS9/qIkY3NWRJRa4YcnZ5vMg0EyS07cO6sNG/YQUmYk
   YAr57l70IFXK4chszu2Y04AL0fMNkyYCAnV8Naeez+0EE2MtqzxZRVLK5
   zV/qwp/7CtnQEcp1AL7XztbKWKqKfWB2GGmxuvWr/FTWC+bJdpsPS6POU
   iN31AO2RcgyFJHvrZ0tlZACS+V2FDieHjtWdqkiLY4aCvq0ig62WaKFkf
   89tuDJ8m92wWM0CrL4a6wBgK5kTW4M3pBTYlkB2kOozPobBCX/AeGv4yC
   4kuj5OV4Wi0ntON4Kj7Fc7NoZIkogwDOXFxg4WCXT230QDpyiGpkwtApq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="130775023"
X-IronPort-AV: E=Sophos;i="6.06,207,1705330800"; 
   d="scan'208";a="130775023"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 17:44:22 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 41048D4800
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7789AD5D0E
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 1640D41189
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Mar 2024 17:44:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B3C9A1A006A;
	Wed,  6 Mar 2024 16:44:17 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 18/26] python3-google-api-python-client: upgrade 2.118.0 -> 2.120.0
Date: Wed,  6 Mar 2024 16:43:20 +0800
Message-Id: <1709714608-19296-18-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
References: <1709714608-19296-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28234.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28234.006
X-TMASE-Result: 10--1.526300-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr+KgiyLtJrSCTxayZGvX2Dr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w4Fbm
	TAfV7mCPXm53i46GfwTZjEZ9K4kzKMDGM4O/FdYVoSedi1ABoLM8CLPJFCVDRDb9S/zxGxkpesH
	D91sB7jcV8qdAiU+1aCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:44:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109158

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/googleapis/google-api-python-client/releases/tag/v2.120.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...t_2.118.0.bb => python3-google-api-python-client_2.120.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-python-client_2.118.0.bb => python3-google-api-python-client_2.120.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.118.0.bb b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.120.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-python-client_2.118.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-python-client_2.120.0.bb
index 6a27006b7..a03522531 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-python-client_2.118.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-python-client_2.120.0.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/googleapis/google-api-python-client"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "ebf4927a3f5184096647be8f705d090e7f06d48ad82b0fa431a2fe80c2cbe182"
+SRC_URI[sha256sum] = "a0c8769cad9576768bcb3191cb1f550f6ab3290cba042badb0fb17bba03f70cc"
 
 inherit pypi setuptools3
 
-- 
2.34.1


