Return-Path: <preeti.sachan@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EC28E77197
	for <webhook@archiver.kernel.org>; Tue,  7 Jan 2025 04:51:04 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by mx.groups.io with SMTP id smtpd.web10.14008.1736225462855672224
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jan 2025 20:51:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=lxOahmJ3;
 spf=pass (domain: intel.com, ip: 192.198.163.18, mailfrom: preeti.sachan@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736225463; x=1767761463;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=8r7mIe2OrBqRVUou/yfK4ZLM0/j7qX2gzLaIHZcdOiA=;
  b=lxOahmJ3LT6RxyfbMPIhpNNPZQVRf0wgEbl66jzz5XsdMs5234MZ2bQK
   YOzx6I42cEcTUGrMQTQhNu0I3m/CNZk7Kx5JOP9i4mLzrEAAfpM4n6xh8
   a44LMsLpryBTN8YxslLfM9QKyT22OoNBD4+vxcADebWNYsyVfxLJehXzW
   Poi3anr+bbSa0/ggs8AvLX5HLYrwyFnxlm/DE7Uuf6qBVJ4HgzxtcXNIo
   FMvVT4BDMFepPrumPYBhkZmsLbxSvY73C/ukJhUFigxmRiGmKUMgnFaas
   sO57Cjoa9UHeoWdULnIkduz19ex9od42GADJiE2t6Saz0Vg+5mRFrNZSK
   g==;
X-CSE-ConnectionGUID: A/Rz+aijQJClQVelHncU4g==
X-CSE-MsgGUID: t3mHJ01gTWeouxLIYSVEcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="35689695"
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="35689695"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 20:51:02 -0800
X-CSE-ConnectionGUID: HDhSMg4lTcClJ2OEAXCJCw==
X-CSE-MsgGUID: /jAvaAJVTUS2rzXBPSfroQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,294,1728975600"; 
   d="scan'208";a="102467786"
Received: from ubuntu-99586.iind.intel.com ([10.145.177.170])
  by orviesa009.jf.intel.com with ESMTP; 06 Jan 2025 20:51:01 -0800
From: preeti.sachan@intel.com
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] bpftool: fix libelf.h not found error
Date: Tue,  7 Jan 2025 10:21:41 +0800
Message-Id: <20250107022141.81185-1-preeti.sachan@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Jan 2025 04:51:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114674

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


