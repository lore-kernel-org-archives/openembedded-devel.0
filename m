Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50954CCF9F0
	for <webhook@archiver.kernel.org>; Sat, 25 Oct 2025 03:40:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web10.955.1761363628040983866
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 24 Oct 2025 20:40:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=i2ssHF7H;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a27bf4fbcbso2208224b3a.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 24 Oct 2025 20:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761363627; x=1761968427; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7a375od6yz0lHQMjZnEHdCKyHyI9NstHz1PgFxh5yLM=;
        b=i2ssHF7HoDKX76E53Id8dCyVHyUyqWceeuqnSfWaGE2nLqmK6aYoxhrGNTWPjj5ePU
         Esal5lhfe468xEHUe9pKCp0VFQqb5x1/WyDtW0T3+PlFmLHuSMArowkDzewmCYQRbS6J
         vm6ADmn47fa5za021+flkQMTihim0VZZ6nZI7QI6V0isMteiQPoVPLqbY7jeT42/iJTn
         FRmWtccHj0pjTBqT9pD+JpdHo8LX0PFCifsMGBM5pSTZUORsKcTB1kU6eeDpl1Cnzx98
         8g+naIsYoLyGPUTlfjMBgsEHRGx3D99j0xjFaNsxlIihQqoUhmUu9JReo2rilDRyM55y
         9N/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761363627; x=1761968427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7a375od6yz0lHQMjZnEHdCKyHyI9NstHz1PgFxh5yLM=;
        b=F88/Ht9i8dIQzoHoZqZjwJs94D0EZEjamz0Uwa4FkHtGVQkocQ6HHyFqBLb00W7WyG
         eRSGbYqmVnTSzHL2256t2xR82eYdJLO1Dgw9H6zHCrbvA491g88I1LPopSHAn1qUECLa
         UXHLqW+wS+3j49/qFruXTo/54e5w3PP6gS5BpeU34nbMnJRCIgYKVQLC2U2+a/udqV4V
         T5JIxVhof54FR56jm9NqifvkGHzmZ1SBDwN9D8jhwt13rrqZJMbPnuROweFcWAB9IaIz
         YKUH67tCSl+fsvaqorC3cxpX7dUbbVDDyZbRydmd1A302yh2FyGf1iEirYoGzLSyM/Qs
         jvtg==
X-Gm-Message-State: AOJu0Yw+nNaI1IUnrovtYqQjfLFEzoCcUOPvAk3X5kyNCKGzpDTVltWA
	UnMVVs3s9O8JGmpfVEwICpSmI4fyk4R/VuYK5Buh2ngOUjRsYUovANzoDZWmxs+H
X-Gm-Gg: ASbGnct9jGO3iyjyiq2hJ0wwqzBCFdRpumqiis+yyvIjYDPU9bM1ZcqeramJVwPKEE6
	JqCosLhXn6/pbt0PA1ntJspmwjxad79v2U5RbTiThU6hCVnB9A+Ni2mGy2+V6cJ/K2cD6YnEuc3
	/IjRSW+QmI4AiUdy77ljGnBZ6e3+9ppzzeHGFfGvuXejm3DNtv/0yLzL6gKfedR5RCOyD6wAwJy
	8p17ElQkW7mkfchwbc43Vnw7wWcD9WpxmCGki2o2GefRRB3wHpuQ/wiGXHP0bM8uKOZR9HQrvaK
	V3IKKMgyIKqHJDC+YEgvZ1rlspMwYHdvxFfdUXJrTOF4Rd+hEZiyYJtPX7oYJMC1ubtcNoC1lht
	MOySozjBuXJ2jgCl8j0x7sxfCMtwIhp0FNXo4F5pyR3N932JJqpJVsIp6KfZknXyQZFoVshK7/P
	0dVHUTVK6REr0L/ZXqFqA4cSDZoh5wi+vpilg2OR6ptULzRaKsAKUd+p8S3oxR+A==
X-Google-Smtp-Source: AGHT+IG6RRlSEzfiFEy6YkScnOC+tw4hwGii9HFxIcNCch5keGeieTQAJAvwT8CP10kZo5CgvcjD+Q==
X-Received: by 2002:a05:6a00:a87:b0:77e:f03b:d49a with SMTP id d2e1a72fcca58-7a220a995bfmr34652904b3a.19.1761363626849;
        Fri, 24 Oct 2025 20:40:26 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::9dbe])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414012bf4sm808487b3a.1.2025.10.24.20.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 20:40:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 07/11] avro-c,avro-c++: Upgrade to 1.12.1 release
