Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E35DC83F1F
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:28 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web10.55566.1751879232860152989
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O5k3ehuG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879239; x=1783415239;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fOIgHb+NI/wkzedfw33BWhN9n9NY275PxrawdORgqIs=;
  b=O5k3ehuGwss5/frr4jsWDgmDoChqmaBmhhJL4ONx/FiTHMa5ccGJTVjr
   1Bc3BBwwcP1EXBi5wSyYbUoxx+mQc79jrReiVxhsBxUJig4gO5q/GNqv/
   TyLLrfgfOBHk0Hug1ug4He1kEaqxwBcKsgW36BKF07hS6Dyxo98QPCbVs
   lMDzya788jjTYLAsmYhgfm4/KobGrCRiXKSBH1FWHQnU3MTkszE3ngH1G
   PgVRqi1Yyq6axrd85lBWNT1T9RfxLL9VV/xfJDSz8eS3u8uA+jQcFPk9A
   9DrBNl9UCLojnH/xlr+MmYipptld6vLko2yf32FR7KxWMjF40FsmWjAK1
   g==;
X-CSE-ConnectionGUID: +Leyhp1cRQ+e1bxcE2Vtqg==
X-CSE-MsgGUID: piMwMGpgTZCpRLIWKmcgVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="208679392"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="208679392"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:19 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 303DF1C0018B
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from oym-m1.gw.nic.fujitsu.com (oym-m1.gw.nic.fujitsu.com [10.85.9.161])
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTP id A3B3E1802AD5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:17 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 016A9D4F46
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:16 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 468151A0078;
	Mon,  7 Jul 2025 17:07:15 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 20/35] python3-coverage: upgrade 7.9.1 -> 7.9.2
Date: Mon,  7 Jul 2025 17:06:40 +0800
Message-ID: <20250707090656.1216-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118266

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==============
- Fix: complex conditionals within a line might cause a KeyError when using sys.monitoring
- Fix: we can now measure coverage for code in Python archive (.par) files.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.9.1.bb => python3-coverage_7.9.2.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.9.1.bb => python3-coverage_7.9.2.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.9.1.bb b/meta-python/recipes-devtools/python/python3-coverage_7.9.2.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.9.1.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.9.2.bb
index 50542889a7..16f7127129 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.9.1.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.9.2.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "6cf43c78c4282708a28e466316935ec7489a9c487518a77fa68f716c67909cec"
+SRC_URI[sha256sum] = "997024fa51e3290264ffd7492ec97d0690293ccd2b45a6cd7d82d945a4a80c8b"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


