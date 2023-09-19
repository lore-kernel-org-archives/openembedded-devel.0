Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99DA4CD5493
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:46:59 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2509.1695109612220236016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:46:52 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132646921"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132646921"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:46:50 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2D33CDE57E
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:46:48 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5AF1DD4F5F
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:46:47 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CBCF26BF63;
	Tue, 19 Sep 2023 16:46:46 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eth-utils: upgrade 2.2.0 -> 2.2.1
Date: Tue, 19 Sep 2023 15:45:21 +0800
Message-Id: <1695109521-7722-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.006
X-TMASE-Result: 10-0.250400-10.000000
X-TMASE-MatchedRID: 4E21WKQgrFSjz0nOeth/yUIIxwDaU5mregIHHX2L4YyU8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN3IFFT9wqfr0QhNjZQYyI3Cl6ppmExqcYnpt
	r8PnHpyni8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSmcfuxsiY4QFBBoJMEnnrxIk8VLvTJYjMZBFO
	lrvV88qiFrtG4PkV0Q+yX1RZx4raUZeLHSOeJjk/OldDvwSIZccg2KV6T2o6J622zIYxBB+ex9n
	1XpDqsJmC9SiJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:46:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104982

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Add build.os config for readthedocs

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-utils_2.2.0.bb => python3-eth-utils_2.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-utils_2.2.0.bb => python3-eth-utils_2.2.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb b/meta-python/recipes-devtools/python/python3-eth-utils_2.2.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-utils_2.2.1.bb
index ce2dcb0d4c..bace620eef 100644
--- a/meta-python/recipes-devtools/python/python3-eth-utils_2.2.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-utils_2.2.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6749008d847c14b9718949c2e24d5c0a"
 
-SRC_URI[sha256sum] = "7f1a9e10400ee332432a778c321f446abaedb8f538df550e7c9964f446f7e265"
+SRC_URI[sha256sum] = "f79a95f86dd991344697c763db40271dbe43fbbcd5776f49b0c4fb7b645ee1c4"
 
 inherit pypi setuptools3
 
-- 
2.34.1


