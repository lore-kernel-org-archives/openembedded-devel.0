Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54CB9C433EF
	for <webhook@archiver.kernel.org>; Wed,  6 Jul 2022 12:01:03 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com
 [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web08.5324.1657108855589731881
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 05:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Eknv2/2V;
 spf=pass (domain: gmail.com, ip: 209.85.210.175,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id l124so3789921pfl.8
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Jul 2022 05:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FQIhnDxLS2Rfc08T3suHXbth9AtGLDrOFKhHIsM8Y30=;
        b=Eknv2/2VZrXLmO2V1kXgya8bxOmzXpRQqSiiSb2bxt8qSI/G2Iclt6zdcN9dbvbyI8
         vOsk8J/YoV1/f44iYODYy7RYVtLv8rKnUUKLAY0G6ocgDl2zr8Q/DZtUROwvtapDhat7
         NZiPDh8qVJn9fsdJYb/+ESvlxKEkkLo3GXu9xNL27kfCfhz1m980RZdypdkyco8iDKvW
         THCD0ievFRo2NjS6JXIOhhhUI6Xy/j0b3k7VFpu0cOePzL1lOdp6pfLiWvP24BhCfBIJ
         HBCSYFTZFQVblUkFpekimMItY+pBlw+9GesS8xVzEATAEJfUtuObqbBnkDfQsMkH6H6L
         zrxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FQIhnDxLS2Rfc08T3suHXbth9AtGLDrOFKhHIsM8Y30=;
        b=Y4gp5/naoWq8/oXGeJFCcKcxUyZVvr3Klp62TYDfe54sLMBsRf2OJZLcm1FGbkhUKY
         n1TxmG4MtBSUhd2dCqiK0YTsnOMMVStWq2y0iGb+3SpN9fv4RqUSXE6uxOosQkOd5pCN
         P9ymxPBOJ19I1+1gbviLd6Qne/wWh6NGT6UWpYI483GuOtIx4Mj98WXkYF2bAVpDMy0x
         w32amRUexXF44EsDz7z44VM8HIsuQTy/1xQeCJddCqKxfaWbk1UEm6ZaaMGETyiRWiQe
         WYri9iKlGHG3EQz8l1zEe1jJWVQlMtIZEqWPJk/BfLEhliVeuAtqmn/pxhHDnHU9IOln
         QiQw==
X-Gm-Message-State: AJIora9DbSlxjdYCIcZjJG60HD286I+9P888IeRV8pL4j/IMpmnz9t6Z
	1Wx2wJwzybQtLUTYaUZnBqy5Z5ohIE54TQ==
X-Google-Smtp-Source: 
 AGRyM1vsjdAqjX2erCb/LXru2AOlNuQ1vnQPaQGiVPqvhYQbMRhNUZqg2QodKfCF/e/0r9yRUR4Unw==
X-Received: by 2002:a05:6a00:84f:b0:525:61b3:c8e1 with SMTP id
 q15-20020a056a00084f00b0052561b3c8e1mr47467551pfk.86.1657108854659;
        Wed, 06 Jul 2022 05:00:54 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::3bff])
        by smtp.gmail.com with ESMTPSA id
 oa14-20020a17090b1bce00b001efa205dcf2sm2919411pjb.54.2022.07.06.05.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 05:00:53 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] fontforge: Upgrade to 20220308
Date: Wed,  6 Jul 2022 05:00:50 -0700
Message-Id: <20220706120050.1461724-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220706120050.1461724-1-raj.khem@gmail.com>
References: <20220706120050.1461724-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Jul 2022 12:01:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97731

