Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6640DCD5841
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 10:29:54 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3100.1767781790749178532
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Jan 2026 02:29:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bDmkn80y;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767781790; x=1799317790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9XyTYqwdQ3eUJ7/jTHnCnmXCyL7WXr0jnZhExFVk1i4=;
  b=bDmkn80yQDklSeYmcuktdwPqV9RIFMTES88MwhKdL6EaCmBjs9UTnJ0O
   KaeEDnW000rLaVx1NFGIeJuRpD/9qd88zay0/ySwJXIce3dNnriWcU80U
   7c9TP/AOmRZH5pT5m3vSAnlKlD9XiPaiPkbwAY8bxzBFY6vfbrVV2Oc4I
   kx4WXT/wsNwwerLRt3UtnlX334AYcphvSn23uaWYa3v/IW6m6s/97fJAL
   jvvhnZxFQxCzg91aHae4QsgxP5agElUf/Ypa9jdYdHTNx+k/KvM6eQARk
   hjXb6QqO/6KtOSiIArlbCPz29ieZvaSnjvf2JZQKHl6waQrVaJg+RapnL
   A==;
X-CSE-ConnectionGUID: Wjf8eIx5TriamxXOml2ykg==
X-CSE-MsgGUID: sdqszBjaQXuy1GY8ebxlvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="229043431"
X-IronPort-AV: E=Sophos;i="6.21,207,1763391600"; 
   d="scan'208";a="229043431"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2026 19:29:48 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 5BB3D1C00081
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:49 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 10E7DC02C76
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Jan 2026 10:29:49 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 4DCE5821736;
	Wed,  7 Jan 2026 10:29:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 23/24] spdlog: upgrade 1.16.0 -> 1.17.0
Date: Wed,  7 Jan 2026 18:28:54 +0800
Message-ID: <20260107102855.228-23-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260107102855.228-1-wangmy@fujitsu.com>
References: <20260107102855.228-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Jan 2026 10:29:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123221

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: updated contributors.

Changelog:
==========
- Bump bundled {fmt} library to 12.1.0
- Fix the %z formatter (UTC offset):
- Windows: Replaced implementation for better accuracy and speed
- FreeBSD: Fixed incorrect implementation
- Fixed issue where the offset was not displaying as +00:00 when the formatter
  was configured to show UTC time.
- Removed unreliable fallback for Unix systems lacking tm_gmtoff. If
  compilation fails on such platforms, use SPDLOG_NO_TZ_OFFSET=ON (%z will
  display +??:?? instead of compilation error).
- Set CMAKE_BUILD_TYPE only in top-level project
- Change access scope for ANSI target_file_ from private to protected
- Fix UWP detection
- Fix include <fcntl.h> in tcp_client.h to avoid compilation failures
- Tests: Fix unit tests to respect default level names
- Docs: Fix misleading comment in blocking_queue header
- Fix sign-compare warning
- Fix sign conversion warnings in qt_sinks.h

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../spdlog/{spdlog_1.16.0.bb => spdlog_1.17.0.bb}             | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/spdlog/{spdlog_1.16.0.bb => spdlog_1.17.0.bb} (78%)

diff --git a/meta-oe/recipes-support/spdlog/spdlog_1.16.0.bb b/meta-oe/recipes-support/spdlog/spdlog_1.17.0.bb
similarity index 78%
rename from meta-oe/recipes-support/spdlog/spdlog_1.16.0.bb
rename to meta-oe/recipes-support/spdlog/spdlog_1.17.0.bb
index 7efa65697f..5470c0f9f7 100644
--- a/meta-oe/recipes-support/spdlog/spdlog_1.16.0.bb
+++ b/meta-oe/recipes-support/spdlog/spdlog_1.17.0.bb
@@ -1,9 +1,9 @@
 DESCRIPTION = "Very fast, header only, C++ logging library."
 HOMEPAGE = "https://github.com/gabime/spdlog/wiki"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=9573510928429ad0cbe5ba4de77546e9"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=13886a8d1692948ea9b78edc50e9447c"
 
-SRCREV = "486b55554f11c9cccc913e11a87085b2a91f706f"
+SRCREV = "79524ddd08a4ec981b7fea76afd08ee05f83755d"
 SRC_URI = "git://github.com/gabime/spdlog.git;protocol=https;branch=v1.x;tag=v${PV}"
 
 DEPENDS += "fmt"
-- 
2.43.0


