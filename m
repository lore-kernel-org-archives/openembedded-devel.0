Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57F26D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:10 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4106.1765274161246007280
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ErlbCA8L;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274162; x=1796810162;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=bsKhJ2ieA5zp5x1wKEtO6+jrAkgqPeeG3G0qg9ui2Ow=;
  b=ErlbCA8LyNbGDXVbPWmIVfaRgcZC0OEedLAQ9QHxsFTyy8Asxi065lZf
   bwVtk4bTgqSwM7H4LPtk56SKI5LBsDBO/o/KjFwh2nGDv4qCrmCi8nQ+3
   cndcyBZF0ImTlbsj3y1MDEA9KPbdeyyhPTh1/NgUqdzCy++sTk6grt3r2
   sOiXG2gkfLF+A06cfy1dOd7JsfsGaKPr88yKxAtmE2ASA8VlVgGB8r3S7
   +fFHuNTLubMyf1Y4o/iLWJFPbSGdFGXeCX0oe45Zhwkq2fnhcpPfSkpO9
   D2SmTW43xCwxm+rFX4nYavAIgSU455xHlCaiU7vxqQ9mKMcq6ZdFUuKbH
   Q==;
X-CSE-ConnectionGUID: 6+s7PwjfQtSzoRQ3H1wulg==
X-CSE-MsgGUID: 9/JtDPNUQ82booCphhdEAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="222613609"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="222613609"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:01 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id E68AD42A31F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:01 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 9B3181801E87
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:01 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 3375820002BE;
	Tue,  9 Dec 2025 09:55:58 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 02/38] ctags: upgrade 6.2.20251116.0 -> 6.2.20251130.0
Date: Tue,  9 Dec 2025 17:55:16 +0800
Message-ID: <20251209095552.690-2-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122406

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../ctags/{ctags_6.2.20251116.0.bb => ctags_6.2.20251130.0.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/ctags/{ctags_6.2.20251116.0.bb => ctags_6.2.20251130.0.bb} (95%)

diff --git a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251116.0.bb b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251130.0.bb
similarity index 95%
rename from meta-oe/recipes-devtools/ctags/ctags_6.2.20251116.0.bb
rename to meta-oe/recipes-devtools/ctags/ctags_6.2.20251130.0.bb
index c0a4c58779..3eb5b40968 100644
--- a/meta-oe/recipes-devtools/ctags/ctags_6.2.20251116.0.bb
+++ b/meta-oe/recipes-devtools/ctags/ctags_6.2.20251130.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3"
 
 inherit autotools-brokensep pkgconfig manpages
 
-SRCREV = "6a5177de1cef89ad03469387b188b74d0acf4a02"
+SRCREV = "e23bae9c83ac579c6db6fe8fea1ca48cde8b7f75"
 SRC_URI = "git://github.com/universal-ctags/ctags;branch=master;protocol=https;tag=p${PV}"
 
 
-- 
2.43.0


