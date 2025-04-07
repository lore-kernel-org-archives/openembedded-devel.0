Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D83DC369AB
	for <webhook@archiver.kernel.org>; Mon,  7 Apr 2025 09:17:38 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web10.43038.1744017444610489553
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Apr 2025 02:17:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qTbKNz3h;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1744017450; x=1775553450;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=khIeIzIhYkOb0a7VWLIXBux6nWSMNzPaVi0HaOVCoCY=;
  b=qTbKNz3he/i1+HvcUnO0HVPC0UPGFSghRiEy6O0XCK1Wzzums0M83rZ7
   AGL7bSNhAAHl9Ltser0OGWDa7ap5h/pW4138KyblU2M7euaCL6xfha5Li
   qOIFLHCsDDIT4i/Svww3aAfPJxnLwQ7/29Z4rWDEawyNmkk9Qx2LVhqdT
   DRcb1/C+7blFVS7LrU0AWYy4VKSwoWykb45593YLy0e3t7idTxc1J11v5
   jgPqKF0YH7Quq7DfpX9glazhYGhDHZtutx2T8vQFkXebZACmpVAEoN8gx
   MQLG4icYLd39onLiEjyfslLQBIbbcruZRnLgDC81lkOFK8LQf/x1sIuRq
   A==;
X-CSE-ConnectionGUID: iiqM+RcQTQew4SIzxszt/g==
X-CSE-MsgGUID: VJEKGfEDRFeUZcw5lEaPxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11396"; a="174543312"
X-IronPort-AV: E=Sophos;i="6.15,194,1739804400"; 
   d="scan'208";a="174543312"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 18:17:29 +0900
Received: from oym-m1.gw.nic.fujitsu.com (oym-nat-oym-m1.gw.nic.fujitsu.com [192.168.87.58])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id DF21AEAC03
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 9B195D88D5
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Apr 2025 18:17:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 2C7341A00A0;
	Mon,  7 Apr 2025 17:17:27 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 22/30] python3-pymisp: upgrade 2.5.9 -> 2.5.10
Date: Mon,  7 Apr 2025 17:17:03 +0800
Message-Id: <1744017431-22217-22-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
References: <1744017431-22217-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Apr 2025 09:17:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116644

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.9.bb => python3-pymisp_2.5.10.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.9.bb => python3-pymisp_2.5.10.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.9.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.10.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.9.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.10.bb
index c9f9eba40a..57079c5d64 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.9.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.10.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "975b68ad9f38e7322d0994ce327abff359aa400f9e6d62a75be33694e4b06ec1"
+SRC_URI[sha256sum] = "369595f98783ea60e97fefb2d56c3c7ef60ea9e56ad13aa10ece924db2343252"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


