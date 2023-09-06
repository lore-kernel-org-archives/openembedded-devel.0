Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92C56EE4993
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 02:05:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.2576.1693965900214153612
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Sep 2023 19:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="118681197"
X-IronPort-AV: E=Sophos;i="6.02,230,1688396400"; 
   d="scan'208";a="118681197"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2023 11:04:56 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 90F31E445A
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:04:54 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D5DC6D5EA3
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Sep 2023 11:04:53 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0BB85814DE;
	Wed,  6 Sep 2023 11:04:52 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade 68.1.0.0 -> 68.1.0.1
Date: Wed,  6 Sep 2023 10:04:45 +0800
Message-Id: <1693965885-14992-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27858.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27858.004
X-TMASE-Result: 10-2.989400-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqz85LGH6Xi15L6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AJlr1xKkE5uYMNZlevXKUzBqd
	FRjHdIbixfbhqGxLk+4Ay6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzb7KA5Kkvq9Fiwv
	yrG6nUQC26oEPBCtzZoz1zsCy91CK9ZHDOuSRIJ+Stm2iOpY6A9xDgq+IjAUvbl9lbi3sV0kjhI
	D9X5fk3iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Sep 2023 02:05:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104762

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 setuptools: add various missing objects and annotations 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uptools_68.1.0.0.bb => python3-types-setuptools_68.1.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_68.1.0.0.bb => python3-types-setuptools_68.1.0.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.0.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.1.bb
index f5f23facaa..9d8022bf1c 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "2bc9b0c0818f77bdcec619970e452b320a423bb3ac074f5f8bc9300ac281c4ae"
+SRC_URI[sha256sum] = "271ed8da44885cd9a701c86e48cc6d3cc988052260e72b3ce26c26b3028f86ed"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


