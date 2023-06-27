Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40BBDC001DF
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 07:14:35 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.7510.1687850068123262092
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jun 2023 00:14:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10753"; a="122207989"
X-IronPort-AV: E=Sophos;i="6.01,161,1684767600"; 
   d="scan'208";a="122207989"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2023 16:14:26 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 3C0E6F076C
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:23 +0900 (JST)
Received: from aks-ab2.gw.nic.fujitsu.com (aks-ab2.gw.nic.fujitsu.com [192.51.207.12])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 5A9C5D5018
	for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 16:14:22 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by aks-ab2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7462A88D20;
	Tue, 27 Jun 2023 16:14:21 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-zeroconf: upgrade 0.68.0 -> 0.69.0
Date: Tue, 27 Jun 2023 15:12:18 +0800
Message-Id: <1687849939-19941-19-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
References: <1687849939-19941-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1408-9.0.0.1002-27716.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1408-9.0.1002-27716.005
X-TMASE-Result: 10--1.453500-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrTPe1tPWSpl02/UwdvFG5IsLc
	MUuTFJzB4J2Ri/tQHAINyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSz/0XMJYfpi/YX7AlQI2uSFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtjfuYXI6QdOiDFCClqNtMoV9ZDzTn/52/sy1kDoTiI/uQH7X0dBIRpE2qF
	peQL16H3hNDD2q4UcdoT2dRnU5Qa2+PDNVWilFGHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Jun 2023 07:14:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103612

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
 Cython3 support (#1190)
 Reorder incoming data handler to reduce overhead (#1189)
 Reduce debug logging overhead by adding missing checks to datagram_received

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-zeroconf_0.68.0.bb => python3-zeroconf_0.69.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-zeroconf_0.68.0.bb => python3-zeroconf_0.69.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-zeroconf_0.68.0.bb b/meta-python/recipes-devtools/python/python3-zeroconf_0.69.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-zeroconf_0.68.0.bb
rename to meta-python/recipes-devtools/python/python3-zeroconf_0.69.0.bb
index 93eebf1607..ed849f6546 100644
--- a/meta-python/recipes-devtools/python/python3-zeroconf_0.68.0.bb
+++ b/meta-python/recipes-devtools/python/python3-zeroconf_0.69.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/jstasiak/python-zeroconf"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://PKG-INFO;beginline=6;endline=6;md5=6517bdc8f2416f27ab725d4702f7aac3"
 
-SRC_URI[sha256sum] = "e5c05d4fe8d6ef2133af930a17b18e172f54650294b780f93bb6a42df3af1e0d"
+SRC_URI[sha256sum] = "c6520f39f718e6bd16a87e0a7711ff65acfbb11bbc9fabb6283506833e0c3c0f"
 
 inherit pypi setuptools3
 
-- 
2.34.1


