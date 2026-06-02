Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218EACD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:55 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21225.1780394928994352269
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kUcGubUP;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394929; x=1811930929;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DxznJdOR3wqZ75bvQeEbmIB2qvmpa1JIPEL8+LZfN4s=;
  b=kUcGubUP1TEnQ6Rz36hC+iP/D4kXjEY8+3uIC/Z2yriJ8UjgMEy3vfoO
   3YeUiT/a77J/Emh2Kwb2sYTgTd7oxp0IuBdBbT6zPVW1C9AaYGkHY65JN
   y/6dB9MtjBRGBGKEM8u0jRNwsomGBv0m6+82mIoN7hvEoYkqGNB0FfCMj
   OIQOjh5ceifXPHQ56uom+zVPm/AMPk+G1KplWwXWo71tg8NDNbhkDJpnM
   9jp4espSb4M5XWKC32AUDXIt2dk104kUoPLqTtv8Yh2qsA4hdkkAp2kkA
   vXcnIKnQt5gnatzNz6xVBPufZUF4iS2XIJTsqTb94fvK1M9Du6FIBePJ2
   Q==;
X-CSE-ConnectionGUID: oaajvw5FS7W8WTxAI6wgcw==
X-CSE-MsgGUID: +Wl28vBGQiy2Js1B1FT7Bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="242741694"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="242741694"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:47 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 7AD2842A335
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:47 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 2B1F918026D4
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3FDEA1800587;
	Tue,  2 Jun 2026 10:08:45 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 26/38] python3-redis: upgrade 7.4.0 -> 8.0.0
Date: Tue,  2 Jun 2026 18:07:42 +0800
Message-ID: <20260602100755.2117-26-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127348

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../python/{python3-redis_7.4.0.bb => python3-redis_8.0.0.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-redis_7.4.0.bb => python3-redis_8.0.0.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-redis_7.4.0.bb b/meta-python/recipes-devtools/python/python3-redis_8.0.0.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-redis_7.4.0.bb
rename to meta-python/recipes-devtools/python/python3-redis_8.0.0.bb
index 5978ef51e1..c1ecbb90e5 100644
--- a/meta-python/recipes-devtools/python/python3-redis_7.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-redis_8.0.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=609ded3add9111c4c6e102f1d421d3f8"
 # Prefix archive to avoid clashing with the main redis archives
 PYPI_ARCHIVE_NAME_PREFIX = "pypi-"
 
-SRC_URI[sha256sum] = "64a6ea7bf567ad43c964d2c30d82853f8df927c5c9017766c55a1d1ed95d18ad"
+SRC_URI[sha256sum] = "a00c5355432051ac14e593b8b197fc76c887ee12d55a0984f69328a1115fdc49"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


