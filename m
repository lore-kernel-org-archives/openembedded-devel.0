Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 650B9C5DF88
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:37:13 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3352.1787132221133633110
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:37:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O7wuntXQ;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132229; x=1818668229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2mDBEITCIBmF994lBihBiGNAyEIMjmPUZyw5xN3prc8=;
  b=O7wuntXQOO/b8tXMM2AtOfjDusVZHYJnIfkUv+LCv/sBac9keGnw3XRX
   ytxSKEvh5kiKy+TcppCQx0mWnLyiZZOVwvpmyFFAS4CLW6NhksJJJWZhT
   Rc86Iz9dMPeNh9PcyHcLT+BXGcd2L/+WSnSuzocpnwjNa8hHQR9W7LxPF
   4Q6dk7cATiOZ6UjfSGHETCE4xDqAMAWeRPP9R7pCORK/YbREVJ5mMwDvO
   3+M+zsy/CRl273NXFWRMjwsuXIDDHUnILVeB4/ZATpypxAVNOPNlp98EJ
   tB26GoHv0bj1a0KHfNZMtHbYeLvmn6sxiPo1to3p4cU+fr8lgz5AjnhAQ
   w==;
X-CSE-ConnectionGUID: H3Hs+jC/SLO39GXkb/57+g==
X-CSE-MsgGUID: GOT+fF3IQO2M7rOqydkj9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="251797136"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="251797136"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:37:08 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6135D100037B
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:08 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 10FA4C073C3
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 07E771801C0A;
	Wed, 19 Aug 2026 09:37:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 61/70] python3-tox: upgrade 4.58.0 -> 4.60.0
Date: Wed, 19 Aug 2026 17:35:05 +0800
Message-ID: <20260819093514.1101-61-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:37:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129331

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- fix(type): cast set value in _render_options
- docs: fix typo 'set the the' -> 'set then the' in config reference
- ci: pin coverage to the ctrace core
- chore: remove the misc changelog category
- test: seed the virtualenv wheel image up front
- feat(plugin): type the plugin and internal API surfaces
- test: raise timeout for missing-interpreter discovery tests
- docs: mark the INI configuration format as deprecated
- docs: publish llms.txt from the docs build
- Provision before loading env_list
- docs: repoint nine dead source links in the onboarding guide
- Add {home} and {tox_root_name} substitutions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-tox_4.58.0.bb => python3-tox_4.60.0.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-tox_4.58.0.bb => python3-tox_4.60.0.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-tox_4.58.0.bb b/meta-python/recipes-devtools/python/python3-tox_4.60.0.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-tox_4.58.0.bb
rename to meta-python/recipes-devtools/python/python3-tox_4.60.0.bb
index 30b3056621..43ac28cd6a 100644
--- a/meta-python/recipes-devtools/python/python3-tox_4.58.0.bb
+++ b/meta-python/recipes-devtools/python/python3-tox_4.60.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "https://tox.readthedocs.org/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=11610a9d8fd95649cf8159be12b98cb7"
 
-SRC_URI[sha256sum] = "ab0b126a04dd56bc18e6d216386db09335247f2289b54cf534deb5c4ae3a8d2e"
+SRC_URI[sha256sum] = "6f93bb580d35e00fc69cfec1116eecbe21155f747753ca5019374f7c69b2eac9"
 
 BBCLASSEXTEND = "native nativesdk"
 inherit pypi python_hatchling
-- 
2.43.0


