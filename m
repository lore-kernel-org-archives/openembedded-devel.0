Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C6EEC3065B
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.web10.13623.1719816261747094529
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=KDOyYCfw;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816265; x=1751352265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=uYeIeJk8ihhdXZ+sr1KAQytqByPgoOrHevD1hWokt9g=;
  b=KDOyYCfwzFepeioWANEIGQ2Ck8K0EUY1ZwJLqTsysNvw3ogWolj8liiC
   ubJOgUmtns1F02PcZT5b3y6ksQ3f4Z79idv75VMEDmJr8tCQMc1pp7el4
   wj/WN+L/AzfZCgM6OkSdiL7p2FhSLWeZQYpQ9NhaRt4cpMPtjturm7BI3
   9FOFAdQ7brMdyh9z60N3HXVk6i89J0JaD7HSkKcLQSPYgMAUjUheC52nL
   TEzMVRMfuM5Oq43t0E9j2kBkPNDla6x1TsGOXgCIGCG0V58FC0n96olUW
   8T+HWf+08I1Mt3b4Y7lsb0KErpPIqOzm2Cks/UDkaM6iJEiXftdP5sZs4
   A==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="144534147"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="144534147"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:24 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 4248DCC145
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:21 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8AFF7D748C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:20 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 25A6320071A33
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:20 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CA1081A000C;
	Mon,  1 Jul 2024 14:44:19 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/25] python3-twine: upgrade 5.1.0 -> 5.1.1
Date: Mon,  1 Jul 2024 14:44:00 +0800
Message-Id: <1719816242-11839-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--2.125200-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrStGAgmKqWuVeGtGjUrjdVRT0
	wnfW2hksepwUk+McqyzCyV0uVqhurD13WcdbGR6QP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsFdF5UWZ5EPnab1YTHwntm+5x7uAXGEprZiQDIJsDspXmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZJGedW3Io19PWenQWF4iJ7ZF2g5skm1Zmw59Sv0hpKxP0JBT
	Hzv+yHfNUgdXaRVpbhbtqlTrrkeQMjgZGUeCMuayfEQ3RffYzFLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111192

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Resolve DeprecationWarnings when extracting twine metadata.
- Fix bug for Repository URLs with auth where the port was lost.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-twine_5.1.0.bb => python3-twine_5.1.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-twine_5.1.0.bb => python3-twine_5.1.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-twine_5.1.0.bb b/meta-python/recipes-devtools/python/python3-twine_5.1.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-twine_5.1.0.bb
rename to meta-python/recipes-devtools/python/python3-twine_5.1.1.bb
index 6a79d45d4..13ddc08cd 100644
--- a/meta-python/recipes-devtools/python/python3-twine_5.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-twine_5.1.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://twine.readthedocs.io/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3d1106b253a8d50dd82a4202a045b4c"
 
-SRC_URI[sha256sum] = "4d74770c88c4fcaf8134d2a6a9d863e40f08255ff7d8e2acb3cbbd57d25f6e9d"
+SRC_URI[sha256sum] = "9aa0825139c02b3434d913545c7b847a21c835e11597f5255842d457da2322db"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


