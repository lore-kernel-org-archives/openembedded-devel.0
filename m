Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1528DE77198
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 09:27:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.30366.1735032446391206408
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 01:27:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b0angqGS;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1735032446; x=1766568446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=S2Ov0dhXKNJ2WNqqD5LnUuTXAMWE9V/Cw8rIQmyfkBA=;
  b=b0angqGSfE0xZ9vceJLvf4umMO74l8s4jguLkttVu98dOVLAvHcdYeV/
   +wEOGl3XVz93BvsJOk8UU6KObT5Z8m19v99ceqj3x3SxGvUpcn0Revh+b
   FoU4MQZPiMSOyo2rLmGm4PGJMWpVG7vWaE4KHjcfMMK5VJee5LTUUp3nn
   6KJUJ4ZxR+D/gs98qEIvvW/R9Qvb6wQCGxenPWxCmB6xbFrhSpvDXKaAe
   9T6CnY3MaeldL/hjb8O6erfR2ffB/aabkLjhL2iwsaVY9oBpg8hvrZvT4
   9EMKTGtMbz+TOkLxvWKLqz+f7JAw4DICGl/yUpOkdhl0acYVA9zkuw9f2
   g==;
X-CSE-ConnectionGUID: RmYGXd2OSkOewy/+E69CaQ==
X-CSE-MsgGUID: rT81VnDuSGOL/yOQTb0onw==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="173157104"
X-IronPort-AV: E=Sophos;i="6.12,259,1728918000"; 
   d="scan'208";a="173157104"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:27:24 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B86DDBB84
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 0D8ACD5B40
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id A4AE06B4DF
	for <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 18:27:21 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4DFCD1A006C;
	Tue, 24 Dec 2024 17:27:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/67] python3-httpx: upgrade 0.28.0 -> 0.28.1
Date: Tue, 24 Dec 2024 17:26:28 +0800
Message-Id: <1735032421-13513-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
References: <1735032421-13513-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28878.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28878.006
X-TMASE-Result: 10--0.088600-10.000000
X-TMASE-MatchedRID: S9L8qTrmXfGjz0nOeth/yUIIxwDaU5mrTfK5j0EZbysZRMY3EvICKr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3FCedixYXzOr/wa
	50HJmOITi8zVgXoAltuJ5hXsnxp7jC24oEZ6SpSkgbhiVsIMQKx7KERNgzExGWHgkDGE3BciKhU
	lzS0I87TT0Qoq5zBNxzitnrlLEtMVltt0pt4RbzkN90KPrxrFTH5vDNyovJyjbSRxOk8SVmMgFz
	nx0/C9ciB6mlDKe1V7S/yytHeCN9GXv4CQeNUk7G6qTOwq/n71+3BndfXUhXQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 09:27:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114510

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  Fix SSL case where verify=False together with client side certificates.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-httpx_0.28.0.bb => python3-httpx_0.28.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-httpx_0.28.0.bb => python3-httpx_0.28.1.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-httpx_0.28.0.bb b/meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-httpx_0.28.0.bb
rename to meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb
index 2b8c809c08..fc41d7d2b2 100644
--- a/meta-python/recipes-devtools/python/python3-httpx_0.28.0.bb
+++ b/meta-python/recipes-devtools/python/python3-httpx_0.28.1.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=c624803bdf6fc1c4ce39f5ae11d7bd05"
 
 inherit pypi python_hatchling
 
-SRC_URI[sha256sum] = "0858d3bab51ba7e386637f22a61d8ccddaeec5f3fe4209da3a6168dbb91573e0"
+SRC_URI[sha256sum] = "75e98c5f16b0f35b567856f597f06ff2270a374470a5c2392242528e3e3e42fc"
 
 DEPENDS += "\
     python3-hatch-fancy-pypi-readme-native \
-- 
2.43.0


