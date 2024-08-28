Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1CDCC54754
	for <webhook@archiver.kernel.org>; Wed, 28 Aug 2024 08:25:51 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web11.8719.1724833543924964378
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Aug 2024 01:25:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=l29yYhwY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1724833545; x=1756369545;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=DThyY76vxgvlk0JWXEcLvZDkhtUIEB+bXbc7rzD/ll4=;
  b=l29yYhwYZauUAEZedWYbePVk5VTFysOn8LAu9wOkmm6S1799JOBwvqoW
   2L5HXMH7JdrBuZeBNGVNCFsKT4PebE6bjV3TwwUkm4My2X3/iryHtk49A
   60+Dy/tnXpG+VdNBLrPnk59v++c1yw4wCOcOJ+uMyAV5Es7zJ5v29RdRl
   P14GIKsDCzkJ7tAR7lK8sUX967tkjhBe66ETE+JW1JKAW5bKoEqJp7AI1
   jyypd/B2kDLDklkMcCiCQzVez4785J/T3FFzGF8eYnGoYMw6A0+gfLciV
   HObyBcuGyrEB9GpfSxkU32OandlIpgkDUTU/Sr030bpbzfop1SFrNtdia
   Q==;
X-CSE-ConnectionGUID: BLJvhCbOQxGI07usWCCTbw==
X-CSE-MsgGUID: lfJSYyWqTiOslV4a0sboBw==
X-IronPort-AV: E=McAfee;i="6700,10204,11177"; a="171866130"
X-IronPort-AV: E=Sophos;i="6.10,182,1719846000"; 
   d="scan'208";a="171866130"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 17:25:43 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 74376D7AC5
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:40 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id AD45AE49CD
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:39 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 436C120079DEA
	for <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 17:25:39 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D00A11A0002;
	Wed, 28 Aug 2024 16:25:38 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/46] pamela: upgrade 1.1.0 -> 1.2.0
Date: Wed, 28 Aug 2024 16:24:53 +0800
Message-Id: <1724833525-2162-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
References: <1724833525-2162-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28624.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28624.006
X-TMASE-Result: 10--2.128200-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yXzmmMD/HXF+Sc4iQ7VD4M2U8ftiyKjZrdMj
	jwb9QfV2CC8aAmGeO6lV00+whwxVQy/7QU2czuUN194/5X9VfCwSrxWnE1VUiZjmdWmKHGLD4Yy
	coNpBJWDYgCp6bjAgaoAy6p60ZV62yA7duzCw6dLdB/CxWTRRu+rAZ8KTspSzBOAtAoKPLtBlSC
	JjfRNJSlvSoqB3znkTc3XsVCebQlY2/HHv06yJj07tyfwHGNgZelywTdvyHAkCSqyilUGbfMhy8
	eEu5u49iB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Aug 2024 08:25:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111992

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Version updated to 1.2.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{pamela_1.1.0.bb => pamela_1.2.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-python/recipes-devtools/python/{pamela_1.1.0.bb => pamela_1.2.0.bb} (56%)

diff --git a/meta-python/recipes-devtools/python/pamela_1.1.0.bb b/meta-python/recipes-devtools/python/pamela_1.2.0.bb
similarity index 56%
rename from meta-python/recipes-devtools/python/pamela_1.1.0.bb
rename to meta-python/recipes-devtools/python/pamela_1.2.0.bb
index 3573de551..ff87e187c 100644
--- a/meta-python/recipes-devtools/python/pamela_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/pamela_1.2.0.bb
@@ -1,8 +1,8 @@
 DESCRIPTION = "Pamela: yet another Python wrapper for PAM"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://PKG-INFO;md5=6b706db92112b8384848de3e5c6adaa3"
+LIC_FILES_CHKSUM = "file://PKG-INFO;md5=b5fa9af58a8076d81145be56b6801a2b"
 
-SRC_URI[sha256sum] = "d4b139fe600e192e176a2a368059207a6bffa0e7879879b13f4fcba0163481be"
+SRC_URI[sha256sum] = "0ea6e2a99dded8c7783a4a06f2d31f5bdcad894d79101e8f09322e387a34aacf"
 
 PYPI_PACKAGE = "pamela"
 
-- 
2.34.1


