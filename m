Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70496C2A06E
	for <webhook@archiver.kernel.org>; Sun,  4 Jan 2026 02:43:50 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36827.1767494621402658493
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 03 Jan 2026 18:43:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=SfyZfZp7;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1767494620; x=1799030620;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5hKHOl2668wkTeXGYcwwlFe2ZJ4sVZNdCWIx48q4Upc=;
  b=SfyZfZp7k+5gKaof/cvlNxiIMDByLMD4IPTPsglkbcvGlK5mz1duoEfT
   gS8iAjAQcF4PcCNyk4J1mYq5W/E9lHrqmqXjXZuAedWatfV6gLkrebJS8
   rCH31EBRPlpfsRn+1f9AWhG5ug2Oma6k930xqb9UJQNSodGp7Hv52J5ym
   4qMZ0rKvkiqqocMCQ+exgw1odp29GTLctPzyqW1aPI+RN8ixKKRsLu52w
   CNZLMrfuRn6GjMbpSq/XtCdsfSowqVBmAXRmR303LFTlUXXCXzQPCZxVy
   M8IODywEpkmRo17xAE8OZe569tBZNEBV/SsKTu3lpkjySyRqOilFw4qJ2
   w==;
X-CSE-ConnectionGUID: lFlMIo3iRRSFhmxTvaUqRg==
X-CSE-MsgGUID: BRyJKmyzS8aLdYxLq2SZQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="212586462"
X-IronPort-AV: E=Sophos;i="6.21,200,1763391600"; 
   d="scan'208";a="212586462"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 11:43:37 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 6D40E1C0008A
	for <openembedded-devel@lists.openembedded.org>; Sun,  4 Jan 2026 02:43:39 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 1AA821C002AE
	for <openembedded-devel@lists.openembedded.org>; Sun,  4 Jan 2026 02:43:39 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id CC3D010003BB
	for <openembedded-devel@lists.openembedded.org>; Sun,  4 Jan 2026 02:43:36 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 1/2] python3-py7zr: upgrade 1.0.0 -> 1.1.0
Date: Sun,  4 Jan 2026 10:43:29 +0800
Message-ID: <20260104024330.686-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 04 Jan 2026 02:43:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123107

Changelog:
https://py7zr.readthedocs.io/en/latest/Changelog.html

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python/{python3-py7zr_1.0.0.bb => python3-py7zr_1.1.0.bb}  | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-py7zr_1.0.0.bb => python3-py7zr_1.1.0.bb} (84%)

diff --git a/meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb b/meta-python/recipes-devtools/python/python3-py7zr_1.1.0.bb
similarity index 84%
rename from meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb
rename to meta-python/recipes-devtools/python/python3-py7zr_1.1.0.bb
index 83482a9466..7a7a7f45ee 100644
--- a/meta-python/recipes-devtools/python/python3-py7zr_1.0.0.bb
+++ b/meta-python/recipes-devtools/python/python3-py7zr_1.1.0.bb
@@ -4,7 +4,7 @@ LICENSE = "LGPL-2.1-or-later"
 SECTION = "devel/python"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=4fbd65380cdd255951079008b364516c"
 
-SRC_URI[sha256sum] = "f6bfee81637c9032f6a9f0eb045a4bfc7a7ff4138becfc42d7cb89b54ffbfef1"
+SRC_URI[sha256sum] = "087b1a94861ad9eb4d21604f6aaa0a8986a7e00580abd79fedd6f82fecf0592c"
 
 CVE_PRODUCT = "py7zr"
 
@@ -14,6 +14,7 @@ DEPENDS += " \
     python3-setuptools-scm-native \
     python3-toml-native \
     python3-wheel-native \
+    python3-coherent-licensed-native \
 "
 
 RDEPENDS:${PN} += "\
-- 
2.43.0