Date: Fri, 24 Oct 2025 20:40:12 -0700
Message-ID: <20251025034017.2071643-7-raj.khem@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251025034017.2071643-1-raj.khem@gmail.com>
References: <20251025034017.2071643-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 25 Oct 2025 03:40:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120991

The patches are no longer needed

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...0001-Remove-cpp-unittest-compilation.patch | 99 -------------------
 ...1-cmake-Port-to-work-with-boost-1.89.patch | 49 ---------
 ...0002-Add-package-configuration-files.patch | 90 -----------------
 .../{avro-c++_1.12.bb => avro-c++_1.12.1.bb}  | 16 ++-
 .../{avro-c_1.12.0.bb => avro-c_1.12.1.bb}    |  2 +-
 5 files changed, 8 insertions(+), 248 deletions(-)
 delete mode 100644 meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-compilation.patch
 delete mode 100644 meta-oe/recipes-support/avro/avro-c++/0001-cmake-Port-to-work-with-boost-1.89.patch
 delete mode 100644 meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuration-files.patch
 rename meta-oe/recipes-support/avro/{avro-c++_1.12.bb => avro-c++_1.12.1.bb} (75%)
 rename meta-oe/recipes-support/avro/{avro-c_1.12.0.bb => avro-c_1.12.1.bb} (88%)

