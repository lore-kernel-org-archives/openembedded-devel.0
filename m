Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E3C6C433EF
	for <webhook@archiver.kernel.org>; Tue, 19 Apr 2022 17:48:47 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.737.1650381739510796587
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:22:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=S4XotZtl;
 spf=pass (domain: gmail.com, ip: 209.85.215.176,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id u2so24323150pgq.10
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 19 Apr 2022 08:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sY31ViiQS0AssANs7dODQoxhEOZawdQeaDsBpsht57E=;
        b=S4XotZtl064lnkzxO6Ggk/IAbY+0NMvuTBasAzjEG7b5eoomqOIO82uGJnktsmveQQ
         FKo+rDPYN+dePNbOD5dgs3WV/5IlnkqjYyKZSRoMs7yaaJwcWkfbBUY8ECFNpTnjrxYW
         Q5b3v/5HH5ORx9G+/AXRbQQsXYb1TtQmDIMAL6l/GawagoxixwfNabArPqw/aRxH5NdT
         TqPFvnwoHmk4BusCNlVdP4LiHE4ySbMVZDGMTpeyyXUvdeiK6LoZpNrB8QH+CpcurFu0
         MS2pKU2r1C97EwoL3ds3oreJH3OPLDgrjuUxh+OPKPLDcPp2hFZa8CEj3M93/GHFGMfv
         NgNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=sY31ViiQS0AssANs7dODQoxhEOZawdQeaDsBpsht57E=;
        b=eOhHaQILLqkHNKteGf0BV8GUZ+pRNR2T1GrDhHnSCfM27opsRsv9iW4sLUN3ZmzdPL
         R3ICMO17DK45BHfFDBPJ+6VXi9lbztuCZvJ3FE4hMJ6mMd2lAeZr8GruAWrY+D/FX0V2
         5anXOZ+iJADUoqjJhwby4+YDiytRZmPjz2cxjEqB5lFS4Gx2ujuUiB40V3jpdnbXe5H+
         UGpuS5z/wptlM5Irk0qXCjpC1MN/WgiIAjPQJFVTx29r7TDu1vbfY/eZ5Z3G+XgjCDMr
         xm7UNgehx/XdkGwkO2a5IW0VdmDSb9QDGuQeWkbI+SnEp8v3au8KRF/bo2ou657hh3FY
         +1Mw==
X-Gm-Message-State: AOAM533bmCryK96ruft7h32mDFyVknS2i6k/kewldzSH81wlk/0HmR0Q
	RKXBb2DVRIwdsF4hPR5S8luy9YAt7kcUCg==
X-Google-Smtp-Source: 
 ABdhPJzp+Pzj6TI/SxOC5ArIsJWKTmxFgly+a1jY3xqAu2P04n/BPlcS48EHZTKmLnw34diAS2KVHA==
X-Received: by 2002:a63:6c4a:0:b0:398:604b:7263 with SMTP id
 h71-20020a636c4a000000b00398604b7263mr15070227pgc.545.1650381738745;
        Tue, 19 Apr 2022 08:22:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3ee6])
        by smtp.gmail.com with ESMTPSA id
 e10-20020a17090a630a00b001c685cfd9d1sm16294537pjj.20.2022.04.19.08.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 08:22:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] libcereal: Link libatomics with gcc as well
Date: Tue, 19 Apr 2022 08:22:15 -0700
Message-Id: <20220419152216.3810783-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 19 Apr 2022 17:48:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96694

Since gcc-12, gcc is also emitting calls to 64bit atomics

Fixes
unittests/CMakeFiles/test_atomic.dir/atomic.cpp.o:/usr/include/c++/12.0.1/atomic:285: more undefined references to `__atomic_load_8' follow
collect2: error: ld returned 1 exit status
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
index 0bb06c1d1f..fc4fad708a 100644
--- a/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
+++ b/meta-oe/recipes-support/libcereal/libcereal_1.3.2.bb
@@ -26,8 +26,8 @@ S = "${WORKDIR}/git"
 
 inherit cmake pkgconfig ptest
 
-LIBATOMIC:mips:toolchain-clang = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
-LIBATOMIC:riscv32:toolchain-clang = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
+LIBATOMIC:mips = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
+LIBATOMIC:riscv32 = "${@bb.utils.contains('PTEST_ENABLED', '1', '-DCEREAL_THREAD_LIBS="-latomic"', '', d)}"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'with-tests', '', d)}"
 PACKAGECONFIG[with-tests] = "-DWITH_WERROR=OFF -DBUILD_TESTS=ON ${LIBATOMIC},,"
-- 
2.35.3


