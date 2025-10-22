Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA967CCD1A5
	for <webhook@archiver.kernel.org>; Wed, 22 Oct 2025 02:23:09 +0000 (UTC)
Received: from esa3.hc1455-7.c3s2.iphmx.com (esa3.hc1455-7.c3s2.iphmx.com [207.54.90.49])
 by mx.groups.io with SMTP id smtpd.web11.4832.1761099788211420143
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Oct 2025 19:23:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=c+EmXG8U;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.49, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1761099789; x=1792635789;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fwXVqD4ipMU7ZJ3Ijqc9+JKFEesfRIc5FWMBvZ8pZCw=;
  b=c+EmXG8UAVqzj8AWbfr61lePAvvKE2nUSShBZysUrKBI2hY+jWdByrvz
   3Q6/0+cANs8lXkA+J6uDUbDJrq33NK9vA7CCyA4cwGmoTxfUto0nmOhJ0
   29OxWtxCzvhUOz4eTtIilLSvqRfT/yLrm4xTyLsoJG9fqcSYZYJ5NbOUC
   D7t7Cay1sFMYK3bIBpantKJt3QLK+4/dP41calcES0bUTcAmC0sh5jdY0
   VCMWks8QvL03HaB8jgYtqmkHZ1RdZZYH501vCEkd97mRptDdgtYG2Wk9P
   sCR8tApko0ps2HlWeIUKrvEkjtuCkPM8Fe6ncycxeg5MEhYrzBCC1UTek
   g==;
X-CSE-ConnectionGUID: XyI0A9KsR5WpYGTWERflQw==
X-CSE-MsgGUID: S0772nqjR620TzwQJRdfag==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="216694934"
X-IronPort-AV: E=Sophos;i="6.19,246,1754924400"; 
   d="scan'208";a="216694934"
Received: from unknown (HELO az2nlsmgr3.o.css.fujitsu.com) ([51.138.80.169])
  by esa3.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2025 11:23:08 +0900
Received: from az2nlsmgm2.o.css.fujitsu.com (unknown [10.150.26.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id AA0E21000351
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:06 +0000 (UTC)
Received: from az2nlsmom1.o.css.fujitsu.com (az2nlsmom1.o.css.fujitsu.com [10.150.26.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id 6F66F1C00175
	for <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by az2nlsmom1.o.css.fujitsu.com (Postfix) with ESMTP id DCBF582C0D0;
	Wed, 22 Oct 2025 02:23:03 +0000 (UTC)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH 17/29] python3-h5py: upgrade 3.14.0 -> 3.15.0
Date: Wed, 22 Oct 2025 10:22:13 +0800
Message-ID: <20251022022227.226-17-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20251022022227.226-1-wangmy@fujitsu.com>
References: <20251022022227.226-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 22 Oct 2025 02:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120864

From: Wang Mingyu <wangmy@fujitsu.com>

0001-setup_build.py-avoid-absolute-path.patch
refreshed for 3.15.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../0001-setup_build.py-avoid-absolute-path.patch         | 8 ++++----
 .../{python3-h5py_3.14.0.bb => python3-h5py_3.15.0.bb}    | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)
 rename meta-python/recipes-devtools/python/{python3-h5py_3.14.0.bb => python3-h5py_3.15.0.bb} (88%)

diff --git a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
index e24d4f9225..279caef51c 100644
--- a/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
+++ b/meta-python/recipes-devtools/python/python3-h5py/0001-setup_build.py-avoid-absolute-path.patch
@@ -1,4 +1,4 @@
-From 76f7c7e6efd8166342cc3c84e53d4e18dbdeda13 Mon Sep 17 00:00:00 2001
+From 9711cd69aff85df299059d828d172967b2caa95c Mon Sep 17 00:00:00 2001
 From: Mingli Yu <mingli.yu@windriver.com>
 Date: Thu, 28 Jan 2021 18:44:10 -0800
 Subject: [PATCH] setup_build.py: avoid absolute path
@@ -14,10 +14,10 @@ Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/setup_build.py b/setup_build.py
-index 9b4766e..a411462 100644
+index d417447..5faaea0 100644
 --- a/setup_build.py
 +++ b/setup_build.py
-@@ -21,7 +21,7 @@ from setup_configure import BuildConfig
+@@ -22,7 +22,7 @@ from setup_configure import BuildConfig
  
  
  def localpath(*args):
@@ -25,4 +25,4 @@ index 9b4766e..a411462 100644
 +    return op.join(*args)
  
  
- MODULES_NUMPY2 = ['_npystrings']
+ MODULES = ['defs', '_errors', '_objects', '_proxy', 'h5fd', 'h5z',
diff --git a/meta-python/recipes-devtools/python/python3-h5py_3.14.0.bb b/meta-python/recipes-devtools/python/python3-h5py_3.15.0.bb
similarity index 88%
rename from meta-python/recipes-devtools/python/python3-h5py_3.14.0.bb
rename to meta-python/recipes-devtools/python/python3-h5py_3.15.0.bb
index da280d1253..dd71a18534 100644
--- a/meta-python/recipes-devtools/python/python3-h5py_3.14.0.bb
+++ b/meta-python/recipes-devtools/python/python3-h5py_3.15.0.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=113251d71fb0384712c719b567261c5c"
 
-SRC_URI[sha256sum] = "2372116b2e0d5d3e5e705b7f663f7c8d96fa79a4052d250484ef91d24d6a08f4"
+SRC_URI[sha256sum] = "ede198dde0c359a3f9dc0af15962707c7195102235cb26b4826e33918789559a"
 
 SRC_URI += "file://0001-setup_build.py-avoid-absolute-path.patch"
 
-- 
2.43.0


