Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABD2BCD8CA8
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 10:29:51 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.76503.1781000987360731933
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jun 2026 03:29:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=LyukHTwB;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1781000989; x=1812536989;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qTaptHcKsoPtcgyqHzPvgczIt4zfbenirk30tt+PjQg=;
  b=LyukHTwB8EKjSa+A6+AkGKGLFYPGU+tMPIcvWm0fdowTuIth3fUaqjNK
   HpP04HWwXsl5rrOMGsQqCZ3LP8J54vv0+4op3ZFtPkhr6dpsI+fwcZrYa
   TR0bvpbvNzuAEKr171u2zT9xu5AnwzXwoTAaCAqzcA4cx7j41P95nmiTa
   xBvDbjxQnXHts7R98R9nmr35ojA+UvQRgtMCxCZsgJqsOltpESQcFbMfm
   T1p6LqLAq27gCyHiNNUUs10/msSEgXtLSNPOBA3gpk4bu/G9BobW/flwJ
   9y2xjN4bLQm3Cg6o08GX1YZYVoPqRth4OiDdtsU2ZKamBfi/WXEXm9hdW
   w==;
X-CSE-ConnectionGUID: iAduR/2kQ9KtA3BOaSaFhw==
X-CSE-MsgGUID: +n24XjGTQICUzlTxNXI16g==
X-IronPort-AV: E=McAfee;i="6800,10657,11811"; a="241652294"
X-IronPort-AV: E=Sophos;i="6.24,196,1774278000"; 
   d="scan'208";a="241652294"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:29:49 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 153D41C000CD
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:49 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id B8E9D1C0094C
	for <openembedded-devel@lists.openembedded.org>; Tue,  9 Jun 2026 10:29:48 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id C1ED910003CF;
	Tue,  9 Jun 2026 10:29:46 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 10/30] pcsc-tools: upgrade 1.7.4 -> 1.7.5
Date: Tue,  9 Jun 2026 18:28:53 +0800
Message-ID: <20260609102913.2204-10-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260609102913.2204-1-wangmy@fujitsu.com>
References: <20260609102913.2204-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 10:29:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127464

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../pcsc-tools/{pcsc-tools_1.7.4.bb => pcsc-tools_1.7.5.bb}     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/pcsc-tools/{pcsc-tools_1.7.4.bb => pcsc-tools_1.7.5.bb} (92%)

diff --git a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.4.bb b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.5.bb
similarity index 92%
rename from meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.4.bb
rename to meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.5.bb
index 2a003cbb46..34057af2db 100644
--- a/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.4.bb
+++ b/meta-oe/recipes-support/pcsc-tools/pcsc-tools_1.7.5.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 SRC_URI = "git://github.com/LudovicRousseau/pcsc-tools;protocol=https;branch=master;tag=${PV}"
 
-SRCREV = "52c6a3fda367d2badf618a2e0b8f9e59a02f16ff"
+SRCREV = "fbd5649502ebcc2d4d0ad1a88c5ae2cde7ecc39f"
 
 inherit autotools pkgconfig
 
-- 
2.43.0


