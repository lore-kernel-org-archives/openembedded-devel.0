Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28C1ED29F9D
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 06:31:34 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.40029.1730874683801793480
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 Nov 2024 22:31:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=glc0ncrU;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1730874684; x=1762410684;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=fD6OnKJmdEnJZo8VJWIo/asJ7ecjaaTKJD6IWau20cg=;
  b=glc0ncrUyQHdr48FUA9mFc0COV0wVZ+wJ8BFw/O0BsLHO8TezTm2Y6/c
   vEljkPWWcvdHYLWksqCOnS+C5a+M8YDV7zvpc02M45jkb5626ndczDBmj
   UcnuEbGL3Ybd8Pfrvgex/d+vWR0dkiNvJp1txDIzoUhi+hCezfJocCRiI
   PEJO1eu9E/MH3epudNkoOcOQs1QUOMSFdMaFACM+DcxXUYbhBUkexXKcK
   zeLlnmrIOKNRqkxPmw8OQZJxVYWDhx/z95NvrlxoNrz/f8Svq6GciBSI7
   CrYhvpNtIuqKDxMbImZm3auXI8jmtIiLKkl8Eop4Jgc4kAQjM0IJLoNGb
   A==;
X-CSE-ConnectionGUID: dt6x4LfySXmM2CT69vRhyg==
X-CSE-MsgGUID: 4RecK2YUQby+5HrG/UncQQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11247"; a="167636023"
X-IronPort-AV: E=Sophos;i="6.11,262,1725289200"; 
   d="scan'208";a="167636023"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2024 15:31:21 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 940BDDB3C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:19 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id D2FACD50F9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:18 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6F1CC6B5E9
	for <openembedded-devel@lists.openembedded.org>; Wed,  6 Nov 2024 15:31:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 17B591A000A;
	Wed,  6 Nov 2024 14:31:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/46] python3-grpcio-channelz: upgrade 1.66.2 -> 1.67.1
Date: Wed,  6 Nov 2024 14:30:37 +0800
Message-Id: <1730874660-2364-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
References: <1730874660-2364-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28778.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28778.005
X-TMASE-Result: 10-0.060600-10.000000
X-TMASE-MatchedRID: N88p3DLIqpCjz0nOeth/yQPZZctd3P4B1cuIRwt/4MiysPB8dBBorXKn
	6DBj/gsEIvrftAIhWmJXW6gM8Ys8CB8TzIzimOwPruuVAw9Gg4LEQdG7H66TyHEqm8QYBtMOJfH
	DU12zzKsXTGoL2VSy+qmw36fuOe4yoMy+8vpzZKENdgsSW2BM70wE9vc8YokdumG5hUbudYlgxS
	BKAQgWKEiarDwQRTpugr6lqxbIXlHC3tMwY3ma2xUDj+dgUQVyTE7Co9fKv3w=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Nov 2024 06:31:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113709

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.66.2.bb => python3-grpcio-channelz_1.67.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.66.2.bb => python3-grpcio-channelz_1.67.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.66.2.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.66.2.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb
index dce7737b2..23447d71e 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.66.2.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.67.1.bb
@@ -10,7 +10,7 @@ inherit pypi setuptools3
 DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 
-SRC_URI[sha256sum] = "4904c7837523436624895d9062694f290b7f33383b296a1ec7c497b6e4c7ed19"
+SRC_URI[sha256sum] = "a4ae742c9ca04327ae0eec43d7e5b96c9686b8fc24200ae0816a67ab18342710"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.34.1


