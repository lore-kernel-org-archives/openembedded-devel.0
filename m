Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8EFC46CD2
	for <webhook@archiver.kernel.org>; Tue, 23 Jan 2024 01:30:14 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.1153.1705973408991098545
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Jan 2024 17:30:09 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="146939624"
X-IronPort-AV: E=Sophos;i="6.05,212,1701097200"; 
   d="scan'208";a="146939624"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2024 10:30:04 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A64CA3129
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:30:01 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5051BD976A
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:30:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id D3F4622CDE4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 10:29:59 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6D8BC1A006A;
	Tue, 23 Jan 2024 09:29:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xmlschema: upgrade 2.5.1 -> 3.0.1
Date: Tue, 23 Jan 2024 09:29:09 +0800
Message-Id: <1705973349-25338-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28136.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28136.004
X-TMASE-Result: 10--1.027300-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr2+EDPw+8xrdYGMLD7hVIwOn7
	ya/+V5vjMzTo2qNcI5YNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4iiOf1NDnCI+rWL/xQJnm46eAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8hxKp
	vEGAbTDjX4o6NDbRyehW2sbjddFssGi3jdKGRS2Sj3uyyMqOv8vS2btqFN7aiRmHvkoOcm2NVBz
	lo/SVBTrvJ9HFC7eWWNa215c2LC+4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Jan 2024 01:30:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108399

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Hotfix release for broken requirement
-Set python-requires metadata to >=3.8
-Upgrade GitHub Actions

License-Update: Copyright year updated to 2024.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xmlschema_2.5.1.bb => python3-xmlschema_3.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-xmlschema_2.5.1.bb => python3-xmlschema_3.0.1.bb} (71%)

diff --git a/meta-python/recipes-devtools/python/python3-xmlschema_2.5.1.bb b/meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb
similarity index 71%
rename from meta-python/recipes-devtools/python/python3-xmlschema_2.5.1.bb
rename to meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb
index 19fae9131..890743b0c 100644
--- a/meta-python/recipes-devtools/python/python3-xmlschema_2.5.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xmlschema_3.0.1.bb
@@ -1,9 +1,9 @@
 SUMMARY = "The xmlschema library is an implementation of XML Schema for Python (supports Python 3.6+)."
 HOMEPAGE = "https://github.com/sissaschool/xmlschema"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=0ab20f8e337bea2e6874f372edfd12c0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=26aa26eda991a3a2b61c11b62d3fda65"
 
-SRC_URI[sha256sum] = "4f7497de6c8b6dc2c28ad7b9ed6e21d186f4afe248a5bea4f54eedab4da44083"
+SRC_URI[sha256sum] = "bb24a5f4738e49d85d9eb03a2b5af26bbbbfdb055517ad953d98925094b8c026"
 
 PYPI_PACKAGE = "xmlschema"
 inherit pypi setuptools3
-- 
2.34.1


