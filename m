Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76C9710A3D6B
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46430.1774526274365828188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b7oS0kTl;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526274; x=1806062274;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GKATXh+XAfYiM+MzpzcxTseW6o/iNp6l6QnUpJUGG8Y=;
  b=b7oS0kTloUu0NrDz/CroBz4jQX47KvwYheIdwCHpnvaRF4RJ3ycQw2ae
   zh2u/d1IsDnAFuE/jgJ9NP8sXZ2E55VzZTuZfxBlViBsbMVIaaEEGAvns
   fPTM5QJY/aBBWFRDgoM0OpxEtvqQ7uOj93z86zNoH5+262SrND2tVUjmJ
   m2GUOp1HKvuEcLY+I9LqDQnAMwjJwO486RcnkuyVA2u4eRyahw2WBczLG
   PjSnZnPuw9Qb/ODpxjlROvBtZ8LSHOcCSuHhKx2wqN+mp0p7QqBcE6KPr
   DeoPw9vfK9JFo5wBrDNNaBNNo4MXvr/3op+xiPUP7EIUTWtZ0t5rBb/b1
   Q==;
X-CSE-ConnectionGUID: sRAQu5YrTdOklJm37CIpVA==
X-CSE-MsgGUID: gCiIgB51Rjm5Z9wXgOCGhw==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="213520860"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="213520860"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:52 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D77FB1C00541
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:52 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 854D618009EA
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 135A0180714B;
	Thu, 26 Mar 2026 11:57:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 45/63] python3-pint: upgrade 0.25.2 -> 0.25.3
Date: Thu, 26 Mar 2026 19:56:15 +0800
Message-ID: <20260326115634.1199-45-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125700

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- 'GenericPlainRegistry.parse_expression' now correctly returns a dimensionless
  Quantity when taking a float, int, or NaN
- Replace MIP with scipy in 'Quantity.to_preferred'
- New unit formatting modifier added ('^') to format unit with negative
  exponents
- Add atomic unit of electric field gradient
  ('atomic_unit_of_electric_field_gradient', 'a_u_efg')
- Defer expensive loading of dask.array
- Add support for numpy's 'vdot', 'inner', 'outer', 'linalg.outer', 'matvec',
  'vecmat', 'tensordot', and 'linalg.tensordot'

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pint_0.25.2.bb => python3-pint_0.25.3.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pint_0.25.2.bb => python3-pint_0.25.3.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-pint_0.25.2.bb b/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-pint_0.25.2.bb
rename to meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
index 97ee4b48bc..fff2b08324 100644
--- a/meta-python/recipes-devtools/python/python3-pint_0.25.2.bb
+++ b/meta-python/recipes-devtools/python/python3-pint_0.25.3.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bccf824202692270a1e0829a62e3f47b"
 
 inherit pypi python_hatchling ptest-python-pytest python_setuptools_build_meta
 
-SRC_URI[sha256sum] = "85a45d1da8fe9c9f7477fed8aef59ad2b939af3d6611507e1a9cbdacdcd3450a"
+SRC_URI[sha256sum] = "f8f5df6cf65314d74da1ade1bf96f8e3e4d0c41b51577ac53c49e7d44ca5acee"
 
 DEPENDS += "python3-setuptools-scm-native python3-hatch-vcs-native"
 
-- 
2.43.0


