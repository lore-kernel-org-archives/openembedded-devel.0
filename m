Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA25C5475B
	for <webhook@archiver.kernel.org>; Fri,  8 Mar 2024 15:22:17 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.24526.1709911328289301938
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 Mar 2024 07:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XxuYFsAI;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: alperyasinak1@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-412f988b601so16481495e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 07:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709911326; x=1710516126; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XWVZkO9NyeYQGnqrljY6O6pS0g8/K+p4rhEmG/vTDr0=;
        b=XxuYFsAIFO1pvQak3uCAHCk4BC8jQK41iMH4W1HlIchR20m6yob1+38TibttVpiwnE
         fe5eEHQItOMZRP3jnuMmK7Ztnwz6L7Ga1MdONJbZm8JmWd0HaFdHikUZ4OGIAhGmklQd
         7mpzZKcQtn9nAZXueFidvpqEihwPqrMwpghZhockcN3kmkxoUBzvFaVcIhRLI7EdUJSh
         PoiVyrz4xzEQ3an9HSZD6ynih7ooR6ehQMgB99kOWNtb+7Rvx2WTkfLwwyq3Xyqnvgls
         6C9wJipSmadmz9ddYplE7seZumRlGFqonZuiC5j/ac8R4EEck1ZT1YSvQNadJMPO1ajm
         4TSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709911326; x=1710516126;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XWVZkO9NyeYQGnqrljY6O6pS0g8/K+p4rhEmG/vTDr0=;
        b=kJ7oujk2xCjYzxKCjSKracT6vmF1UjKt1vBkPbKCPFI3p/nNfSdhmRen5+9DF/5uTB
         vjEyiZvwDwkmNL78UlWzAQlVe7GsheJ9BbInSCK/xw0B/wvWvW+mvgkRuvaVIxExCh/g
         jE1i5CXLpWsLaV/XnsunG93zbeIvMPkqZ1+IKEh/kwqtcjbe9hsAnigkM10cPbS/FoBf
         5ABDb5IgsYvw54HJ1P5ALsoapz07qU13e5WLwtkEv0MSoNuoBECFqVazakn93qXZTdPA
         cMDwA/4Fs5HqpmT+GQixn5jJyzVcqSW4WhDQeKYn0zZSO5j3qvkwsJqwU/bCrm+WQ0K/
         6xRw==
X-Gm-Message-State: AOJu0YwYr79MvY0cVvUNOyF0hJwH+KbdHKeaC9mLD+uowCvOh30lukPL
	jCCEhcrWKmywLgocw+LygAHO1MuxFkkeVvrWqzqmbYh0BSuU3E+zyPc+cK49514=
X-Google-Smtp-Source: AGHT+IGa3XETaHAOyLU0OFcO41priGRmViv6NJEOdV+J1zvMkA76ATHQzuRmr3JuarxZ73qWifRgfA==
X-Received: by 2002:a05:600c:444f:b0:412:efed:28e2 with SMTP id v15-20020a05600c444f00b00412efed28e2mr8031755wmn.41.1709911325901;
        Fri, 08 Mar 2024 07:22:05 -0800 (PST)
Received: from localhost.localdomain ([176.33.65.159])
        by smtp.gmail.com with ESMTPSA id l1-20020adfe9c1000000b0033e756ed840sm2263958wrn.47.2024.03.08.07.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 07:22:05 -0800 (PST)
From: alperak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: alperak <alperyasinak1@gmail.com>
Subject: [meta-oe][PATCH] remove obsolete PIP_INSTALL_PACKAGE and PIP_INSTALL_DIST_PATH
Date: Fri,  8 Mar 2024 18:21:07 +0300
Message-Id: <20240308152107.2890552-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 08 Mar 2024 15:22:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109231

All downloaded files and sstates for the recipes were cleaned, build was got from stratch and no errors were encoutered.

