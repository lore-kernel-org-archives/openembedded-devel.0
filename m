Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E5BCD13D8
	for <webhook@archiver.kernel.org>; Tue, 11 Nov 2025 07:55:36 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12601.1762847734906163968
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 10 Nov 2025 23:55:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=foHEGZml;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1762847735; x=1794383735;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=NN8YXHWYMlxiiH4dP0zrHIwOcORKDJF58923ujOZcaM=;
  b=foHEGZmlGNm1idVB3AW4h8ieY6bPo5Aab3UYSSo0dlJLMtUYMfvbBrNP
   JDD3UtwB0GgzBcu2wubGXJorXzQsUTwiy5AbfcCl/336YU7lUurBnL7X7
   bYsaIxtoo/cVL+JhRNZprw4M63rwSFrHnLkVCz5CgdoMeVxSS+hK2VQ9A
   H3/Z7VTycP/qadshbGmWhb5ek+4rrb2z5xkOxEnWzmon0qfyzvlXezQti
   Jvq9Vs+jwZLJ1XJFVNdiTmICCEULRWkylsMNg204r0b46q1zOVtktjq9j
   rk2Iy/8Ux/8hwV8wWEfF41RSkJf8tbWZAv+C5XbPewKSfefbll6ZHShlN
   Q==;
X-CSE-ConnectionGUID: Fkx04Yo/SnK10ZB9MKpc2g==
X-CSE-MsgGUID: rrLARAjyTYmz+rIZdv20Jw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="218201504"
X-IronPort-AV: E=Sophos;i="6.19,296,1754924400"; 
   d="scan'208";a="218201504"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 16:55:33 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 336E41000367
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:33 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id DC07B1C0015D
	for <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:32 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id 863881800D7D;
	Tue, 11 Nov 2025 07:55:30 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/23] json-schema-validator: upgrade 2.3.0 -> 2.4.0
Date: Tue, 11 Nov 2025 15:54:59 +0800
Message-ID: <20251111075517.1650-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251111075517.1650-1-wangmy@fujitsu.com>
References: <20251111075517.1650-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 11 Nov 2025 07:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121484

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Added CI job to publish GitHub release
- Maintenance to Fedora CI infrastructure
- Reference validation using contains() result rather than exception handling
- add support for $defs instead of definitions
- Apply clang-format / fix "test / Check pre-commit" failures
- Adding verbose error messages for logical combinations
- fix: issue-311
- Fix cmake install target on windows
- error-messages: Numeric limit errors should show maximum precision
- Add Fedora packaging
- Improve and fix bugs in Conanfile

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...hema-validator_2.3.0.bb => json-schema-validator_2.4.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-devtools/json-schema-validator/{json-schema-validator_2.3.0.bb => json-schema-validator_2.4.0.bb} (82%)

diff --git a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.3.0.bb b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb
similarity index 82%
rename from meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.3.0.bb
rename to meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb
index 4561f1b285..857fdb779d 100644
--- a/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.3.0.bb
+++ b/meta-oe/recipes-devtools/json-schema-validator/json-schema-validator_2.4.0.bb
@@ -2,8 +2,8 @@ SUMMARY = "JSON schema validator for JSON for Modern C++"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c441d022da1b1663c70181a32225d006"
 
-SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=https"
-SRCREV = "349cba9f7e3cb423bbc1811bdd9f6770f520b468"
+SRC_URI = "git://github.com/pboettch/json-schema-validator;branch=main;protocol=https;tag=${PV}"
+SRCREV = "c780404a84dd9ba978ba26bc58d17cb43fa7bc80"
 
 DEPENDS += "nlohmann-json"
 
-- 
2.43.0


