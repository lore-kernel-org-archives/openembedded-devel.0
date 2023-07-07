Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A5CCC001E0
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:27 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4900.1688699648883492827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="102453358"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="102453358"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:17 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 95955D29ED
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:15 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C8290BCB6D
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:14 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id DB1888802D;
	Fri,  7 Jul 2023 12:14:13 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-tox: upgrade 4.6.0 -> 4.6.3
Date: Fri,  7 Jul 2023 11:13:45 +0800
Message-Id: <1688699627-2519-20-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10-0.604100-10.000000
X-TMASE-MatchedRID: /gZnudouedqjz0nOeth/yUIIxwDaU5mryqyllX6UJItuS8Amg5D32XgS
	4GH/YNMVmwocgcRSx2GNfAPhvOdDMRLmJd2F/yFuP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsGzTRkAEe/aoeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe2hKvDc1vo2QC24oEZ6SpSmcfuxsiY4QFJjFoDeXFnNdj6fBWSvPJIomFMs04UMSRm6G3
	O/0ipxLBuW+hLLosnxHdxY7IV47xG3c5a87DPi1uTIDsI85biYLpo/sdhxi7ex9n1XpDqsJmC9S
	iJioatWbjnu8jwgbwH9jicWwFYB0PpCuffGH9zI=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103704

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Made issue template have less whitespace
Docs link of env var subs section to set_env
Removed duplicate text in bug report template
Ensure get_requires* hook is called before prepare_metadata*

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.6.0.bb => python3-tox_4.6.3.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.6.0.bb => python3-tox_4.6.3.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.6.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.6.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
index e83587528c..ed8fc38b2a 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.6.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.6.3.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "954f1f647f67f481d239a193288983242a6152b67503c4a56b19a4aafaa29736"
+SRC_URI[sha256sum] = "9e2c5091a117d03b583c57c4c40aecd068099c17d40520e7b165e85c19334534"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.34.1


