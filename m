Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187ACC2BA15
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:58:57 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.2440.1718161135058268311
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:58:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Lb3IR294;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1718161136; x=1749697136;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=zN8SGnfSQuZi6D22xhjJQRRoNrMmUNWXyUfg50awKoU=;
  b=Lb3IR2947IChKWPMJHuc2MK4BVRwgyn+QcAi9hJKxcdbbFqgPg/zB/xF
   mqUQFTKk4O/C1IqUwQYAUZgFFl8Az9Xu+iaItiTsH6DdGvHfMYeNEesLP
   Q0NjffDA4picNJABlYHEPzf53a0P+xsEFdpDKIGXdgtAauAeTujRfUAT6
   r9OLW3mOoctbKbNSvPUv/vipoeVJ/xUMhP9eFpmtfhBsgTJLFYVlS/E3B
   FB01M2Xhtgjh71VAPZ0S0ru/1BDaAiXAc9PamnRDL5cIFFrrsRApnqYkz
   6vBWJcEsZF53hlWfnxNxCeV5vwyg3SY4UUKeZoJzNigNaAIU6+MSTe9hd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="142194123"
X-IronPort-AV: E=Sophos;i="6.08,232,1712588400"; 
   d="scan'208";a="142194123"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2024 11:58:53 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E2C4ED801B
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:50 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B9D5D73C7
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:50 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C07F320071A06
	for <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 11:58:49 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CAC451A000C;
	Wed, 12 Jun 2024 10:58:48 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/43] python3-typeguard: upgrade 4.2.1 -> 4.3.0
Date: Wed, 12 Jun 2024 10:58:08 +0800
Message-Id: <1718161096-29710-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
References: <1718161096-29710-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28448.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28448.004
X-TMASE-Result: 10-1.076700-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrrOCEGIPhtwgc5SGKNk1CG5Ky
	Pf1j7t43tYdwot7bS60ScHHX0rLXBO1a16oqp8B1/HTKStsDGMJHNQ8CqEKO2MC5DTEMxpeQ7m0
	K7bkUDKINUccATRyd1KEfeQTpODV8eBzEkCCpnRmeAiCmPx4NwGmRqNBHmBveVDC1CbuJXmMqtq
	5d3cxkNX5zpKL4AeeTjK4JgT0cxjgWpyhJrInvHeomaELXCp0ktoQu1ZbQ6FJ8tZOrYIrUn8GnC
	uLUtlKSfhu74vfWoqGIWdiXrWoZtw3c16/xWjPxU8mdcvbI1h2S6jzjuXTm0MTMzICazP4UehYt
	aVdyxm8=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Jun 2024 02:58:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110873

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Added support for checking against static protocols
- Fixed some compatibility problems when running on Python 3.13
- Fixed test suite incompatibility with pytest 8.2
- Fixed pytest plugin crashing on pytest version older than v7.0.0 (even if it's just present)

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-typeguard_4.2.1.bb => python3-typeguard_4.3.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-typeguard_4.2.1.bb => python3-typeguard_4.3.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-typeguard_4.2.1.bb b/meta-python/recipes-devtools/python/python3-typeguard_4.3.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-typeguard_4.2.1.bb
rename to meta-python/recipes-devtools/python/python3-typeguard_4.3.0.bb
index e0e84df28..3f6acdd8e 100644
--- a/meta-python/recipes-devtools/python/python3-typeguard_4.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-typeguard_4.3.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://pypi.org/project/typeguard/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f0e423eea5c91e7aa21bdb70184b3e53"
 
-SRC_URI[sha256sum] = "c556a1b95948230510070ca53fa0341fb0964611bd05d598d87fb52115d65fee"
+SRC_URI[sha256sum] = "92ee6a0aec9135181eae6067ebd617fd9de8d75d714fb548728a4933b1dea651"
 
 inherit pypi python_setuptools_build_meta ptest
 
-- 
2.34.1


