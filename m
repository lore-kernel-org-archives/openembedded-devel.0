Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62165E810B3
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 08:42:58 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.13274.1695804174913364726
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 01:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ux/Rh+Rj;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-406402933edso20045685e9.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 01:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695804173; x=1696408973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJFLKgkLu1gA5X2qhQfQaAFGdfau3v+T8yd7lc9GWP0=;
        b=Ux/Rh+RjnqytiunnWhXYrQBNOl7e99FzjlUZjq53zF1i1nG5N6SFgV6i1IOPBHABV6
         QyeV30zthjLxj1AWIkxCV5Doic0573LuS1hyP5b/Fd/Ta4JtKeE15//0E0SuBrIrgmJv
         lEoHdPwH6+Qdw+NsgLjSp0pc9NmIR0jOO1Gj0Lx3Thkxu1etdMk23TpAI+Gz8LOv39L3
         5xPBZgOzQuKajU/pCuaIQk0dhUFqE+dL6VIZrI60dnixMOFJm06jC9gwKRJx06HKH9/X
         6msYkJW9YTcFah7eNKoYhwOLJCiXp0T4b4HjivyNrn+rhzTxavj5mz8HmS4BZu598WIu
         BjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804173; x=1696408973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJFLKgkLu1gA5X2qhQfQaAFGdfau3v+T8yd7lc9GWP0=;
        b=ZgiScDMTQG/hAhtPxLvqGjigHtWVrrycAmJhgGjorbh9gccG2yAfMU3lkWvIyFcoLB
         nCEDEwfYTquwj8Q3YSdQ2kis5or+7tvn2YZYGn+EfJBffC+inIbFQc9NXkXa8ouN7Qyf
         +jG8QKfaP7ehYJ8RPSx3OZD2+/pt7WewagGRGeDrWedIO0MqzCFWnl4s1miTxk8DYScA
         xInzY7hB6U0WSU8zwSJln34mwcTsLkdMjq9O91Mw/CwEwXEL9x8RL51C88SO+TOz4/8Z
         RjT9AHJNIYoJ/NdIOFyCa5VZ9j5n1EbrLmp+xZBgTevtuWk54fA+1chE6AmVipNI/sYt
         dHKg==
X-Gm-Message-State: AOJu0YyJK0S3/jZwNAkBsd4ozNksvqpB9dnPSDSZ6qkpzKK2Nz7/Aemw
	D2qKaPlggUmtaYCxCWQ7KzDNnmbl4c4=
X-Google-Smtp-Source: AGHT+IGC21OUH4d9B3UabNHKe7/PrKdh9AkztNck5K1FxrQmI4j7MnclrIfy9mvWCLTgdzwRE57tTw==
X-Received: by 2002:a7b:c4d9:0:b0:401:5443:5591 with SMTP id g25-20020a7bc4d9000000b0040154435591mr1261776wmk.20.1695804172370;
        Wed, 27 Sep 2023 01:42:52 -0700 (PDT)
Received: from firmware-builder.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id c24-20020a7bc858000000b004030c778396sm20008616wml.4.2023.09.27.01.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 01:42:51 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 7/9] protobuf: upgrade 4.22.2 -> 4.23.4
Date: Wed, 27 Sep 2023 10:42:40 +0200
Message-Id: <20230927084242.1195772-8-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230927084242.1195772-1-peron.clem@gmail.com>
References: <20230927084242.1195772-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 08:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105182

