Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B18AC41513
	for <webhook@archiver.kernel.org>; Thu,  2 May 2024 05:49:32 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.6680.1714628966417448856
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 May 2024 22:49:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=pHFVX4vA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1714628971; x=1746164971;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6jkE4JkL31LxDXd3QS8FyhpOvJ3XS4OdixIIYBgjZAU=;
  b=pHFVX4vAqygrabY7cTeRiXcG6KnvNgFRQxIafKOen/578jI6MxhuwtPX
   fj+WqF/st4TG829gyJmx7XmDYi+U2F4H8f64ST2SkSr7bwCMPBtmn+/cd
   KgxtYlPpT5KGpXukcsrZVmrZRPvYLf30GE5s+PViH61zJeQma4gDHlics
   iF2XNjJh94WIawhmwNdW0t+5fB7NAoWWRcZfnVOYiLjMKKIkAc9EvKXwI
   zJC5Q2jZbxAfo70Hrmd3QRylUkcDM5IxBxbsznm8NzemFMNvhQ8kJjJt8
   xDJnwkErRKFcbtwl4cjHqQUU0KxM/YeKBMacJTtmyeJ+OGmt+pUmFS4GC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11061"; a="159223476"
X-IronPort-AV: E=Sophos;i="6.07,247,1708354800"; 
   d="scan'208";a="159223476"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 14:49:29 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3DAD9D6473
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:27 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 734AAD6235
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:26 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2B742008BCDC
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 May 2024 14:49:25 +0900 (JST)
Received: from wangmy-QiTianM610-N000.g08.fujitsu.local (unknown [10.167.225.86])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 914851A0002;
	Thu,  2 May 2024 13:49:25 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/30] python3-pdm: upgrade 2.14.0 -> 2.15.1
Date: Thu,  2 May 2024 10:48:12 -0400
Message-Id: <20240502144829.241208-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502144829.241208-1-wangmy@fujitsu.com>
References: <20240502144829.241208-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28356.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28356.005
X-TMASE-Result: 10-0.677500-10.000000
X-TMASE-MatchedRID: Sudfee3ORQqjz0nOeth/yUIIxwDaU5mrSV3lGyX22Zffc2Xd6VJ+yoVg
	EoF3GYKVDT4gI6hzscWKggr79PUAVLYgup2PqxmgHWRJEfGP5nl3Bf9JIqsoeMay5jJvrxqMhQT
	/+XCkKcl80V10AiSCI24LXY9qgjLsUtG3fovCeXlYUconbBJWJDWBEYnpSn2FRAmQNOnwZ8ZPo2
	8dIBKhqSmzOAfB900eK+w07v7sOJhE1mdxyzcNlNyBRU/cKn69VBDQSDMig9EH8UzOewTxw+79D
	JRUi35pTQ0JkPG287/mn3xyPJAJomwBjgmlpMY7b056mCmF00ZV4BnlVId1nZsoi2XrUn/Jn6Kd
	MrRsL14qtq5d3cxkNXsaPcLg5+omHaPMGm6w5ozg1t/hElL8h/TnYXJY5246mGdBx3j0HavXlhw
	el+AP/7vmYvvdlu2Z91rUhJ5Us34mkBuxEQnwI/4Bx1weaSflFcUQf3Yp/ridO0/GUi4gFb0fOP
	zpgdcEKeJ/HkAZ8Is=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 May 2024 05:49:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110218

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Disable check update in zsh completion script.
- Fixes cached packages metadata files (.referrers) collisions on sync when
  using a venv with symlink cache method.
- Don't create project and virtualenv when running pdm python install.
- Clean up the python installation directory if a previous download was
  unsuccessful.
- Don't cache editable installations.
- Fix a bug that installing in-project plugins with editable local paths
  doesn't work.
- Don't create log directory until it's needed, to fix a PermissionError in
  docker environment.
- Fix recursive script detection on multiple invocations.
- Build docs with object inventory to support cross references from Sphinx
  documentation projects.
- Packages format preferences can now be defined in the project pyproject.toml
  using the no-binary, only-binary and prefer-binary keys of the
  tool.pdm.resolution section.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pdm_2.14.0.bb => python3-pdm_2.15.1.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pdm_2.14.0.bb => python3-pdm_2.15.1.bb} (81%)

diff --git a/meta-python/recipes-devtools/python/python3-pdm_2.14.0.bb b/meta-python/recipes-devtools/python/python3-pdm_2.15.1.bb
similarity index 81%
rename from meta-python/recipes-devtools/python/python3-pdm_2.14.0.bb
rename to meta-python/recipes-devtools/python/python3-pdm_2.15.1.bb
index 011ba5b3d..270850061 100644
--- a/meta-python/recipes-devtools/python/python3-pdm_2.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pdm_2.15.1.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2eb31a2cc1a758c34b499f287dd04ef2"
 
-SRC_URI[sha256sum] = "7ae6c4b5518085a703e0824ab10cbc3b7246b599ef07b8c4dcb2af1e42859190"
+SRC_URI[sha256sum] = "1c9cd049c1016633a23ef92ec1fc782da8ae0743142ef33faf7d48872f874b39"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.34.1


