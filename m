Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80712103E313
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:52:56 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18747.1773312771427331062
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:52:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=nNKfKrDP;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312771; x=1804848771;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sdIzP4rgVm5xlp+mmZyeEQbW1xNLUtVUFD9/BKJa/k8=;
  b=nNKfKrDP6qMpf5nixpX0pAtoo45MRuO9Tf/EdiPm24l1G0lqCrsD/UE0
   c2EPSm1iNo8H9HToTk4WNReiQrVjUnTnb5dA+YGHSe0naw5VEfvCrIPbF
   FcY8LmdOoXpbcxe/I4Es1aHPZNyjnds0J788d/Y+TCNF9Aya7/Q9muqGw
   KT03y5cLSjskLt7iNxF8d9Nb7dd2O0rEaurfNW4/tbrSHMG6O8TFDGiUN
   s2L+a6ZLTaWUDqD8L7zl6iYR4EwRf3ukGRawPIMxjQJCxOcppRFsnnlQZ
   dISyZ1exkFbxe5A1/MvZGpF0u+XcY/YWNJe0DOgh6EEihULubYYhVva9q
   Q==;
X-CSE-ConnectionGUID: XgN8dUGaSt+xzWg/a8wzTQ==
X-CSE-MsgGUID: RefgPlijRGK8gDLvc6WmEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="220950448"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="220950448"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:52:50 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 168211C1C70D
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:52 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id BA1718D65DF
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:51 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id ACD0C1801925;
	Thu, 12 Mar 2026 10:52:48 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 12/64] libcompress-raw-lzma-perl: upgrade 2.217 -> 2.221
Date: Thu, 12 Mar 2026 18:51:28 +0800
Message-ID: <20260312105220.1856-12-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:52:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125112

From: Wang Mingyu <wangmy@fujitsu.com>

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...aw-lzma-perl_2.217.bb => libcompress-raw-lzma-perl_2.221.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.217.bb => libcompress-raw-lzma-perl_2.221.bb} (90%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.217.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb
similarity index 90%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.217.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb
index 851a8bd170..c772885931 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.217.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.221.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=dcf5ec9168367166aae
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "e22addebc155b1be0de8a85ab74cafeed96107d6362fccdcc53bdf0526c085a2"
+SRC_URI[sha256sum] = "e8b2d17c7f29b3e4f286cc3d3f5353df8e811615c42298eedad7cdbfec4aed7f"
 
 DEPENDS += "xz"
 
-- 
2.43.0


