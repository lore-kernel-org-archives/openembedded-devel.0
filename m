Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FA90C79FBD
	for <webhook@archiver.kernel.org>; Wed,  9 Sep 2026 15:55:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15746.1788969349619598405
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Sep 2026 08:55:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OeRLZe44;
 spf=pass (domain: konsulko.com, ip: 209.85.221.53, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so7022306f8f.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 08:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1788969348; x=1789574148; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xbI2YwwFSweLHU80342TFVl25BuySx2X9Rf3g10cnkY=;
        b=OeRLZe44TOuJPRfiyPjYKgLHsuQ83fTVnNRQ2fAyPaCCU3WpWdkweV/g/vRJyc2ymM
         zo/q+AX5Q+/DRpBBlJ/CaxYkY7Gf8/lEHMaMF3EJRA1dN8kqsR4hrZPxEbeMz8jsJwur
         zqQd9ivTNcs7Xnii2E9NvVhS+Q3jQVE6KlmbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788969348; x=1789574148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xbI2YwwFSweLHU80342TFVl25BuySx2X9Rf3g10cnkY=;
        b=rDgtutMw9wsaitubPKIaUNNQr10FO5XjEJ8qPR9UTDaSbFmkx2OFp6h/Bd6rzF6aKY
         ZJi4Pn1KgXU79KoF3+E8b0rFlAcRVt8NmbMkVTXfkOZS6Ck+a3kdDvcZTwmRThgMw4hL
         Gk2F6KKDdnMqhOvLZ3tc5BZ/WupXQIjmruRQqJTxYyQY+5zIIAcvbjHZYYg9DvNoCcXa
         hm9NU1bPrQmszr0cc0MROEQaGXNRAecUUFKOi1vNYXNxaqcwkwFnqnYyol9gPtFvVycI
         +PpkLrGmCoBtag+KfoPD9/ShMsW65tKXPvK7BuBZoi9qLo13WWA1F51sGsADltRsA8VP
         r9UQ==
X-Gm-Message-State: AFuF++mrHbXHo2AT1VI1zIXNRyjbv6WF6FH/GQR053Y9UBpbgWrCLnK8
	Rt0Re6L0dxM8qTYfrnsVoFFFH2uJYQ23zw7QszQCdFqOAjrpMSZmobHU0uL0BXKVrwJ4/IIEurt
	ojDzt
X-Gm-Gg: AYBFou0uv9PVsGe8G93RRNSVLbiVHsPlnqXtjZui9xmmbj/cDGDgFSyRtQjGCSxvl2z
	2MYVAHN6LMhahy8y6AmHMH/tp2kKcj8inLWEY/Fjjzj2CoFfnQozdaeBbeEJ9tno1n350dOVd45
	tHVPgBEM5wZeCxhYkZHCVjkbpAWpnInKqbTk1JYmJHc4OsftBWfdS7svEUYiAu3envE7r8qphDE
	4wyr5XumEXtpFhoZhtsoDv93c/pUIwcBI2V0Es17ddiQNMy5nKXU0IbT+z1HVimW1xMv0ub+GGB
	2Zud8rvWgjeWGD5HxYcnx8jhGLwq7hUKmOmo8bQ2+HbYiwXt0NnBhlYOA0UISnlIHfRSX7XoxJJ
	HoWuFz/9crb/A1PCkNHCow6QOdtleKTqQOODBjRiI9/UVuGwrwPB1/bq9cXsCVg+FgRCCNiT7bC
	l1u5kuEp9JQEwTSvfkiuyQepUsjRo+Wp+W57BTL1IcHFtfb4Qr9tPdaTWNOaNarWXfATs8zhKGR
	Z9BUvThvfTziuVgJCHNB806QxZ87AaNNqU/2NkQDWMUdIu2OizqNnaDms2Ebo2qgbxpwE8HDcp1
	eAHRLEcMtNq7Adz0byVypOD3
X-Received: by 2002:a05:6000:240e:b0:485:8c16:a337 with SMTP id ffacd0b85a97d-4858e771e3cmr30040358f8f.44.1788969347467;
        Wed, 09 Sep 2026 08:55:47 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588135600sm39511740f8f.2.2026.09.09.08.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:55:47 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-oe][PATCH 2/2] bit7z: Upgrade 4.0.12 -> 4.1.0
