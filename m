Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C588FC531DF
	for <webhook@archiver.kernel.org>; Thu, 15 Aug 2024 04:45:36 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.116216.1723697136156562610
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Aug 2024 21:45:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hoE2Z9Q6;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-39b37b63834so2533545ab.0
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Aug 2024 21:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723697135; x=1724301935; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LhsYm6LmfMWsCtjEB3XaMk9i4DH/vX3tJY+jIO1Lgio=;
        b=hoE2Z9Q6nyPoLm0pYYrP/mPyt2kwtzQuqUPNBRi/X5sy+2RNTjgjUSZG9sFyi7J8Mw
         tnx3Nw5kc1VYjSTAlhH83uLrtY/9CrMLYxlVzeJSvmvzNcJxAvr2pvWOg2+ZwXQ1jI+E
         zrAyg5eWGyeDNW8+hdlb57Zz8M75rUOz7uWohnGBcE1UVltoxZ7Qb48j88uv6znLdBjr
         C6oQdYvDldh7pJvEPYTkrhs1w3rR1bkOe9bjxS0bsrls/UyKJquh9T1xCmEZRj9/t8Jp
         mnErXQ9ymwjZQ+O2MKdsmWQRlBBYZ2m431HYWIFO/2s+lyZbV8xh7LuQaK7VQdDDDPU6
         MZfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723697135; x=1724301935;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LhsYm6LmfMWsCtjEB3XaMk9i4DH/vX3tJY+jIO1Lgio=;
        b=gBR8k7npmDvP48kwUgXu2Cu0ozw+EVM+wc8l9A9Q32ok5ZHWm8OlCih/wApJHmbaYX
         639yIzU7YY9q1k5j8n3IC4vxar6J0eVhJU29VFAPp3/Pt/kLF5yBOwGvTFIAh/z6jotH
         fiyzoHXbXxzb8RY2T613LFlrCOZBnapK050XUJDgYIWo26nQbwzfwBzj8AaC6+WXSwcU
         /Tr4SgRlx/TsPazxrNsE72i1vkW7LTY86jFa+WKlCPuERSVjyU9Q84nIkhYtNp2KpvcP
         tkuKP62wwi6zn0eXXOR/4QWSW6q5N7w8zGYRhXtmjWsQexSZBnkj3Lu/n0D33S82U6Ef
         P9TA==
X-Gm-Message-State: AOJu0YxZxAr6+0NesDm1If9hbvKcSqNBaPT3JlL+1Ibkw45fpfKN1Krr
	bME/BhAeQab6MbOOPFy4CBrHzwKqaR5OLykwRRBJP3TPZjwnBbbGn9BnSQ==
X-Google-Smtp-Source: AGHT+IHENHJMTFclVrQ4MrFqW0rAj0Nh6dnyKco/acFRyAhxxMkpGSrSwvDjDztmTM1yNOKzv2YpDw==
X-Received: by 2002:a05:6e02:1567:b0:39a:e814:b926 with SMTP id e9e14a558f8ab-39d12461591mr66905325ab.16.1723697135050;
        Wed, 14 Aug 2024 21:45:35 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::e55d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7c6b6357a86sm316856a12.58.2024.08.14.21.45.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 21:45:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-networking][PATCH 7/9] freediameter: Fix buildpaths QA error
Date: Wed, 14 Aug 2024 21:45:21 -0700
Message-ID: <20240815044523.1030831-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240815044523.1030831-1-raj.khem@gmail.com>
References: <20240815044523.1030831-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Aug 2024 04:45:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111815

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...lags-for-carrying-user-specified-par.patch | 39 +++++++++++++++++++
 .../freediameter/freediameter_1.5.0.bb        |  9 +++--
 2 files changed, 44 insertions(+), 4 deletions(-)
 create mode 100644 meta-networking/recipes-protocols/freediameter/files/0001-bison-flex-Add-flags-for-carrying-user-specified-par.patch

