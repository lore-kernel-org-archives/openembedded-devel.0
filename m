Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 566DFC44500
	for <webhook@archiver.kernel.org>; Tue, 30 Jun 2026 09:22:40 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17243.1782811355717237116
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 30 Jun 2026 02:22:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=kT9qix7D;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1782811355; x=1814347355;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BEowAGGtaBpGKNLzxxF0R8akzT3Js8TH+H6tnLyPIOY=;
  b=kT9qix7D7aHSUBIfnAQUMo6MRty2l3VSXmjNieXzvi6IaPkA9EBA45aH
   8DfYHDW2qAS6BznP2Xv7VKciRQpICIfU8+RRCWDPpW99Z0tHMbkK+/vKI
   iQA2TNvacazDxUvcpouoOc4PsDsuvc/v+cAQJQ82cMRwM4+1zOTIB5Uif
   TpFekl0B5UY+zxw0YI0Fn1N0HAwp3mdBFpYx9IZqZTXn0prXjoWvemfgA
   H047gp+gXZ9cg1IGexCg3OzWWZ2SuBp83NhQWJQ/yVm3jo8q9pk2fr1r0
   JIGXRAFbKCY/rqOLDFROVfzfn9yE5wlUJNg82UjoJ+CQMt4h5HxtzYKUL
   g==;
X-CSE-ConnectionGUID: H/6fTMjUR+m5RzuQCy8P/g==
X-CSE-MsgGUID: epvCYO5WSkywOCdJDs93rQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11832"; a="243961046"
X-IronPort-AV: E=Sophos;i="6.24,233,1774278000"; 
   d="scan'208";a="243961046"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2026 18:22:34 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 2218D1C1C738
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:34 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (unknown [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id CC0E91800266
	for <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:33 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.167.135.104])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DA60582DDC0;
	Tue, 30 Jun 2026 09:22:31 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 15/37] python3-elementpath: upgrade 5.1.2 -> 5.1.3
Date: Tue, 30 Jun 2026 17:21:43 +0800
Message-ID: <20260630092206.322-15-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260630092206.322-1-wangmy@fujitsu.com>
References: <20260630092206.322-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 30 Jun 2026 09:22:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127956

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
 Fix protection against type cast errors during the static analysis phase

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ython3-elementpath_5.1.2.bb => python3-elementpath_5.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-elementpath_5.1.2.bb => python3-elementpath_5.1.3.bb} (86%)

diff --git a/meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb b/meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb
similarity index 86%
rename from meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
rename to meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb
index 466b97ec92..88b0995720 100644
--- a/meta-python/recipes-devtools/python/python3-elementpath_5.1.2.bb
+++ b/meta-python/recipes-devtools/python/python3-elementpath_5.1.3.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://github.com/sissaschool/elementpath"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c04ab6ce886cc843af8941bb199406ba"
 
-SRC_URI[sha256sum] = "43d67a38700153eb45349c6e14a4d4b3a06e390c31df06539f730a96baf9a7fc"
+SRC_URI[sha256sum] = "35e98cc2e26332305a49b32eaaebfb7289d1963c88d3989ff5ccb02c46809820"
 
 PYPI_PACKAGE = "elementpath"
 
-- 
2.43.0


