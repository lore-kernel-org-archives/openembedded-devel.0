Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.1317.1615400273010847827
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 10 Mar 2021 10:17:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=EtYt6xA1;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id b18so24390704wrn.6
        for <openembedded-devel@lists.openembedded.org>; Wed, 10 Mar 2021 10:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=21Jqb46mE5ekUeufPIfHOzwAjbQqAAfB+zMZeXI62cw=;
        b=EtYt6xA171Cz2cYJdhTsiyzCzNID1Zsx2MEdMmRR/wRCK5r2tvApVa7OhAWl/w4Cyz
         EsJe32gUao8m0PsGRhCsdLig+9oeAiMRkNrjiKNOHFE78iX0B8E4/LAIju31hPgMxnKW
         C16dmAdTTRGD/HrWZW+UFi3q0U1yCkUGaknBl9kw2BZW81N8w0ZJ1F96QsKiLNMdz0Nh
         Y1fbhno/k3+8w4BFvy9i+exbgukOOXcaMkDSb1uZ4AOcTN5Lud+Z1bO3QoOeChRnTyQM
         8r/O8fzlfVEITKyxinfUYjkcoxF5gpL878CS1a5PZT3ms/WLCBov1GKqxmwAIx/H8bMl
         rzVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=21Jqb46mE5ekUeufPIfHOzwAjbQqAAfB+zMZeXI62cw=;
        b=ltAWdjos1fo/SqrPQXMI4t/ZxuEOT+KF8NCoCDESMstWfE0dUv2NKVQsD8jxAZrqLv
         H0nUxowj26H9RkMl1niQKRAD0WTb960ad78JVQzas4oisLW/0HePrBSb0ME8QztWMyQP
         SC6lFsT/eNB2PRX52S/2vIsRozQOfxH7bsYGVvTdX9wwzUyITYnSFppALqWjrjhQnoPS
         PG5aMYnHUpL5DvCe3xt8GlUnh8m59eGlOhxDb8yfSw3jZzciTfftFkpX7mV03o5215+1
         gUfjEjPeGE2XTas2VozHOyvvYL9nBN1fT6hcHGy/iJhqYDeq5XzmeWYxtUpOJsVP06p0
         dTyw==
X-Gm-Message-State: AOAM530DKCcSJpx/xYMYx5uj7DGxBjEVjccrm3+jsA5VM/1TOvWIeLVT
	S+N9EWlSzc1t1pRRpGeK2IgdY0kcuxk=
X-Google-Smtp-Source: ABdhPJzu4xyirWlh1q24aOVLCQ/9gh+GQs6re/V5zIbRpE7QZLKxGAktDOgkOHX7cUDpzUb/k6Tzug==
X-Received: by 2002:adf:e60e:: with SMTP id p14mr4781130wrm.221.1615400270720;
        Wed, 10 Mar 2021 10:17:50 -0800 (PST)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id c18sm13232934wmk.0.2021.03.10.10.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 10:17:50 -0800 (PST)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH] glog: fix searching for Libunwind
Date: Wed, 10 Mar 2021 19:17:48 +0100
Message-Id: <20210310181748.1926205-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* it used to be part of 0003-installation-path-fix.patch which was removed during
  the upgrade to 0.4.0 and now some recipes (e.g. mtp-server from meta-luneos) are
  failing like:
  CMake Error at /OE/build/luneos-hardknott/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitAUTOINC+bb4a81e61b-r0/recipe-sysroot-native/usr/share/cmake-3.19/Modules/CMakeFindDependencyMacro.cmake:47 (find_package):
    By not providing "FindLibunwind.cmake" in CMAKE_MODULE_PATH this project
    has asked CMake to find a package configuration file provided by
    "Libunwind", but CMake did not find one.

    Could not find a package configuration file provided by "Libunwind" with
    any of the following names:

      LibunwindConfig.cmake
      libunwind-config.cmake

    Add the installation prefix of "Libunwind" to CMAKE_PREFIX_PATH or set
    "Libunwind_DIR" to a directory containing one of the above files.  If
    "Libunwind" provides a separate development package or SDK, be sure it has
    been installed.
  Call Stack (most recent call first):
    /OE/build/luneos-hardknott/webos-ports/tmp-glibc/work/tissot-webos-linux/mtp-server/0.0.3+gitAUTOINC+bb4a81e61b-r0/recipe-sysroot/usr/lib/cmake/glog/glog-config.cmake:35 (find_dependency)
    CMakeLists.txt:17 (find_package)

  because LibunwindConfig.cmake is provided by glog as:
  recipe-sysroot/usr/lib/cmake/glog/FindLibunwind.cmake
  but this directory wasn't searched by CMake.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../glog/glog/0001-Find-Libunwind-during-configure.patch       | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch b/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
index 577007a62e..4c0861cca1 100644
--- a/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
+++ b/meta-oe/recipes-support/glog/glog/0001-Find-Libunwind-during-configure.patch
@@ -109,10 +109,11 @@
  install (EXPORT glog-targets NAMESPACE glog:: DESTINATION
 --- a/glog-config.cmake.in
 +++ b/glog-config.cmake.in
-@@ -8,4 +8,6 @@ include (CMakeFindDependencyMacro)
+@@ -8,4 +8,7 @@ include (CMakeFindDependencyMacro)
  
  @gflags_DEPENDENCY@
  
++list (APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
 +find_dependency (Libunwind)
 +
  include ("${CMAKE_CURRENT_LIST_DIR}/glog-targets.cmake")
-- 
2.30.1

