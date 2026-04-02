Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FA5111225B
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 02:14:22 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7072.1775096060546262058
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Apr 2026 19:14:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=ZEu72sdl;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775096060; x=1806632060;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u5WYPEo+5MyoKCUjcir3gDwZQIEQytpmKJNcp0sCw34=;
  b=ZEu72sdl70WNB4nA0aLbmminqHVBsY239n5son929uegy3HGM1QsbSLa
   qEV75CxmghUk1VQUr4C1psKX65QPqAWYMqcallsPtfYIIOXdKjYmVL6hT
   jXReTQOM4+bQtYyerlhPGcHqhpLhmeFkiDaVs8ExrxLEYHkdYSg9dVXK+
   PcLocPOcSehjTWSZheyjJCdy7b7RVdgGHr/QJT3LtyxHQggnrBQI0irgT
   NzLcMvMNhnJZjSDVfD7vjQ8XRk1xm1oKi8NQU5uYQPLrjzw3VTcevJlah
   ctr6wiIbAF5QEIQyJ+L0x+MT9HmPpqQlJEJgOB/QY4ACkGpkhboLdL8CH
   g==;
X-CSE-ConnectionGUID: iU6gqZEPT5uvkp3rzN23CA==
X-CSE-MsgGUID: L1MJadNuSaiJzRsjf2QmqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="234940499"
X-IronPort-AV: E=Sophos;i="6.23,153,1770562800"; 
   d="scan'208";a="234940499"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 11:14:19 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 220D9820C0A
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:19 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id CD5D7C252CA
	for <openembedded-devel@lists.openembedded.org>; Thu,  2 Apr 2026 02:14:18 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 779F81003741;
	Thu,  2 Apr 2026 02:14:16 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 09/39] jsoncons: upgrade 1.5.0 -> 1.6.0
Date: Thu,  2 Apr 2026 10:13:24 +0800
Message-ID: <20260402021355.1324-9-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260402021355.1324-1-wangmy@fujitsu.com>
References: <20260402021355.1324-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Apr 2026 02:14:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125924

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
============
- Git PR #673: Fix warning for non clang builds on linux
- Git Issue #675: std::chrono conversion does not compile with libc++
- Git PR #679: Fix double colon in url generator
- Git PR #680: Added missing space after "found" in maximum_validator
- Git PR #685: optimize semantic_tag::noesc write_string
- Git PR #687: jmespath: allow rhs_expression in a keyvalue - expression
- Git PR #688,#689: jmespath: where possible without losing information,
- store the result of ceil and floor as basic_json integer values
- rather than double values.
- Added toon-format extension

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../jsoncons/{jsoncons_1.5.0.bb => jsoncons_1.6.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/jsoncons/{jsoncons_1.5.0.bb => jsoncons_1.6.0.bb} (89%)

diff --git a/meta-oe/recipes-support/jsoncons/jsoncons_1.5.0.bb b/meta-oe/recipes-support/jsoncons/jsoncons_1.6.0.bb
similarity index 89%
rename from meta-oe/recipes-support/jsoncons/jsoncons_1.5.0.bb
rename to meta-oe/recipes-support/jsoncons/jsoncons_1.6.0.bb
index 1321f824ee..64860c06dd 100644
--- a/meta-oe/recipes-support/jsoncons/jsoncons_1.5.0.bb
+++ b/meta-oe/recipes-support/jsoncons/jsoncons_1.6.0.bb
@@ -5,7 +5,7 @@ LICENSE = "BSL-1.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6ee7f7ed2001e4cde4679fdb8926f820"
 
 SRC_URI = "git://github.com/danielaparker/jsoncons.git;protocol=https;branch=master;tag=v${PV}"
-SRCREV = "95a220dff2d927f15e1fe0c7dac2821b7134e4c9"
+SRCREV = "128553c8d1b222c30819656d123590accb60689d"
 
 
 inherit cmake
-- 
2.43.0


