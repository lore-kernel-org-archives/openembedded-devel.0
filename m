Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E222CE8D43
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 03:32:49 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.11427.1726716754294434314
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 18 Sep 2024 20:32:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X05zUvON;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1726716759; x=1758252759;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=nZsyb8pCdSAXGSvK1ySvlIrVsg6nY0Dzv26ArsiuuE4=;
  b=X05zUvON74pCF9EdDZ9Fbu+vZtLDvOWV5dq+7OX7SfmdZHY1HEuGnYty
   9eFTJmY4PRT3vOGmlDJSD0aVZhM2C261uF2ZieeeB8Q+GWHwWzrELYH5b
   NHglxKTL/Dqe9pgQ9ZZUHLXj78wYT6QJLvto75Vet+d3s3gZ4E6Kcu8bG
   c2bbL2w6rAuklKE2k0z/EFx1tDA+5HRPYN/NO8ayVL47QihVou7d/a4vc
   rrjRwHuAVbGmQlL22haevyZNYNnZXNZkCAefOMn3CjavhwiEls9l+hMN+
   1V9aOtgm0O+UFeK+nG88z02mak7XZQTBW5CUMCFHfKBJwmUiTpWczIEjA
   Q==;
X-CSE-ConnectionGUID: 5zgP3FwFTmCGWU+Giidnhw==
X-CSE-MsgGUID: MoIymsrRT/KYm1cTLVvGTQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="176238053"
X-IronPort-AV: E=Sophos;i="6.10,240,1719846000"; 
   d="scan'208";a="176238053"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 12:32:38 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 6B585CA1F2
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:35 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id AF076BF3D8
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:34 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 4864721FC6A
	for <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 12:32:34 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id DDF101A000A;
	Thu, 19 Sep 2024 11:32:33 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/28] python3-pymisp: upgrade 2.4.197 -> 2.4.198
Date: Thu, 19 Sep 2024 11:32:02 +0800
Message-Id: <1726716733-14548-17-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
References: <1726716733-14548-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28672.004
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28672.004
X-TMASE-Result: 10--4.990000-10.000000
X-TMASE-MatchedRID: wgzGQ0X+yFqjz0nOeth/yUIIxwDaU5mr/1vXbkGjWeWAI7Mvq/sL53aq
	80gwzv1ECyaRo+rOkvkNyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0JwcxlwV9fM+V9jt75wM
	PMqdPNSyBkESMI05d4lzjFhM9hn+YXHEPHmpuRH0URSScn+QSXmVV1G+Ck2l7+gtHj7OwNO2I3a
	djBtsMrHEBmBGhrzh+mNAle3wJEpCUkamC0g6koxaL3RzyVLBJDNz+QG4knY7ExvvLakO8rB1AQ
	79eQ/Ake268o8B2T+qsnnYyBZug+/IMFg0InOPqz5gAnmajvOU4qCidlj1MUy0uABDi47cA
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 Sep 2024 03:32:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112377

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Bump changelog.
- Bump deps, version.
- Only include the changelog in the sdist package.
- [data] describeTypes.json updated.
- Openioc.py is not a script, but had exec bit.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.4.197.bb => python3-pymisp_2.4.198.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.4.197.bb => python3-pymisp_2.4.198.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb
index f20716026..b902061c0 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.197.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.198.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "840881779d1762803e9329ae5129a88abb0e6110afb43c9e3e6e3877e5931a6c"
+SRC_URI[sha256sum] = "f5583263c2fcd380570c084b21c4e4812a01c32daa7baafcdc3f87153edc9303"
 
 inherit python_poetry_core pypi
 
-- 
2.34.1


