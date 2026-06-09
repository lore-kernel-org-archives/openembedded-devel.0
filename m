Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCA62CD8CBE
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:31 +0000 (UTC)
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com [68.232.139.117])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76499.1781000970638301128
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=O2/Kt+ky;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.117, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000970; x=1812536970;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ebR2ogtmmDTr8ek4peJsXXxE1mvgFEvI+YrUuq5PdKs=;
  b=O2/Kt+kypGO4vBpm0Q2Jg2btczsGxxQvvtZBbjSe1o1reMzhJBZy7FZL
   fXAoi4uO08y1nBwz3rQ6KDu6/WkndSH8ytyN9l0jA3VFfkXz8BwbImFbL
   +ioCJTyq/bfUwqzyo3ND2GDXcu3dl1p/mGRhtuoauu7JkUD1OmjbXQf8r
   C4cvDPLt1LVQ8/XQF+jf42xuiCqqBQ5tkfhJzZv5HWr8t4MtpqymYVDX2
   ouRMj0Q3+Ai4/hinu2BuldvN7x9plyGfY1skaIBn1VSNyP3OfD4CpauBl
   Ye4CpAOWKby6pLMRLwLoTLXLEiQc09EwZDdxwQmUz881wITA0xnfbKzDu
   Q==;
X-CSE-ConnectionGUID: pSPYraujQeyWZB+lvAHmEA==
X-CSE-MsgGUID: nCZ4p9IRTqqE1mEFb+BBkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="242941884"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="242941884"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:29 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 258EF1C000CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:29 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id CC34F188C998
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:28 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id D217A10003CE;
	Tue,  9 Jun 2026 10:29:26 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/30] fluentbit: upgrade 5.0.6 -> 5.0.7
Date: Tue,  9 Jun 2026 18:28:47 +0800
Message-ID: <20260609102913.2204-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127458

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fluentbit/{fluentbit_5.0.6.bb => fluentbit_5.0.7.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.0.6.bb => fluentbit_5.0.7.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.6.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.7.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.0.6.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.0.7.bb
index c7583bc369..1b2c628620 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.6.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.7.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "7b3a43645dcf41fce38ac4e72b1e9e2f7641b027"
+SRCREV = "5880717dd881b8839850a4645996de1ac47b1a5d"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
-- 
2.43.0


