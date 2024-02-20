Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 698F3C5478A
	for <webhook@archiver.kernel.org>; Tue, 20 Feb 2024 08:55:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web10.9268.1708419300264840561
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 20 Feb 2024 00:55:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=j497vb2N;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708419300; x=1739955300;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=QouMZANfeeMfgyG+k/aTpPJDal0aiilynQYmAhzBLAo=;
  b=j497vb2NhS4C2zeU+D2vCXCKGweFioMujbM/wOQ19oklVJm5XcXe7THc
   XyqFWT33ifEK5xtHeuDolGL7Ej/95F5bbfV/P8oj+rKj2i+noemPZxe0m
   HfMWM2jiygI5wiMT2FUWd5pWZyzce4Zstsot495v3ORWM1hpJahRwrp80
   w3idqfFQF/ODcSNf19FSc1LEIMwiB7fc45Yn58FWgJgpOH9vJIQpABLZ/
   MFQ+b7oPn+JiIDRyluRYSqrB5BlM1dSJLx3N/gnY/tQ95NF15Sc0m0QxE
   5AS371W5Ciy4hBsttXglSbyvjoB0hZ02sbF5G23HBsUQA4dNf8l5ex2NJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="138346885"
X-IronPort-AV: E=Sophos;i="6.06,172,1705330800"; 
   d="scan'208";a="138346885"
Received: from unknown (HELO oym-r4.gw.nic.fujitsu.com) ([210.162.30.92])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2024 17:54:57 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id B5D634DA508
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id F1EE8D4BF6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 937CB6B8C6
	for <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 17:54:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 4369F1A006B;
	Tue, 20 Feb 2024 16:54:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/26] python3-langtable: upgrade 0.0.64 -> 0.0.65
Date: Tue, 20 Feb 2024 16:54:27 +0800
Message-Id: <1708419281-26047-12-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
References: <1708419281-26047-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28202.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28202.006
X-TMASE-Result: 10-5.521600-10.000000
X-TMASE-MatchedRID: n7p0zKhDeQSjz0nOeth/yUIIxwDaU5mregIHHX2L4YxUjspoiX02F9zJ
	LyRJwSjv2nPTJ66uXI86OquZYLW60mJZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6knQ5gytPTKYhMTcdVKb+FeBzEkCCpnRlvTnqYKYXTRlXgGeVUh3WdmyiLZetSf8nyb6
	HMFK1qe11j5mhaIsibec3QM3secWa+V57L3g/vOjyveBT8utRpd1a3MmINUEKIc6Ztt/kWd18wN
	Oag31Qrthba0c4LbKnunD+bLG3SHG6yLFuyxG9f4QFB5wrW0Iw=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 20 Feb 2024 08:55:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108932

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
-Add wuu, tok, glk, gbm, ssy
-Remove aa_ER.UTF-8@saaho
-Add kv_RU.UTF-8, chr_RU.UTF-8
-Add EU, EZ
-Improve README and Makefile (Resolves: #19)
-Add more translations from CLDR
-Get translation changes from CLDR

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-langtable_0.0.64.bb => python3-langtable_0.0.65.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-langtable_0.0.64.bb => python3-langtable_0.0.65.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb b/meta-python/recipes-devtools/python/python3-langtable_0.0.65.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb
rename to meta-python/recipes-devtools/python/python3-langtable_0.0.65.bb
index 8fb8c6e88..77e09adf2 100644
--- a/meta-python/recipes-devtools/python/python3-langtable_0.0.64.bb
+++ b/meta-python/recipes-devtools/python/python3-langtable_0.0.65.bb
@@ -6,7 +6,7 @@ SECTION = "devel/python"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-SRC_URI[sha256sum] = "1297b7f6e33160887fe08a88176aa0ea873b810a55f2a2740257b124184b067a"
+SRC_URI[sha256sum] = "791ec5403859704e1dee4d2a056a30ec21d1e7bc040658ce62c40e0427ba4333"
 
 inherit pypi setuptools3 python3native
 
-- 
2.34.1


