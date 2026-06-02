Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD8E6CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 10:08:03 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21481.1780394882972472487
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jun 2026 03:08:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ItXFG8O1;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1780394883; x=1811930883;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nnF0L7cPx34KFjEZgRXD+0tD/R2KfeGhM6UVkyP/RyI=;
  b=ItXFG8O1QHb8IG6gRw3Bqw+at6Qvt7U2RC3QPkdTuov2ye4BS11xsIXD
   qnqyWx7qhzjV5r+jLMk22NWF/bBECcZgPcV18r+ZS5v7L7NSez8B8cm0W
   4vwhUfgbx8y3z6u4BgNC8pBdGzJfEaOHzbIAGPuz+eaZcJRxHdVDvQzUT
   6k2wmG8jUEv/XGec9e+ZAis29HDtJv5MR8UADv7vavAmO6+fPn9g/PZEY
   FxPIkQt2H0hZqIduCJhHPE+C7MVzfH+Q0z+7Z5ewL3BhK99tRMC5Gpxem
   tKdgegROxtb/ivikJJQCNhTmoj1DqhGp2thNmCsnh1zl6mjEBEK+zhDi3
   Q==;
X-CSE-ConnectionGUID: 0fkZN7gyTOqy5EljdNhUKg==
X-CSE-MsgGUID: NUBvE2AmQNuSBHWFVGhOTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="230084871"
X-IronPort-AV: E=Sophos;i="6.24,183,1774278000"; 
   d="scan'208";a="230084871"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 19:08:01 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 481011002B84
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:01 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id F2FFF14771D5
	for <openembedded-devel@lists.openembedded.org>; Tue,  2 Jun 2026 10:08:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id EE861180051C;
	Tue,  2 Jun 2026 10:07:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/38] ctags: upgrade 6.2.20260524.0 -> 6.2.20260531.0
Date: Tue,  2 Jun 2026 18:07:17 +0800
Message-ID: <20260602100755.2117-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 Jun 2026 10:08:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127323

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20260524.0.bb => ctags_6.2.20260531.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20260524.0.bb => ctags_6.2.20260531.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260524.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260531.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20260524.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20260531.0.bb
index 93f63526db..195b8b850e 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20260524.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20260531.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "4a77f4e9fdbea8350b8d7b145780e2d9027bd083"
+SRCREV = "5a1b5c54579fb749e96918be009a3f5c611d6d03"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


