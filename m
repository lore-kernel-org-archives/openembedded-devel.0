Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6DF6C7EE32
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.web10.13711.1750662715422368177
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SQCqQkA4;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662719; x=1782198719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ocPx3ftMVXUw2o+0f4ioermNWUh3OxXOk3+u3RoAsjA=;
  b=SQCqQkA4ErY6hESpqnfBnE42yvDvQNdxzJhFxLaQkRr037mIzFJVjAYk
   EBF47EICAIpzeF7dc4EkxrM6vSRgqe8NAiqttUt0QG3HelVS4t/Dhwg+M
   MZOF6+23DqnNw0nlgemE1vUtehbLAyTjdWYQHpDsZXHv6gRti+/Pw7SeT
   Qak33QnyC2EOD0jDwDBvGchrX+ZQqdm4D56XqzssKU5kIGP38/I4+UiQ/
   1nImP+KdV2PdjWI0q7vvkI62T2F87WU7lyFz8y2KNHfGRnPrspYL2MH81
   N27/Uvz5iFUZL/BxfHp+nGSV6W7swBmMqjuRDn8lvSycm4J4o6epL7tjY
   g==;
X-CSE-ConnectionGUID: IBBhx47QQ0ukXCCdOLCb7g==
X-CSE-MsgGUID: AvWYBueCRDWTSVfJNZcgLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="203633457"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="203633457"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:58 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com [192.168.83.66])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id F296ED5004
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id B3760296E46
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:55 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 3812C1A0071;
	Mon, 23 Jun 2025 15:11:55 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/30] python3-starlette: upgrade 0.47.0 -> 0.47.1
Date: Mon, 23 Jun 2025 15:11:33 +0800
Message-ID: <20250623071138.402-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118054

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Use Self in TestClient.__enter__
- Allow async exception handlers to type-check

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-starlette_0.47.0.bb => python3-starlette_0.47.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-starlette_0.47.0.bb => python3-starlette_0.47.1.bb} (91%)

diff --git a/meta-python/recipes-devtools/python/python3-starlette_0.47.0.bb b/meta-python/recipes-devtools/python/python3-starlette_0.47.1.bb
similarity index 91%
rename from meta-python/recipes-devtools/python/python3-starlette_0.47.0.bb
rename to meta-python/recipes-devtools/python/python3-starlette_0.47.1.bb
index 182b6d60d5..6fdc4e6da8 100644
--- a/meta-python/recipes-devtools/python/python3-starlette_0.47.0.bb
+++ b/meta-python/recipes-devtools/python/python3-starlette_0.47.1.bb
@@ -2,7 +2,7 @@ SUMMARY = "Starlette is a lightweight ASGI framework/toolkit, which is ideal for
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.md;md5=11e8c8dbfd5fa373c703de492140ff7a"
 
-SRC_URI[sha256sum] = "1f64887e94a447fed5f23309fb6890ef23349b7e478faa7b24a851cd4eb844af"
+SRC_URI[sha256sum] = "aef012dd2b6be325ffa16698f9dc533614fb1cebd593a906b90dc1025529a79b"
 
 inherit pypi python_hatchling ptest
 
-- 
2.43.0


