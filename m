Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f50.google.com (mail-pl0-f50.google.com
	[209.85.160.50])
	by mail.openembedded.org (Postfix) with ESMTP id 63B5B7450D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2018 06:35:11 +0000 (UTC)
Received: by mail-pl0-f50.google.com with SMTP id t12-v6so928314plo.7
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Jun 2018 23:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=gIMpWAm86KWak6ASfbdJ0zHSQ/qpzs0bZ8RdoFJjkds=;
	b=P3Wz6EWw4VA1MUc5uGWj+748e/0jTrzn28JtipgjCo3P9nuXDvRrnzb+3owjYK5RMm
	ZwZNr04UabnILSllqktyT9rT0SpTLEDU0R2I48vRCOQn7Y8sfcnvFUcThiyGvJCoDZKY
	PVdi0bszlDmOBpKHrssPD79OtTkqCQuc/NIhTXPrJZ59IY5hxCStcIJgbUW3PbOeOr0v
	GpwuibHGqcsZ0b0wXghB80rIgOK5DHxwFs7kCOdrMZODydTmK5v3mmKeexH9h1wvPIYo
	oZsMq3/ANLYhGDR5/ZAuG820GnoTFchjHJ5HHeayLwngbs+gUPslxpQFUrNJFIn61KOU
	6eEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=gIMpWAm86KWak6ASfbdJ0zHSQ/qpzs0bZ8RdoFJjkds=;
	b=FSGNQpYcGa/UKxfEHLesyKJZbbHsuRhkVSgpx3I7ztmTbKP2SuA4o0d11+gyI7h9+w
	X9riufBEY4YWNOyKldg7K1RBy1CDI+gZYE/MtJKnAckDmWgGckDjG6ISSPuJ8rT0xj6r
	yBSqR10C/RhG88INYO5CcsMJMzuWfGQ1GBl3X3j1oG92slQ33XKjSs4/D4uNm1ki1OIy
	rd+lL61ImdllRBaAGI939MsPodgYXkpYNBKtYB4vfCo6hgpPMehwT4I7QcINnNFafVaZ
	deJjQpWS14Ar4acUz34Y8DpED3o1I/dcTvePegJtOjkh+zdP5F5jr0kI9zy2IVJ14dJP
	GsEA==
X-Gm-Message-State: APt69E1wVEiy9EFF0QANumpv44vXR1lB1+hN/FzIt3KTKRd9hq3KbviL
	8+R0mDT+pOO6M5m+qLe3ARDKsA==
X-Google-Smtp-Source: ADUXVKK+jEQEnSk6OhNyKK44pGo9c9uWFhLM9ZuMHFASTZLx6teRl1Q5VhW8wTwKvRQ1kZGYQBXRdw==
X-Received: by 2002:a17:902:46e:: with SMTP id
	101-v6mr1957994ple.39.1528871711903; 
	Tue, 12 Jun 2018 23:35:11 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	b83-v6sm3525707pfe.159.2018.06.12.23.35.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jun 2018 23:35:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 12 Jun 2018 23:35:08 -0700
Message-Id: <20180613063512.1755-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [meta-networking][PATCH V2 1/5] rdma-core: Update to version 18
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
X-List-Received-Date: Wed, 13 Jun 2018 06:35:11 -0000

