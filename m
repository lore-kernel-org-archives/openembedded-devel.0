Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48D6ACCD187
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 09:19:48 +0000 (UTC)
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com [139.138.36.223])
 by mx.groups.io with SMTP id smtpd.web11.11086.1760433583803135784
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 14 Oct 2025 02:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=EuEjmVB0;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.223, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1760433584; x=1791969584;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W0krhqT2bQM7b7qsOGGpDiMOfw9qko/+Rm9/VTbENyw=;
  b=EuEjmVB0AGMSMOfHa5HIFNBdMfwnJ9h0OZnFrPTaaaK34qn2IRQj2Bh6
   /8y/qCK62xI4D07YM0XVR47Z4OKY6NGSRq++AJ5PZEwAAhKZnB3qftEwc
   VmwA+47u4HqrKXL5UGXcj081AagTd2XACav9hyCPDNDgr4cqdoZzqWQ3f
   i+G4BDQpvGnQTg2VxXBYnHAMu25YMNWM6U+jNJ1xRF64r66uG8Ze6akb7
   r3Hf6D6EOmacO/x4pmp5JL020AEHyacMaM5oSLa6g0YdhPwzjcqel1i27
   VUgD0xgUKt+/ffFQi4M2y/PHo4r8+kASM6ISnFSDNowA/jb8Mho/MMgJ/
   A==;
X-CSE-ConnectionGUID: Wi/gM5pPSHK4GbxQFgNnAQ==
X-CSE-MsgGUID: 1khMnqNvQhiOqog78OhJ8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="204394433"
X-IronPort-AV: E=Sophos;i="6.19,227,1754924400"; 
   d="scan'208";a="204394433"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([20.61.8.234])
  by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2025 18:19:42 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 46A3D100034A
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:42 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 02FBA1000384
	for <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:42 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 8A926101BB78;
	Tue, 14 Oct 2025 09:19:39 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/44] cukinia: upgrade 0.9.0 -> 0.9.1
Date: Tue, 14 Oct 2025 17:18:48 +0800
Message-ID: <20251014091927.493-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251014091927.493-1-wangmy@fujitsu.com>
References: <20251014091927.493-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 14 Oct 2025 09:19:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120560

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-test/cukinia/{cukinia_0.9.0.bb => cukinia_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-test/cukinia/{cukinia_0.9.0.bb => cukinia_0.9.1.bb} (91%)

diff --git a/meta-oe/recipes-test/cukinia/cukinia_0.9.0.bb b/meta-oe/recipes-test/cukinia/cukinia_0.9.1.bb
similarity index 91%
rename from meta-oe/recipes-test/cukinia/cukinia_0.9.0.bb
rename to meta-oe/recipes-test/cukinia/cukinia_0.9.1.bb
index 4e61fecd9a..720a46ad82 100644
--- a/meta-oe/recipes-test/cukinia/cukinia_0.9.0.bb
+++ b/meta-oe/recipes-test/cukinia/cukinia_0.9.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
 
 SRC_URI = "git://github.com/savoirfairelinux/cukinia.git;protocol=https;branch=master;tag=v${PV}"
 
-SRCREV = "ce10e333d7169df80b44a0ea9bbbfaffbe4c59f9"
+SRCREV = "35d621f7abbf8453b37beeab6719705dcbfb4ed2"
 
 
 RRECOMMENDS:${PN} = "libgpiod-tools"
-- 
2.43.0


