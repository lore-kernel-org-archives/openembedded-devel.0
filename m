Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D78FD44010
	for <webhook@archiver.kernel.org>; Mon, 18 Nov 2024 09:30:16 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.37267.1731922213179768646
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 18 Nov 2024 01:30:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=TbJsd1vI;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1731922213; x=1763458213;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=qg/lIXVN+R2dvPyS8z5JKiGCJJvRofaeoQ0EBA5Y+hk=;
  b=TbJsd1vIJWChaWSRZdM1YBIXKf5iXOX3Iu8rOoJnBbbTslyJQErzUIyS
   IERbMA7Jl1PWWC5bk+IfRXK0ALpnsL7RWS9oJx1t11figteasnKNZD32j
   sAJ4176IyA/m83AwcRWA/RjeC051BVFm473G99/2Xn4EggmbTO/8yEKoi
   0TAbGhjhqO2WPmttlhOcgluY6XfL0nSMaPupZMGBjSy2bX3smCmacLzV7
   vvTubOozSOiMQm78GC3xpcLCy6hzyriU47nBzj8QKYN4NyIzR29rxWZTN
   GZyxHiCNpMGMRUvJYgQL2Ma5/9Abjbxpudy8HTSPIkw1bUaqCh9afDBKj
   A==;
X-CSE-ConnectionGUID: TWj9JjqlQRytY2X2/HHehQ==
X-CSE-MsgGUID: ozpC2RJCSOu6Bc+0iNCViA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="168136706"
X-IronPort-AV: E=Sophos;i="6.12,163,1728918000"; 
   d="scan'208";a="168136706"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 18:30:11 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id AC10CD6EA7
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:08 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 41E45D0905
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:08 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id CB28220071A22
	for <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 18:30:07 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.161.161])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 7C1011A000B;
	Mon, 18 Nov 2024 17:30:07 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 11/32] python3-aioresponses: upgrade 0.7.6 -> 0.7.7
Date: Mon, 18 Nov 2024 17:29:34 +0800
Message-Id: <1731922195-5266-11-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
References: <1731922195-5266-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28804.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28804.006
X-TMASE-Result: 10--0.306500-10.000000
X-TMASE-MatchedRID: R9NZgeCyXhKjz0nOeth/yUIIxwDaU5mrTfK5j0EZbyuohlnMbn2V9I9u
	pSgfxMyhLJoLOSH2KMbuNT8xdcEnQ2JZXQNDzktSP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW6vBQc3bCgEsHqYviVWLIXKeBzEkCCpnRmeAiCmPx4NwBnUJ0Ek6yhjxEHRux+uk8irEH
	faj14ZyUr3xmOUkc+OXg5fqiPfURw53UjxavBflglyev3R6wKrqRtqPzIZJNFwCulkW6H5HBXPz
	mvsbHNePT7ex7Bcz53/fK3bggMP2R0GKr7NwItR8gwWDQic4+rPmACeZqO85TioKJ2WPUxTLS4A
	EOLjtwA=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 18 Nov 2024 09:30:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113877

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix: invalid rst code
- Merge pull request #262 from bdraco/3110_compat
- Fix compat with aiohttp 3.11.0+
- Merge pull request #233 from outp1/master
- Merge pull request #251 from chs2/feat/callable-raise-for-status
- Merge pull request #256 from DanielNoord/patch-1
- Update __version__ to latest released version
- Merge pull request #254 from gaby/packaging
- Add packaging to requirements.txt
- feat: support raise_for_status as callable

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hon3-aioresponses_0.7.6.bb => python3-aioresponses_0.7.7.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aioresponses_0.7.6.bb => python3-aioresponses_0.7.7.bb} (89%)

diff --git a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.6.bb b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.7.bb
similarity index 89%
rename from meta-python/recipes-devtools/python/python3-aioresponses_0.7.6.bb
rename to meta-python/recipes-devtools/python/python3-aioresponses_0.7.7.bb
index a99c80f59..1f801877c 100644
--- a/meta-python/recipes-devtools/python/python3-aioresponses_0.7.6.bb
+++ b/meta-python/recipes-devtools/python/python3-aioresponses_0.7.7.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/pnuckowski/aioresponses"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b22b40d5974300051216633098387c57"
 
-SRC_URI[sha256sum] = "f795d9dbda2d61774840e7e32f5366f45752d1adc1b74c9362afd017296c7ee1"
+SRC_URI[sha256sum] = "66292f1d5c94a3cb984f3336d806446042adb17347d3089f2d3962dd6e5ba55a"
 
 DEPENDS += "python3-pbr-native"
 
-- 
2.34.1


