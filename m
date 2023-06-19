Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D411C001B1
	for <webhook@archiver.kernel.org>; Mon, 19 Jun 2023 06:50:31 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.2314.1687157422040252285
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 18 Jun 2023 23:50:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10745"; a="120836490"
X-IronPort-AV: E=Sophos;i="6.00,254,1681138800"; 
   d="scan'208";a="120836490"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2023 15:50:28 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AC000DDC61
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:25 +0900 (JST)
Received: from aks-ab1.gw.nic.fujitsu.com (aks-ab1.gw.nic.fujitsu.com [192.51.207.11])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id DCBD9D94AC
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 15:50:24 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0B9B12FC7EDC;
	Mon, 19 Jun 2023 15:50:23 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pyproj: upgrade 3.5.0 -> 3.6.0
Date: Mon, 19 Jun 2023 14:48:21 +0800
Message-Id: <1687157308-17342-16-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
References: <1687157308-17342-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27700.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27700.005
X-TMASE-Result: 10--1.460100-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mrC//1TMV5chOfHrjLA9DhZhwz
	72zDzvkOPSx4k016vSWOYTH9s0ioWF9rUCoIumMEA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYragH2fa4K/a5UcZtwNsCroURSScn+QSXmVV1G+Ck2l7+gtHj7OwNO0X9r
	pBZuBDbRPFFlgXHWV6s7M1LittCtDoZnlZgG6Pi3jccb1GEmatjt5PJ6VDfcGlvm7mxn70KXTp/
	K0/KNOuBqBH3/bZz2ML7cQuETZ7rvIMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Jun 2023 06:50:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103370

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
 WHL: Wheels contain PROJ 9.2.1
 DEP: Minimum supported Python version 3.9
 ENH: Add CRS.to_2d()
 ENH: Added allow_superseded kwargs to TransformerGroup
 ENH: Added parameter output_axis_rule to CRS.to_wkt
 BUG: fix Geod.npts NaN handling
 MNT: Use pyproject.toml for project metadata

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyproj_3.5.0.bb => python3-pyproj_3.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.5.0.bb => python3-pyproj_3.6.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.6.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.6.0.bb
index 918911b66..d8708f5e7 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.5.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.6.0.bb
@@ -8,7 +8,7 @@ PYPI_PACKAGE = "pyproj"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "9859d1591c1863414d875ae0759e72c2cffc01ab989dc64137fbac572cc81bf6"
+SRC_URI[sha256sum] = "a5b111865b3f0f8b77b3983f2fbe4dd6248fc09d3730295949977c8dcd988062"
 
 RDEPENDS:${PN} = " \
     python3-certifi \
-- 
2.34.1