Date: Wed,  9 Sep 2026 18:55:43 +0300
Message-ID: <20260909155543.2469658-2-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260909155543.2469658-1-leon.anavi@konsulko.com>
References: <20260909155543.2469658-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 09 Sep 2026 15:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129890

Upgrade to release 4.1.0:

- Nested archives support: the new BitNestedArchiveReader class
  lets you open and inspect archives that are embedded as items
  inside another archive, without extracting them to disk first.
- Native file I/O: file streams have been rewritten to use
  low-level Win32 APIs on Windows and POSIX I/O on Unix, replacing
  std::fstream. This dramatically improves the performance of both
  extraction and compression operations.
- New extraction callbacks: RenameCallback (dynamically rename or
  skip items during extraction), RawDataCallback (stream raw bytes
  directly to user code without touching the filesystem), and
  BufferCallback (route each extracted file to a separate,
  independently chosen buffer) unlock extraction patterns that were
  previously impossible.
- Multi-volume LRU file-handle cache: when reading or creating
  large multi-volume archives, bit7z now keeps only the most
  recently used volume file handles open, preventing file
  descriptor exhaustion on archives with many volumes.
- Timestamp control: two complementary additions give full control
  over timestamps when creating archives. BitAbstractArchiveCreator
  gains setStoreLastWriteTime(), setStoreCreationTime(), and
  setStoreLastAccessTime() to control which timestamp types are
  stored globally (format support varies: 7z has the most complete
  support; TAR does not support creation/last-access timestamps).
  Additionally, BitOutputArchive::addFile() now returns a
  BitInputItem&, allowing per-item timestamp overrides via
  setCreationTime(), setLastWriteTime(), and setLastAccessTime().
- Deferred library loading: Bit7zLibraryLoader allows constructing
  a loader without immediately loading the 7-zip DLL/SO, then
  loading (and unloading) it at any later point. Useful for
  plugin systems and applications that need to control when the
  native library is brought in.
- Self-extracting (SFX) archive support (since beta): bit7z
  correctly handles SFX executables.
- Root-folder extraction (since beta): extract the contents of an
  archive's single top-level folder without knowing its name in
  advance.
- Locked-file compression (since beta): the new setStoreOpenFiles()
  setting on BitAbstractArchiveCreator opens files with shared
  read/write access on Windows, mirroring 7-Zip's -ssw switch, so
  you can archive files another process holds open for writing
  instead of failing with "access denied". No effect on non-Windows
  platforms.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 ...01-cmake-disable-filesystem-gitclone.patch | 54 +++++++++++++----
 ...Lists.txt-Remove-reference-to-TMPDIR.patch | 60 +++++++++++++++++++
 .../7zip/{bit7z_4.0.12.bb => bit7z_4.1.0.bb}  | 31 ++++++----
 3 files changed, 124 insertions(+), 21 deletions(-)
 create mode 100644 meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-reference-to-TMPDIR.patch
 rename meta-oe/recipes-extended/7zip/{bit7z_4.0.12.bb => bit7z_4.1.0.bb} (75%)

diff --git a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitclone.patch b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitclone.patch
index 917b70f58e..47860167bf 100644
--- a/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitclone.patch
+++ b/meta-oe/recipes-extended/7zip/bit7z/0001-cmake-disable-filesystem-gitclone.patch
@@ -1,3 +1,6 @@
+From cc4874a304379aaf372955a3ecd83ae825fd5ed3 Mon Sep 17 00:00:00 2001
+From: Liu Yiding <liuyd.fnst@fujitsu.com>
+Date: Wed, 9 Sep 2026 11:09:16 +0300
 Subject: [PATCH] cmake: disable filesystem gitclone
 
 In Yocto we don't download filesystem, it is satisfied from source dir.
@@ -9,29 +12,58 @@ Fix error log as following:
 | CMake Error at bit7z/4.0.11/build/_deps/ghc_filesystem-subbuild/ghc_filesystem-populate-prefix/tmp/ghc_filesystem-populate-gitclone.cmake:50 (message):
 |   Failed to clone repository: 'https://github.com/rikyoz/filesystem.git'
 
