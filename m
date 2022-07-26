Return-Path: <brgl@bgdev.pl>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC71CCA47E
	for <webhook@archiver.kernel.org>; Tue, 26 Jul 2022 12:45:23 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web12.6048.1658839514622503472
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 05:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20210112.gappssmtp.com header.s=20210112
 header.b=vM/rw/7H;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.128.41,
 mailfrom: brgl@bgdev.pl)
Received: by mail-wm1-f41.google.com with SMTP id v5so8676874wmj.0
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jul 2022 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6CiNTtOsEfFMG1j2FlOdAdmmEVZ5R6etqh4LyPSO/0=;
        b=vM/rw/7HFPME/D3D0nxs9beNB10ziG0xTcXCnUZ/ZukKXZGpm3O47KEFySMbjKOnkn
         1VMK+vu5fRI4g/6cDC2nzwRfQ8AuwGLIYxpyHzZTZB32ziR4Jr0rXtvIPh/1YiJ3z1TX
         aev4l0muGeYdOC0NaKhbWwAfarFfZN/M5o9DpLygU/m7gu3/6FaxSPOuUEfU7awoJOeL
         X/OWt3NEkj84VEXvO7vgsSK9GzejHweYMHTURyAZeLLlfJLAqxPGHVltMbbt5JemsFp4
         r/Z5Ep/KrQ8dmoMVTh1bMd83rJVHuxul78WQkRLrfGvbTV/6U+KMITuWMeFph8bUF2sY
         zGVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=M6CiNTtOsEfFMG1j2FlOdAdmmEVZ5R6etqh4LyPSO/0=;
        b=OEZYMYR4SAxQ+EHbGIhUIVkjoICypT4NWRDLCgstddQmJMR+gTpTwW6V91vtVHLYj9
         CTjaBLbXEyBZSj2EqMvoxg89qGEeC9KexkMELI3WxWL5RFYq6CNtyO/KaU2BCwsagoTZ
         YZqUBtIze8thuJ94wF6vQ2Iceq821iE/yFLR18bAmH+1yKs9xeh4G9fv2ZfqkJ3gVR6l
         m2pjFzhnpVzV9LyTByeSKi800F3eOfFwjlidpAhnmllV9s+Bnia8gVKIyG1Fg4ue+yiE
         dXzOsoD6eT9iYYAu2HDh1hDAXg/rFO2xqZOuytgIjLSDwMf+U9oBaGEaQ/sBXpvOjYqq
         c2sA==
X-Gm-Message-State: AJIora8VslROgQvzpScTalOJYhyFibzEKv/Dv+gKo4n3SHzP9c1NgU6v
	BzQIDE7KJz/w3LQWo0AS7QPNOA==
X-Google-Smtp-Source: 
 AGRyM1sAGn+vYylX+SxdcEuIobicbz2KO5N9605Irl+kfbsKe3P9s7OvF4gkFuOI2eIzxVKLu7PzTg==
X-Received: by 2002:a1c:f719:0:b0:3a3:15d4:5752 with SMTP id
 v25-20020a1cf719000000b003a315d45752mr25475742wmh.194.1658839512444;
        Tue, 26 Jul 2022 05:45:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:334:ac00:8dc0:c861:83a5:5660])
        by smtp.gmail.com with ESMTPSA id
 l7-20020a05600c4f0700b003a310fe1d75sm23859533wmq.38.2022.07.26.05.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 05:45:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: =?UTF-8?q?Eil=C3=ADs=20N=C3=AD=20Fhlannag=C3=A1in?=
 <elizabeth.flanagan@huawei.com>,
	yocto@lists.yoctoproject.org,
	openembedded-devel@lists.openembedded.org,
	Jon Mason <jdmason@kudzu.us>,
	Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
Subject: [meta-zephyr][PATCH v2] zephyr-kernel-src: bump the v3 version to
 v3.1.0
Date: Tue, 26 Jul 2022 14:45:10 +0200
Message-Id: <20220726124510.74315-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 26 Jul 2022 12:45:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97988

