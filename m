Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930D1C54790
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.9263.1708419297154672221
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:54:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=HaIsBSZc;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419298; x=1739955298;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=0xE9tQCUVbQnjQ5CV0akBHNtmggCw37YJgAUZhwV2hE=;
  b=HaIsBSZcINPslq/KKBDwHbtHkXOMXmWd6ZkQ52ZwahdkvlNRhtcDItMx
   rfAOp7R5SKG0jYX9NuGPa2sRUow2ql6xu9hZfVG2iTo1w+MbnKJuaJLEU
   KCYT29GdtRfIlCwYictVVaMFt5zxcFgdtmMv7EE6ExcF4ob/OsVRVVNTk
   S7P3OcrB9iVy3LA9xJjoeA+67r71TgVZ005u/j7howLzQw0UW/iiv4Wvm
   tcoBUT32zxxs7kpIxhrzH7u+vZ01Fop8tanAao/kAXpXF00VjAryRU4FB
   pCaxTTZ/v0ve/1C7itelNzysC5Sn+2tsvIDpExJdYLPPe/6lyB5RXYGsc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="149352028"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="149352028"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:55 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 739281F4595
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:52 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AA226CF7C8
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:51 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 293C7200A7683
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:51 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CD7AF1A006B;
	Tue, 20 Feb 2024 16:54:50 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 05/26] python3-tqdm: upgrade 4.66.1 -> 4.66.2
Date: Tue, 20 Feb 2024 16:54:20 +0800
Message-Id: <1708419281-26047-5-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-0.123200-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yXg2y0j5vXZGlEDhvi2wR84H4DTIEE89jAjJ
	lierVE/nQ81qgeXgRadi3n4ncgiU3gMIRd8J8fkMPKN38CLPK0FVxJia/7DuCBHfiujuTbedmgl
	Oe/n3v03/wCIGi5oMiw3KvrUy7pE6bRev5+PfDD/y3h9RQZ4StME5XPQnBzGXBX18z5X2O3sKFv
	XSWZo39pVY4b3no4E1iExNx1Upv4V4HMSQIKmdGW9OepgphdNGVeAZ5VSHdZ2bKItl61J/yUGDD
	kbg1gJk32mPO5tnascnRE+fI6etkoKZ5d1Ccgr3Q9UQY6uadSakICnFjR6MeWQuE4jJrAVmd3DC
	QLAJPOn/Pw9gB7ecfuDnpeFT5e8NvIeOCTF2hANNKLeB9crXrEu/kTKv9giuqwOHO1Fdn0Kb4tj
	0DvxRUIs9ro6z1cfchCFNTbTJJtE=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108927

From: Wang Mingyu <wangmy@fujitsu.com>

License_Update: Copyright year updated to 2024.

Changelog:
============
-pandas: add DataFrame.progress_map
-notebook: fix HTML padding
-keras: fix resuming training when verbose>=2
-fix format_num negative fractions missing leading zero
-fix Python 3.12 DeprecationWarning on import
-linting: use f-strings
-update tests
-fix pandas warnings
-fix asv (https://github.com/airspeed-velocity/asv/issues/1323)
-fix macos notebook docstring indentation
-CI: bump actions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tqdm_4.66.1.bb => python3-tqdm_4.66.2.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-tqdm_4.66.1.bb => python3-tqdm_4.66.2.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb b/meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb
rename to meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb
index 2a92e6189..963e80c98 100644
--- a/meta-python/recipes-devtools/python/python3-tqdm_4.66.1.bb
+++ b/meta-python/recipes-devtools/python/python3-tqdm_4.66.2.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "http://tqdm.github.io/"
 SECTION = "devel/python"
 
 LICENSE = "MIT & MPL-2.0"
-LIC_FILES_CHKSUM = "file://LICENCE;md5=bb3c087935ebba37cad180364cb0850c"
+LIC_FILES_CHKSUM = "file://LICENCE;md5=42dfa9e8c616dbc295df3f58d756b2a1"
 
-SRC_URI[sha256sum] = "d88e651f9db8d8551a62556d3cff9e3034274ca5d66e93197cf2490e2dcb69c7"
+SRC_URI[sha256sum] = "6cd52cdf0fef0e0f543299cfc96fec90d7b8a7e88745f411ec33eb44d5ed3531"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


