Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA321C7EE31
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 07:12:07 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.13874.1750662712468065205
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Jun 2025 00:11:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Qny+FU9l;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1750662719; x=1782198719;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pPF92D06LN9k0806CnxuofufeojWb04crYHpn6yW/JA=;
  b=Qny+FU9lSbwCWYvBfaoiwsvPiFnJ//Ez1JJ5KpTnAnMT0/j7OX4PbXHJ
   Td6nVo61YtnUZq/zMlUiZAgi1HaZbPcKTzTr7FRIfA20HgZIvhTvgrI0m
   I4mGcg1snAEwCLzFuaTohCK/m7Q9Mt5GsrmGw0d7EyAu/iJ7Aguz+B/nd
   h+J8nvoX4Y8ONcE8J5zuIWpxIgI2oLMKuvBGZHUKnCbSCTve8z7gYR2dv
   EzeW47ozxM9UDQgu+jZdM8wyyzVE8CSfIc5CH93fz/hEqBnACQinlijzL
   B1LxYAXTq/vkRPDulQhZ31Dx0KptUZS6cOrhhDOcv+IlrwlZCdaIRZVLo
   w==;
X-CSE-ConnectionGUID: mnXyyqy3Q9ekKiyuNb4x6Q==
X-CSE-MsgGUID: cgoRhWMIRJ2K49QxQc2FhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="192069989"
X-IronPort-AV: E=Sophos;i="6.16,258,1744038000"; 
   d="scan'208";a="192069989"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 16:11:56 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id 0DAE9E8FDB
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id BB396D7624
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 16:11:53 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 40FDB1A0073;
	Mon, 23 Jun 2025 15:11:53 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 21/30] python3-pydot: upgrade 4.0.0 -> 4.0.1
Date: Mon, 23 Jun 2025 15:11:28 +0800
Message-ID: <20250623071138.402-21-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250623071138.402-1-wangmy@fujitsu.com>
References: <20250623071138.402-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Jun 2025 07:12:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118055

From: Wang Mingyu <wangmy@fujitsu.com>

Fixed:
- Updated pyparsing to '>=3.1.0'. Required for pydot to function correctly.
- Parser: Fixed 'strict' handling.
  The parser wasn't capturing the 'strict' keyword when parsing dot data. Now it does.
- Parser: Support backslash continuation in quoted IDs.
- Parser: Support +-concatenated quoted strings.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-pydot_4.0.0.bb => python3-pydot_4.0.1.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/python3-pydot/{python3-pydot_4.0.0.bb => python3-pydot_4.0.1.bb} (76%)

diff --git a/meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.0.bb b/meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.1.bb
similarity index 76%
rename from meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.0.bb
rename to meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.1.bb
index 10e55a6e67..d62d5014de 100644
--- a/meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.0.bb
+++ b/meta-python/recipes-extended/python3-pydot/python3-pydot_4.0.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://github.com/pydot/pydot"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSES/MIT.txt;md5=7dda4e90ded66ab88b86f76169f28663"
 
-SRC_URI[sha256sum] = "12f16493337cade2f7631b87c8ccd299ba2e251f3ee5d0732a058df2887afe97"
+SRC_URI[sha256sum] = "c2148f681c4a33e08bf0e26a9e5f8e4099a82e0e2a068098f32ce86577364ad5"
 
 inherit pypi python_setuptools_build_meta
 
-- 
2.43.0


