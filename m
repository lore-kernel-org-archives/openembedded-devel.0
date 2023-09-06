Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 901D5CCFA18
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:01:35 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2445.1693965692222074821
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:01:32 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="110267237"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="110267237"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:01:30 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 15A3DDB3D2
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:01:28 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4F8CBD3F2A
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:01:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 71DEB2FC03EE;
	Wed,  6 Sep 2023 11:01:26 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-langtable: upgrade 0.0.62 -> 0.0.63
Date: Wed,  6 Sep 2023 10:01:18 +0800
Message-Id: <1693965678-14663-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.003
X-TMASE-Result: 10-4.846400-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqw3UrsA6U4tpDwC
	aaIhqPxC4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2RV17CFfZYAB1vZ
	7s3YIVDJ6eUBjjG/BIC5rYfHE0OO95UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2i5u
	/VvsFaHapoJ0YyK9mTjyF3OMMYbQvrZHKZqDk6kCNrfBwWT7LGzsLaK6tzjTnsg4jtNRYSxeCqf
	0nQ/KsqSFzLJeQziFDumZsKmS0cEfIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:01:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104753

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Add more translations from CLDR
* Get translation changes from CLDR
* Japanese: prefer anthy over kkc
* Use skipTerritory also in list_keyboards(), list_consolefonts(), and list_timezones()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.62.bb => python3-langtable_0.0.63.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.62.bb => python3-langtable_0.0.63.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.62.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.63.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.62.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.63.bb
index df6d14ece5..ca68a6cc76 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.62.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.63.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "df8d5daedaa5c0d4e72dace925733376ba705d9330f63934f122eacf4746f360"
+SRC_URI[sha256sum] = "ff2b5a1db27900cb83e06bcbd14cb0bbd5caaf304c913308246608d8e93d684f"
 
 inherit pypi setuptools3 python3native
 
-- 
2.34.1


