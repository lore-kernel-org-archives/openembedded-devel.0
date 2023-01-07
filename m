Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111D0C64981
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 03:07:12 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web10.13025.1673060826712566110
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 19:07:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CAuaqZoI;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id e10so2378644pgc.9
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 19:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lAYmldtmrDpd4Bhk/MMPocFyTh8wSkROwWl+5NzavZA=;
        b=CAuaqZoIk/WiNFvbvUGRyqwU07DSqWAehQX5jtqVo63bHjG2QwB8LpxASBgx1MI5jK
         7yMuDwKTgb2ByBKmVCwKT/GHX2ZzkrzwkmqSqC6r/VImoPXy5Qxy7aV6QU9RBTIgKR07
         zge/KkT69dowimMZ0eiVagw1D+NCMOabE2yj6sC6KVpYXY8HyJnfQXgAFF8U8x0Kw7Pv
         bqC1qB7ae105uddbqHnO1iOzQJUTkfZeGCFfxrnJC+Dy4WZAFuZ7l5u5dz3erX0PydCT
         Mm/O7U9sRlsIBCOUC3zwfAMT3F2VZsaboMekoDFfCGk3rNpCWBfOaLhiw0RBuGfInghs
         1C5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lAYmldtmrDpd4Bhk/MMPocFyTh8wSkROwWl+5NzavZA=;
        b=HV5dOf3BEaxqVH+t8g7BjUliZXurBZ0h5BJrXD3w7189Ze7eY9AAf8FWwnFGlqZohh
         R2klkrbDu8lRb/VQM4G+WSnRsX8m6vZeJTJ0fP3VmLaIB2lisA1ahd5gE684HoFBNY7j
         ltrSVF3M01P4PERKOTmCG0ZCO9RN9dnw4vw63kL/wZOI3Iyum9uim/Wl1/cAxxziRXtm
         C1LGwz+zPMdC86DF2szSWfugxe6pspfmXseTX0SkQC/GXJ9z3jWWxqqhlj7leLpKgHyN
         0zOhV1Ye7bl3F2euSmeeHngYeVWUx62tqtgKjtu94dMXJXPg9GmUoUhdMXmRf9p/T2r0
         M3DA==
X-Gm-Message-State: AFqh2kq9xa4gBvBOJGslFLHYusFwLprotoY3LNduJetgOqXYDAKDSiZh
	PCGtZ9ihdUdxxnOXwi/EpL7KsjUV1qIQfw==
X-Google-Smtp-Source: AMrXdXs6FJYpGRzfiD8kTi0T440xnlMf1GAqx5KLrRAwv+RWNmW+u/Bu5FBAOvz7owXOvhWIheZvsw==
X-Received: by 2002:a05:6a00:414c:b0:581:7c46:debd with SMTP id bv12-20020a056a00414c00b005817c46debdmr38100902pfb.24.1673060825732;
        Fri, 06 Jan 2023 19:07:05 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id q1-20020aa79821000000b005821db4ff2csm1786180pfl.69.2023.01.06.19.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 19:07:05 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Bergin <peter@berginkonsult.se>,
	Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 4/4] sysbench: Upgrade 0.4.12 -> 1.0.20
Date: Fri,  6 Jan 2023 19:07:00 -0800
Message-Id: <20230107030700.1371576-4-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230107030700.1371576-1-raj.khem@gmail.com>
References: <20230107030700.1371576-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 03:07:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100432

From: Peter Bergin <peter@berginkonsult.se>

Use system cuncurrencykit and enable riscv

Signed-off-by: Peter Bergin <peter@berginkonsult.se>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...modifier-to-tmp-variable-in-memory-t.patch | 40 -------------------
 ...{sysbench_0.4.12.bb => sysbench_1.0.20.bb} | 18 +++++----
 2 files changed, 10 insertions(+), 48 deletions(-)
 delete mode 100644 meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
 rename meta-oe/recipes-benchmark/sysbench/{sysbench_0.4.12.bb => sysbench_1.0.20.bb} (57%)

diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch b/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
deleted file mode 100644
index d628e81b56..0000000000
--- a/meta-oe/recipes-benchmark/sysbench/sysbench/0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c1ebf893e32a0a77e820484d48a903523fef7c1b Mon Sep 17 00:00:00 2001
-From: Vasily Tarasov <tarasov@vasily.name>
-Date: Fri, 10 Jun 2016 14:33:48 -0400
-Subject: [PATCH] Adding volatile modifier to tmp variable in memory test
-
-Issue explanation:
-
-./sysbench/sysbench --test=memory --num-threads=16 \
-		    --memory-block-size=268435456 \
-		    --memory-total-size=137438953472 \
-		    --memory-oper=read \
-		    --memory-access-mode=seq \
-		    --memory-scope=local run
-
-Without this commit the time to run the above command is 0.0004 seconds.
-With this commit the time is greater than 3 seconds.  Essentially,
-without the volatile modifier, the compiler optimizes read access so
-that no real access happens.
-
-Upstream-Status: Backport [part of v1.0.0 https://github.com/akopytov/sysbench/commit/8753cb93be4c0b81a20b704ced91e7a422da52b1]
-
-(cherry picked from commit 8753cb93be4c0b81a20b704ced91e7a422da52b1)
-Signed-off-by: massimo toscanelli <massimo.toscanelli@leica-geosystems.com>
----
- sysbench/tests/memory/sb_memory.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/sysbench/tests/memory/sb_memory.c b/sysbench/tests/memory/sb_memory.c
-index 2e8998f..7d22bb9 100644
---- a/sysbench/tests/memory/sb_memory.c
-+++ b/sysbench/tests/memory/sb_memory.c
-@@ -244,7 +244,7 @@ sb_request_t memory_get_request(int tid)
- int memory_execute_request(sb_request_t *sb_req, int thread_id)
- {
-   sb_mem_request_t    *mem_req = &sb_req->u.mem_request;
--  int                 tmp = 0;
-+  volatile int        tmp = 0;
-   int                 idx; 
-   int                 *buf, *end;
-   log_msg_t           msg;
diff --git a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
similarity index 57%
rename from meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
rename to meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
index 4ac78fb8fd..098954af37 100644
--- a/meta-oe/recipes-benchmark/sysbench/sysbench_0.4.12.bb
+++ b/meta-oe/recipes-benchmark/sysbench/sysbench_1.0.20.bb
@@ -2,20 +2,22 @@ SUMMARY = "System performance benchmark"
 HOMEPAGE = "http://github.com/akopytov/sysbench"
 SECTION = "console/tests"
 LICENSE = "GPL-2.0-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-inherit autotools
+DEPENDS = "libtool libaio luajit concurrencykit"
+
+inherit autotools-brokensep pkgconfig
 
 # The project has moved from Sourceforge to Launchpad, to Github. Use the source tarball from
 # Launchpad until the next release is available from Github.
-SRC_URI = "https://launchpad.net/ubuntu/+archive/primary/+files/${BPN}_${PV}.orig.tar.gz \
-           file://0001-Adding-volatile-modifier-to-tmp-variable-in-memory-t.patch \
-           "
+SRC_URI = "git://github.com/akopytov/sysbench.git;protocol=https;branch=master"
+SRCREV = "ebf1c90da05dea94648165e4f149abc20c979557"
+
+S = "${WORKDIR}/git"
 
-SRC_URI[md5sum] = "3a6d54fdd3fe002328e4458206392b9d"
-SRC_URI[sha256sum] = "83fa7464193e012c91254e595a89894d8e35b4a38324b52a5974777e3823ea9e"
+COMPATIBLE_HOST = "(arm|aarch64|i.86|x86_64|powerpc|powerpc64|riscv32|riscv64).*-linux*"
 
-EXTRA_OECONF += "--enable-largefile"
+EXTRA_OECONF += "--enable-largefile --with-system-luajit --with-system-ck --without-gcc-arch"
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[aio] = "--enable-aio,--disable-aio,libaio,"
 PACKAGECONFIG[mysql] = "--with-mysql \
-- 
2.39.0


