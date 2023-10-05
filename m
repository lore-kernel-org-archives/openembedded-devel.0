Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 144EAE92FC0
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 21:36:45 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.28055.1696541795051730602
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Oct 2023 14:36:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XmvWDs+z;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c888b3a25aso7236085ad.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696541794; x=1697146594; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VcMDuKx8LULKL/I98fu8VyV41XJsQLogsbrOELhYXoM=;
        b=XmvWDs+zw9P2/BwHz6QFUa8hGVGPtRQiQfNUaCugtrzhQfbhs2E2UWxVKiEt4JgKIy
         euKV/QoIzHjKkCXhsnMUiuWnH0TwzOP8CKLGq3sKcSbBitDZZBy10UylNUhjJmPILdUq
         2zV6YDnpy64Umxl5Vk4r97kDDlgKtIZCuS979IRkNfoSLVgthN7UIfxuMqa2x/wT4kNj
         Edb+6EtXwSbtggPcvtrmNI05zPgtIFU8IgjauDDYs8eq5rXwqMT0iOiR5AULKH0aDhQo
         dnnt9n0EWXNiSppTBXCZ0GF+3nfNZDEhQKCHtwMACIluYOFdW695zlIzLBx7IPWGXu23
         63yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696541794; x=1697146594;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VcMDuKx8LULKL/I98fu8VyV41XJsQLogsbrOELhYXoM=;
        b=MEnf7/y6Vd0y4IZJWWHok3pdslGU0PHRr4I83uocCQhN0YqdmwVP9C+u3WcZBX37QJ
         15KBw3IjNmDqYMfLoiBEq7kp9I3hFA1umNi3RO9pCpHrtFYmAXMjkCkdsdiUSHWX0TrY
         RDyy1NOazkyFDpI4KkRMUuUsJBof/DMpF1OMhjb/7A3Z3xgiRZjaMGlX0reQvIKnHK6Y
         k5MTIpvwj24lo2AQHD8QKkPssgq9+x8TBYeBVdLbGZFg8DEPFxpiOUP23NXYHYrT9LyD
         hdfoDadcBOjR2tV1fzbrN3FXhYoh72jxe8jpu3rAuuS69/QG4rzfmtCJBZ0PZIUNtjys
         TMpQ==
X-Gm-Message-State: AOJu0YwshbJwKv+ifRY2DPSqw7chCV+vLPCcX2/iQRkXWQ+lOdOPi5k/
	dSUT4JX0C5fplgDgd+I3nX148lIMe0gxkA==
X-Google-Smtp-Source: AGHT+IH8CvIMd/NzKuUikUbMQYhqfxrfMBKGZIpINUTG1LelfPY7ZX+L71UqH30bzgiA04S7kxi1Mg==
X-Received: by 2002:a17:902:7d92:b0:1c3:2ee6:3802 with SMTP id a18-20020a1709027d9200b001c32ee63802mr5204423plm.47.1696541793894;
        Thu, 05 Oct 2023 14:36:33 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9100:2cb0::7f07])
        by smtp.gmail.com with ESMTPSA id jc20-20020a17090325d400b001c613b4aa33sm2233225plb.287.2023.10.05.14.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 14:36:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 1/2] kernel-selftest: Build bpf tests again
Date: Thu,  5 Oct 2023 14:36:30 -0700
Message-ID: <20231005213631.390714-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 Oct 2023 21:36:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105362

Fix run-ptest script to run all compiled selftests

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../kernel-selftest/kernel-selftest.bb        | 34 ++++++++++++++-----
 .../kernel-selftest/kernel-selftest/run-ptest | 10 ++----
 2 files changed, 29 insertions(+), 15 deletions(-)

diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
index 4d6e0e3717..8fab1df391 100644
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest.bb
@@ -18,7 +18,7 @@ SRC_URI += "file://run-ptest \
 # we will append other kernel selftest in the future
 # bpf was added in 4.10 with: https://github.com/torvalds/linux/commit/5aa5bd14c5f8660c64ceedf14a549781be47e53d
 # if you have older kernel than that you need to remove it from PACKAGECONFIG
-PACKAGECONFIG ??= "firmware"
+PACKAGECONFIG ??= "firmware bpf"
 PACKAGECONFIG:remove:x86 = "bpf"
 PACKAGECONFIG:remove:arm = "bpf vm"
 # host ptrace.h is used to compile BPF target but mips ptrace.h is needed
@@ -31,30 +31,39 @@ PACKAGECONFIG:remove:qemumips = "bpf vm"
 PACKAGECONFIG:remove:riscv64 = "vm"
 PACKAGECONFIG:remove:riscv32 = "vm"
 
