Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0260BE7718F
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:30:50 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.58741.1735543848351919840
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:30:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=PP+oUHGZ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735543848; x=1767079848;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=T78sZjVR54rdhwF2aiw5ru+IsSLg6xpk6mnhzBvA1f8=;
  b=PP+oUHGZlw4Dv1PI8xrZyBiAdyMIzBd/hWRvyj1AJJc5nePIC2P2YJ19
   TR3F20ETX6pKhEp/7BKQX2ADkEZuM4+tAIswrS3nxgVTjpAXpJtG7PJte
   /BDBMIHq9nnSYhmJ4seA/QDgdiBg1xCOV9NT9iXL7G4nJFxTfisdV305j
   RCVehurEcqFFQT6MRJdUZ//IFkvlxSL93jG9mz3j7hOTBZZKcTQed/qSB
   MJUmm5t7BTXnp/oREWBrf3q7DygMOf0eMZM4ZEWkPEoETGEfrWsQglT4U
   nmhFjH0lGC27O6OZ96uGXnHGWyh13IX91QxbinCdecQTVr0XHTTFutZCP
   Q==;
X-CSE-ConnectionGUID: ESX6odCiQtavQvycgP0Ojg==
X-CSE-MsgGUID: K7sBRVNVQeCI/RVZeBu7iA==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="185308702"
X-IronPort-AV: E=Sophos;i="6.12,275,1728918000"; 
   d="scan'208";a="185308702"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 16:30:46 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 20423C3F97
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:44 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id EBE67D39CF
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 8099070BE2
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 16:30:43 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 24FE91A0003;
	Mon, 30 Dec 2024 15:30:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/18] python3-coverage: upgrade 7.6.9 -> 7.6.10
Date: Mon, 30 Dec 2024 15:30:28 +0800
Message-Id: <1735543836-2512-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
References: <1735543836-2512-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28890.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28890.005
X-TMASE-Result: 10--0.878900-10.000000
X-TMASE-MatchedRID: 7cZymtcOvx2jz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmIAf/HImzvCGOYGRpv0VVRxuce7gFxhKa2YkAyCbA7KV5soi2XrUn/J8m+
	hzBStantdY+ZoWiLImydET58jp62SxREXi7hGi2aWx5Bbx5bIGAKEJ3l6s8unGFq5qorXGVK3q1
	wxeJYjionXNP6KyrFk5W0Ejs03IE8iAcD1JzP8P/G48UO9DFktS7+RMq/2CK6rA4c7UV2fQpvi2
	PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Dec 2024 07:30:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114589

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.6.9.bb => python3-coverage_7.6.10.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.6.9.bb => python3-coverage_7.6.10.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.6.9.bb b/meta-python/recipes-devtools/python/python3-coverage_7.6.10.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.6.9.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.6.10.bb
index c5ad72b5bf..b5af7f3efa 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.6.9.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.6.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "4a8d8977b0c6ef5aeadcb644da9e69ae0dcfe66ec7f368c89c72e058bd71164d"
+SRC_URI[sha256sum] = "7fb105327c8f8f0682e29843e2ff96af9dcbe5bab8eeb4b398c6a33a16d80a23"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


