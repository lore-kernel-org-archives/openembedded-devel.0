Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5066CDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:57:29 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.116221.1698051440989662430
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:57:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="116584601"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="116584601"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:57:18 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6AED1D424F
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:57:16 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id A43EAD9467
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:57:15 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BB932FC7AED;
	Mon, 23 Oct 2023 17:57:14 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pycodestyle: upgrade 2.11.0 -> 2.11.1
Date: Mon, 23 Oct 2023 16:56:19 +0800
Message-Id: <1698051379-26187-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27952.006
X-TMASE-Result: 10-0.854400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrYdBG+bhhiNSU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFEhRMFt4Cwqdw3l1wd2Xp72xM5
	1HOm7GLtXxHls1YwnyqsIU2RoQJ/Lt86As6ekZsC4C88Wb4PSnKshCP5V3PUoModrik+Jwx+x9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:57:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105680

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 E275: fix false positive with fstrings containing keyword parts in python 3.12

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-pycodestyle_2.11.0.bb => python3-pycodestyle_2.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pycodestyle_2.11.0.bb => python3-pycodestyle_2.11.1.bb} (76%)

diff --git a/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb b/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.1.bb
similarity index 76%
rename from meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
rename to meta-python/recipes-devtools/python/python3-pycodestyle_2.11.1.bb
index 9a8d1076fc..a282afb466 100644
--- a/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pycodestyle_2.11.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a8546d0e77f416fb05a26acd89c8b3bd"
 
-SRC_URI[sha256sum] = "259bcc17857d8a8b3b4a2327324b79e5f020a13c16074670f9c8c8f872ea76d0"
+SRC_URI[sha256sum] = "41ba0e7afc9752dfb53ced5489e89f8186be00e599e712660695b7a75ff2663f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


