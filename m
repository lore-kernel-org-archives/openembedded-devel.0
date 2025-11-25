Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B9ECFD364
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 08:53:47 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12993.1764060820706422551
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 00:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EgxHzLcJ;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1764060820; x=1795596820;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QUEBF1CHFA2+Ln5Z56FjV+YL9PPFkhLBTVAbs7MGQHw=;
  b=EgxHzLcJ62GjVy6J0yqH4xOAvy9ZU4qgFPXBx5sbLeEGEPmSCtoxGaQN
   OJyCtnRLqXoEBJIkcDTPC+Nr6DaXyKAXxrtlzQ3+2fJTVMuohasf2EvKJ
   mpCPvLD0v31ZuDA6aEFuwgMqTnKElqrPJg7q2/8NKSWOJjO+Gm22IC1kk
   oWOtzVTxB6bi0x1V0HYAC8X9ZivSfGp/J/2px5fgvgfO+I/r5hT01TyU+
   KfPKYIKt/8y0gIkqYMpyL9vIiOeKkW7OXuCbw1qudkphbozNbimXD3D42
   f1ReeWdXWldQ+GVy5AgszLPy2rxgyM1PBoNwza/gd9UNuW7FYy1iTR1qq
   A==;
X-CSE-ConnectionGUID: UwNM7BmSSdiCN73AaLIh2A==
X-CSE-MsgGUID: KJtNnSjSQlaXF5mC4eP5qA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="220949510"
X-IronPort-AV: E=Sophos;i="6.20,225,1758553200"; 
   d="scan'208";a="220949510"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 17:53:37 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id CEF031C1C711
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:53:37 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 8C0C414003B8
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:53:37 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 67D5F829EFE
	for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:53:35 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 1/2] sdbus-c++: upgrade 2.1.0 -> 2.2.1
Date: Tue, 25 Nov 2025 16:53:28 +0800
Message-ID: <20251125085328.3329-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:53:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122024

Changelog:
https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.2.1

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../sdbus-c++/{sdbus-c++_2.1.0.bb => sdbus-c++_2.2.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/sdbus-c++/{sdbus-c++_2.1.0.bb => sdbus-c++_2.2.1.bb} (97%)

diff --git a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
similarity index 97%
rename from meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
rename to meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
index 62b30e9894..6cacb5dfe8 100644
--- a/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.1.0.bb
+++ b/meta-oe/recipes-core/sdbus-c++/sdbus-c++_2.2.1.bb
@@ -16,7 +16,7 @@ PACKAGECONFIG[with-tests] = "-DSDBUSCPP_BUILD_TESTS=ON -DSDBUSCPP_INSTALL_TESTS=
 
 DEPENDS += "expat"
 
-SRCREV = "0261d0ec60b68c1f0a6ec9acf63d1379f7d569f8"
+SRCREV = "28b78822cfc5fbec4bd9906168493e9985f586ed"
 SRC_URI = "git://github.com/Kistler-Group/sdbus-cpp.git;protocol=https;branch=master;tag=v${PV} \
            file://run-ptest"
 
-- 
2.43.0


