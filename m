Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE61ACD13DA
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:57 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17436.1777546189390808719
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=bWTv29Cw;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546189; x=1809082189;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=h+oCBBGGu6yQlmYTHdbvx/HsbqAxpn3BsiiiOO+lTr8=;
  b=bWTv29CwwpNdQqP/uBlNXx5J4mtCjCGRpQHVR1Nh9gtss3mLOmLfT53r
   saQRPX5C+VLtaUipGhnRsisR6Ls77L7BpiJzVtEB1W8lF2TReGqJSNSoh
   7/6wbTFRsdUH4ui+Lqc0AoYJf15pwTXj8uw4JH/ExG1As0lRyg2eiWCTO
   RXiGn6fT6jv7YGX2kUrCHzCwnpyGnFkq14OEDeko3CtV9h8qLG2zQJ5wb
   SZ5NDa3N1L6ewqSROJRe5JItMKwnJllZiq14MBKmWAFpTvHoCFAWm7C0x
   nlje0VSn0u2MsuNmml5ZufxPFRNpCnanH1I02oUBJtF0AwTT2W/BPvOcU
   Q==;
X-CSE-ConnectionGUID: 5DXEQhGzTSqslx+ucBzq0A==
X-CSE-MsgGUID: wYS5wK1uQiWFzWwq84ZLMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="239352998"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="239352998"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:47 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F13494DD4
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:47 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 98C13C012A7
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:47 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 107E01801137;
	Thu, 30 Apr 2026 10:49:44 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 12/64] isocline: upgrade 1.0.9 -> 1.1.0
Date: Thu, 30 Apr 2026 18:48:31 +0800
Message-ID: <20260430104924.1106-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126682

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../isocline/{isocline_1.0.9.bb => isocline_1.1.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/isocline/{isocline_1.0.9.bb => isocline_1.1.0.bb} (94%)

diff --git a/meta-oe/recipes-devtools/isocline/isocline_1.0.9.bb b/meta-oe/recipes-devtools/isocline/isocline_1.1.0.bb
similarity index 94%
rename from meta-oe/recipes-devtools/isocline/isocline_1.0.9.bb
rename to meta-oe/recipes-devtools/isocline/isocline_1.1.0.bb
index 2afc4500df..c50ac01c49 100644
--- a/meta-oe/recipes-devtools/isocline/isocline_1.0.9.bb
+++ b/meta-oe/recipes-devtools/isocline/isocline_1.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=8d05469c537534c7405c82c81a526bcd"
 
 SRC_URI = "git://github.com/daanx/isocline.git;protocol=https;branch=main;tag=v${PV}"
-SRCREV = "74d34bc453f5b91f1f8d8ded2840e1553623d135"
+SRCREV = "d55a58139badbe83d61c5d89954fa5bddcabe6d7"
 
 
 inherit cmake
-- 
2.43.0


