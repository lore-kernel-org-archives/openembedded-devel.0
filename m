Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 925F9C44507
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 10:40:52 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3455.1784112046904321204
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Jul 2026 03:40:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=CFMpxycr;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1784112047; x=1815648047;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jxioeQVgd8xu9ttnF8dSxCYtZCYc5e3H6XTSB088+V0=;
  b=CFMpxycr9EF3tjRYJoCCzZt2HpjQOU06EFbQZgIanGFRap96ET9Oy/dt
   otlDcYysnZoI+p6d14i3vIJOqjcZbwfwl1eyB1AjRT0yIzxrMLrWF8W3B
   CRQnzUDKw9FR/DcWn+RBaeYKOVelTJ4GmJF4KcbtCuHz1+y+dhcFH4SbJ
   oHlfDLqtyipxMj/eenIwUL1QI1HVcIQwN89rpvVPAA/OWMRaxnlXjVB6d
   qOddJKMUTum3bT2ENEigOB4hh6HRjhtVje9p+Z+0UjwSWENgvKRU9PrRJ
   6rNBjM2/iD12XcI87UlKsGVJMeCj47SZB35kn2nJR98U7ULF+ijpbX87p
   Q==;
X-CSE-ConnectionGUID: tkW578puRXiPBFF0Z4v4Bw==
X-CSE-MsgGUID: PKdo58doSD+JwB+Y4s21oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="246968223"
X-IronPort-AV: E=Sophos;i="6.25,165,1779116400"; 
   d="scan'208";a="246968223"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2026 19:40:45 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 56F171C01699
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:45 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (unknown [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 07C7D18471EA
	for <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:45 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 235801801122;
	Wed, 15 Jul 2026 10:40:42 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 44/44] xwud: upgrade 1.0.7 -> 1.0.8
Date: Wed, 15 Jul 2026 18:39:14 +0800
Message-ID: <20260715103914.2120-44-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260715103914.2120-1-wangmy@fujitsu.com>
References: <20260715103914.2120-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 15 Jul 2026 10:40:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128217

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-graphics/xorg-app/{xwud_1.0.7.bb => xwud_1.0.8.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-graphics/xorg-app/{xwud_1.0.7.bb => xwud_1.0.8.bb} (82%)

diff --git a/meta-oe/recipes-graphics/xorg-app/xwud_1.0.7.bb b/meta-oe/recipes-graphics/xorg-app/xwud_1.0.8.bb
similarity index 82%
rename from meta-oe/recipes-graphics/xorg-app/xwud_1.0.7.bb
rename to meta-oe/recipes-graphics/xorg-app/xwud_1.0.8.bb
index 27138f23f8..4291e01a1f 100644
--- a/meta-oe/recipes-graphics/xorg-app/xwud_1.0.7.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xwud_1.0.8.bb
@@ -9,4 +9,4 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=31e8892c80b7a0c1c5f37c8e8ae6d794"
 
 SRC_URI_EXT = "xz"
-SRC_URI[sha256sum] = "e55cbedab36d7a5f671abf8e594888afc48caa116d51d429ea53ea317ec0c61e"
+SRC_URI[sha256sum] = "2e282648c34018fd870052b8d814ea4d35ad9fdb9bcfc8bdc5a06822c0f86e99"
-- 
2.43.0