Bump protobuf to 4.23.4 to fix build with musl.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../0001-Fix-linking-error-with-ld-gold.patch | 69 -------------------
 ...{protobuf_4.22.2.bb => protobuf_4.23.4.bb} | 16 +++--
 2 files changed, 10 insertions(+), 75 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_4.22.2.bb => protobuf_4.23.4.bb} (85%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
deleted file mode 100644
index 2bc44c898..000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From a91130bb95528743a3f7253f8fe945b7505047d5 Mon Sep 17 00:00:00 2001
-From: Kyungjik Min <dp.min@lge.com>
-Date: Mon, 28 Dec 2020 15:56:09 +0900
-Subject: [PATCH] Fix linking error with ld-gold
-
-:Release Notes:
-
-:Detailed Notes:
-https://github.com/protocolbuffers/protobuf/issues/6113
-There's a bug in the CMake build leading it to not use the version
-scripts, which hides the problem (because all symbols are now public)
-but doesn't solve it properly.
-
-:Testing Performed:
-
-:QA Notes:
-N/A
-
-:Issues Addressed:
-[PLAT-130467] Fix build error for libgoogleassistant with latest
-              protobuf-3.11.4
-
----
-Upstream-Status: Pending
-
- src/libprotobuf-lite.map | 2 ++
- src/libprotobuf.map      | 2 ++
- src/libprotoc.map        | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/src/libprotobuf-lite.map b/src/libprotobuf-lite.map
-index 391554669..a1853ca6c 100644
---- a/src/libprotobuf-lite.map
-+++ b/src/libprotobuf-lite.map
-@@ -3,6 +3,8 @@
-     extern "C++" {
-       *google*;
-     };
-+    scc_info_*;
-+    descriptor_table_*;
- 
-   local:
-     *;
-diff --git a/src/libprotobuf.map b/src/libprotobuf.map
-index 391554669..a1853ca6c 100644
---- a/src/libprotobuf.map
-+++ b/src/libprotobuf.map
-@@ -3,6 +3,8 @@
-     extern "C++" {
-       *google*;
-     };
-+    scc_info_*;
-+    descriptor_table_*;
- 
-   local:
-     *;
-diff --git a/src/libprotoc.map b/src/libprotoc.map
-index 391554669..a1853ca6c 100644
---- a/src/libprotoc.map
-+++ b/src/libprotoc.map
-@@ -3,6 +3,8 @@
-     extern "C++" {
-       *google*;
-     };
-+    scc_info_*;
-+    descriptor_table_*;
- 
-   local:
-     *;
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
similarity index 85%
rename from meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
index b97da6ea6..1edc21cdf 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_4.22.2.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_4.23.4.bb
@@ -10,12 +10,11 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 DEPENDS = "zlib abseil-cpp"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "81f89d509d6771dcccb619cbe26ac86cec472582"
+SRCREV = "2c5fa078d8e86e5f4bd34e6f4c9ea9e8d7d4d44a"
 
-SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=22.x;protocol=https \
+SRC_URI = "gitsm://github.com/protocolbuffers/protobuf.git;branch=23.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
-           file://0001-Fix-linking-error-with-ld-gold.patch \
            "
 SRC_URI:append:mips:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
 SRC_URI:append:mipsel:toolchain-clang = " file://0001-Fix-build-on-mips-clang.patch "
@@ -51,13 +50,18 @@ do_compile_ptest() {
 	cp ${S}/${TEST_SRC_DIR}/*.proto "${B}/${TEST_SRC_DIR}/"
 	cp ${S}/${TEST_SRC_DIR}/*.py "${B}/${TEST_SRC_DIR}/"
 	cp ${S}/${TEST_SRC_DIR}/Makefile "${B}/${TEST_SRC_DIR}/"
+	# Adapt protobuf.pc
 	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot{includedir} |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Cflags:|Cflags: -I${S}/src |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Cflags:|Cflags: -I${WORKDIR}/recipe-sysroot${includedir} |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Libs:|Libs: -L${B}|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
-	sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot/usr/lib|' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|Libs:|Libs: -L${WORKDIR}/recipe-sysroot/usr/lib |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Libs:|Libs: -labsl_log_internal_check_op |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Libs:|Libs: -labsl_log_internal_message |' -i "${B}/${TEST_SRC_DIR}/protobuf.pc"
+	# Adapt uf8_range.pc
+	cp "${B}/third_party/utf8_range/utf8_range.pc" "${B}/${TEST_SRC_DIR}/utf8_range.pc"
+	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${B}/${TEST_SRC_DIR}/utf8_range.pc"
+	sed -e 's|Libs:|Libs= -L${B}/third_party/utf8_range |' -i "${B}/${TEST_SRC_DIR}/utf8_range.pc"
 	# Until out-of-tree build of examples is supported, we have to use this approach
 	sed -e 's|../src/google/protobuf/.libs/timestamp.pb.o|${B}/CMakeFiles/libprotobuf.dir/src/google/protobuf/timestamp.pb.cc.o|' -i "${B}/${TEST_SRC_DIR}/Makefile"
 	export PKG_CONFIG_PATH="${B}/${TEST_SRC_DIR}"
-- 
2.34.1


