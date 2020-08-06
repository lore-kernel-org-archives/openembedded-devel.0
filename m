Received: from heian.cn.fujitsu.com (heian.cn.fujitsu.com [183.91.158.132])
 by mx.groups.io with SMTP id smtpd.web12.4109.1596676528621017630
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2020 18:15:29 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=SPF record not found (domain: cn.fujitsu.com, ip: 183.91.158.132, mailfrom: zangrc.fnst@cn.fujitsu.com)
X-IronPort-AV: E=Sophos;i="5.75,439,1589212800"; 
   d="scan'208";a="97674053"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
  by heian.cn.fujitsu.com with ESMTP; 06 Aug 2020 09:15:22 +0800
Received: from G08CNEXMBPEKD04.g08.fujitsu.local (unknown [10.167.33.201])
	by cn.fujitsu.com (Postfix) with ESMTP id E54DA4CE34E2
	for <openembedded-devel@lists.openembedded.org>; Thu,  6 Aug 2020 09:15:17 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201) with Microsoft SMTP Server
 (TLS) id 15.0.1497.2; Thu, 6 Aug 2020 09:15:18 +0800
From: "zangrc" <zangrc.fnst@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] rdma-core: upgrade 28.0 -> 30.0
Date: Thu, 6 Aug 2020 21:15:16 +0800
Message-ID: <1596719718-116822-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD04.g08.fujitsu.local (10.167.33.200) To
 G08CNEXMBPEKD04.g08.fujitsu.local (10.167.33.201)
X-yoursite-MailScanner-ID: E54DA4CE34E2.A7786
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zangrc.fnst@cn.fujitsu.com
X-Spam-Status: No
Content-Type: text/plain

Refresh the following patch:
rdma-core/0001-Remove-man-files-which-cant-be-built.patch

Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
---
 ...Remove-man-files-which-cant-be-built.patch | 45 ++++++++++++-------
 .../{rdma-core_28.0.bb => rdma-core_30.0.bb}  |  2 +-
 2 files changed, 29 insertions(+), 18 deletions(-)
 rename meta-networking/recipes-support/rdma-core/{rdma-core_28.0.bb => rdma-core_30.0.bb} (96%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
index feed0213c7..4b2e33e9ab 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
@@ -1,6 +1,6 @@
-From 5a8a2f81ef8650f06d1d9d268add612ab46025f1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 12 Jun 2018 22:57:04 -0700
+From cfcfb8a110b72b9d92cf7c56f374478f65473653 Mon Sep 17 00:00:00 2001
+From: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
+Date: Wed, 5 Aug 2020 17:21:14 +0900
 Subject: [PATCH] Remove man files which cant be built
 
 Remove need for pandoc-prebuilt during cross build
@@ -18,15 +18,17 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Update for version 26.1. Remove more man files which can no be built.
 
 Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
 ---
- infiniband-diags/man/CMakeLists.txt | 34 -------------------
- libibumad/man/CMakeLists.txt        |  2 --
- libibverbs/man/CMakeLists.txt       | 52 -----------------------------
- librdmacm/man/CMakeLists.txt        |  2 --
- providers/efa/man/CMakeLists.txt    |  2 --
+ infiniband-diags/man/CMakeLists.txt | 34 ------------
+ libibumad/man/CMakeLists.txt        |  2 -
+ libibverbs/man/CMakeLists.txt       | 53 -------------------
+ librdmacm/man/CMakeLists.txt        |  2 -
+ providers/efa/man/CMakeLists.txt    |  2 -
  providers/mlx4/man/CMakeLists.txt   |  1 -
- providers/mlx5/man/CMakeLists.txt   | 65 -------------------------------------
- 7 files changed, 158 deletions(-)
+ providers/mlx5/man/CMakeLists.txt   | 82 -----------------------------
+ 7 files changed, 176 deletions(-)
 
 diff --git a/infiniband-diags/man/CMakeLists.txt b/infiniband-diags/man/CMakeLists.txt
 index 1f1f91c9..094a389f 100644
@@ -92,7 +94,7 @@ index 185584a0..857a4b8b 100644
 -  umad_init.3 umad_done.3
    )
 diff --git a/libibverbs/man/CMakeLists.txt b/libibverbs/man/CMakeLists.txt
-index e1d5edf8..92c68611 100644
+index 87f00185..92c68611 100644
 --- a/libibverbs/man/CMakeLists.txt
 +++ b/libibverbs/man/CMakeLists.txt
 @@ -1,24 +1,18 @@
@@ -120,7 +122,7 @@ index e1d5edf8..92c68611 100644
    ibv_create_qp.3
    ibv_create_qp_ex.3
    ibv_create_rwq_ind_table.3
