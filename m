Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA6BCCF45DB
	for <webhook@archiver.kernel.org>; Tue, 13 Jan 2026 10:24:00 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.55827.1768299839932030960
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Jan 2026 02:24:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=blmMh/Cf;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1768299839; x=1799835839;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ShzoPxCISVuQGO+vO5l40GCJJNf7aNBjynrU3+ihQh8=;
  b=blmMh/Cf8H/ME0AqOvfUK9xsRNs6hWcuuho8c64ax4EdlNS6oUaqbWby
   PnCqw0kItfe8byp9CBGtTO3pi5RZ9ufKwqPsifNVVL2XDcWU+hb+OHyuS
   ExHUUy9Vw/SWPjyWvKKL6dInFVwlkDX3DzXOYlZeObCyP5TH3Q2cygXrY
   omR9UVmn/lRLgJNcz808BKewV9KTyX/vBC5/2ZCnkLASqttMcG+CUSLqW
   d41f7pBg2GBoD9JnVyFM7pqtKrrcluWvMjNnn5N6Epl2Uuq3fgklWbqhd
   uPXqUai5r97UoYHHzbRVIUIF139yvfcE/sSU7c2o8QaV+FwfjXzvKLZka
   A==;
X-CSE-ConnectionGUID: h4tZab+TSsW8paMiDywTVw==
X-CSE-MsgGUID: EwSuc3EmQo+O6lct4FmBMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="213580532"
X-IronPort-AV: E=Sophos;i="6.21,222,1763391600"; 
   d="scan'208";a="213580532"
Received: from unknown (HELO az2uksmgr4.o.css.fujitsu.com) ([52.151.125.128])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 19:23:58 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id 1DC2CC00203
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:23:58 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id C45CC1801FC6
	for <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:23:57 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.191])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id EC5E91019048;
	Tue, 13 Jan 2026 10:23:54 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/22] ctags: upgrade 6.2.20260104.0 -> 6.2.20260111.0
Date: Tue, 13 Jan 2026 18:23:14 +0800
Message-ID: <20260113102334.605-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260113102334.605-1-wangmy@fujitsu.com>
References: <20260113102334.605-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 13 Jan 2026 10:24:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123408

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260104.0.bb => ctags_6.2.20260111.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260104.0.bb => ctags_6.2.20260111.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260104.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260111.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260104.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260111.0.bb
index 71ba0eda74..5f6f550829 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260104.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260111.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "743e71b21f504fcea2f9c19b814b3d8b36cb8c81"
+SRCREV = "b11e39a7a89dc0b556e843db5aa34d0198066b9d"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


