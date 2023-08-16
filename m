Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06824C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:43:36 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.151814.1692150206907203451
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:43:27 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="128055956"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="128055956"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:43:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id EADD7DA68D
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:43:22 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2C8C8D948B
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:43:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3E58386E22;
	Wed, 16 Aug 2023 10:43:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-dnspython: upgrade 2.4.1 -> 2.4.2
Date: Wed, 16 Aug 2023 09:42:03 +0800
Message-Id: <1692150123-5436-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27816.003
X-TMASE-Result: 10--0.578800-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrR51MNKynh49lioXfon9vxrow
	i5z3C6ZAIAGB+OGXaDYOSbjwakTAD6ienOparU0KHWRJEfGP5nmH6fKvnqC1avvrkGqTiXc5vqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgGv34qCfZeB4S6QizeDUeN7W9n
	uzdghUMpt6m6EDXzEkznjraIhVkLHlRxm3A2wKuhRFJJyf5BJeAaUQk5EZOUn6C0ePs7A07aZnf
	3oa3keF2m3H1BHcASW+lyZJ6zaydUB0jbyyx0SS+Lis+HNJ/75sn33gEj0iKd17LcDSlCqiPKSs
	4+VBz7ZJDc3peXDH3Bs4L1189Qkj8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:43:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104387

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-  Async queries could wait forever instead of respecting the timeout if the
   timeout was 0 and a packet was lost. The timeout is now respected.
-  Restore HTTP/2 support which was accidentally broken during the https
   refactoring done as part of 2.4.0.
-  When an inception time and lifetime are specified, the signer now sets
   the expiration to the inception time plus lifetime, instead of the current
   time plus the lifetime.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-dnspython_2.4.1.bb => python3-dnspython_2.4.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-dnspython_2.4.1.bb => python3-dnspython_2.4.2.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-dnspython_2.4.1.bb b/meta-python/recipes-devtools/python/python3-dnspython_2.4.2.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-dnspython_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-dnspython_2.4.2.bb
index 6233527dc0..1ebd2aa943 100644
--- a/meta-python/recipes-devtools/python/python3-dnspython_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-dnspython_2.4.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "http://www.dnspython.org/"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5af50906b5929837f667dfe31052bd34"
 
-SRC_URI[sha256sum] = "c33971c79af5be968bb897e95c2448e11a645ee84d93b265ce0b7aabe5dfdca8"
+SRC_URI[sha256sum] = "8dcfae8c7460a2f84b4072e26f1c9f4101ca20c071649cb7c34e8b6a93d58984"
 
 inherit pypi python_poetry_core ptest
 
-- 
2.34.1


