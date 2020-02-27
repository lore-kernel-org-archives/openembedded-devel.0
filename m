Return-Path: <wangmy@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6CBA96115E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 06:00:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.70,490,1574092800"; d="scan'208";a="84484147"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 27 Feb 2020 14:00:01 +0800
Received: from G08CNEXMBPEKD06.g08.fujitsu.local (unknown [10.167.33.206])
	by cn.fujitsu.com (Postfix) with ESMTP id 23E8B50A997A
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2020 13:50:16 +0800 (CST)
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.80) by
	G08CNEXMBPEKD06.g08.fujitsu.local (10.167.33.206) with Microsoft SMTP
	Server (TLS) id 15.0.1395.4; Thu, 27 Feb 2020 14:00:00 +0800
Received: from localhost.localdomain.localdomain (10.167.225.33) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.439.0; Thu, 27 Feb 2020 14:00:10 +0800
From: Wang Mingyu <wangmy@cn.fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Thu, 27 Feb 2020 04:43:14 -0800
Message-ID: <1582807398-13955-4-git-send-email-wangmy@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
References: <1582807398-13955-1-git-send-email-wangmy@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-yoursite-MailScanner-ID: 23E8B50A997A.A4723
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: wangmy@cn.fujitsu.com
X-Spam-Status: No
Subject: [meta-networking][PATCH] rdma-core: upgrade 27.0 -> 28.0
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2020 06:00:01 -0000
Content-Type: text/plain

0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch
removed because it is included in 28.0.

refresh 0001-Remove-man-files-which-cant-be-built.patch

Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
---
 ...Remove-man-files-which-cant-be-built.patch | 11 ++++++-
 ...sched_yield-instead-of-pthread_yield.patch | 30 -------------------
 .../{rdma-core_27.0.bb => rdma-core_28.0.bb}  |  3 +-
 3 files changed, 11 insertions(+), 33 deletions(-)
 delete mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch
 rename meta-networking/recipes-support/rdma-core/{rdma-core_27.0.bb => rdma-core_28.0.bb} (90%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
index f1437a0fb..feed0213c 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
@@ -254,9 +254,10 @@ diff --git a/providers/mlx5/man/CMakeLists.txt b/providers/mlx5/man/CMakeLists.t
 index 0bd9eba1..876b6fcf 100644
 --- a/providers/mlx5/man/CMakeLists.txt
 +++ b/providers/mlx5/man/CMakeLists.txt
-@@ -1,72 +1,7 @@
+@@ -1,81 +1,7 @@
  rdma_man_pages(
 -  mlx5dv_alloc_dm.3.md
+-  mlx5dv_alloc_var.3.md
 -  mlx5dv_create_cq.3.md
 -  mlx5dv_create_flow.3.md
 -  mlx5dv_create_flow_action_modify_header.3.md
@@ -274,6 +275,7 @@ index 0bd9eba1..876b6fcf 100644
 -  mlx5dv_devx_subscribe_devx_event.3.md
 -  mlx5dv_devx_umem_reg.3.md
 -  mlx5dv_dr_flow.3.md
+-  mlx5dv_dump.3.md
 -  mlx5dv_flow_action_esp.3.md
    mlx5dv_get_clock_info.3
    mlx5dv_init_obj.3
@@ -285,6 +287,7 @@ index 0bd9eba1..876b6fcf 100644
    mlx5dv.7
  )
 -rdma_alias_man_pages(
+- mlx5dv_alloc_var.3 mlx5dv_free_var.3
 - mlx5dv_create_mkey.3 mlx5dv_destroy_mkey.3
 - mlx5dv_devx_alloc_uar.3 mlx5dv_devx_free_uar.3
 - mlx5dv_devx_create_cmd_comp.3 mlx5dv_devx_destroy_cmd_comp.3
@@ -311,10 +314,12 @@ index 0bd9eba1..876b6fcf 100644
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_dest_vport.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_flow_counter.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_drop.3
+- mlx5dv_dr_flow.3 mlx5dv_dr_action_create_flow_meter.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_modify_header.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_packet_reformat.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_create_tag.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_action_destroy.3
+- mlx5dv_dr_flow.3 mlx5dv_dr_action_modify_flow_meter.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_domain_create.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_domain_destroy.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_domain_sync.3
@@ -324,6 +329,10 @@ index 0bd9eba1..876b6fcf 100644
 - mlx5dv_dr_flow.3 mlx5dv_dr_rule_destroy.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_table_create.3
 - mlx5dv_dr_flow.3 mlx5dv_dr_table_destroy.3
+- mlx5dv_dump.3 mlx5dv_dump_dr_domain.3
+- mlx5dv_dump.3 mlx5dv_dump_dr_matcher.3
+- mlx5dv_dump.3 mlx5dv_dump_dr_rule.3
+- mlx5dv_dump.3 mlx5dv_dump_dr_table.3
 - mlx5dv_wr_post.3 mlx5dv_wr_set_dc_addr.3
 - mlx5dv_wr_post.3 mlx5dv_qp_ex_from_ibv_qp_ex.3
 -)
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch
deleted file mode 100644
index 80abd3313..000000000
--- a/meta-networking/recipes-support/rdma-core/rdma-core/0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 6ac9562d756d42592994aeaac7a5e7b2bbce5cab Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 14 Dec 2019 14:07:57 -0800
-Subject: [PATCH] librdmacm: Use sched_yield instead of pthread_yield
-
-glibc redirects pthread_yield to sched_yield additionally we get it
-working with musl on linux
-
-Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/635]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- librdmacm/rsocket.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/librdmacm/rsocket.c b/librdmacm/rsocket.c
-index 89ae2139..7fc5b266 100644
---- a/librdmacm/rsocket.c
-+++ b/librdmacm/rsocket.c
-@@ -3038,7 +3038,7 @@ static int rs_poll_enter(void)
- 	pthread_mutex_lock(&mut);
- 	if (suspendpoll) {
- 		pthread_mutex_unlock(&mut);
--		pthread_yield();
-+		sched_yield();
- 		return -EBUSY;
- 	}
- 
--- 
-2.24.1
-
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_28.0.bb
similarity index 90%
rename from meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_28.0.bb
index 361d69b33..15fd7ff66 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_27.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_28.0.bb
@@ -8,9 +8,8 @@ RDEPENDS_${PN} = "bash perl"
 BRANCH = "stable-v${@d.getVar('PV').split('.')[0]}"
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=${BRANCH} \
            file://0001-Remove-man-files-which-cant-be-built.patch \
-           file://0001-librdmacm-Use-sched_yield-instead-of-pthread_yield.patch \
            "
-SRCREV = "84caf035ae6123e2296b72006cd2cf698c65eb46"
+SRCREV = "f12c953f0864691eacc9fcc4cda489b92ffd5a85"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.17.1




