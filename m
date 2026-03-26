Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7BB10A3D7D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:14 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46433.1774526283721514317
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Nm8Bfocn;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526287; x=1806062287;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d6kdibuByO6LTspKxjoiWwaQXo53vjTstbnsQRC/1BQ=;
  b=Nm8BfocniUQYN746zxIi6uKvsUt0dxncqewZF4Y2zMYbivAASbvHoL96
   Y9X+7hOnUN4Gksxz3+MGdlc2SbdZHypQJ2uVOGgKWAMgl7KWMKU1gFKyw
   1eYeLwfxD7zMX41g2wxXrsk5i/I4EE9LfSXq6xWxCnmPp+W2u0xY2dg2H
   rH+hmJQqwe5SFTIR+vYCyV6AUyslMWWoDtCZIJfYDLhXme6pWcG5NbOgh
   5GsZIsycZfejhd6Ym9/PDw7cyL6LHGjvwiQaSp7QueVaQ0BwxWQerjU5P
   rMSoURNXEMYo1+zcEx02gwrLeKy9d2JueLe2iSEf5kX5DAwObAicozlYf
   A==;
X-CSE-ConnectionGUID: J37XtiWpRs2h02G2FCLw/A==
X-CSE-MsgGUID: oO9O5gv3Syubg2OXquL41A==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="235420920"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="235420920"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:07 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 1532A1C166CC
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:07 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id C4DD714003C1
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 69ECA1807148;
	Thu, 26 Mar 2026 11:58:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 54/63] python3-uswid: upgrade 0.5.2 -> 0.6.0
Date: Thu, 26 Mar 2026 19:56:24 +0800
Message-ID: <20260326115634.1199-54-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125709

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-uswid_0.5.2.bb => python3-uswid_0.6.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-uswid_0.5.2.bb => python3-uswid_0.6.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-uswid_0.5.2.bb b/meta-python/recipes-devtools/python/python3-uswid_0.6.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-uswid_0.5.2.bb
rename to meta-python/recipes-devtools/python/python3-uswid_0.6.0.bb
index 3e6ec88a8e..e5ee5166f0 100644
--- a/meta-python/recipes-devtools/python/python3-uswid_0.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-uswid_0.6.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-2-Clause-Patent"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f3636dfe71e94cc72918423cec0d1971"
 
-SRC_URI[sha256sum] = "1d6c53acf160edc9b42e4ba535343b3567f2f341d289b9e63ca6a84372c2c518"
+SRC_URI[sha256sum] = "98b04b2750aa7ca97fc83c65cb24808174c3cd5f7e99d96727161034963137bf"
 
 inherit setuptools3 python3native pypi
 
-- 
2.43.0


