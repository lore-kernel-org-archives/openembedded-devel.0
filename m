Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAA2FC001E0
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:36:29 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.116340.1698050185854319031
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:36:26 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="125178066"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="125178066"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:36:23 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id AF91ADDC77
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:36:21 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id E7129D531C
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:36:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2B78A6C9F5;
	Mon, 23 Oct 2023 17:36:20 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-coverage: upgrade 7.3.1 -> 7.3.2
Date: Mon, 23 Oct 2023 16:36:07 +0800
Message-Id: <1698050167-25206-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10--4.230000-10.000000
X-TMASE-MatchedRID: 51ABSdwnBXSjz0nOeth/yUIIxwDaU5mrlKvhkP88iXTBDbID4I3g4Qwb
	B6fWQkqsYOX5jEqat/B1YH+ohjwCABxaKzlXbEWlCtzGvPCy/m4xXH/dlhvLv3l7KG7hOkirmUt
	rKKwldD7gK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJRSLgSFq3TnjEd+K6O5Nt52aSH
	WZfVWTJ3p5QGOMb8EgLmth8cTQ473lRxm3A2wKuhRFJJyf5BJeGEkIgdGU7nX6C0ePs7A07aLm7
	9W+wVodHMTu3RbUqlqj7nvXImYHeg27SHBzllpRxRP7AZERn6dWg62tp9y0QAgLsZoky9YhITl6
	XHNhAuk+gTpK/nPVDg63TKxcCoOZ8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4AEOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105656

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-The coverage lcov command ignored the [report] exclude_lines and [report]
 exclude_also settings (issue 1684).
-Fix error that SQLite will create journal files alongside the coverage.py
 database files.
-On Python 3.12+, we now disable SQLite writing journal files, which should be
 a little faster.
-The new 3.12 soft keyword type is properly bolded in HTML reports.
-Removed the "fullcoverage" feature used by CPython to measure the coverage of
 early-imported standard library modules. CPython stopped using it in 2021,
 and it stopped working completely in Python 3.13.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.3.1.bb => python3-coverage_7.3.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.3.1.bb => python3-coverage_7.3.2.bb} (83%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.3.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.3.2.bb
similarity index 83%
rename from meta-python/recipes-devtools/python/python3-coverage_7.3.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.3.2.bb
index 636b7377a3..12496b03d4 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.3.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.3.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "6cb7fe1581deb67b782c153136541e20901aa312ceedaf1467dcb35255787952"
+SRC_URI[sha256sum] = "be32ad29341b0170e795ca590e1c07e81fc061cb5b10c74ce7203491484404ef"
 
 inherit pypi setuptools3
 
-- 
2.34.1


