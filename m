Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25ADDFD5F68
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 04:03:41 +0000 (UTC)
Received: from esa12.hc1455-7.c3s2.iphmx.com (esa12.hc1455-7.c3s2.iphmx.com [139.138.37.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.98852.1775621019552519181
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Apr 2026 21:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=QV5IT6Qt;
 spf=pass (domain: fujitsu.com, ip: 139.138.37.100, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775621019; x=1807157019;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=9SHawwQrPXpFFQ4fkLsxX5uMkO41U+77A1u4P+h5Vug=;
  b=QV5IT6Qtgt9iHi8qFZB6wQhfPCssDshV6OkkXZCu1wXIhODK/ATKU2o7
   81QIH9epiCFFd1ZdnuFAZ5UrXCeoyVRHI/y6vAruhh3P192HezwQZuENs
   3ozXFkWeDsavch44Pup3/zl0Hgh+rmM2cRXj2gc0gYHd/Is6DJDqfmpaz
   D+f8KxfH+XqruXDgMmE5p8mehqX1z0GfrVLBkhzSwoRo2oGDULPG3jQqJ
   +gIHcB2VaHif4GVi59/PthmA8xFidwzXLbKGyhvJKZlvNtQiOmcsSjwL3
   gr9BmYkwuQbNT6rVLQc/qUEwvlEMVD1YabgwZvWOVOixJBOe7jIkv5yI5
   Q==;
X-CSE-ConnectionGUID: gE8vUb+qS8WFejF2SAHHtA==
X-CSE-MsgGUID: 4YDj8qqFRmG+tFqK0sEGOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="215218369"
X-IronPort-AV: E=Sophos;i="6.23,166,1770562800"; 
   d="scan'208";a="215218369"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 13:03:38 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id D611A42A32B
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:37 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 860D5C02E49
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:37 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 66DAC8214F5
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 04:03:35 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-pyatspi: upgrade 2.46.1 ->  2.58.2
Date: Wed,  8 Apr 2026 12:03:28 +0800
Message-ID: <20260408040331.22227-2-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260408040331.22227-1-liuyd.fnst@fujitsu.com>
References: <20260408040331.22227-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 04:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126093

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 ...on3-pyatspi_2.46.1.bb => python3-pyatspi_2.58.2.bb} | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-pyatspi_2.46.1.bb => python3-pyatspi_2.58.2.bb} (80%)

diff --git a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb b/meta-python/recipes-devtools/python/python3-pyatspi_2.58.2.bb
similarity index 80%
rename from meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
rename to meta-python/recipes-devtools/python/python3-pyatspi_2.58.2.bb
index cb9b61bd66..404ff19a72 100644
--- a/meta-python/recipes-devtools/python/python3-pyatspi_2.46.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyatspi_2.58.2.bb
@@ -7,16 +7,18 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=db29218e6ba3794c56df7d4987dc7e4d \
                     file://COPYING.GPL;md5=751419260aa954499f7abaabaa882bbe"
 DEPENDS = "python3-dbus-native glib-2.0 dbus-glib libxml2 atk gtk+ python3-pygobject"
 
-SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=master"
-SRCREV = "8c69016b38d0e4caaf4c986938ea3410fb7351b6"
+SRC_URI = "git://github.com/GNOME/pyatspi2.git;protocol=https;branch=master;tag=${PV}"
+SRCREV = "f2fb289a9d2e4dac65fca8db0f4d3d65607a0cf2"
 
 
 # Same restriction as gtk+
-inherit features_check setuptools3
+inherit features_check
 ANY_OF_DISTRO_FEATURES = "${GTK2DISTROFEATURES}"
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
 
-inherit pkgconfig autotools python3native
+inherit pkgconfig python_setuptools_build_meta python_mesonpy
+
+DEPENDS += "python3-pygobject-native"
 
 FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyatspi/*"
 
-- 
2.43.0