Switch build system to cmake
Add patch to avoid hardcoding build paths in scripts
Forward port musl patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ntforgeexe-Use-env-to-find-fontforge.patch | 29 +++++++++++++++++++
 ...de-sys-select-on-non-glibc-platforms.patch | 11 ++-----
 ...orge_20190801.bb => fontforge_20220308.bb} | 17 ++++++-----
 3 files changed, 41 insertions(+), 16 deletions(-)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/0001-fontforgeexe-Use-env-to-find-fontforge.patch
 rename meta-oe/recipes-graphics/fontforge/{fontforge_20190801.bb => fontforge_20220308.bb} (68%)

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/0001-fontforgeexe-Use-env-to-find-fontforge.patch b/meta-oe/recipes-graphics/fontforge/fontforge/0001-fontforgeexe-Use-env-to-find-fontforge.patch
new file mode 100644
index 0000000000..e8c1a11d48
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/0001-fontforgeexe-Use-env-to-find-fontforge.patch
@@ -0,0 +1,29 @@
+From f5a19ad9b2aea85dab28e7c61ac39404631fad2d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 6 Jul 2022 04:54:23 -0700
+Subject: [PATCH] fontforgeexe: Use env to find fontforge
+
+This helps in avoiding to encode build paths into interpeter
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ fontforgeexe/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/fontforgeexe/CMakeLists.txt b/fontforgeexe/CMakeLists.txt
+index b2d663b88..e2a8fee54 100644
+--- a/fontforgeexe/CMakeLists.txt
++++ b/fontforgeexe/CMakeLists.txt
+@@ -118,7 +118,7 @@ if(UNIX)
+     foreach(_script fontimage.pe fontlint.pe sfddiff.pe)
+       get_filename_component(_output \"\${_script}\" NAME_WE)
+       file(READ \"${CMAKE_CURRENT_SOURCE_DIR}/\${_script}\" _input)
+-      file(WRITE \"${CMAKE_CURRENT_BINARY_DIR}/\${_output}\" \"#!\${CMAKE_INSTALL_PREFIX}/bin/fontforge -lang=ff\\n\${_input}\")
++      file(WRITE \"${CMAKE_CURRENT_BINARY_DIR}/\${_output}\" \"#!/usr/bin/env fontforge -lang=ff\\n\${_input}\")
+     endforeach()
+   " COMPONENT nativescripts)
+   install(FILES "${CMAKE_CURRENT_BINARY_DIR}/fontimage" "${CMAKE_CURRENT_BINARY_DIR}/fontlint" "${CMAKE_CURRENT_BINARY_DIR}/sfddiff"
+-- 
+2.37.0
+
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/0001-include-sys-select-on-non-glibc-platforms.patch b/meta-oe/recipes-graphics/fontforge/fontforge/0001-include-sys-select-on-non-glibc-platforms.patch
index 54ff7b76d2..27de27d57d 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge/0001-include-sys-select-on-non-glibc-platforms.patch
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/0001-include-sys-select-on-non-glibc-platforms.patch
@@ -11,19 +11,14 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  gdraw/gdraw.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/gdraw/gdraw.c b/gdraw/gdraw.c
-index 24591b778..217c63140 100644
 --- a/gdraw/gdraw.c
 +++ b/gdraw/gdraw.c
-@@ -32,7 +32,7 @@
+@@ -33,7 +33,7 @@
  #include "gkeysym.h"
  #include "ustring.h"
  
--#if __Mac || __FreeBSD__ || __NetBSD__ || __OpenBSD__ || __DragonFly__
-+#if __Mac || __FreeBSD__ || __NetBSD__ || __OpenBSD__ || __DragonFly__ || !defined(__GLIBC__)
+-#if __Mac
++#if __Mac || (defined(__linux__) && !defined(__GLIBC__))
  #  include <sys/select.h>
  #endif
  
--- 
-2.23.0
-
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
similarity index 68%
rename from meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
rename to meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
index cb5f4d5ea1..83bf82a448 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20220308.bb
@@ -6,25 +6,26 @@ LIC_FILES_CHKSUM = " \
     file://LICENSE;md5=d042f3d2a8fd7208b704a499168e3c89 \
 "
 
-DEPENDS = "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native"
+DEPENDS = "python3 glib-2.0 pango giflib tiff libxml2 jpeg libtool uthash gettext-native libspiro"
 DEPENDS:append:class-target = " libxi"
 
-inherit autotools pkgconfig python3native features_check gettext gtk-icon-cache mime mime-xdg
+inherit cmake pkgconfig python3native features_check gettext gtk-icon-cache mime mime-xdg
 
 REQUIRED_DISTRO_FEATURES:append:class-target = " x11"
 
-# tag 20190801
-SRCREV = "ac635b818e38ddb8e7e2e1057330a32b4e25476e"
+# tag 20220308
+SRCREV = "582bd41a9bf04326300fc02a677fe3610d6d3ccd"
 SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-include-sys-select-on-non-glibc-platforms.patch \
+           file://0001-fontforgeexe-Use-env-to-find-fontforge.patch \
 "
 S = "${WORKDIR}/git"
 
-EXTRA_OECONF += "--without-libuninameslist  --enable-python-scripting --enable-python-extension"
-EXTRA_OECONF:append:class-native = " with_x=no"
+EXTRA_OECMAKE = "-DENABLE_GUI=OFF -DENABLE_DOCS=OFF"
 
-LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
-BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI}"
+CFLAGS += "-fno-strict-aliasing"
+LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI} -lm"
+BUILD_LDFLAGS += "-lpython${PYTHON_BASEVERSION}${PYTHON_ABI} -lm"
 
 #do_configure:prepend() {
 # uthash sources are expected in uthash/src
-- 
2.37.0


