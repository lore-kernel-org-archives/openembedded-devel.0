Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35130C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 08:36:24 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web09.3479.1660120576146987066
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:36:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AhACp1DL;
 spf=pass (domain: gmail.com, ip: 209.85.210.172,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f172.google.com with SMTP id k14so11057485pfh.0
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Aug 2022 01:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=yqVIBp00m2A5lJC+xmnBvPE+dONCMaUbqvKuyJ+lKac=;
        b=AhACp1DLN/K6RxxfjXlsImpnU19SAXmvgj//e5zaP8R06Nyb3bRuNw1Ebe3Sz7K3sc
         k5/gRi8ZZHHGdZFJ0SWGeK53N8rrpXJNueSlPme1KMSvnhF78dxPtCEujhPA2fqPPDc+
         HZj/4zAtLMIAN4gYxuA2NFGe6/wxnK6WW5JpvySIVbdO1LlEjhZO9XczyryBe2KIn0kD
         u+j+tVqcZcq9EVMdnVKRBq7D2u+cn+Pbl0ADSwm8b2qsR7+zDkXLbCW/2VoqLiaB5BFf
         yCzlxuFmMEAKQ4rnQIPI9U9VHTPaDKAhM0+pdRboVpvyHZXqo8wAnPvtuwLhkiwnJazb
         unjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=yqVIBp00m2A5lJC+xmnBvPE+dONCMaUbqvKuyJ+lKac=;
        b=aaiT+NEwKQW2Ya9bTpAk1OAcLImeVwLgwlcUlWX6Mf79kJ3wW/ets6VgY9KnRps3KA
         ufeIF6REAGlR+8XCwZR1awsKrWlI+k4lqQAlXpl62l4LM20qJ64d3WwRafE5/TFzvz5R
         1BSnvwGL/YkEEVdFMgr5K3C/3eicPaCm3rluM6RxPousnWV9Js8RFzYM+eVsDjKK+dN3
         4uIGyUvQ8TTini3C5uK74Z8BbQhwAhpqa41AvThiDPamfweYi4jYgoYB/hfiYKp1GFFl
         7O3E06zY2n7UUC2FCt5kcV+Osdi3/FEEwjR6e1ZWA8gH1bUtEEQdIG874oVeTBXFAjd9
         PA7g==
X-Gm-Message-State: ACgBeo2ezfBFjfMAzaQjjwV1FYDERGCAiAdYowysHvKl9L79jCVHW7E6
	9z9iw3e16jqT2KDrmeotCW51xfiEKl8=
X-Google-Smtp-Source: 
 AA6agR6x+1T1boHbp5dClOxOV3dklzPiYsQZur2rOluc7nBfQCny7fyA61MWik/MvkgAd6KTrXWHyQ==
X-Received: by 2002:a63:ce06:0:b0:41d:dcc3:aa6e with SMTP id
 y6-20020a63ce06000000b0041ddcc3aa6emr3720682pgf.251.1660120574992;
        Wed, 10 Aug 2022 01:36:14 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::9f45])
        by smtp.gmail.com with ESMTPSA id
 d7-20020a170903230700b0016bdc98730bsm12417041plh.151.2022.08.10.01.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 01:36:14 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fluentbit: Fix build with musl
Date: Wed, 10 Aug 2022 01:36:09 -0700
Message-Id: <20220810083609.3561548-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 10 Aug 2022 08:36:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98185

Pass large enough default for FLB_CORO_STACK_SIZE
Remove unused jemalloc patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Use-posix-strerror_r-with-musl.patch | 34 +++++++++++++++++++
 ...nkio-Link-with-fts-library-with-musl.patch | 28 +++++++++++++++
 .../fluentbit/fluentbit/jemalloc.patch        | 16 ---------
 .../fluentbit/fluentbit_1.9.6.bb              |  9 +++--
 4 files changed, 69 insertions(+), 18 deletions(-)
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerror_r-with-musl.patch
 create mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts-library-with-musl.patch
 delete mode 100644 meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch

diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerror_r-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerror_r-with-musl.patch
new file mode 100644
index 0000000000..8d89e4df35
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0001-Use-posix-strerror_r-with-musl.patch
@@ -0,0 +1,34 @@
+From f645128082117a0152a95b3dccd869a184b7513f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 01:23:48 -0700
+Subject: [PATCH 1/2] Use posix strerror_r with musl
+
+Default with glibc is GNU extention of strerror_r
+where as musl uses posix variant, call that out
+
+Upstream-Status: Inappropriate [Need wider porting beyond linux/musl/glibc]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/flb_network.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/flb_network.c b/src/flb_network.c
+index 992eb1d..5d7a337 100644
+--- a/src/flb_network.c
++++ b/src/flb_network.c
+@@ -506,7 +506,12 @@ static int net_connect_async(int fd,
+             }
+ 
+             /* Connection is broken, not much to do here */
++#ifdef __GLIBC__
+             str = strerror_r(error, so_error_buf, sizeof(so_error_buf));
++#else
++            strerror_r(error, so_error_buf, sizeof(so_error_buf));
++	    str = so_error_buf;
++#endif
+             flb_error("[net] TCP connection failed: %s:%i (%s)",
+                       u->tcp_host, u->tcp_port, str);
+             return -1;
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts-library-with-musl.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts-library-with-musl.patch
new file mode 100644
index 0000000000..4ffb20d9ca
--- /dev/null
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit/0002-chunkio-Link-with-fts-library-with-musl.patch
@@ -0,0 +1,28 @@
+From 63dbbad5978e5f5b0e7d42614999cb6b4ebcce10 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 10 Aug 2022 01:27:16 -0700
+Subject: [PATCH 2/2] chunkio: Link with fts library with musl
+
+Fixes
+cio_utils.c:(.text+0x64): undefined reference to `fts_read'
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/chunkio/src/CMakeLists.txt | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/chunkio/src/CMakeLists.txt b/lib/chunkio/src/CMakeLists.txt
+index a4fc2d3..4244eb8 100644
+--- a/lib/chunkio/src/CMakeLists.txt
++++ b/lib/chunkio/src/CMakeLists.txt
+@@ -13,6 +13,7 @@ set(src
+   )
+ 
+ set(libs cio-crc32)
++set(libs ${libs} fts)
+ 
+ if(${CMAKE_SYSTEM_NAME} MATCHES "Windows")
+   set(src
+-- 
+2.37.1
+
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch b/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
deleted file mode 100644
index 67b3397a6f..0000000000
--- a/meta-oe/recipes-extended/fluentbit/fluentbit/jemalloc.patch
+++ /dev/null
@@ -1,16 +0,0 @@
-Add  --with-jemalloc-prefix=je_ so it compiles on musl
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -523,7 +523,7 @@ if(FLB_JEMALLOC AND ${CMAKE_SYSTEM_NAME}
-   # Link to Jemalloc as an external dependency
-   ExternalProject_Add(jemalloc
-     SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1
--    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1/configure ${AUTOCONF_HOST_OPT} --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
-+    CONFIGURE_COMMAND ${CMAKE_CURRENT_SOURCE_DIR}/lib/jemalloc-5.2.1/configure ${AUTOCONF_HOST_OPT} --with-jemalloc-prefix=je_ --with-lg-quantum=3 --enable-cc-silence --prefix=<INSTALL_DIR>
-     CFLAGS=-std=gnu99\ -Wall\ -pipe\ -g3\ -O3\ -funroll-loops
-     BUILD_COMMAND $(MAKE)
-     INSTALL_DIR ${CMAKE_CURRENT_BINARY_DIR}/
diff --git a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
index 77fed7fcfb..92f074bc86 100644
--- a/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
+++ b/meta-oe/recipes-extended/fluentbit/fluentbit_1.9.6.bb
@@ -23,6 +23,10 @@ SRC_URI = "https://releases.fluentbit.io/1.9/source-${PV}.tar.gz;subdir=fluent-b
            file://0005-stackdriver-Fix-return-type-mismatch.patch \
            file://0006-monkey-Fix-TLS-detection-testcase.patch \
            "
+SRC_URI:append:libc-musl = "\
+           file://0001-Use-posix-strerror_r-with-musl.patch \
+           file://0002-chunkio-Link-with-fts-library-with-musl.patch \
+           "
 SRC_URI[sha256sum] = "5ef7dd97e10936269fe5f4e5d3ebf16559333066f7d6757ba12464a9d6186570"
 
 S = "${WORKDIR}/fluent-bit-${PV}"
@@ -43,8 +47,6 @@ do_compile:append() {
     find ${B} -name '*.c' -or -name '*.h' | xargs sed -i -e 's|${TMPDIR}|/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR}/|g'
 }
 
-FLB_JEMALLOC_OPTIONS_LIST = "--with-jemalloc-prefix=je_ --with-lg-quantum=3"
-
 PACKAGECONFIG ?= "yaml"
 
 LTO = ""
@@ -70,6 +72,9 @@ EXTRA_OECMAKE += "${@bb.utils.contains('DISTRO_FEATURES','systemd','-DFLB_SYSTEM
 # Enable release builds
 EXTRA_OECMAKE += "-DFLB_RELEASE=On"
 
+# musl needs these options
+EXTRA_OECMAKE:append:libc-musl = ' -DFLB_JEMALLOC_OPTIONS="--with-jemalloc-prefix=je_ --with-lg-quantum=3" -DFLB_CORO_STACK_SIZE=24576'
+
 EXTRA_OECMAKE:append:riscv64 = " -DFLB_DEPS='atomic'"
 EXTRA_OECMAKE:append:riscv32 = " -DFLB_DEPS='atomic'"
 
-- 
2.37.1


