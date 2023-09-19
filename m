Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71393CD548F
	for <webhook@archiver.kernel.org>; Tue, 19 Sep 2023 07:40:39 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2345.1695109234186075080
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Sep 2023 00:40:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="111996782"
X-IronPort-AV: E=Sophos;i="6.02,158,1688396400"; 
   d="scan'208";a="111996782"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 16:40:33 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id D7C9ECA1E4
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:40:29 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id D6399D4F55
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 16:40:28 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 08E9B2FC8066;
	Tue, 19 Sep 2023 16:40:27 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-bitstring: upgrade 4.1.1 -> 4.1.2
Date: Tue, 19 Sep 2023 15:40:21 +0800
Message-Id: <1695109221-7552-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27884.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27884.005
X-TMASE-Result: 10--1.257300-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyvFu9dqRsNfOGsW
	ZV9YMDBbqkqosl6X1jq8svZ37uMChJJEF1oICcMoXPDypgTcWVWOVGny5q72hmdxLMcuhFqZiIs
	MwJfdJDzgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjEd+K6O5Nt53W9n
	uzdghUMnp5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJe3QfwsVk0UbvqwGfCk7KUs5JTd
	Z8bbp2MfGA3d2TPO7b3y3nue8mt+9wDAdas+3E61cPqfH1RidoAMImJZRN88LQVDQrUOc98BBaP
	Zcmb19MA6rbT8Jyx3ogeppQyntVe0v8srR3gjfRl7+AkHjVJOxuqkzsKv5+9ftwZ3X11IV0=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Sep 2023 07:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104978

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix for the module command-line usage. Bug #290.
- Fix for when creating bitstrings from memoryview objects.
- Renamed the 'fmt' parameter for Arrays to 'dtype'.
- More Array operator coverage.
- Added operators that act on two Arrays of the same size.
- Added comparison operators for Arrays that return an Array of bools.
- Added Array.equals method as == will now return an Array (see above item).
- Added astype() method for Arrays to easily cast to a new dtype.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-bitstring_4.1.1.bb => python3-bitstring_4.1.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-bitstring_4.1.1.bb => python3-bitstring_4.1.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-bitstring_4.1.1.bb b/meta-python/recipes-devtools/python/python3-bitstring_4.1.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-bitstring_4.1.1.bb
rename to meta-python/recipes-devtools/python/python3-bitstring_4.1.2.bb
index f45bfc0efd..7a049733be 100644
--- a/meta-python/recipes-devtools/python/python3-bitstring_4.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-bitstring_4.1.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/scott-griffiths/bitstring"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=661f450e2c0aef39b4b15597333444a7"
 
-SRC_URI[sha256sum] = "a9c97fdf9fe38f27ea0ac2b4cf2a3f5bce5ccc23b863082582b9f48b22274528"
+SRC_URI[sha256sum] = "c22283d60fd3e1a8f386ccd4f1915d7fe13481d6349db39711421e24d4a9cccf"
 
 PYPI_PACKAGE = "bitstring"
 
-- 
2.34.1


