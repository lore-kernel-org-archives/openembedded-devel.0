Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C040BC71130
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 22:54:19 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web10.5806.1751928858945674061
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jul 2025 15:54:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=R5h6aMmV;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alperyasinak1@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-553b9eb2299so3829503e87.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 15:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751928857; x=1752533657; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uArgny3/4Zv1Pu8dkDKCckCOP86RwguI5bd6B7+8UJY=;
        b=R5h6aMmVq8kzUa3bwx+8KQQWYGpAxn6vMrxmyNU0IKVXKw4flwL/u6UXJ82wj8cvx/
         vUDGlTTls8FSJVyAn25FvEtNy6CgQs9gTztmGaduKkE/m0bWXVcLzaGehqr1DVxWe27J
         /u0Sb0Dr3G6aWfX9cBnWidjO93x4iSY4Nf7Tl44UsSWlnyJl6tzJMrvHaQ3csag010ha
         tuA5VInVY+RfPHdEBYvc7BzQBGsuXRowjceRzxrKH2RuydiAEpBAL7aP9niER4tAvCTP
         /yMGVK8jcn1pRsvJkCrgAZqZO6NjoSnw0VqYaOTjLg1VbCAaRO0HKQcd9CMiEk9EJ1Sz
         1RHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751928857; x=1752533657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uArgny3/4Zv1Pu8dkDKCckCOP86RwguI5bd6B7+8UJY=;
        b=GKKHc+vyF5XTLxVNx/IMQ12YiVvi8jbNJ8Ed9LxBZ0lUtkybj0FztBs7hiuROUM3HY
         1F+mlNjEqNJfeQdO1UpZlH4Eyj3f97wKRoKk7o5mG2SmMEImiXjQkMKmSmzVsfqbLOiU
         EEmv+L9/8csjafskBBvFEFnWMtffWis26ifZ7ySEm7T0m6J3qIIW4iXxiL3/f/xUjkac
         Xlq5psdc78skD7eQWCu5/Ez76fJGlRzFYAAiix2STN7Bdw7W0uz7EmOcCySSAOHHAl2N
         fUt7iL47p+igyLTXfAlFwOvcRT0IqTCeGqHN6ym6vC3Ang0Zq/z767Au+y6Dm/qcYdjW
         ouDQ==
X-Gm-Message-State: AOJu0YwW5nZTyAljtHbiXzNEyaW+sNMIoc7V7BKhHohQJGVsKjz3yksW
	hYni8c5K/F5yfhIFVVhhvx75qTDVzneLLGNhINzP3T4AE3pqR6zCZrlYnP4P9w==
X-Gm-Gg: ASbGncuwfziiWVLAUz1YNXcIb5OApW6GqxamgRhrzojIPnaci7a8f0+vIqOq0HDWfbD
	y5ZDO9K7lDL6BG8XwACxafIxrJwVQC911qTmSG5yx88byrJBGWdMpFpe5kTb9To3NFP9An6yc/0
	z/ip9PmYAa2TEw+J9M6MJ3RpNGeGKfQZmvunZdkb/c2jsR3WBvwtjo+ag/8ZOCIUUUE1NJwZQnc
	Av3rzKhTyXOT81PWy/gfN6WAmsXCE9qczBODvT5K1JNYqM0of81MwF0RZj20DIBcuss5pCswkXr
	iUKCXmBJRc3z1FTIpts+XWg9vjnUbQlv9eyAeKbhi5L74TPJjxPP9eo/PNw7RcVBFtxViTqRyya
	UO3o=
X-Google-Smtp-Source: AGHT+IFYuEFVyp9ImNpc1Tf9AFJUhXfE82JNzdyv84aM3+h0VjSse2H0xZzPEfeyoPvLjCQkC39TTw==
X-Received: by 2002:a05:6512:2c99:b0:552:20e1:5b97 with SMTP id 2adb3069b0e04-557f8dcdc9bmr102226e87.18.1751928856423;
        Mon, 07 Jul 2025 15:54:16 -0700 (PDT)
