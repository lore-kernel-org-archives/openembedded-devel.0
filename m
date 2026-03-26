Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 264D010A3D81
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 11:58:15 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.45672.1774526293379996799
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Mar 2026 04:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=Sg3u37Na;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1774526293; x=1806062293;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zw5zjsjO48KLeh3XtbWxpHl8y5p6UfzMpPubdhCDu7M=;
  b=Sg3u37Na77lDdypakAkPbJu+TowK9x88uSVKSHmgC/OjKe5mmbGFzup0
   5IFsH7gVRxQmDBgcPXrQZAgCRHlT4R2hp739mg5tIbRtZf5LoqGO+lSEj
   shl6i7xs5/NyANDRqe7W5uYMRNiPvipfGusiTEqZDoZNbtOMfkJA+UsCR
   cZi6+N56IR0dhM03SHbt3F5n6Jtg5mYN8XApbrQFK5Kgv8SwqjzbLCz3n
   emXbzcHn3ulEcUW7/TGfFCafeFMEyt6vnjm5z2+4wiQxB3qgw116Cd+1a
   OL+/39+wOyWkH1cBwU32Sn2nIVc6d5xbIbhiTOFEPakfuz0ZXjAnDnV6W
   g==;
X-CSE-ConnectionGUID: 4cPKHx7GSN6AQ2j+1FN1MA==
X-CSE-MsgGUID: +ZBkKdtbQgWfpw3ZvWGg8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="223371906"
X-IronPort-AV: E=Sophos;i="6.23,142,1770562800"; 
   d="scan'208";a="223371906"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 20:58:12 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 051EE4DCF
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:12 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id AD6C2C00D43
	for <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:11 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 2F8881807149;
	Thu, 26 Mar 2026 11:58:08 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 57/63] qcbor: upgrade 1.6 -> 1.6.1
Date: Thu, 26 Mar 2026 19:56:27 +0800
Message-ID: <20260326115634.1199-57-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260326115634.1199-1-wangmy@fujitsu.com>
References: <20260326115634.1199-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 26 Mar 2026 11:58:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125712

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-extended/qcbor/{qcbor_1.6.bb => qcbor_1.6.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/qcbor/{qcbor_1.6.bb => qcbor_1.6.1.bb} (93%)

diff --git a/meta-oe/recipes-extended/qcbor/qcbor_1.6.bb b/meta-oe/recipes-extended/qcbor/qcbor_1.6.1.bb
similarity index 93%
rename from meta-oe/recipes-extended/qcbor/qcbor_1.6.bb
rename to meta-oe/recipes-extended/qcbor/qcbor_1.6.1.bb
index ca96199ea0..e16e9fc948 100644
--- a/meta-oe/recipes-extended/qcbor/qcbor_1.6.bb
+++ b/meta-oe/recipes-extended/qcbor/qcbor_1.6.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=9abe2371333f4ab0e62402a486f308a5"
 
 SRC_URI = "git://github.com/laurencelundblade/QCBOR;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "590a23daf65af068cee81555c597063150e23539"
+SRCREV = "930708bb86481e88879eb1d87fd4d664f1d69503"
 
 
 inherit pkgconfig
-- 
2.43.0


