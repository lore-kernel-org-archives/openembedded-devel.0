Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48DDEC43334
	for <webhook@archiver.kernel.org>; Thu,  7 Jul 2022 20:55:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.2965.1657227335250865218
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 13:55:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=i6ZNTeXW;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id w185so18066423pfb.4
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Jul 2022 13:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=olzKIFomVzHSDLXGL4pOpfyY65KOf4SqacgupOxjO4c=;
        b=i6ZNTeXWS44WW6TjXIr+4zvLs/ThtgIn79gMQGmjkeN5AxP7uvDi6DkvKkGXQEbyRi
         RcqIwqDV+F49J+hnzNqLTURhfLe61Er3TkbqLh6kTYG27UNPWgxmu570Pfu61HEIGp3L
         9666dFyh6G88Qsd/CFXv2Eq/CzbEwZ/P+KTfEcGs+FbumbbJhKKpviO1yo5JmATit/k/
         SyMam2+7024/Ck21fw4ptQjqw6TW1jko5daSVc/fzq8bO7TQ2Qx/CfURBVBbdlij8NRg
         2cbMyW7K6ICpl4FjC60Q8xmVxXn5YokaqonQJzBNu4SXEItUzKC28UJFuls8RyKNvoK/
         MBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=olzKIFomVzHSDLXGL4pOpfyY65KOf4SqacgupOxjO4c=;
        b=r5WjmhT1NVqZ44rfCjDI+RaGoz/hOrGRRa/zTDDMbL8VwZr2C/gDNtOjGw354Nl9eQ
         o26x5E3aD2uZRUW8bdSxvPOYi5CqktFU4HVR+cX1iPcu/DevKl8azTfWjgmGUDhxaaRJ
         6640balA6Gg6uR9Twve3qbn8+/iXibP/jkaTBepSzEwgThEinaDpZ5vlceInL0/niBAs
         zRkhapKO6v7q/dQVkBnP6cxTRWnDgULmrVqq4BxhFQ2mBbNak2qeU2Rxri1qK3dW+JNW
         hNm7FjBrOxPZ5slz765GEKJTTrOxlo2aq+LM4a27mOtGOSAestfW7ILtnMmoknboi3Eu
         kLNw==
X-Gm-Message-State: AJIora86+SfjyhVDqFIbLLUy4sENTRExAOquOSr93tkZ59WlmMQWfNQq
	ZzLfXaJFCI8/yOqzQFKnVb5rVyJQVMX0Tw==
X-Google-Smtp-Source: 
 AGRyM1tQSgrtGd+TAzCimnugieSfRjSUqJ/VrJT5YBfpUm+Z3qCJ5kfeqHxXTvtztyPd8YNTeMwx9g==
X-Received: by 2002:a63:545e:0:b0:411:e700:c2ab with SMTP id
 e30-20020a63545e000000b00411e700c2abmr30322498pgm.315.1657227334304;
        Thu, 07 Jul 2022 13:55:34 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 n6-20020a63ee46000000b00411e700f615sm12214166pgk.36.2022.07.07.13.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 13:55:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] fontforge: Use alternate way to detect libm
Date: Thu,  7 Jul 2022 13:55:32 -0700
Message-Id: <20220707205532.1459169-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Jul 2022 20:55:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97782

libm is folded into libc in latest glibc and build fails to detect
it with given cmake mechanism, therefore use slighly different mechanism
which work on hosts with or without libm

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ake-Use-alternate-way-to-detect-libm.patch | 67 +++++++++++++++++++
 .../fontforge/fontforge_20220308.bb           |  7 +-
 2 files changed, 71 insertions(+), 3 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/0001-cmake-Use-alternate-way-to-detect-libm.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/0001-cmake-Use-alternate-way-to-detect-libm.patch b/meta-oe/recipes-graphics/fontforge/fontforge/0001-cmake-Use-alternate-way-to-detect-libm.patch
