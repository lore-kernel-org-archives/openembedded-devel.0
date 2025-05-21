Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4958C54EDA
	for <webhook@archiver.kernel.org>; Wed, 21 May 2025 09:00:05 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.6716.1747818001404151484
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 21 May 2025 02:00:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qLcn04OF;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1747818003; x=1779354003;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=/vrgBsjyypLENicDOhw8ELC2yTiFC9xYO45+xkXkYU8=;
  b=qLcn04OFmStRvYGBz59vqhwPU7+8OUCv4Gr7PXOxSnFO7wC97bu01dke
   rUNFCwH3bYqmHfpWNIUXuSV7CMaUINxjWlYVH/uTBcxBiEghknO5s1Nul
   xinbfd96U5AOIgoOlxPN74+6r3P1kh8ST4f+JLCbMyVlG/t7MzYUVz6Ch
   2vKBb2mh4hrAVWlOXvw7/h77J03cdNcw8csJRijgc6RjxbaPXHKYn5vpj
   fmZDN6kqLySYnnpstzoN6cp5bJm1qXAog4/D0ULEpYSoGLo3ewmu0Ohth
   GP2v2DMxhBcx1SdQgQgFBm2RHvJ8HLsoTIlf+s6KWrE1SjY8TSRSE+HDA
   w==;
X-CSE-ConnectionGUID: UDwK9fVvQB6AmfsQkr7R3w==
X-CSE-MsgGUID: P6fEcB4ASx+ln4zt0YWUqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="187522019"
X-IronPort-AV: E=Sophos;i="6.15,303,1739804400"; 
   d="scan'208";a="187522019"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 18:00:00 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 18C0DE9E80
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:58 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id C025AD52D2
	for <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 17:59:57 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5618D1A0078;
	Wed, 21 May 2025 16:59:57 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/43] python3-pymisp: upgrade 2.5.10 -> 2.5.12
Date: Wed, 21 May 2025 16:59:15 +0800
Message-Id: <1747817972-28874-26-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
References: <1747817972-28874-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 21 May 2025 09:00:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117558

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- Exception when generating feeds containing Notes
- replace deprecated ExpandedPyMISP with PyMISP

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.10.bb => python3-pymisp_2.5.12.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.10.bb => python3-pymisp_2.5.12.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.10.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.12.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.10.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.12.bb
index 57079c5d64..861e7d021e 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.10.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.12.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "369595f98783ea60e97fefb2d56c3c7ef60ea9e56ad13aa10ece924db2343252"
+SRC_URI[sha256sum] = "75dd505d96e1d67b9bfec7a5e1aea3b967426da348e69bdbaa1e554821e10fd6"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


