Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71353EFD233
	for <webhook@archiver.kernel.org>; Wed, 25 Feb 2026 09:38:31 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.42054.1772012305885105271
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Feb 2026 01:38:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BlbBONP1;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772012306; x=1803548306;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=34jwutIwjVLmKrxRFLCw4iueuaHCWS7QhACXRu0rUJM=;
  b=BlbBONP19p//cRRg20UYFpmW9o9rqTSEM2FTBRihGGTRIT5waS2R0sRi
   sV4KoGC5hXFYqlYc2jHBzM6yeqqfEqF/+twOQXDEXPlbXq/JUX7xoVvBv
   g0KfvAoU3mFpybPsud9sJt60CYpJCWoOF6YTtdsVW39TtGBO7dvJUaKwj
   iLAI5VH+ooXlDoZbt0zG8XjTe937LvlFTwo+H3Asn1kE6qKahPYFBiqts
   08fdMr5zUYmaOUCaJIqDpCC3ZVovlnc3eIY3sL6cN7010vT0YcbP2+aMu
   8tJ9T3rZiaAB0gTNqUULX0s0D1RpX1mtfccqA8KpG9sm5tbYQYWBvnzJt
   g==;
X-CSE-ConnectionGUID: ZZiRB4kJTu+KEPdcrS/GDg==
X-CSE-MsgGUID: CfVteRpySki5S2/kecn+eA==
X-IronPort-AV: E=McAfee;i="6800,10657,11711"; a="230998338"
X-IronPort-AV: E=Sophos;i="6.21,310,1763391600"; 
   d="scan'208";a="230998338"
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.fujitsu.com (Postfix) with ESMTPS id 52C101C000A4
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:24 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E7A21140060C
	for <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:23 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 047BA101BB42;
	Wed, 25 Feb 2026 09:38:20 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 24/33] nano: upgrade 8.7 -> 8.7.1
Date: Wed, 25 Feb 2026 17:37:18 +0800
Message-ID: <20260225093727.1284-24-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260225093727.1284-1-wangmy@fujitsu.com>
References: <20260225093727.1284-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 25 Feb 2026 09:38:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124636

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-support/nano/{nano_8.7.bb => nano_8.7.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/nano/{nano_8.7.bb => nano_8.7.1.bb} (87%)

diff --git a/meta-oe/recipes-support/nano/nano_8.7.bb b/meta-oe/recipes-support/nano/nano_8.7.1.bb
similarity index 87%
rename from meta-oe/recipes-support/nano/nano_8.7.bb
rename to meta-oe/recipes-support/nano/nano_8.7.1.bb
index b6c65a6f31..e62529ff9b 100644
--- a/meta-oe/recipes-support/nano/nano_8.7.bb
+++ b/meta-oe/recipes-support/nano/nano_8.7.1.bb
@@ -13,7 +13,7 @@ RDEPENDS:${PN} = "ncurses-terminfo-base"
 PV_MAJOR = "${@d.getVar('PV').split('.')[0]}"
 
 SRC_URI = "https://nano-editor.org/dist/v${PV_MAJOR}/nano-${PV}.tar.xz"
-SRC_URI[sha256sum] = "afd287aa672c48b8e1a93fdb6c6588453d527510d966822b687f2835f0d986e9"
+SRC_URI[sha256sum] = "76f0dcb248f2e2f1251d4ecd20fd30fb400a360a3a37c6c340e0a52c2d1cdedf"
 
 UPSTREAM_CHECK_URI = "${GNU_MIRROR}/nano"
 
-- 
2.43.0


