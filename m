Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81320C3065A
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:22 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.13838.1719816255859812887
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QKnMKAPw;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816260; x=1751352260;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5jM84zSTduus7iPGAOcBDmC2kjMbshRsM/133tAEORM=;
  b=QKnMKAPwfhD/V5zpDlLcyxuSXX0jPWoSZNKP3rAUxMmEumU9YfPjyDC3
   6Wix64LOs5JMGm6fml7zyjB1qI2Hlr63dSD/LjIZHCJi1JlQWulY8Rm+o
   83u1q60cUObPMafMoNiS2JPbdmcGlnUaoFmaX8TFtSVZXerGjRTleDnHP
   qMpGXbzZOQNvpRZXQmZczMx3qf12qvrKML15WVozk56wm4IfL6MT9udHg
   SAtcd/Tc3pJW0wMy02ZLXlwZGF6iNZtIvcMrKY4fEvZCW+F30EzqyPkpi
   QjSwwQM9DqCd6BNNbqfHfBgHbS6vR37irthpQEcczp4yrTv63sTwDq+H2
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144351943"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144351943"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:19 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A06E1DB3CB
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:17 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D1F95CFA5B
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B3DF20071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:16 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1BA6E1A000C;
	Mon,  1 Jul 2024 14:44:16 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/25] python3-google-api-core: upgrade 2.19.0 -> 2.19.1
Date: Mon,  1 Jul 2024 14:43:50 +0800
Message-Id: <1719816242-11839-13-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10-0.676900-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mregIHHX2L4Yxwe0vn1Z2SL8+1
	6WmVK8+X4K9FmervsqX+kfjo+nx5BG0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDLYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSz2zG3sP/ei569ne
	ajZ5DMO6ROTmus5zzoWjRyxLtnuVohnEq8f+DRae39RD+b3kDxs5ES9EUYokOPUZ3pFJ+gdKZWz
	moXhXkCiB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111178

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Add support for protobuf 5.x
- Ignore unknown fields in rest streaming.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.19.0.bb => python3-google-api-core_2.19.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.19.0.bb => python3-google-api-core_2.19.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.19.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
index d177fcde5..f21b41aab 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "cf1b7c2694047886d2af1128a03ae99e391108a08804f87cfd35970e49c9cd10"
+SRC_URI[sha256sum] = "f4695f1e3650b316a795108a76a1c416e6afb036199d1c1f1f110916df479ffd"
 
 RDEPENDS:${PN} += "\
     python3-asyncio \
-- 
2.34.1


