Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08472C001B0
	for <webhook@archiver.kernel.org>; Wed, 16 Aug 2023 01:49:46 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.152140.1692150582608741165
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Aug 2023 18:49:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="107669931"
X-IronPort-AV: E=Sophos;i="6.01,175,1684767600"; 
   d="scan'208,217";a="107669931"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 10:49:40 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3268FD3EA3
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:49:38 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 706FFCFBDE
	for <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 10:49:37 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.225.33])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 4612220076847;
	Wed, 16 Aug 2023 10:49:36 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-rich: upgrade 13.4.2 -> 13.5.2
Date: Wed, 16 Aug 2023 09:47:16 +0800
Message-Id: <1692150436-5875-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27816.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27816.003
X-TMASE-Result: 10--2.301300-10.000000
X-TMASE-MatchedRID: rofoCPeR2CGjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhs1Ir4NZzFmpgU
	Ly4zAbFBjYviYLsjKt5sMRoTsb0DYDblc6Gei4nlPPov5T+l6PFs3nDs8bPg3QMuv289VbCIEZu
	8+uPpk1fgK2NiZClvaQXURz+hQhGVWkIi5GvRHEpO5y1KmK5bJTZlY6a4lRLZYA3qL69rXq6GGD
	tbUGr1xfzHT2V5z8ObeTjw/FyRX6QfE8yM4pjsDwtuKBGekqUpnH7sbImOEBSgmXAdhmYav24ci
	KSi1RfI284tNi/g1Mg0juhWSpppU4Hfo+6TO3Qf0jpPBEFaNWI9AL+PD7iLHxcHqKyyXHonwOt5
	e8K+y7TsfZ9V6Q6rCZgvUoiYqGrVm457vI8IG8B/Y4nFsBWAdD6Qrn3xh/cy
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 16 Aug 2023 01:49:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104398

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
Fixed
--------
Fixed Text.expand_tab assertion error
Fix tilde character (~) not included in link regex when printing to console #3057
Fixed Text.expand_tabs not expanding spans.
Fixed TimeElapsedColumn from showing negative.
Fix for escaping strings with a trailing backslash #2987
Fixed exception in Markdown with partial table #3053
Fixed the HTML export template so that the <html> tag comes before the <head> tag #3021
Fixed issue with custom classes overwriting __eq__ #2875
Fix rich.pretty.install breakage in iPython #3013

Added
--------
Added Text.extend_style method.
Added Span.extend method.

Changed
----------
Text.tab_size now defaults to None to indicate that Console.tab_size should be used.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-rich_13.4.2.bb => python3-rich_13.5.2.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python-rich/{python3-rich_13.4.2.bb => python3-rich_13.5.2.bb} (85%)

diff --git a/meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb b/meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
similarity index 85%
rename from meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
rename to meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
index e7ddf70983..2c31a33751 100644
--- a/meta-python/recipes-extended/python-rich/python3-rich_13.4.2.bb
+++ b/meta-python/recipes-extended/python-rich/python3-rich_13.5.2.bb
@@ -8,7 +8,7 @@ LICENSE = "MIT"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b5f0b94fbc94f5ad9ae4efcf8a778303"
 
-SRC_URI[sha256sum] = "d653d6bccede5844304c605d5aac802c7cf9621efd700b46c7ec2b51ea914898"
+SRC_URI[sha256sum] = "fb9d6c0a0f643c99eed3875b5377a184132ba9be4d61516a55273d3554d75a39"
 
 inherit pypi python_poetry_core
 
-- 
2.34.1


