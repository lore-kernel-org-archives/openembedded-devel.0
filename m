Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0BFC4167D
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 00:26:03 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web11.46144.1702599960461894773
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 16:26:00 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="143669899"
X-IronPort-AV: E=Sophos;i="6.04,277,1695654000"; 
   d="scan'208";a="143669899"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 09:25:58 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id CEC12E95A3
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:25:55 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 14331D67A7
	for <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 09:25:55 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id D7EA886578;
	Fri, 15 Dec 2023 09:25:53 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade 68.2.0.2 -> 69.0.0.0
Date: Fri, 15 Dec 2023 08:21:30 +0800
Message-Id: <1702599690-1744-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28058.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28058.003
X-TMASE-Result: 10-0.980400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrjdL0b7DvTG6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3BF2OdN6oAASl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFI1y+jaNoovHq9pIgQZZeKQp7n
	7SlmRoHVEKAiSsqvtPXT40V8baSo+F9MgnTIRIsmYdJQGjM8H9pRrBw/CD79VRyyLND5utc+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Dec 2023 00:26:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107474

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Bump setuptools to 69.0.*

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uptools_68.2.0.2.bb => python3-types-setuptools_69.0.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_68.2.0.2.bb => python3-types-setuptools_69.0.0.0.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.2.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.0.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.2.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.0.bb
index 4042ab55f..2fc1895b0 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_69.0.0.0.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "09efc380ad5c7f78e30bca1546f706469568cf26084cfab73ecf83dea1d28446"
+SRC_URI[sha256sum] = "b0a06219f628c6527b2f8ce770a4f47550e00d3e8c3ad83e2dc31bc6e6eda95d"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