Signed-off-by: alperak <alperyasinak1@gmail.com>
---
 .../recipes-devtools/python/python3-distutils-extra_2.39.bb    | 2 --
 meta-oe/recipes-support/libiio/libiio_0.25.bb                  | 1 -
 meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb                    | 2 --
 .../recipes-connectivity/python-txws/python3-txws_0.9.1.bb     | 2 --
 meta-python/recipes-devtools/python/python3-astor_0.8.1.bb     | 1 -
 meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb  | 1 -
 meta-python/recipes-devtools/python/python3-dbussy_1.3.bb      | 2 --
 meta-python/recipes-devtools/python/python3-gcovr_7.2.bb       | 1 -
 meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb    | 1 -
 meta-python/recipes-devtools/python/python3-inotify_git.bb     | 3 ---
 .../python/python3-keras-applications_1.0.8.bb                 | 3 ---
 meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb      | 1 -
 .../recipes-devtools/python/python3-lrparsing_1.0.17.bb        | 1 -
 .../recipes-devtools/python/python3-marshmallow_3.21.1.bb      | 2 --
 meta-python/recipes-devtools/python/python3-monotonic_1.6.bb   | 2 --
 meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb | 3 ---
 meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb   | 3 ---
 meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb     | 1 -
 meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb  | 2 --
 meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb  | 2 --
 meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb  | 2 --
 meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb | 1 -
 meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb      | 2 --
 .../recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb  | 2 --
 meta-python/recipes-extended/python-cson/python3-cson_git.bb   | 2 --
 .../python-pykickstart/python3-pykickstart_3.48.bb             | 2 --
 26 files changed, 47 deletions(-)

diff --git a/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
index e129c18d6..a98dfab6d 100644
--- a/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
+++ b/meta-oe/recipes-devtools/python/python3-distutils-extra_2.39.bb
@@ -10,8 +10,6 @@ SRC_URI[sha256sum] = "723f24f4d65fc8d99b33a002fbbb3771d4cc9d664c97085bf37f3997ae
 
 inherit setuptools3
 
-PIP_INSTALL_PACKAGE = "python_distutils_extra"
-
 S = "${WORKDIR}/python-distutils-extra-${PV}"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-oe/recipes-support/libiio/libiio_0.25.bb b/meta-oe/recipes-support/libiio/libiio_0.25.bb
index 9f3fcc008..2c6d2b514 100644
--- a/meta-oe/recipes-support/libiio/libiio_0.25.bb
+++ b/meta-oe/recipes-support/libiio/libiio_0.25.bb
@@ -73,7 +73,6 @@ do_compile() {
     cmake_do_compile
 }
 
