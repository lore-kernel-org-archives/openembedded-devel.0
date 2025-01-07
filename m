Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15ED2E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 06:36:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by mx.groups.io with SMTP id smtpd.web10.15083.1736231785567975995
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 22:36:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=iprxb00s;
 spf=pass (domain: intel.com, ip: 198.175.65.13, mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736231786; x=1767767786;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8r7mIe2OrBqRVUou/yfK4ZLM0/j7qX2gzLaIHZcdOiA=;
  b=iprxb00sipr+fA7JwCHcpgp9fW1DYw+gdfRuYc5mq9NuXYhi53KPGexc
   0Mrp3gSvEkL0p/EAjwICeyxjuhuUIwMLBUKl+Ci4v5NZdzX02/zyyihmX
   OHGJS9YTMDnzP/VIBb3oE9YAxDR47/4AMjBVXRydSUmohylCUZc4kdf/e
   II+hwELVDb9YfSpCXsMj/vaVQkAeJ2yC+3IBhsti5fBGmyiGo3fEKirwO
   Zc6NHkZXlJw//LA01SVJho34J7hmr0+8ezefrGYAHm8cnozyl/oKXYNUs
   3SEfYegmi0959kuu3NwqZo6q0wq5myXzSrl3mfqFm8FnLKhmd+64IDZv3
   Q==;
X-CSE-ConnectionGUID: hoJugUPYTLi0g7S+sxmFBw==
X-CSE-MsgGUID: iy9NpyZeT3yEyuGbV16pYQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="47388344"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="47388344"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 22:36:25 -0800
X-CSE-ConnectionGUID: Ct6KzjlfQm+SMzNS1X9o8g==
X-CSE-MsgGUID: yUCnVz5BQr+lUyj9ARSoeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="102537691"
Received: from ubuntu-99586.iind.intel.com ([10.145.177.170])
  by orviesa010.jf.intel.com with ESMTP; 06 Jan 2025 22:36:24 -0800
From: preeti.sachan@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][master][PATCH] bpftool: fix libelf.h not found error
Date: Tue,  7 Jan 2025 12:07:04 +0800
Message-Id: <20250107040704.107251-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 06:36:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114675

From: Preeti Sachan <preeti.sachan@intel.com>

When build host machine is not installed with elfutils-libelf-devel, it
throws compile error "libelf.h: No such file or directory". Fix missing
headers file by including path ${STAGING_INCDIR_NATIVE} via CFLAGS variable.
Use headers file from ${STAGING_INCDIR_NATIVE} instead of host machine.

Error:
| libbpf_internal.h:19:10: fatal error: libelf.h: No such file or directory

Signed-off-by: Preeti Sachan <preeti.sachan@intel.com>
---
 meta-oe/recipes-kernel/bpftool/bpftool.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes-kernel/bpftool/bpftool.bb
index 8bddde945..ec778c6e7 100644
--- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
+++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
@@ -14,7 +14,7 @@ EXTRA_OEMAKE = "\
     -C ${S}/tools/bpf/bpftool \
     O=${B} \
     CROSS=${TARGET_PREFIX} \
-    CC="${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH}" \
+    CC="${CC} ${DEBUG_PREFIX_MAP} -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} ${CFLAGS}" \
     HOSTCC="${BUILD_CC} ${BUILD_CFLAGS}" \
     LD="${LD}" \
     AR=${AR} \
-- 
2.34.1


