Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E251BC48BC3
	for <webhook@archiver.kernel.org>; Wed, 21 Feb 2024 08:19:35 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.8711.1708503573389044572
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 Feb 2024 00:19:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LbZcQM+G;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708503573; x=1740039573;
  h=from:to:cc:subject:date:message-id;
  bh=9C0aBKr3552HtqaeRLng9G8kBEshxHda2BIw2mkvNgc=;
  b=LbZcQM+GJ++rBV7agtKfzU/MljGrnI+scoB+tj4GwdYQeaD0taOn/7SK
   5w2anbfwEnLBGgv+QrASapJ1C/oRhuEI99G/myNoCXGmxKr6WR2se/hRn
   TizgqROg2wry6ZMi6gRGR2EgOSlm4ADpPyfLRjqdyWkQBJ4ig0resx5nP
   xUAOLqIwM2arorphhx3H3qV6NsB+tKd7K6JLxbtDIJ9ITO4LgT4QPtWbo
   5zxshptDlN8Njaf/e43XHHv9ZNpkqKvgcNccMePAIqMeJYYnzbtqjWe8p
   ZZPqV1jE2zB7SqCEmwkp+MJS6l8PTEn85/5Z63k2rLetlvQVI1+wP5VnH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="128798051"
X-IronPort-AV: E=Sophos;i="6.06,175,1705330800"; 
   d="scan'208";a="128798051"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2024 17:19:30 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id D8241134946
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id D954ED5304
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 590602B3039
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 17:19:27 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id E00FD1A006B;
	Wed, 21 Feb 2024 16:19:26 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 1/4] python3-google-auth: upgrade 2.27.0 -> 2.28.0
Date: Wed, 21 Feb 2024 16:19:16 +0800
Message-Id: <1708503559-1895-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28204.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28204.005
X-TMASE-Result: 10--4.052800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrcV3n4J/0zUMyiHqxwIX2MSIG
	mHyXttjuOxmmd++ze7DCmUj96YjOlwSSMyiuqBkeP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW5tMXimGWsZZAYUFsN5WfiFOwTo9ZXISSzdCok3ibXlQX0tCKdnhB58I/9UW5M5dRNp7q
	EhmmPgy46HM5rqDwqtIA79p9MTM9EjDy5AvHqeSbFN/ueZb1F09dWwl6DMPF9FaLhgpKn/iTblM
	fMWlYG+hA4n1wR2st+emdWwS+VXIZCp0VwOUF/sHSbhGbmGylXFJK7yLnZRGZdO3Q67ImL8gi4R
	Uz90EQwG2MApbv6odw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 Feb 2024 08:19:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108959

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
-Adding universe domain support for downscroped credentials
-Change log level to debug for return_none_for_not_found_error
-Make requests import conditional for gce universe domain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-google-auth_2.27.0.bb => python3-google-auth_2.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-google-auth_2.27.0.bb => python3-google-auth_2.28.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb b/meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
rename to meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
index 79c9291a1..5799db43b 100644
--- a/meta-python/recipes-devtools/python/python3-google-auth_2.27.0.bb
+++ b/meta-python/recipes-devtools/python/python3-google-auth_2.28.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "e863a56ccc2d8efa83df7a80272601e43487fa9a728a376205c86c26aaefa821"
+SRC_URI[sha256sum] = "3cfc1b6e4e64797584fb53fc9bd0b7afa9b7c0dba2004fa7dcc9349e58cc3195"
 
 RDEPENDS:${PN} += "\
     python3-asyncio \
-- 
2.34.1


