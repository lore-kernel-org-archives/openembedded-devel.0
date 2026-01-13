Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93F7CF45DA
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:00 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.56059.1768299837015371587
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:23:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qJl8/cgk;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299836; x=1799835836;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=xz704jpDyjvANGI/urdon9HyCioRXoMTovQpqzhmBoI=;
  b=qJl8/cgknVYL3wdKJlt0BSUmvdwpqgWcCRGeXQeinn/1nSVQf0M1mObJ
   +liOOnxLk8cClETC+W3UwlsMFRgEu+Z1HzzyGUS69H3hKqJe7nZnRwDH7
   iTaXLNDLq1Xdzy/YHS95kzfY4gl2ZzrgSut2kD/p/A6RYOUM8fl9qUe3T
   4OGgZErWe8uKB8OoFboWT2pzznE5WwNMUvh2exVAjWMMdmD6tik/uDjBt
   jx20piGNKgIZF8f/0JkaecHPV5h2S1e1+I7M1OHuOeudO15ZtNQhaISE2
   Xj5hypLlD7BIZ4vZF6fDjhotrHLJLNvdO1Y0mzyOiGltB/BI7kpQTJfVC
   g==;
X-CSE-ConnectionGUID: 8WRES6XESxqGAhTlDREWjw==
X-CSE-MsgGUID: z4ePeGH8Tg6a+v1JmDHSCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="225654334"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="225654334"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:23:54 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 19C3CC00203
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:23:55 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C251D18000A4
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:23:54 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E49581019045;
	Tue, 13 Jan 2026 10:23:51 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/22] abseil-cpp: upgrade 20250814.1 -> 20260107.0
Date: Tue, 13 Jan 2026 18:23:13 +0800
Message-ID: <20260113102334.605-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123407

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{abseil-cpp_20250814.1.bb => abseil-cpp_20260107.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/abseil-cpp/{abseil-cpp_20250814.1.bb => abseil-cpp_20260107.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
rename to meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
index 0394f36cdb..e2bce0be11 100644
--- a/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20250814.1.bb
+++ b/meta-oe/recipes-devtools/abseil-cpp/abseil-cpp_20260107.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://github.com/abseil/${BPN}/releases/download/${PV}/${BP}.tar.gz
            file://0001-absl-always-use-asm-sgidefs.h.patch \
            file://0002-abseil-ppc-fixes.patch \
            "
-SRC_URI[sha256sum] = "1692f77d1739bacf3f94337188b78583cf09bab7e420d2dc6c5605a4f86785a1"
+SRC_URI[sha256sum] = "4c124408da902be896a2f368042729655709db5e3004ec99f57e3e14439bc1b2"
 
 UPSTREAM_CHECK_URI = "https://github.com/abseil/abseil-cpp/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)"
-- 
2.43.0


