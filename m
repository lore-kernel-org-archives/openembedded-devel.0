Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A71C2CAC5B6
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:02 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=R4P1eobh;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628682; x=1790164682;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=adsJqCUvcqP/n/hl2mqfnLhjIrxmsB0GU2tVAhv0f9I=;
  b=R4P1eobhaaYZLX1/k2Rjjp5YcToTJEwewmisLCFLWJRUqy4U/M/OVX+O
   zr2bzgPsrY00iRmkXV5PDP5flYv2wuMPqd9kzZrVMP3bv2mFoFRSBkXuC
   6nfXw5UkyT9do12Q+TfASr3P6qdMhOLh3iTZ+SEeiGo94NO2oxBQxoail
   eAxz3lqP8nPKlulRgQWI94BSDpXJwLhd5McenLi5YPM1I6oj8SVnJUzfb
   CcCDUCy74D8vs8fyIkoDZ7oxNr9VBWtMr4ZPHNwaFJVgRTB1D+d81z+cb
   N2zJrOCzLfZ8ol2sbtYPHoV1UUCtJfou0Y+sNoYlggOm2KB/rEn9PqSRl
   Q==;
X-CSE-ConnectionGUID: Cf0Xb4BbTKS6Edw/d3o1TQ==
X-CSE-MsgGUID: bQdCG/Q/QCOsyt6So45ckQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821801"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821801"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:02 -0700
X-CSE-ConnectionGUID: L4RGU34PT+WZA8dH23EZMQ==
X-CSE-MsgGUID: 7FX2aqS5T0uDHNuGLXP3YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875197"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:01 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 14/24] openjpeg: fix for CVE-2025-54874
Date: Tue, 23 Sep 2025 19:57:17 +0800
Message-ID: <e930b71d14fd71a07ad681229259d0095ec240fa.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119703

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 5d0643f194e9a7ed77eddbdc1d106536df2eb488)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../openjpeg/openjpeg/CVE-2025-54874.patch    | 44 +++++++++++++++++++
 .../openjpeg/openjpeg_2.5.3.bb                |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch

diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
new file mode 100644
index 0000000000..187557a35c
--- /dev/null
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg/CVE-2025-54874.patch
@@ -0,0 +1,44 @@
+From f809b80c67717c152a5ad30bf06774f00da4fd2d Mon Sep 17 00:00:00 2001
+From: Sebastian Rasmussen <sebras@gmail.com>
+Date: Thu, 16 Jan 2025 02:13:43 +0100
+Subject: [PATCH] opj_jp2_read_header: Check for error after parsing header.
+
+Consider the case where the caller has not set the p_image
+pointer to NULL before calling opj_read_header().
+
+If opj_j2k_read_header_procedure() fails while obtaining the rest
+of the marker segment when calling opj_stream_read_data() because
+the data stream is too short, then opj_j2k_read_header() will
+never have the chance to initialize p_image, leaving it
+uninitialized.
+
+opj_jp2_read_header() will check the p_image value whether
+opj_j2k_read_header() suceeded or failed. This may be detected as
+an error in valgrind or ASAN.
+
+The fix is to check whether opj_j2k_read_header() suceeded before
+using the output argument p_image.
+
+CVE: CVE-2025-54874
+Upstream-Status: Backport [https://github.com/uclouvain/openjpeg/commit/f809b80c67717c152a5ad30bf06774f00da4fd2d]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ src/lib/openjp2/jp2.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/lib/openjp2/jp2.c b/src/lib/openjp2/jp2.c
+index 4df055a5..da506318 100644
+--- a/src/lib/openjp2/jp2.c
++++ b/src/lib/openjp2/jp2.c
+@@ -2873,7 +2873,7 @@ OPJ_BOOL opj_jp2_read_header(opj_stream_private_t *p_stream,
+                               p_image,
+                               p_manager);
+ 
+-    if (p_image && *p_image) {
++    if (ret && p_image && *p_image) {
+         /* Set Image Color Space */
+         if (jp2->enumcs == 16) {
+             (*p_image)->color_space = OPJ_CLRSPC_SRGB;
+-- 
+2.50.1
+
diff --git a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
index 231bf84573..586bfeaf1f 100644
--- a/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
+++ b/meta-oe/recipes-graphics/openjpeg/openjpeg_2.5.3.bb
@@ -7,6 +7,7 @@ DEPENDS = "libpng tiff lcms zlib"
 
 SRC_URI = "git://github.com/uclouvain/openjpeg.git;branch=master;protocol=https \
            file://0001-Do-not-ask-cmake-to-export-binaries-they-don-t-make-.patch \
+           file://CVE-2025-54874.patch \
            "
 SRCREV = "210a8a5690d0da66f02d49420d7176a21ef409dc"
 S = "${WORKDIR}/git"