From: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>

This upgrades the 3.x series to using v3.1.0.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@huawei.com>
---
- add a rebased version of the toolchain patch for v3.1

 ... 0001-2.7-cmake-add-yocto-toolchain.patch} |  0
 .../0001-3.1-cmake-add-yocto-toolchain.patch  | 63 +++++++++++++++
 .../zephyr-kernel/zephyr-kernel-src-2.7.2.inc |  7 +-
 .../zephyr-kernel/zephyr-kernel-src-3.0.0.inc | 70 -----------------
 .../zephyr-kernel/zephyr-kernel-src-3.1.0.inc | 76 +++++++++++++++++++
 .../zephyr-kernel/zephyr-kernel-src.inc       |  5 +-
 6 files changed, 146 insertions(+), 75 deletions(-)
 rename meta-zephyr-core/recipes-kernel/zephyr-kernel/files/{0001-cmake-add-yocto-toolchain.patch => 0001-2.7-cmake-add-yocto-toolchain.patch} (100%)
 create mode 100644 meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-3.1-cmake-add-yocto-toolchain.patch
 delete mode 100644 meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.inc
 create mode 100644 meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.1.0.inc

diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-cmake-add-yocto-toolchain.patch b/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-2.7-cmake-add-yocto-toolchain.patch
similarity index 100%
rename from meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-cmake-add-yocto-toolchain.patch
rename to meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-2.7-cmake-add-yocto-toolchain.patch
diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-3.1-cmake-add-yocto-toolchain.patch b/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-3.1-cmake-add-yocto-toolchain.patch
new file mode 100644
index 0000000..a16eabf
--- /dev/null
+++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/files/0001-3.1-cmake-add-yocto-toolchain.patch
@@ -0,0 +1,63 @@
+From 39f1dd116d00b6c2135c4ccd216341dcd2f2917e Mon Sep 17 00:00:00 2001
+From: Naveen Saini <naveen.kumar.saini@intel.com>
+Date: Tue, 26 Jul 2022 14:12:18 +0200
+Subject: [PATCH] cmake: add yocto toolchain
+
+Upstream status: inappropriate [OE specific]
+
+Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
+---
+ cmake/compiler/gcc/target.cmake     |  7 -------
+ cmake/toolchain/yocto/generic.cmake | 13 +++++++++++++
+ cmake/toolchain/yocto/target.cmake  |  1 +
+ 3 files changed, 14 insertions(+), 7 deletions(-)
+ create mode 100644 cmake/toolchain/yocto/generic.cmake
+ create mode 100644 cmake/toolchain/yocto/target.cmake
+
+diff --git a/cmake/compiler/gcc/target.cmake b/cmake/compiler/gcc/target.cmake
+index 014447e67e..b510f47d59 100644
+--- a/cmake/compiler/gcc/target.cmake
++++ b/cmake/compiler/gcc/target.cmake
+@@ -94,13 +94,6 @@ execute_process(
+   OUTPUT_STRIP_TRAILING_WHITESPACE
+   )
+ 
+-assert_exists(LIBGCC_FILE_NAME)
+-
+-get_filename_component(LIBGCC_DIR ${LIBGCC_FILE_NAME} DIRECTORY)
+-
+-assert_exists(LIBGCC_DIR)
+-
+-LIST(APPEND LIB_INCLUDE_DIR "-L\"${LIBGCC_DIR}\"")
+ LIST(APPEND TOOLCHAIN_LIBS gcc)
+ 
+ # For CMake to be able to test if a compiler flag is supported by the
+diff --git a/cmake/toolchain/yocto/generic.cmake b/cmake/toolchain/yocto/generic.cmake
+new file mode 100644
+index 0000000000..45e5777e2a
+--- /dev/null
++++ b/cmake/toolchain/yocto/generic.cmake
+@@ -0,0 +1,13 @@
++set(COMPILER gcc)
++set(LINKER ld)
++set(BINTOOLS gnu)
++
++set(ZEPHYR_SYSROOT ${ZEPHYR_SYSROOT})
++set(SYSROOT_DIR ${ZEPHYR_SYSROOT})
++set(LIBC_LIBRARY_DIR "\"${SYSROOT_DIR}\"/")
++set(LIBC_INCLUDE_DIR ${SYSROOT_DIR}/include)
++LIST(APPEND TOOLCHAIN_LIBS gcc)
++
++LIST(APPEND LIB_INCLUDE_DIR "-L\"${STAGING_LIBDIR}\"")
++
++set(TOOLCHAIN_LIBS gcc)
+diff --git a/cmake/toolchain/yocto/target.cmake b/cmake/toolchain/yocto/target.cmake
+new file mode 100644
+index 0000000000..9881313609
+--- /dev/null
++++ b/cmake/toolchain/yocto/target.cmake
+@@ -0,0 +1 @@
++# SPDX-License-Identifier: Apache-2.0
+-- 
+2.34.1
+
diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.2.inc b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.2.inc
index 7a4da21..537a565 100644
--- a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.2.inc
+++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-2.7.2.inc
@@ -62,4 +62,9 @@ SRCREV_tfm = "c74be3890c9d975976fde1b1a3b2f5742bec34c0"
 ZEPHYR_BRANCH = "v2.7-branch"
 PV = "2.7.2+git${SRCPV}"
 
