Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3CDCC25B7D
	for <webhook@archiver.kernel.org>; Tue, 14 May 2024 09:10:40 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.10784.1715677829831592765
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 May 2024 02:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=I16icaci;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1715677837; x=1747213837;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=UPV5VrafVEOTd//rmHJn3/M6Gvuvz7l7b8ngsG/h80Y=;
  b=I16icaciMQlWE1VHzr2u8Dq0TPEoK6AzvBaGDLAVyZG/8m0qK+G+0k0b
   hJBn6sVL+sHQZo2IYA7AHyuE87wpAh7xOTods3MlNecc6ubc8UYeNdyKk
   A4/7Wq7oydfJocnzlp/oCNdceYfkqTqCK0kejHbbBWLMNpa7uXtVNNmJu
   LkWhXprsJqo/YtCBBuK8u7n7fMAzGy9qbzK4fuEoVcJ4HQHww86dgRJBP
   sHi/TTtTA4ESRCIPPjvQ9nUGuE/mWwbpHSsA/8vhbWWjhtWw/dQzBbzZe
   EKchnZ3QwHJlDr696Vd0U76Npfxy9jhaDKrWkGB6jh0evj/iDclEC4Msq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="145839683"
X-IronPort-AV: E=Sophos;i="6.08,159,1712588400"; 
   d="scan'208";a="145839683"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2024 18:10:35 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id D9DCADB614
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:33 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0FC30D9469
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:33 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 9FF3C6BB7B
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 18:10:32 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D7391A000C;
	Tue, 14 May 2024 17:10:32 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/44] python3-google-api-core: upgrade 2.18.0 -> 2.19.0
Date: Tue, 14 May 2024 17:09:56 +0800
Message-Id: <1715677817-2223-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
References: <1715677817-2223-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28384.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28384.006
X-TMASE-Result: 10--1.219600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrF4r8H5YrEqxkmInFtzPDn9CN
	AH7rhmqt4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5W/y
	bwwdWAIt4ihOVnCVdxz9YzU0/n8pS2mII8zI+GF9nI9/JgKqhtW8LBKq5yNGeLXhb7juVySs0tv
	hZwzbUSRbQ3zNPcP2OCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 May 2024 09:10:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110368

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add google.api_core.version_header

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...gle-api-core_2.18.0.bb => python3-google-api-core_2.19.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-api-core_2.18.0.bb => python3-google-api-core_2.19.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-google-api-core_2.18.0.bb b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-google-api-core_2.18.0.bb
rename to meta-python/recipes-devtools/python/python3-google-api-core_2.19.0.bb
index b4cbafa85..d177fcde5 100644
--- a/meta-python/recipes-devtools/python/python3-google-api-core_2.18.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-api-core_2.19.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "62d97417bfc674d6cef251e5c4d639a9655e00c45528c4364fbfebb478ce72a9"
+SRC_URI[sha256sum] = "cf1b7c2694047886d2af1128a03ae99e391108a08804f87cfd35970e49c9cd10"
 
 RDEPENDS:${PN} += "\
     python3-asyncio \
-- 
2.34.1


