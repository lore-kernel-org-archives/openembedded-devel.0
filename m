Return-Path: <liuyd.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B32401073C87
	for <webhook@archiver.kernel.org>; Wed,  8 Apr 2026 09:50:13 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.102399.1775641806748631801
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Apr 2026 02:50:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=mydQPbfV;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: liuyd.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1775641807; x=1807177807;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nUPObWaYJTGF0SWu/NnL4u2qHJ/R0HoUs1brAvGcKcw=;
  b=mydQPbfV70ih7WnMU7JJScwiW3EIZnKbgGTjTHjjgV3M9i4RuOOOygCP
   MxM7BLQQHmjcUYXzVwhv1hYpc+2SYCYMH66zy69woJKjKUAm9gUMrfA5x
   vEcbMRwCMWQCwAX6gB+cPA/pR4UBUNNazVK023/A3zx2zaFVpzkPBkATO
   sTsZoycltI3Xk36IHshU3HCOjMQeg6NWYLmCE0fZEMDANkuZPZrMTKUKS
   S1ogYo9rGjbS4MdP9PfAkxUoVLU5+MvNNwhwwWGE/WnVmrIUgAXugXT0q
   7cNLedYTumH0jcqpZtVUzOTWvkKJ/RsxdjDHTHK5fx+KMc4lbfMguYZv9
   Q==;
X-CSE-ConnectionGUID: oGd0/rFwS6O4Wv1UzAKheA==
X-CSE-MsgGUID: nfLZxMfpR3GWp8Ypd4C19g==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="223731361"
X-IronPort-AV: E=Sophos;i="6.23,167,1770562800"; 
   d="scan'208";a="223731361"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2026 18:50:05 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id E4354C0037D
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 09:50:04 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (az2uksmom3.o.css.fujitsu.com [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 99DE3180ABDA
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 09:50:04 +0000 (UTC)
Received: from G08FNSTD190101.g08.fujitsu.local (unknown [10.167.135.148])
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTP id 836E91003F4D
	for <openembedded-devel@lists.openembedded.org>; Wed,  8 Apr 2026 09:50:02 +0000 (UTC)
From: Liu Yiding <liuyd.fnst@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Subject: [oe][meta-python][PATCH] python3-ckzg: upgrade 2.1.1 -> 2.1.7
Date: Wed,  8 Apr 2026 17:49:57 +0800
Message-ID: <20260408094958.22579-1-liuyd.fnst@fujitsu.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Apr 2026 09:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126105

1.Changelog:
  https://github.com/ethereum/c-kzg-4844/releases/tag/v2.1.7

2.Remove python-ckzg-0001-Let-override-CC.patch as it was merged upstream

3.Remove python-ckzg-0002-Disable-Werror.patch as it was dropped in the Fedora package
  https://src.fedoraproject.org/rpms/python-ckzg/blob/rawhide/f/python-ckzg.spec

Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
---
 .../python-ckzg-0001-Let-override-CC.patch    | 21 -------------
 .../python-ckzg-0002-Disable-Werror.patch     | 30 -------------------
 ...n3-ckzg_2.1.1.bb => python3-ckzg_2.1.7.bb} |  4 +--
 3 files changed, 1 insertion(+), 54 deletions(-)
 delete mode 100644 meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0001-Let-override-CC.patch
 delete mode 100644 meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0002-Disable-Werror.patch
 rename meta-python/recipes-devtools/python/{python3-ckzg_2.1.1.bb => python3-ckzg_2.1.7.bb} (64%)

diff --git a/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0001-Let-override-CC.patch b/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0001-Let-override-CC.patch
deleted file mode 100644
index c58089cc15..0000000000
--- a/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0001-Let-override-CC.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-From: Peter Lemenkov <lemenkov@gmail.com>
-Date: Wed, 6 Nov 2024 16:35:23 +0300
-Subject: [PATCH] Let override CC
-
-Upstream-Status: Pending
-
-Signed-off-by: Peter Lemenkov <lemenkov@gmail.com>
-
-diff --git a/src/Makefile b/src/Makefile
-index b733a11..c688005 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -79,7 +79,7 @@ ifeq ($(PLATFORM),Windows)
- 	CFLAGS += -D_CRT_SECURE_NO_WARNINGS
- 	CFLAGS += -Wno-missing-braces -Wno-format
- else
--	CC = clang
-+	CC ?= clang
- 	CFLAGS += -fPIC
- 	CFLAGS += -Wmissing-braces -Wformat=2
- endif
diff --git a/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0002-Disable-Werror.patch b/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0002-Disable-Werror.patch
deleted file mode 100644
index 9b0baa358a..0000000000
--- a/meta-python/recipes-devtools/python/python3-ckzg/python-ckzg-0002-Disable-Werror.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From: rpm-build <rpm-build>
-Date: Tue, 26 Nov 2024 11:13:18 +0100
-Subject: [PATCH] Disable Werror
-
-Upstream-Status: Pending
-
-Signed-off-by: rpm-build <rpm-build>
-
-diff --git a/src/Makefile b/src/Makefile
-index c688005..01b7a80 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -20,7 +20,7 @@ ifeq ($(PLATFORM),Darwin)
- endif
- 
- # The base compiler flags. More can be added on command line.
--CFLAGS += -I. -I../inc -O2 -Werror
-+CFLAGS += -I. -I../inc
- # Enable a bunch of optional warnings.
- CFLAGS += \
- 	-pedantic \
-@@ -81,7 +81,7 @@ ifeq ($(PLATFORM),Windows)
- else
- 	CC ?= clang
- 	CFLAGS += -fPIC
--	CFLAGS += -Wmissing-braces -Wformat=2
-+	CFLAGS += -Wmissing-braces
- endif
- 
- # Settings for blst.
diff --git a/meta-python/recipes-devtools/python/python3-ckzg_2.1.1.bb b/meta-python/recipes-devtools/python/python3-ckzg_2.1.7.bb
similarity index 64%
rename from meta-python/recipes-devtools/python/python3-ckzg_2.1.1.bb
rename to meta-python/recipes-devtools/python/python3-ckzg_2.1.7.bb
index 5a6196bf75..b01bd2d78d 100644
--- a/meta-python/recipes-devtools/python/python3-ckzg_2.1.1.bb
+++ b/meta-python/recipes-devtools/python/python3-ckzg_2.1.7.bb
@@ -6,10 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=86d3f3a95c324c9479bd8986968f4327"
 
 SRC_URI += " \
 	file://blst-0001-Support-64-bit-limbs-on-no-asm-platforms.patch \
-	file://python-ckzg-0001-Let-override-CC.patch \
-	file://python-ckzg-0002-Disable-Werror.patch \
 "
 
-SRC_URI[sha256sum] = "d6b306b7ec93a24e4346aa53d07f7f75053bc0afc7398e35fa649e5f9d48fcc4"
+SRC_URI[sha256sum] = "a0c61c5fd573af0267bcb435ef0f499911289ceb05e863480779ea284a3bb928"
 
 inherit pypi setuptools3
-- 
2.43.0


