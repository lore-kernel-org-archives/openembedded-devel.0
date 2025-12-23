Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9580EE6F06C
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 08:42:32 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.97491.1766479345512519918
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Dec 2025 00:42:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=BREWttqi;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766479345; x=1798015345;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=0l0i8sI8Z5JKPhJTdNrBHTp2ByCYUmT9IjfBr/zS5+4=;
  b=BREWttqioQSsk1wWDAEijVheqZd57wh4qMj25oZNDzx4FTvQkYN5BcGf
   IYcbtFS7o67HJv3om/dltg28AhRgBg9ozgeXLIl6a++nNxc5KiK1u/QFJ
   K2JK7YqTfQ5B3cenfy8fklfpU8kc0MDom9F0gLrD2kPXdvLO4KytNJBoL
   tsMICJ4Q0Sn0dwJJbsAUBVQC+Fhb3P2RtFJEwpjd7jjaJnGr5jQXblxuH
   Dgxu7/+7Y+9IBQGMGr8ubjbOvrT6FO6AaZ48x+qqqxvNJ2gUvtNrHeeHz
   vkZQK0yBL/Ru3fda9qBoZv1YTmyw+fGibKXYCMqANqVZyUS09Pkhn6p/W
   w==;
X-CSE-ConnectionGUID: M1yW4W7rRJ2AqZKwfGHKtA==
X-CSE-MsgGUID: eEyZOuEvSO+Fvlo0BMxonA==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="223606355"
X-IronPort-AV: E=Sophos;i="6.21,170,1763391600"; 
   d="scan'208";a="223606355"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([20.61.8.234])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 17:42:23 +0900
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 9E8B41C000B4
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 08:42:23 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 4B3F5100039F
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 08:42:23 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 099F910005BC
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 08:42:20 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-importlib-metadata: upgrade 8.7.0 -> 8.7.1
Date: Tue, 23 Dec 2025 16:42:17 +0800
Message-ID: <20251223084217.882-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 08:42:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122828

LIC_FILES_CHKSUM changed as LICENSE file format has been changed in 8.7.1

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...etadata_8.7.0.bb => python3-importlib-metadata_8.7.1.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-importlib-metadata_8.7.0.bb => python3-importlib-metadata_8.7.1.bb} (66%)

diff --git a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.1.bb
similarity index 66%
rename from meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb
rename to meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.1.bb
index af716ffeb6..4c00739aa3 100644
--- a/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.0.bb
+++ b/meta-python/recipes-devtools/python/python3-importlib-metadata_8.7.1.bb
@@ -1,18 +1,18 @@
 SUMMARY = "Read metadata from Python packages"
 HOMEPAGE = "https://pypi.org/project/importlib-metadata/"
 LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=cf73015ea0156450506e8000d1f7fa37"
 
 inherit pypi python_setuptools_build_meta
 
 PYPI_PACKAGE = "importlib_metadata"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
 
-SRC_URI[sha256sum] = "d13b81ad223b890aa16c5471f2ac3056cf76c5f10f82d6f9292f0b415f389000"
+SRC_URI[sha256sum] = "49fef1ae6440c182052f407c8d34a68f72efc36db9ca90dc0113398f2fdde8bb"
 
 S = "${UNPACKDIR}/importlib_metadata-${PV}"
 
-DEPENDS += "python3-setuptools-scm-native"
+DEPENDS += "python3-setuptools-scm-native python3-coherent-licensed-native"
 RDEPENDS:${PN} += "python3-zipp"
 RDEPENDS:${PN}:append:class-target = " python3-misc"
 RDEPENDS:${PN}:append:class-nativesdk = " python3-misc"
-- 
2.43.0


