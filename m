Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C180C3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 06:51:53 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.12685.1704264710701663894
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 02 Jan 2024 22:51:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ekM3B6fG;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: alperyasinak1@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a27e323fdd3so218622366b.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 02 Jan 2024 22:51:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704264708; x=1704869508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PT/pC8vGwYSMzmf6Tbj+j2j1pME+XnB8sREr9bl/iXw=;
        b=ekM3B6fG/fLzq8K5rxcpaZc+joJ1hW9vBX9WyMdaPP8J74jFCdPEC8eyE+ji6w3Tsf
         qe7N3zKUqrpZ3K47jCI0Uhv0BZVSsSDLfHRVqFo/Oey3yBgTnNZsEqXqFMHVntTJ0nck
         cm0OF4hxwrGyv0UnrjAuWyqZvNz10e9ki58kOD7kVeSSfUT7cBeuJ43uuJgLRGXW25+w
         ypvK5hjd2zh1p/B1NXnrpld7pH5/c1Fkz1rg2vVGfV8qG5fuvbofP9UEgsOv+e4qNtwj
         gy3Zo7pLzli0Gd41VOQTn5EfWvHHjgCq+/H4840Gz9ZcSTGZZZfi64/tQQ+d3ruWb4VJ
         GciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704264708; x=1704869508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PT/pC8vGwYSMzmf6Tbj+j2j1pME+XnB8sREr9bl/iXw=;
        b=Z9a3BHLKWET4uvTCfCxFLnBoZXO7HSQAaWNDDAKiWMovo1phZ00A+j5eRpJ6S64Cw8
         xcvTS1/lAhOeOTt11A6pzldy9tGcAgyq0rq9JSzwvf3ZWM3aIpD6Q2F9dRF8PHxrTAw3
         fNk7tsuVm+7BSkGMG4PSgi6bXoXiY4A7s0nSdjvcxvugJS5LHE4EVFvsgHsMZ2BWBvJk
         37z9nwiGOmi1C0ApKkVt7AWRHuIOBKqYObuNr7jBF/bRHPrOZTw9EYST8rqGwcm1QpOj
         k3vlcjHRoMxPwMcFoa9p87JU/46lbUs58Fy/w926Hh7kT5KQphP8QRp7f6vzcea35m1I
         rHfA==
X-Gm-Message-State: AOJu0Yxubdaq8lRhzcjhHQ2aXKpK00/2c4dQ+ZC+CjRsbTlPS17McncQ
	RxtJ75B8ybR48JAAdF/FterjirytKxk=
X-Google-Smtp-Source: AGHT+IFBtOCDGN+kkE0sSOQRw+saBNK7LBEqrTy9TVIVFPy6h9SA+UoKVA/EZ9swt6VYvx+i7NEu5Q==
X-Received: by 2002:a17:907:9284:b0:a27:655f:a267 with SMTP id bw4-20020a170907928400b00a27655fa267mr5037808ejc.56.1704264708121;
        Tue, 02 Jan 2024 22:51:48 -0800 (PST)
Received: from localhost.localdomain ([176.33.71.193])
        by smtp.gmail.com with ESMTPSA id ie17-20020a170906df1100b00a26ac1363c8sm11801037ejc.94.2024.01.02.22.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 22:51:47 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] librdkafka: upgrade 1.8.2 -> 2.3.0
Date: Wed,  3 Jan 2024 09:51:45 +0300
Message-Id: <20240103065145.170716-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 03 Jan 2024 06:51:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108024

* License-Update: Copyright year changed
* 0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch dropped because fixed in the new version
* Fix -> WARNING: librdkafka-2.3.0-r0 do_package_qa: QA Issue: File /usr/lib/cmake/RdKafka/RdKafkaTargets.cmake in package librdkafka-dev contains reference to TMPDIR [buildpaths]

Changelog:

https://github.com/confluentinc/librdkafka/blob/v2.3.0/CHANGELOG.md

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch | 30 -------------------
 ...ibrdkafka_1.8.2.bb => librdkafka_2.3.0.bb} | 21 +++++++------
 2 files changed, 12 insertions(+), 39 deletions(-)
 delete mode 100644 meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
 rename meta-oe/recipes-support/librdkafka/{librdkafka_1.8.2.bb => librdkafka_2.3.0.bb} (59%)

diff --git a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch b/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
deleted file mode 100644
index 053a4cc2d..000000000
--- a/meta-oe/recipes-support/librdkafka/librdkafka/0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ed1dd35e0e23a98e57567718a0d474fd29cc348a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 19 Mar 2022 21:36:41 -0700
-Subject: [PATCH] cmake: Use CMAKE_INSTALL_LIBDIR
-
-this ensures that it is portable across platforms e.g. ppc64/linux
-uses lib64 not lib
-
-Upstream-Status: Submitted [https://github.com/edenhill/librdkafka/pull/3770]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d1129bce..774473fa 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -219,7 +219,7 @@ configure_file("packaging/cmake/config.h.in" "${GENERATED_DIR}/config.h")
- 
- include(GNUInstallDirs)
- 
--set(config_install_dir "lib/cmake/${PROJECT_NAME}")
-+set(config_install_dir "${CMAKE_INSTALL_LIBDIR}/cmake/${PROJECT_NAME}")
- 
- set(generated_dir "${CMAKE_CURRENT_BINARY_DIR}/generated")
- 
--- 
-2.35.1
-
diff --git a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb b/meta-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
similarity index 59%
rename from meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
rename to meta-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
index 6148e7cb0..5b6e94d56 100644
--- a/meta-oe/recipes-support/librdkafka/librdkafka_1.8.2.bb
+++ b/meta-oe/recipes-support/librdkafka/librdkafka_2.3.0.bb
@@ -5,19 +5,22 @@ HOMEPAGE = "https://github.com/edenhill/librdkafka"
 SECTION = "libs"
 LICENSE = "BSD-2-Clause"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=2be8675acbfdac48935e73897af5f646"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=40b04809b5d6f648f20f45143cbcb1ad"
 
-SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master \
-           file://0001-cmake-Use-CMAKE_INSTALL_LIBDIR.patch \
-          "
-SRCREV = "063a9ae7a65cebdf1cc128da9815c05f91a2a996"
+SRC_URI = "git://github.com/edenhill/librdkafka;protocol=https;branch=master"
+SRCREV = "95a542c87c61d2c45b445f91c73dd5442eb04f3c"
 
-DEPENDS = "zlib openssl zstd"
-
-inherit cmake
+DEPENDS = "zlib curl zstd openssl"
 
 S = "${WORKDIR}/git"
 
-FILES:${PN} += "${datadir}"
+inherit pkgconfig cmake
 
 EXTRA_OECMAKE += "-DRDKAFKA_BUILD_EXAMPLES=OFF -DRDKAFKA_BUILD_TESTS=OFF"
+
+do_install:append() {
+	# remove absolute paths
+	sed -i -e 's|${RECIPE_SYSROOT}||g' ${D}${libdir}/cmake/RdKafka/RdKafkaTargets.cmake
+}
+
+FILES:${PN} += "${datadir}"
-- 
2.25.1


