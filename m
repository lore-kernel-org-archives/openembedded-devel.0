Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54FF3C3065A
	for <webhook@archiver.kernel.org>; Tue, 25 Jun 2024 08:57:36 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web11.166868.1719305849919044276
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jun 2024 01:57:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=p7N3lJIf;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1719305850; x=1750841850;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=77JggXK/tKBXEi4F2vU3yq0XyBCXRlH2pt1GEslKRig=;
  b=p7N3lJIfch/d+RV/53mL5cXJAqNexnAQau9d7K/YTGg5sZ+SLwqayNmt
   9S/GbOwq3eKWadJI9cOKOPauDbn5kdHy2Vc5PVhbATrTo4Wtt2n7A1Wot
   45SkjQpUdu3TZ/Jse+5UXMBiKPZpyuAO5Mlom1Rk02WkNWBWKabBgnb8I
   qnIoawOfbq7DHBxVHvm2wExzIf7s9TOfxEpK1EcRh7ZYRGNAJOiQSOqoW
   IlO6ffpOcorqbNuRMy7oYUGwC4MTaCT/ed8lLN2VbfDoQedaDmDnmBQ/Z
   T7Vh6YpIy989Xiq6XmaiZRtQtEBqxF/f3Ur2pHMFnVW2n8LveMcuPsNmw
   Q==;
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="164920945"
X-IronPort-AV: E=Sophos;i="6.08,263,1712588400"; 
   d="scan'208";a="164920945"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2024 17:57:27 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1BC17D647E
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:26 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 5ACA0D7740
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:25 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id DEB6B2007CDC4
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 17:57:24 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8E0591A0002;
	Tue, 25 Jun 2024 16:57:24 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/57] python3-pdm-backend: upgrade 2.3.0 -> 2.3.1
Date: Tue, 25 Jun 2024 16:56:12 +0800
Message-Id: <1719305790-11484-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
References: <1719305790-11484-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28478.003
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28478.003
X-TMASE-Result: 10--1.897600-10.000000
X-TMASE-MatchedRID: hsQjHHSArR6jz0nOeth/yUIIxwDaU5mr5pOJHbveoeRGQgIVrmBL5Pmv
	83Rzid1pcwr9SmpqI5ANyr61Mu6ROm0Xr+fj3ww/8t4fUUGeErTBOVz0Jwcxl0fyM5VfgjG2h+t
	oLLKXwRGBkESMI05d4uuLFZZYlisfHxPMjOKY7A+u65UDD0aDgsRB0bsfrpPIcSqbxBgG0w5G1R
	vVv++xPReyOZfmrvk9x/7WPT0q5Tyj5oqGkOfSjHCMjyJ9gS49C2DYh2xI/b1eMA0kycjgf0N/7
	/EdT88wxuBIXRHNvvCCvqWrFsheUcLe0zBjeZrbFQOP52BRBXJMTsKj18q/fA==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jun 2024 08:57:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111052

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=========
- Handle unexpected hg repo when parse scm version
- Treat PDM_BUILD_SCM_VERSION empty string as unset
- Honor the current working directory when importing pdm_build.py
- Errors when using the editables backend with the includes field.
- Vendor editables

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-pdm-backend_2.3.0.bb => python3-pdm-backend_2.3.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm-backend_2.3.0.bb => python3-pdm-backend_2.3.1.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.0.bb b/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.1.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pdm-backend_2.3.0.bb
rename to meta-python/recipes-devtools/python/python3-pdm-backend_2.3.1.bb
index 4185f7858..554b6e8c9 100644
--- a/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm-backend_2.3.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4a564297b3c5b629a528b92fd8ff61ea"
 
-SRC_URI[sha256sum] = "e39ed2da206d90d4a6e9eb62f6dce54ed4fa65ddf172a7d5700960d0f8a09e09"
+SRC_URI[sha256sum] = "c03cfb3a803325c049b57ba2502b409479ebb22b6a4ee3746c1f688b939764e8"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


