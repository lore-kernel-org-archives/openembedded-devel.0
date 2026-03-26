Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD6C10A3D73
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45663.1774526272712580717
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:57:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=GhvzNlIY;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526277; x=1806062277;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=c0fTRshAYSc0P+AHwr67iPPJDyB50Aw//ugXYIGPPMQ=;
  b=GhvzNlIYbXc2eIMWlm1TQj5Bxqao+RhADzoip94qMopWYnqbKuqOMmDd
   cLHcVcFUaMH6oIgFD54MneraFpvTxOFgIQ4oWpta1kjtCs3wG2imcuvXg
   8gpydSkX1O5S25qmH9t7V8RXnqNjL0vlghFfZsIk+KpQYksAiefEo/aiF
   PafbUgDtttPzGOLEKflO/zZshWBOiIsRtrHMPjlrmRZ0rBsIhjXQwN6cc
   6U22S8S3AsXhhS2pPsWAc4t5sOofsFjX5y0WhwfL8ayQSI6ih2rYnmIfg
   ctBr+bJGqTtPTgxUsA5AmfkeXQYI6x1Cns1/kWU36pkm2jKAwZJsbFAVX
   A==;
X-CSE-ConnectionGUID: BBEyL/G2T7uxwpp2O2IV8w==
X-CSE-MsgGUID: 9CSag6IDSEyRM6cbstGSLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="234718919"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="234718919"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:57:56 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 19543407547
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:56 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id BA3B21800E8D
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:57:55 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 41B001807149;
	Thu, 26 Mar 2026 11:57:53 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 47/63] python3-pytest-cov: upgrade 7.0.0 -> 7.1.0
Date: Thu, 26 Mar 2026 19:56:17 +0800
Message-ID: <20260326115634.1199-47-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125702

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-pytest-cov_7.0.0.bb => python3-pytest-cov_7.1.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-cov_7.0.0.bb => python3-pytest-cov_7.1.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-cov_7.0.0.bb b/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pytest-cov_7.0.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
index 117767d1ee..5e76726909 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-cov_7.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-cov_7.1.0.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=cbc4e25353c748c817db2daffe605e43 \
 "
 
-SRC_URI[sha256sum] = "33c97eda2e049a0c5298e91f519302a1334c26ac65c1a483d6206fd458361af1"
+SRC_URI[sha256sum] = "30674f2b5f6351aa09702a9c8c364f6a01c27aae0c1366ae8016160d1efc56b2"
 
 inherit pypi python_setuptools_build_meta python_hatchling
 
-- 
2.43.0