Fix build with musl

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...Remove-man-files-which-cant-be-built.patch | 103 ++++++++++++++++++
 ...IFSOCK-is-defined-in-both-glibc-musl.patch |  29 +++++
 ...ude-endian.h-for-htole32-and-friends.patch |  25 +++++
 ...Remove-unused-include-for-execinfo.h.patch |  27 +++++
 ...igh.c-Do-not-include-net-if_packet.h.patch |  26 +++++
 .../{rdma-core_17.bb => rdma-core_18.1.bb}    |  10 +-
 6 files changed, 218 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian.h-for-htole32-and-friends.patch
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-include-for-execinfo.h.patch
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch
 rename meta-networking/recipes-support/rdma-core/{rdma-core_17.bb => rdma-core_18.1.bb} (57%)

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
new file mode 100644
index 0000000000..4b595613fa
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-Remove-man-files-which-cant-be-built.patch
@@ -0,0 +1,103 @@
+From 5a8a2f81ef8650f06d1d9d268add612ab46025f1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Jun 2018 22:57:04 -0700
+Subject: [PATCH] Remove man files which cant be built
+
+Remove need for pandoc-prebuilt during cross build
+
+Fixes errors
+
+| CMake Error at libibumad/man/cmake_install.cmake:105 (file):
+|   file INSTALL cannot find
+|   "/mnt/a/oe/build/tmp/work/core2-64-bec-linux-musl/rdma-core/18.1-r0/git/buildlib/pandoc-prebuilt/41bbb0bed7a781be59e8c0dcd8b7278af2ce6882".
+| Call Stack (most recent call first):
+|   cmake_install.cmake:48 (include)
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libibumad/man/CMakeLists.txt      |  1 -
+ libibverbs/man/CMakeLists.txt     | 15 ---------------
+ providers/mlx5/man/CMakeLists.txt |  1 -
+ 3 files changed, 17 deletions(-)
+
+diff --git a/libibumad/man/CMakeLists.txt b/libibumad/man/CMakeLists.txt
+index 185584a0..ac45a4e9 100644
+--- a/libibumad/man/CMakeLists.txt
++++ b/libibumad/man/CMakeLists.txt
+@@ -15,7 +15,6 @@ rdma_man_pages(
+   umad_get_mad_addr.3
+   umad_get_pkey.3
+   umad_get_port.3
+-  umad_init.3.md
+   umad_open_port.3
+   umad_poll.3
+   umad_recv.3
+diff --git a/libibverbs/man/CMakeLists.txt b/libibverbs/man/CMakeLists.txt
+index 86dd49de..b54675be 100644
+--- a/libibverbs/man/CMakeLists.txt
++++ b/libibverbs/man/CMakeLists.txt
+@@ -5,7 +5,6 @@ rdma_man_pages(
+   ibv_alloc_pd.3
+   ibv_alloc_td.3
+   ibv_asyncwatch.1
+-  ibv_attach_mcast.3.md
+   ibv_bind_mw.3
+   ibv_create_ah.3
+   ibv_create_ah_from_wc.3
+@@ -14,7 +13,6 @@ rdma_man_pages(
+   ibv_create_cq_ex.3
+   ibv_modify_cq.3
+   ibv_create_flow.3
+-  ibv_create_flow_action.3.md
+   ibv_create_qp.3
+   ibv_create_qp_ex.3
+   ibv_create_rwq_ind_table.3
+@@ -23,15 +21,9 @@ rdma_man_pages(
+   ibv_create_wq.3
+   ibv_devices.1
+   ibv_devinfo.1
+-  ibv_event_type_str.3.md
+-  ibv_fork_init.3.md
+   ibv_get_async_event.3
+   ibv_get_cq_event.3
+-  ibv_get_device_guid.3.md
+   ibv_get_device_list.3
+-  ibv_get_device_name.3.md
+-  ibv_get_srq_num.3.md
+-  ibv_inc_rkey.3.md
+   ibv_modify_qp.3
+   ibv_modify_qp_rate_limit.3
+   ibv_modify_srq.3
+@@ -46,19 +38,12 @@ rdma_man_pages(
+   ibv_post_srq_recv.3
+   ibv_query_device.3
+   ibv_query_device_ex.3
+-  ibv_query_gid.3.md
+-  ibv_query_pkey.3.md
+   ibv_query_port.3
+   ibv_query_qp.3
+   ibv_query_rt_values_ex.3
+   ibv_query_srq.3
+-  ibv_rate_to_mbps.3.md
+-  ibv_rate_to_mult.3.md
+   ibv_rc_pingpong.1
+   ibv_reg_mr.3
+-  ibv_req_notify_cq.3.md
+-  ibv_rereg_mr.3.md
+-  ibv_resize_cq.3.md
+   ibv_srq_pingpong.1
+   ibv_uc_pingpong.1
+   ibv_ud_pingpong.1
+diff --git a/providers/mlx5/man/CMakeLists.txt b/providers/mlx5/man/CMakeLists.txt
+index cdc7115e..876b6fcf 100644
+--- a/providers/mlx5/man/CMakeLists.txt
++++ b/providers/mlx5/man/CMakeLists.txt
+@@ -1,5 +1,4 @@
+ rdma_man_pages(
+-  mlx5dv_flow_action_esp.3.md
+   mlx5dv_get_clock_info.3
+   mlx5dv_init_obj.3
+   mlx5dv_query_device.3
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch
new file mode 100644
index 0000000000..b04c9b7230
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch
@@ -0,0 +1,29 @@
+From f2df1db11f3a9580774300e703b6f53dbcdb28ef Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jun 2018 20:17:57 -0700
+Subject: [PATCH] S_IFSOCK is defined in both glibc/musl
+
+Fixes
+
+preload.c:1183:46: error: '__S_IFSOCK' undeclared (first use in this function); did you mean 'S_IFSOCK'?
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ librdmacm/preload.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/librdmacm/preload.c b/librdmacm/preload.c
+index 0f2aa250..d46beb1b 100644
+--- a/librdmacm/preload.c
++++ b/librdmacm/preload.c
+@@ -1180,7 +1180,7 @@ int __fxstat(int ver, int socket, struct stat *buf)
+ 	if (fd_get(socket, &fd) == fd_rsocket) {
+ 		ret = real.fxstat(ver, socket, buf);
+ 		if (!ret)
+-			buf->st_mode = (buf->st_mode & ~S_IFMT) | __S_IFSOCK;
++			buf->st_mode = (buf->st_mode & ~S_IFMT) | S_IFSOCK;
+ 	} else {
+ 		ret = real.fxstat(ver, fd, buf);
+ 	}
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian.h-for-htole32-and-friends.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian.h-for-htole32-and-friends.patch
new file mode 100644
index 0000000000..aa335244b6
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-endian.h-for-htole32-and-friends.patch
@@ -0,0 +1,25 @@
+From 65b9a47c07be4611b4fbbcafff1993186bcb0537 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Jun 2018 19:15:52 -0700
+Subject: [PATCH 1/2] include endian.h for htole32 and friends
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ providers/hns/hns_roce_u.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/providers/hns/hns_roce_u.h b/providers/hns/hns_roce_u.h
+index bd66c6e7..b07424db 100644
+--- a/providers/hns/hns_roce_u.h
++++ b/providers/hns/hns_roce_u.h
+@@ -34,6 +34,7 @@
+ #define _HNS_ROCE_U_H
+ 
+ #include <stddef.h>
++#include <endian.h>
+ #include <util/compiler.h>
+ 
+ #include <infiniband/driver.h>
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-include-for-execinfo.h.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-include-for-execinfo.h.patch
new file mode 100644
index 0000000000..347f964e94
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0002-Remove-unused-include-for-execinfo.h.patch
@@ -0,0 +1,27 @@
+From 3d9cae15c69c0b3260a024ad5d6802a8d85515a2 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 12 Jun 2018 19:18:24 -0700
+Subject: [PATCH 2/2] Remove unused include for execinfo.h
+
+Fixes build on musl
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ providers/qedr/qelr_verbs.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/providers/qedr/qelr_verbs.c b/providers/qedr/qelr_verbs.c
+index e3b01f28..2ee1c832 100644
+--- a/providers/qedr/qelr_verbs.c
++++ b/providers/qedr/qelr_verbs.c
+@@ -54,7 +54,6 @@
+ 
+ #include <stdio.h>
+ #include <stdlib.h>
+-#include <execinfo.h>
+ 
+ #define QELR_SQE_ELEMENT_SIZE	(sizeof(struct rdma_sq_sge))
+ #define QELR_RQE_ELEMENT_SIZE	(sizeof(struct rdma_rq_sge))
+-- 
+2.17.1
+
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch
new file mode 100644
index 0000000000..e887f222b0
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0002-neigh.c-Do-not-include-net-if_packet.h.patch
@@ -0,0 +1,26 @@
+From 82486f7e1ee2aa07a5c12cb357834993aa8c1d20 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 8 Jun 2018 20:19:13 -0700
+Subject: [PATCH] neigh.c: Do not include net/if_packet.h
+
+This header is glibc specific
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ libibverbs/neigh.c | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/libibverbs/neigh.c b/libibverbs/neigh.c
+index 21177db0..cfc593a0 100644
+--- a/libibverbs/neigh.c
++++ b/libibverbs/neigh.c
+@@ -2,7 +2,6 @@
+  */
+ 
+ #include "config.h"
+-#include <net/if_packet.h>
+ #include <linux/netlink.h>
+ #include <linux/rtnetlink.h>
+ #include <endian.h>
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_17.bb b/meta-networking/recipes-support/rdma-core/rdma-core_18.1.bb
similarity index 57%
rename from meta-networking/recipes-support/rdma-core/rdma-core_17.bb
rename to meta-networking/recipes-support/rdma-core/rdma-core_18.1.bb
index 5d0329919f..6ad864d1e8 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_17.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_18.1.bb
@@ -5,8 +5,14 @@ SECTION = "libs"
 DEPENDS = "libnl"
 RDEPENDS_${PN} = "bash perl"
 
-SRC_URI = "git://github.com/linux-rdma/rdma-core.git;protocol=http"
-SRCREV ="5ce12bd51ebb0a4db35dea382b1ebdc701bab224"
+SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=stable-v18 \
+           file://0001-S_IFSOCK-is-defined-in-both-glibc-musl.patch \
+           file://0002-neigh.c-Do-not-include-net-if_packet.h.patch \
+           file://0001-include-endian.h-for-htole32-and-friends.patch \
+           file://0002-Remove-unused-include-for-execinfo.h.patch \
+           file://0001-Remove-man-files-which-cant-be-built.patch \
+           "
+SRCREV = "7844b3fbe5120623d63b29ecb43eb83a61129658"
 S = "${WORKDIR}/git"
 
 #Default Dual License https://github.com/linux-rdma/rdma-core/blob/master/COPYING.md
-- 
2.17.1