new file mode 100644
index 0000000000..dd799e7485
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/0001-cmake-Use-alternate-way-to-detect-libm.patch
@@ -0,0 +1,67 @@
+From 6d3c48d1b01943a467928235c3affbab463c25ab Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Thu, 7 Jul 2022 12:32:47 -0700
+Subject: [PATCH] cmake: Use alternate way to detect libm
+
+The standard package provided with MathLib cmake module does not work
+when libm is folded into libc starting glibc 2.35+
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ CMakeLists.txt                   | 7 ++++++-
+ contrib/fonttools/CMakeLists.txt | 2 +-
+ fontforge/CMakeLists.txt         | 2 +-
+ fontforgeexe/CMakeLists.txt      | 4 ++--
+ 4 files changed, 10 insertions(+), 5 deletions(-)
+
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -111,9 +111,14 @@ find_package_with_target(Intl REQUIRED)
+ find_package(GLIB 2.6 REQUIRED COMPONENTS gio gobject)
+ find_package(Iconv REQUIRED)
+ find_package(LibXml2 REQUIRED)
+-find_package(MathLib REQUIRED)
+ find_package(ZLIB REQUIRED)
+ 
++include(CheckLibraryExists)
++CHECK_LIBRARY_EXISTS(m pow "" HAVE_LIB_M)
++if (HAVE_LIB_M)
++    set(EXTRA_LIBS ${EXTRA_LIBS} m)
++endif (HAVE_LIB_M)
++
+ check_include_file(pthread.h HAVE_PTHREAD_H)
+ if(HAVE_PTHREAD_H)
+   find_package(Threads)
+--- a/contrib/fonttools/CMakeLists.txt
++++ b/contrib/fonttools/CMakeLists.txt
+@@ -15,6 +15,6 @@ add_executable(woff woff.c)
+ 
+ target_link_libraries(acorn2sfd PRIVATE fontforge)
+ target_link_libraries(dewoff PRIVATE ZLIB::ZLIB)
+-target_link_libraries(pcl2ttf PRIVATE MathLib::MathLib)
++target_link_libraries(pcl2ttf PRIVATE ${EXTRA_LIBS})
+ target_link_libraries(ttf2eps PRIVATE fontforge)
+ target_link_libraries(woff PRIVATE ZLIB::ZLIB)
+--- a/fontforge/CMakeLists.txt
++++ b/fontforge/CMakeLists.txt
+@@ -237,7 +237,7 @@ target_link_libraries(fontforge
+     GLIB::GLIB
+     Intl::Intl
+   PRIVATE
+-    MathLib::MathLib
++    ${EXTRA_LIBS}
+     Iconv::Iconv
+     ZLIB::ZLIB
+ )
+--- a/fontforgeexe/CMakeLists.txt
++++ b/fontforgeexe/CMakeLists.txt
+@@ -110,7 +110,7 @@ if(ENABLE_PYTHON_SCRIPTING_RESULT)
+   target_link_libraries(fontforgeexe PRIVATE Python3::Python)
+ endif()
+ 
+-target_link_libraries(fontforgeexe PRIVATE fontforge Iconv::Iconv MathLib::MathLib)
++target_link_libraries(fontforgeexe PRIVATE fontforge Iconv::Iconv ${EXTRA_LIBS})
+ install(TARGETS fontforgeexe RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
+ 
+ if(UNIX)
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
index 83bf82a448..c53f2db01b 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
@@ -18,14 +18,15 @@ SRCREV = "582bd41a9bf04326300fc02a677fe3610d6d3ccd"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-include-sys-select-on-non-glibc-platforms.patch \
            file://0001-fontforgeexe-Use-env-to-find-fontforge.patch \
+           file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
 "
 S = "${WORKDIR}/git"
 
-EXTRA_OECMAKE = "-DENABLE_GUI=OFF -DENABLE_DOCS=OFF"
+EXTRA_OECMAKE = "-DENABLE_DOCS=OFF"
 
 CFLAGS += "-fno-strict-aliasing"
-LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI} -lm"
-BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI} -lm"
+LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
+BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
 
 #do_configure:prepend() {
 # uthash sources are expected in uthash/src
-- 
2.37.0