+
+Apply the same approach for bit7z-test-data in tests/CMakeLists.txt
+to fix error log as following:
+
+|   Failed to clone repository:
+|
+|     'https://github.com/rikyoz/bit7z-test-data.git'
+
 Upstream-Status: Inappropriate [OE-specific]
 
 Signed-off-by: Liu Yiding <liuyd.fnst@fujitsu.com>
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
 ---
  cmake/Dependencies.cmake | 3 +--
- 1 file changed, 1 insertion(+), 2 deletions(-)
+ tests/CMakeLists.txt     | 2 +-
+ 2 files changed, 2 insertions(+), 3 deletions(-)
 
 diff --git a/cmake/Dependencies.cmake b/cmake/Dependencies.cmake
-index 110d9c2b..dc1dead8 100644
+index 1e787070..03dfa3d9 100644
 --- a/cmake/Dependencies.cmake
 +++ b/cmake/Dependencies.cmake
-@@ -39,10 +39,9 @@ if( NOT USE_STANDARD_FILESYSTEM OR NOT STANDARD_FILESYSTEM_COMPILES OR BIT7Z_BUI
-     CPMAddPackage( NAME ghc_filesystem
-                    GITHUB_REPOSITORY rikyoz/filesystem
-                    GIT_TAG b99c2aebd5ddd6fb2f190731ba80b949fc3842b5
--                   DOWNLOAD_ONLY YES )
-+                   SOURCE_DIR "${CPM_SOURCE_CACHE}/ghc_filesystem" )
+@@ -84,7 +84,7 @@ if( NOT USE_STANDARD_FILESYSTEM OR BIT7Z_BUILD_TESTS )
+         GITHUB_REPOSITORY rikyoz/filesystem
+         GIT_TAG b99c2aebd5ddd6fb2f190731ba80b949fc3842b5
+         GIT_PROGRESS ON
+-        DOWNLOAD_ONLY YES
++        SOURCE_DIR "${CPM_SOURCE_CACHE}/ghc_filesystem"
+     )
+ 
+     # Normalize to a plain "ghc_filesystem" target that the rest of the build and the tests link,
+@@ -92,7 +92,6 @@ if( NOT USE_STANDARD_FILESYSTEM OR BIT7Z_BUILD_TESTS )
      if( ghc_filesystem_ADDED )
+         # Downloaded sources: expose the header-only library straight from its source tree.
          message( STATUS "ghc::filesystem source code available at ${ghc_filesystem_SOURCE_DIR}" )
 -        add_library( ghc_filesystem INTERFACE IMPORTED )
          target_include_directories( ghc_filesystem SYSTEM INTERFACE ${ghc_filesystem_SOURCE_DIR}/include )
-     endif()
- endif()
--- 
+         if( BIT7Z_USE_PCH AND CMAKE_VERSION VERSION_GREATER_EQUAL "3.16.0" )
+             target_precompile_headers(
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 5f5c8c62..ddfd735a 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -72,8 +72,8 @@ if( BIT7Z_TESTS_FILESYSTEM )
+             NAME bit7z_test_data
+             GITHUB_REPOSITORY "rikyoz/bit7z-test-data"
+             VERSION 1.18.2
+-            DOWNLOAD_ONLY YES
+             GIT_PROGRESS ON
++            SOURCE_DIR "${CPM_SOURCE_CACHE}/bit7z_test_data"
+         )
+         if( bit7z_test_data_ADDED )
+             set( BIT7Z_TESTS_DATA_DIR ${bit7z_test_data_SOURCE_DIR} )
+--
 2.43.0
 
