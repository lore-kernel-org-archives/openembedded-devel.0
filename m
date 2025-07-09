Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AA6EC83F0F
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 17:31:36 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.3026.1752082287797460247
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jul 2025 10:31:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c1UP8W8z;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b60de463so56773e87.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 10:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752082285; x=1752687085; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XEVOg8awUVziPWxUcgUh6JXWqxoNySqku+ut2WkXh7Y=;
        b=c1UP8W8zcSKfpJ6+okFzVAyYW6VVtBFXTsz1MJNsyy2P0MKF72TZVjbIosXVe1Q/Cq
         ig6SNBMXYNJjNSbrXooheOK6bocgDY/XJlZI5Rjhe30mWTDeHFnFCAgkmg2E0AnVRQaJ
         5ONEQCKMtrQNc72dtIZUCcAeJgtQTDX9EAXsYpRfL5wKvi/EhXcH+v+3FoGIQXsSg5Tg
         fFHxGZIjFi1WLr3forOYnjhW6fHaG/iUTbsouim0ZYGQomL4gjoqG0eidqtGDOWv7R/0
         rVRroSGSojC66vHlVE89JCA+Oy+KP87qlZ4PnuafAsgh3UlS6y8dJQ/c84iSedpqd16P
         SUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752082285; x=1752687085;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XEVOg8awUVziPWxUcgUh6JXWqxoNySqku+ut2WkXh7Y=;
        b=mpdqYjZWnk3lQwDDI4Prc9bB+ATzLKU61dVM6nKF0GG48VJU/YxblIGLUU+vwvbaby
         p5EZ2eDWQX1irOQFiVt+Te4/qWhfs7LhX3eJu4OYOu2LLztRyQwb+D27wht5/oscSPI1
         jvTSqwlY/vbZkhOzRIbJHaPnis+CELoP5Evulgs1Ghq1FhqxeI6P+QhIaLlHEibUaSu6
         r3sCLTG16MwKxbSlFPcTYmLtcyK77Eh1rXNl65N9du6rysgaM+I/lcHwdXQWQ1Blo3Gv
         OQzYEtt7y0LSrwnWnVat8AjHoW6LYwYVIKZA25T0Xf0iX8eNVG2X9Cek5SMY/89Itvv1
         zv0w==
X-Gm-Message-State: AOJu0YwG8gw9DCcFn1gEH12TqseXEobuMgvZA5d377YUT6olbem3w/xn
	SYZXeKfkKROZHW0fkWJlVuwNs3ykpqTyMrMsJyRnlwqfUytd2ncaiW8VvvDrbA==
X-Gm-Gg: ASbGncv1qdDwjCQwgQvA8i2KCUx/PVy5n6Yze3BYY2YSUGo7QXqoHZta8XUp0RLnSPU
	h13LClVg7hcMsu0joa8qaE5ubvMDF3pt/0hwmQPMgSiOrdJeM5NYmpYdOCidE9BE6lgyYuQzwrL
	WTrR8Dhtt7IEiAVFrZVDNAXUk/dGfBUE+tKDTxnXcRUlzZCCRWFtW2nTnokVM9LrtwbDPAr/tlG
	XHgWmIB/wVDZS4+zKtYKjIIW7zDKK4BYZtbHXl9A9cjwlcVrtPn3WvSvACkbdgUaxMmXWrB80sF
	s1JTJ53up5z7aDYN4gEDU+FDKyYMM1Tw1Or5f+xdJ9VylKOR2k5bSe3UxrwfhPn5ms1YkpOtqt0
	TlfY=
X-Google-Smtp-Source: AGHT+IFsNIJ97Uiz5tn68HiLQn5lYRuevatSXANanmX2DSkO8vVqZPz/wHNS9fUORQyGNpvkLXOgjw==
X-Received: by 2002:a05:6512:3da8:b0:553:ae51:1066 with SMTP id 2adb3069b0e04-559000423c1mr289072e87.12.1752082285136;
        Wed, 09 Jul 2025 10:31:25 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383baeffsm2073854e87.2.2025.07.09.10.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 10:31:23 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 14/20] ettercap: Add patch for CMake 4+ compatibility
