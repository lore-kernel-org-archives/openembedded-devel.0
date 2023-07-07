Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB9DFEB64D9
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 03:14:16 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.4900.1688699648883492827
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 06 Jul 2023 20:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="102453339"
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="102453339"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 12:14:13 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4C4BED29E6
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:11 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 7739CD9A76
	for <openembedded-devel@lists.openembedded.org>; Fri,  7 Jul 2023 12:14:10 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 8C611881D9;
	Fri,  7 Jul 2023 12:14:09 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-elementpath: upgrade 4.1.3 -> 4.1.4
Date: Fri,  7 Jul 2023 11:13:39 +0800
Message-Id: <1688699627-2519-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
References: <1688699627-2519-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27736.002
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27736.002
X-TMASE-Result: 10--0.309500-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbysli8Y5a0svLwTX
	Zt9mBup+4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyUUi4Ehat054xHfiujuTbed1vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5XBV
	u9NrnMcIvOCNoZjVwbbhcs1mpabxpTvml5J2o/f1ns52NdF+nqvjftpBiHiGFqIo5yD4Gk6fUSP
	sadypekmJJAsgbdDYiCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 07 Jul 2023 03:14:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103699

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Fix select of prefixed names (issue #68)
 Fix zero length xs:base64Binary (pull request #69)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_4.1.3.bb => python3-elementpath_4.1.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_4.1.3.bb => python3-elementpath_4.1.4.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_4.1.3.bb b/meta-python/recipes-devtools/python/python3-elementpath_4.1.4.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_4.1.3.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_4.1.4.bb
index 2dc8af7cc9..60c54f0193 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_4.1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_4.1.4.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "1ce703e1380ef12efe1b6aeb1927c0f3add0e4f77950d89d9d44136d6676794b"
+SRC_URI[sha256sum] = "f991c42ff66fa06e219141ccf65890261e6635b448e7d4c2d8b62dc5bf1de9e8"
 
 PYPI_PACKAGE = "elementpath"
 inherit pypi setuptools3
-- 
2.34.1


