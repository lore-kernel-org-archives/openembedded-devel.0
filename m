Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C581AD68BF9
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:04:12 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37574.1766048644265359540
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:04:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=b61sFsEe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766048644; x=1797584644;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rQmzXEjwZBUOQwtj2K+y4XrRVV02nbhCbMuNdaq8aAg=;
  b=b61sFsEetbgjMrnNdp/+PjUSuMcqPigNULjeihWFFoH9U7qIjK/fkQTn
   6sxAyrLUWqq4pfOPs4YTXZZ4eVXkEEAxDTiYw6A1Jhydxf1MyETeN2c4/
   LuSq0BrFPz7NUSa9JUTrpOo2HOqz2juxYvqGZy10tlusqXn35s7cjSxV5
   CaCdt0ztx4Z6ET0BFV1kg5Tvv3Es9NhkDE6F+SeipOZliMPGlzMGwmHV3
   Qr6ygS02WPKWRn1UZ2mAC1bshcOxGif+Q/M7CUa2J8Tw6JtbMEw+6Mkvr
   DBlCpHkV9vs6ltGkogcXXNTzUwcR4El3GLzNPzybZ0TfNGY0lZMyv/bbp
   Q==;
X-CSE-ConnectionGUID: r5WIhgPiREuIygI8QJM93g==
X-CSE-MsgGUID: vYjdqMhmSU21ZVatVNEYlA==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="227016382"
X-IronPort-AV: E=Sophos;i="6.21,158,1763391600"; 
   d="scan'208";a="227016382"
Received: from unknown (HELO az2nlsmgr2.o.css.fujitsu.com) ([20.61.8.234])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 18:04:03 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 94EB71550
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:02 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4FA78100595C
	for <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:02 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id D24221019042;
	Thu, 18 Dec 2025 09:03:59 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/20] makeself: upgrade 2.6.0 -> 2.7.1
Date: Thu, 18 Dec 2025 17:03:31 +0800
Message-ID: <20251218090346.735-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251218090346.735-1-wangmy@fujitsu.com>
References: <20251218090346.735-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 18 Dec 2025 09:04:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122739

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Base64 encoding now runs after compression, consistent with other
  post-compression encryption/encoding options.
- Documentation updated to reflect that compression can be combined with
  encryption/encoding.
- Compression now precedes encryption so both can be enabled together.
- Signing passphrases are masked in stored metadata.
- Added coverage for combined encryption + compression flows.
- Access archive name from script
- pre-extraction script execution in combination with --notemp

-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../makeself/{makeself_2.6.0.bb => makeself_2.7.1.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/makeself/{makeself_2.6.0.bb => makeself_2.7.1.bb} (94%)

diff --git a/meta-oe/recipes-devtools/makeself/makeself_2.6.0.bb b/meta-oe/recipes-devtools/makeself/makeself_2.7.1.bb
similarity index 94%
rename from meta-oe/recipes-devtools/makeself/makeself_2.6.0.bb
rename to meta-oe/recipes-devtools/makeself/makeself_2.7.1.bb
index cd2c4c16de..1deb59587e 100644
--- a/meta-oe/recipes-devtools/makeself/makeself_2.6.0.bb
+++ b/meta-oe/recipes-devtools/makeself/makeself_2.7.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "\
     git://github.com/megastep/${BPN}.git;protocol=https;branch=master;tag=release-${PV} \
 "
 
-SRCREV = "55d96ab79d39e10e3aec1bb1a7647ec0d4ddf1aa"
+SRCREV = "3815292f7359a4ccab8e27bdbe8a844947c51e4c"
 
 
 do_configure[noexec] = "1"
-- 
2.43.0


