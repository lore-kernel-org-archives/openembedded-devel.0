Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86BA8C61DC2
	for <webhook@archiver.kernel.org>; Wed, 26 Aug 2026 08:10:04 +0000 (UTC)
Received: from esa1.hc1455-7.c3s2.iphmx.com (esa1.hc1455-7.c3s2.iphmx.com [207.54.90.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7620.1787731794120550834
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 Aug 2026 01:09:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=UDtqvAxB;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.47, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787731794; x=1819267794;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M5pYLSv2an0GMXpLDqvPhi04+2wH+iezqoCALswrI3Q=;
  b=UDtqvAxBASyUhfbsTQ9yjWqPKk47KSLAYZ+uCh/cQrjQjzrwb1tIzYTX
   bQCC2n8bHHfbSuEVBB2GQdsRnk9dqbFetY9l5nVq36ptpqqtHo+5QgbVD
   0Iz/INVffnMgLIYe29WgWLldTl3lrsoODxuglx1z72N3sxBZgCVo1cm/Y
   UTjJe1L9C2Tij+Q5WrU47TMq3wlDCGc4u30xVwWi3GtM1Y0du+BeTi6Dc
   uFU2etuSFiy97zHNUnZ0fJYidhroCGblf07Kvygoba4E1QGdc+X0YilP/
   qXWtKktHB1NSjyBFIctD9HSCXH3tKqOhvL4GPki7gLTzPDJwQbxOC1Gn7
   Q==;
X-CSE-ConnectionGUID: /40cMNRDTSSv4Gho/b74tQ==
X-CSE-MsgGUID: nnyLTEudQ1WxfLAUpa6p0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11886"; a="252688686"
X-IronPort-AV: E=Sophos;i="6.25,244,1779116400"; 
   d="scan'208";a="252688686"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2026 17:09:52 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6EFC71C000E6
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:52 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 1ECC5100137F
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:09:52 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id 1F8EA14001C3;
	Wed, 26 Aug 2026 08:09:49 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 13/23] python3-filelock: upgrade 3.32.3 -> 3.32.4
Date: Wed, 26 Aug 2026 16:09:16 +0800
Message-ID: <20260826080926.989-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20260826080926.989-1-wangmy@fujitsu.com>
References: <20260826080926.989-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 26 Aug 2026 08:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129505

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-filelock_3.32.3.bb => python3-filelock_3.32.4.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-filelock_3.32.3.bb => python3-filelock_3.32.4.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb b/meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb
rename to meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb
index ec9113721b..63ebb08b6e 100644
--- a/meta-python/recipes-devtools/python/python3-filelock_3.32.3.bb
+++ b/meta-python/recipes-devtools/python/python3-filelock_3.32.4.bb
@@ -9,7 +9,7 @@ CVE_PRODUCT = "tox-dev:filelock"
 
 SRC_URI += "file://run-ptest"
 
-SRC_URI[sha256sum] = "0ffa185a3540854c95caa7fa76b76cb219d907415e2c5dc9af25fd970563487f"
+SRC_URI[sha256sum] = "2bde2e4cf732e0153406d8a7bc80620ecf5e621fe0d25e41143c4e3b4733ff30"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.43.0


