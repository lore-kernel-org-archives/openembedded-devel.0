Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16B8CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:22:31 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.9650.1697113343397357251
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 05:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=leNEbNsO;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-690f8e63777so227328b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697113342; x=1697718142; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cAovjQ7QbNCcILv7RYB6e+x+qDbvPQE/f5HE/i77LYA=;
        b=leNEbNsOcsBwsTZFfqYVZ1bf9fNNUplN3lx5R/WVNv+nDYnmyeli721zFED6L3wwjp
         tdDGx3Bsq6N4JMX7TPV5QrjZfIMDFubclQmOlkL4JzaYVh8bqaLiVjUK6ai06vShApW8
         UeeltDn6dZfv3qZimXvUSGvXW9+z375muAIvywX6jNNqA95BqXrxwtuK9NGOyurVZTng
         qDE7OKy44N8CHZWNJhv30fGfsl8wYmjQqkb8mB9oZ1ac2Ppdq2oeIjZHVwFN8c5reRQY
         TuNKwOTDYh7IlPoxrxc1Mix3FEo/IwpDgAewBQ2upDfgD9Gttd9gtu8nxAGM5ApqxrD+
         f1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697113343; x=1697718143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cAovjQ7QbNCcILv7RYB6e+x+qDbvPQE/f5HE/i77LYA=;
        b=hI4fpKI/bRvaOE3MVfGH5M0/OEuI0SIoP7bpIulhOgWetiERax3sC3G5AbWEm9HsE2
         Wr9S4Uq4nQftEtt/nfS9zjjwox2l62TlEmcjB1UYTHPcd0Ajo4gGzOjwvowHu4LT8nvr
         u+hH98DRlergaXRywlHtRZzj6KoPMRcdWBfd36qj3Nm4bGdsbvis5iRsKGAzGhonpucO
         0NYXKywSuO3eiCo8/8DwoA4l9CM6mYkfQBriIG72C7TwXh8h6F6NK3PgNcUp+sThqXA3
         ow5WVMtqmikHp3i2eSZBfbflHPWLQg4hohS6o922qPlPOPCvxvg8SnyGFkfkBRGzkCII
         uVfg==
X-Gm-Message-State: AOJu0YzUwCYSQzK7yj2lDYe1Wot/C6ukd0CHNCl2panGl0r7yBggZYKp
	UIiL9sIHHBhU6Yb4zrX0UsLpPeyVkzpuBQ==
X-Google-Smtp-Source: AGHT+IHQ4Nng2sJvunGJuAZ9+wS83wDodIElyIw+xi2gVn7dPQjEqMc6Gykg4W4wn6zy/qt+oPhYMg==
X-Received: by 2002:a17:902:d352:b0:1c9:e121:ccc1 with SMTP id l18-20020a170902d35200b001c9e121ccc1mr1331591plk.5.1697113342509;
        Thu, 12 Oct 2023 05:22:22 -0700 (PDT)
Received: from L-18010.kpit.com ([203.192.207.62])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902e90600b001c9d2360b2asm1850146pld.22.2023.10.12.05.22.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 05:22:22 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [oe][meta-oe][kirkstone][PATCH] libeigen: Update GPL-3.0-only to GPL-2.0-only
Date: Thu, 12 Oct 2023 17:51:55 +0530
Message-Id: <20231012122155.261884-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 12:22:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105451

libeigen source contains GPL-3.0-only code but it is
not being packaged hence update LICENSE with GPL-2.0-only

Below are the GPL-3.0-only files from libeigen source

