Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D7D7C87FDA
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:55:09 +0000 (UTC)
Received: from esa6.hc1455-7.c3s2.iphmx.com (esa6.hc1455-7.c3s2.iphmx.com [68.232.139.139])
 by mx.groups.io with SMTP id smtpd.web11.31372.1753869308718567579
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:55:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=k7oq3tZO;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.139, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1753869309; x=1785405309;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xKRXCVDcI1+aeeoeZZ0E1g6KL2Fqu/LtlUvno4JDrow=;
  b=k7oq3tZOfgUTuVXFHO7l8yJFvKLNE1O255B0YwzYjn8YmDYF622VktsC
   WsM66MOLCbuMkiJgoECb+Lhc9n6H/nLRjFicBTrwb/xsnQQNLKqslAWDS
   UTYIffNZzH+uxmZoEtfvK4pQSGU1Zq9GKCy0/3zqcx8+A4BhN7ZRCd6Bu
   nB1sXUEbm56V8xnEpDsFqOEcye77Ndx1tEcBemUwOKsDUcAGJZGtMpftI
   VtCHbcXbGqZR39QWWGnnCPK9zhBTO9gUdT5AN/TmAookGqTIC82UnJMAa
   Bop6+MZmQd9ChYsZUhOzou5bVlXnUuO4rmdO2LL70iasIwEma528dac1M
   A==;
X-CSE-ConnectionGUID: pXMFuCN6SJaogCiTQumSbA==
X-CSE-MsgGUID: GJN8AreCQi+z0LYLTAVHag==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="211191708"
X-IronPort-AV: E=Sophos;i="6.16,350,1744038000"; 
   d="scan'208";a="211191708"
Received: from unknown (HELO az2uksmgr3.o.css.fujitsu.com) ([52.151.125.128])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2025 18:55:08 +0900
Received: from az2uksmgm1.o.css.fujitsu.com (unknown [10.151.22.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgr3.o.css.fujitsu.com (Postfix) with ESMTPS id 3C2EB1002B93
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:07 +0000 (UTC)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by az2uksmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id A9207823C4D
	for <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:06 +0000 (UTC)
Received: from G08FNSTD200057.g08.fujitsu.local (unknown [10.193.161.187])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 577D81A0073;
	Wed, 30 Jul 2025 17:55:03 +0800 (CST)
From: Wang Mingyu < wangmy@fujitsu.com>
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH 13/40] mpich: upgrade 4.3.0 -> 4.3.1
Date: Wed, 30 Jul 2025 17:54:29 +0800
Message-ID: <20250730095456.695-13-wangmy@fujitsu.com>
X-Mailer: git-send-email 2.49.0.windows.1
In-Reply-To: <20250730095456.695-1-wangmy@fujitsu.com>
References: <20250730095456.695-1-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 30 Jul 2025 09:55:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118777

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
- Fix initialization in GPU-aware builds when no devices are present
- Fix internal pmix.h header conflict when building with an external
  PMIx library.
- Fix build issue with Slurm by removing dependency on libslurm and
  always using internal logic for parsing the Slurm hostfile.
- Fix potential stale GPU IPC handle usage resulting in data corruption
  or crashes
- Update XPMEM thresholds to avoid excessive buffer mapping overhead
- Fix potential hang in ROMIO when setting info hints on certain files
- Improved detection of incompatible PMI[x] client/server configuration
- Fix use of PMIX_PREFIX attribute for certain versions of OpenPMIx
- Fix Intel GPU output with MPIR_CVAR_DEBUG_SUMMARY
- Fix F08 binding compilation with nvfortran
- Fix line continuation Hydra's --configfile option
- Fix valgrind uninitialized read warnings in ch3
- Fix missing mpixxx_opts.conf file with help text for mpicc and friends
- Fixes for several compiler warnings

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../recipes-devtools/mpich/{mpich_4.3.0.bb => mpich_4.3.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-devtools/mpich/{mpich_4.3.0.bb => mpich_4.3.1.bb} (96%)

diff --git a/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb b/meta-oe/recipes-devtools/mpich/mpich_4.3.1.bb
similarity index 96%
rename from meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
rename to meta-oe/recipes-devtools/mpich/mpich_4.3.1.bb
index 6babba3de7..ffe1791c61 100644
--- a/meta-oe/recipes-devtools/mpich/mpich_4.3.0.bb
+++ b/meta-oe/recipes-devtools/mpich/mpich_4.3.1.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3a296dfb961b957b0e8adf67d8478d3d"
 
 SRC_URI = "http://www.mpich.org/static/downloads/${PV}/mpich-${PV}.tar.gz"
-SRC_URI[sha256sum] = "5e04132984ad83cab9cc53f76072d2b5ef5a6d24b0a9ff9047a8ff96121bcc63"
+SRC_URI[sha256sum] = "acc11cb2bdc69678dc8bba747c24a28233c58596f81f03785bf2b7bb7a0ef7dc"
 
 RDEPENDS:${PN} += "bash perl libxml2"
 
-- 
2.43.0


