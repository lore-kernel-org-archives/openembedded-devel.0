Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C927CD6E57
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:24 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21211.1780394884280178988
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=X0sJ501r;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394899; x=1811930899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2scg5EaNzrXoQXqJ2BtKVxcIE3PB8/mFyd1XLLeATzM=;
  b=X0sJ501rguuIY+ujeZquOA/ZbhWdWgkI66OI433rUojOJHCDRgIiCeUv
   xYofglsIVe/PgMDiTNwP13wybP/0glJ08Xng6XC8uJJuR9B8rfAi2dhqk
   NZqIy4/hdTnhULvfAudwcl7beI6GhJNXFj8eXeYJuYqoBQfwk4LviQmdR
   +7JsgUZ4iCLfYEvKzLRc6gZ8xNppRx9f/+T7Z5Er+oeefLVRrqwGk0Pv8
   2F5Wc7QrK7T8EQRaHoKm9N0aJr+y+A19nSke6lgtMgqgB9Yv0L1TWAbqD
   g6ycpEWdCRd1vq47gpTfMaLJufFrqClFpv/kGuuZftfzTwE9Q2oAg8b0L
   A==;
X-CSE-ConnectionGUID: VZIhlo+cSi2tx22vsThmQA==
X-CSE-MsgGUID: E4P/C268R+qkJM6K68Z0mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="245981277"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="245981277"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:19 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 63E591C00095
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:18 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 168491C1C25E
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BB8D11800522;
	Tue,  2 Jun 2026 10:08:15 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/38] libjs-jquery-cookie: upgrade 3.0.7 -> 3.0.8
Date: Tue,  2 Jun 2026 18:07:25 +0800
Message-ID: <20260602100755.2117-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260602100755.2117-1-wangmy@fujitsu.com>
References: <20260602100755.2117-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127331

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Restore ES5 compatibility, inadvertently broken in 3.0.7
- Lift Node version restriction, inadvertently restricted to >= 20 in 3.0.7

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...bjs-jquery-cookie_3.0.7.bb => libjs-jquery-cookie_3.0.8.bb} | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-oe/recipes-support/libjs/{libjs-jquery-cookie_3.0.7.bb => libjs-jquery-cookie_3.0.8.bb} (94%)

diff --git a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.7.bb b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.8.bb
similarity index 94%
rename from meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.7.bb
rename to meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.8.bb
index 7544ad4d9b..bfd07fa42c 100644
--- a/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.7.bb
+++ b/meta-oe/recipes-support/libjs/libjs-jquery-cookie_3.0.8.bb
@@ -5,8 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e16cf0e247d84f8999bf55865a9c98cf"
 
 SRC_URI = "git://github.com/js-cookie/js-cookie.git;protocol=https;branch=main;tag=v${PV}"
 
-SRCREV = "17bacba0171dd022728d8fdeba3203c60791bf58"
-
+SRCREV = "d7a10966e3f2cbcbfa96e34e7544d23aab9e3372"
 
 JQUERYCOOKIEDIR = "${datadir}/javascript/jquery-cookie"
 JQUERYCOOKIEDOCDIR = "${docdir}/libjs-jquery-cookie"
-- 
2.43.0


