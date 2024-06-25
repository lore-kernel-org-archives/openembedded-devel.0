Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE100C3065A
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:25 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.167237.1719305844236029131
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=W5X08eRE;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305844; x=1750841844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=X8D3InyD37hWxlMrFLq16YDokr9KAt5vIlbdlh5Gxkk=;
  b=W5X08eREaLfaGqtWm0qmFxBunIv05sxlwDEnRjn61elMO26KLQ/QaNCd
   MfM9C4P8Yb6VJ6PKXhq6afqJZhoyese871hApmmLUq8jWqLZ7BGDPtfmR
   AZ68S93O2viyCzppObVJJFN+AKk4sAWEwmvjILMW1vJovVALWnWdmaSpH
   ng0Adq1h7VzoR8QkdabZ5hqCO6lw0vvdemGI6qMdD2PhOK6cTnYz9IqSU
   X7r5+XoN9eV9SqYG5bo99uwFMrbJAgw2yycwkoJwFZ+LK+gm3sD2HKx8y
   OywA4TkXNbFwER6An0zg/PnWqspCzhWwwVelsSGJl8hyGOGhS6Ja0SO32
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="153145179"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="153145179"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:22 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 0474DD4C26
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:20 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4BCFFD52A2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id CF27EE2B14
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 791C21A000C;
	Tue, 25 Jun 2024 16:57:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 34/57] python3-langtable: upgrade 0.0.66 -> 0.0.67
Date: Tue, 25 Jun 2024 16:56:07 +0800
Message-Id: <1719305790-11484-34-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10-2.666800-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrF4r8H5YrEqy/TXZTGyOYaG54
	wXAMmy/8Mcx2oVpjkHZbfyRJXs6an5k2j/A3wQwFOyPKih4RyshUENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmifnzmcpBzOru5x7uAXGEprZiQDIJsDspXmyiLZetSf8mfop
	0ytGwvXiq2rl3dzGQ1qybclfI0aXY5ePUyaUYHm8I6UfjSTdND5yT8HmWtX7v2cOreFMnGO4pwl
	M6lNXRJ5/OG0AWuXEq3D4pMfJ3ITp09HXQUxmX0gle0oHY5RttTyZ1y9sjWHZLqPOO5dObQxMzM
	gJrM/hR6Fi1pV3LGbw==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111047

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
* Add tool to check which languages, scripts, and territories available in CLDR are missing in langtable
* Add all missing scripts and languages: yrl, xnr, wbp, vmw, vec, trw, trv, skr,
  sdh, quc, pis, pcm, myv, mus, moh, mic, mhn, ltg, lmo, lld, kxv, kpe, kgp, ken,
  kcg, kaj, jbo, gaa, frr, csw, cic, cho, ceb, cch, cad, bss, blt, Tavt blo, bgn,
  bgc, rhg, Rohg hnj, Hmnp Shaw, Dsrt bew, bal, arn, apc, ann, scn
* Drop Python < 3 support (using pyupgrade --py3-plus langtable.py)
* Fix some ruff and pylint warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.66.bb => python3-langtable_0.0.67.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.66.bb => python3-langtable_0.0.67.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.66.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.67.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.66.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.67.bb
index 26a4f1921..fe8dd0a0f 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.66.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.67.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "0679e9014aa25916a8184c7bb5082fe983a661ab958d37f5fb75461abf5fb342"
+SRC_URI[sha256sum] = "04c81012b5a9f018567a480bff0b7228e8db95e86fea0eb3d45894d8b8b80e64"
 
 inherit pypi setuptools3 python3native
 
-- 
2.34.1


