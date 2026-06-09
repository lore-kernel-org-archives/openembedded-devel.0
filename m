Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A0C9CD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:31 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.76237.1781000961210620747
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=hZP+ny3C;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000961; x=1812536961;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nB8btXicJmSUyxH7f0qNt3PzMuA2NiKAvC/rFzm8wfo=;
  b=hZP+ny3CGoekd24Kk/8NN8vdKqnTkSCY+/0Zzqq7Grqzc/gLSYpbHfvv
   +4GUZL8Ye76MWtcJpFNNVLM6sKupj3Hdv1iG997nyYLN0fX44Er5W/D2X
   e/oEpaK4kGW3ewOpuFAVkeM6P2/pQztEWkAeSr/s5dR/sBPl+4QKNkNJ8
   YaGU80ar8yYme5997d+gQBSxry5S0OJClqOfUPM7BFQd2IDkSY5IUOldD
   plOOsqPp/ZvHiCNo0wuLJuOmzTPyplpi2t1Cw/bFBLn5CcftbBYys5fs4
   KQD+gm7mBjEr9Tt98HBVKx0y7XPU5jZBlYr/ERf+W0GYx2J5t9vlxUzvR
   g==;
X-CSE-ConnectionGUID: jr3Y41nGQ5C8SNbFnd9a7w==
X-CSE-MsgGUID: 6k/WO/BoRXi1rVazTO6FPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="230895841"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="230895841"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:19 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 6F4EA1002B85
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:19 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 27A6318002C7
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:19 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 40FAA10003CE;
	Tue,  9 Jun 2026 10:29:17 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/30] boost-sml: upgrade 1.1.13 -> 1.2.0
Date: Tue,  9 Jun 2026 18:28:44 +0800
Message-ID: <20260609102913.2204-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127455

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../boost-sml/{boost-sml_1.1.13.bb => boost-sml_1.2.0.bb}       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/boost-sml/{boost-sml_1.1.13.bb => boost-sml_1.2.0.bb} (94%)

diff --git a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.13.bb b/meta-oe/recipes-support/boost-sml/boost-sml_1.2.0.bb
similarity index 94%
rename from meta-oe/recipes-support/boost-sml/boost-sml_1.1.13.bb
rename to meta-oe/recipes-support/boost-sml/boost-sml_1.2.0.bb
index e04a9f46af..55c5410f40 100644
--- a/meta-oe/recipes-support/boost-sml/boost-sml_1.1.13.bb
+++ b/meta-oe/recipes-support/boost-sml/boost-sml_1.2.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.md;md5=e4224ccaecb14d942c71d31bef20d78c"
 DEPENDS += "boost qemu-native"
 
 SRC_URI = "git://github.com/boost-ext/sml.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "8015e095dab82c03eb2277258645956bcd84cbcb"
+SRCREV = "2d8485da6661519a7697b5f800c7165c543fa499"
 
 
 inherit cmake
-- 
2.43.0