bench/btl/actions/action_aat_product.hh
bench/btl/actions/action_ata_product.hh
bench/btl/actions/action_atv_product.hh
bench/btl/actions/action_axpby.hh
bench/btl/actions/action_axpy.hh
bench/btl/actions/action_cholesky.hh
bench/btl/actions/action_ger.hh
bench/btl/actions/action_hessenberg.hh
bench/btl/actions/action_lu_decomp.hh
bench/btl/actions/action_lu_solve.hh
bench/btl/actions/action_matrix_matrix_product_bis.hh
bench/btl/actions/action_matrix_matrix_product.hh
bench/btl/actions/action_matrix_vector_product.hh
bench/btl/actions/action_partial_lu.hh
bench/btl/actions/action_rot.hh
bench/btl/actions/action_symv.hh
bench/btl/actions/action_syr2.hh
bench/btl/actions/action_trisolve.hh
bench/btl/actions/action_trisolve_matrix.hh
bench/btl/actions/action_trmm.hh
bench/btl/COPYING
bench/btl/data/mean.cxx
bench/btl/data/regularize.cxx
bench/btl/data/smooth.cxx
bench/btl/generic_bench/bench.hh
bench/btl/generic_bench/bench_parameter.hh
bench/btl/generic_bench/btl.hh
bench/btl/generic_bench/init/init_function.hh
bench/btl/generic_bench/init/init_matrix.hh
bench/btl/generic_bench/init/init_vector.hh
bench/btl/generic_bench/static/bench_static.hh
bench/btl/generic_bench/static/intel_bench_fixed_size.hh
bench/btl/generic_bench/static/static_size_generator.hh
bench/btl/generic_bench/timers/mixed_perf_analyzer.hh
bench/btl/generic_bench/timers/portable_perf_analyzer.hh
bench/btl/generic_bench/timers/portable_perf_analyzer_old.hh
bench/btl/generic_bench/timers/portable_timer.hh
bench/btl/generic_bench/timers/STL_perf_analyzer.hh
bench/btl/generic_bench/timers/STL_timer.hh
bench/btl/generic_bench/utils/size_lin_log.hh
bench/btl/generic_bench/utils/size_log.hh
bench/btl/generic_bench/utils/xy_file.hh
bench/btl/libs/BLAS/blas_interface.hh
bench/btl/libs/BLAS/main.cpp
bench/btl/libs/blaze/blaze_interface.hh
bench/btl/libs/blaze/main.cpp
bench/btl/libs/blitz/blitz_interface.hh
bench/btl/libs/blitz/blitz_LU_solve_interface.hh
bench/btl/libs/blitz/btl_blitz.cpp
bench/btl/libs/blitz/btl_tiny_blitz.cpp
bench/btl/libs/blitz/tiny_blitz_interface.hh
bench/btl/libs/eigen2/btl_tiny_eigen2.cpp
bench/btl/libs/eigen2/eigen2_interface.hh
bench/btl/libs/eigen2/main_adv.cpp
bench/btl/libs/eigen2/main_linear.cpp
bench/btl/libs/eigen2/main_matmat.cpp
bench/btl/libs/eigen2/main_vecmat.cpp
bench/btl/libs/eigen3/btl_tiny_eigen3.cpp
bench/btl/libs/eigen3/eigen3_interface.hh
bench/btl/libs/eigen3/main_adv.cpp
bench/btl/libs/eigen3/main_linear.cpp
bench/btl/libs/eigen3/main_matmat.cpp
bench/btl/libs/eigen3/main_vecmat.cpp
bench/btl/libs/gmm/gmm_interface.hh
bench/btl/libs/gmm/gmm_LU_solve_interface.hh
bench/btl/libs/gmm/main.cpp
bench/btl/libs/mtl4/main.cpp
bench/btl/libs/mtl4/mtl4_interface.hh
bench/btl/libs/mtl4/mtl4_LU_solve_interface.hh
bench/btl/libs/STL/main.cpp
bench/btl/libs/STL/STL_interface.hh
bench/btl/libs/tvmet/main.cpp
bench/btl/libs/tvmet/tvmet_interface.hh
bench/btl/libs/ublas/main.cpp
bench/btl/libs/ublas/ublas_interface.hh

libeigen project dropped all GPL code in their 'master'
branch and moved to 'Apache-2.0'

Signed-off-by: Akash Hadke <akash.hadke27@gmail.com>
---
 meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
index 1cae76b42..144d79dd1 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
 AUTHOR = "Benoît Jacob and Gaël Guennebaud and others"
 HOMEPAGE = "http://eigen.tuxfamily.org/"
-LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-3.0-only & LGPL-2.1-only & MINPACK"
+LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-2.0-only & LGPL-2.1-only & MINPACK"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
                     file://COPYING.BSD;md5=2dd0510ee95e59ca28834b875bc96596 \
                     file://COPYING.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-- 
2.25.1


