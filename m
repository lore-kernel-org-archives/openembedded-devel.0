Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4C5CD549D
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:54:39 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2690.1695110073315446274
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:54:33 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120912894"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120912894"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:54:31 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id E0131D29E8
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:54:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 144D5D4F66
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:54:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8D8AF2007911B;
	Tue, 19 Sep 2023 16:54:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-term: upgrade 2.4 -> 2.5
Date: Tue, 19 Sep 2023 15:53:50 +0800
Message-Id: <1695110030-8131-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--1.434500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrRWnXH60ddk/k6Qbi+9i6Dx0C
	nj5qQ3GUhCYXJKnjJJJkFP49UmTWs294Ipa1otxoP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKYhMTcdVKb+FeBzEkCCpnRndCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtqOZ8hCNNUqc5r67YebVOCj2FBIAqO0Ht5Pi4VSKYFDWJBmVk4EMqzxiK8
	NUB01z8nlZ+q8ln7SnF+QEm5Lu6xhyZrzJMZl2zHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:54:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104992

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
Update tox.ini for latest tox.
Add .readthedocs.yaml file.
Pin sphinx and sphinx-rtd-theme versions in docs extra.
Add pylint extra which installs pylint.
Update .pylintrc for latest pylint.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-term_2.4.bb => python3-term_2.5.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-term_2.4.bb => python3-term_2.5.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-term_2.4.bb b/meta-python/recipes-devtools/python/python3-term_2.5.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-term_2.4.bb
rename to meta-python/recipes-devtools/python/python3-term_2.5.bb
index bc6a4c3df6..3408b29c17 100644
--- a/meta-python/recipes-devtools/python/python3-term_2.4.bb
+++ b/meta-python/recipes-devtools/python/python3-term_2.5.bb
@@ -3,7 +3,7 @@ SECTION = "devel/python"
 LICENSE = "Python-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d90e2d280a4836c607520383d1639be1"
 
-SRC_URI[sha256sum] = "2cca4cf5f83035ca12627c4bbeff2891ad4711666247a790fd8200d73f38c3f0"
+SRC_URI[sha256sum] = "846fda941dbb8a7c9f246e99bf5ee731910fc4a4cc54b7e36457c133c9f6b78b"
 
 inherit pypi setuptools3
 
-- 
2.34.1


