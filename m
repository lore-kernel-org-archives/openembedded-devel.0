Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9242DC433F5
	for <webhook@archiver.kernel.org>; Fri, 14 Jan 2022 17:56:12 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.10733.1642182971298798509
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:56:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=paGcv4J3;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id
 c14-20020a17090a674e00b001b31e16749cso22883607pjm.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 14 Jan 2022 09:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=62QA0TBJ4D7zvbj9UOkzOR1U2iHG7fGSyEyWgju58k0=;
        b=paGcv4J3ozLfFAxTPDwoXs4YVf+kgRTU/cuU8whOHN5GLvfSXsXnGfx0UZQyEcAuAc
         c8/0TW/Rothw1SYDYO2Vvn4+mDBpUETEUsPC/0xaLPRLPRxGgqBZCKwJi+xdjfnZkkRZ
         0fFsQdR6uB12UjjxCyJb2vqIBa1az15HMBIPRA6SHFXu3YCf+qOGTi8RhVVr1AzXClGn
         PqPfSpTFE+iKl2egiX/Bcm9AaEXYrw+dAajAlw89+nZRD1OB+Rrzylec6ec4/gw/xZqg
         8zlGKSHaaMi1dSp+T5PBtt7MsrGNoYJidBO2IYwMz2AUi8RJytnjBs8/WOVZ4lN0vetJ
         1tfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=62QA0TBJ4D7zvbj9UOkzOR1U2iHG7fGSyEyWgju58k0=;
        b=PQQ25PIH6MURXVvOjEj0i4EwFpha5XOqwX4+vD5WKBYl5h59tE3dNPCRzkH7B1cbPG
         4mK+k5qco3M/J/spmrU6jg9hobiRkEoRSxo72obwybnqHSFkPLWSWu4Y46tz/p9wnZnF
         xrBwbZcOoALI0neuY4Nl9hmFREe/ZEJVB4tJuxsJTJUXoOepqDJ14x5iIQlR8/3USJaD
         FL5Gy/X3x4psxC0JLKVt5geA59vBCRoAG1z6i1DcLplbpsgep5z2m+HWC3AnEnz5g/EX
         vKc/xXjjT2Flo5ErT6KDBfujmNbOP+SCzEWbeKoVS7JRCdw5ERbMIGUGtFahGHRd7yiO
         6RVQ==
X-Gm-Message-State: AOAM530U5wznKyhzm+VmVoqEg1ztaE2qOFCVD3K6BX0z0ZQemYoWZdei
	IKwZT+w/8PX9dNzrMLYgawpC9lFPU9Zcmw==
X-Google-Smtp-Source: 
 ABdhPJzY6u0mhMmK3CAYxyEP0XIyHmLjUFtjHakiL/yVExrr1csbqgX8en/kPyFDrIBkKwRzaqKUjw==
X-Received: by 2002:a17:902:bb8e:b0:14a:496c:6f2b with SMTP id
 m14-20020a170902bb8e00b0014a496c6f2bmr10646710pls.57.1642182970121;
        Fri, 14 Jan 2022 09:56:10 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b5e3])
        by smtp.gmail.com with ESMTPSA id
 q12sm6436548pfk.136.2022.01.14.09.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jan 2022 09:56:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] jemalloc: Fix build with glibc 2.35+clang
Date: Fri, 14 Jan 2022 09:56:07 -0800
Message-Id: <20220114175607.863454-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 14 Jan 2022 17:56:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94847

Compiler crashes when using glibc 2.35, it should be fixed in clang but
until then workaround it here.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...imization-with-clang-for-aligned_all.patch | 33 +++++++++++++++++++
 .../jemalloc/jemalloc_5.2.1.bb                |  3 ++
 2 files changed, 36 insertions(+)
 create mode 100644 meta-oe/recipes-devtools/jemalloc/files/0001-test-Disable-optimization-with-clang-for-aligned_all.patch

diff --git a/meta-oe/recipes-devtools/jemalloc/files/0001-test-Disable-optimization-with-clang-for-aligned_all.patch b/meta-oe/recipes-devtools/jemalloc/files/0001-test-Disable-optimization-with-clang-for-aligned_all.patch
new file mode 100644
index 0000000000..570202e800
--- /dev/null
+++ b/meta-oe/recipes-devtools/jemalloc/files/0001-test-Disable-optimization-with-clang-for-aligned_all.patch
@@ -0,0 +1,33 @@
+From 3fe67deb9fcf0ae3c2ff31a9eccb6a0a9af33b9c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 14 Jan 2022 09:47:03 -0800
+Subject: [PATCH] test: Disable optimization with clang for aligned_alloc.c
+
+Clang crashes when using glibc 2.35, it works ok with older glibc or
+musl, so its very specific problem. Its reported here
+
+https://github.com/llvm/llvm-project/issues/52765
+
+Until it is fixed, workaround the build failure
+
+Upstream-Status: Inappropriate [Workaround]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/integration/aligned_alloc.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/test/integration/aligned_alloc.c b/test/integration/aligned_alloc.c
+index 4375b172..6513bdd9 100644
+--- a/test/integration/aligned_alloc.c
++++ b/test/integration/aligned_alloc.c
+@@ -1,5 +1,7 @@
+ #include "test/jemalloc_test.h"
+ 
++#pragma clang optimize off
++
+ #define MAXALIGN (((size_t)1) << 23)
+ 
+ /*
+-- 
+2.34.1
+
diff --git a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
index 17a04e11a9..8618c8c6a7 100644
--- a/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
+++ b/meta-oe/recipes-devtools/jemalloc/jemalloc_5.2.1.bb
@@ -18,6 +18,9 @@ SRC_URI = "git://github.com/jemalloc/jemalloc.git;branch=master;protocol=https \
            file://run-ptest \
 "
 
+# Workaround for https://github.com/llvm/llvm-project/issues/52765
+SRC_URI:append:libc-glibc:toolchain-clang = " file://0001-test-Disable-optimization-with-clang-for-aligned_all.patch "
+
 SRCREV = "ea6b3e973b477b8061e0076bb257dbd7f3faa756"
 
 S = "${WORKDIR}/git"
-- 
2.34.1


