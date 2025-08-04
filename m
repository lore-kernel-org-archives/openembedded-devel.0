Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69FBFC87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 08:33:53 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.web10.13434.1754296426957342607
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 04 Aug 2025 01:33:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=q/PBDR7e;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1754296427; x=1785832427;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t96u9+XleCHhMscjNsePmodISE8+jVUmaxfC8Yq4grE=;
  b=q/PBDR7eGAG9loPuPmAKUMWq1/fu/gF73oJnEcr/DsbKnux78d3BI3fS
   CFntVNN17XtkGmwXIcj+DCTyZEu2jh5p27KAW11ybMHPHJ9v3n0g4EVaZ
   ZHBJXlhsDgiVcKM1rv1Zlwb1PNeInGj0W2jt73zStX8RbNpp3nuMVP6wu
   EyaSJi2M3Asr1cDdZB5rFSjXECsE6RlR6Hw18P1577ggN33JMYCeIYm8P
   Q2v8Z/04hP6Jxk5G98q1Hm1hV+8QTqjuEjYm47HsQIbCUv4r/qZ40p1DW
   H+drIeeVqtwbnKnebTaiIXHHrR8Kop4zZo5E06rwYtf1UimcFgXd1cyxy
   w==;
X-CSE-ConnectionGUID: ojdgDavBSuej/Ad3eEEEFw==
X-CSE-MsgGUID: QoBSe+LvTCano6dtKUF/Ag==
X-IronPort-AV: E=McAfee;i="6800,10657,11511"; a="208301660"
X-IronPort-AV: E=Sophos;i="6.17,258,1747666800"; 
   d="scan'208";a="208301660"
Received: from unknown (HELO az2uksmgr2.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2025 17:33:45 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr2.o.css.fujitsu.com (Postfix) with ESMTPS id 0A8AC8204F3
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:45 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id 7459DC01812
	for <openembedded-devel@lists.openembedded.org>; Mon,  4 Aug 2025 08:33:44 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 9AC8B1A0071;
	Mon,  4 Aug 2025 16:33:41 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 01/18] aml: upgrade 0.3.0 -> 1.0.0
Date: Mon,  4 Aug 2025 16:33:23 +0800
Message-ID: <20250804083340.1649-1-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Aug 2025 08:33:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118834

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- sys/queue.h: Remove "#include <sys/cdefs.h>"
- FUNDING.yml: Add github sponsors
- Stop single-shot also when no cb is set
- Replicate methods for every type
- Use explicit types in callbacks
- meson: Add run_command check argument
- meson: Relocate headers and pkgconfig
- kqueue: Call EV_SET without NOTE_ABSTIME on Mach
- kqueue: Pass unspecified timeout as NULL
- thread-pool: Make pthread_setcancelstate optional for Android
- build: Make librt optional
- Properly initialize global mutex

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 meta-oe/recipes-graphics/aml/{aml_git.bb => aml_1.0.0.bb} | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)
 rename meta-oe/recipes-graphics/aml/{aml_git.bb => aml_1.0.0.bb} (91%)

diff --git a/meta-oe/recipes-graphics/aml/aml_git.bb b/meta-oe/recipes-graphics/aml/aml_1.0.0.bb
similarity index 91%
rename from meta-oe/recipes-graphics/aml/aml_git.bb
rename to meta-oe/recipes-graphics/aml/aml_1.0.0.bb
index a0b27bd256..c88591f114 100644
--- a/meta-oe/recipes-graphics/aml/aml_git.bb
+++ b/meta-oe/recipes-graphics/aml/aml_1.0.0.bb
@@ -4,12 +4,9 @@ HOMEPAGE = "https://github.com/any1/aml"
 LICENSE = "ISC"
 LIC_FILES_CHKSUM = "file://COPYING;md5=e6f3cfaa39204b96e14b68b9d50d3e4e"
 
-SRC_URI = "git://github.com/any1/aml;branch=master;protocol=https"
-
-SRCREV = "b83f3576ce4187d9285f06e9066ef43a691464d4"
-
-PV = "0.3.0+git"
+SRC_URI = "git://github.com/any1/aml;branch=master;protocol=https;tag=v${PV}"
 
+SRCREV = "685035c9830aa89df02a43df89b644690bd885f5"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[examples] = "-Dexamples=true,-Dexamples=false"
-- 
2.43.0


