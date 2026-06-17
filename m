Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 781F8CD98E2
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 08:58:48 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11089.1781686722001189845
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 17 Jun 2026 01:58:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=qqOQEi/k;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781686722; x=1813222722;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HSNO0LPWCNOd7xVn28SwGjl9c2HGiYt6Uq+v4xb485Y=;
  b=qqOQEi/kxL4w6eJwSXefZD1iATkmZncbliJ5aKxiKF3lutKRwbCTRpof
   uWp89kRZpkhuPCdHg4mrJUil5b2wFkjiPz4hOcCww4Z+TtrCoVozXdXta
   g29su7xAZsZG+GrOmEqM9DP1HqNKRpydVkHUyVwJI0vgNN/B5hZIN4K5M
   MJwHTdF2P+fLhXVntVvjJbJwGD0Ykk1Y0eLFCAzUd8DP0XUAfODADy0V2
   B/7q53N6W+dMO4GBtQ8yLuRaPJUxNtXMehZ96LRJF8+ReYN/JST0UhphG
   G31LYvNmI//SkRyZiOrtBlczvsCmTQwe+CqIV88yd5Ae9PdjYSuHQIEr4
   g==;
X-CSE-ConnectionGUID: VNxGHrGSQkW6bt5f8ogR9w==
X-CSE-MsgGUID: ZWkmftxWTyuAnPnhW4VmFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="247746109"
X-IronPort-AV: E=Sophos;i="6.24,209,1774278000"; 
   d="scan'208";a="247746109"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2026 17:58:40 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7657542A33B
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:40 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 280CD1003BFE
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:40 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 3C05E10017CF;
	Wed, 17 Jun 2026 08:58:37 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 16/17] rabbitmq-c: upgrade 0.15.0 -> 0.16.0
Date: Wed, 17 Jun 2026 16:58:06 +0800
Message-ID: <20260617085807.542-16-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260617085807.542-1-wangmy@fujitsu.com>
References: <20260617085807.542-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Jun 2026 08:58:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127653

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Fix out-of-bounds read via undersized frames in amqp_handle_input
- Fix client crash when server negotiates frame_max below the AMQP protocol
  minimum
- Add amqp_bytes_from_buffer macro to create amqp_bytes_t from an arbitrary
  byte buffer with explicit length
- Fix NULL pointer dereferences on allocation failure in tools/publish.c
- Fix NULL pointer dereference in tools/consume.c stringify_bytes() on
  allocation failure
- Fix file stream leak in tools/common.c read_authfile()
- Fix handling of absolute CMAKE_INSTALL_INCLUDEDIR in exported CMake targets
- amqp_literal_bytes macro now uses an explicit (void *) cast

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../rabbitmq-c/{rabbitmq-c_0.15.0.bb => rabbitmq-c_0.16.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-connectivity/rabbitmq-c/{rabbitmq-c_0.15.0.bb => rabbitmq-c_0.16.0.bb} (86%)

diff --git a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.16.0.bb
similarity index 86%
rename from meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
rename to meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.16.0.bb
index 4fd6302f2c..c4428008db 100644
--- a/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.15.0.bb
+++ b/meta-oe/recipes-connectivity/rabbitmq-c/rabbitmq-c_0.16.0.bb
@@ -3,9 +3,9 @@ HOMEPAGE = "https://github.com/alanxz/rabbitmq-c"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=7e12f6e40e662e039e2f02b4893011ec"
 LICENSE = "MIT"
 
-SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https \
+SRC_URI = "git://github.com/alanxz/rabbitmq-c.git;branch=master;protocol=https;tag=v${PV} \
 "
-SRCREV = "84b81cd97a1b5515d3d4b304796680da24c666d8"
+SRCREV = "800d57c9ca7352181167ec3c6aba66b8518c321c"
 
 
 DEPENDS = "popt openssl"
-- 
2.43.0


