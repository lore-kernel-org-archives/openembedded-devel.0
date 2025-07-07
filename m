Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5952C83F19
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 09:07:27 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.56138.1751879240227786668
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 02:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JU68CkRM;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1751879240; x=1783415240;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=622fk3AWpGJ68joUb5DQ3Q3MOKlEH51TXbX5Qu+i5Zc=;
  b=JU68CkRMpGRsQO3XRUGemFpEgq0z4gnZ7wtwRxVKNG0FPYGDNbPaqqiS
   IRJp/FkZSsffZQ+e1FUXKx0pZT0ah7U8PKWjWqe/pMHId+/zRghSFkzQI
   otGeoI+Gcib/eqD1FZnjvMbgrEVkM/uEvixdYZcdOFkYBH2KdpgIw1/UB
   2z4Wz2Bi9gHddqs2OAVFQA8/mZoMn5+ZHpl1mPrVGBYRdQIQlgCy3moid
   yjMqFJdTSgQWqzE6y30O5kYiPk8Jd17aOyU4bKjp9bYnNXwCRbWhRuRGR
   cVtAea0cdsGvJYXonvOdO2AhgT0VEzqzpkVcvaRgqL/2CGPNXoGiVSck0
   A==;
X-CSE-ConnectionGUID: gDcA9JLiTfaDwQjLZFUwcQ==
X-CSE-MsgGUID: LxjyrHeNTzK0ewwebyy2Wg==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="184367893"
X-IronPort-AV: E=Sophos;i="6.16,293,1744038000"; 
   d="scan'208";a="184367893"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2025 18:07:18 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 7F621100034D
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from oym-m2.gw.nic.fujitsu.com (oym-m2.gw.nic.fujitsu.com [10.85.9.162])
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTP id 02EB51000115
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 09:07:18 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 545AFBF3C1
	for <openembedded-devel@lists.openembedded.org>; Mon,  7 Jul 2025 18:07:16 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 86A4E1A008D;
	Mon,  7 Jul 2025 17:07:15 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/35] python3-elementpath: upgrade 5.0.2 -> 5.0.3
Date: Mon,  7 Jul 2025 17:06:41 +0800
Message-ID: <20250707090656.1216-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250707090656.1216-1-wangmy@fujitsu.com>
References: <20250707090656.1216-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 09:07:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118273

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===============
Fix for XPath 1.0 processing of schema annotated XML data

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_5.0.2.bb => python3-elementpath_5.0.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.0.2.bb => python3-elementpath_5.0.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.0.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.0.3.bb
index f766ed002b..8659d4f8ba 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.0.2.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.0.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5dbb7fb7d72da3921202dd7b995d3ecf"
 
-SRC_URI[sha256sum] = "26224a33ad9edc82bfa5b26a767a640c8407fbbf9e019b1c369f718dd21823fb"
+SRC_URI[sha256sum] = "61040ca014769d507ce19d26521a4bf1c64d2bd0776466e45030dbfe181f7062"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


