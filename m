Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A210CCD8CBD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:41 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76500.1781000972272241171
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NkAEJ7T6;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000973; x=1812536973;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NBrEuB/SD5ZqlRV9Pn5y0YXiFt7aQhi5GYR5NGlQCFQ=;
  b=NkAEJ7T6ePe6tAlM8zmZ0KO5w5nsqqRkCkVxkmH7oicPfgp93RiDg6fR
   Vp6Ymj67X9daAmuwiIg+1uF95db5MJwQZMeTRQ//chqIssOfhhwIaEqwd
   Lv/7Tu5ioeFy3X9eB7k1ta2wuCL3Ur2oD5dEv6GFaihLtherPUNyVXrb4
   CjOgnXfb1RncNjKH4nBZ6nsYM/7NXqTK6i5YKCH9sJ15QcR6VBepE1NnG
   orTelVbWTC3zH6XC5GggpJ2R5MR4rlniZ8umEHdvvw3JmaFf8m5op9XcP
   VWnJSxUHOrOHfTUDYx7ZuNkeJEi4+t/myRwdBm7b/+51ofKdaewXw0BXs
   Q==;
X-CSE-ConnectionGUID: 2ce0V0/eS5GeTO+i23Eh3Q==
X-CSE-MsgGUID: odDZM+WVT6SM/L2wvk7T2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="243544139"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="243544139"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:31 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A600E1000340
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:30 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 58EE2188C998
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 691D310003C5;
	Tue,  9 Jun 2026 10:29:28 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/30] freeipmi: upgrade 1.6.17 -> 1.6.18
Date: Tue,  9 Jun 2026 18:28:48 +0800
Message-ID: <20260609102913.2204-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127459

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../freeipmi/{freeipmi_1.6.17.bb => freeipmi_1.6.18.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.17.bb => freeipmi_1.6.18.bb} (93%)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb
similarity index 93%
rename from meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
rename to meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb
index 7970e0f563..92290f5010 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.17.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.18.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
 SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
-SRC_URI[sha256sum] = "16783d10faa28847a795cce0bf86deeaa72b8fbe71d1f0dc1101d13a6b501ec1"
+SRC_URI[sha256sum] = "8098b23820038ad0aa39abf0f9a012e24683d384d9f91e760acb2a68b465e0fe"
 
 DEPENDS = "libgcrypt"
 DEPENDS:append:libc-musl = " argp-standalone"
-- 
2.43.0


