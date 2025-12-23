Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A216DE6B27D
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 06:11:51 +0000 (UTC)
Received: from esa2.hc1455-7.c3s2.iphmx.com (esa2.hc1455-7.c3s2.iphmx.com [207.54.90.48])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.95979.1766470310297896212
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 22:11:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=NHdM/uC3;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.48, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1766470311; x=1798006311;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=IVZfuKMZfQnX0HSzvcpaLICroDAds9V5Q4YS/NskKjI=;
  b=NHdM/uC3gHY+XJt9wkYMLp3WC+0tdppAa2WCpFT/EAABsdLKH3luXYxM
   sc5evfLI3l6PoP4PGthOMFqUPYkiDJx1FHjcBMizw2IwwzJ+6McuCoezp
   COkDL0zWBGH+BKis3bHx1sBlx2I9nMm3vzaTLVXWu0glv39GxVbbLVokb
   gvQorOP0+FcKKnKnZDAkQ6d3Y8ApLHz3v2zQr5PxgkfFM3/rcJUYWtHGF
   B10yIPX8SfyYFqBtTyOhoOFghRkH4g3OJZi+0LPZ041zGuNiTmvBP5EAX
   o7dWgJUf/pM5kuE4jMakmy2OS3qjm7TiagxSuqonQTldmmFmqglLFbO+D
   A==;
X-CSE-ConnectionGUID: I101VzPrQySX4NeFZSxU8g==
X-CSE-MsgGUID: m6almD0uQSWmsDQ2l8alVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="223561281"
X-IronPort-AV: E=Sophos;i="6.21,170,1763391600"; 
   d="scan'208";a="223561281"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.19])
  by esa2.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 15:11:49 +0900
Received: from az2uksmgm4.o.css.fujitsu.com (unknown [10.151.22.201])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 8EF4A1C1C717
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:48 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm4.o.css.fujitsu.com (Postfix) with ESMTPS id 4C0A8140037F
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:48 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 2915110005BD
	for <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:45 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-oe][PATCH 6/7] rwmem: upgrade 1.2 -> 2.0 
Date: Tue, 23 Dec 2025 14:10:41 +0800
Message-ID: <20251223061043.659-6-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
References: <20251223061043.659-1-liuyd.fnst@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 06:11:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122822

2. Pyrwmem and static-libc build option has been removed in 2.0.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../rwmem/0001-include-missing-cstdint.patch  | 32 -------------------
 .../rwmem/{rwmem_1.2.bb => rwmem_2.0.bb}      | 16 ++--------
 2 files changed, 3 insertions(+), 45 deletions(-)
 delete mode 100644 meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-include-missing-cstdint.patch
 rename meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/{rwmem_1.2.bb => rwmem_2.0.bb} (64%)

diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-include-missing-cstdint.patch b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-include-missing-cstdint.patch
deleted file mode 100644
index 0560daa4c2..0000000000
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem/0001-include-missing-cstdint.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 84e884f99e581515b49d8973538bb17e1e6c0dc0 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 26 Jan 2023 20:45:57 -0800
-Subject: [PATCH] include missing <cstdint>
-
-gcc 13 moved some includes around and as a result <cstdint> is no
-longer transitively included [1]. Explicitly include it for
-uint{32,64}_t.
-
-[1] https://gcc.gnu.org/gcc-13/porting_to.html#header-dep-changes
-
-Upstream-Status: Submitted [https://github.com/tomba/rwmem/pull/7]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- librwmem/helpers.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/librwmem/helpers.h b/librwmem/helpers.h
-index a0a738b..8d02c9c 100644
---- a/librwmem/helpers.h
-+++ b/librwmem/helpers.h
-@@ -1,6 +1,7 @@
- #pragma once
- 
- #include <cerrno>
-+#include <cstdint>
- #include <string>
- #include <vector>
- #include <string.h>
--- 
-2.39.1
-
diff --git a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb
similarity index 64%
rename from meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
rename to meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb
index 078be849a3..aea81ee23f 100644
--- a/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_1.2.bb
+++ b/meta-oe/dynamic-layers/meta-python/recipes-bsp/rwmem/rwmem_2.0.bb
@@ -14,22 +14,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 DEPENDS += "fmt libinih"
 
-PV .= "+git"
+SRCREV = "d8dda76a0d8bc3356120d087f783d237602e0278"
 
-SRCREV = "8416326777b2aada0706539b8f9f6acefa476b16"
+SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master;tag=${PV}"
 
-SRC_URI = "git://github.com/tomba/rwmem.git;protocol=https;name=rwmem;branch=master \
-           file://0001-include-missing-cstdint.patch"
-
-
-inherit meson pkgconfig python3native
-
-PACKAGECONFIG ?= "python static"
-PACKAGECONFIG[python] = "-Dpyrwmem=enabled,-Dpyrwmem=disabled,cmake-native python3 python3-pybind11"
-PACKAGECONFIG[static] = "-Dstatic-libc=true,-Dstatic-libc=false,"
+inherit meson pkgconfig
 
 do_install:append() {
 	install -D -m 0644 ${B}/librwmem/librwmem.a ${D}${libdir}/librwmem.a
 }
-
-FILES:${PN} += "${PYTHON_SITEPACKAGES_DIR}/pyrwmem"
-- 
2.43.0


