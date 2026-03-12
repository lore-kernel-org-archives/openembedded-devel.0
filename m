Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05041103E31A
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 10:53:17 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.18758.1773312790653252746
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Mar 2026 03:53:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=C+POUodZ;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1773312790; x=1804848790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=szzxF+58it1OqRmFhMd+dgymkVboqEtdJMnX8oY320Q=;
  b=C+POUodZQg/+Evf3ME9tItM+N6PQNXJQ+pZV7Y03QbTzgmDeZT/1SmbB
   PLNXVSjBibSzgObnzf17vqARclNyWF5sMjWbux/FiCKsE1N8kVIWZR5wv
   N/hO0cYQMaEoONrI6+ncnA9YE5sYxiUSd81WG1juV7NLc1N+4Drgd1/y1
   G3OTWGPcUoBxdVV6951pRY1FnE3z1dZRwOQY4bwZZ2gdp0BPU3BWg8/GB
   IkKFXg34lIfFGAfO9QLUp/99Mk8HIAGlirXTdxB4R5lfoX76cboz2lw/T
   SZaYaTRF8XgpeGD2WJG6VB7Qza4MVOacewRdhRFtYMY1KjEYZ9vOmaCOK
   g==;
X-CSE-ConnectionGUID: z/GldTXdRhCCTsdAXwWHKQ==
X-CSE-MsgGUID: NZEZ4L4fTRa6AuA8aAp63A==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="211989663"
X-IronPort-AV: E=Sophos;i="6.23,116,1770562800"; 
   d="scan'208";a="211989663"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 19:53:09 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 3B3921C1C70A
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:09 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (az2nlsmom2.o.css.fujitsu.com [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id E4A2E14042CB
	for <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:08 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.160.5])
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTP id F0E9418005BE;
	Thu, 12 Mar 2026 10:53:05 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 20/64] libxmp: upgrade 4.6.3 -> 4.7.0
Date: Thu, 12 Mar 2026 18:51:36 +0800
Message-ID: <20260312105220.1856-20-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20260312105220.1856-1-wangmy@fujitsu.com>
References: <20260312105220.1856-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Mar 2026 10:53:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/125120

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright year updated to 2026

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libxmp/{libxmp_4.6.3.bb => libxmp_4.7.0.bb}               | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-multimedia/libxmp/{libxmp_4.6.3.bb => libxmp_4.7.0.bb} (61%)

diff --git a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.0.bb
similarity index 61%
rename from meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
rename to meta-oe/recipes-multimedia/libxmp/libxmp_4.7.0.bb
index c302f65ed5..22e41aa7cb 100644
--- a/meta-oe/recipes-multimedia/libxmp/libxmp_4.6.3.bb
+++ b/meta-oe/recipes-multimedia/libxmp/libxmp_4.7.0.bb
@@ -1,10 +1,10 @@
 SUMMARY = "Extended Module Player Library"
 HOMEPAGE = "http://xmp.sourceforge.net/"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README;beginline=59;md5=ea030bd80f99071b0d3f9a9f752d1ca8"
+LIC_FILES_CHKSUM = "file://README;beginline=59;md5=b25470e2863502c9ac9886f09c21a8f9"
 
 inherit cmake pkgconfig
 
 SRC_URI = "git://github.com/libxmp/libxmp.git;protocol=https;branch=master;tag=libxmp-${PV}"
-SRCREV = "bed660f8e530d399c38f27a5a7732f4e79740585"
+SRCREV = "8a4fdf7d09aedc921de537853b59e1d15b534f24"
 
-- 
2.43.0