Date: Wed,  9 Jul 2025 20:30:48 +0300
Message-ID: <20250709173054.605430-14-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709173054.605430-1-alperyasinak1@gmail.com>
References: <20250709173054.605430-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Jul 2025 17:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118368

Fix:

| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
|
|
| -- Configuring incomplete, errors occurred!

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 .../0002-allow-build-with-cmake-4.patch       | 54 +++++++++++++++++++
 .../ettercap/ettercap_0.8.3.1.bb              |  4 +-
 2 files changed, 56 insertions(+), 2 deletions(-)
 create mode 100644 meta-networking/recipes-support/ettercap/ettercap/0002-allow-build-with-cmake-4.patch

diff --git a/meta-networking/recipes-support/ettercap/ettercap/0002-allow-build-with-cmake-4.patch b/meta-networking/recipes-support/ettercap/ettercap/0002-allow-build-with-cmake-4.patch
new file mode 100644
index 0000000000..70e48f7d9e
--- /dev/null
+++ b/meta-networking/recipes-support/ettercap/ettercap/0002-allow-build-with-cmake-4.patch
@@ -0,0 +1,54 @@
+From 337e790d4fc8fed00a4f62047de1bc702f06105e Mon Sep 17 00:00:00 2001
+From: Alper Ak <alperyasinak1@gmail.com>
+Date: Wed, 9 Jul 2025 14:15:32 +0300
+Subject: [PATCH] cmake: Set minimum required version to 3.5 for CMake 4+
+ compatibility
+
+Fix:
+
+| CMake Error at CMakeLists.txt:1 (cmake_minimum_required):
+|   Compatibility with CMake < 3.5 has been removed from CMake.
+|
+|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
+|   to tell CMake that the project requires at least <min> but has been updated
+|   to work with policies introduced by <max> or earlier.
+|
+|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.
+|
+|
+| -- Configuring incomplete, errors occurred!
+
+Upstream-Status: Submitted [https://github.com/Ettercap/ettercap/pull/1279]
+
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
+---
+ CMakeLists.txt               | 2 +-
+ cmake/Modules/FindGTK3.cmake | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index 1c08875a..600bd9f4 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -1,4 +1,4 @@
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.5)
+ project(ettercap C)
+ 
+ set(VERSION "0.8.3.1")
+diff --git a/cmake/Modules/FindGTK3.cmake b/cmake/Modules/FindGTK3.cmake
+index e07a4e90..f37fee1c 100644
+--- a/cmake/Modules/FindGTK3.cmake
++++ b/cmake/Modules/FindGTK3.cmake
+@@ -351,7 +351,7 @@ endif()
+ #
+ if(GTK3_FIND_VERSION)
+   if(NOT DEFINED CMAKE_MINIMUM_REQUIRED_VERSION)
+-    cmake_minimum_required(VERSION 2.6.2)
++    cmake_minimum_required(VERSION 3.5)
+   endif()
+   set(GTK3_FAILED_VERSION_CHECK true)
+   if(GTK3_DEBUG)
+-- 
+2.43.0
+
diff --git a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
index d5dc10a889..027b6dd190 100644
--- a/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
+++ b/meta-networking/recipes-support/ettercap/ettercap_0.8.3.1.bb
@@ -21,11 +21,11 @@ DEPENDS += "ethtool \
 RDEPENDS:${PN} += "bash ethtool libgcc"
 
 SRC_URI = "gitsm://github.com/Ettercap/ettercap;branch=master;protocol=https \
-           file://0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch"
+           file://0001-sslstrip-Enhance-the-libcurl-version-check-to-consid.patch \
+           file://0002-allow-build-with-cmake-4.patch"
 
 SRCREV = "7281fbddb7da7478beb1d21e3cb105fff3778b31"
 
-
 EXTRA_OECMAKE = " \
     -DCMAKE_SKIP_RPATH=TRUE \
     -DBUNDLED_LIBS=ON \
-- 
2.43.0


