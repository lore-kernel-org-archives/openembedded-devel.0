Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4168ECAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:45 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.8224.1758704438635832559
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JlYj+GrZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704438; x=1790240438;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7fp6RCgcOYHxMcJ3pKy6OArvrS9xwO0NlVKqYaOYvbo=;
  b=JlYj+GrZydnBWA2XNaCIcN5LjfLZ6FMaSBnx61Zgz3Goj55ivDnlkgtU
   Nohla9QR0YeXIpiSMeZgJDf0atNMnmpLT+rWj1pqSW0Wif2ZwAIcOX/sc
   iduPzGfXSdQ9cmVtpOGLHBwoyCkdqt+8zff4tId7HuzW9OwOqXP5XjAaB
   4c/3HF1Vj5yZ9DmRUVdp097vQubl5UkGQhtSPkt6BnPFHG8bVytXB1zuL
   EreglZT6/u1n/5tOD/gRGM3yA0gmO3Az8qDoUD3qAunb7EtHa9j5cPPEX
   FADy+uJY7+ZRXJSzsX7QWBqM+lC9sMRGHDDK+V6Fz5VvNQTZC1UK19oPR
   Q==;
X-CSE-ConnectionGUID: BnxqXUsdQ8+Ucmx2UPml4A==
X-CSE-MsgGUID: iRK0Wt9sRWiwu0/XAHPyxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="202273831"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="202273831"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:37 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id DED56C00219
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:36 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 9C376C02456
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:36 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 1DB4B402604;
	Wed, 24 Sep 2025 09:00:35 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 332311A0069;
	Wed, 24 Sep 2025 17:00:32 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/29] btop: upgrade 1.4.4 -> 1.4.5
Date: Wed, 24 Sep 2025 17:00:01 +0800
Message-ID: <20250924090029.1786-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119764

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/btop/{btop_1.4.4.bb => btop_1.4.5.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/btop/{btop_1.4.4.bb => btop_1.4.5.bb} (93%)

diff --git a/meta-oe/recipes-support/btop/btop_1.4.4.bb b/meta-oe/recipes-support/btop/btop_1.4.5.bb
similarity index 93%
rename from meta-oe/recipes-support/btop/btop_1.4.4.bb
rename to meta-oe/recipes-support/btop/btop_1.4.5.bb
index 2d187c18a8..0455da384b 100644
--- a/meta-oe/recipes-support/btop/btop_1.4.4.bb
+++ b/meta-oe/recipes-support/btop/btop_1.4.5.bb
@@ -6,7 +6,7 @@ SECTION = "console/utils"
 
 SRC_URI = "git://github.com/aristocratos/btop.git;protocol=https;branch=main;tag=v${PV} \
            "
-SRCREV = "0f398abd64febfbc5f2115be3156682f47308f48"
+SRCREV = "a1099d075fa914452366b28c67ff171e21a1f02e"
 
 
 inherit cmake
-- 
2.43.0


