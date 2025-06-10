Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A57E9C71156
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 03:33:51 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.78428.1749526421105776628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jun 2025 20:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=OGJV5SS/;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1749526421; x=1781062421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xM/D9mlun5wJrLECXQJ9BJYjqVPV87dfJZoY89vNihU=;
  b=OGJV5SS/usJFv3LSoHWBeAs+qquJKqw9ljVT/gu/LyFJXuwnsNflz9pB
   4UZM7fbHB8a4nnBH6T33lXwAxx0MhK+9Hy0fP5pKDFdDmGZpprENJC6Ey
   hmOpO68r/twn8HUaB/JTJxtHliRa8HDqcfTWA6q6HejednGKokbQnKUN8
   jYGzsx+BTdlzJuMpIY0u2zjyBm0tTQnQIoeny7RC8FI5G9kx/uJKRubsU
   +2PJPgrPRz7rd82a5zXN9hcxw4neJRTUL8RpIjgNx8EzFvZKMyspCU3Cz
   lSHDOgb/L458DmeMsJ8SauakGRIK5tkTVYYLxoZVuSsiCzvpjN/tBgIbN
   g==;
X-CSE-ConnectionGUID: IHTSr6QyQ46/ll6M18Ym2A==
X-CSE-MsgGUID: 5G7UPpiITzmnVv60e+AX8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="189594977"
X-IronPort-AV: E=Sophos;i="6.16,224,1744038000"; 
   d="scan'208";a="189594977"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 12:33:39 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id F0C80C13C5
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:36 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9BCD7BF3C1
	for <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 12:33:36 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 8353A1A009A;
	Tue, 10 Jun 2025 11:33:35 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/64] doxygen: upgrade 1.13.2 -> 1.14.0
Date: Tue, 10 Jun 2025 11:32:31 +0800
Message-ID: <20250610033330.924-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250610033330.924-1-wangmy@fujitsu.com>
References: <20250610033330.924-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 10 Jun 2025 03:33:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117798

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 https://www.doxygen.nl/manual/changelog.html#log_1_14_0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../doxygen/{doxygen_1.13.2.bb => doxygen_1.14.0.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/doxygen/{doxygen_1.13.2.bb => doxygen_1.14.0.bb} (92%)

diff --git a/meta-oe/recipes-devtools/doxygen/doxygen_1.13.2.bb b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
similarity index 92%
rename from meta-oe/recipes-devtools/doxygen/doxygen_1.13.2.bb
rename to meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
index aa2dc7da46..1c8b442eef 100644
--- a/meta-oe/recipes-devtools/doxygen/doxygen_1.13.2.bb
+++ b/meta-oe/recipes-devtools/doxygen/doxygen_1.14.0.bb
@@ -10,7 +10,7 @@ SRC_URI = "\
     git://github.com/doxygen/doxygen.git;branch=master;protocol=https \
 "
 
-SRCREV = "26342b775ea25e6fefb53220926b20702c56fcb3"
+SRCREV = "cbe58f6237b2238c9af7f51c6b7afb8bbf52c866"
 
 S = "${WORKDIR}/git"
 
-- 
2.43.0


