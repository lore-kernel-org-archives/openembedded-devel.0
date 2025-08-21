Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47864CA0FE4
	for <webhook@archiver.kernel.org>; Thu, 21 Aug 2025 09:00:20 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.4725.1755766816430534244
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 21 Aug 2025 02:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=fS1d9/ZX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1755766817; x=1787302817;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jugiRFkqLX0DIjF4/Z2SwuvYy+sQKPoXW1yGsZDDdYI=;
  b=fS1d9/ZX80NhpOfjQ4Qwd1RkpcBWsoSZEMLhEccrW27qyMsGohs9o0qZ
   jz+uz2b5H6Cs4WoKW47nsD0cfaZohPwRJbm5h5uZRNysQRc4vQW+kSq0B
   txj0SPvKCoZfvFV2v4kqPD97cJYu4laHBdxAV5D6JWppZyAW0zqqMgdmt
   9CKQn1t7ImAcBLmByHCA/6C+3Eqmk52d1hpqSBPyzimoff34LmXsubfQp
   VdNQI1kV4NS9452cjGU6AwhGx57y7s7a4vC/kl3VsFr0o6cMRbqhMzQKs
   tRvFR7snb5XOXQXKQQhuGXbLsH/VwcKZ+rUsOtpxjwd1/8Z+xdPkpbyLy
   w==;
X-CSE-ConnectionGUID: yXqpC/Q5SkyuWQ0fb8RoTg==
X-CSE-MsgGUID: KHtv7BD1ST+fxcbxqlThhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="213525256"
X-IronPort-AV: E=Sophos;i="6.17,306,1747666800"; 
   d="scan'208";a="213525256"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 18:00:15 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id C2825820704
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:14 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 7E42E180CFCE
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:14 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTPS id 58DBE1802E0E
	for <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:12 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 6AC0C1A0074;
	Thu, 21 Aug 2025 17:00:08 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/21] python3-pyproj: upgrade 3.7.1 -> 3.7.2
Date: Thu, 21 Aug 2025 16:59:46 +0800
Message-ID: <20250821085954.2056-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250821085954.2056-1-wangmy@fujitsu.com>
References: <20250821085954.2056-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 21 Aug 2025 09:00:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119063

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- DEP: Minimum PROJ version 9.4
- DEP: Minimum supported Python version 3.11
- MNT: Add CRS imports to __all__
- DEP: Add win_arm64 wheels
- DEP: Add Python 3.13 free-threading wheels
- DEP: Add Python 3.14 and 3.14 free-threading wheels
- TST: Remove irrelevant test with modern PROJ versions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-pyproj_3.7.1.bb => python3-pyproj_3.7.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pyproj_3.7.1.bb => python3-pyproj_3.7.2.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.7.1.bb b/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-pyproj_3.7.1.bb
rename to meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
index 3cc8c21280..b7e6646c97 100644
--- a/meta-python/recipes-devtools/python/python3-pyproj_3.7.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyproj_3.7.2.bb
@@ -6,7 +6,7 @@ inherit pypi python_setuptools_build_meta cython
 
 SRC_URI += "file://rpath.patch"
 
-SRC_URI[sha256sum] = "60d72facd7b6b79853f19744779abcd3f804c4e0d4fa8815469db20c9f640a47"
+SRC_URI[sha256sum] = "39a0cf1ecc7e282d1d30f36594ebd55c9fae1fda8a2622cee5d100430628f88c"
 
 DEPENDS = "proj proj-native"
 
-- 
2.43.0


