Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADE4C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:43:55 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.152056.1692150234786801709
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:43:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="127722274"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208";a="127722274"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:43:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id EC637D29E1
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:43:49 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id D8080D9471
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:43:48 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5E51E2007685C;
	Wed, 16 Aug 2023 10:43:48 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-joblib: upgrade 1.3.1 -> 1.3.2
Date: Wed, 16 Aug 2023 09:43:29 +0800
Message-Id: <1692150209-5527-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--4.577600-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysktNN9I8qXD7xg
	LrBLgR3BOW3AUJEo88YaiTke3N9xUSSBigu/eRn2qoeab9Xgz89UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmikZmKVOLxy1I7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0TGVuWouVipcp/6nay/1pe09aeMcH/jQUb4LBDquJIYvIBs2
	fyciIkC8CdKKXTDmjdGm8FjoasjUO3yvMX3I5T1MAskJnoisepXHRhhxqNjGP6/2/nZkihaOgB/
	fz3EXdcVKT0eFRmfDs4YhafCzgujIdY9jOi4lTI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:43:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104389

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix a regression in joblib.Parallel introduced in 1.3.0 where explicitly
 setting n_jobs=None was not interpreted as "unset".
-Fix a regression in joblib.Parallel introduced in 1.3.0 where joblib.Parallel
 logging methods exposed from inheritance to joblib.Logger didn't work because
 of missing logger initialization.
-Various maintenance updates to the doc, the ci and the test. 

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-joblib_1.3.1.bb => python3-joblib_1.3.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-joblib_1.3.1.bb => python3-joblib_1.3.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-joblib_1.3.1.bb b/meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-joblib_1.3.1.bb
rename to meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb
index 9186cbb19f..fe1e68c5ad 100644
--- a/meta-python/recipes-devtools/python/python3-joblib_1.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-joblib_1.3.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2e481820abf0a70a18011a30153df066"
 
 inherit setuptools3 pypi
 
-SRC_URI[sha256sum] = "1f937906df65329ba98013dc9692fe22a4c5e4a648112de500508b18a21b41e3"
+SRC_URI[sha256sum] = "92f865e621e17784e7955080b6d042489e3b8e294949cc44c6eac304f59772b1"
 
 RDEPENDS:${PN} += " \
     python3-asyncio \
-- 
2.34.1


