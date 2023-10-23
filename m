Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B939FCDB474
	for <webhook@archiver.kernel.org>; Mon, 23 Oct 2023 08:24:29 +0000 (UTC)
Received: from esa10.hc1455-7.c3s2.iphmx.com (esa10.hc1455-7.c3s2.iphmx.com [139.138.36.225])
 by mx.groups.io with SMTP id smtpd.web11.116192.1698049463752592268
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 23 Oct 2023 01:24:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: fujitsu.com, ip: 139.138.36.225, mailfrom: wangmy@fujitsu.com)
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="124887538"
X-IronPort-AV: E=Sophos;i="6.03,244,1694703600"; 
   d="scan'208";a="124887538"
Received: from unknown (HELO oym-r3.gw.nic.fujitsu.com) ([210.162.30.91])
  by esa10.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 17:24:21 +0900
Received: from oym-m2.gw.nic.fujitsu.com (oym-nat-oym-m2.gw.nic.fujitsu.com [192.168.87.59])
	by oym-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 3B369CA1E8
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:24:19 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 7C68ABF3C8
	for <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 17:24:18 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.52])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 8BA302005932A;
	Mon, 23 Oct 2023 17:24:17 +0900 (JST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] ceres-solver: upgrade 2.1.0 -> 2.2.0
Date: Mon, 23 Oct 2023 16:24:00 +0800
Message-Id: <1698049440-24721-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-27952.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-27952.006
X-TMASE-Result: 10-3.601000-10.000000
X-TMASE-MatchedRID: wbL0rUvz+3Cjz0nOeth/ySAWHOR37+ATpxAd6mi1Ga2+wiAas8H0WN2M
	E/jHwMLgeZoWwk6sZyztwwd/vwnoSgDNPxu11HXjP0HVIeixJdA3l2plwgrtWCD1HdXyqDnEvwU
	evDt+uW68MEz9q9cihpu91RWVjlmQw+noLBygYTjvVbHa5Rs8txCE2NlBjIjctE8mz+ry/JQhjp
	75eLVqH1slxAfd+6tXeTjw/FyRX6QfE8yM4pjsDxZ4ylU2GwzAxEHRux+uk8hxKpvEGAbTDm55w
	T4Y8nqolxUiJ9uLdQ3KMY5Trml5RC7FA6/KhjtVZGoDbSyej/7DdNNBsuqwpW9ppL41XN1BNzip
	e2ZHg8ZLH+ZfEKvWx4K+pasWyF5Rwt7TMGN5mtsVA4/nYFEFckxOwqPXyr98
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 23 Oct 2023 08:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105644

From: Wang Mingyu <wangmy@fujitsu.com>

License-Update: Copyright updated to 2.2.0.

Changelog:
==========
-Substantial improvement to threading performance across the board
-Mixed precision solves + iterative refinement when using CUDA or CPU based
 dense linear solvers, or EIGEN_SPARSE as the sparse linear algebra library.
-Cuda based CGNR and preconditioner support
-Nested Dissection (NESDIS) is now supported as an ordering method in addition
 to AMD.
-Power Bundle Adjustment is available as a linear solver and as a preconditioner
 by the name of SCHUR POWER SERIES EXPANSION
-Generalized Euler Angle conversions

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{ceres-solver_2.1.0.bb => ceres-solver_2.2.0.bb}          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-support/ceres-solver/{ceres-solver_2.1.0.bb => ceres-solver_2.2.0.bb} (94%)

diff --git a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
similarity index 94%
rename from meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb
rename to meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
index d3c6b421e6..18db0721de 100644
--- a/meta-oe/recipes-support/ceres-solver/ceres-solver_2.1.0.bb
+++ b/meta-oe/recipes-support/ceres-solver/ceres-solver_2.2.0.bb
@@ -1,12 +1,12 @@
 DESCRIPTION = "Ceres Solver is an open source C++ library for modeling and solving large, complicated optimization problems."
 HOMEPAGE = "http://ceres-solver.org/"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=bb761279816b72be19d7ce646e4e2a14"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=3585a26c9cd9ec0cb36a7d65542878ca"
 
 DEPENDS = "libeigen glog"
 
 SRC_URI = "git://github.com/ceres-solver/ceres-solver.git;branch=master;protocol=https"
-SRCREV = "f68321e7de8929fbcdb95dd42877531e64f72f66"
+SRCREV = "85331393dc0dff09f6fb9903ab0c4bfa3e134b01"
 
 S = "${WORKDIR}/git"
 
-- 
2.34.1


