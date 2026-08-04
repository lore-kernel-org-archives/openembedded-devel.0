Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B735C55822
	for <webhook@archiver.kernel.org>; Tue,  4 Aug 2026 05:18:05 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10154.1785820682027585276
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2026 22:18:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LPDgflNG;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1785820685; x=1817356685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ZXudxzV0yud3C5aiSYTCqO92+S/0/GiumqOKS+L9JcY=;
  b=LPDgflNGhhBLT27sLqEVe3b3gCLB7u9rF4g5+pcOlzHc1KXKCqePnrQN
   okD2BtEaqUhBLatQvdHJq715YCDmBX0DWvWakhN5DSas9uPEk9gi0Mm7B
   Sa13KdNYU8lH2wb6s0Z1icteDzzWB08DqGBGUXnML6oN3Jfb8UckfnJuc
   TsNfkE5+oaXVLZ3eJQqZL3nerGZ4wwLllYOL55fyNXsKSXHsClzPZ5hVW
   +cBP7uIR/CcS+vujGhnSnjm21DrD16z70eTockYD1Dm13nyAS7WVDDzvo
   ip81hCV/o2pkjdw+iYDbQoRgGYZ+C8TNPTSWBpqJIpH1zsR8JXKilK9yJ
   g==;
X-CSE-ConnectionGUID: +vdGramIQRCBhigyTZIXTg==
X-CSE-MsgGUID: GXrP8xDqQ2Wf6mgfYjXJKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="247784981"
X-IronPort-AV: E=Sophos;i="6.25,203,1779116400"; 
   d="scan'208";a="247784981"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 14:18:03 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 69BBF1469
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:00 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1E1D81C002F5
	for <openembedded-devel@lists.openembedded.org>; Tue,  4 Aug 2026 05:18:00 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 3B4A91800B2C;
	Tue,  4 Aug 2026 05:17:57 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 07/28] pegtl: upgrade 4.0.0 -> 4.0.1
Date: Tue,  4 Aug 2026 13:17:05 +0800
Message-ID: <20260804051726.1489-7-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260804051726.1489-1-wangmy@fujitsu.com>
References: <20260804051726.1489-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 04 Aug 2026 05:18:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128712

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pegtl/{pegtl_4.0.0.bb => pegtl_4.0.1.bb}             | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-extended/pegtl/{pegtl_4.0.0.bb => pegtl_4.0.1.bb} (77%)

diff --git a/meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb b/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
similarity index 77%
rename from meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb
rename to meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
index 898b161cad..2676231dca 100644
--- a/meta-oe/recipes-extended/pegtl/pegtl_4.0.0.bb
+++ b/meta-oe/recipes-extended/pegtl/pegtl_4.0.1.bb
@@ -3,12 +3,11 @@ HOMEPAGE = "https://github.com/taocpp/PEGTL"
 LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE_1_0.txt;md5=e4224ccaecb14d942c71d31bef20d78c"
 
-SRC_URI = " \
-    git://github.com/taocpp/PEGTL.git;protocol=https;branch=main \
-    file://run-ptest \
-"
+SRC_URI = "git://github.com/taocpp/PEGTL.git;protocol=https;branch=4.x \
+           file://run-ptest \
+           "
 
-SRCREV = "708de300144de0ec8bd58491facfc5f34d0d0559"
+SRCREV = "9ec6da187f840d8e804d42b9b7867f79d5d6adc2"
 
 inherit cmake ptest
 
-- 
2.43.0


