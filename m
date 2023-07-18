Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F965EB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 04:26:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.685.1689654371853954200
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 17 Jul 2023 21:26:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10774"; a="103641350"
X-IronPort-AV: E=Sophos;i="6.01,213,1684767600"; 
   d="scan'208";a="103641350"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 13:26:13 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id C9E9ED3EBA
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:10 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1D073CF7FD
	for <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 13:26:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 96816200854E2;
	Tue, 18 Jul 2023 13:26:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-charset-normalizer: upgrade 3.1.0 -> 3.2.0
Date: Tue, 18 Jul 2023 12:25:25 +0800
Message-Id: <1689654348-30702-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
References: <1689654348-30702-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27758.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27758.004
X-TMASE-Result: 10-0.305400-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mrBPY4SegK3jzU0g3VcfJ47k/m
	RGqrA8qmofT1xcfXENTJsyErXnmiHfwbzDqSxzjjjoyKzEmtrEeZmLDnd2pI38Nn70cjmctsESh
	6vmw7oCIqJVjgDINn3EmIrfKYHbBB7VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5DubQ
	rtuRQMog1RxwBNHJ3UBhQWw3lZ+IU7BOj1lchJLN0KiTeJteVBfS0Ip2eEHnz3IzXlXlpamPoLR
	4+zsDTtnlVv2XS+do98dZtyH8OwjcshOWTM2GPTl6Ftw4iwzjza6wt7LiFk0F51HF1GrfomQZwA
	uKcb0fO50BdUkvl+A0SYcH54PllY8sAMWTiy7xXyDBYNCJzj6s+YAJ5mo7zlOKgonZY9TFMtLgA
	Q4uO3AA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 18 Jul 2023 04:26:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103914

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
Changed
---------
    Typehint for function from_path no longer enforce PathLike as its first argument
    Minor improvement over the global detection reliability

Added
---------
    Introduce function is_binary that relies on main capabilities, and optimized to detect binaries
    Propagate enable_fallback argument throughout from_bytes, from_path, and from_fp that allow a deeper control over the detection (default True)
    Explicit support for Python 3.12

Fixed
-----------
    Edge case detection failure where a file would contain 'very-long' camel cased word (Issue #289)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-normalizer_3.1.0.bb => python3-charset-normalizer_3.2.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-charset-normalizer_3.1.0.bb => python3-charset-normalizer_3.2.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
index 27bd625b4d..0c2810c62a 100644
--- a/meta-python/recipes-devtools/python/python3-charset-normalizer_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-charset-normalizer_3.2.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/ousret/charset_normalizer"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0974a390827087287db39928f7c524b5"
 
-SRC_URI[sha256sum] = "34e0a2f9c370eb95597aae63bf85eb5e96826d81e3dcf88b8886012906f509b5"
+SRC_URI[sha256sum] = "3bb3d25a8e6c0aedd251753a79ae98a093c7e7b471faa3aa9a93a81431987ace"
 
 inherit pypi setuptools3
 
-- 
2.34.1


