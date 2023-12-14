Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E38F1C4332F
	for <webhook@archiver.kernel.org>; Thu, 14 Dec 2023 09:03:16 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.17907.1702544587385245148
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Dec 2023 01:03:07 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="143323545"
X-IronPort-AV: E=Sophos;i="6.04,274,1695654000"; 
   d="scan'208";a="143323545"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 18:03:06 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 348B3E8BF9
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:03:03 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 6507DBF4AF
	for <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 18:03:02 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.165])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5D80888500;
	Thu, 14 Dec 2023 18:03:01 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-portion: upgrade 2.4.1 -> 2.4.2
Date: Thu, 14 Dec 2023 17:01:14 +0800
Message-Id: <1702544474-28298-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-28056.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-28056.006
X-TMASE-Result: 10-0.982400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mrJ4cwIYL6KueU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUNuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFGyIzeY9Vp/NUSamwux1Bqalun
	+M7IZlg2Sk3fYJd9Yqh6KQM/P2q2mLL6oynyNkSfoPrYFNZTpWY6pBCmmrL2wz8ih9z3cC+ux9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Dec 2023 09:03:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107444

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Import error when using create_api in Python 3.10+

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-portion_2.4.1.bb => python3-portion_2.4.2.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-portion_2.4.1.bb => python3-portion_2.4.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-portion_2.4.1.bb b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
rename to meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
index a340ba7fc..b4bbfc6c6 100644
--- a/meta-python/recipes-devtools/python/python3-portion_2.4.1.bb
+++ b/meta-python/recipes-devtools/python/python3-portion_2.4.2.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=05f1e16a8e59ce3e9a979e881816c2ab"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9dcbf1808898f440aed304a5e9f0742a2859eca3b0ac7f1f58e50502852a8ef9"
+SRC_URI[sha256sum] = "5289b40d98959b16b3f6927781678935d3df1b7c14947f5d7778e5e04dd9a065"
 
 RDEPENDS:${PN} = "\
     ${PYTHON_PN}-sortedcontainers \
-- 
2.34.1


