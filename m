Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB277C624D6
	for <webhook@archiver.kernel.org>; Wed,  2 Sep 2026 10:29:39 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9728.1788344969820360890
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2026 03:29:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EuOExq2V;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788344970; x=1819880970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=I/uWV53SJsvKU2jDeE24cCCjbwLAgVzuqnqVCkPObwQ=;
  b=EuOExq2VUfiFMR36kvxMFDbgKS8vgpDpHluE80tD8K4/Yr+7UmRw1xH4
   S4YrVRWVrGX2lNUS2VE/5fTcEl3N7bZEZo9ICl0hta1AsOoV8Fm/2viEB
   HGP1wCEj3r8VQM68aam2H/3qHSYC3QZwWehMp7SzbfWL2nMMrOL2Rr27X
   3FNw3N4qasmu7D9N/t81DVCDCVQeXHyMhgQ6q7eNcA/QhF+MHcw6081RD
   348Z9P37hGy75q+mlliqq6CVERb9S66XPFsfV8O3YVadreKMAVUzeMBti
   rvQ2N2hzOSW49ukTQQP4Xm6B6PZ69VHoW7/GQhatEtjSwBz2qyRURTLlA
   Q==;
X-CSE-ConnectionGUID: w60UHP6IQXO1cfqQU+dkSw==
X-CSE-MsgGUID: /ZqdLivQRhedu1UZOVoMOw==
X-IronPort-AV: E=McAfee;i="6800,10657,11893"; a="257286670"
X-IronPort-AV: E=Sophos;i="6.25,257,1779116400"; 
   d="scan'208";a="257286670"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 19:29:28 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 114E21C1C725
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:28 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (unknown [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id B95D814003F9
	for <openembedded-devel@lists.openembedded.org>; Wed,  2 Sep 2026 10:29:27 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id B3E3D2000224;
	Wed,  2 Sep 2026 10:29:25 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/34] python3-coverage: upgrade 7.15.4 -> 7.16.0
Date: Wed,  2 Sep 2026 18:28:38 +0800
Message-ID: <20260902102900.1296-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260902102900.1296-1-wangmy@fujitsu.com>
References: <20260902102900.1296-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2026 10:29:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129671

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.15.4.bb => python3-coverage_7.16.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.15.4.bb => python3-coverage_7.16.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.15.4.bb b/meta-python/recipes-devtools/python/python3-coverage_7.16.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.15.4.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.16.0.bb
index 822fefbd50..8a9d1cefe0 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.15.4.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.16.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "0548198fff07ccf4faf469520bce1c2eceb1ce3e62891921138dec10907f9d00"
+SRC_URI[sha256sum] = "077f0964087883176ff6ab9b074694cae29f8c708273b13ca62c183c6ed716cd"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


