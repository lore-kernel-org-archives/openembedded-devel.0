Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F43FC00528
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:25 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.7461.1687850055949722603
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:22 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="110071681"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="110071681"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:20 +0900
Received: from yto-m4.gw.nic.fujitsu.com (yto-nat-yto-m4.gw.nic.fujitsu.com [192.168.83.67])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id A6E12D3EAC
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:18 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by yto-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E2E7ED3F13
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:17 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 14ACE88D20;
	Tue, 27 Jun 2023 16:14:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-natsort: upgrade 8.3.1 -> 8.4.0
Date: Tue, 27 Jun 2023 15:12:11 +0800
Message-Id: <1687849939-19941-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--1.453600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrcaIQZvUdTzkli8Y5a0svL9uO
	a8MT7ojH4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyU2ZWOmuJUS2WAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5Zmv
	0WyXTNYYxJFmkdM3D8nccZay5UZSVhGu1fUrlNIS2lQheri08RVJ0NpRMGLwnRDg9oeTuk1isHU
	tQHe03tCEq49cCzZHKCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103603

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- The changelog now only explictly exists in the repository (issue #162)
- Inputs with spaces near adjascent to the extension are now sorted correctly
  for os_sorted on Windows (issues #165 and #166)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-natsort_8.3.1.bb => python3-natsort_8.4.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-natsort_8.3.1.bb => python3-natsort_8.4.0.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-natsort_8.3.1.bb b/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-natsort_8.3.1.bb
rename to meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
index baf94caa80..206e322fbd 100644
--- a/meta-python/recipes-devtools/python/python3-natsort_8.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-natsort_8.4.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=d32431d1b650010945da4e078011c8fa"
 
 PYPI_PACKAGE = "natsort"
-SRC_URI[sha256sum] = "517595492dde570a4fd6b6a76f644440c1ba51e2338c8a671d7f0475fda8f9fd"
+SRC_URI[sha256sum] = "45312c4a0e5507593da193dedd04abb1469253b601ecaf63445ad80f0a1ea581"
 
 inherit pypi setuptools3
 
-- 
2.34.1


