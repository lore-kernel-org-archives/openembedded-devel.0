Return-Path: <akash.hadke27@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9356CDB482
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 12:23:51 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web10.9673.1697113421800874404
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 05:23:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FaVTBJOW;
 spf=pass (domain: gmail.com, ip: 209.85.210.171, mailfrom: akash.hadke27@gmail.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-690f8e63777so227783b3a.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 05:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697113421; x=1697718221; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SW1aQdP2bRaWDjJEQV00dZHGTbaTWpO0lNtrl+IJTfc=;
        b=FaVTBJOW0cZDAMyxXfqfcXEWREo9XHmZeJ1kUMozxn7QhAYHkQYG/4b2kPSP2arRWe
         icKN5cxOljuz1kqQPAItoBVMlsziEuFu7981Y9UA2cGMwLOrDNBilUGj74o5GTqkKf9q
         Zfkqj7uD3ZZqkaE49iu4tVfENfawx3xqaFnJHiZXvAJ3DcZuE8OZxLX9Z8YIZmhzD6qz
         YwSFkyiKZm5a1LY/kuxgo6oZEPmuduEMMjlxU4rOD/wZ/CjFbfKcP1v8cchS5moUNGmX
         cjD1vL9Wo9iX4WziFmNFNFs5bFI/MWlQE5pCzfVl84jOf5qk8Jyg559NOU+WJbaLWRvL
         z/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697113421; x=1697718221;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW1aQdP2bRaWDjJEQV00dZHGTbaTWpO0lNtrl+IJTfc=;
        b=xAD8nROUM8DekNXC0gY+NjpZvv9bUeXTqRR0Qy12taMazZFdb0QtIhaWmE6QAi2VUb
         sjuttDZAtg7BGCCG9Qr/pQTH28B/9lEuYKo8LCY5lhVlC6odtaSVmzIdMT5T8gwwmbn+
         Bwcaakf5MAyg74OtyTzpPisuHv/QU5cLcHXogldvOD4lUha/biljx50gga8BiBZ4+IEl
         PshdxShP6Ti0+HXUrur2aHQYtUqnSIHHbGnxIdRlCSQ+LNIplGFIVBU2FeV2wbfmuEaB
         VwuSCoXjJrpo0bh5vbKasAfbhsASyWbqcYa6E7umzOLcGhhcOGD41+7m5gUBOlfBoTtY
         /A5w==
X-Gm-Message-State: AOJu0Yz2CnOvXDKmcolkvQiGZ0YR0p8VpKBSFRoBnV8fDlOPi6J+gOoc
	b4uh6kQBBq9/7FnuY9V6BwJaM7cXts1aEg==
X-Google-Smtp-Source: AGHT+IEY7rCS/behGtl64TwxFfA/o1rxQVAahBI2dyYfcfqcoJIeEyxoklU7/xs+lQIvmu5co6RU4w==
X-Received: by 2002:a17:902:d4cd:b0:1bb:9e6e:a9f3 with SMTP id o13-20020a170902d4cd00b001bb9e6ea9f3mr26857375plg.4.1697113419079;
        Thu, 12 Oct 2023 05:23:39 -0700 (PDT)
Received: from L-18010.kpit.com ([203.192.207.62])
        by smtp.gmail.com with ESMTPSA id p4-20020a170902eac400b001b9da8b4eb7sm1845080pld.35.2023.10.12.05.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 05:23:38 -0700 (PDT)
From: Akash Hadke <akash.hadke27@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: ranjitsinh.rathod@kpit.com
Subject: [oe][meta-oe][master][PATCH] libeigen: Update GPL-3.0-only to GPL-2.0-only
Date: Thu, 12 Oct 2023 17:53:19 +0530
Message-Id: <20231012122319.262053-1-akash.hadke27@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 12:23:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105452

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
index 28305c985..72044427d 100644
--- a/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
+++ b/meta-oe/recipes-support/libeigen/libeigen_3.4.0.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Eigen is a C++ template library for linear algebra: matrices, vectors, numerical solvers, and related algorithms."
 HOMEPAGE = "http://eigen.tuxfamily.org/"
-LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-3.0-only & LGPL-2.1-only & MINPACK"
+LICENSE = "MPL-2.0 & Apache-2.0 & BSD-3-Clause & GPL-2.0-only & LGPL-2.1-only & MINPACK"
 LIC_FILES_CHKSUM = "file://COPYING.MPL2;md5=815ca599c9df247a0c7f619bab123dad \
                     file://COPYING.BSD;md5=2dd0510ee95e59ca28834b875bc96596 \
                     file://COPYING.GPL;md5=d32239bcb673463ab874e80d47fae504 \
-- 
2.25.1


