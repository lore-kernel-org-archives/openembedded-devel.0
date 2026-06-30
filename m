Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FFFC43638
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:19 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16841.1782811337737926084
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kpW4kkak;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811338; x=1814347338;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DP4lVv+iAhuhPT1+6gSxoYgVwSfu9iotGtZkO6/4xmw=;
  b=kpW4kkakiRBxqbJBKHuQnhdP5VnSCVMA0/AN9eYOSPsSvub3ZWlr0YtK
   2+a3fF2bfFVQLGpd6z7Vmcexb1MIzCsmwb5k16szK4hQ++BTs5mAbdwaz
   HizOQG/Femo9/mPfvVJspnUr01JTcx5QdllDpFDizdooz4dybKbiQ68Uk
   oL9Dml7x6axEJvEAq6lqLyEcLBuLxCZXJJd201JvwHzV+cXTpdX4lCBxD
   q6b/K4asIm5uTW5XgbtYy8fj6sjiNFgIRgjpBE2OHUrmqhPsDQmzA0+86
   ZYd44Hwj67vOtCX7XIHwQAUMK+eBoaAYIEeBEvyPofoRpvfH270Bv0UyS
   w==;
X-CSE-ConnectionGUID: xEhhVY7sSHSOpiz+M4kTkQ==
X-CSE-MsgGUID: sHjhAGesQmuSPk0y1to8oQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="231987007"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="231987007"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:16 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 0D7891000377
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:16 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B07FF1C1C27F
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id D7DE082DDC0;
	Tue, 30 Jun 2026 09:22:13 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 04/37] fluentbit: upgrade 5.0.7 -> 5.0.8
Date: Tue, 30 Jun 2026 17:21:32 +0800
Message-ID: <20260630092206.322-4-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127946

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../fluentbit/{fluentbit_5.0.7.bb => fluentbit_5.0.8.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-extended/fluentbit/{fluentbit_5.0.7.bb => fluentbit_5.0.8.bb} (99%)

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.7.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.8.bb
similarity index 99%
rename from meta-oe/recipes-extended/fluentbit/fluentbit_5.0.7.bb
rename to meta-oe/recipes-extended/fluentbit/fluentbit_5.0.8.bb
index 1b2c628620..ee01821e95 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.7.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_5.0.8.bb
@@ -17,7 +17,7 @@ DEPENDS = "\
 "
 DEPENDS:append:libc-musl = " fts"
 
-SRCREV = "5880717dd881b8839850a4645996de1ac47b1a5d"
+SRCREV = "c2b1cfd5f5b3530d613c167fc999a7df4eb2eabb"
 SRC_URI = "\
     git://github.com/fluent/fluent-bit.git;nobranch=1;protocol=https;tag=v${PV} \
     file://0001-lib-Do-not-use-private-makefile-targets-in-CMakelist.patch \
-- 
2.43.0