-PACKAGECONFIG[bpf] = ",,elfutils libcap libcap-ng rsync-native,"
+PACKAGECONFIG[bpf] = ",,elfutils elfutils-native libcap libcap-ng rsync-native python3-docutils-native,"
 PACKAGECONFIG[firmware] = ",,libcap, bash"
 PACKAGECONFIG[vm] = ",,libcap libhugetlbfs,libgcc bash"
 
 do_patch[depends] += "virtual/kernel:do_shared_workdir"
+do_compile[depends] += "virtual/kernel:do_install"
 
-inherit linux-kernel-base kernel-arch ptest
+inherit linux-kernel-base module-base kernel-arch ptest siteinfo
 
 S = "${WORKDIR}/${BP}"
 
+DEBUG_PREFIX_MAP:remove = "-fcanon-prefix-map"
+
 TEST_LIST = "\
     ${@bb.utils.filter('PACKAGECONFIG', 'bpf firmware vm', d)} \
     rtc \
 "
-
 EXTRA_OEMAKE = '\
     CROSS_COMPILE=${TARGET_PREFIX} \
     ARCH=${ARCH} \
     CC="${CC}" \
-    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS}" \
     AR="${AR}" \
     LD="${LD}" \
+    LLVM=1 \
+    CONFIG_CC_IS_GCC= \
+    CONFIG_CC_IS_CLANG=y \
+    CONFIG_CC_IMPLICIT_FALLTHROUGH= \
+    CLANG="clang -fno-stack-protector -target ${TARGET_ARCH} ${TOOLCHAIN_OPTIONS} -isystem ${S} -D__WORDSIZE=\'64\' -Wno-error=unused-command-line-argument" \
+    HOSTCC="clang -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++ ${BUILD_CFLAGS} ${BUILD_LDFLAGS} -Wno-error=unused-command-line-argument" \
+    HOSTLD="clang ${BUILD_LDFLAGS} -unwindlib=libgcc -rtlib=libgcc -stdlib=libstdc++" \
     DESTDIR="${D}" \
     MACHINE="${ARCH}" \
+    V=1 \
 '
 
 KERNEL_SELFTEST_SRC ?= "Makefile \
@@ -66,7 +75,6 @@ KERNEL_SELFTEST_SRC ?= "Makefile \
                         arch \
                         LICENSES \
 "
-
 do_compile() {
     if [ ${@bb.utils.contains('PACKAGECONFIG', 'bpf', 'True', 'False', d)} = 'True' ]; then
     if [ ${@bb.utils.contains('DEPENDS', 'clang-native', 'True', 'False', d)} = 'False' ]; then
@@ -74,7 +82,17 @@ do_compile() {
 either install it and add it to HOSTTOOLS, or add clang-native from meta-clang to dependency"
     fi
     fi
+    mkdir -p ${S}/include/config ${S}/bits
+    touch ${S}/include/config/auto.conf
+    if [ "${SITEINFO_BITS}" != "32" ]; then
+        for f in long-double endianness floatn struct_rwlock; do
+            cp ${RECIPE_SYSROOT}${includedir}/bits/$f-64.h ${S}/bits/$f-32.h
+        done
+    fi
     oe_runmake -C ${S} headers
+    sed -i -e 's|^all: docs|all:|' ${S}/tools/testing/selftests/bpf/Makefile
+    sed -i -e '/mrecord-mcount/d' ${S}/Makefile
+    sed -i -e '/Wno-alloc-size-larger-than/d' ${S}/Makefile
     for i in ${TEST_LIST}
     do
         oe_runmake -C ${S}/tools/testing/selftests/${i}
@@ -133,9 +151,9 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 INHIBIT_PACKAGE_DEBUG_SPLIT="1"
 FILES:${PN} += "/usr/kernel-selftest"
 
-RDEPENDS:${PN} += "python3 perl"
+RDEPENDS:${PN} += "python3 perl perl-module-io-handle"
 # tools/testing/selftests/vm/Makefile doesn't respect LDFLAGS and tools/testing/selftests/Makefile explicitly overrides to empty
-INSANE_SKIP:${PN} += "ldflags"
+INSANE_SKIP:${PN} += "ldflags libdir"
 
 SECURITY_CFLAGS = ""
 COMPATIBLE_HOST:libc-musl = 'null'
diff --git a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
index d40b9576d8..0903d097e1 100755
--- a/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
+++ b/meta-oe/recipes-kernel/kernel-selftest/kernel-selftest/run-ptest
@@ -1,11 +1,7 @@
 #!/bin/sh
-export PATH=$PATH:/usr/kernel-selftest/bpf
-
-# test_align
-test_align | grep "12 pass" &> /dev/null
+/usr/kernel-selftest/run_kselftest.sh -s
 if [ $? == 0 ]; then
-    echo "[PASS]: test_align"
+    echo "PASS: kernel-selftest"
 else
-    echo "[FAIL]: test_align"
+    echo "[FAIL]: kernel-selftest"
 fi
-
-- 
2.42.0