diff --git a/meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-reference-to-TMPDIR.patch b/meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-reference-to-TMPDIR.patch
new file mode 100644
index 0000000000..eba1d66846
--- /dev/null
+++ b/meta-oe/recipes-extended/7zip/bit7z/0002-tests-CMakeLists.txt-Remove-reference-to-TMPDIR.patch
@@ -0,0 +1,60 @@
+From 0ea00afd5217683074f263027df6c28c03b25e1e Mon Sep 17 00:00:00 2001
+From: Leon Anavi <leon.anavi@konsulko.com>
+Date: Wed, 9 Sep 2026 16:00:00 +0300
+Subject: [PATCH] tests/CMakeLists.txt: Remove reference to TMPDIR
+
+Adjust the path where the tests data directory will actually be
+located when running the tests on the target device.
+
+Fixes:
+
+ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File
+/usr/lib/bit7z/ptest/bit7z-tests-public-cpp20 in package
+bit7z-ptest contains reference to TMPDIR [buildpaths]
+ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File
+/usr/lib/bit7z/ptest/bit7z-tests in package bit7z-ptest contains
+reference to TMPDIR [buildpaths]
+ERROR: bit7z-4.1.0-r0 do_package_qa: QA Issue: File
+/usr/lib/bit7z/ptest/bit7z-tests-public in package bit7z-ptest
+contains reference to TMPDIR [buildpaths]
+ERROR: bit7z-4.1.0-r0 do_package_qa: Fatal QA errors were found,
+failing task.
+
+Upstream-Status: Inappropriate [OE-specific]
+
+Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
+---
+ tests/CMakeLists.txt | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/tests/CMakeLists.txt b/tests/CMakeLists.txt
+index 2af67faa..64573893 100644
+--- a/tests/CMakeLists.txt
++++ b/tests/CMakeLists.txt
+@@ -94,8 +94,15 @@ if( BIT7Z_TESTS_FILESYSTEM )
+         message( STATUS "Custom test data dir: ${BIT7Z_TESTS_DATA_DIR}" )
+     endif()
+ 
++    # Adjust the path where the tests data directory will actually be
++    # located when running the tests on the target device.
++    set( BIT7Z_TESTS_DATA_DIR_TARGET "" CACHE STRING "The path of the tests data directory at run time" )
++    if( BIT7Z_TESTS_DATA_DIR_TARGET STREQUAL "" )
++        set( BIT7Z_TESTS_DATA_DIR_TARGET ${BIT7Z_TESTS_DATA_DIR} )
++    endif()
++
+     target_compile_definitions(
+-        ${TESTS_BASE_TARGET} INTERFACE BIT7Z_TESTS_FILESYSTEM BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR}"
++        ${TESTS_BASE_TARGET} INTERFACE BIT7Z_TESTS_FILESYSTEM BIT7Z_TESTS_DATA_DIR="${BIT7Z_TESTS_DATA_DIR_TARGET}"
+     )
+ 
+     if( NOT EXISTS ${BIT7Z_TESTS_DATA_DIR}/test_filesystem/empty )
+@@ -224,4 +231,4 @@ if( "cxx_std_20" IN_LIST CMAKE_CXX_COMPILE_FEATURES )
+     set_property( TARGET ${TESTS_TARGET_PUBLIC_CPP20} PROPERTY CXX_STANDARD_REQUIRED ON )
+ endif()
+ 
+-catch_discover_tests( ${TESTS_TARGET} )
+\ No newline at end of file
++catch_discover_tests( ${TESTS_TARGET} )
+-- 
+2.43.0
+
diff --git a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
similarity index 75%
rename from meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
rename to meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
index 1399130e11..4661046220 100644
--- a/meta-oe/recipes-extended/7zip/bit7z_4.0.12.bb
+++ b/meta-oe/recipes-extended/7zip/bit7z_4.1.0.bb
@@ -8,24 +8,25 @@ SRC_URI = " \
     ${@bb.utils.contains('PTEST_ENABLED', '1', d.getVar('SRC_URI_PTEST'), 'file://0001-cmake-disable-dependency-inclusion.patch', d)} \
 "
 
-SRCREV = "9a43c9fb96003141dcb49c82843382a52afec86a"
+SRCREV = "c81c6c1cbf44e148cd4b06f4bb69d7ea1e299742"
 
 # ptest dependencies and their revisions
 SRC_URI_PTEST = " \
     git://github.com/rikyoz/filesystem.git;protocol=https;branch=glibcxx_wchar_streams_workaround;name=filesystem;destsuffix=filesystem \
-    git://github.com/rikyoz/bit7z-test-data.git;protocol=https;branch=main;name=testdata;destsuffix=testdata \
+    git://github.com/rikyoz/bit7z-test-data.git;protocol=https;branch=main;tag=v${TAG_testdata};name=testdata;destsuffix=testdata \
     git://github.com/rikyoz/Catch2.git;protocol=https;branch=single-header-v2.x;name=catch2;destsuffix=catch2 \
     https://github.com/cpm-cmake/CPM.cmake/releases/download/v${TAG_CPM}/CPM.cmake;downloadfilename=CPM_${TAG_CPM}.cmake \
     file://run-ptest \
     file://0001-cmake-disable-filesystem-gitclone.patch \
+    file://0002-tests-CMakeLists.txt-Remove-reference-to-TMPDIR.patch \
 "
 SRCREV_FORMAT = "${@bb.utils.contains('PTEST_ENABLED', '1', 'default_filesystem_testdata_catch2', 'default', d)}"
 SRCREV_filesystem = "b99c2aebd5ddd6fb2f190731ba80b949fc3842b5"
