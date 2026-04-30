Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DE5CD13DE
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:50:30 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17233.1777546222762598383
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:50:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OCPKC/UY;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546223; x=1809082223;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LRFY5o+KPkPqrvXVazJAayYcBr/nWWEUtxfI4kHr7cI=;
  b=OCPKC/UYu8CWos0Sn6+o16LIXgnRzKNakwzFYXwFJ2QLd/noyyBNGi8M
   pDIzVbTxAHBDRxewppSV+8wrET3kLD+Rt7vRhRl1Slb18EAPsRPexP8h1
   jwmf/sbZDMzwwsHrHo4Kt3O6LzrwwuPwIJbpi2Mhf3RyNcxvZ39jdj+uy
   D++9d4pbjKxBG6ehUvy4GG3imdMt/SZ+Qt5HU8GELqE81Y6jEiu+9gg/y
   wiiIlw+p2mC7iEtp9UHgHuKku0ouBh9qFSglWFEH1QDd4HcOMDF9tKjuh
   Z5Aa4PcYHa4Ld4iQYXV4J2vHSATDb8LykNh6kN0kiS2XKSrY9aGEl6Ohl
   A==;
X-CSE-ConnectionGUID: zrF+6ErsStqBPJN/cuRbaw==
X-CSE-MsgGUID: RAxmIQpnTgGRJFTW+J/Tdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="243116227"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="243116227"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:50:21 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 4E0418203D2
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:21 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 0A56E140060E
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:21 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id A0E0D1801130;
	Thu, 30 Apr 2026 10:50:18 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 33/64] python3-fastapi: upgrade 0.135.3 -> 0.136.1
Date: Thu, 30 Apr 2026 18:48:52 +0800
Message-ID: <20260430104924.1106-33-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:50:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126703

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-fastapi_0.135.3.bb => python3-fastapi_0.136.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-fastapi_0.135.3.bb => python3-fastapi_0.136.1.bb} (92%)

diff --git a/meta-python/recipes-devtools/python/python3-fastapi_0.135.3.bb b/meta-python/recipes-devtools/python/python3-fastapi_0.136.1.bb
similarity index 92%
rename from meta-python/recipes-devtools/python/python3-fastapi_0.135.3.bb
rename to meta-python/recipes-devtools/python/python3-fastapi_0.136.1.bb
index a4bdb19bbf..27346415c4 100644
--- a/meta-python/recipes-devtools/python/python3-fastapi_0.135.3.bb
+++ b/meta-python/recipes-devtools/python/python3-fastapi_0.136.1.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://fastapi.tiangolo.com/"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=95792ff3fe8e11aa49ceb247e66e4810"
 
-SRC_URI[sha256sum] = "bd6d7caf1a2bdd8d676843cdcd2287729572a1ef524fc4d65c17ae002a1be654"
+SRC_URI[sha256sum] = "7af665ad7acfa0a3baf8983d393b6b471b9da10ede59c60045f49fbc89a0fa7f"
 
 SRC_URI += "file://run-ptest"
 
-- 
2.43.0


