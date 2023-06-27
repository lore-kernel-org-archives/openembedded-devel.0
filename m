Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30ADFC001B3
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:35 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.7509.1687850066370257623
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="101771699"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="101771699"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:23 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id B6872C68E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:21 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0067AD3F03
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:21 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 38C2488D20;
	Tue, 27 Jun 2023 16:14:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-requests-futures: upgrade 1.0.0 -> 1.0.1
Date: Tue, 27 Jun 2023 15:12:16 +0800
Message-Id: <1687849939-19941-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--5.199300-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrF4r8H5YrEqzrwoNVYOVcQPtq
	IrkO/l5cxVCveQ7NhcMNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt7iMD
	6wB/IizK55LYADJ+vzJg+xMERr0NZeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibIAcCikR3vq/RjaaKJY4IijXvhqeERzL6lLlMLaVnWYPLWfEAuQTeNh8lE
	eLXMbWU
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103609

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
  Add pytest.mark.network to test cases
  pyproject.toml config for black, isort, and pytest

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ests-futures_1.0.0.bb => python3-requests-futures_1.0.1.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-requests-futures_1.0.0.bb => python3-requests-futures_1.0.1.bb} (73%)

diff --git a/meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.1.bb
similarity index 73%
rename from meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-requests-futures_1.0.1.bb
index 4b57e13a9a..28f034f7e3 100644
--- a/meta-python/recipes-devtools/python/python3-requests-futures_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-requests-futures_1.0.1.bb
@@ -3,8 +3,7 @@ HOMEPAGE = "https://github.com/ross/requests-futures"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e1e50798d0afe0e1f87594c6619a2fa5"
 
-SRC_URI[md5sum] = "601b5e90413bb00e06148752d31f0cc7"
-SRC_URI[sha256sum] = "35547502bf1958044716a03a2f47092a89efe8f9789ab0c4c528d9c9c30bc148"
+SRC_URI[sha256sum] = "f55a4ef80070e2858e7d1e73123d2bfaeaf25b93fd34384d8ddf148e2b676373"
 
 inherit pypi setuptools3
 
-- 
2.34.1


