Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928D7C021B1
	for <webhook@archiver.kernel.org>; Mon, 10 Feb 2025 09:02:07 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web10.46629.1739178123453315404
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Feb 2025 01:02:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k2ppStMM;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1739178124; x=1770714124;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=mmpqPSP85lH2IwVnrmWwfIqWqA5UAP3hK8XweNAmAN0=;
  b=k2ppStMMa+cPWvMzX0eGxF2V6gj7aTLYYDZzXk9592ePBqBrFjNvINNr
   Q/33VTq8QUTIwQmjJZXiSw4CVLlmWNrYO0kYTTEpf3Nq2VfuywcYaPmCN
   1FX+1gsLo+7+/DMqhCgfCM2gi76PvHwp4MUr9tfvQt8jcorfx0R1kfPL8
   ING0IYM5VLOn9yJPd+Mvq+PYsGIg9LOzlCJzSe1PAICofUcYuCTdQTUPf
   wI0KDQpqoeSmjR5WE3xb/KXGRR5CBcDIm21yeKJt7jDLR5c9Q2ObRg5wn
   ZqXHpFKRe0rP8X3JTHFs2PPooGPfiZNZFBYyPYIF1Aj+NmzNtja2Dwobl
   Q==;
X-CSE-ConnectionGUID: X04drOpLQ+qa2MUXye0FIg==
X-CSE-MsgGUID: 6Pbhks14Sfu+L4yL9fZRzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="168935941"
X-IronPort-AV: E=Sophos;i="6.13,274,1732546800"; 
   d="scan'208";a="168935941"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 18:02:02 +0900
Received: from oym-m3.gw.nic.fujitsu.com (oym-nat-oym-m3.gw.nic.fujitsu.com [192.168.87.60])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 27246C2267
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:02:00 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id E2252D7492
	for <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 18:01:59 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8808D1A006C;
	Mon, 10 Feb 2025 17:01:59 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 39/66] python3-grpcio-reflection: upgrade 1.69.0 -> 1.70.0
Date: Mon, 10 Feb 2025 17:01:08 +0800
Message-Id: <1739178095-26432-39-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
References: <1739178095-26432-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 10 Feb 2025 09:02:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115367

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...reflection_1.69.0.bb => python3-grpcio-reflection_1.70.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-reflection_1.69.0.bb => python3-grpcio-reflection_1.70.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.69.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.70.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-reflection_1.69.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-reflection_1.70.0.bb
index 7720ab2fa7..08d94a0084 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.69.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-reflection_1.70.0.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_reflection"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "3474aaedfb10d8da5503135a2fb9fbb4e1f72044ad7ee2d0bf22090934e80908"
+SRC_URI[sha256sum] = "af46ce13e57fd7602deaef5b1d1903f6644f8982cc00f62fa9fa5b928acf6a49"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


