Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86858CD37AC
	for <webhook@archiver.kernel.org>; Wed, 13 May 2026 04:17:18 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.209.1778645828485237545
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 12 May 2026 21:17:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=eEPfCM1j;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1778645829; x=1810181829;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=dbWshXD+gYMSUzkvCcpU5hN+Dx/oq6w38H4DK6XVrUY=;
  b=eEPfCM1jc2H+6306oT/llcP57IKEdqfb65NOJFe2W56nAHt3CttVg2R/
   OdI52Icc3J1clN+6xF6uJNQRvDbYDtw3kNccPi9XOVP/yuhYA/sayhKCY
   znoCGIjW128zvWkJAfVOLrmD7Slks+lo1uk+YhQwOFZ+Y5YPL0QhbuZ0s
   A6lQZhwtTm5FcWvlKwMtbSi2bNcPC/NXHT+Wgz3jMYQUmmAEjxlvn0xH1
   4R8Pi3wr8oAEFPNAop09nRdYHZHL263EQsCcWLpWww9Q7CkanoE+jk7il
   x1bVxunlDgfgboe12Bby6CQ8Q3R+TqJbDCK+7nVAzNSiAFVaN7gsDbWGc
   w==;
X-CSE-ConnectionGUID: 56xsuGSJQfKHtLC/fTMVtQ==
X-CSE-MsgGUID: pNEk5RKVT+ShnuFTIpFOVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="240208137"
X-IronPort-AV: E=Sophos;i="6.23,232,1770562800"; 
   d="scan'208";a="240208137"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 13:17:08 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id AC2AD4071DC
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:37 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5CE7CC006C5
	for <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:16:37 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id E234B1019058;
	Wed, 13 May 2026 04:16:34 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 38/56] python3-pytest-codspeed: upgrade 4.4.0 -> 4.5.0
Date: Wed, 13 May 2026 12:16:07 +0800
Message-ID: <20260513041626.412-3-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260513041626.412-1-wangmy@fujitsu.com>
References: <20260513041626.412-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 13 May 2026 04:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126925

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Pre-build macos binary
- Bump instrument-hooks submodule to use int32_t as pid
- Add macos integration test

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ytest-codspeed_4.4.0.bb => python3-pytest-codspeed_4.5.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-pytest-codspeed_4.4.0.bb => python3-pytest-codspeed_4.5.0.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.4.0.bb b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.5.0.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-pytest-codspeed_4.4.0.bb
rename to meta-python/recipes-devtools/python/python3-pytest-codspeed_4.5.0.bb
index efab39fd5f..20cf02504f 100644
--- a/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.4.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pytest-codspeed_4.5.0.bb
@@ -4,7 +4,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=2856cbe664e8843cd4fd4c1d1d85c2c3"
 
 DEPENDS = "python3-cffi-native"
-SRC_URI[sha256sum] = "edb7c101d9c50439a42cf02cfa9c0ac92da618841636bbebf87c3fa54669442a"
+SRC_URI[sha256sum] = "deb6ab9c9b07eba56fcb7b97206c7e48aaff697b6f73a013d8dbe4f62e76afd3"
 
 inherit pypi python_hatchling
 
-- 
2.43.0


