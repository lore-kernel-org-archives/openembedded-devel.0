Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFB1C4828D
	for <webhook@archiver.kernel.org>; Wed,  7 Feb 2024 01:17:07 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.10569.1707268620611045417
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Feb 2024 17:17:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=t/8RvRUX;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1707268621; x=1738804621;
  h=from:to:cc:subject:date:message-id;
  bh=q4TL2gLheDRneDEJ+JhJzWv0m6eysDMAG0FZEsY3wpE=;
  b=t/8RvRUXF5HIXki2Hhhu4sKl9/QUhnQxYvC7Z7weN3MvlW1egGbmOtfd
   vDyNgENvF+Meaqmdc9Zo3xPppIJeImw2Bwqj8BGiNPJyKBQ0nqoVPY3Ir
   4wqUZ5umZenBQhUKzsuL/pKwhnBdJyk7cf9jy5hQ59DrOF3JMhTKTaVJH
   WRqsyk2FU3yDLTR1dvVfzGV34nJfFNsJAtHeqfTXnsGIyhpEIF/M/Nr3w
   YmhAa3IL7QevfFwzfGt73BBzyQhHqKZh+BjqUq1so5pIBU14pcsOCbMB5
   nbhnq1wD+M4u0izx5OEBOzQpIJ+vBbOsKQSmtuSr/EMUnWJZRJXBHZ/C8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10976"; a="148084908"
X-IronPort-AV: E=Sophos;i="6.05,248,1701097200"; 
   d="scan'208";a="148084908"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 10:16:58 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id E791437523
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:16:55 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com [192.51.206.22])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id 26D76CFB67
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:16:55 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id AB9896B4DE
	for <openembedded-devel@lists.openembedded.org>; Wed,  7 Feb 2024 10:16:54 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 5D1B21A006B;
	Wed,  7 Feb 2024 09:16:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 48.0 -> 50.0
Date: Wed,  7 Feb 2024 09:14:55 +0800
Message-Id: <1707268495-11897-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28174.001
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28174.001
X-TMASE-Result: 10-1.444000-10.000000
X-TMASE-MatchedRID: xNkyGzs1zQGjz0nOeth/yUIIxwDaU5mr8FHp8LCpZ7RnyL8x0tKlO9PQ
	+kcNsyKzR6nprnR1P7ZEosvkPwV+Qj5McczBxWeKKsurITpSv+NiMNd0z/HZUzsSeEPClW4dC3C
	bY2Q+izcGCaltd5dZD/l8i7a2s5xdiCsqewnUZGA/QdUh6LEl0DeXamXCCu1YIPUd1fKoOcS/BR
	68O365busIM/D0ygBYabNESeZVInxwyAmzxb7Z07i7edL7cQQOfeSCetNTjVcCGfvnVpx+256ba
	/D5x6cp4vM1YF6AJbbCCfuIMF6xLSdET58jp62Sa7KYaVRD5rNwrioQm/Iz/r/+xJiFF2rBRcgI
	buewwaKACg4dYzJZNsxrWqO7xuOOVADs94GUzHN5LJ/idjv+RY63zfzhthY8S7+RMq/2CK6rA4c
	7UV2fQpvi2PQO/FFQiz2ujrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 07 Feb 2024 01:17:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108642

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
=============
-Merge pull request #1419 from EdwardSro/pr-update-to-fc39
-Merge pull request #1422 from nmorey/dev/master/min-version
-README: Bump minimum supported version to v30.x
-Merge pull request #1421 from ffontaine/master
-cbuild: Update to Fedora 39
-build: Fix cmake warning
-pyverbs: Adapt includes in Fedora 39 [ #5860 ]
-pyverbs: Fix runtime warnings in Fedora 39
-pyverbs: Fix compilation error in Fedora 39
-util/udma_barrier.h: fix mips4 build

0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
refreshed for 50.0

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...ow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch | 12 +++++-------
 .../{rdma-core_48.0.bb => rdma-core_50.0.bb}         |  2 +-
 2 files changed, 6 insertions(+), 8 deletions(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_48.0.bb => rdma-core_50.0.bb} (96%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
index 03ba87261..e181ee287 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch
@@ -1,4 +1,4 @@
-From 92747aab189aa3cee954ab31ee019205f8984155 Mon Sep 17 00:00:00 2001
+From 209f346d55eeaf74e21c541d70ec43d39b6c8c3c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 27 May 2023 17:22:10 -0700
 Subject: [PATCH] cmake: Allow SYSTEMCTL_BIN to be overridden from environment
@@ -8,16 +8,17 @@ for systemctl
 
 Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
 ---
  CMakeLists.txt | 5 ++++-
  1 file changed, 4 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9b7462861..c4d82fb49 100644
+index 98985e7ee..001efb800 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -226,7 +226,10 @@ else()
-   set(CYTHON_EXECUTABLE "")
+@@ -237,7 +237,10 @@ else()
+   endif()
  endif()
  
 -find_program(SYSTEMCTL_BIN systemctl HINTS "/usr/bin" "/bin")
@@ -28,6 +29,3 @@ index 9b7462861..c4d82fb49 100644
  if (NOT SYSTEMCTL_BIN)
    set (SYSTEMCTL_BIN "/bin/systemctl")
  endif()
--- 
-2.40.1
-
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb
similarity index 96%
rename from meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb
index b9e07604d..d0f4fd47a 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_48.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb
@@ -7,7 +7,7 @@ RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
            file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch"
-SRCREV = "3e039515b959fea70356b010ed093e43cf360e99"
+SRCREV = "bc6b4bc134532e952fe7f8efc251e1f89b912098"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.34.1


