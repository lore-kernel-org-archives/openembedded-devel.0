Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53AD9C83F03
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 08:42:03 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.10841.1752050512689350969
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 01:41:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=dyv6s2wX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1752050513; x=1783586513;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=b18Ksdv4kKqSdjjnvD8ZR1/Kgb58knEgE90Lpu7H51Q=;
  b=dyv6s2wXGU1OfpP1+Exhk27CE5Y9MorTQR1zO+KScQ3vzBhD1ziGSMkF
   +CqUllVjT5Fs4a4n8TFGwau/ghcrjcZxF1HMYf/mPBfG0x3edFYGXLY5+
   0M1xo0jOakGrdMYRtoBevMQUseDojYaGzk/aSErVqckigvLpx99OdL1Ge
   QemB2a2lFHmBlimS0FNO7yyoJSI4/4UXlLRb9KrtwjtguyR+/EV04NQr0
   GC+wZ9KEMZirInknfZynKDWfEX56sTGQKT5cSHAKApbmcllGB947/PYtI
   4JU0gJtkh2ixmADTeIJWJaXXxE4cNU0tvoRPdbvwqG0rmQL9zVjGCCU0e
   w==;
X-CSE-ConnectionGUID: 0dd8MzhARga+Nj/mzTwYZQ==
X-CSE-MsgGUID: BZxVxkTvTzaFP10At4T/Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="205024755"
X-IronPort-AV: E=Sophos;i="6.16,298,1744038000"; 
   d="scan'208";a="205024755"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.19])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 17:41:51 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id DF1BB1002B91
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Jul 2025 08:41:50 +0000 (UTC)
Received: from yto-m1.gw.nic.fujitsu.com (yto-m1.gw.nic.fujitsu.com [10.128.47.162])
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTP id 66B2418001C1
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Jul 2025 08:41:50 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id C7D15CFA44
	for <openembedded-devel@lists.openembedded.org>; Wed,  9 Jul 2025 17:41:48 +0900 (JST)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 330291A0074;
	Wed,  9 Jul 2025 16:41:48 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH v2] jq: upgrade 1.8.0 -> 1.8.1
Date: Wed,  9 Jul 2025 16:41:45 +0800
Message-ID: <20250709084145.474-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 08:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118346

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Add LICENSE notice of NetBSD's strptime() to COPYING

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-devtools/jq/{jq_1.8.0.bb => jq_1.8.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/jq/{jq_1.8.0.bb => jq_1.8.1.bb} (90%)

diff --git a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
similarity index 90%
rename from meta-oe/recipes-devtools/jq/jq_1.8.0.bb
rename to meta-oe/recipes-devtools/jq/jq_1.8.1.bb
index 4aaf27da9a..b9383c76f7 100644
--- a/meta-oe/recipes-devtools/jq/jq_1.8.0.bb
+++ b/meta-oe/recipes-devtools/jq/jq_1.8.1.bb
@@ -5,14 +5,14 @@ DESCRIPTION = "jq is like sed for JSON data, you can use it to slice and \
 HOMEPAGE = "https://jqlang.github.io/jq/"
 BUGTRACKER = "https://github.com/jqlang/jq/issues"
 SECTION = "utils"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://COPYING;md5=08ffb5ac7e7e6bfc66968b89f01f512a"
+LICENSE = "MIT & BSD-2-Clause"
+LIC_FILES_CHKSUM = "file://COPYING;md5=cf7fcb0a1def4a7ad62c028f7d0dca47"
 
 GITHUB_BASE_URI = "https://github.com/jqlang/${BPN}/releases/"
 SRC_URI = "${GITHUB_BASE_URI}/download/${BPN}-${PV}/${BPN}-${PV}.tar.gz \
     file://run-ptest \
     "
-SRC_URI[sha256sum] = "91811577f91d9a6195ff50c2bffec9b72c8429dc05ec3ea022fd95c06d2b319c"
+SRC_URI[sha256sum] = "2be64e7129cecb11d5906290eba10af694fb9e3e7f9fc208a311dc33ca837eb0"
 
 inherit autotools github-releases ptest
 
-- 
2.43.0


