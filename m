Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F56CF64A6
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 07:43:59 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.49301.1727682229480890415
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Sep 2024 00:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VlJuAwWv;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1727682229; x=1759218229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/B94ceMxkKNavuQWOLg7vJHwdjfitvwneZbKRct/LYc=;
  b=VlJuAwWvGAAs+09hCWWKxDqCuvmejxnFSDNjfR8xzLzfj2V9LoLScai1
   rSVdr4JfH0CVLKSdUJYiW0HmG3xsUfF/Mt/nnTopPcFRQCQjhmF8viq3x
   dikLG1jiF8OPV1f3mgMLcWdzson9prbtkbDY9n7pCxxBKA/CfuK/EXNYb
   2CL+3GnMJPLerU3YbRrKlo52lpfs6dfpC1o9TROWuArdFD5giPo7jlob4
   05w9XFO47GGfg39e+gZW62qNlxuXXBYqRPZ4wFuNfY9Z9uX6uYEio3wWj
   F+2wKMp6as6ZOVN8XlLzbbkkKiaYyQZ/azp3mrHM7gkjA7syJLK4GuIND
   w==;
X-CSE-ConnectionGUID: L02jAX4HSOWbJzhDewaXhA==
X-CSE-MsgGUID: OwOBH6zXRb+VkaogwpzwWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="163553685"
X-IronPort-AV: E=Sophos;i="6.11,165,1725289200"; 
   d="scan'208";a="163553685"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 16:43:47 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 60022D2AAF
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:45 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id DAF949EF47
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:43 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 71DF720076D01
	for <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 16:43:43 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 243181A000A;
	Mon, 30 Sep 2024 15:43:43 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/40] python3-greenlet: upgrade 3.1.0 -> 3.1.1
Date: Mon, 30 Sep 2024 15:42:46 +0800
Message-Id: <1727682185-12664-21-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
References: <1727682185-12664-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28696.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28696.005
X-TMASE-Result: 10-1.896600-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbys/d0QOA4TCLzBX
	Xb/qS2636GicUJauF4QczB+65IerA+SG32/q3ytjA9lly13c/gHVy4hHC3/gyLKw8Hx0EGitcqf
	oMGP+CwQi+t+0AiFaYnp5g9gYJWDLeBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNclmSii/L8LkGOiVt32fIK7UV9PUBXfbaMy1Sf381AHyaidGtXGnIHGEA/hNMAO0Z906o
	Ub1Oa+D42yDfT/Y4WUiMLzcJUaQl/zs1/e9oUcoU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Sep 2024 07:43:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112579

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fix crashes on 32-bit PPC Linux.
- Remove unnecessary logging sometimes during interpreter shutdown.
- Fix some crashes on 32-bit PPC MacOS.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-greenlet_3.1.0.bb => python3-greenlet_3.1.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-greenlet_3.1.0.bb => python3-greenlet_3.1.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb b/meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb
rename to meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb
index 11e8a76c8..c7a38b9a1 100644
--- a/meta-python/recipes-devtools/python/python3-greenlet_3.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-greenlet_3.1.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT & PSF-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=e95668d68e4329085c7ab3535e6a7aee \
                     file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
 
-SRC_URI[sha256sum] = "b395121e9bbe8d02a750886f108d540abe66075e61e22f7353d9acb0b81be0f0"
+SRC_URI[sha256sum] = "4ce3ac6cdb6adf7946475d7ef31777c26d94bccc377e070a7986bd2d5c515467"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