-PIP_INSTALL_PACKAGE = "pylibiio"
 do_install() {
     if ${@bb.utils.contains('PACKAGECONFIG', 'libiio-python3', 'true', 'false', d)}; then
         setuptools3_do_install
diff --git a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
index ef1b6e537..c5dfff225 100644
--- a/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
+++ b/meta-oe/recipes-test/cxxtest/cxxtest_4.4.bb
@@ -10,8 +10,6 @@ SRC_URI[sha256sum] = "1c154fef91c65dbf1cd4519af7ade70a61d85a923b6e0c0b007dc7f489
 
 inherit setuptools3
 
-PIP_INSTALL_DIST_PATH = "${B}/python/python3/dist"
-
 SETUPTOOLS_SETUP_PATH = "${S}/python"
 
 do_install:append() {
diff --git a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
index ef6375546..ab39606bd 100644
--- a/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
+++ b/meta-python/recipes-connectivity/python-txws/python3-txws_0.9.1.bb
@@ -17,5 +17,3 @@ SRCREV= "88cf6d9b9b685ffa1720644bd53c742afb10a414"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-
-PIP_INSTALL_PACKAGE = "txWS"
diff --git a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
index 54e43e375..bc3315f75 100644
--- a/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-astor_0.8.1.bb
@@ -10,7 +10,6 @@ SRC_URI = "git://github.com/berkerpeksag/astor.git;branch=master;protocol=https
 SRCREV ?= "c7553c79f9222e20783fe9bd8a553f932e918072"
 
 inherit setuptools3
-PIP_INSTALL_PACKAGE = "astor"
 
 S = "${WORKDIR}/git"
 
diff --git a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
index bcb68d771..ac76ccc96 100644
--- a/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
+++ b/meta-python/recipes-devtools/python/python3-dateutil_2.9.0.bb
@@ -7,7 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e3155c7bdc71f66e02678411d2abf996"
 SRC_URI[sha256sum] = "78e73e19c63f5b20ffa567001531680d939dc042bf7850431877645523c66709"
 
 PYPI_PACKAGE = "python-dateutil"
-PIP_INSTALL_PACKAGE = "python_dateutil"
 inherit pypi python_setuptools_build_meta
 
 PACKAGES =+ "${PN}-zoneinfo"
diff --git a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
index b1ba95392..59da4545a 100644
--- a/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
+++ b/meta-python/recipes-devtools/python/python3-dbussy_1.3.bb
@@ -12,8 +12,6 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-PIP_INSTALL_PACKAGE = "DBussy"
-
 RDEPENDS:${PN} += "\
     python3-asyncio \
     python3-core \
diff --git a/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb b/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
index 2965e2f09..8a61a2de0 100644
--- a/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
+++ b/meta-python/recipes-devtools/python/python3-gcovr_7.2.bb
@@ -10,7 +10,6 @@ SRCREV = "c4b74b0859611283be646d590c7915e787911b6f"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-PIP_INSTALL_PACKAGE = "gcovr"
 
 RDEPENDS:${PN} += "python3-jinja2 python3-lxml python3-setuptools python3-pygments python3-multiprocessing"
 
diff --git a/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
index bdf4fc538..ceba10b65 100644
--- a/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-geomet_1.1.0.bb
@@ -13,7 +13,6 @@ SRC_URI = "git://github.com/geomet/geomet.git;protocol=https;branch=master"
 SRCREV = "6ac73c312b52aca328db2e61d90c5e363b62639f"
 
 inherit setuptools3
-PIP_INSTALL_PACKAGE = "geomet"
 
 RDEPENDS:${PN} += "\
     python3-click \
diff --git a/meta-python/recipes-devtools/python/python3-inotify_git.bb b/meta-python/recipes-devtools/python/python3-inotify_git.bb
index 657f610bd..582599bca 100644
--- a/meta-python/recipes-devtools/python/python3-inotify_git.bb
+++ b/meta-python/recipes-devtools/python/python3-inotify_git.bb
@@ -16,9 +16,6 @@ SRCREV = "9be6a51d1660991562eefaaddefa757ca0e0e00f"
 S = "${WORKDIR}/git"
 
 inherit setuptools3 ptest
-PIP_INSTALL_PACKAGE = "inotify"
-PIP_INSTALL_DIST_PATH = "${S}/dist"
-
 
 RDEPENDS:${PN} += " \
     python3-ctypes \
diff --git a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
index 6c2af0d4e..ba1819979 100644
--- a/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
+++ b/meta-python/recipes-devtools/python/python3-keras-applications_1.0.8.bb
@@ -7,11 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=366e2fd3c9714f162d3663b6f97cfe41"
 SRC_URI = "git://github.com/keras-team/keras-applications.git;branch=master;protocol=https"
 SRCREV ?= "3b180cb10eda683dda7913ecee2e6487288d292d"
 
-
 inherit setuptools3
 
-PIP_INSTALL_PACKAGE = "Keras_Applications"
-
 S = "${WORKDIR}/git"
 
 BBCLASSEXTEND = "native"
diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
index 9e791c6e7..991aa0f7d 100644
--- a/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
+++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
@@ -5,7 +5,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=6d3bc49400e35d5a2279d14c40dcfb09"
 
 inherit setuptools3 pkgconfig features_check
-PIP_INSTALL_PACKAGE = "Kivy"
 
 # Kivy's setup files only look for GLES libraries for Android, iOS, RPi,
 # and mali-based OS's. We need to patch the setup file to tell Kivy setup
diff --git a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
index 673d32c2d..8cd60d3a0 100644
--- a/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
+++ b/meta-python/recipes-devtools/python/python3-lrparsing_1.0.17.bb
@@ -17,7 +17,6 @@ RDEPENDS:${PN} = " \
 "
 
 inherit setuptools3
-PIP_INSTALL_PACKAGE = "lrparsing"
 
 S = "${WORKDIR}/lrparsing-${PV}"
 
diff --git a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
index 5a0a79a54..bf1d8dd29 100644
--- a/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
+++ b/meta-python/recipes-devtools/python/python3-marshmallow_3.21.1.bb
@@ -10,8 +10,6 @@ SRC_URI[sha256sum] = "4e65e9e0d80fc9e609574b9983cf32579f305c718afb30d7233ab81857
 
 inherit python_flit_core pypi ptest
 
-PIP_INSTALL_PACKAGE = "marshmallow"
-
 SRC_URI += " \
         file://run-ptest \
 "
diff --git a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
index 2af7b5792..aacc32a6d 100644
--- a/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
+++ b/meta-python/recipes-devtools/python/python3-monotonic_1.6.bb
@@ -11,5 +11,3 @@ SRC_URI = "git://github.com/atdt/monotonic.git;branch=master;protocol=https"
 S = "${WORKDIR}/git"
 
 inherit setuptools3
-
-PIP_INSTALL_PACKAGE = "monotonic"
diff --git a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
index f3e071108..50dae7b40 100644
--- a/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
+++ b/meta-python/recipes-devtools/python/python3-pefile_2023.2.7.bb
@@ -7,9 +7,6 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=38066667888b01d8118ff9cc23da1873"
 inherit setuptools3 pypi ptest
 SRC_URI[sha256sum] = "82e6114004b3d6911c77c3953e3838654b04511b8b66e8583db70c65998017dc"
 
-PIP_INSTALL_PACKAGE = "pefile"
-PIP_INSTALL_DIST_PATH = "${S}/dist"
-
 BBCLASSEXTEND = "native nativesdk"
 
 RDEPENDS:${PN} += " \
diff --git a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
index 91b02ea01..e795bd491 100644
--- a/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pillow_10.1.0.bb
@@ -14,9 +14,6 @@ SRCREV ?= "da59ad000d1405eaecd557175e29083a87d19f7c"
 
 inherit setuptools3 ptest
 
-PIP_INSTALL_PACKAGE = "Pillow"
-PIP_INSTALL_DIST_PATH = "${S}/dist"
-
 DEPENDS += " \
     zlib \
     jpeg \
diff --git a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
index a45ef45f3..a4732993f 100644
--- a/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
+++ b/meta-python/recipes-devtools/python/python3-prctl_1.8.1.bb
@@ -15,7 +15,6 @@ SRC_URI = "git://github.com/seveas/python-prctl;protocol=https;branch=main \
            file://0001-support-cross-complication.patch \
 "
 inherit setuptools3 python3native
-PIP_INSTALL_PACKAGE = "python_prctl"
 
 DEPENDS += "libcap"
 
diff --git a/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb b/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
index 97985a8a1..5be6e6319 100644
--- a/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
+++ b/meta-python/recipes-devtools/python/python3-pymetno_0.12.0.bb
@@ -9,8 +9,6 @@ S = "${WORKDIR}/git"
 
 inherit setuptools3
 
-PIP_INSTALL_PACKAGE = "PyMetno"
-
 RDEPENDS:${PN} = "\
 	python3-aiohttp (>=3.6.1) \
 	python3-async-timeout (>=3.0.1) \
diff --git a/meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb b/meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb
index dcde77db0..e9000dd47 100644
--- a/meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb
+++ b/meta-python/recipes-devtools/python/python3-pymisp_2.4.186.bb
@@ -7,8 +7,6 @@ SRC_URI[sha256sum] = "bdf2d54b297ad890418179b044dd4ea79821fccef723823919d12262e9
 
 inherit python_poetry_core pypi
 
-PIP_INSTALL_PACKAGE = "pymisp"
-
 RDEPENDS:${PN} += " \
     python3-dateutil \
     python3-json \
diff --git a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
index 7a9663514..2807c054d 100644
--- a/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
+++ b/meta-python/recipes-devtools/python/python3-pyruvate_1.2.1.bb
@@ -24,8 +24,6 @@ S = "${WORKDIR}/git"
 
 inherit python_setuptools3_rust cargo-update-recipe-crates
 
-PIP_INSTALL_DIST_PATH = "${S}/dist"
-
 # crossbeam-* -> std::sync::atomic AtomicI64, AtomicU64
 # not supported on mips/powerpc with 32-bit pointers
 # https://doc.rust-lang.org/std/sync/atomic/#portability
diff --git a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
index 7373b02f5..b6680568b 100644
--- a/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
+++ b/meta-python/recipes-devtools/python/python3-slip-dbus_0.6.5.bb
@@ -34,4 +34,3 @@ RDEPENDS:${PN} += "\
 CLEANBROKEN = "1"
 
 inherit setuptools3
-PIP_INSTALL_PACKAGE = "slip"
diff --git a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
index 8a9af14d3..aedf483be 100644
--- a/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
+++ b/meta-python/recipes-devtools/python/python3-xlrd_2.0.1.bb
@@ -17,8 +17,6 @@ SRCREV = "b8d573e11ec149da695d695c81a156232b89a949"
 S = "${WORKDIR}/git"
 
 inherit ptest setuptools3
-PIP_INSTALL_PACKAGE = "xlrd"
-PIP_INSTALL_DIST_PATH = "${S}/dist"
 
 RDEPENDS:${PN} += " \
     python3-compression \
diff --git a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb
index b6e04e081..7c30f5630 100644
--- a/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb
+++ b/meta-python/recipes-extended/python-blivet/python3-blivetgui_2.4.2.bb
@@ -13,8 +13,6 @@ S = "${WORKDIR}/git"
 inherit features_check setuptools3
 REQUIRED_DISTRO_FEATURES = "x11 systemd gobject-introspection-data"
 
-PIP_INSTALL_PACKAGE = "blivet_gui"
-
 RDEPENDS:${PN} = "python3-pygobject python3 \
                   python3-blivet gtk+3  \
                   python3-pid libreport \
diff --git a/meta-python/recipes-extended/python-cson/python3-cson_git.bb b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
index aba1d8fff..489733c76 100644
--- a/meta-python/recipes-extended/python-cson/python3-cson_git.bb
+++ b/meta-python/recipes-extended/python-cson/python3-cson_git.bb
@@ -18,8 +18,6 @@ RDEPENDS:${PN} = "python3-json"
 
 inherit setuptools3
 
-PIP_INSTALL_PACKAGE = "python_cson"
-
 do_configure:prepend() {
     echo "__version__=${PV}" > ${S}/version.py
 }
diff --git a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
index 3c6c47832..953068f7c 100644
--- a/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
+++ b/meta-python/recipes-extended/python-pykickstart/python3-pykickstart_3.48.bb
@@ -23,5 +23,3 @@ SRCREV = "fa6c80c0e5c6bee29d089899a10d26e6f7f8afd8"
 UPSTREAM_CHECK_GITTAGREGEX = "r(?P<pver>\d+(\.\d+)+(-\d+)*)"
 
 inherit setuptools3
-PIP_INSTALL_PACKAGE = "pykickstart"
-PIP_INSTALL_DIST_PATH = "${S}/dist"
-- 
2.25.1


