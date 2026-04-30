Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0873DCD3420
	for <webhook@archiver.kernel.org>; Thu, 30 Apr 2026 10:51:14 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17259.1777546269482641712
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 30 Apr 2026 03:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nLTQOhA5;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1777546269; x=1809082269;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jm1sClOdy7+zZ/k6ZR80kIBobUC1EzY7xV99BPtl7Yc=;
  b=nLTQOhA5PKatR/AcPR5K7JfDKOVVrWuh7bD3yvNr5+UsaOp717EVAnIV
   0eQtN3nXDvInqFbhZTA9EFuTlxaBb3QAKll1wvynGp9iQGBjeS2R0rWUE
   V69cHuePonBg7H8TxXBRlH/inQd4Xf3ARB2d+U/2AXRHILxT5vDH4cSQY
   N71fEZSzRIvWeUcAAywvXFA00ER8QfGVoHztbJvyhAAElfyYTPtCWShZw
   i3akEMgCQbHtUrzt5O1Klpc6e5/URwkrDW1UmD/u1nT46WIxVo+mcTxPF
   tXGLrBu4W0H6C1wDnvDSIcBZrrpUmygHSvvcx5yif1s5S3D1ocdA+Ke6J
   A==;
X-CSE-ConnectionGUID: qjssho52Q/KD+q19+9cKIw==
X-CSE-MsgGUID: y4m4e9TaT063MBKQcpUDYw==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="238566140"
X-IronPort-AV: E=Sophos;i="6.23,207,1770562800"; 
   d="scan'208";a="238566140"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 19:51:08 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 01AF51000146
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:08 +0000 (UTC)
Received: from az2uksmom1.o.css.fujitsu.com (az2uksmom1.o.css.fujitsu.com [10.151.22.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A850B1000092
	for <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2uksmom1.o.css.fujitsu.com (Postfix) with ESMTP id 23F9F1801130;
	Thu, 30 Apr 2026 10:51:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 62/64] uriparser: upgrade 1.0.0 -> 1.0.1
Date: Thu, 30 Apr 2026 18:49:21 +0800
Message-ID: <20260430104924.1106-62-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260430104924.1106-1-wangmy@fujitsu.com>
References: <20260430104924.1106-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 30 Apr 2026 10:51:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126732

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../uriparser/{uriparser_1.0.0.bb => uriparser_1.0.1.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-support/uriparser/{uriparser_1.0.0.bb => uriparser_1.0.1.bb} (91%)

diff --git a/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb b/meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
similarity index 91%
rename from meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
rename to meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
index b9c5100803..987c28744b 100644
--- a/meta-oe/recipes-support/uriparser/uriparser_1.0.0.bb
+++ b/meta-oe/recipes-support/uriparser/uriparser_1.0.1.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://src/COPYING;md5=fcc5a53146c2401f4b4f6a3bdf3f0168 \
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${BP}/${BP}.tar.gz \
            file://run-ptest"
-SRC_URI[sha256sum] = "291f25264a5c025005b1bc39de3c029e6a6ca0a8d6cfa5e61cb5b03702c0884d"
+SRC_URI[sha256sum] = "5a3b7c491a1e9033d86b9c00a947bafc46407187938578daf799a4155cb7c88a"
 
 inherit cmake github-releases ptest
 
-- 
2.43.0