diff --git a/meta-networking/recipes-protocols/freediameter/files/0001-bison-flex-Add-flags-for-carrying-user-specified-par.patch b/meta-networking/recipes-protocols/freediameter/files/0001-bison-flex-Add-flags-for-carrying-user-specified-par.patch
new file mode 100644
index 0000000000..98ba4d5283
--- /dev/null
+++ b/meta-networking/recipes-protocols/freediameter/files/0001-bison-flex-Add-flags-for-carrying-user-specified-par.patch
@@ -0,0 +1,39 @@
+From fa6227d92725af5ae17b8435c0d50d92ff7a575c Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 14 Aug 2024 19:32:25 -0700
+Subject: [PATCH] bison/flex: Add flags for carrying user specified parameters
+
+This helps in passing cmdline to flex and bison e.g. to remove lines
+from generated output to avoid absolute paths
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ cmake/Modules/CMakeUserUseBison.cmake | 1 +
+ cmake/Modules/CMakeUserUseFlex.cmake  | 1 +
+ 2 files changed, 2 insertions(+)
+
+diff --git a/cmake/Modules/CMakeUserUseBison.cmake b/cmake/Modules/CMakeUserUseBison.cmake
+index 9257545..b61bd0e 100644
+--- a/cmake/Modules/CMakeUserUseBison.cmake
++++ b/cmake/Modules/CMakeUserUseBison.cmake
+@@ -52,6 +52,7 @@ IF(BISON_EXECUTABLE)
+        OUTPUT "${OUTFILE}" "${HEADER}"
+        COMMAND "${BISON_EXECUTABLE}"
+        ARGS "--name-prefix=${PREFIX}"
++       "${BISON_TARGET_ARG_COMPILE_FLAGS}"
+        "--defines"
+        "--output-file=${OUTFILE}"
+        "${CMAKE_CURRENT_SOURCE_DIR}/${FILENAME}"
+diff --git a/cmake/Modules/CMakeUserUseFlex.cmake b/cmake/Modules/CMakeUserUseFlex.cmake
+index 7d0394f..1221dca 100644
+--- a/cmake/Modules/CMakeUserUseFlex.cmake
++++ b/cmake/Modules/CMakeUserUseFlex.cmake
+@@ -39,6 +39,7 @@ IF(FLEX_EXECUTABLE)
+       OUTPUT "${OUTFILE}"
+       COMMAND "${FLEX_EXECUTABLE}"
+       ARGS "-P${PREFIX}"
++      "${FLEX_TARGET_ARG_COMPILE_FLAGS}"
+       "-o${OUTFILE}"
+       "${CMAKE_CURRENT_SOURCE_DIR}/${FILENAME}"
+       DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/${FILENAME}")
diff --git a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
index c7c329a5d4..cf50a92afb 100644
--- a/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
+++ b/meta-networking/recipes-protocols/freediameter/freediameter_1.5.0.bb
@@ -7,7 +7,7 @@ Accounting needs."
 
 HOMEPAGE = "http://www.freediameter.net"
 
-DEPENDS = "flex bison cmake-native libgcrypt gnutls libidn2 lksctp-tools virtual/kernel bison-native"
+DEPENDS = "flex-native bison-native cmake-native libgcrypt gnutls libidn2 lksctp-tools virtual/kernel bison-native"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -23,6 +23,7 @@ SRC_URI = "git://github.com/freeDiameter/freeDiameter;protocol=https;branch=mast
     file://freeDiameter.conf \
     file://install_test.patch \
     file://0001-tests-use-EXTENSIONS_DIR.patch \
+    file://0001-bison-flex-Add-flags-for-carrying-user-specified-par.patch \
     "
 
 S = "${WORKDIR}/git"
@@ -49,6 +50,8 @@ EXTRA_OECMAKE = " \
     -DEXTENSIONS_DIR:PATH=${libdir}/${fd_pkgname} \
     -DINSTALL_TEST_SUFFIX:PATH=${PTEST_PATH}-tests \
     -DCMAKE_SKIP_RPATH:BOOL=ON \
+    -DFLEX_TARGET_ARG_COMPILE_FLAGS='--noline' \
+    -DBISON_TARGET_ARG_COMPILE_FLAGS='--no-lines' \
 "
 # INSTALL_LIBRARY_SUFFIX is relative to CMAKE_INSTALL_PREFIX
 # specify it on cmd line will fix the SET bug in CMakeList.txt
@@ -107,15 +110,13 @@ EOF
     # create self cert
     openssl req -x509 -config ${STAGING_DIR_NATIVE}/etc/ssl/openssl.cnf -newkey rsa:4096 -sha256 -nodes -out ${D}${sysconfdir}/freeDiameter/${FD_PEM} -keyout ${D}${sysconfdir}/freeDiameter/${FD_KEY} -days 3650 -subj '/CN=${FD_HOSTNAME}.${FD_REALM}'
     openssl dhparam -out ${D}${sysconfdir}/freeDiameter/${FD_DH_PEM} 1024
-
-    find ${B} \( -name "*.c" -o -name "*.h" \) -exec sed -i -e 's#${UNPACKDIR}##g' {} \;
 }
 
 do_install_ptest() {
     mv ${D}${PTEST_PATH}-tests/* ${D}${PTEST_PATH}/
     rmdir ${D}${PTEST_PATH}-tests
     install -m 0644 ${B}/tests/CTestTestfile.cmake ${D}${PTEST_PATH}/
-    sed -i -e 's#${UNPACKDIR}##g' ${D}${PTEST_PATH}/CTestTestfile.cmake
+    sed -i -e 's#${WORKDIR}##g' ${D}${PTEST_PATH}/CTestTestfile.cmake
     sed -i "/^set_tests_properties/d" ${D}${PTEST_PATH}/CTestTestfile.cmake
 }
 

