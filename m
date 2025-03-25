Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16975C3601A
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web10.61532.1742893341583636729
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BSQcpJKR;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893343; x=1774429343;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=e6wFPKslFrzzixfkYVi2YuJne10+o7vLEjTblSP+9co=;
  b=BSQcpJKRfAE1X2rp1nu1XUwaSXyeHErFJ5XRikN0oR9fKgkUtXrrtsm0
   SeoUHWQK/5pMAgT4ysQxqhxBEfinnW0bcE8jR+SZXJJL+ypO2TlnwGyqJ
   M83Fg9k2GYB2ctEzTm5T6cpHiu8cFfhiR9+wlHWgdckylKUP6vvrMrxQ0
   MLqhTLuwlR5dWnllyupztEByBjmwTiFgDMW+KO2hrYVVJWfjqhLlniE6i
   z3GOBNPCF+xaEa6TJkSpVKOa3FMMTW/UcbA6l3rxhKjPCgZSDwnjcIR7F
   Xh+847aOr0UCsVq7y/1vOPgGcUzyuxM5nN5D+Fm7vRDV0kPRDj46kxkOj
   A==;
X-CSE-ConnectionGUID: hjvRHDvARXmpkxRX25JvNA==
X-CSE-MsgGUID: iHhZ13VESf6bGK+4Yv6l1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="194166805"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="194166805"
Received: from unknown (HELO yto-r1.gw.nic.fujitsu.com) ([218.44.52.217])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:22 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 1662FD6EFF
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:19 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id C75FCD50E2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:18 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8684A1A0078;
	Tue, 25 Mar 2025 17:02:18 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 35/45] python3-pymisp: upgrade 2.5.7.1 -> 2.5.8.1
Date: Tue, 25 Mar 2025 17:01:42 +0800
Message-Id: <1742893312-3809-35-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116258

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Remove top level files from wheel.
- Typo in objects.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pymisp_2.5.7.1.bb => python3-pymisp_2.5.8.1.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pymisp_2.5.7.1.bb => python3-pymisp_2.5.8.1.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.5.7.1.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.5.8.1.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-pymisp_2.5.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pymisp_2.5.8.1.bb
index 87d45940a2..b605dbb039 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.5.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.5.8.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/MISP/PyMISP"
 LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=a3639cf5780f71b125d3e9d1dc127c20"
 
-SRC_URI[sha256sum] = "522f357fb9efd11acd14f423e577c3c8996c3bf90c9d66c2f3e83af31d669159"
+SRC_URI[sha256sum] = "253cc79c903344f722abdf1011f412e27106af7305c1a3183d5c247c25a8f41c"
 
 inherit python_poetry_core pypi
 
-- 
2.43.0


