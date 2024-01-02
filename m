Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA04CC46CD2
	for <webhook@archiver.kernel.org>; Tue,  2 Jan 2024 07:07:55 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.24265.1704179274139255771
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Jan 2024 23:07:54 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10940"; a="124464024"
X-IronPort-AV: E=Sophos;i="6.04,324,1695654000"; 
   d="scan'208";a="124464024"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2024 16:07:52 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 7BD20D3EA9
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:07:49 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id C914C1414A
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:07:48 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 346386BC4D
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jan 2024 16:07:48 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id B5A7E1A0070;
	Tue,  2 Jan 2024 15:07:47 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.3.4 -> 7.4.0
Date: Tue,  2 Jan 2024 15:07:37 +0800
Message-Id: <1704179257-8102-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28094.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28094.005
X-TMASE-Result: 10--0.878900-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOYGRpv0VVRxuce7gFxhKa0BQOqUsWgx5gIZ++dWnH7bnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBdvGzOGVrF2M9nIwhFkewAt8k
	YG10+CQ1ESBIX4ekPhLMweNkCEnwbpe4Hhcj+hEJVsmbFKXhT6cVvbRnwmSSPpw5u0FgI02ex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 07:07:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108000

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.3.4.bb => python3-coverage_7.4.0.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.3.4.bb => python3-coverage_7.4.0.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.3.4.bb b/meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-coverage_7.3.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
index 42bc9fc8e..cb1041c2f 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.3.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.4.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "020d56d2da5bc22a0e00a5b0d54597ee91ad72446fa4cf1b97c35022f6b6dbf0"
+SRC_URI[sha256sum] = "707c0f58cb1712b8809ece32b68996ee1e609f71bd14615bd8f87a1293cb610e"
 
 inherit pypi setuptools3
 
-- 
2.34.1


