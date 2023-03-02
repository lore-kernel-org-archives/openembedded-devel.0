Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54959C678D4
	for <webhook@archiver.kernel.org>; Thu,  2 Mar 2023 04:22:07 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.7562.1677730920898613255
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 01 Mar 2023 20:22:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=KM9CJdu2;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id u5so12900629plq.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 01 Mar 2023 20:22:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DfSFbM+qH/bWzrVXYeho5s5mcEsfeJJ7zjXGkJKdNE=;
        b=KM9CJdu2UX7PBWiVoljlR1H+V7t7DQ/ohZjOQXCyGs+qL5NFRcmtnsxKg87N+Uemjz
         vsvCQqyqPexL/RQwqqPDQJGuKZm1u9WYt/kl7BCY9EfvdM7OzbLBqvw7mSl5UAoroa63
         SQq4qXGtYx8X/D9Ja/EYsL7ePPLZXY5pmBZRHJUsUZ0SZyRy2S5Q6nyh2fzebYPby/jr
         +ZWlXLiTmd0sTnviK/GSrUPm5g7P2tX2/Ehj9ABarC6yS7SiLZheUD+bozCWmtL6nG4q
         Ps2nM6S0XrHtRMbLSCEv6D0U+adArnXLBTBdidB6RrU18SRkcJibyEowzCyLlZZ09j1E
         nU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DfSFbM+qH/bWzrVXYeho5s5mcEsfeJJ7zjXGkJKdNE=;
        b=G545HWJtMt5E+x9KaWuk47CbUtTe5lX4AtifdfTPFpxh/kiTdjoYjHKO5E5BXEi7rr
         yc3bPWh07k2sxyZCCLP6OmsqR1fG0BROzkGBPtpw1S8bWoVDAo6RWgF/BoT8Gjg6Pb0s
         qDHkpLEVDNziByH49tC3ZoJVRVy5CgKFNfdTTXggVrFd8MeS2Mt27eygeomRMvCZadDP
         DLVd7Ex5s8Hg4+edWedjCtDpOQlhE0eWuUh4w/bievsv+x1hRt4AQfKUlLXKIqc9hWeA
         jZl2bHYZyHwvuKNgfO0w+hxRdpabOrnbepEdTHU2hrUBpgn8hqyWV79rpSlrZR97F6V9
         cSXQ==
X-Gm-Message-State: AO0yUKUfmzC1cX1vNkhEVQbzfvD0zYV24CmKMfQFjdifsa5IfAOInxR1
	i41n1+IK4xEtkRqthwx44TrFWJqkfVk=
X-Google-Smtp-Source: AK7set+NBFlGw1A3c4BC4WG1B7K0dr8aeIPQ4f8bU92kfev4aUiXC5GgLnZSTNSBi/kUY4xMWYqd6Q==
X-Received: by 2002:a17:902:b48f:b0:19e:2631:7c01 with SMTP id y15-20020a170902b48f00b0019e26317c01mr7071230plr.37.1677730919988;
        Wed, 01 Mar 2023 20:21:59 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::1ac4])
        by smtp.gmail.com with ESMTPSA id g3-20020a1709026b4300b00198e346c35dsm9223782plt.9.2023.03.01.20.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 20:21:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/3] hdf5: Upgrade to 1.14.0
Date: Wed,  1 Mar 2023 20:21:55 -0800
Message-Id: <20230302042156.1107335-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302042156.1107335-1-raj.khem@gmail.com>
References: <20230302042156.1107335-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Mar 2023 04:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101322

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../hdf5/files/0001-cmake-remove-build-flags.patch          | 6 +++---
 ...0002-Remove-suffix-shared-from-shared-library-name.patch | 2 +-
 .../recipes-support/hdf5/{hdf5_1.13.2.bb => hdf5_1.14.0.bb} | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)
 rename meta-oe/recipes-support/hdf5/{hdf5_1.13.2.bb => hdf5_1.14.0.bb} (91%)

diff --git a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
index 642d7d1662..a8050cc55b 100644
--- a/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
+++ b/meta-oe/recipes-support/hdf5/files/0001-cmake-remove-build-flags.patch
@@ -15,7 +15,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 
 --- a/config/cmake/libh5cc.in
 +++ b/config/cmake/libh5cc.in
-@@ -45,7 +45,7 @@ for arg in $@ ; do
+@@ -44,7 +44,7 @@ for arg in $@ ; do
        exit $status
        ;;
      *)
@@ -45,8 +45,8 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
                      H5_CPPFLAGS: @H5_CPPFLAGS@
                      AM_CPPFLAGS: @AM_CPPFLAGS@
                           CFLAGS: @CMAKE_C_FLAGS@
-@@ -52,8 +52,8 @@ Languages:
- @BUILD_FORTRAN_CONDITIONAL_TRUE@         Static Fortran Library: @H5_ENABLE_STATIC_LIB@
+@@ -53,8 +53,8 @@ Languages:
+ @BUILD_FORTRAN_CONDITIONAL_TRUE@               Module Directory: @CMAKE_Fortran_MODULE_DIRECTORY@
  
                              C++: @HDF5_BUILD_CPP_LIB@
 -@BUILD_CXX_CONDITIONAL_TRUE@                   C++ Compiler: @CMAKE_CXX_COMPILER@ @CMAKE_CXX_COMPILER_VERSION@
diff --git a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
index de052451bd..f0eb05a1e7 100644
--- a/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
+++ b/meta-oe/recipes-support/hdf5/files/0002-Remove-suffix-shared-from-shared-library-name.patch
@@ -12,7 +12,7 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -196,19 +196,19 @@ set (HDF5_HL_F90_C_LIB_TARGET     "${HDF
+@@ -191,19 +191,19 @@ set (HDF5_HL_F90_C_LIB_TARGET     "${HDF
  set (HDF5_JAVA_JNI_LIB_TARGET     "${HDF5_JAVA_JNI_LIB_CORENAME}")
  set (HDF5_JAVA_HDF5_LIB_TARGET    "${HDF5_JAVA_HDF5_LIB_CORENAME}")
  set (HDF5_JAVA_TEST_LIB_TARGET    "${HDF5_JAVA_TEST_LIB_CORENAME}")
diff --git a/meta-oe/recipes-support/hdf5/hdf5_1.13.2.bb b/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
similarity index 91%
rename from meta-oe/recipes-support/hdf5/hdf5_1.13.2.bb
rename to meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
index 80611c6714..4feec61afd 100644
--- a/meta-oe/recipes-support/hdf5/hdf5_1.13.2.bb
+++ b/meta-oe/recipes-support/hdf5/hdf5_1.14.0.bb
@@ -12,11 +12,11 @@ inherit cmake siteinfo qemu
 DEPENDS += "qemu-native"
 
 SRC_URI = " \
-    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.13/hdf5-${PV}/src/${BPN}-${PV}.tar.bz2 \
+    https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.14/hdf5-${PV}/src/${BPN}-${PV}.tar.bz2 \
     file://0002-Remove-suffix-shared-from-shared-library-name.patch \
     file://0001-cmake-remove-build-flags.patch \
 "
-SRC_URI[sha256sum] = "9c51b3da426977ec622a43dca8adaf4e81eabf838c1ff80c6225ad1d3ed54b5c"
+SRC_URI[sha256sum] = "e4e79433450edae2865a4c6328188bb45391b29d74f8c538ee699f0b116c2ba0"
 
 FILES:${PN} += "${libdir}/libhdf5.settings ${datadir}/*"
 
-- 
2.39.2


