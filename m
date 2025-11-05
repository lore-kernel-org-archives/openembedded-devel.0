Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0644BCCFA1A
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:44:21 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2930.1762386253370534903
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:44:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=sVo+UmSI;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762386254; x=1793922254;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gQkbC7S3iH4xFjVxNBnVpAK16Y8cQYl8i0IWRKruhPE=;
  b=sVo+UmSIzajA/4mUOMMbqxbbxGjUKuiWmet+OJtRfiEAeYhGPf4nA7yJ
   styctAfe5M8/ahfPD8bMPoD9lVCsSAsUaXX5Hp2UEhnljPbEMIJzuNQQS
   IySNmMDtpkErs/j3h7BArb1h4akH7BCHdsSa4uDT5WKPgkQ2VpsgcR6+R
   tenLwm0i9/9MwZoOSvC7TRC9lezlQflBX7gCI/4s0ySGSxkalth31zCyF
   XZhcs/shlv928/2r8RQrrua4RuumvMNyJtsEiC4m3k8Er9/2DlPND3GGr
   kQ5N+RvMjNM9ufm67fimKQfZSI259fwqPDNELubN6bfVaCSVHPMzJyNC9
   w==;
X-CSE-ConnectionGUID: Px7hmNcTTm6kDe1iy3IhwA==
X-CSE-MsgGUID: v3WkD8LrRVOYexpdPirJDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="218187852"
X-IronPort-AV: E=Sophos;i="6.19,283,1754924400"; 
   d="scan'208";a="218187852"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2025 08:44:13 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3D3D71002981
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:13 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id E95EE8D2076
	for <openembedded-devel@lists.openembedded.org>; Wed,  5 Nov 2025 23:44:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 7757C100310A;
	Wed,  5 Nov 2025 23:44:10 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 03/12] libyang: upgrade 3.13.5 -> 3.13.6
Date: Thu,  6 Nov 2025 07:43:53 +0800
Message-ID: <20251105234402.423-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251105234402.423-1-wangmy@fujitsu.com>
References: <20251105234402.423-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 05 Nov 2025 23:44:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121342

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libyang/{libyang_3.13.5.bb => libyang_3.13.6.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libyang/{libyang_3.13.5.bb => libyang_3.13.6.bb} (96%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.5.bb b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
similarity index 96%
rename from meta-oe/recipes-extended/libyang/libyang_3.13.5.bb
rename to meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
index 4260111200..822c30ba24 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.5.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b69fd3b2815bbf1cef5c97f0eee2519a"
 
-SRCREV = "efe43e3790822a3dc64d7d28db935d03fff8b81f"
+SRCREV = "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
-- 
2.43.0