Received: from localhost.localdomain ([176.33.70.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384b836dsm1476347e87.197.2025.07.07.15.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 15:54:15 -0700 (PDT)
From: Alper Ak <alperyasinak1@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Alper Ak <alperyasinak1@gmail.com>
Subject: [meta-openembedded][PATCH 2/9] avro-c++: Upgrade 1.11.3 -> 1.12 to allow CMake 4+ compatibility
Date: Tue,  8 Jul 2025 01:54:00 +0300
Message-ID: <20250707225407.1558421-2-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707225407.1558421-1-alperyasinak1@gmail.com>
References: <20250707225407.1558421-1-alperyasinak1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 07 Jul 2025 22:54:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118290

- Drop workaround flag for dangling reference
- Refresh patches and drop 0003-Update-CXX-standard-to-CXX14.patch because already assigned to C++17
- Drop xz and zlib because they aren't shown as build dependency and without them the build completes without errors
- Fetch the fmt in SRC_URI and put it in the right place so the CMake doesn't need to run FetchContent
- The LICENSE file has changed so updated LIC_FILES_CHKSUM to match the new md5sum

Changelog: https://github.com/apache/avro/releases/tag/release-1.12.0

Fix:

| CMake Error at CMakeLists.txt:19 (cmake_minimum_required):
|   Compatibility with CMake < 3.5 has been removed from CMake.
|
|   Update the VERSION argument <min> value.  Or, use the <min>...<max> syntax
|   to tell CMake that the project requires at least <min> but has been updated
|   to work with policies introduced by <max> or earlier.
|
|   Or, add -DCMAKE_POLICY_VERSION_MINIMUM=3.5 to try configuring anyway.

----

| CMake Warning at /opt/yocto-masternext-contribute/sources/build/tmp/work/core2-64-poky-linux/avro-c++/1.12/recipe-sysroot-native/usr/share/cmake-4.0/Modules/FetchContent.cmake:2111 (message):
|   FETCHCONTENT_FULLY_DISCONNECTED is set to true, which requires the source
|   directory for dependency fmt to already be populated.  This generally means
|   it must not be set to true the first time CMake is run in a build
|   directory.  The following source directory should already be populated, but
|   it doesn't exist:
|
|     /opt/yocto-masternext-contribute/sources/build/tmp/work/core2-64-poky-linux/avro-c++/1.12/build/_deps/fmt-src
|
|   Policy CMP0170 controls enforcement of this requirement.
| Call Stack (most recent call first):
|   /opt/yocto-masternext-contribute/sources/build/tmp/work/core2-64-poky-linux/avro-c++/1.12/recipe-sysroot-native/usr/share/cmake-4.0/Modules/FetchContent.cmake:2384 (__FetchContent_Populate)
|   CMakeLists.txt:93 (FetchContent_MakeAvailable)
|
|
| -- Could NOT find Snappy (missing: SNAPPY_LIBRARIES SNAPPY_INCLUDE_DIR)
| Disabled snappy codec. libsnappy not found.
| -- Configuring done (0.4s)
| CMake Error at CMakeLists.txt:149 (target_link_libraries):
|   Target "avrocpp" links to:
|
|     fmt::fmt-header-only
|
|   but the target was not found.  Possible reasons include:
|
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.
|
|
|
| CMake Error at CMakeLists.txt:138 (target_link_libraries):
|   Target "avrocpp_s" links to:
|
|     fmt::fmt-header-only
|
|   but the target was not found.  Possible reasons include:
|
|     * There is a typo in the target name.
|     * A find_package call is missing for an IMPORTED target.
|     * An ALIAS target is missing.

Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 ...0001-Remove-cpp-unittest-compilation.patch | 35 +++++++++++++------
 ...0002-Add-package-configuration-files.patch | 32 ++++++++++-------
 .../0003-Update-CXX-standard-to-CXX14.patch   | 24 -------------
 .../recipes-support/avro/avro-c++_1.11.3.bb   | 27 --------------
 meta-oe/recipes-support/avro/avro-c++_1.12.bb | 29 +++++++++++++++
 5 files changed, 72 insertions(+), 75 deletions(-)
 delete mode 100644 meta-oe/recipes-support/avro/avro-c++/0003-Update-CXX-standard-to-CXX14.patch
 delete mode 100644 meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
 create mode 100644 meta-oe/recipes-support/avro/avro-c++_1.12.bb

diff --git a/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-compilation.patch b/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-compilation.patch
index bcfafdda55..f33c653069 100644
--- a/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-compilation.patch
+++ b/meta-oe/recipes-support/avro/avro-c++/0001-Remove-cpp-unittest-compilation.patch
@@ -1,32 +1,34 @@
-From 6be1c45e1f7ee78499bdca76c25ec23a61317134 Mon Sep 17 00:00:00 2001
+From d75f0c5e7a51c9874edad0ea60957e006fb6def5 Mon Sep 17 00:00:00 2001
 From: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
-Date: Wed, 20 Mar 2024 14:58:27 +0000
+Date: Mon, 7 Jul 2025 16:58:30 +0300
 Subject: [PATCH] Remove cpp unittest compilation
 
 Upstream-Status: Inappropriate [oe-specific]
 
+Signed-off-by: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
 ---
- lang/c++/CMakeLists.txt | 61 -----------------------------------------
- 1 file changed, 61 deletions(-)
+ lang/c++/CMakeLists.txt | 65 -----------------------------------------
+ 1 file changed, 65 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4a3793152..d94ba42d3 100644
+index 19059a41b..1f5f98c83 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -131,70 +131,9 @@ set_target_properties (avrocpp_s PROPERTIES
- target_link_libraries (avrocpp ${Boost_LIBRARIES} ${SNAPPY_LIBRARIES})
+@@ -149,39 +149,6 @@ set_target_properties (avrocpp_s PROPERTIES
+ target_link_libraries (avrocpp ${Boost_LIBRARIES} ${SNAPPY_LIBRARIES} fmt::fmt-header-only)
  target_include_directories(avrocpp PRIVATE ${SNAPPY_INCLUDE_DIR})
 
 -add_executable (precompile test/precompile.cc)
 -
--target_link_libraries (precompile avrocpp_s ${Boost_LIBRARIES} ${SNAPPY_LIBRARIES})
+-target_link_libraries (precompile avrocpp_s)
 -
 -macro (gen file ns)
 -    add_custom_command (OUTPUT ${file}.hh
 -        COMMAND avrogencpp
 -            -p -
 -            -i ${CMAKE_CURRENT_SOURCE_DIR}/jsonschemas/${file}
--            -o ${file}.hh -n ${ns} -U
+-            -o ${file}.hh -n ${ns}
 -        DEPENDS avrogencpp ${CMAKE_CURRENT_SOURCE_DIR}/jsonschemas/${file})
 -    add_custom_target (${file}_hh DEPENDS ${file}.hh)
 -endmacro (gen)
@@ -39,6 +41,7 @@ index 4a3793152..d94ba42d3 100644
 -gen (union_array_union uau)
 -gen (union_map_union umu)
 -gen (union_conflict uc)
+-gen (union_empty_record uer)
 -gen (recursive rec)
 -gen (reuse ru)
 -gen (circulardep cd)
@@ -47,9 +50,14 @@ index 4a3793152..d94ba42d3 100644
 -gen (crossref cr)
 -gen (primitivetypes pt)
 -gen (cpp_reserved_words cppres)
+-gen (cpp_reserved_words_union_typedef cppres_union)
 -
  add_executable (avrogencpp impl/avrogencpp.cc)
- target_link_libraries (avrogencpp avrocpp_s ${Boost_LIBRARIES} ${SNAPPY_LIBRARIES})
+ target_link_libraries (avrogencpp avrocpp_s)
+
+@@ -194,38 +161,6 @@ target_include_directories(avrocpp PUBLIC
+   $<INSTALL_INTERFACE:include>
+ )
 
 -enable_testing()
 -
@@ -72,6 +80,7 @@ index 4a3793152..d94ba42d3 100644
 -unittest (AvrogencppTests)
 -unittest (CompilerTests)
 -unittest (AvrogencppTestReservedWords)
+-unittest (CommonsSchemasTests)
 -
 -add_dependencies (AvrogencppTestReservedWords cpp_reserved_words_hh)
 -
@@ -79,8 +88,12 @@ index 4a3793152..d94ba42d3 100644
 -    tweet_hh
 -    union_array_union_hh union_map_union_hh union_conflict_hh
 -    recursive_hh reuse_hh circulardep_hh tree1_hh tree2_hh crossref_hh
--    primitivetypes_hh empty_record_hh)
+-    primitivetypes_hh empty_record_hh cpp_reserved_words_union_typedef_hh
+-    union_empty_record_hh)
 -
  include (InstallRequiredSystemLibraries)
 
  set (CPACK_PACKAGE_FILE_NAME "avrocpp-${AVRO_VERSION_MAJOR}")
+--
+2.43.0
+
diff --git a/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuration-files.patch b/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuration-files.patch
index 437a3fa138..982e37d5b8 100644
--- a/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuration-files.patch
+++ b/meta-oe/recipes-support/avro/avro-c++/0002-Add-package-configuration-files.patch
@@ -1,21 +1,23 @@
-From 86aa3f2333a9b8e6f1c631e6d5cb7296b6e8380b Mon Sep 17 00:00:00 2001
+From 01a29c294c898cf6e13fb500b8514e9982982e1f Mon Sep 17 00:00:00 2001
 From: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
-Date: Fri, 22 Mar 2024 13:27:38 +0000
+Date: Mon, 7 Jul 2025 18:16:35 +0300
 Subject: [PATCH] Add package configuration files
 
 Upstream-Status: Pending
 
+Signed-off-by: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
+Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
 ---
- lang/c++/CMakeLists.txt            | 45 ++++++++++++++++++++++++------
+ lang/c++/CMakeLists.txt            | 46 ++++++++++++++++++++++++------
  lang/c++/cmake/AvroCppConfig.cmake |  5 ++++
- 2 files changed, 42 insertions(+), 8 deletions(-)
+ 2 files changed, 43 insertions(+), 8 deletions(-)
  create mode 100644 lang/c++/cmake/AvroCppConfig.cmake
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index d94ba42d3..4748b111d 100644
+index 1f5f98c83..73596a6cf 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -140,14 +140,18 @@ set (CPACK_PACKAGE_FILE_NAME "avrocpp-${AVRO_VERSION_MAJOR}")
+@@ -167,18 +167,48 @@ set (CPACK_PACKAGE_FILE_NAME "avrocpp-${AVRO_VERSION_MAJOR}")
 
  include (CPack)
 
@@ -26,23 +28,24 @@ index d94ba42d3..4748b111d 100644
 -
 -install (TARGETS avrogencpp RUNTIME DESTINATION bin)
 -
--install (DIRECTORY api/ DESTINATION include/avro
-+install (TARGETS avrocpp
+-install (DIRECTORY include/avro DESTINATION include
++install(TARGETS avrocpp
 +    EXPORT AvroCppTargets
 +    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
 +    ARCHIVE DESTINATION ${CMAKE_INSTALL_LIBDIR}
 +    RUNTIME DESTINATION ${CMAKE_INSTALL_LIBDIR}
-+    INCLUDES DESTINATION include)
++    INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
 +
-+install (TARGETS avrogencpp
++install(TARGETS avrogencpp
 +    EXPORT AvroCppTargets
 +    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR})
 +
-+install (DIRECTORY api/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/avro
++install(DIRECTORY include/avro DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}
      FILES_MATCHING PATTERN *.hh)
 
++
  if (NOT CMAKE_BUILD_TYPE)
-@@ -155,3 +159,28 @@ if (NOT CMAKE_BUILD_TYPE)
+     set (CMAKE_BUILD_TYPE Release CACHE STRING
        "Choose the type of build, options are: None Debug Release RelWithDebInfo MinSizeRel."
        FORCE)
  endif (NOT CMAKE_BUILD_TYPE)
@@ -71,7 +74,7 @@ index d94ba42d3..4748b111d 100644
 +    "${CMAKE_CURRENT_BINARY_DIR}/AvroCppConfigVersion.cmake"
 +    DESTINATION ${ConfigPackageLocation}
 +    COMPONENT Devel)
-diff --git a/cmake/AvroCppConfig.cmake b/cmake/AvroCppConfig.cmake
+diff --git a/lang/c++/cmake/AvroCppConfig.cmake b/lang/c++/cmake/AvroCppConfig.cmake
 new file mode 100644
 index 000000000..deb8aaa31
 --- /dev/null
@@ -82,3 +85,6 @@ index 000000000..deb8aaa31
 +    COMPONENTS filesystem iostreams program_options regex system)
 +
 +include("${CMAKE_CURRENT_LIST_DIR}/AvroCppTargets.cmake")
+--
+2.43.0
+
diff --git a/meta-oe/recipes-support/avro/avro-c++/0003-Update-CXX-standard-to-CXX14.patch b/meta-oe/recipes-support/avro/avro-c++/0003-Update-CXX-standard-to-CXX14.patch
deleted file mode 100644
index 3e65cb7a72..0000000000
--- a/meta-oe/recipes-support/avro/avro-c++/0003-Update-CXX-standard-to-CXX14.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-From 66c08ade24e4472b5af5dca48097ed9a2ec035ec Mon Sep 17 00:00:00 2001
-From: Rui Costa <rui.ms.costa@ctw.bmwgroup.com>
-Date: Fri, 5 Apr 2024 11:33:51 +0000
-Subject: [PATCH] Update CXX standard to CXX14
-
-Upstream-Status: Inappropriate [oe-specific]
-
----
- lang/c++/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 4748b111d..1e45c13d5 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -21,7 +21,7 @@ cmake_minimum_required (VERSION 3.1)
- set (CMAKE_LEGACY_CYGWIN_WIN32 0)
-
- if (NOT DEFINED CMAKE_CXX_STANDARD)
--    set(CMAKE_CXX_STANDARD 11)
-+    set(CMAKE_CXX_STANDARD 14)
- endif()
-
- set(CMAKE_CXX_STANDARD_REQUIRED ON)
diff --git a/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb b/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
deleted file mode 100644
index c1e8863fb3..0000000000
--- a/meta-oe/recipes-support/avro/avro-c++_1.11.3.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-SUMMARY = "Apache Avro data serialization system."
-HOMEPAGE = "https://avro.apache.org/"
-SECTION = "libs"
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=43abf34d8b9908494f83c55d213a7f89"
-
-DEPENDS = "boost zlib xz"
-
-BRANCH = "branch-1.11"
-SRCREV = "35ff8b997738e4d983871902d47bfb67b3250734"
-SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
-           file://0001-Remove-cpp-unittest-compilation.patch \
-           file://0002-Add-package-configuration-files.patch \
-           file://0003-Update-CXX-standard-to-CXX14.patch \
-          "
-
-S = "${UNPACKDIR}/${BP}/lang/c++"
-
-inherit cmake pkgconfig
-
-BBCLASSEXTEND = "native nativesdk"
-
-# http://errors.yoctoproject.org/Errors/Details/766913/
-# avro-c++/1.11.3/git/lang/c++/impl/Compiler.cc:304:18: error: possibly dangling reference to a temporary [-Werror=dangling-reference]
-# avro-c++/1.11.3/git/lang/c++/impl/Compiler.cc:370:18: error: possibly dangling reference to a temporary [-Werror=dangling-reference]
-CXXFLAGS += "-Wno-error=dangling-reference"
diff --git a/meta-oe/recipes-support/avro/avro-c++_1.12.bb b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
new file mode 100644
index 0000000000..726a861bc9
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c++_1.12.bb
@@ -0,0 +1,29 @@
+SUMMARY = "Apache Avro data serialization system."
+HOMEPAGE = "https://avro.apache.org/"
+SECTION = "libs"
+
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=34cb96edab958a981837bf6f44bf654d"
+
+DEPENDS = "boost"
+
+SRC_URI = "git://github.com/apache/avro.git;branch=branch-1.12;protocol=https;name=avro-c++ \
+        git://github.com/fmtlib/fmt.git;branch=10.x;protocol=https;name=fmt;destsuffix=_deps/fmt-src \
+        file://0001-Remove-cpp-unittest-compilation.patch \
+        file://0002-Add-package-configuration-files.patch"
+
+SRCREV_FORMAT = "avro-c++ fmt"
+SRCREV_avro-c++ = "8c27801dc8d42ccc00997f25c0b8f45f8d4a233e"
+# Tag 10.2.1
+SRCREV_fmt = "e69e5f977d458f2650bb346dadf2ad30c5320281"
+
+S = "${UNPACKDIR}/${BP}/lang/c++"
+
+inherit cmake pkgconfig
+
+do_configure:prepend() {
+        install -d ${B}/_deps
+        cp -r ${UNPACKDIR}/_deps/fmt-src ${B}/_deps/
+}
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.43.0


