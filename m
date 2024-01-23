Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C766BC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:45:44 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.1457.1705974339450359961
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:45:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="148609872"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="148609872"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:45:37 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3FEFCE0426
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:45:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6CAD4D9489
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:45:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 094A52663A5
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:45:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4D0351A006A;
	Tue, 23 Jan 2024 09:45:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-utils: upgrade 2.3.1 -> 3.0.0
Date: Tue, 23 Jan 2024 09:45:18 +0800
Message-Id: <1705974318-25831-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--3.733200-10.000000
X-TMASE-MatchedRID: jrsYt7uzg+ujz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7SwZuykSn6+/IyG
	8V1UOe4OhDLYiwcLbP19t+5pVoYOEfXNEkgZOg/Oqoeab9Xgz88L//VMxXlyE8iCh8yBqE+tgKe
	r2q0Zy9U4g1jc5RqlMHudmZKCXGD27VrXqiqnwHX8dMpK2wMYwkc1DwKoQo7YwLkNMQzGl5APn4
	RjXbQDehab+AC2MJ3sBhQWw3lZ+IXymVDB8yZElJ4CIKY/Hg3AaZGo0EeYG95UMLUJu4leYyq2r
	l3dzGQ1b2qR+RszdqPSdIZnDbcjuYa7yskQQuIjyugPqVa6YnXswtSK3Ru8IxGBT9qM9ui/Ri7Z
	dS4GIMFf9uApih6PNbcs2vaS9ZtsUu8eo+LTjoVTyZ1y9sjWHZLqPOO5dObQxMzMgJrM/hR6Fi1
	pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:45:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108411

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Drop python 3.7 support
-Merge updates from the project template, notably: use pre-commit for linting
 and change the name of the master branch to main
-Correct booleans in pyproject.toml and add test for the presence of the
 eth_utils.__version__ attribute
-Some users were experiencing encoding issues when parsing the networks
 json. Use UTF-8 explicitly.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_2.3.1.bb => python3-eth-utils_3.0.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_2.3.1.bb => python3-eth-utils_3.0.0.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.3.1.bb b/meta-python/recipes-devtools/python/python3-eth-utils_3.0.0.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-utils_2.3.1.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_3.0.0.bb
index 1f641832f..faca03865 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_2.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_3.0.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "56a969b0536d4969dcb27e580521de35abf2dbed8b1bf072b5c80770c4324e27"
+SRC_URI[sha256sum] = "8721869568448349bceae63c277b75758d11e0dc190e7ef31e161b89619458f1"
 
 inherit pypi setuptools3
 
-- 
2.34.1


