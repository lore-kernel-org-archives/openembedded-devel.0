Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.11557.1628094712981574965
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 Aug 2021 09:31:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VwskKFOX;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id d131-20020a1c1d890000b02902516717f562so1825561wmd.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 04 Aug 2021 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0kUtNtbF6b9wFQEIMI+wrNBytXs59OsvKgLHF/E3HF8=;
        b=VwskKFOXnyTLi5oWQdl6TYCQ45Jo4XckoZsmwNTz8qVk6OFIyua1wF+bKZwUK0pIrd
         LzTYGqUK+RN+YrQaXlXV175R7G9YRPi8Nzgiphyjgrmb0iQ0pQa29Z0NZLywICFnq92E
         uNCiY2VSa423uroBexPO8wc0VvZ3nX+fnccL7Z6eJJEi0nWJS+b1HMeDNq7jQJ2IyrzX
         bkxKjQG/cl1v3OppAryxtfyeEr3Mx8BhF3dKSxPT0+8rrooHd0d+C2Tzg93xQK8C7j2l
         BuTyqEQE4Te3fisUcg1FUL7PV9DWZeBryReO+tgijmyu7I3c9An3kviMrbTWEevXG4vC
         +qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0kUtNtbF6b9wFQEIMI+wrNBytXs59OsvKgLHF/E3HF8=;
        b=S9zn+P3IobYT0YylSvrO3GS54CM6wBwn8rXBbxmhfB63e+3b6V4YaMEuZvbZnWxKRA
         cvlgkPLNiacZcu4xJMrNRrUAMMRfRSfkgMh4UynnegTu8bbMcqydle3peOd0hoT6DrWx
         t2WhyMUCMkTvfEnUt+yaTCNXivP14nYsmWa8JvwBg26icjPXFvIN+468k0qC0OVT1dqi
         CcxcN4xxHxHMWKB1NTBwlxoQarud5zaknEyUrt/AYY3payWySnakSPugABqcNN3USDr6
         tFfgiSjYp4YwHXbN2XLjl4iHs8i8MvJ73w4VAS1C0SCooA1HtW4P/zX6jvwJW3HsNhCI
         IXyQ==
X-Gm-Message-State: AOAM5331MVt1odxRldRa0rgrFsZeDfWrfymHlmoY2ra7Z2k0Waa0O0oC
	6B5lq+NI9aam/UMDyZZE7FL/5D/V1bhvtQ==
X-Google-Smtp-Source: ABdhPJxO0Jv0JGUDZZiLBtSS6isxlPFkVFeETOPwawd3vRrxlC3xfrRQoNxIQzCkRD7AdBirKG5iDw==
X-Received: by 2002:a7b:cbcd:: with SMTP id n13mr421587wmi.105.1628094711346;
        Wed, 04 Aug 2021 09:31:51 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y24sm2612847wmo.12.2021.08.04.09.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 09:31:51 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][master-next][PATCH] klibc.bbclass, image_types_sparse.bbclass, packagegroup-meta-oe.bb: update the overrides syntax conversion
Date: Wed,  4 Aug 2021 18:31:48 +0200
Message-Id: <20210804163148.2765913-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* re-run the latest version of the script which converts CONVERSION_CMD as well since
  https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=d9e81d66db2bc2aa56d177cef78c814c29679a4a
* skip many incorrect s/_linux/:linux/g changes which were introduced by:
  https://git.openembedded.org/openembedded-core/commit/?h=master-next&id=9ea1041f8eab26ee871a9176e9691e5d3e6745bd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-initramfs/classes/klibc.bbclass               |  2 +-
 meta-oe/classes/image_types_sparse.bbclass         |  2 +-
 .../packagegroups/packagegroup-meta-oe.bb          | 14 +++++++-------
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-initramfs/classes/klibc.bbclass b/meta-initramfs/classes/klibc.bbclass
index 83112c06fa..202d132d94 100644
--- a/meta-initramfs/classes/klibc.bbclass
+++ b/meta-initramfs/classes/klibc.bbclass
@@ -4,7 +4,7 @@ DEPENDS =+ "klcc-cross"
 # Default for klcc is to build static binaries.
 # Set CC = "${TARGET_PREFIX}klcc -shared" to build the dynamic version.
 CC:forcevariable = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS}"
-CC:forcevariable:armv4_linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
+CC:forcevariable:armv4:linux-gnueabi = "${TARGET_PREFIX}klcc ${TOOLCHAIN_OPTIONS} -march=armv4 -mthumb-interwork"
 CC:append:armv7ve = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 CC:append:armv7a = " ${@' -mfloat-abi=${TUNE_CCARGS_MFLOAT}' if (d.getVar('TUNE_CCARGS_MFLOAT') != '') else ''}"
 
diff --git a/meta-oe/classes/image_types_sparse.bbclass b/meta-oe/classes/image_types_sparse.bbclass
index 1459f800a5..af3879372b 100644
--- a/meta-oe/classes/image_types_sparse.bbclass
+++ b/meta-oe/classes/image_types_sparse.bbclass
@@ -1,7 +1,7 @@
 inherit image_types
 
 CONVERSIONTYPES += "sparse"
-CONVERSION_CMD_sparse() {
+CONVERSION_CMD:sparse() {
     in="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
     out="${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sparse"
     case "${type}" in
diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
index 5cd605ff49..47ee3099aa 100644
--- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
+++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
@@ -205,7 +205,7 @@ RDEPENDS:packagegroup-meta-oe-crypto ="\
     libsodium \
     pkcs11-helper \
 "
-RDEPENDS_packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
+RDEPENDS:packagegroup-meta-oe-crypto:remove:riscv32 = "botan"
 
 RDEPENDS:packagegroup-meta-oe-dbs ="\
     influxdb \
@@ -948,12 +948,12 @@ RDEPENDS:packagegroup-meta-oe-test ="\
     pm-qa \
     testfloat \
 "
-RDEPENDS_packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
-RDEPENDS_packagegroup-meta-oe-test:remove:arm = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:mipsarch = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:powerpc = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:riscv64 = "fwts"
-RDEPENDS_packagegroup-meta-oe-test:remove:riscv32 = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:libc-musl = "pm-qa"
+RDEPENDS:packagegroup-meta-oe-test:remove:arm = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:mipsarch = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:powerpc = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:riscv64 = "fwts"
+RDEPENDS:packagegroup-meta-oe-test:remove:riscv32 = "fwts"
 
 RDEPENDS:packagegroup-meta-oe-ptest-packages = "\
     zeromq-ptest \
-- 
2.30.2

