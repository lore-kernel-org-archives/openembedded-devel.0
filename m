Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71974D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 09:56:40 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4119.1765274185780992236
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Dec 2025 01:56:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=m6XsI7Pv;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765274190; x=1796810190;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mbcv39rkWDZyNTbofrvb6a8SFLTVdIFis3h81un5I4A=;
  b=m6XsI7PvqhM6c7iDBhWaZkeAmLDMryQBUcpeXM5w2g2e2j5fEMpkkF0J
   6lL1Y06E9y8EOWzBD8iZgjqkfOm+49d2E7nxPPzR1PgwdougAkpm9ojt7
   G4Oxrceghp/o41ZFsYLddnoEYGu4/eHYb4CGu9k4uevsxM2J1sNrjvwjD
   DTp5CDgHo6m5xWdBp+Y+SfKjuPkUw0VdzsHR3nYKxAxQw1cV+ZOJKwbeT
   i1dc1M7dTA/GdGe7l9MYnwmVOG78aX+SlQYwUa1NAEs9Ha5vaoaIOOVpv
   RZ6YO9HcO3ggprpMdxXMtMvtyZ4oeWWETW+hbltYWLBPYk5qTcmDFQx6V
   A==;
X-CSE-ConnectionGUID: /pq1+7ejTjmwY2NKBm98rg==
X-CSE-MsgGUID: 9TiObljoT46gDE9iPf0pfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="221991900"
X-IronPort-AV: E=Sophos;i="6.20,261,1758553200"; 
   d="scan'208";a="221991900"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.128])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 18:56:30 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 5E58782070F
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:30 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 166C41401216
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Dec 2025 09:56:30 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id 97AC220002B8;
	Tue,  9 Dec 2025 09:56:27 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 11/38] libyang: upgrade 3.13.6 -> 4.2.2
Date: Tue,  9 Dec 2025 17:55:25 +0800
Message-ID: <20251209095552.690-11-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251209095552.690-1-wangmy@fujitsu.com>
References: <20251209095552.690-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Dec 2025 09:56:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122415

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
- new SO version 4
- major LYB binary format optimizations
- user-ordered lists diff fixes
- validation optimizations
- lots of other bugfixes and improvements

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libyang/{libyang_3.13.6.bb => libyang_4.2.2.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/libyang/{libyang_3.13.6.bb => libyang_4.2.2.bb} (96%)

diff --git a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb b/meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
similarity index 96%
rename from meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
rename to meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
index 822c30ba24..4b2ceaaa17 100644
--- a/meta-oe/recipes-extended/libyang/libyang_3.13.6.bb
+++ b/meta-oe/recipes-extended/libyang/libyang_4.2.2.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=b69fd3b2815bbf1cef5c97f0eee2519a"
 
-SRCREV = "c2ddd01b9b810a30d6a7d6749a3bc9adeb7b01fb"
+SRCREV = "3d07c3a71534a580c3960907da17568eff7e5c64"
 
 SRC_URI = "git://github.com/CESNET/libyang.git;branch=master;protocol=https;tag=v${PV} \
            file://0001-test_context-skip-test-case-test_searchdirs.patch \
-- 
2.43.0


