Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0293ECAC5B9
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 09:00:56 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web10.8317.1758704441632466881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 02:00:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=R0OsZVpA;
 spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1758704441; x=1790240441;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1lTCMig3g7+RLaLcO2tY2UFHZF8/gK1qsS2WS9c7BDA=;
  b=R0OsZVpAF7T9urEX+0zIzBeP1blXs7M0/pxkfo81PczUyyD03Xhlb68x
   dt+vUtdFIRDxfw3RYynG6lXkFjoQN1pN59y5oii5x/1TN//AOAHdBhME2
   OUWrju0uP413Pi6QinuqePBXNw3z20aUr72GzqBDPdawVcHrcRCDTdUVt
   LdmIzYjgykjITbF5dO7TOKC9eqpkBB14QSr5bJVFZ32NlkIJVyBK3SIkj
   4dro5c7Z0Mp0WEQCA5po/RrNiEXXbSPEoKfjBoFQ4Ncpn7RSO7UAnjPoY
   sEuNFTavxG0+BXoW3xZqt1vzoCVX6UPqgzjBbTglLYhBtU1DwwGAuLx6/
   g==;
X-CSE-ConnectionGUID: VGq6vSyIR2qAeKaYGpotDA==
X-CSE-MsgGUID: KHsqbx7rRaexVfOKiuKt7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="201172410"
X-IronPort-AV: E=Sophos;i="6.18,290,1751209200"; 
   d="scan'208";a="201172410"
Received: from unknown (HELO az2nlsmgr1.o.css.fujitsu.com) ([51.138.80.169])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2025 18:00:40 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgr1.o.css.fujitsu.com (Postfix) with ESMTPS id 271B81C00095
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (az2uksmom4.o.css.fujitsu.com [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id D1A611801991
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:39 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 3D76F402891;
	Wed, 24 Sep 2025 09:00:38 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.128.28])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id AF2BC1A0086;
	Wed, 24 Sep 2025 17:00:33 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 05/29] freeipmi: upgrade 1.6.15 -> 1.6.16
Date: Wed, 24 Sep 2025 17:00:05 +0800
Message-ID: <20250924090029.1786-5-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250924090029.1786-1-wangmy@fujitsu.com>
References: <20250924090029.1786-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 09:00:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119770

From: Wang Mingyu <wangmy@fujitsu.com>

0001-Fix-for-GCC15-C23-build-failure.patch
removed since it's included in 1.6.16

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...0001-Fix-for-GCC15-C23-build-failure.patch | 42 -------------------
 ...{freeipmi_1.6.15.bb => freeipmi_1.6.16.bb} |  7 +---
 2 files changed, 2 insertions(+), 47 deletions(-)
 delete mode 100644 meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-for-GCC15-C23-build-failure.patch
 rename meta-oe/recipes-support/freeipmi/{freeipmi_1.6.15.bb => freeipmi_1.6.16.bb} (85%)

diff --git a/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-for-GCC15-C23-build-failure.patch b/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-for-GCC15-C23-build-failure.patch
deleted file mode 100644
index ee27fe7906..0000000000
--- a/meta-oe/recipes-support/freeipmi/freeipmi/0001-Fix-for-GCC15-C23-build-failure.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 5afe6492735938e0053ae78817399fa433f0f8c7 Mon Sep 17 00:00:00 2001
-From: "Pavel Cahyna" <pcahyna@redhat.com>
-Date: Tue, 8 Apr 2025 19:05:53 +0900
-Subject: [PATCH] Fix for GCC15 / C23 build failure
-
-* Import submitted patch from:
-  https://lists.gnu.org/archive/html/freeipmi-devel/2025-02/msg00000.html
-
-  to fix:
-  http://errors.yoctoproject.org/Errors/Details/851185/
-  Error occurs with gcc version 15.
-  In gcc-15, C23 is the default and 'bool' is used as a reserved keyword.
-  https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=55e3bd376b2214e200fa76d12b67ff259b06c212
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/freeipmi-devel/2025-02/msg00000.html]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- common/toolcommon/tool-config-file-common.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/common/toolcommon/tool-config-file-common.c b/common/toolcommon/tool-config-file-common.c
-index 609e7a3..20dfad5 100644
---- a/common/toolcommon/tool-config-file-common.c
-+++ b/common/toolcommon/tool-config-file-common.c
-@@ -78,14 +78,14 @@ _config_file_bool (conffile_t cf,
-                    void *app_ptr,
-                    int app_data)
- {
--  int *bool;
-+  int *value;
- 
-   assert (data);
-   assert (optionname);
-   assert (option_ptr);
- 
--  bool = (int *)option_ptr;
--  *bool = data->boolval;
-+  value = (int *)option_ptr;
-+  *value = data->boolval;
-   return (0);
- }
- 
diff --git a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
similarity index 85%
rename from meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb
rename to meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
index e04ebfb0c6..f5be870b1d 100644
--- a/meta-oe/recipes-support/freeipmi/freeipmi_1.6.15.bb
+++ b/meta-oe/recipes-support/freeipmi/freeipmi_1.6.16.bb
@@ -13,11 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.pstdout;md5=d32239bcb673463ab874e80d47fae504 \
                     file://COPYING.sunbmc;md5=c03f21cd76ff5caba6b890d1213cbfbb"
 
-SRC_URI = " \
-    ${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz \
-    file://0001-Fix-for-GCC15-C23-build-failure.patch \
-"
-SRC_URI[sha256sum] = "d6929c354639f5ce75b5b1897e8b366eb63625c23e5c4590a7aea034fe2b8caf"
+SRC_URI = "${GNU_MIRROR}/freeipmi/freeipmi-${PV}.tar.gz"
+SRC_URI[sha256sum] = "5bcef6bb9eb680e49b4a3623579930ace7899f53925b2045fe9f91ad6904111d"
 
 DEPENDS = "libgcrypt"
 DEPENDS:append:libc-musl = " argp-standalone"
-- 
2.43.0


