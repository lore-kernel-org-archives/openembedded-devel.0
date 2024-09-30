Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 424A4CF6491
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:44:09 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.49311.1727682245224444877
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:44:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mYnFaByZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682245; x=1759218245;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=WjMFnRAFfLypC4yEt+xOIOgvBaUcdxok28wZYSkdErM=;
  b=mYnFaByZpQOnnyZMWl3pIoG/5iCGNBREBafQYCj2sxSOuI2VepVwVBvM
   ch0ir9jVRKBULM+KjMBZb1V7sJAbSOncLzwg6y8HruVPY2o0NTPO1gNQK
   1KISv1KEBCQIKMzNV7dq7ETaUU5/DIQv34ROVOYs1qwGWNu+kX58H0nAC
   IzzbJfnMtAStcAdPSff5e9ZxO2Q1FB/w/64bVdNmwyv2a6dLTPmT+jufv
   GjNj3TvTJBGfoEqwUDwRc0EpFwckpxyarSVfN1YiS8m1HcwhsKhh7+MWH
   ZyIP4h9cj8JxL2j9BJ5sBvLDaoFfWX2iREtl/NLljYdH0OzF7uMXOna/c
   g==;
X-CSE-ConnectionGUID: 1NpEJQj1RCOylsGfMMLhJA==
X-CSE-MsgGUID: rnUAmUgkRxKT/3ZMmtRGZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="154209961"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="154209961"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:44:03 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 3F4FED2AAF
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 77614B359D
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 08A216B8C2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:44:00 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AE8891A000A;
	Mon, 30 Sep 2024 15:43:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/40] python3-tzdata: upgrade 2024.1 -> 2024.2
Date: Mon, 30 Sep 2024 15:42:58 +0800
Message-Id: <1727682185-12664-33-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10--3.526300-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mr+KgiyLtJrSBoOe42HKVRDr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74BuTKBinxl/umAN6i+va16uaRF
	wDs8G7THi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFFJIYm3hnKu5hJYLhmChISIV0m
	wftNs8ItJtncxK7AP4YGkswq7P9Ltk9mb7d8UtoHIkPE1yCzpL9Owh15q2J0rKey+f63j7Tex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:44:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112593

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://github.com/python/tzdata/releases/tag/2024.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-tzdata_2024.1.bb => python3-tzdata_2024.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tzdata_2024.1.bb => python3-tzdata_2024.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb b/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
rename to meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
index d81ded430..614d813e8 100644
--- a/meta-python/recipes-devtools/python/python3-tzdata_2024.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tzdata_2024.2.bb
@@ -4,7 +4,7 @@ LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fca9fd5c15a28eb874ba38577a585d48 \
                     file://licenses/LICENSE_APACHE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "2674120f8d891909751c38abcdfd386ac0a5a1127954fbc332af6b5ceae07efd"
+SRC_URI[sha256sum] = "7d85cc416e9382e69095b7bdf4afd9e3880418a2413feec7069d533d6b4e31cc"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


