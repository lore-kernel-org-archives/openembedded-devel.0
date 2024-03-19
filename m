Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6DC0C54E5D
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 05:46:46 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.8157.1710827200499274846
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Mar 2024 22:46:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mWoRAGBH;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1710827200; x=1742363200;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/KvUBc1OPRm6Q1M+LQrT1ikJ8tbWsEa8WKqQM/ZHzrs=;
  b=mWoRAGBHFS9jdqpxwfwS58+e1KdpV9pnj/IZMMCVVebOKt3utaVVIB2C
   erluQf19cq//mmD1DQd6NBNZxiMoaW1s+dd4HppsrgxA6W6KhJQCHzCuN
   XwYisDWNTuP5wHBf0NhdUVqN6udl7lVyns/UobAzztDRJ2MmdJQ2v2MmU
   w7a7fOU/jYmqMr7qov7rGyGs1d3aekLHQYvWSFm/6G2J3JSjglpYBFPnL
   o1aOdt/73pX8xwhP0OjpFkI4vkhwPCTfze+IADOC9tOqkm/o6Y7AO1abj
   UebOPiaeHFfAbXhthX3uMPZ2+/AwE27jM3V8YyAwT/FfYspZIVvGSrXj1
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="154544213"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; 
   d="scan'208";a="154544213"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2024 14:46:37 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id A2D42F2648
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:35 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D5CEBBF4B6
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7369A2009325C
	for <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 14:46:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 1CD8C1A006B;
	Tue, 19 Mar 2024 13:46:34 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/50] python3-eth-abi: upgrade 5.0.0 -> 5.0.1
Date: Tue, 19 Mar 2024 13:45:14 +0800
Message-Id: <1710827139-30056-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
References: <1710827139-30056-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.005
X-TMASE-Result: 10--2.368800-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/yUIIxwDaU5mreJmCRwMRpHO3Stk62MqiCBk+
	ZWK1ZVUWXa45Y5Hu1svrpnIVl2wOj8W51zD3Zy7XqhcdnP91eXGiGsyrScSFBzPJJylm6P+evqn
	FtM6Nq/L7tBxFpWhrycYoh/qEF/tVoYY7KoErjW8ReM8i8p3vgK7YaZ2V2aJQYA3qL69rXq4Gp0
	VGMd0huFslxAfd+6tXeTjw/FyRX6QfE8yM4pjsD67rlQMPRoOCxEHRux+uk8hxKpvEGAbTDjXpA
	lXFm2O5PSDFPVhhszuqIVp5ZHzV2WXN1YmtlcHD4lWYTve4dmH7YMIzyP/89RKaakLjpny5S/Ng
	iLJEWq4hNMuAKAEB6IK+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Mar 2024 05:46:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109443

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-During decoding, verify all pointers in arrays and tuples point to a valid location in the payload
-Fix memory leak warning in NodeVisitor and ABIRegistry
-Clear mypy misc-type errors and add top-level py.typed file back

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eth-abi_5.0.0.bb => python3-eth-abi_5.0.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eth-abi_5.0.0.bb => python3-eth-abi_5.0.1.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-eth-abi_5.0.0.bb b/meta-python/recipes-devtools/python/python3-eth-abi_5.0.1.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-eth-abi_5.0.0.bb
rename to meta-python/recipes-devtools/python/python3-eth-abi_5.0.1.bb
index 50b1340cb..a56296188 100644
--- a/meta-python/recipes-devtools/python/python3-eth-abi_5.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-eth-abi_5.0.1.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=731f4de9c79bfeba6d8d55f83d0d2423"
 
-SRC_URI[sha256sum] = "89c4454d794d9ed92ad5cb2794698c5cee6b7b3ca6009187d0e282adc7f9b6dc"
+SRC_URI[sha256sum] = "e9425110c6120c585c9f0db2e8a33d76c4b886b148a65e68fc0035d3917a3b9c"
 
 PYPI_PACKAGE = "eth_abi"
 
-- 
2.34.1