-SRC_URI:append = " file://dtc.patch"
+SRC_URI:append = " \
+    file://dtc.patch \
+    file://0001-x86-fix-efi-binary-generation-issue-in-cross-compila.patch \
+    file://0001-2.7-cmake-add-yocto-toolchain.patch \
+    git://github.com/zephyrproject-rtos/hal_cypress.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/cypress;name=cypress \
+"
diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.inc b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.inc
deleted file mode 100644
index 64594a0..0000000
--- a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.0.0.inc
+++ /dev/null
@@ -1,70 +0,0 @@
-SRCREV_FORMAT = "default_cmsis"
-
-#
-# Generated with:
-#
-# #!/usr/bin/python3
-#
-# import yaml
-# import sys
-#
-# if __name__ == "__main__":
-#     with open(sys.argv[1], "r") as fd:
-#         data = yaml.safe_load(fd)
-#
-#         for project in data["manifest"]["projects"]:
-#             print("SRCREV_{} = \"{}\"".format(project["name"], project["revision"]))
-#
-
-SRCREV_default = "4f8d78ceeb436e82f528511998515f6fc137c6cd"
-SRCREV_canopennode = "1052dae561497bef901f931ef75e117c9224aecd"
-SRCREV_civetweb = "094aeb41bb93e9199d24d665ee43e9e05d6d7b1c"
-SRCREV_cmsis = "b0612c97c1401feeb4160add6462c3627fe90fc7"
-SRCREV_edtt = "1fc2e6f7d2a01a01074456f2ef2ccf1f3df7fac1"
-SRCREV_fatfs = "09a9d913c61dccbb8ff92d8943b452c614ac5292"
-SRCREV_fff = "6ce5ba26486e93d5b7696a3e23f0585932c14b16"
-SRCREV_altera = "23c1c1dd7a0c1cc9a399509d1819375847c95b97"
-SRCREV_atmel = "9f78f520f6cbb997e5b44fe8ab17dd5bf2448095"
-SRCREV_cypress = "81a059f21435bc7e315bccd720da5a9b615bbb50"
-SRCREV_espressif = "bcd7565ffa390d5774dc2fbe71a002faa9a7d082"
-SRCREV_gigadevice = "242a7f4be7a3136606c7a65169775f7ef85ad444"
-SRCREV_infineon = "f1fa8241f8786198ba41155413243de36ed878a5"
-SRCREV_microchip = "870d05e6a64ea9548da6b907058b03c8c9420826"
-SRCREV_nordic = "a42b016d7c7610489f5f8c79773fedc05ba352ee"
-SRCREV_nuvoton = "b4d31f33238713a568e23618845702fadd67386f"
-SRCREV_nxp = "9629f15fd80169cc9669e3fbb1260467c3aeb175"
-SRCREV_openisa = "40d049f69c50b58ea20473bee14cf93f518bf262"
-SRCREV_quicklogic = "b3a66fe6d04d87fd1533a5c8de51d0599fcd08d0"
-SRCREV_rpi_pico = "191f5ba46fda49523cdaaef27583d1c875ba2c36"
-SRCREV_silabs = "be39d4eebeddac6e18e9c0c3ba1b31ad1e82eaed"
-SRCREV_st = "575de9d461aa6f430cf62c58a053675377e700f3"
-SRCREV_stm32 = "300109f80730cb2477bfcc706a6602b9870336b3"
-SRCREV_telink = "ffcfd6282aa213f1dc0848dbca6279b098f6b143"
-SRCREV_ti = "1992a4c536554c4f409c36896eda6abdc414d277"
-SRCREV_xtensa = "0e577021bb66e644afd067cd9f7c71ab11b62b3d"
-SRCREV_libmetal = "f237c9d420a51cc43bc37d744e41191ad613f348"
-SRCREV_littlefs = "33509ed9c3d369cdb9d909cd40c5eea8f64a902c"
-SRCREV_loramac-node = "12019623bbad9eb54fe51066847a7cbd4b4eac57"
-SRCREV_lvgl = "783c1f78c8e39751fe89d0883c8bce7336f55e94"
-SRCREV_lz4 = "8e303c264fc21c2116dc612658003a22e933124d"
-SRCREV_mbedtls = "3e3e58a92de76069730c63e0d524f40fea948a61"
-SRCREV_mcuboot = "89936c338e46f43cb177a8b928cd80b90f3ace8f"
-SRCREV_mipi-sys-t = "d9da086b11cda494d85f4d8a9829f505c2d5e380"
-SRCREV_nanopb = "d148bd26718e4c10414f07a7eb1bd24c62e56c5d"
-SRCREV_net-tools = "f49bd1354616fae4093bf36e5eaee43c51a55127"
-SRCREV_nrf_hw_models = "b8cea37dbdc8fc58cc14b4e19fa850877a9da520"
-SRCREV_open-amp = "cfd050ff38a9d028dc211690b2ec35971128e45e"
-SRCREV_openthread = "b7aa7686d3f4e326bd25abc234b209159977c26d"
-SRCREV_segger = "3a52ab222133193802d3c3b4d21730b9b1f1d2f6"
-SRCREV_sof = "500d77e0ac84ac2c969e0d4b2142cca192e893bc"
-SRCREV_tflite-micro = "9156d050927012da87079064db59d07f03b8baf6"
-SRCREV_tinycbor = "40daca97b478989884bffb5226e9ab73ca54b8c4"
-SRCREV_tinycrypt = "3e9a49d2672ec01435ffbf0d788db6d95ef28de0"
-SRCREV_TraceRecorderSource = "e8ca3b6a83d19b2fc4738a0d9607190436e5e452"
-SRCREV_trusted-firmware-m = "5d32c3e64b3d589548e881eeeeb37d84944c90af"
-SRCREV_tf-m-tests = "52814181f0fde6d1422fac204d42cde30c62e40e"
-SRCREV_psa-arch-tests = "0aab24602cbef30f6422e7ef1066a8473073e586"
-SRCREV_zscilib = "12bfe3f0a9fcbfe3edab7eabc9678b6c62875d34"
-
-ZEPHYR_BRANCH = "v3.0-branch"
-PV = "3.0.0+git${SRCPV}"
diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.1.0.inc b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.1.0.inc
new file mode 100644
index 0000000..f38d7f9
--- /dev/null
+++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src-3.1.0.inc
@@ -0,0 +1,76 @@
+SRCREV_FORMAT = "default_cmsis"
+
+#
+# Generated with:
+#
+# #!/usr/bin/python3
+#
+# import yaml
+# import sys
+#
+# if __name__ == "__main__":
+#     with open(sys.argv[1], "r") as fd:
+#         data = yaml.safe_load(fd)
+#
+#         for project in data["manifest"]["projects"]:
+#             print("SRCREV_{} = \"{}\"".format(project["name"], project["revision"]))
+#
+
+SRCREV_default = "2ddd73feafd3316af2c547c34d6969bea637d5c6"
+SRCREV_canopennode = "53d3415c14d60f8f4bfca54bfbc5d5a667d7e724"
+SRCREV_chre = "0edfe2c2ec656afb910cfab8ed59a5ffd59b87c8"
+SRCREV_civetweb = "094aeb41bb93e9199d24d665ee43e9e05d6d7b1c"
+SRCREV_cmsis = "5f86244bad4ad5a590e084f0e72ba7a1416c2edf"
+SRCREV_edtt = "1ea61a390d2bfcf3b2ecdba8f8b0b98dfdffbd11"
+SRCREV_fatfs = "a30531af3a95a9a3ea7d771ea8a578ebfed45514"
+SRCREV_fff = "6ce5ba26486e93d5b7696a3e23f0585932c14b16"
+SRCREV_altera = "0d225ddd314379b32355a00fb669eacf911e750d"
+SRCREV_atmel = "78c5567c05b6b434dd7d98f49156319df4217bac"
+SRCREV_espressif = "df85671c5d0405c0747c2939c8dfe808b7e4cf38"
+SRCREV_gigadevice = "63a72ca90b7e0d7257211ddc5c79e8c0b940371b"
+SRCREV_infineon = "4af06965f57ba1e7d170e6a97d24c33785543a8c"
+SRCREV_microchip = "5d079f1683a00b801373bbbbf5d181d4e33b30d5"
+SRCREV_nordic = "a85bb3676d61d1ae202088e0d3fec556056b2c9e"
+SRCREV_nuvoton = "b4d31f33238713a568e23618845702fadd67386f"
+SRCREV_nxp = "2302a1e94f5bc00ce59db4e249b688ad2e959f58"
+SRCREV_openisa = "40d049f69c50b58ea20473bee14cf93f518bf262"
+SRCREV_quicklogic = "b3a66fe6d04d87fd1533a5c8de51d0599fcd08d0"
+SRCREV_rpi_pico = "191f5ba46fda49523cdaaef27583d1c875ba2c36"
+SRCREV_silabs = "be39d4eebeddac6e18e9c0c3ba1b31ad1e82eaed"
+SRCREV_st = "52a522ca4a8a9ec1e9bb5bb514e1ab6f102863fe"
+SRCREV_stm32 = "51b373cd3455b8c2b9babbf6ff41918116a442ac"
+SRCREV_telink = "ffcfd6282aa213f1dc0848dbca6279b098f6b143"
+SRCREV_ti = "905a5d4134899630071f9383aadaaf266e8f8cd2"
+SRCREV_xtensa = "0e577021bb66e644afd067cd9f7c71ab11b62b3d"
+SRCREV_libmetal = "850a3c3fd5bc655987021dc9106d8e8cd0f7e061"
+SRCREV_liblc3codec = "3951cf1b71ff3be086c9b9b595e473e12301337c"
+SRCREV_littlefs = "652f2c5646e79b881e6f3099686ad3b7af9e216c"
+SRCREV_loramac-node = "12019623bbad9eb54fe51066847a7cbd4b4eac57"
+SRCREV_lvgl = "df717ac87a9fd80246cc8df24554475e59bda21f"
+SRCREV_lz4 = "8e303c264fc21c2116dc612658003a22e933124d"
+SRCREV_mbedtls = "7fed49c9b9f983ad6416986661ef637459723bcb"
+SRCREV_mcuboot = "e58ea98aec6e5539c5f872a98059e461d0155bbb"
+SRCREV_mipi-sys-t = "a5163c1800a5243f8b05d84c942da008df4cb666"
+SRCREV_nanopb = "d148bd26718e4c10414f07a7eb1bd24c62e56c5d"
+SRCREV_net-tools = "f49bd1354616fae4093bf36e5eaee43c51a55127"
+SRCREV_nrf_hw_models = "b8cea37dbdc8fc58cc14b4e19fa850877a9da520"
+SRCREV_open-amp = "8d53544871e1f300c478224faca6be8384ab0d04"
+SRCREV_openthread = "e2a765599aa0379d0f72f0149a9cbafec070c12d"
+SRCREV_segger = "3a52ab222133193802d3c3b4d21730b9b1f1d2f6"
+SRCREV_sof = "2efc3ea41c0074c6dab5f376fafaa26f52c25c75"
+SRCREV_tflite-micro = "9156d050927012da87079064db59d07f03b8baf6"
+SRCREV_tinycbor = "9e1f34bc08123aaad7666d3652aaa839e8178b3b"
+SRCREV_tinycrypt = "3e9a49d2672ec01435ffbf0d788db6d95ef28de0"
+SRCREV_TraceRecorderSource = "e8ca3b6a83d19b2fc4738a0d9607190436e5e452"
+SRCREV_trusted-firmware-m = "7c53a6e76130a85303f83b15d868a92fdcd5f5be"
+SRCREV_tf-m-tests = "c99a86b295c4887520da9d8402566d7f225c974e"
+SRCREV_psa-arch-tests = "a81f9da287569f169d60026916952641b233faa8"
+SRCREV_zcbor = "882c489a7d9fdfff31d27666914a78a9eb6976d7"
+SRCREV_zscilib = "fc979a8dcb74169c69b02835927bff8f070d6325"
+
+ZEPHYR_BRANCH = "v3.1-branch"
+PV = "3.1.0+git${SRCPV}"
+
+SRC_URI += " \
+    file://0001-3.1-cmake-add-yocto-toolchain.patch \
+"
diff --git a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
index bf9ceaf..e9b35c9 100644
--- a/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
+++ b/meta-zephyr-core/recipes-kernel/zephyr-kernel/zephyr-kernel-src.inc
@@ -19,7 +19,6 @@ SRC_URI = "\
     git://github.com/zephyrproject-rtos/fatfs.git;protocol=https;nobranch=1;destsuffix=git/modules/fs/fatfs;name=fatfs \
     git://github.com/zephyrproject-rtos/hal_altera.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/altera;name=altera \
     git://github.com/zephyrproject-rtos/hal_atmel.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/atmel;name=atmel \
-    git://github.com/zephyrproject-rtos/hal_cypress.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/cypress;name=cypress \
     git://github.com/zephyrproject-rtos/hal_espressif.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/espressif;name=espressif \
     git://github.com/zephyrproject-rtos/hal_infineon.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/infineon;name=infineon \
     git://github.com/zephyrproject-rtos/hal_microchip.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/microchip;name=microchip \
@@ -52,11 +51,9 @@ SRC_URI = "\
     git://github.com/zephyrproject-rtos/hal_telink.git;protocol=https;nobranch=1;destsuffix=git/modules/hal/telink;name=telink \
     git://github.com/zephyrproject-rtos/lz4.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/lz4;name=lz4 \
     git://github.com/zephyrproject-rtos/tflite-micro.git;protocol=https;nobranch=1;destsuffix=git/modules/lib/tflite-micro;name=tflite-micro \
-    file://0001-cmake-add-yocto-toolchain.patch \
-    file://0001-x86-fix-efi-binary-generation-issue-in-cross-compila.patch \
 "
 S = "${WORKDIR}/git"
 
 # Default to a stable version
-PREFERRED_VERSION_zephyr-kernel ??= "3.0.0"
+PREFERRED_VERSION_zephyr-kernel ??= "3.1.0"
 include zephyr-kernel-src-${PREFERRED_VERSION_zephyr-kernel}.inc
-- 
2.34.1


