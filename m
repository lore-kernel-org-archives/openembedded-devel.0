Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C881C4345F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:53 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.6691.1714628986112840832
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=FUYCA4fv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628987; x=1746164987;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jePOSk32uKKmLKGgwut5/tOQLaHsZws2XBrKLilDoS4=;
  b=FUYCA4fv3KqJTbJhblhJ6OXNjB46lm01Zo0JjhEK9aumLqJYoDIxNZP0
   VGbWihGqXFQX/IzKag0MZG93n6Kp0FMuDQL57XbItgdykZtguaP0fMC+y
   R7MOUlsaS+HBKqdPRcUkdcExzbSN1XlEVSqB39SIci6cxN9wQZfRQHj9F
   keR8SkeBspNpADwi6yAz2lBW/7PFNchESTBYzkgA5S6Wh9JPYFGLWhyB8
   Vkg2KZOBoPr8720Gbq/7GOV3uKtYykv3YiS00AkFhdlNF1NU+5jZWJsmJ
   0efgdoM4BRA8yFjQy05or6GIJNqvb+2lNTWtwFDrofCOdLZjBGW8ee6QG
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="157231724"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="157231724"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:28 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id B2EB6E8E7B
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:25 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id E204BFCEC9
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:24 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 56C7B217354
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:24 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 051DD1A0002;
	Thu,  2 May 2024 13:49:23 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 10/30] python3-imageio: upgrade 2.34.0 -> 2.34.1
Date: Thu,  2 May 2024 10:48:09 -0400
Message-Id: <20240502144829.241208-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-3.354400-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mrTfK5j0EZbytH8jOVX4Ixthti
	hBeM13D+4CtjYmQpb2kF1Ec/oUIRlVpCIuRr0RxKTuctSpiuWyWu2GmdldmiUGAN6i+va16uBqd
	FRjHdIbhbJcQH3furV3k48PxckV+kHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5v0p
	ymcPceVkAnCtcZLnN829fVdukMXFgvxSeQiCi4Web/nHP+iPjsF7FYr5VwYClLlumtVEM6VvJAI
	ltmrGUNRbxDNI08qLRbjBuldNvkMkoq97WSHdFjfupJaud1uZCfRs6uIbkFVw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110238

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix bug of #1068 that getattr cannot get attribute with index directly
- Update pyav.py
- Trivial typo fixes

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-imageio_2.34.0.bb => python3-imageio_2.34.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-imageio_2.34.0.bb => python3-imageio_2.34.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb b/meta-python/recipes-devtools/python/python3-imageio_2.34.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb
rename to meta-python/recipes-devtools/python/python3-imageio_2.34.1.bb
index e38d69440..45772ef8e 100644
--- a/meta-python/recipes-devtools/python/python3-imageio_2.34.0.bb
+++ b/meta-python/recipes-devtools/python/python3-imageio_2.34.1.bb
@@ -5,7 +5,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=24cb9a367a9e641b459a01c4d15256ba"
 
-SRC_URI[sha256sum] = "ae9732e10acf807a22c389aef193f42215718e16bd06eed0c5bb57e1034a4d53"
+SRC_URI[sha256sum] = "f13eb76e4922f936ac4a7fec77ce8a783e63b93543d4ea3e40793a6cabd9ac7d"
 
 inherit pypi setuptools3
 
-- 
2.34.1


