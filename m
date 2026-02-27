Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5935EFD7F7E
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 10:15:20 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92467.1772187317188283904
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Feb 2026 02:15:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=K6x9Xwsi;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772187317; x=1803723317;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qA2wGRAheQEH4xDB+Wi6s7xhjy6nqqMFSn2b+yypuX0=;
  b=K6x9XwsiNwBg43ZvHEurI369qM2/ZDSosVcThutf5kCdzHAok3Ec9uYI
   YnFXY8ZQPAxAxLDJOURV2cU19oD2vbt43m4XQhCkAb/MNhysadodDSAuD
   7ZC6rwkoz2Eys3Ze3RurnaTa6fqFFJfmntsEn+0TlMWAn1VoF7A+2Tezj
   GZnoh9Qvea9kxkSfPRNWPB8p6vJ9qPTDwvorN9fNdZV3y1mEot8OTJKla
   CS/01uIBYW81XTIPbObtCc1Ygbi2DqI0YaYO0PHHJOmWurkyTuUdgcpDA
   tL+9M+VXyfIOcGHiUyqcevHNmV3THzPaQH5ZqMR2p8bicbE/6HTZlWYxn
   g==;
X-CSE-ConnectionGUID: qPyV5+SRTZ+I2fHxQTiSeg==
X-CSE-MsgGUID: GRFhTxHzQz2PA5CpAGiUgg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="210131635"
X-IronPort-AV: E=Sophos;i="6.21,313,1763391600"; 
   d="scan'208";a="210131635"
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id A179A42A31B
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:15 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 520D0C02C5C
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:15 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id BCBFB18005A1;
	Fri, 27 Feb 2026 10:15:12 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 36/52] python3-werkzeug: upgrade 3.1.5 -> 3.1.6
Date: Fri, 27 Feb 2026 18:13:11 +0800
Message-ID: <20260227101327.1432-36-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260227101327.1432-1-wangmy@fujitsu.com>
References: <20260227101327.1432-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Feb 2026 10:15:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124736

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 safe_join on Windows does not allow special devices names in multi-segment paths.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{python3-werkzeug_3.1.5.bb => python3-werkzeug_3.1.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.1.5.bb => python3-werkzeug_3.1.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
index 1df88b78d0..edddca72e0 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.1.5.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.1.6.bb
@@ -10,7 +10,7 @@ HOMEPAGE = "https://werkzeug.palletsprojects.com"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=5dc88300786f1c214c1e9827a5229462"
 
-SRC_URI[sha256sum] = "6a548b0e88955dd07ccb25539d7d0cc97417ee9e179677d22c7041c8f078ce67"
+SRC_URI[sha256sum] = "210c6bede5a420a913956b4791a7f4d6843a43b6fcee4dfa08a65e93007d0d25"
 
 CVE_PRODUCT = "werkzeug"
 
-- 
2.43.0


