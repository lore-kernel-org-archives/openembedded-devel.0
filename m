Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39E6C636CC
	for <webhook@archiver.kernel.org>; Sun,  5 Feb 2023 17:54:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.33837.1675619682436945183
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Feb 2023 09:54:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vxg8l2JC;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id jh15so9983001plb.8
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 09:54:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jVtJTxXu1zVJbO6O0hznHStpT/K8OJoOKP6Bf+5u89I=;
        b=Vxg8l2JCAOMbuZcJXSGOutdtZ7vJOKHz6po5VkFvIHngOgZIDyiuYJDhn4w5wtwCxo
         0MunP1nmZ1i/reATL/46Ea7JH/SAEJhcrUM455335H4Dn8UXunMP5Q8lM73/phtmLQbK
         /renSSmSeW+ouKPy05HXHuq1wqof0BIb8oHwPktlb2bEE5jBNUGzVYTetzEADTxm+RY5
         HoGH17T/34RjZgb88Gp3quqQw4TRfwJjlYP1xPW04D+2atj3DCcE3zvHERClTkko1YQ4
         g6vLRWj2Qia/APpb1wmxjyr+LKOpB3FAN0MUyaLvaVETO7RWX0p/TIQ6bo9s6c6E8QIU
         8vRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jVtJTxXu1zVJbO6O0hznHStpT/K8OJoOKP6Bf+5u89I=;
        b=PJ0HxBBrV2OD95GEMy0ghK7LMf6YmI/UIw0bSXWt74Tl2D4nuiSHe+ERU0Yn5iONIc
         wzZq5KC8zRfbqQnShWbfNO43M8WyCL7zddyFOJOtslDWScITNeZ6dw2mGKkOtjFDb/M/
         rVdjZ+FVe2IM+Nizd6+RIfsI+C0ABq1NStdqSgL70rIocZlk0swmgKOGAr+QqajYgI3b
         gjWTYSeJ/N4IYywUz0R+JeZrmTpktnMYq7GUUeJrg96t9DTh9+fFR5io3QOdHE1EgepE
         VJSD1POf3aDuu/7mJG7XvkXG65ovaTCj8uvud+l3DQcX9Tn03xa1BaOHoYLWdgitpBgr
         YKWg==
X-Gm-Message-State: AO0yUKWhweJvXyFipzCdFn2IwvcMHJjzhWFiCTj9cjWUuiLG8tFVtdlW
	oSEvnxCiTRKZN75O28sUBgZilR4vEgI=
X-Google-Smtp-Source: AK7set9/na5bxGXHXNuBJS/Vrp3jFxmKGSSbpOyoTrKj3ShZVJkWTp2HaZBIwYm9ojop0+0g0VCuQw==
X-Received: by 2002:a05:6a20:3d12:b0:bc:8b91:69a3 with SMTP id y18-20020a056a203d1200b000bc8b9169a3mr20933671pzi.46.1675619681368;
        Sun, 05 Feb 2023 09:54:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::868f])
        by smtp.gmail.com with ESMTPSA id e3-20020a63aa03000000b004f25fc5b490sm4746889pgf.5.2023.02.05.09.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 09:54:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] perfetto: Add missing dependencies.
Date: Sun,  5 Feb 2023 09:54:38 -0800
Message-Id: <20230205175438.1481874-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Feb 2023 17:54:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100935

Latest release 0.31 needs some more bits during build. Add them
at right SHA checkouts, from

tools/install-build-deps

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-devtools/perfetto/perfetto.bb | 22 +++++++++++++++----
 1 file changed, 18 insertions(+), 4 deletions(-)

diff --git a/meta-oe/recipes-devtools/perfetto/perfetto.bb b/meta-oe/recipes-devtools/perfetto/perfetto.bb
index 3cc732b700..e8c4025bd8 100644
--- a/meta-oe/recipes-devtools/perfetto/perfetto.bb
+++ b/meta-oe/recipes-devtools/perfetto/perfetto.bb
@@ -2,7 +2,6 @@ LICENSE = "Apache-2.0 & BSD-3-Clause & MIT & Zlib"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f87516e0b698007e9e75a1fe1012b390 \
                     file://buildtools/libcxx/LICENSE.TXT;md5=55d89dd7eec8d3b4204b680e27da3953 \
