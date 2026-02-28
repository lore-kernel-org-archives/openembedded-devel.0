Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC5E3FEE4DE
	for <webhook@archiver.kernel.org>; Sat, 28 Feb 2026 09:02:18 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.115987.1772269333703136579
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 28 Feb 2026 01:02:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=tRDJemcO;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1772269334; x=1803805334;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=wTgcawm4qdOblYWhWbjcxUkIps7Eg+DnbNWnysPEZ4o=;
  b=tRDJemcO7f/LhLfKBTYKuuwF1lHlxJBF+GPZZ49XJ9TgDRTz7lKHkycc
   qbBJs/82eiMFNcMn7iMz5au2zzNsrBn9cgEEOxl4Yv8GVbUWNQfy5sBwg
   7ka4G+zXitbX6aEBaLCpp3NsVFpDvhK9HMDwPTH13PNo9H9iPdUEdPxQ1
   Uk2H5BLJcWTgY8sec/enMnbAkWUtPenUtSnidFjAVVzae06aUSNT6M2PY
   neQ8ubiD6EuAbyhNEe8GklaZyNZg0BXySH/XJt7lQOErFjDyHDt6B6dQk
   pNYSF26aR4pjkHhiaKHRP1jMYQh20qKeOg20AWydCo484+qw+v+h3tiM/
   g==;
X-CSE-ConnectionGUID: XM6cqAZjR3erKNQYYfOb+g==
X-CSE-MsgGUID: X4kxEKU3Tquf3ft994H/pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="231342232"
X-IronPort-AV: E=Sophos;i="6.21,315,1763391600"; 
   d="scan'208";a="231342232"
Received: from az2nlsmgm4.fujitsu.com (unknown [10.150.26.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mgmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id C492521F7
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:11 +0000 (UTC)
Received: from az2nlsmom3.fujitsu.com (az2nlsmom3.o.css.fujitsu.com [10.150.26.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm4.fujitsu.com (Postfix) with ESMTPS id 79D201007114
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:11 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.128.218])
	by az2nlsmom3.fujitsu.com (Postfix) with ESMTP id 3C2D3101BB45
	for <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:08 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-wxgtk4: upgrade 4.2.4 ->  4.2.5
Date: Sat, 28 Feb 2026 17:02:00 +0800
Message-ID: <20260228090204.3587-3-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
References: <20260228090204.3587-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 28 Feb 2026 09:02:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124772

Remove customization of ${S} as package name has restored to wxpython-${PV}.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../{python3-wxgtk4_4.2.4.bb => python3-wxgtk4_4.2.5.bb}      | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-python/recipes-devtools/python3-wxgtk4/{python3-wxgtk4_4.2.4.bb => python3-wxgtk4_4.2.5.bb} (90%)

diff --git a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
similarity index 90%
rename from meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
rename to meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
index 2899f6909e..857d8e46fa 100644
--- a/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.4.bb
+++ b/meta-python/recipes-devtools/python3-wxgtk4/python3-wxgtk4_4.2.5.bb
@@ -16,12 +16,10 @@ SRC_URI += "file://add-back-option-build-base.patch \
            file://not-overwrite-cflags-cxxflags.patch \
            file://0001-sip-Conditionally-use-GetAssertStackTrace-under-USE_.patch \
            "
-SRC_URI[sha256sum] = "2eb123979c87bcb329e8a2452269d60ff8f9f651e9bf25c67579e53c4ebbae3c"
+SRC_URI[sha256sum] = "44e836d1bccd99c38790bb034b6ecf70d9060f6734320560f7c4b0d006144793"
 
 inherit pypi setuptools3 cython pkgconfig features_check
 
-S = "${UNPACKDIR}/wxPython-${PV}"
-
 REQUIRED_DISTRO_FEATURES = "x11"
 
 export WX_CONFIG = "'${RECIPE_SYSROOT_NATIVE}${bindir}/wx-config --prefix=${STAGING_EXECPREFIXDIR} --baselib=${baselib}'"
-- 
2.43.0


