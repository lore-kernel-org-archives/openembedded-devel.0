Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6900DC369A4
	for <webhook@archiver.kernel.org>; Tue, 25 Mar 2025 09:02:30 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.61530.1742893339566841355
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Mar 2025 02:02:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=movm8qIv;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1742893340; x=1774429340;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=Nb/5XcpF2c+157ERj8nAOXZruila5Mw15NTvY/AbXzA=;
  b=movm8qIvD9BAK+ZABemyx6eafSzywm/AaUcGjxM4+nF2lAn7p8wDTDxn
   JthwsJ9phh0JZ0x8Sv28jOLRqGLSEuYzkZR9ToTm/Y9ZHNp8Mw+oHntqK
   EbCLeHJSMfdW7W1PdylyEXuqpcJ7pSjJ+q7jnO5DCGukF5YHM5e2Fkmwa
   fEeoTE+jhn3VVBTZoAcIq5rc9UcCXRpkPup3OHJ0Y91mkNkBXqbtkw7eU
   E8fgQTSkWNDRJ2ZNBYUFzFUbaBwM5pbUJ0OGbjrFXt6Xr930X74FV+62d
   B/a4izRdQoqLsM28eIu8mU5Gp1Taqdzxm1AricSVXqCE79kuQX5Wct8kZ
   Q==;
X-CSE-ConnectionGUID: 639OSii1SD+tWQQOhYG4lw==
X-CSE-MsgGUID: eN95pz1WQKihKo1L4SA5ug==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="181539256"
X-IronPort-AV: E=Sophos;i="6.14,274,1736780400"; 
   d="scan'208";a="181539256"
Received: from unknown (HELO oym-r2.gw.nic.fujitsu.com) ([210.162.30.90])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 18:02:18 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 63C92E6889
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 1EC07BDCB2
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 18:02:16 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D68BE1A00AE;
	Tue, 25 Mar 2025 17:02:15 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 23/45] python3-coverage: upgrade 7.6.12 -> 7.7.1
Date: Tue, 25 Mar 2025 17:01:30 +0800
Message-Id: <1742893312-3809-23-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
References: <1742893312-3809-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Mar 2025 09:02:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116248

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
  A few small tweaks to the sys.monitoring support for Python 3.14.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-coverage_7.6.12.bb => python3-coverage_7.7.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-coverage_7.6.12.bb => python3-coverage_7.7.1.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-coverage_7.6.12.bb b/meta-python/recipes-devtools/python/python3-coverage_7.7.1.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-coverage_7.6.12.bb
rename to meta-python/recipes-devtools/python/python3-coverage_7.7.1.bb
index 5577832e50..78a0ebff2f 100644
--- a/meta-python/recipes-devtools/python/python3-coverage_7.6.12.bb
+++ b/meta-python/recipes-devtools/python/python3-coverage_7.7.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://coverage.readthedocs.io"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=2ee41112a44fe7014dce33e26468ba93"
 
-SRC_URI[sha256sum] = "48cfc4641d95d34766ad41d9573cc0f22a48aa88d22657a1fe01dca0dbae4de2"
+SRC_URI[sha256sum] = "199a1272e642266b90c9f40dec7fd3d307b51bf639fa0d15980dc0b3246c1393"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


