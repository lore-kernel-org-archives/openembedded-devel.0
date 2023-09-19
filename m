Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75024CD5491
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:44:29 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.2442.1695109464267221930
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:44:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="132646648"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="132646648"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:44:22 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4B816CA1E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:44:20 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8094CD5E31
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:44:19 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 0C16620079116;
	Tue, 19 Sep 2023 16:44:19 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.3.0 -> 7.3.1
Date: Tue, 19 Sep 2023 15:43:56 +0800
Message-Id: <1695109436-7648-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27884.005
X-TMASE-Result: 10--7.460300-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mrlDt5PQMgj01cLWsUDROp3b6g
	Ca8feq9duzE3rmZBQQVHPmHy6OeVI9GETJv1/WyOP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsLJjQpIWhSuM3PhwfmFb3pg7Cl8sx4HBG64sbbURvhPzgW6bY8SOq3WjxY
	yRBa/qJXcsDK2xBHh7jaPj0W1qn0Q7AFczfjr/7NIxj5dHLdJdOdXi00wOc9+/alJ2vtlFUaseI
	nUlNaLrRNFz5IlS9cY=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:44:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104980

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-The semantics of stars in file patterns has been clarified in the docs.
 A leading or trailing star matches any number of path components, like a
 double star would. This is different than the behavior of a star in the
 middle of a pattern.
-The API docs were missing from the last version. They are now restored.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.3.0.bb => python3-coverage_7.3.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.3.0.bb => python3-coverage_7.3.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.3.0.bb b/meta-python/recipes-devtools/python/python3-coverage_7.3.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-coverage_7.3.0.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.3.1.bb
index 0a32a6a38e..636b7377a3 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.3.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "49dbb19cdcafc130f597d9e04a29d0a032ceedf729e41b181f51cd170e6ee865"
+SRC_URI[sha256sum] = "6cb7fe1581deb67b782c153136541e20901aa312ceedaf1467dcb35255787952"
 
 inherit pypi setuptools3
 
-- 
2.34.1


