Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C3FFC04A94
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7461.1687850055949722603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:23 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110071682"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110071682"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:21 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D97CDC3F80
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:19 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 23554D3F03
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5737F88D20;
	Tue, 27 Jun 2023 16:14:18 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pymongo: upgrade 4.3.3 -> 4.4.0
Date: Tue, 27 Jun 2023 15:12:13 +0800
Message-Id: <1687849939-19941-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--5.314000-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrYIOxzvM9rTZH8jOVX4Ixto3c
	eRXYSJoDPS1i7P3nVrYNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErRxCcahBdJAzjP3WYNhkszllNc
	WZ7137CiBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwGmRqNBHmBvejvEeq6gAkYbfaY
	87m2dqxyAHAopEd76vMH1lGM1+Cie/QwkBvvIXhBKZsEtQhF7PRGbH8aFET47uuGgNfVxrFA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103605

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Added support for MongoDB 7.0.
- Added support for Python 3.11.
- Added support for passing a list containing (key, direction) pairs or keys to
  create_index().
- Improved bson encoding performance (PYTHON-3717 and PYTHON-3718).
- Improved support for Pyright to improve typing support for IDEs like Visual
  Studio Code or Visual Studio.
- Improved support for type-checking with MyPy "strict" mode (-strict).
- Added create_encrypted_collection(), EncryptedCollectionError,
  encrypt_expression(), RangeOpts, and RANGEPREVIEW as part of the experimental
  Queryable Encryption beta.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymongo_4.3.3.bb => python3-pymongo_4.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymongo_4.3.3.bb => python3-pymongo_4.4.0.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-pymongo_4.3.3.bb b/meta-python/recipes-devtools/python/python3-pymongo_4.4.0.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-pymongo_4.3.3.bb
rename to meta-python/recipes-devtools/python/python3-pymongo_4.4.0.bb
index c1bc39a451..a9bf31d811 100644
--- a/meta-python/recipes-devtools/python/python3-pymongo_4.3.3.bb
+++ b/meta-python/recipes-devtools/python/python3-pymongo_4.4.0.bb
@@ -8,7 +8,7 @@ HOMEPAGE = "http://github.com/mongodb/mongo-python-driver"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
-SRC_URI[sha256sum] = "34e95ffb0a68bffbc3b437f2d1f25fc916fef3df5cdeed0992da5f42fae9b807"
+SRC_URI[sha256sum] = "a1b5d286fee4b9b5a0312faede02f2ce2f56ac695685af1d25f428abdac9a22c"
 
 inherit pypi setuptools3
 
-- 
2.34.1