-                    file://buildtools/libcxx/utils/google-benchmark/LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
                     file://buildtools/libcxxabi/LICENSE.TXT;md5=7b9334635b542c56868400a46b272b1e \
                     file://buildtools/libunwind/LICENSE.TXT;md5=f66970035d12f196030658b11725e1a1 \
                     file://buildtools/protobuf/LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b \
@@ -15,15 +14,30 @@ SRC_URI:append = " \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxx.git;protocol=https;destsuffix=git/buildtools/libcxx;branch=main;name=libcxx \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libcxxabi.git;protocol=https;destsuffix=git/buildtools/libcxxabi;branch=main;name=libcxxabi \
            git://chromium.googlesource.com/external/github.com/llvm/llvm-project/libunwind.git;protocol=https;destsuffix=git/buildtools/libunwind;branch=main;name=libunwind \
+           git://android.googlesource.com/platform/system/libbase.git;branch=master;protocol=https;destsuffix=git/buildtools/android-libbase;name=libbase \
+           git://android.googlesource.com/platform/system/unwinding.git;branch=master;protocol=https;destsuffix=git/buildtools/android-unwinding;name=unwinding \
+           git://android.googlesource.com/platform/system/logging.git;branch=master;protocol=https;destsuffix=git/buildtools/android-logging;name=logging \
+           git://android.googlesource.com/platform/system/libprocinfo.git;branch=master;protocol=https;destsuffix=git/buildtools/android-libprocinfo;name=libprocinfo \
+           git://android.googlesource.com/platform/system/core.git;branch=master;protocol=https;destsuffix=git/buildtools/android-core;name=core \
+           git://android.googlesource.com/platform/bionic.git;branch=master;protocol=https;destsuffix=git/buildtools/bionic;name=bionic \
            git://android.googlesource.com/platform/external/zlib.git;branch=master;protocol=https;destsuffix=git/buildtools/zlib;name=zlib \
+           git://android.googlesource.com/platform/external/lzma.git;branch=master;protocol=https;destsuffix=git/buildtools/lzma;name=lzma \
            https://storage.googleapis.com/perfetto/gn-linux64-1968-0725d782;subdir=git/buildtools/;name=gn \
+           \
            file://0001-Remove-check_build_deps-build-steps.patch \
            file://0001-Add-missing-header-cstdint-for-uintXX_t-types.patch"
 
+SRCREV_bionic = "4b0e16bc72a82a63c699977376a7d6eadca1b206"
+SRCREV_core = "9e6cef7f07d8c11b3ea820938aeb7ff2e9dbaa52"
+SRCREV_lzma = "7851dce6f4ca17f5caa1c93a4e0a45686b1d56c3"
+SRCREV_libprocinfo = "fd214c13ededecae97a3b15b5fccc8925a749a84"
+SRCREV_logging = "7b36b566c9113fc703d68f76e8f40c0c2432481c"
+SRCREV_unwinding = "d66882575ebe3700d6a6b10185f3aee28acc1051"
 SRCREV_protobuf = "6a59a2ad1f61d9696092f79b6d74368b4d7970a3"
-SRCREV_libcxx = "d9040c75cfea5928c804ab7c235fed06a63f743a"
-SRCREV_libcxxabi = "196ba1aaa8ac285d94f4ea8d9836390a45360533"
-SRCREV_libunwind = "d999d54f4bca789543a2eb6c995af2d9b5a1f3ed"
+SRCREV_libbase = "78f1c2f83e625bdf66d55b48bdb3a301c20d2fb3"
+SRCREV_libcxx = "f8571eaba606bde2eb8cd34b30104ca33e7c207e"
+SRCREV_libcxxabi = "8dd405113a4f3694e910b79785dd7fb7535a888a"
+SRCREV_libunwind = "aabcd8753678f1536e15eb6385a948470debdae4"
 SRCREV_zlib = "5c85a2da4c13eda07f69d81a1579a5afddd35f59"
 SRC_URI[gn.sha256sum] = "f706aaa0676e3e22f5fc9ca482295d7caee8535d1869f99efa2358177b64f5cd"
 
-- 
2.39.1


