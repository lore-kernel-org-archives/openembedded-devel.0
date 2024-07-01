Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11439C41513
	for <webhook@archiver.kernel.org>; Mon,  1 Jul 2024 06:44:33 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.13620.1719816256089043092
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Jun 2024 23:44:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TKic3Jaj;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719816266; x=1751352266;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=BhaguMAj5tywoL3BOS6KoYO5otPZF5Ddle54sFzpmz0=;
  b=TKic3Jajhwe/2B9j6lyOAdJCkkBkNgtwMwa9CuU6sohtbFhundmPtMI4
   fKtjtDfglquAACxizcHxfxrLPF3hUOmPmvJcrTzbmAYLg/WvUCawMXjd1
   YhYzmwWWfxGA+ED7Rnmc5KZMmSWx5odWv91CTBI2On4JHVHBl4Hfs/WeR
   76DWZ4qUA6g1esDjTowXpP0RtYbVeBDekqI8eXLT0wGPanUdVABIzLIf8
   xpmHTgyrx+v8bVVHotgHhs16ylpUv2lBkg5c38Fls6FUBuf0oofxlZ4gu
   FzE3UaDtrfyfMb4MdNU5ij7UP7IFwv56G8iUMVryTeXTvef+Rq0eFprAT
   g==;
X-IronPort-AV: E=McAfee;i="6700,10204,11119"; a="165585934"
X-IronPort-AV: E=Sophos;i="6.09,175,1716217200"; 
   d="scan'208";a="165585934"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2024 15:44:24 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id E23ADE852C
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 2A611D50BE
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id B0F1D6B4E5
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Jul 2024 15:44:21 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 60B7F1A000A;
	Mon,  1 Jul 2024 14:44:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 25/25] python3-web3: upgrade 6.19.0 -> 6.20.0
Date: Mon,  1 Jul 2024 14:44:02 +0800
Message-Id: <1719816242-11839-25-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
References: <1719816242-11839-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28494.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28494.005
X-TMASE-Result: 10--1.148600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrIF9l7eKb2JEgxiy2xJZXvdnl
	4sDURLJG5qqrM2RbgOANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w69jv
	ySwkkrFzBOFLPdyEOuSXuz3lmddMBbDdyF839IFliStpf4kK3L6JVXVPuqjtRvWXT0jzDSAguTl
	7Q1ZLOstXCsRnc9I5WCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Jul 2024 06:44:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111193

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Release notes page name changed from releases to release_notes
- Provide explicit __all__ exports for providers in web3/providers/__init__.py;
  update web3/__init__.py to include all provider classes including base classes.
- Created ABIError type in the web3.types module and added as a valid type of ABIElement.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-web3_6.19.0.bb => python3-web3_6.20.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-web3_6.19.0.bb => python3-web3_6.20.0.bb} (87%)

diff --git a/meta-python/recipes-devtools/python/python3-web3_6.19.0.bb b/meta-python/recipes-devtools/python/python3-web3_6.20.0.bb
similarity index 87%
rename from meta-python/recipes-devtools/python/python3-web3_6.19.0.bb
rename to meta-python/recipes-devtools/python/python3-web3_6.20.0.bb
index 7f06ca500..a5a45f3b4 100644
--- a/meta-python/recipes-devtools/python/python3-web3_6.19.0.bb
+++ b/meta-python/recipes-devtools/python/python3-web3_6.20.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=373fede350846fdffd23648fba504635"
 
-SRC_URI[sha256sum] = "d27fbd4ac5aa70d0e0c516bd3e3b802fbe74bc159b407c34052d9301b400f757"
+SRC_URI[sha256sum] = "b04725517502cad4f15e39356eaf7c4fcb0127c7728f83eec8cbafb5b6455f33"
 
 inherit pypi setuptools3
 
-- 
2.34.1