-@@ -27,16 +21,8 @@ rdma_man_pages(
+@@ -27,17 +21,8 @@ rdma_man_pages(
    ibv_create_wq.3
    ibv_devices.1
    ibv_devinfo.1
@@ -129,6 +131,7 @@ index e1d5edf8..92c68611 100644
    ibv_get_async_event.3
    ibv_get_cq_event.3
 -  ibv_get_device_guid.3.md
+-  ibv_get_device_index.3.md
 -  ibv_get_device_list.3.md
 -  ibv_get_device_name.3.md
 -  ibv_get_pkey_index.3.md
@@ -137,7 +140,7 @@ index e1d5edf8..92c68611 100644
    ibv_modify_qp.3
    ibv_modify_qp_rate_limit.3
    ibv_modify_srq.3
-@@ -51,24 +37,15 @@ rdma_man_pages(
+@@ -52,24 +37,15 @@ rdma_man_pages(
    ibv_post_srq_recv.3
    ibv_query_device.3
    ibv_query_device_ex.3
@@ -162,7 +165,7 @@ index e1d5edf8..92c68611 100644
    ibv_xsrq_pingpong.1
    )
  rdma_alias_man_pages(
-@@ -79,47 +56,18 @@ rdma_alias_man_pages(
+@@ -80,47 +56,18 @@ rdma_alias_man_pages(
    ibv_alloc_mw.3 ibv_dealloc_mw.3
    ibv_alloc_pd.3 ibv_dealloc_pd.3
    ibv_alloc_td.3 ibv_dealloc_td.3
@@ -251,10 +254,10 @@ index 3df77caf..99a75101 100644
    mlx4dv.7
  )
 diff --git a/providers/mlx5/man/CMakeLists.txt b/providers/mlx5/man/CMakeLists.txt
-index 0bd9eba1..876b6fcf 100644
+index c3ad70a2..876b6fcf 100644
 --- a/providers/mlx5/man/CMakeLists.txt
 +++ b/providers/mlx5/man/CMakeLists.txt
-@@ -1,81 +1,7 @@
+@@ -1,89 +1,7 @@
  rdma_man_pages(
 -  mlx5dv_alloc_dm.3.md
 -  mlx5dv_alloc_var.3.md
@@ -280,8 +283,11 @@ index 0bd9eba1..876b6fcf 100644
    mlx5dv_get_clock_info.3
    mlx5dv_init_obj.3
 -  mlx5dv_is_supported.3.md
+-  mlx5dv_modify_qp_lag_port.3.md
 -  mlx5dv_open_device.3.md
+-  mlx5dv_pp_alloc.3.md
    mlx5dv_query_device.3
+-  mlx5dv_query_qp_lag_port.3.md
    mlx5dv_ts_to_ns.3
 -  mlx5dv_wr_post.3.md
    mlx5dv.7
@@ -314,6 +320,7 @@ index 0bd9eba1..876b6fcf 100644
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_dest_vport.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_flow_counter.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_drop.3
+- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_default_miss.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_flow_meter.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_modify_header.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_packet_reformat.3
@@ -323,6 +330,7 @@ index 0bd9eba1..876b6fcf 100644
 - mlx5dv_dr_flow.3 mlx5dv_dr_domain_create.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_domain_destroy.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_domain_sync.3
+- mlx5dv_dr_flow.3 mlx5dv_dr_domain_set_reclaim_device_memory.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_matcher_create.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_matcher_destroy.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_rule_create.3
@@ -333,9 +341,12 @@ index 0bd9eba1..876b6fcf 100644
 - mlx5dv_dump.3 mlx5dv_dump_dr_matcher.3
 - mlx5dv_dump.3 mlx5dv_dump_dr_rule.3
 - mlx5dv_dump.3 mlx5dv_dump_dr_table.3
+- mlx5dv_pp_alloc.3 mlx5dv_pp_free.3
 - mlx5dv_wr_post.3 mlx5dv_wr_set_dc_addr.3
 - mlx5dv_wr_post.3 mlx5dv_qp_ex_from_ibv_qp_ex.3
+- mlx5dv_wr_post.3 mlx5dv_wr_mr_interleaved.3
+- mlx5dv_wr_post.3 mlx5dv_wr_mr_list.3
 -)
 -- 
-2.17.1
+2.25.1
 
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_28.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_30.0.bb
similarity index 96%
rename from meta-networking/recipes-support/rdma-core/rdma-core_28.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_30.0.bb
index 15fd7ff663..18c34fb59f 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_28.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_30.0.bb
@@ -9,7 +9,7 @@ BRANCH = "stable-v${@d.getVar('PV').split('.')[0]}"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=${BRANCH} \
            file://0001-Remove-man-files-which-cant-be-built.patch \
            "
-SRCREV = "f12c953f0864691eacc9fcc4cda489b92ffd5a85"
+SRCREV = "0f4dd71d38a0f1b005635a3ff344e15791d2afa7"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.25.1



