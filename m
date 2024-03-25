Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B76C54E64
	for <webhook@archiver.kernel.org>; Mon, 25 Mar 2024 19:48:31 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.1512.1711396110011852355
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 25 Mar 2024 12:48:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HHKdV5RQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.180, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6e6afb754fcso4195102b3a.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 12:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711396109; x=1712000909; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zWYqwi+BP2Jqm7TBLloOaBPOKVkc72r8zI379SPgIPg=;
        b=HHKdV5RQuU3mO5QjbejrqWHn9slrZzLK3HZ/M90pOVrhdGIdnjYNCO5VqjaMXDYBpn
         UttmiyUE/C7TbW5fuf+ErJld6TTfzUGe4/q3k/0qnt4O5vXBltRNMz04vuI19xQDTKXB
         aNEArR59btYgyMsr4sJ7fDtXRGzrxMp2YNolYZygNETbn+W9UEDNkgiUgdIWc570hMx5
         dm6tp3i1wtwBiGeLg3Gv/NsqpfPHUna4VynPg7QdS/5QH2R+IyKYrlRpxRA32kGBd+bf
         1U5CBYgNJlvG5dy2DJStkBsMqSc+ZyUfD9WhRTBk01Da7FEjwen7JrmmJs8BEZk7IAyo
         F4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711396109; x=1712000909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zWYqwi+BP2Jqm7TBLloOaBPOKVkc72r8zI379SPgIPg=;
        b=OU4Xe9oHoX9LhUFE6+sPcuFjSz2LnFGNXqUEU5NKuS1qBygRSHy+jcnXmApBYW+pIs
         tbEA4q5ZuBd+MjotIy+rBRtKSxoSwZk9BLwO/ooDRdKFoaB8w5M5LdIR7udxPbfrMaox
         N30PqQWbv5f62BWj/yk4e/75c3OWj6rNVvI3YB0qe32f9SerbqhPcVbe/xFlm19CB+U2
         0HoMTTKWiZ0/Sz6UOU2XnFFL77CLXZUgH4ugMMyLZwFRnOxuCozHwctCJCadEPnTqaUr
         EWH04UFlrh84Kn+332fBF4pLjD+vhfJnZrMAOyR+KlWPukCxcI7gPkoCnYrQrUofKcNU
         WJHA==
X-Gm-Message-State: AOJu0YzWc22l9cPYg5oElIeu7nUcH6t0yQTBP/nAvgX2q5oYJFdCAgxc
	TAL6dcCDoK5E4CNcKzi9GzGPhXTYopd0r4hLEfyZ4AVJlJS2BKShFpL+Elou
X-Google-Smtp-Source: AGHT+IFoxT49oRwv6mKfnfDdZgQFdg1vl1vWeEUVShaJdj76THjhK6V+40PAtrCYTqyOqyZGlVBgEw==
X-Received: by 2002:a05:6a00:194a:b0:6ea:b69a:7c70 with SMTP id s10-20020a056a00194a00b006eab69a7c70mr1372386pfk.34.1711396108926;
        Mon, 25 Mar 2024 12:48:28 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id r14-20020a6560ce000000b005ce472f2d0fsm5122282pgv.66.2024.03.25.12.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 12:48:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 2/4] rdma-core: Fix build with musl >= 1.2.5
Date: Mon, 25 Mar 2024 12:48:23 -0700
Message-ID: <20240325194825.641241-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325194825.641241-1-raj.khem@gmail.com>
References: <20240325194825.641241-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 25 Mar 2024 19:48:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109601

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-include-libgen.h-for-basename.patch  | 58 +++++++++++++++++++
 .../rdma-core/rdma-core_50.0.bb               |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-support/rdma-core/rdma-core/0001-include-libgen.h-for-basename.patch

diff --git a/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-libgen.h-for-basename.patch b/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-libgen.h-for-basename.patch
new file mode 100644
index 0000000000..a093e47048
--- /dev/null
+++ b/meta-networking/recipes-support/rdma-core/rdma-core/0001-include-libgen.h-for-basename.patch
@@ -0,0 +1,58 @@
+From ae6adc4c748e67919fdf8ae1d44c619ee104c271 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 25 Mar 2024 11:37:41 -0700
+Subject: [PATCH] include libgen.h for basename
+
+basename prototype has been removed from string.h from latest musl [1]
+compilers e.g. clang-18 flags the absense of prototype as error. therefore
+include libgen.h for providing it.
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7
+
+Upstream-Status: Submitted [https://github.com/linux-rdma/rdma-core/pull/1443]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ kernel-boot/rdma_rename.c  | 1 +
+ librdmacm/examples/rping.c | 1 +
+ providers/mlx5/mlx5_vfio.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/kernel-boot/rdma_rename.c b/kernel-boot/rdma_rename.c
+index 4af9e4a39..5193ac411 100644
+--- a/kernel-boot/rdma_rename.c
++++ b/kernel-boot/rdma_rename.c
+@@ -2,6 +2,7 @@
+ /* Copyright (c) 2019, Mellanox Technologies. All rights reserved. See COPYING file */
+ 
+ #define _GNU_SOURCE
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/librdmacm/examples/rping.c b/librdmacm/examples/rping.c
+index cc16ad910..0f1321458 100644
+--- a/librdmacm/examples/rping.c
++++ b/librdmacm/examples/rping.c
+@@ -33,6 +33,7 @@
+ #define _GNU_SOURCE
+ #include <endian.h>
+ #include <getopt.h>
++#include <libgen.h>
+ #include <stdlib.h>
+ #include <string.h>
+ #include <stdio.h>
+diff --git a/providers/mlx5/mlx5_vfio.c b/providers/mlx5/mlx5_vfio.c
+index cd0c41462..4d064b1fc 100644
+--- a/providers/mlx5/mlx5_vfio.c
++++ b/providers/mlx5/mlx5_vfio.c
+@@ -6,6 +6,7 @@
+ #define _GNU_SOURCE
+ #include <config.h>
+ 
++#include <libgen.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <unistd.h>
+-- 
+2.44.0
+
diff --git a/meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb b/meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb
index d0f4fd47a5..ab4de22a51 100644
--- a/meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb
+++ b/meta-networking/recipes-support/rdma-core/rdma-core_50.0.bb
@@ -6,7 +6,9 @@ DEPENDS = "libnl"
 RDEPENDS:${PN} = "bash perl"
 
 SRC_URI = "git://github.com/linux-rdma/rdma-core.git;branch=master;protocol=https \
-           file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch"
+           file://0001-cmake-Allow-SYSTEMCTL_BIN-to-be-overridden-from-envi.patch \
+           file://0001-include-libgen.h-for-basename.patch \
+"
 SRCREV = "bc6b4bc134532e952fe7f8efc251e1f89b912098"
 S = "${WORKDIR}/git"
 
-- 
2.44.0


