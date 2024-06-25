Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA1AC3065E
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.167244.1719305852975534140
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Mcips7CI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305854; x=1750841854;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nABx/b7Tu7ywjpoow1yPCvvzBpAE67nl1OKeekXPnW8=;
  b=Mcips7CI54iIXoar3tjI6Eck/Qd6LKTyYQemtbgdh2rT4gXoQSWQ1hjS
   htgyEMOhmjCaljZPZOaJ2XHev3+gdJqSsJXaKDx7QGc7BrInjtWMLiCOj
   CK7YGuRhJhuD5Apcg3XKt7mBXZI9WC2Xec+uVwRbFrIQMjyR/6/nVpSaG
   AuPPud9Pwu55jmROwVtG0VatjXJnSLBhNuXvmKZJKN55m6LG9qsfAX2YH
   WAnVerI+E0J0sTOtpI8CHHEP7I3VfuOP7HVcC96XIL+1uTG+T3/1UuFNd
   CxxXsKbQoyGNnIIhB+MZ+eyt4YxNIDP8fByX29jwZfsuW/RULLdRKHOwz
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="152254730"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="152254730"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:31 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5F37CC3F8C
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:29 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id A222ED3F03
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:28 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 36B012007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:28 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D4E281A0002;
	Tue, 25 Jun 2024 16:57:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 44/57] python3-pymisp: upgrade 2.4.190 -> 2.4.194
Date: Tue, 25 Jun 2024 16:56:17 +0800
Message-Id: <1719305790-11484-44-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--7.201900-10.000000
X-TMASE-MatchedRID: u4ys6248rQyjz0nOeth/yUIIxwDaU5mrOq7d0z5iEVET4iDztnfIOdDR
	aaMySZINguP8XuU2B/coucyl6UjLDlWZAt3VKpANnXXE+dK/TFBxXefgn/TNQ72uTQBvzrKxupC
	V1Tw0TOk44/YowtSRA2FaA05V+E9Mh2Em++ruuH8F7cpFXK76TVQQ0EgzIoPRB/FMznsE8cPu/Q
	yUVIt+aU0NCZDxtvO/5p98cjyQCaKzVFZ6osYjDrnHu4BcYSmtvjhlW2MGLIknXmIk3yhp46PFj
	JEFr+olwXCBO/GKkVqOhzOa6g8KrbN3Fgn48TI0OkRffpNz9snVhsgjh7HR9+US9SAD/kkNrBLd
	be7jdXg=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111058

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Make a response in the tests a MISPUser obj.
- Tests failing du to missing error.
- Get the tests to pass.
- Properly load AnalystData from dict.
- More changes to get the tests to pass.
- [event-report] Make sure to generate an UUID.
- Pass kwargs to abstract.
- [analyst-data] Added initial support of analyst data concept and
  functions - WiP.
- A bit more refactoring.
- Use from_dict in the mixin to initialize the objects.
- [analyst-data] Added improvements, API endpoints and tests.
- [analyst-data] Make sure to include note_type_name.
- Make mypy happy, change inheritance.
- Allow orgc context for search_galaxy_clusters.
- [analyst-data] Continued implementation of analyst-data support.
- Allow orgc context for search_galaxy_clusters.
- Add test case.
- Add attach galaxy cluster method.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.190.bb => python3-pymisp_2.4.194.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.190.bb => python3-pymisp_2.4.194.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.190.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.194.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.190.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.194.bb
index c1389982d..cb28ec3ff 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.190.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.194.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "e7374295bfd8c7d25f56867e4395a029433360d95420e39b7f78eb1d4f8b48b4"
+SRC_URI[sha256sum] = "f7adb929a0f8a7f0a7c8a9be7727db247a9a30f3525216747fdbca151eb0a44a"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


