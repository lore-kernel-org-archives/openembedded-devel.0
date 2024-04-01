Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4B97CD1296
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 14:35:32 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.web11.38888.1711982124485191814
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Apr 2024 07:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Wg36mT2J;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1711982124; x=1743518124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=5eIKPcX/jezPqaS450fj5QgtSPaH+wW94hbSuHjNlCo=;
  b=Wg36mT2J3aHJ6QklxpYdxwerI/d2t2pr2w4zkqwtjGFw1KVQp/XaHymd
   9wWH3RQLP+4ZUz1SbT8dvsyBmgGMDPTkZ8cF1COc8dlR03u+4i1bfjxQn
   K8I6foxTPBi/0tWUSYOwVLVwnl3lc6dWsrLI9x0uMhK3Wyy66029p3i4I
   tNTA8h5oMx4glyJ4gl9gqqluhXqQ/ZYsdtxMUDQ0nwBvwDGMCk4PGk+YH
   Akx94ehzq81KGj5m38QDj5KcETUrHWL/cD1rUD9PfMtP9Y1HjDr2INGQK
   KFO3W9xjxgeaAmETdqnRLaDBXVSp+YvCZRGjT2/GRR/7fvnqcAZ5gO15H
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="142245097"
X-IronPort-AV: E=Sophos;i="6.07,172,1708354800"; 
   d="scan'208";a="142245097"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 23:35:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 5093CC6808
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 965A0D5006
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 2BD791EBBEB
	for <openembedded-devel@lists.openembedded.org>; Mon,  1 Apr 2024 23:35:19 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.167.225.33])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D6D401A000A;
	Mon,  1 Apr 2024 22:35:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [PATCH 14/47] python3-djangorestframework: upgrade 3.14.0 -> 3.15.1
Date: Mon,  1 Apr 2024 22:34:31 +0800
Message-Id: <1711982104-16711-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
References: <1711982104-16711-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28292.000
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28292.000
X-TMASE-Result: 10--3.006500-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyv5nlJilS5UkZgU
	Ly4zAbFBwCqHJHGt2iNDc4lSgrowpe/Ui0F8hu7QA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYgB/8cibO8IYRY1tl9vG/AY7Cl8sx4HBG1XgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibJ0RPnyOnrZIgnxDbTPgXgCmjnmxM92yx3dykXQPfSP++SaW2hgON9AGPu
	cHcYGDypz4xeiJWqhl5QcLboMWEqn3RnavHz/EdKim0KCn26ydLv5Eyr/YIrqsDhztRXZ9Cm+LY
	9A78UVCLPa6Os9XH3IQhTU20ySbR
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Apr 2024 14:35:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109714

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
-Fix SearchFilter handling of quoted and comma separated strings, when
 .get_search_terms is being called into by a custom class.
-Revert number of 3.15.0 issues which included unintended side-effects.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ramework_3.14.0.bb => python3-djangorestframework_3.15.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-djangorestframework_3.14.0.bb => python3-djangorestframework_3.15.1.bb} (79%)

diff --git a/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb b/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb
similarity index 79%
rename from meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb
index c39f37f7e..9515aa229 100644
--- a/meta-python/recipes-devtools/python/python3-djangorestframework_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-djangorestframework_3.15.1.bb
@@ -5,7 +5,7 @@ HOMEPAGE = "https://pypi.python.org/pypi/djangorestframework"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=7879a5a716147a784f7e524c9cf103c1"
 
-SRC_URI[sha256sum] = "579a333e6256b09489cbe0a067e66abe55c6595d8926be6b99423786334350c8"
+SRC_URI[sha256sum] = "f88fad74183dfc7144b2756d0d2ac716ea5b4c7c9840995ac3bfd8ec034333c1"
 
 PYPI_PACKAGE = "djangorestframework"
 
-- 
2.34.1


