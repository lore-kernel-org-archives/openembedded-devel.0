Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97CD1FEE4DC
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:02:18 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115986.1772269332225638998
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:02:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=VCNwwFLt;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772269336; x=1803805336;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=27YkBlym/akgn0eUePJC20fQL8/ppQam8uIjq1VWB6Q=;
  b=VCNwwFLtbPCGdLd9ZUHM4LB0tiKw0iUaGDFSj5tLYLM3JrokPyFgDxCk
   2ja83/F08HbBZCFdEXcr5/jgcfPFGzALPjPHaEKNpxmq6hVsI2hJavh/0
   16AsxLIAkSKmQ8aQUa7cFplhvZtD6kJviugBDVNh4beal2pIKdUdcL4sB
   9VDpP3CdWk/6vq1QARWqCyJVTrWBLX+SmAcdnqhe+5//vJqS7Np6pR5vx
   gjJvrBJaEjUjf0mowFNNpgsTsDhyYaptanE5tXwiL0NLnbXJxv/XaD3mt
   Vl3x5plRZYUEh6QgIQ1x1P7A3IjZKE0Scta4CXjklCKMaP0JN76e+/GrP
   g==;
X-CSE-ConnectionGUID: PvJ34k2EQTq1DgsMNpSKRA==
X-CSE-MsgGUID: QgzzLAnKSlydUHPhXXPeBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="230812037"
X-IronPort-AV: E=Sophos;i="6.21,315,1763391600"; 
   d="scan'208";a="230812037"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id F2D8442A310
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:15 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id A491E1009E1F
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:15 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 6A4FF101C936
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:13 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-webserver][PATCH] xdebug: upgrade 3.5.0 -> 3.5.1
Date: Sat, 28 Feb 2026 17:02:03 +0800
Message-ID: <20260228090204.3587-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
References: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124774

Changelog:
  https://github.com/xdebug/xdebug/releases/tag/3.5.1

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-php/xdebug/{xdebug_3.5.0.bb => xdebug_3.5.1.bb}    | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-webserver/recipes-php/xdebug/{xdebug_3.5.0.bb => xdebug_3.5.1.bb} (89%)

diff --git a/meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb b/meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb
similarity index 89%
rename from meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb
rename to meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb
index b07546d521..4c2c6538b5 100644
--- a/meta-webserver/recipes-php/xdebug/xdebug_3.5.0.bb
+++ b/meta-webserver/recipes-php/xdebug/xdebug_3.5.1.bb
@@ -1,4 +1,5 @@
 SUMMARY = "Debugging and profiling extension for PHP"
+HOMEPAGE = "https://xdebug.org/"
 LICENSE = "Xdebug"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=afd6ce4aa04fdc346e5b3c6e634bd75c"
 
@@ -6,7 +7,7 @@ DEPENDS = "php re2c-native"
 
 SRC_URI = "https://xdebug.org/files/xdebug-${PV}.tgz"
 
-SRC_URI[sha256sum] = "f6daf55a5c7adadb07dd2af25ff78b1cc9b1c58d6cc442a463eba015b678aabf"
+SRC_URI[sha256sum] = "0f26849a5edf3d9120edc100219854599d54f923a8a4d1cb4fe4403520e49678"
 
 UPSTREAM_CHECK_URI = "https://github.com/xdebug/xdebug/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/(?P<pver>\d+(\.\d+)+)$"
-- 
2.43.0


