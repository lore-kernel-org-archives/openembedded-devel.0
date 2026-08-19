Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE7EC5DF85
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 09:36:00 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3264.1787132155112511981
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 19 Aug 2026 02:35:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VlVWLuNI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787132155; x=1818668155;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rnez2CAxPvpgVxFVh5MPqLqyIhe2xO4wd8NiUQ2qqr0=;
  b=VlVWLuNIln2c78UH1tcih1W8v/LK89T+VPHtYzYac5fCpKQzgQvLA/Fd
   oz2d9km6sCM5hUFiMZdW7kh1PAiVo1lfeU1Q1rrN/iqwa/wfw3Bb2pcnp
   gFurq+WVCfrO+z+BeirRNyJRyjx5ekvgu5tKCxWUKUPcRMuqkCGa5dUY0
   NRtpQQQ2eJ2I6dEsUyweHQVCjaQLZC94UHNUEfZzOV6DqRDpnfqT1cU92
   SWIkK+gJlam/DbBCo/xX4RDsgqRX42+/3zA9DcwdESsHGisQJX9yPRL0T
   w/V0M/hwQDAOPIZsKkfAgd4l23v2i2b1sSHJfuxndpEZVlJEwlGOsAjRA
   w==;
X-CSE-ConnectionGUID: zvJ8qQeDQ+qSoyBjJGpfXQ==
X-CSE-MsgGUID: vvRfeifuTqmayJdpRFTUOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="250051448"
X-IronPort-AV: E=Sophos;i="6.25,231,1779116400"; 
   d="scan'208";a="250051448"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2026 18:35:53 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 47E7C8200BB
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:53 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F33A6C1596D
	for <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:35:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 079371801C20;
	Wed, 19 Aug 2026 09:35:50 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 19/70] python3-astroid: upgrade 4.1.2 -> 4.3.0
Date: Wed, 19 Aug 2026 17:34:23 +0800
Message-ID: <20260819093514.1101-19-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260819093514.1101-1-wangmy@fujitsu.com>
References: <20260819093514.1101-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 19 Aug 2026 09:36:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129289

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-astroid_4.1.2.bb => python3-astroid_4.3.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-astroid_4.1.2.bb => python3-astroid_4.3.0.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb b/meta-python/recipes-devtools/python/python3-astroid_4.3.0.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb
rename to meta-python/recipes-devtools/python/python3-astroid_4.3.0.bb
index 1e7372f692..81c5db78a1 100644
--- a/meta-python/recipes-devtools/python/python3-astroid_4.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-astroid_4.3.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "LGPL-2.1-only"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a70cf540abf41acb644ac3b621b2fad1"
 
-SRC_URI[sha256sum] = "d6c4a52bfcda4bbeb7359dead642b0248b90f7d9a07e690230bd86fefd6d37f1"
+SRC_URI[sha256sum] = "2b5b5048d6edc40e748e2728790e444b81c3d358e19cc89db6e973236192362f"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


