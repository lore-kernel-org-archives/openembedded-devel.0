Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A79DC001E0
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.7463.1687850057592469226
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110615718"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110615718"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id C672CD29E1
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:16 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 01934D9AA0
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:16 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id F1CF188D20;
	Tue, 27 Jun 2023 16:14:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-can: upgrade 4.2.1 -> 4.2.2
Date: Tue, 27 Jun 2023 15:12:08 +0800
Message-Id: <1687849939-19941-9-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10-2.582800-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/ySrLqyE6Ur/jjIW07F8rFN81Y73PdzvXZDIs
	HMS03I12VShIeIGDIu9t1av1ivNTb+1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQD5+
	EY120A3oWm/gAtjCd7AYUFsN5WfiF8plQwfMmRJSeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNR7Z/lF1u3rvytOTuYLZRNvU9sw3Q8SFch/ofoSvRrGtNHqgJBGORszaK/wao0k0OecQ0
	j9puPeOwyh5ZIHH1F3LZytQ10C2QoJXtKB2OUbbU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103602

From: Wang Mingyu <wangmy@fujitsu.com>

bugfixes:
=========
 Fix socketcan KeyError (#1598, #1599).
 Fix IXXAT not properly shutdown message (#1606).
 Fix Mf4Reader and TRCReader incompatibility with extra CLI args (#1610).
 Fix decoding error in Kvaser constructor for non-ASCII product name (#1613).

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-can_4.2.1.bb => python3-can_4.2.2.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-can_4.2.1.bb => python3-can_4.2.2.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-can_4.2.1.bb b/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-can_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-can_4.2.2.bb
index 5e3d54d6f3..7ecbf12073 100644
--- a/meta-python/recipes-devtools/python/python3-can_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-can_4.2.2.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-3.0-only"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI[sha256sum] = "f1ace82545cb4c7edf92a5aa6024bbb8ad23331ee5b0a1f441e782bf680a67ac"
+SRC_URI[sha256sum] = "6ad50f4613289f3c4d276b6d2ac8901d776dcb929994cce93f55a69e858c595f"
 
 PYPI_PACKAGE="python-can"
 
-- 
2.34.1


