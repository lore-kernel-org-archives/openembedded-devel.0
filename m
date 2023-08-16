Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68CEC001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:41:45 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web11.151775.1692150096600303103
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:41:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107669319"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="107669319"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:41:34 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id C2D26C3F8B
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:41:31 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 017BBD5008
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:41:31 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F5B421F785;
	Wed, 16 Aug 2023 10:41:30 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitarray: upgrade 2.8.0 -> 2.8.1
Date: Wed, 16 Aug 2023 09:41:02 +0800
Message-Id: <1692150062-5326-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10-4.466700-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrBPY4SegK3jxjp5tNjJIek76p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74D4qCLIu0mtIJjmdWmKHGLD4Yy
	coNpBJWB6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5uxE
	sp9XTmhp/SedsvDEFu/8bkOjUK1MZfUE0mqEe73O8PCkFoefq6Jt1cwiDtgsa8RoA3VcXs7j5OE
	gAPPvR2xziq7vFbDSaCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:41:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104384

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
 * use reconstructor function for pickling, see #207
 * simplify implementation of '.reverse()'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitarray_2.8.0.bb => python3-bitarray_2.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitarray_2.8.0.bb => python3-bitarray_2.8.1.bb} (77%)

diff --git a/meta-python/recipes-devtools/python/python3-bitarray_2.8.0.bb b/meta-python/recipes-devtools/python/python3-bitarray_2.8.1.bb
similarity index 77%
rename from meta-python/recipes-devtools/python/python3-bitarray_2.8.0.bb
rename to meta-python/recipes-devtools/python/python3-bitarray_2.8.1.bb
index 19d9f9ef9b..cb94df5644 100644
--- a/meta-python/recipes-devtools/python/python3-bitarray_2.8.0.bb
+++ b/meta-python/recipes-devtools/python/python3-bitarray_2.8.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ilanschnell/bitarray"
 LICENSE = "PSF-2.0"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=8;endline=8;md5=2ad702cdcd49e8d2ac01d7e7d0810d2d"
 
-SRC_URI[sha256sum] = "cd69a926a3363e25e94a64408303283c59085be96d71524bdbe6bfc8da2e34e0"
+SRC_URI[sha256sum] = "e68ceef35a88625d16169550768fcc8d3894913e363c24ecbf6b8c07eb02c8f3"
 
 inherit setuptools3 pypi
 
-- 
2.34.1


