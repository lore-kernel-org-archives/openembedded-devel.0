Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 609B5CCFA13
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:49:57 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17218.1777546192697835994
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:49:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BPZ12JlH;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546192; x=1809082192;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=RwAoaaoWfOYDWQ47HnSHCZK6T1PB2CSArFz0ak6y7/M=;
  b=BPZ12JlHzlJt+sAyP8Ut7ljyuOduT7ErJAYdu55LivZ2KHcSPe2Q/q3J
   lEggZ/AKM3tbsXJ2UXBHqMJDdnxR5THTBuSRkgp5uVyDoGapeC4r8PwNN
   LEHcYEDtfsikJKs5v439NYEn/mtehma2DnLiF69qM4KvAhIi5HfYDmGNU
   tEQblraeudglk4DgdGjJOcIQ2LGrLYd3hpFoOJaFK2GEpnPXukwLuvo1w
   axT9NGORp+iROul4DH3Tzofxfmm/2GlzRYmCAxy0cJKtonlVq3fTVMouo
   KKtXPsqA6SgJep5JTMHWm4yPQ1ULgA/iYFlxc390yW1JmkmSNic9WE7NW
   Q==;
X-CSE-ConnectionGUID: +bt4xL7CTrCWZ5q8+AnZ+w==
X-CSE-MsgGUID: hvHS3C+5RFyciI+U5Tl+rw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238552654"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238552654"
Received: from gmgwnl01.global.fujitsu.com (HELO mgmgwnl01.global.fujitsu.com) ([52.143.17.124])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:49:51 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 369473D03
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:51 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D0FD41801E9B
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:50 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 481671801137;
	Thu, 30 Apr 2026 10:49:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 14/64] jsoncons: upgrade 1.6.0 -> 1.7.0
Date: Thu, 30 Apr 2026 18:48:33 +0800
Message-ID: <20260430104924.1106-14-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:49:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126684

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.6.0.bb => jsoncons_1.7.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.6.0.bb => jsoncons_1.7.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.6.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.7.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.6.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.7.0.bb
index 64860c06dd..7ae4755d33 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.6.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.7.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "128553c8d1b222c30819656d123590accb60689d"
+SRCREV = "cb54cdc3134a62634466bf7bcd24f1a906f4ef25"
 
 
 inherit cmake
-- 
2.43.0


