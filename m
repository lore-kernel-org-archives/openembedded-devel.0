Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D446FD3ABEF
	for <webhook@archiver.kernel.org>; Mon,  8 Dec 2025 09:13:10 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4393.1765185175894704064
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 08 Dec 2025 01:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=DggMAPLe;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765185176; x=1796721176;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=9t9ivSabkEJsM0ChdyN+ck118dZHOhzFpaOpk4tnOZE=;
  b=DggMAPLeto9FRPB/um1LOW1ok+XywAHM+HOQEdoi+65ekimi4ty7th5u
   yI1io3l46BHO75BqNwDOdJwjDXdaPmUzTXoyCxP0W4sxeY99oxKSnE5h8
   /V5To2ppdeNeTQmBwgNK+BJwOcCRWVkA0dWdaCG2jqiik/Nx8qZcEzt5A
   CRzqBiwlr4rqPLBA4tSAh2S2WPe/u9LxOyzMogJ6gnZzC731LAkw6sn0H
   M1R52r+nUdqkp72iox5+5cN8o5CqYDT0BpCCHmyFx++zJr2ZsMdsFz5eb
   VftG4ljVSVOGF60K9F7IrpCSyaYM5HeR7aBHtZK8bgMHUP/oW7pdZY++K
   A==;
X-CSE-ConnectionGUID: iY0pIk1ORPOlthFT1Q2h8Q==
X-CSE-MsgGUID: mz80wDhRScm+a1p0CShhUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="221240936"
X-IronPort-AV: E=Sophos;i="6.20,258,1758553200"; 
   d="scan'208";a="221240936"
Received: from unknown (HELO az2uksmgr1.o.css.fujitsu.com) ([52.151.125.128])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 18:12:54 +0900
Received: from az2uksmgm3.o.css.fujitsu.com (unknown [10.151.22.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 475CE1C1C718
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Dec 2025 09:12:54 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (az2uksmom2.o.css.fujitsu.com [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm3.o.css.fujitsu.com (Postfix) with ESMTPS id F087AC00745
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Dec 2025 09:12:53 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTP id BED7914001DE
	for <openembedded-devel@lists.openembedded.org>; Mon,  8 Dec 2025 09:12:51 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-gnome][PATCH 1/2] blueprint-compiler: 0.18.0
Date: Mon,  8 Dec 2025 17:12:38 +0800
Message-ID: <20251208091239.21026-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 08 Dec 2025 09:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122370

Add a new recipe blueprint-compiler as depend for gnome-control-center 49.2.2.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../blueprint-compiler_0.18.0.bb                 | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb

diff --git a/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb b/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
new file mode 100644
index 0000000000..8980d7199c
--- /dev/null
+++ b/meta-gnome/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A markup language for GTK user interface files."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main"
+SRCREV = "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
+
+inherit meson pkgconfig
+
+PACKAGES += "${PN}-python"
+
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PN}-python = "python3-pygobject"
+
+BBCLASSEXTEND = "native"
-- 
2.43.0


