Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71520C46CD3
	for <webhook@archiver.kernel.org>; Tue, 26 Dec 2023 07:31:30 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.76440.1703575880062992739
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Dec 2023 23:31:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10934"; a="124032496"
X-IronPort-AV: E=Sophos;i="6.04,304,1695654000"; 
   d="scan'208";a="124032496"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Dec 2023 16:31:18 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 58FE6E8BFC
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:31:15 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 7F9DED88D2
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:31:14 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0F14D6B350
	for <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 16:31:14 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id A3C3D1A0072;
	Tue, 26 Dec 2023 15:31:13 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-eventlet: upgrade 0.34.1 -> 0.34.2
Date: Tue, 26 Dec 2023 15:29:09 +0800
Message-Id: <1703575749-13330-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28080.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28080.006
X-TMASE-Result: 10-0.423400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr7EQ+aGl68cRYC5LPd7BvbVYM
	JR3dIrh2VLAa8KXwKt4Nyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG21vZ
	7s3YIVDJ6eUBjjG/BIHk48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w7AXl
	GciFpxwZPs5s4w0CDSCIq5f9ylcWVQnCWXHJOnUdmaQ98bT2hAavFoWrppt9JygXHQ/TDRlTI/I
	S8jFTbT/h6XRmSVNsWCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Dec 2023 07:31:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107799

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Allowing inheritance of GreenSSLSocket without overriding the __new_ method
* [bug] Fix broken API related to '__version__' removal
* [doc] Fix pypi broken link

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-eventlet_0.34.1.bb => python3-eventlet_0.34.2.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-eventlet_0.34.1.bb => python3-eventlet_0.34.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-eventlet_0.34.1.bb b/meta-python/recipes-devtools/python/python3-eventlet_0.34.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-eventlet_0.34.1.bb
rename to meta-python/recipes-devtools/python/python3-eventlet_0.34.2.bb
index cdd1784df..aa19d91d4 100644
--- a/meta-python/recipes-devtools/python/python3-eventlet_0.34.1.bb
+++ b/meta-python/recipes-devtools/python/python3-eventlet_0.34.2.bb
@@ -5,7 +5,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=56472ad6de4caf50e05332a34b66e778"
 
 SRC_URI += "${PYPI_SRC_URI}"
-SRC_URI[sha256sum] = "0087763f3ae18a571a5cc60fdd06ceb02fdb9f006693e9ee1e8e8044ae3b470b"
+SRC_URI[sha256sum] = "2115c7c6742e6893bf1347f82915572f8895c911cb5abaad4d3596a7daa847cc"
 
 inherit pypi setuptools3
 
-- 
2.34.1


