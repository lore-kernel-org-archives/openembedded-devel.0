Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EC7C47DDB
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:44:24 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.1431.1705974259685581404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:44:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="135330336"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="135330336"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:44:10 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1CE4ED5029
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:44:08 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E5EDCFBB2
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:44:07 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id F29EC2660C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:44:06 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8D1581A006A;
	Tue, 23 Jan 2024 09:44:06 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-abi: upgrade 4.2.1 -> 5.0.0
Date: Tue, 23 Jan 2024 09:43:52 +0800
Message-Id: <1705974232-25738-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--5.960100-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7SwZuykSn6+/IyG
	8V1UOe4OhDLYiwcLbP19t+5pVoYOEViS8MnhiXFpqoeab9Xgz8+7J9Pq87AdKejMOEZ5AL0S9Uc
	IJOAWB38V1SzqywJQYg3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXR/IzlV+CMbbW9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeZVXUb4KTaXv6C0ePs7A07Q9dk
	+6tnSFLtBZkY8n1WOaBOJ4VVluf+guveoXxbqGH+JwI/TOKpWU=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:44:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108408

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Drop python 3.7 support
-Merge updates from the project template, notably, use pre-commit for linting
 and change the name of the master branch to main
-Corrected format of booleans in pyproject.toml and added a test for the
 presence of the eth_abi.__version__ attribute
-Add build.os section to readthedocs build settings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-abi_4.2.1.bb => python3-eth-abi_5.0.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-abi_4.2.1.bb => python3-eth-abi_5.0.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_4.2.1.bb b/meta-python/recipes-devtools/python/python3-eth-abi_5.0.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eth-abi_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-abi_5.0.0.bb
index c01860acd..50b1340cb 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_5.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731f4de9c79bfeba6d8d55f83d0d2423"
 
-SRC_URI[sha256sum] = "60d88788d53725794cdb07c0f0bb0df2a31a6e1ad19644313fe6117ac24eeeb0"
+SRC_URI[sha256sum] = "89c4454d794d9ed92ad5cb2794698c5cee6b7b3ca6009187d0e282adc7f9b6dc"
 
 PYPI_PACKAGE = "eth_abi"
 
-- 
2.34.1


