Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A08BCC197A0
	for <webhook@archiver.kernel.org>; Thu, 16 Nov 2023 08:38:16 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2889.1700123894125472429
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 00:38:14 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="139900518"
X-IronPort-AV: E=Sophos;i="6.03,307,1694703600"; 
   d="scan'208";a="139900518"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2023 17:38:12 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 859E4D3EB4
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:38:09 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C662FC8BFD
	for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 17:38:08 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.79])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id E69CC6B80D;
	Thu, 16 Nov 2023 17:38:07 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-types-setuptools: upgrade 68.2.0.0 -> 68.2.0.1
Date: Thu, 16 Nov 2023 16:37:36 +0800
Message-Id: <1700123856-22615-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28000.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28000.003
X-TMASE-Result: 10-0.980400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrjdL0b7DvTG6U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa3BF2OdN6oAASl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFAuTuaqtJg6SwHNGTPCU5Y/XDv
	8ZPDA10PigqZM3zZ1RTGvKNqgZwlvjUQE0BtETI3t/EC5tI6KvMAK3lswv9ftRRB7OvybzVux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 08:38:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106802

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Bump flake8-pyi to 23.11.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...uptools_68.2.0.0.bb => python3-types-setuptools_68.2.0.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-types-setuptools_68.2.0.0.bb => python3-types-setuptools_68.2.0.1.bb} (74%)

diff --git a/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.0.bb b/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.1.bb
similarity index 74%
rename from meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.0.bb
rename to meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.1.bb
index ed0b1b2cd..106121335 100644
--- a/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-types-setuptools_68.2.0.1.bb
@@ -5,6 +5,6 @@ LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=ef4dc1e740f5c928f1
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "a4216f1e2ef29d089877b3af3ab2acf489eb869ccaf905125c69d2dc3932fd85"
+SRC_URI[sha256sum] = "8f31e8201e7969789e0eb23463b53ebe5f67d92417df4b648a6ea3c357ca4f51"
 
 BBCLASSEXTEND = "native"
-- 
2.34.1


