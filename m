Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950ACCD54A0
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:57:09 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.2750.1695110228926714176
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="120913159"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="120913159"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:57:06 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8263FC3F83
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:57:04 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C619DD3F00
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:57:03 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id F29A92FC8066;
	Tue, 19 Sep 2023 16:57:02 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade 68.1.0.1 -> 68.2.0.0
Date: Tue, 19 Sep 2023 15:56:25 +0800
Message-Id: <1695110185-8261-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--3.254600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrlDt5PQMgj00T4iDztnfIOVHs
	YDQ6MXSWepwUk+Mcqyx5ILz8QQa832+q6t+f1BKUpSXVpBS+ilZUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmibAGOCaWkxjvdCok3ibXlQX0tCKdnhB589yM15V5aWpj6C0
	ePs7A07bxtFR53UcYCwHOHX6dDxrYtEDFJrYMxWlaeH+PtGKrAykqDQty+kgG0VqHcNvs9j6421
	cNjLxDifNNVUz6sX5K13lK4PeV9rQnlaPfuxdVz8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:57:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104995

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-1 public Python file has been added: setuptools/tests/test_core_metadata.py.
-0 files included in typeshed's stubs have been deleted.
-7 files included in typeshed's stubs have been modified or renamed:
 setuptools/__init__.py, setuptools/command/editable_wheel.py,
 setuptools/command/egg_info.py, setuptools/depends.py, setuptools/dist.py,
 setuptools/monkey.py, setuptools/namespaces.py.
-Total lines of Python code added: 1051.
-Total lines of Python code deleted: 682.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uptools_68.1.0.1.bb => python3-types-setuptools_68.2.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_68.1.0.1.bb => python3-types-setuptools_68.2.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.1.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.1.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.0.bb
index 9d8022bf1c..ed0b1b2cd8 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_68.1.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "271ed8da44885cd9a701c86e48cc6d3cc988052260e72b3ce26c26b3028f86ed"
+SRC_URI[sha256sum] = "a4216f1e2ef29d089877b3af3ab2acf489eb869ccaf905125c69d2dc3932fd85"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