-SRCREV_testdata = "077e407b1c07b7443626b5902eeb4819388bf656"
+SRCREV_testdata = "4a24af69edf59cd6e737e84e6477ce752ef77bdd"
+TAG_testdata = "1.18.2"
 SRCREV_catch2 = "27d8db1770dd5cd3688656095f242474431584a1"
-SRCHASH_CPM = "2020b4fc42dba44817983e06342e682ecfc3d2f484a581f11cc5731fbe4dce8a"
-TAG_CPM = "0.42.0"
-SRC_URI[sha256sum] = "${SRCHASH_CPM}"
+TAG_CPM = "0.42.3"
+SRC_URI[sha256sum] = "a609e875fd532b067174250f6abbc3dac22fe2d64869783fb1e80bda1625c844"
 
 
 inherit cmake ptest
@@ -34,7 +35,8 @@ DEPENDS = "7zip"
 
 EXTRA_OECMAKE += "-DBIT7Z_CUSTOM_7ZIP_PATH=${STAGING_INCDIR}/7zip"
 
-CXXFLAGS:append = " -Wno-error=array-bounds"
+CXXFLAGS:append = " -Wno-error=array-bounds -Wno-sfinae-incomplete"
+CXXFLAGS:append = " -I${B}/cpm_cache/ghc_filesystem/include"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)}"
 PACKAGECONFIG[tests] = " \
@@ -47,9 +49,18 @@ PACKAGECONFIG[tests] = " \
 do_configure:prepend() {
     # verify that all dependencies have correct version
     grep -q ${SRCREV_filesystem} ${S}/cmake/Dependencies.cmake || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_filesystem'!"
-    grep -q ${SRCREV_testdata} ${S}/tests/CMakeLists.txt || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_testdata'!"
+
+    FOUND_VERSION=$(grep -A5 "NAME bit7z_test_data" ${S}/tests/CMakeLists.txt | grep -oP 'VERSION \K[0-9.]+' | head -1 | tr -d '[:space:]')
+    if [ "${TAG_testdata}" != "${FOUND_VERSION}" ]; then
+        bbfatal "ERROR: dependency version mismatch, please update 'TAG_testdata'!"
+    fi
+
     grep -q ${SRCREV_catch2} ${S}/tests/CMakeLists.txt || bbfatal "ERROR: dependency version mismatch, please update 'SRCREV_catch2'!"
-    grep -q ${SRCHASH_CPM} ${S}/cmake/Dependencies.cmake || bbfatal "ERROR: dependency version mismatch, please update 'SRCHASH_CPM'!"
+
+    FOUND_VERSION=$(grep -oP 'CPM_DOWNLOAD_VERSION\s+\K[0-9.]+' ${S}/cmake/Dependencies.cmake | tr -d '[:space:]')
+    if [ "${TAG_CPM}" != "${FOUND_VERSION}" ]; then
+        bbfatal "ERROR: dependency version mismatch, please update 'TAG_CPM'!"
+    fi
 
     if ${@bb.utils.contains('PTEST_ENABLED', '1', 'true', 'false', d)}; then
         # use cache instead of download for CPM (CMake's missing package manager)
@@ -73,7 +84,7 @@ do_install() {
 do_install_ptest() {
     install -m 0755 ${S}/bin/*/* ${D}${PTEST_PATH}
     install -d ${D}${PTEST_PATH}/data
-    cp -r ${UNPACKDIR}/testdata/test_archives ${UNPACKDIR}/testdata/test_filesystem ${B}/tests/data/test_filesystem ${D}${PTEST_PATH}/data
+    cp -r ${UNPACKDIR}/testdata/test_archives ${UNPACKDIR}/testdata/test_filesystem ${B}/cpm_cache/bit7z_test_data/test_filesystem ${D}${PTEST_PATH}/data
 }
 
 # this package contains static library so main package is empty, but ptest package rdepends on it
-- 
2.47.3