diff --git a/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-compilation.patch b/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-compilation.patch
deleted file mode 100644
index f33c653069..0000000000
--- a/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-compilation.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From d75f0c5e7a51c9874edad0ea60957e006fb6def5 Mon Sep 17 00:00:00 2001
-From: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
-Date: Mon, 7 Jul 2025 16:58:30 +0300
-Subject: [PATCH] Remove cpp unittest compilation
-
-Upstream-Status: Inappropriate [oe-specific]
-
-Signed-off-by: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- lang/c++/CMakeLists.txt | 65 -----------------------------------------
- 1 file changed, 65 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 19059a41b..1f5f98c83 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -149,39 +149,6 @@ set_target_properties (avrocpp_s PROPERTIES
- target_link_libraries (avrocpp ${Boost_LIBRARIES} ${SNAPPY_LIBRARIES} fmt::fmt-header-only)
- target_include_directories(avrocpp PRIVATE ${SNAPPY_INCLUDE_DIR})
-
--add_executable (precompile test/precompile.cc)
--
--target_link_libraries (precompile avrocpp_s)
--
--macro (gen file ns)
--    add_custom_command (OUTPUT ${file}.hh
--        COMMAND avrogencpp
--            -p -
--            -i ${CMAKE_CURRENT_SOURCE_DIR}/jsonschemas/${file}
--            -o ${file}.hh -n ${ns}
--        DEPENDS avrogencpp ${CMAKE_CURRENT_SOURCE_DIR}/jsonschemas/${file})
--    add_custom_target (${file}_hh DEPENDS ${file}.hh)
--endmacro (gen)
--
--gen (empty_record empty)
--gen (bigrecord testgen)
--gen (bigrecord_r testgen_r)
--gen (bigrecord2 testgen2)
--gen (tweet testgen3)
--gen (union_array_union uau)
--gen (union_map_union umu)
--gen (union_conflict uc)
--gen (union_empty_record uer)
--gen (recursive rec)
--gen (reuse ru)
--gen (circulardep cd)
--gen (tree1 tr1)
--gen (tree2 tr2)
--gen (crossref cr)
--gen (primitivetypes pt)
--gen (cpp_reserved_words cppres)
--gen (cpp_reserved_words_union_typedef cppres_union)
--
- add_executable (avrogencpp impl/avrogencpp.cc)
- target_link_libraries (avrogencpp avrocpp_s)
-
-@@ -194,38 +161,6 @@ target_include_directories(avrocpp PUBLIC
-   $<INSTALL_INTERFACE:include>
- )
-
--enable_testing()
--
--macro (unittest name)
--    add_executable (${name} test/${name}.cc)
--    target_link_libraries (${name} avrocpp ${Boost_LIBRARIES} ${SNAPPY_LIBRARIES})
--    add_test (NAME ${name} WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
--        COMMAND ${CMAKE_CURRENT_BINARY_DIR}/${name})
--endmacro (unittest)
--
--unittest (buffertest)
--unittest (unittest)
--unittest (SchemaTests)
--unittest (LargeSchemaTests)
--unittest (CodecTests)
--unittest (StreamTests)
--unittest (SpecificTests)
--unittest (DataFileTests)
--unittest (JsonTests)
--unittest (AvrogencppTests)
--unittest (CompilerTests)
--unittest (AvrogencppTestReservedWords)
--unittest (CommonsSchemasTests)
--
--add_dependencies (AvrogencppTestReservedWords cpp_reserved_words_hh)
--
--add_dependencies (AvrogencppTests bigrecord_hh bigrecord_r_hh bigrecord2_hh
--    tweet_hh
--    union_array_union_hh union_map_union_hh union_conflict_hh
--    recursive_hh reuse_hh circulardep_hh tree1_hh tree2_hh crossref_hh
--    primitivetypes_hh empty_record_hh cpp_reserved_words_union_typedef_hh
--    union_empty_record_hh)
--
- include (InstallRequiredSystemLibraries)
-
- set (CPACK_PACKAGE_FILE_NAME "avrocpp-${AVRO_VERSION_MAJOR}")
---
-2.43.0
-
diff --git a/meta-oe/recipes-support/avro/avro-c++/0001-cmake-Port-to-work-with-boost-1.89.patch b/meta-oe/recipes-support/avro/avro-c++/0001-cmake-Port-to-work-with-boost-1.89.patch
deleted file mode 100644
index 0411f2fded..0000000000
--- a/meta-oe/recipes-support/avro/avro-c++/0001-cmake-Port-to-work-with-boost-1.89.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From f7c76ff3d693e6df5693fcd2864101b9913b1a44 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 30 Aug 2025 18:16:10 -0700
-Subject: [PATCH] cmake: Port to work with boost 1.89+
-
-boost 1.88 does not have boost system libs anymore
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- CMakeLists.txt | 25 ++++++++++++++-----------
- 1 file changed, 14 insertions(+), 11 deletions(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 73596a6..42f4225 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -80,17 +80,20 @@ endif ()
-
-
- find_package (Boost 1.38 REQUIRED
--    COMPONENTS filesystem iostreams program_options regex system)
--
--include(FetchContent)
--FetchContent_Declare(
--        fmt
--        GIT_REPOSITORY  https://github.com/fmtlib/fmt.git
--        GIT_TAG         10.2.1
--        GIT_PROGRESS    TRUE
--        USES_TERMINAL_DOWNLOAD TRUE
--)
--FetchContent_MakeAvailable(fmt)
-+    COMPONENTS filesystem iostreams program_options regex)
-+
-+find_package(fmt)
-+if (NOT fmt_FOUND)
-+    include(FetchContent)
-+    FetchContent_Declare(
-+            fmt
-+            GIT_REPOSITORY  https://github.com/fmtlib/fmt.git
-+            GIT_TAG         10.2.1
-+            GIT_PROGRESS    TRUE
-+            USES_TERMINAL_DOWNLOAD TRUE
-+    )
-+    FetchContent_MakeAvailable(fmt)
-+endif (NOT fmt_FOUND)
-
- find_package(Snappy)
- if (SNAPPY_FOUND)
diff --git a/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuration-files.patch b/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuration-files.patch
deleted file mode 100644
index 982e37d5b8..0000000000
--- a/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuration-files.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 01a29c294c898cf6e13fb500b8514e9982982e1f Mon Sep 17 00:00:00 2001
-From: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
-Date: Mon, 7 Jul 2025 18:16:35 +0300
-Subject: [PATCH] Add package configuration files
-
-Upstream-Status: Pending
-
-Signed-off-by: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
-Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
----
- lang/c++/CMakeLists.txt            | 46 ++++++++++++++++++++++++------
- lang/c++/cmake/AvroCppConfig.cmake |  5 ++++
- 2 files changed, 43 insertions(+), 8 deletions(-)
- create mode 100644 lang/c++/cmake/AvroCppConfig.cmake
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 1f5f98c83..73596a6cf 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -167,18 +167,48 @@ set (CPACK_PACKAGE_FILE_NAME "avrocpp-${AVRO_VERSION_MAJOR}")
-
- include (CPack)
-
--install (TARGETS avrocpp avrocpp_s
--    LIBRARY DESTINATION lib
--    ARCHIVE DESTINATION lib
--    RUNTIME DESTINATION lib)
--
--install (TARGETS avrogencpp RUNTIME DESTINATION bin)
--
--install (DIRECTORY include/avro DESTINATION include
-+install(TARGETS avrocpp
-+    EXPORT AvroCppTargets
-+    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
-+
-+install(TARGETS avrogencpp
-+    EXPORT AvroCppTargets
-+    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
-+
-+install(DIRECTORY include/avro DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
-     FILES_MATCHING PATTERN *.hh)
-
-+
- if (NOT CMAKE_BUILD_TYPE)
-     set (CMAKE_BUILD_TYPE Release CACHE STRING
-       "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
-       FORCE)
- endif (NOT CMAKE_BUILD_TYPE)
-+
-+# Create cmake config files
-+include(CMakePackageConfigHelpers)
-+write_basic_package_version_file(
-+    "${CMAKE_CURRENT_BINARY_DIR}/AvroCppConfigVersion.cmake"
-+    VERSION ${AVRO_VERSION_MAJOR}.${AVRO_VERSION_MINOR}.${AVRO_VERSION_PATCH}
-+    COMPATIBILITY AnyNewerVersion
-+)
-+
-+configure_file(cmake/AvroCppConfig.cmake
-+    "${CMAKE_CURRENT_BINARY_DIR}/AvroCppConfig.cmake"
-+    COPYONLY
-+)
-+
-+set(ConfigPackageLocation ${CMAKE_INSTALL_LIBDIR}/cmake/avrocpp)
-+install(EXPORT AvroCppTargets
-+    FILE AvroCppTargets.cmake
-+    NAMESPACE AvroCpp::
-+    DESTINATION ${ConfigPackageLocation}
-+)
-+install(FILES
-+    "cmake/AvroCppConfig.cmake"
-+    "${CMAKE_CURRENT_BINARY_DIR}/AvroCppConfigVersion.cmake"
-+    DESTINATION ${ConfigPackageLocation}
-+    COMPONENT Devel)
-diff --git a/lang/c++/cmake/AvroCppConfig.cmake b/lang/c++/cmake/AvroCppConfig.cmake
-new file mode 100644
-index 000000000..deb8aaa31
---- /dev/null
-+++ b/cmake/AvroCppConfig.cmake
-@@ -0,0 +1,5 @@
-+include(CMakeFindDependencyMacro)
-+find_dependency(Boost 1.38 REQUIRED
-+    COMPONENTS filesystem iostreams program_options regex system)
-+
-+include("${CMAKE_CURRENT_LIST_DIR}/AvroCppTargets.cmake")
---
-2.43.0
-
diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.bb b/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
similarity index 75%
rename from meta-oe/recipes-support/avro/avro-c++_1.12.bb
rename to meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
index a07ddbfe52..729763d133 100644
--- a/meta-oe/recipes-support/avro/avro-c++_1.12.bb
+++ b/meta-oe/recipes-support/avro/avro-c++_1.12.1.bb
@@ -7,15 +7,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=34cb96edab958a981837bf6f44bf654d"

 DEPENDS = "boost"

-SRC_URI = "git://github.com/apache/avro.git;branch=branch-1.12;protocol=https;name=avro-c++ \
-        git://github.com/fmtlib/fmt.git;branch=10.x;protocol=https;name=fmt;destsuffix=_deps/fmt-src \
-        file://0001-Remove-cpp-unittest-compilation.patch \
-        file://0002-Add-package-configuration-files.patch \
-        file://0001-cmake-Port-to-work-with-boost-1.89.patch \
-        "
-
-SRCREV_FORMAT = "avro-c++ fmt"
-SRCREV_avro-c++ = "8c27801dc8d42ccc00997f25c0b8f45f8d4a233e"
+SRC_URI = "git://github.com/apache/avro.git;branch=branch-1.12;protocol=https;name=avro-c++;tag=release-${PV} \
+           git://github.com/fmtlib/fmt.git;branch=10.x;protocol=https;name=fmt;destsuffix=_deps/fmt-src \
+           "
+
+SRCREV_FORMAT = "avro-c++_fmt"
+SRCREV_avro-c++ = "9110c693767c1dde2665b2b57939333478b12036"
 # Tag 10.2.1
 SRCREV_fmt = "e69e5f977d458f2650bb346dadf2ad30c5320281"

@@ -23,6 +20,7 @@ S = "${UNPACKDIR}/${BP}/lang/c++"

 inherit cmake pkgconfig

+EXTRA_OECMAKE += "-DAVRO_BUILD_TESTS=OFF"
 do_configure:prepend() {
         install -d ${B}/_deps
         cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
diff --git a/meta-oe/recipes-support/avro/avro-c_1.12.0.bb b/meta-oe/recipes-support/avro/avro-c_1.12.1.bb
similarity index 88%
rename from meta-oe/recipes-support/avro/avro-c_1.12.0.bb
rename to meta-oe/recipes-support/avro/avro-c_1.12.1.bb
index 3876f5e308..aa3677684a 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.12.0.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.12.1.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"

 BRANCH = "branch-1.12"
-SRCREV = "8c27801dc8d42ccc00997f25c0b8f45f8d4a233e"
+SRCREV = "9110c693767c1dde2665b2b57939333478b12036"
 SRC_URI = " \
     git://github.com/apache/avro;branch=${BRANCH};protocol=https;tag=release-${PV} \
 "

