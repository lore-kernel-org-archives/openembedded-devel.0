Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F97EA796D
	for <webhook@archiver.kernel.org>; Thu,  5 Feb 2026 05:15:17 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14285.1770268509402628073
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Feb 2026 21:15:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=YkAan4uA;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1770268509; x=1801804509;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=oOp0Eab2MyO7eCRw7Msq+PV5Fj/jzH5Wz/Eg2J1zBPI=;
  b=YkAan4uA5YJIS62uMd6sEDujxJBdVWCV6pRgZn6O2QFHzArNaJu/QEnr
   97VRBW6NLWaMyqZVK7d7JDkgtvV+ppn1qN/MPG9qTMg5bjUUdsXbq6hj8
   9c6tZOqaY8C3YG4TVehSlZ3K7H/Nv8wTwYsfUaVJvikLx/xn6Hpbk/Cm0
   oxM18cDA54BcrJwdb2xAHsqc+aNjJE+G0anhsMOQtXwounh8Xm1lGlK9Z
   LyrHPUWZjhFMKowJNMWmBmyo6eDwwiJ+J78jaH5K2DLxof1TJ1Lo9nVMz
   4p5Wzx1pIlX3UIsDOHgQjz/DaRhIXNAwwjCqgRfg8rwfwdX50HEpdK9hq
   Q==;
X-CSE-ConnectionGUID: YoqQupbCSWCVxm6xpRxTiA==
X-CSE-MsgGUID: fOqxiHjKSySXXYBNptjYtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="232705232"
X-IronPort-AV: E=Sophos;i="6.21,274,1763391600"; 
   d="scan'208";a="232705232"
Received: from unknown (HELO mail.fujitsu.com) ([51.138.80.169])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2026 14:15:08 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.fujitsu.com (Postfix) with ESMTPS id C843E42A305
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:07 +0000 (UTC)
Received: from az2nlsmom4.fujitsu.com (az2nlsmom4.o.css.fujitsu.com [10.150.26.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6C25A180024B
	for <openembedded-devel@lists.openembedded.org>; Thu,  5 Feb 2026 05:15:07 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.34])
	by az2nlsmom4.fujitsu.com (Postfix) with ESMTP id C594F20000CA;
	Thu,  5 Feb 2026 05:15:04 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 05/24] libcompress-raw-lzma-perl: upgrade 2.214 -> 2.217
Date: Thu,  5 Feb 2026 13:14:15 +0800
Message-ID: <20260205051435.1366-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260205051435.1366-1-wangmy@fujitsu.com>
References: <20260205051435.1366-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Feb 2026 05:15:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124157

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...-lzma-perl_2.214.bb => libcompress-raw-lzma-perl_2.217.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libcompress/{libcompress-raw-lzma-perl_2.214.bb => libcompress-raw-lzma-perl_2.217.bb} (80%)

diff --git a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.214.bb b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.217.bb
similarity index 80%
rename from meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.214.bb
rename to meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.217.bb
index d0b8de0455..851a8bd170 100644
--- a/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.214.bb
+++ b/meta-perl/recipes-perl/libcompress/libcompress-raw-lzma-perl_2.217.bb
@@ -5,11 +5,11 @@ HOMEPAGE = "https://metacpan.org/release/Compress-Raw-Lzma"
 SECTION = "libs"
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
 
-LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=db84d74e3df088dfbcfd6b30da2749c8"
+LIC_FILES_CHKSUM = "file://README;beginline=8;endline=10;md5=dcf5ec9168367166aaeabb92ee5754e1"
 
 SRC_URI = "${CPAN_MIRROR}/authors/id/P/PM/PMQS/Compress-Raw-Lzma-${PV}.tar.gz"
 
-SRC_URI[sha256sum] = "1dcc4448969acad4550376476e3fcd2ed96bfaaae7d9622958fd8f9a1ab4c87d"
+SRC_URI[sha256sum] = "e22addebc155b1be0de8a85ab74cafeed96107d6362fccdcc53bdf0526c085a2"
 
 DEPENDS += "xz"
 
-- 
2.43.0


