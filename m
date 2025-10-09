Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AD3CCD189
	for <webhook@archiver.kernel.org>; Thu,  9 Oct 2025 06:08:44 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.web10.5577.1759990119878946955
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 23:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=g1aVuxHI;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1759990119; x=1791526119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZbHcYMlaiXVAyTFmr+HBiEhxmPYeSIe+pf1n8irjhpE=;
  b=g1aVuxHIRj1PKrmVv4n57tLpKRpmsA/Jf4oLAs5t9IWUxIgDWC4Bm3EA
   usQabW1+hVti32cXjP+IkeHTzXFIUHji0ky9sPqi45zqpNZODHhkBQvAB
   VqItjB1wCSdzcQh5AF/V2YouLqwZwBmHO2yRkMNGWbjIyZSTK8F2DlsQy
   Tx6cid4jdVA+euXpRskGgbDRfKqsl9tZcqya1WxTvpWQJ0hzJQQprRkui
   aM95JTIrzDytlRrcF92T/l3tZgZORluFjKRmIRsEoJ04gSetvyyunmscd
   I/R8+nmutD59OV4v71NTXEi4tJZxziE0NbPQcvMIiHVOk51AH9vQFo/TK
   g==;
X-CSE-ConnectionGUID: iWPS9t7cS8CJDRs2OQ1AHg==
X-CSE-MsgGUID: LZ6rplfzR0S4zXPnkBaqfg==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="216020908"
X-IronPort-AV: E=Sophos;i="6.19,215,1754924400"; 
   d="scan'208";a="216020908"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.19])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 15:08:38 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 5029AC000B7
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:38 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 0D8C41803175
	for <openembedded-devel@lists.openembedded.org>; Thu,  9 Oct 2025 06:08:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id BD9731001CE2;
	Thu,  9 Oct 2025 06:08:35 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 12/22] python3-grpcio-channelz: upgrade 1.75.0 -> 1.75.1
Date: Thu,  9 Oct 2025 14:07:59 +0800
Message-ID: <20251009060809.445-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251009060809.445-1-wangmy@fujitsu.com>
References: <20251009060809.445-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Oct 2025 06:08:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120409

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...cio-channelz_1.75.0.bb => python3-grpcio-channelz_1.75.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio-channelz_1.75.0.bb => python3-grpcio-channelz_1.75.1.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.0.bb b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.1.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.1.bb
index 8296a0af1a..173f22aded 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio-channelz_1.75.1.bb
@@ -11,7 +11,7 @@ DEPENDS += "python3-grpcio"
 PYPI_PACKAGE = "grpcio_channelz"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "d521973a343806a8384bf87ceae93cf2e9f10f8fab02c12be7a2e3d5d0e4e68f"
+SRC_URI[sha256sum] = "e0caa06d4de3eb62d3fdc54e5c9dc9003aa3ee21e9c50f5d3538aea854d276f2"
 
 RDEPENDS:${PN} = "python3-grpcio"
 
-- 
2.43.0


