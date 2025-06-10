Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0FE2C71157
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78438.1749526430255830819
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=V1L7s0Kh;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526430; x=1781062430;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RToG07/2b25QnmtCTb27+F2eF2Z4uqpwhrvBFujIhoE=;
  b=V1L7s0KhPfvdVVmF8FuZGA8Z4YZst1dpVWDeq7sdkjBirc3KUSzdAHpt
   83CVJDcWylVfqkt9LjJnjSZ1OGqIPDOvKe2wEZOjcCjgyis+IRse2z92x
   fWJ9pjV3u8v02IN31ufdjELnrb4DtDi8HRaBloy1RMxR9wTCsXR2DSCdY
   VP+ZnM0WJYapvp0Uer6iTESccLcs7wDflfMNpEeLBWW810/Ypq881Frtw
   AjawtPMpExX/jIhLw3ky7ZHM6RqNGHLiBCuXmnPplpVzphTR591ITlgIA
   K5+wdw5LdX4WTcV0MBM+NivOoqt6Mu5wCXt1dHaf31wbtLelybosun2uH
   A==;
X-CSE-ConnectionGUID: Qt2+CISCTw+7kVa5GFCDyA==
X-CSE-MsgGUID: aWCQzrrPQVmOV1b7RnsVXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189595007"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189595007"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:48 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id B11B1D5051
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:45 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 58665D5068
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:45 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id D94CD1A009A;
	Tue, 10 Jun 2025 11:33:44 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 30/64] python3-cachetools: upgrade 5.5.2 -> 6.0.0
Date: Tue, 10 Jun 2025 11:32:56 +0800
Message-ID: <20250610033330.924-30-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117823

From: Wang Mingyu <wangmy@fujitsu.com>

Changgelog:
=============
- Require Python 3.9 or later
- Remove MRUCache and the @func.mru_cache decorator
- Add an optional condition parameter to the @cached and @cachedmethod
  decorators, which, when used with a threading.Condition instance, should
  improve cache stampede issues in massively parallel environments.
- Convert the cachetools.func decorators to use a threading.Condition instance
  to deal with cache stampede issues. Note that this may result in a noticable
  performance degradation, depending on your actual use case.
- Deprecate support for cache(self) returning None to suppress caching with the @cachedmethod decorator.
- Improve documentation.
- Update CI environment.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-cachetools_5.5.2.bb => python3-cachetools_6.0.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-cachetools_5.5.2.bb => python3-cachetools_6.0.0.bb} (85%)

diff --git a/meta-python/recipes-devtools/python/python3-cachetools_5.5.2.bb b/meta-python/recipes-devtools/python/python3-cachetools_6.0.0.bb
similarity index 85%
rename from meta-python/recipes-devtools/python/python3-cachetools_5.5.2.bb
rename to meta-python/recipes-devtools/python/python3-cachetools_6.0.0.bb
index d2b65b3d29..1032fc0b06 100644
--- a/meta-python/recipes-devtools/python/python3-cachetools_5.5.2.bb
+++ b/meta-python/recipes-devtools/python/python3-cachetools_6.0.0.bb
@@ -14,6 +14,6 @@ RDEPENDS:${PN} += " \
 	python3-math \
 "
 
-SRC_URI[sha256sum] = "1a661caa9175d26759571b2e19580f9d6393969e5dfca11fdb1f947a23e640d4"
+SRC_URI[sha256sum] = "f225782b84438f828328fc2ad74346522f27e5b1440f4e9fd18b20ebfd1aa2cf"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


