Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAABDC25B4F
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:42 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web11.6689.1714628980640459092
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZsRi3d1X;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628981; x=1746164981;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KPEznrHaMX1ZxPqNnzuirfbWOr8LCALPxHdB5l3x2us=;
  b=ZsRi3d1XcS3RIpn5/aVufe13X14HGyvvrwqoctpCJYighzlH9ZdPVlO1
   +qNpOBkQ8wKj4ovvpIEAFYUJCf+AUBEDTDL5lDcv6yoGgLd+EBIR3WWB6
   Jx+FYLRYPpU9CnYBMJrPc+Y00OdM8nPAFUk/D5QFyPg8XfgWI5zGKfTWJ
   durflwU57q9WJF0BjK7BsHECEIpQbLksgNUSmVekrYALnXd32auQaJERT
   IDg1qiDc5xUIF5m0Ro96S2xDFoxFogaLPkg94p9Gwe+EvNb4FZLMK/Otn
   pzAzgOBftWw8Fuvf+KtFVHPPoXDVHUgFFwlu9ls24HYX26VGQMvnlgLWf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="156670721"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="156670721"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:26 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 789E7E8D2D
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:23 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id AB9E89837C
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:22 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 49C55217354
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:22 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id EBB731A0002;
	Thu,  2 May 2024 13:49:21 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 06/30] python3-aiohttp: upgrade 3.9.4 -> 3.9.5
Date: Thu,  2 May 2024 10:48:05 -0400
Message-Id: <20240502144829.241208-6-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10--2.280400-10.000000
X-TMASE-MatchedRID: EzAtoNUuirijz0nOeth/yUIIxwDaU5mrrOCEGIPhtwhGQgIVrmBL5K4r
	mQIDoB6Ssff8UmvVwjY+j95AJb21u0bpPxDWdvZIuLt50vtxBA5UENBIMyKD0QfxTM57BPHD7v0
	MlFSLfmlNDQmQ8bbzv+affHI8kAmis1RWeqLGIw6DIpcBQ49iRBCE2NlBjIjcKXqmmYTGpxiUg5
	UD6AlF0rF9uGobEuT7gDLqnrRlXrZ8nn9tnqel2MZW5ai5WKlyC0oYzFB0fqf5wxulK4gxb3slo
	r6uueiIM8JBw2pW67fjlEhvdWgVsSz+HHEMgq1cG+614tiWe8To98emaJU1E5mASTz21M7KEWW0
	bEJOTAVAdUD6vW8Z1mZAMQMIyK6zB8/x9JIi8hKhgLRzA45JPQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110234

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Fixed "Unclosed client session" when initialization of
  :py:class:~aiohttp.ClientSession fails -- by :user:NewGlad.
- Fixed regression (from :pr:8280) with adding Content-Disposition to the form-data
  part after appending to writer -- by :user:Dreamsorcerer/:user:Olegt0rr.
- Added default Content-Disposition in multipart/form-data responses to avoid broken
  form-data responses -- by :user:Dreamsorcerer.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-aiohttp_3.9.4.bb => python3-aiohttp_3.9.5.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-aiohttp_3.9.4.bb => python3-aiohttp_3.9.5.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb
rename to meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
index 1cfed0d7a..57adb1eeb 100644
--- a/meta-python/recipes-devtools/python/python3-aiohttp_3.9.4.bb
+++ b/meta-python/recipes-devtools/python/python3-aiohttp_3.9.5.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/aio-libs/aiohttp"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=748073912af33aa59430d3702aa32d41"
 
-SRC_URI[sha256sum] = "6ff71ede6d9a5a58cfb7b6fffc83ab5d4a63138276c771ac91ceaaddf5459644"
+SRC_URI[sha256sum] = "edea7d15772ceeb29db4aff55e482d4bcfb6ae160ce144f2682de02f6d693551"
 
 PYPI_PACKAGE = "aiohttp"
 inherit python_setuptools_build_meta pypi
-- 
2.34.1


