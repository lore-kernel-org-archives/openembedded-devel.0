Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C6DC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:10:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.2541.1700122212270693026
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:10:12 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="118689690"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="118689690"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:10:10 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C7F1DC656
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:10:08 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 68827BF4CD
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:10:07 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 49F50867C2;
	Thu, 16 Nov 2023 17:10:06 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-argcomplete: upgrade 3.1.4 -> 3.1.6
Date: Thu, 16 Nov 2023 16:08:50 +0800
Message-Id: <1700122130-21834-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28000.003
X-TMASE-Result: 10-0.613700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrBpEC0DNwn/qKS8s/FMqmOBti
	hBeM13D+4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbedlNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNWTEssEca2jdKnffX7VNuE+1iISLReMfUPawTQv9NgLvaFer384Mx5X5RfJzFMxc768SQ
	eL4lhVn8llwUiKZdXabpWD/+Czzs/zs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:10:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106784

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Respect user choice in activate-global-python-argcomplete
Escape colon in zsh completions. Fixes #456

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-argcomplete_3.1.4.bb => python3-argcomplete_3.1.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-argcomplete_3.1.4.bb => python3-argcomplete_3.1.6.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.4.bb b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.6.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-argcomplete_3.1.4.bb
rename to meta-python/recipes-devtools/python/python3-argcomplete_3.1.6.bb
index 0b69efaff..28dd9f90c 100644
--- a/meta-python/recipes-devtools/python/python3-argcomplete_3.1.4.bb
+++ b/meta-python/recipes-devtools/python/python3-argcomplete_3.1.6.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/kislyuk/argcomplete"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.rst;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "72558ba729e4c468572609817226fb0a6e7e9a0a7d477b882be168c0b4a62b94"
+SRC_URI[sha256sum] = "3b1f07d133332547a53c79437527c00be48cca3807b1d4ca5cab1b26313386a6"
 
 PYPI_PACKAGE = "argcomplete"
 
-- 
2.34.1


