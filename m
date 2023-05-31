Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D10A8C7EE37
	for <webhook@archiver.kernel.org>; Wed, 31 May 2023 07:40:50 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.8609.1685518847627922738
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 31 May 2023 00:40:48 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="118923577"
X-IronPort-AV: E=Sophos;i="6.00,205,1681138800"; 
   d="scan'208";a="118923577"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 16:40:45 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5802BCD7E8
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:43 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8477DD4BEC
	for <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 16:40:42 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0A2C468957;
	Wed, 31 May 2023 16:40:42 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-imageio: upgrade 2.29.0 -> 2.30.0
Date: Wed, 31 May 2023 15:40:12 +0800
Message-Id: <1685518820-20028-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
References: <1685518820-20028-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27662.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27662.006
X-TMASE-Result: 10--1.052400-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrKQNhMboqZlo+yMbBXXWKeW8q
	nFk+BWUX6rKKh8mdd4QdUetUKvcxGu1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqth9Z6KDRhzU+xyRc3qTo8ZBnQdo1zLM8GtyHDj8aj9zd/sdQv72QYski6Z
	dSNNTBuNXveKrdl5OEZHwebzBjsZh80Zy1klMaOHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 31 May 2023 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102918

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
    SPE plugin: Support new SDT-control metadata (#989) (c93536c)
    Remove standard images from built package (#988) (6288f19)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.29.0.bb => python3-imageio_2.30.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.29.0.bb => python3-imageio_2.30.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.29.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.30.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.29.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.30.0.bb
index 3ca9e3c1e..6bcba2ca7 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.29.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.30.0.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "5aa207ab61aca233a7a312951ac603d618b78418eac749e3dc5035010531e25b"
+SRC_URI[sha256sum] = "7fc6ad5b5677cb1e58077875a72512aa8c392b6d40885eca0a6ab250efb4b8f4"
 
 inherit pypi setuptools3
 
-- 
2.34.1


