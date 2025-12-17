Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65062D64081
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 06:56:54 +0000 (UTC)
Received: from esa8.hc1455-7.c3s2.iphmx.com (esa8.hc1455-7.c3s2.iphmx.com [139.138.61.253])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8724.1765954613384140657
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 16 Dec 2025 22:56:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=WVkKkKkL;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.253, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1765954613; x=1797490613;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=US9Ch0vTy33glYqmfYswo8g/XoqBMRYlGmIChM5k+jE=;
  b=WVkKkKkLGJ+geZNVHyarisODAT/cwOeHr8CbbVjiZoZo5WEWZptx+VxX
   oCii4F2JfZzMbxC7ItY/YRLlERec8MJXTdaKTdPlPiMSJgXWlnNPLLb3U
   L09FPVaDV0aqQHfEYoZkcnXNazdp9tXPyb4tBf7Oot49SyLF2lFFWNbF6
   wCTOAGvy992bL7RY4BnSxdbLnhI4Gbn6T13eIpcnMtUUfhMVuN2E0V5kE
   Uk1Z/POL3q+evIjOtbTGFnnqCCP1goQPd/qkrNykEFYKtjVGQOWupsVl6
   pkaWdHxPgm5pgL0kczJ8IgWj20XXHc7hhX63B68kfX/lnDyWK3nfJtQeE
   A==;
X-CSE-ConnectionGUID: esJ8+FgLSXK98cFHdtT91Q==
X-CSE-MsgGUID: Vq4h1M9tSEu4LftOOra3Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="210872910"
X-IronPort-AV: E=Sophos;i="6.21,155,1763391600"; 
   d="scan'208";a="210872910"
Received: from unknown (HELO az2nlsmgr4.o.css.fujitsu.com) ([20.61.8.234])
  by esa8.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 15:56:51 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr4.o.css.fujitsu.com (Postfix) with ESMTPS id BF04F42A33F
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:51 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 692EC1C0097A
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:51 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.193.135.3])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id 49EF0829F00
	for <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:49 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH 5/5] python3-txaio: upgrade 25.12.1 -> 25.12.2
Date: Wed, 17 Dec 2025 14:56:46 +0800
Message-ID: <20251217065646.33485-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 17 Dec 2025 06:56:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122717

LICENSE CHKSUM has been changed as title was added in new LICENSE file.

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../recipes-devtools/python/python3-txaio_25.12.1.bb | 12 ------------
 .../recipes-devtools/python/python3-txaio_25.12.2.bb | 12 ++++++++++++
 2 files changed, 12 insertions(+), 12 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-txaio_25.12.1.bb
 create mode 100644 meta-python/recipes-devtools/python/python3-txaio_25.12.2.bb

diff --git a/meta-python/recipes-devtools/python/python3-txaio_25.12.1.bb b/meta-python/recipes-devtools/python/python3-txaio_25.12.1.bb
deleted file mode 100644
index 14db5d8f89..0000000000
--- a/meta-python/recipes-devtools/python/python3-txaio_25.12.1.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
-
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=588502cb4ffc65da2b26780d6baa5a40"
-
-SRC_URI[sha256sum] = "f0e83ffaf80a9b91bd710075cbc2bb71e879f8aa061b09f6e9dc122343dd69f2"
-
-inherit pypi python_setuptools_build_meta
-
-RDEPENDS:${PN} += " \
-    python3-twisted \
-"
diff --git a/meta-python/recipes-devtools/python/python3-txaio_25.12.2.bb b/meta-python/recipes-devtools/python/python3-txaio_25.12.2.bb
new file mode 100644
index 0000000000..6621df4016
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-txaio_25.12.2.bb
@@ -0,0 +1,12 @@
+DESCRIPTION = "Compatibility API between asyncio/Twisted/Trollius"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=f3b6f0e9bfce02a086e4ddfbc8504e33"
+
+SRC_URI[sha256sum] = "9f232c21e12aa1ff52690e365b5a0ecfd42cc27a6ec86e1b92ece88f763f4b78"
+
+inherit pypi python_setuptools_build_meta python_hatchling
+
+RDEPENDS:${PN} += " \
+    python3-twisted \
+"
-- 
2.43.0


