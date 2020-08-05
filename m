Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.1215.1596646932905693585
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 05 Aug 2020 10:02:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FfgYDZaO;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id g26so42374998qka.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 05 Aug 2020 10:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JTWtwiZm5kWTxepUIbEInb/R7B9XV/Qxz2ve73dDvL0=;
        b=FfgYDZaOz94zNPyGc43p4/M3u44+19eHXXgQi+bczjq6LINWXguGjWc6ZthWylLdSp
         HnSZhehoRy2BYxg8JJU76ZzlkXYXUx5RvI44BAzSKQ/soM2x5+eIo5TmDE1A9aSgo8t0
         r1LcjcfE+RFrzA2FN++jkEdtLFalzgap+MNDrC3NluN0B9lazHZ47lP35NouiyO9ngr8
         eNrYC66IyYU1E13cgyCZduvUe8jUrk6n7TLV01kAZfxJ1yclxJvkNrROUc5WKGShg6lx
         uvafm5eKnPX8agGhdrgTuUG7EauCzq1ooyGBSYOBAKdXG5dcSib3zRvbxZTzIQsaP363
         vP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JTWtwiZm5kWTxepUIbEInb/R7B9XV/Qxz2ve73dDvL0=;
        b=m2GMimefkf6HlRMYtJYI6HHmJUjqFAmd8vUvuJpal9CV9o6eU6m+3i4JWaJVhVoO6b
         dog7kOfEbBgJaKjGC2Gix3nSrgP+YRE/GwYNtiONV7a9ZV15Ey3SjmJQLd0Ge74Buv7S
         TuH4FogHtrIvadbqJOgf8LqFIVOeOHZ7aFWS/PpEwJHds2DQ8XqCmIAG4sWK7dymjeR4
         M2nIzZwe4plY3g2gOlEXoBOBeZSPcNYbq0HmArIAyHS9HjjJWrAG0Bntq5Jj6TAsGO9n
         ElXClZJSnGuFwyZRgSBIyctqqMlxVttISHrvmjm6O8uufjunwdA7ciiEbi8IPyJM0qP6
         yrdQ==
X-Gm-Message-State: AOAM532xkO4aAGmnXtJP6BhGTjpcD4QsUICtm79Mrozutzk121xFSm8g
	SWtZAU7yrPJ076fqgTB2CQalZJFGrk/jxQDUOL4=
X-Google-Smtp-Source: ABdhPJzh0+imtXr1IOfnRR5Rf8GW4x9A6jBbVKwPdTZ/LhciAEvZ6u7yRoO9FWKd7BdeNJvVIpO4ti7Z+kG6A136g2g=
X-Received: by 2002:a37:9d53:: with SMTP id g80mr4144190qke.17.1596646931765;
 Wed, 05 Aug 2020 10:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200805054303.25456-1-wonjong.lee@windriver.com>
In-Reply-To: <20200805054303.25456-1-wonjong.lee@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 5 Aug 2020 10:01:45 -0700
Message-ID: <CAMKF1srvaaJsoZ_8++o-tGzr+m9TrDY0ff7f5rXkC2PZCGEBBQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v3] minifi: Add recipe for c++ version
To: "wonjong.lee" <wonjong.lee@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, Junhwa.Rhee@windriver.com, 
	jeff.kim@windriver.com, andy.kang@windriver.com
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Aug 4, 2020 at 10:45 PM wonjong.lee <wonjong.lee@windriver.com> wrote:
>
> MiNiFi--a subproject of Apache NiFi--is a complementary data
> collection approach that supplements the core tenets of NiFi
> in dataflow management, focusing on the collection of data at
> the source of its creation. The C++ implementation is an
> additional implementation to the one in Java with the aim of
> an even smaller resource footprint.
>
> Signed-off-by: wonjong.lee <wonjong.lee@windriver.com>
> ---
>  .../files/fix-OSSPUUID-cross-compile.patch    |  70 ++++++++++++
>  .../files/fix-build-issue-in-yocto.patch      |  88 ++++++++++++++
>  .../files/fix-rocksdb-cross-compile.patch     |  11 ++
>  .../minifi-cpp/files/minifi.service           |  13 +++
>  .../minifi-cpp/files/systemd-volatile.conf    |   2 +
>  .../minifi-cpp/files/sysvinit-volatile.conf   |   2 +
>  .../minifi-cpp/minifi-cpp_0.7.0.bb            | 108 ++++++++++++++++++
>  7 files changed, 294 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compile.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/minifi.service
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
>
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compile.patch
> new file mode 100644
> index 000000000..6af47cafb
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compile.patch
> @@ -0,0 +1,70 @@
> +diff -urN orig/cmake/BundledOSSPUUID.cmake patched/cmake/BundledOSSPUUID.cmake
> +--- orig/cmake/BundledOSSPUUID.cmake   2020-01-07 22:55:55.000000000 +0900
> ++++ patched/cmake/BundledOSSPUUID.cmake        2020-07-14 11:32:28.221092406 +0900
> +@@ -22,7 +22,8 @@
> +
> +     # Define patch step
> +     find_package(Patch REQUIRED)
> +-    set(PC "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
> ++    set(PATCH1 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/ossp-uuid-mac-fix.patch")
> ++    set(PATCH2 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp-uuid/cross-compile-fix.patch")
> +
> +     # Define byproducts
> +     set(BYPRODUCTS "lib/libuuid.a"
> +@@ -35,7 +36,9 @@
> +     ENDFOREACH(BYPRODUCT)
> +
> +     # Build project
> +-    set(CONFIGURE_COMMAND ./configure "CFLAGS=-fPIC" "CXXFLAGS=-fPIC" --with-cxx --without-perl --without-php --without-pgsql "--prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install")
> ++    set(CONFIGURE_COMMAND ac_cv_va_copy=C99 ./configure CFLAGS=-fPIC CXXFLAGS=-fPIC --host=${HOST_SYS}
> ++        --with-cxx --without-perl --without-php --without-pgsql
> ++        --prefix=${BINARY_DIR}/thirdparty/ossp-uuid-install)
> +     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
> +     if(NOT build_type MATCHES debug)
> +         list(APPEND CONFIGURE_COMMAND --enable-debug=yes)
> +@@ -52,8 +55,8 @@
> +             UPDATE_COMMAND ""
> +             INSTALL_COMMAND make install
> +             BUILD_BYPRODUCTS ${OSSPUUID_LIBRARIES_LIST}
> +-            CONFIGURE_COMMAND ""
> +-            PATCH_COMMAND ${PC} && ${CONFIGURE_COMMAND}
> ++            CONFIGURE_COMMAND ${CONFIGURE_COMMAND}
> ++            PATCH_COMMAND ${PATCH1} && ${PATCH2}
> +             STEP_TARGETS build
> +             EXCLUDE_FROM_ALL TRUE
> +     )
> +diff -urN orig/thirdparty/ossp-uuid/cross-compile-fix.patch patched/thirdparty/ossp-uuid/cross-compile-fix.patch
> +--- orig/thirdparty/ossp-uuid/cross-compile-fix.patch  1970-01-01 09:00:00.000000000 +0900
> ++++ patched/thirdparty/ossp-uuid/cross-compile-fix.patch       2020-07-14 11:48:13.781090409 +0900
> +@@ -0,0 +1,31 @@
> ++diff -urN orig/config.sub patched/config.sub
> ++--- orig/config.sub   2008-07-05 06:43:08.000000000 +0900
> +++++ patched/config.sub        2020-07-14 11:46:47.249090591 +0900
> ++@@ -238,6 +238,7 @@
> ++      # Some are omitted here because they have special meanings below.
> ++      1750a | 580 \
> ++      | a29k \
> +++     | aarch64 | aarch64_be \
> ++      | alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] \
> ++      | alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha64pca5[67] \
> ++      | am33_2.0 \
> ++@@ -314,6 +315,7 @@
> ++      # Recognize the basic CPU types with company name.
> ++      580-* \
> ++      | a29k-* \
> +++     | aarch64-* | aarch64_be-* \
> ++      | alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
> ++      | alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* \
> ++      | alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
> ++diff -urN orig/shtool patched/shtool
> ++--- orig/shtool       2008-07-05 06:43:08.000000000 +0900
> +++++ patched/shtool    2020-07-13 19:35:49.557213657 +0900
> ++@@ -1400,7 +1400,7 @@
> ++             if [ ".$opt_t" = .yes ]; then
> ++                 echo "strip $dsttmp" 1>&2
> ++             fi
> ++-            strip $dsttmp || shtool_exit $?
> +++            $STRIP $dsttmp || shtool_exit $?
> ++         fi
> ++         if [ ".$opt_o" != . ]; then
> ++             if [ ".$opt_t" = .yes ]; then
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto.patch
> new file mode 100644
> index 000000000..2dc591c7a
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto.patch
> @@ -0,0 +1,88 @@
> +diff -urN orig/cmake/LibreSSL.cmake patched/cmake/LibreSSL.cmake
> +--- orig/cmake/LibreSSL.cmake  2020-07-28 11:39:40.046677515 +0900
> ++++ patched/cmake/LibreSSL.cmake       2020-07-28 11:42:41.650677131 +0900
> +@@ -27,6 +27,17 @@
> +               set(BYPRODUCT_PREFIX "" CACHE STRING "" FORCE)
> +       set(BUILD_ARGS " -GVisual Studio 15 2017")
> +       endif(WIN32)
> ++
> ++      set(BYPRODUCTS
> ++              "lib/${BYPRODUCT_PREFIX}crypto${BYPRODUCT_SUFFIX}"
> ++              "lib/${BYPRODUCT_PREFIX}ssl${BYPRODUCT_SUFFIX}"
> ++              "lib/${BYPRODUCT_PREFIX}tls${BYPRODUCT_SUFFIX}"
> ++      )
> ++      set(LIBRESSL_INSTALL_DIR "${BINARY_DIR}/thirdparty/libressl-install" CACHE STRING "" FORCE)
> ++      FOREACH(BYPRODUCT ${BYPRODUCTS})
> ++              LIST(APPEND LIBRESSL_LIBRARIES_LIST "${LIBRESSL_INSTALL_DIR}/${BYPRODUCT}")
> ++      ENDFOREACH(BYPRODUCT)
> ++
> +       ExternalProject_Add(
> +       libressl-portable
> +       URL https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz https://gentoo.osuosl.org/distfiles/libressl-2.8.3.tar.gz
> +@@ -37,6 +48,7 @@
> +                               "-DLIBRESSL_APPS=OFF"
> +                               "-DLIBRESSL_TESTS=OFF"
> +                               "${BUILD_ARGS}"
> ++      BUILD_BYPRODUCTS ${LIBRESSL_LIBRARIES_LIST}
> +       )
> +
> +       add_library(crypto STATIC IMPORTED)
> +diff -urN orig/CMakeLists.txt patched/CMakeLists.txt
> +--- orig/CMakeLists.txt        2020-07-28 11:39:40.042677515 +0900
> ++++ patched/CMakeLists.txt     2020-07-28 11:46:15.962676679 +0900
> +@@ -119,13 +119,27 @@
> +       endif()
> + endif()
> +
> ++include(CheckCXXSourceCompiles)
> ++CHECK_CXX_SOURCE_COMPILES("
> ++    #include <atomic>
> ++    int main(int argc, char **argv) {
> ++        uint8_t m;
> ++        __atomic_load_8(&m, 0);
> ++        return 0;
> ++    }"
> ++    HAVE_ATOMIC
> ++)
> ++if(NOT HAVE_ATOMIC)
> ++    set(LIB_ATOMIC atomic)
> ++endif()
> ++
> + # Use ccache if present
> +-find_program(CCACHE_FOUND ccache)
> +-if(CCACHE_FOUND)
> +-    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
> +-    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
> +-    message("-- Found ccache: ${CCACHE_FOUND}")
> +-endif(CCACHE_FOUND)
> ++#find_program(CCACHE_FOUND ccache)
> ++#if(CCACHE_FOUND)
> ++#    set_property(GLOBAL PROPERTY RULE_LAUNCH_COMPILE ccache)
> ++#    set_property(GLOBAL PROPERTY RULE_LAUNCH_LINK ccache)
> ++#    message("-- Found ccache: ${CCACHE_FOUND}")
> ++#endif(CCACHE_FOUND)
> +
> + if (UNIX AND USE_GOLD_LINKER AND NOT APPLE )
> +   execute_process(COMMAND ${CMAKE_C_COMPILER} -fuse-ld=gold -Wl,--version ERROR_QUIET OUTPUT_VARIABLE ld_version)
> +@@ -303,8 +317,10 @@
> +     GIT_TAG "f3294d9d86e6a7915a967efff2842089b8b0d071"  # Version 7.64.0
> +     SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-src"
> +     LIST_SEPARATOR % # This is needed for passing semicolon-separated lists
> ++    TLS_VERIFY OFF
> +     CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
> +                "-DCMAKE_INSTALL_PREFIX=${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-install"
> ++               "-DCMAKE_INSTALL_LIBDIR=lib${LIBSUFFIX}"
> +                 -DCMAKE_POSITION_INDEPENDENT_CODE=ON
> +                 -DBUILD_CURL_EXE=OFF
> +                 -DBUILD_TESTING=OFF
> +diff -urN orig/libminifi/CMakeLists.txt patched/libminifi/CMakeLists.txt
> +--- orig/libminifi/CMakeLists.txt      2020-07-28 11:39:40.074677515 +0900
> ++++ patched/libminifi/CMakeLists.txt   2020-07-28 11:47:08.554676568 +0900
> +@@ -108,6 +108,7 @@
> + add_library(spdlog STATIC ${SPD_SOURCES})
> + add_library(core-minifi STATIC ${SOURCES})
> + target_link_libraries(core-minifi ${CMAKE_DL_LIBS} yaml-cpp)
> ++target_link_libraries(core-minifi ${LIB_ATOMIC})
> +
> + #target_link_libraries(core-minifi  PRIVATE bsdiff )
> +
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
> new file mode 100644
> index 000000000..848b97aed
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-rocksdb-cross-compile.patch
> @@ -0,0 +1,11 @@
> +diff -urN orig/thirdparty/rocksdb/CMakeLists.txt patched/thirdparty/rocksdb/CMakeLists.txt
> +--- orig/thirdparty/rocksdb/CMakeLists.txt     2020-07-28 11:39:40.254677515 +0900
> ++++ patched/thirdparty/rocksdb/CMakeLists.txt  2020-07-28 11:51:11.898676054 +0900
> +@@ -618,6 +618,7 @@
> + add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES})
> + target_link_libraries(${ROCKSDB_STATIC_LIB}
> +   ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
> ++target_link_libraries(${ROCKSDB_STATIC_LIB} ${LIB_ATOMIC})
> +
> + if(WIN32)
> + #  add_library(${ROCKSDB_IMPORT_LIB} SHARED ${SOURCES})
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
> new file mode 100644
> index 000000000..5802a7b2f
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=MiNiFi Service
> +After=network.target
> +RequiresMountsFor=/var
> +
> +[Service]
> +Type=simple
> +WorkingDirectory=@LOCALSTATEDIR@/run/minifi
> +Environment=MINIFI_HOME=@SYSCONFDIR@/minifi
> +ExecStart=@BINDIR@/minifi
> +
> +[Install]
> +WantedBy=multi-user.target
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf b/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
> new file mode 100644
> index 000000000..c828b49fa
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/systemd-volatile.conf
> @@ -0,0 +1,2 @@
> +d @MINIFI_RUN@ 0755 root root -
> +d @MINIFI_LOG@ 0755 root root -
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf b/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
> new file mode 100644
> index 000000000..2ad14e677
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/sysvinit-volatile.conf
> @@ -0,0 +1,2 @@
> +d root root 0755 @MINIFI_RUN@ none
> +d root root 0755 @MINIFI_LOG@ none
> diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
> new file mode 100644
> index 000000000..eb9ede813
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
> @@ -0,0 +1,108 @@
> +SUMMARY = "A subproject of Apache NiFi to collect data where it originates."
> +DESCRIPTION = "MiNiFi--a subproject of Apache NiFi--is a complementary \
> +data collection approach that supplements the core tenets of NiFi in dataflow \
> +management, focusing on the collection of data at the source of its creation."
> +HOMEPAGE = "https://nifi.apache.org/minifi/index.html"
> +SECTION = "console/network"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=f9534eb5f4ab800b573a37bffc62f3a7"
> +
> +DEPENDS = "libxcrypt expat flex python3 bison-native"

you perhaps want virtual/crypt instead of libxcrypt, secondly it fails
to build with musl
http://errors.yoctoproject.org/Errors/Details/429083/

> +RDEPENDS_${PN} = "python3-core"
> +
> +SRCREV = "aa42957a2e227df41510047cece3cd606dc1cb6a"
> +SRC_URI = "git://github.com/apache/nifi-minifi-cpp.git \
> +           file://fix-build-issue-in-yocto.patch \
> +           file://fix-rocksdb-cross-compile.patch \
> +           file://fix-OSSPUUID-cross-compile.patch \
> +           file://minifi.service \
> +           file://systemd-volatile.conf \
> +           file://sysvinit-volatile.conf \
> +           "
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig cmake systemd
> +
> +# There are endian issues when communicating with the x86 nifi on the the mips and the ppc machines.
> +COMPATIBLE_MACHINE_mips = "(!.*mips).*"
> +COMPATIBLE_MACHINE_mips64 = "(!.*mips64).*"
> +COMPATIBLE_MACHINE_powerpc = "(!.*ppc).*"
> +
> +SYSTEMD_PACKAGES = "minifi-cpp"
> +SYSTEMD_SERVICE_${PN} = "minifi.service"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +
> +EXTRA_OECMAKE += " \
> +    -DHOST_SYS=${HOST_SYS} -DBUILD_SYS=${BUILD_SYS} \
> +    -DSKIP_TESTS=ON \
> +    "
> +
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM = "BOTH"
> +
> +
> +do_install() {
> +    DESTDIR='${B}/minifi-install' cmake_runcmake_build --target ${OECMAKE_TARGET_INSTALL}
> +
> +    MINIFI_BIN=${base_prefix}${bindir}
> +    MINIFI_HOME=${base_prefix}${sysconfdir}/minifi
> +    MINIFI_RUN=${base_prefix}${localstatedir}/run/minifi
> +    MINIFI_LOG=${base_prefix}${localstatedir}/log/minifi
> +
> +    install -d ${D}${MINIFI_BIN}
> +    install -d ${D}${MINIFI_HOME}/conf
> +    cp -a ${B}/minifi-install/usr/bin/*   ${D}${MINIFI_BIN}/
> +    cp -a ${B}/minifi-install/usr/conf/*  ${D}${MINIFI_HOME}/conf/
> +
> +    sed -i 's|#appender.rolling.directory=.*|appender.rolling.directory='${MINIFI_LOG}'|g' \
> +        ${D}${MINIFI_HOME}/conf/minifi-log.properties
> +    sed -i 's|nifi.provenance.repository.directory.default=.*|nifi.provenance.repository.directory.default='${MINIFI_RUN}'/provenance_repository|g' \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +    sed -i 's|nifi.flowfile.repository.directory.default=.*|nifi.flowfile.repository.directory.default='${MINIFI_RUN}'/flowfile_repository|g' \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +    sed -i 's|nifi.database.content.repository.directory.default=.*|nifi.database.content.repository.directory.default='${MINIFI_RUN}'/content_repository|g' \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +    sed -i 's|nifi.flow.configuration.file=.*|nifi.flow.configuration.file='${MINIFI_HOME}'/conf/config.yml|g' \
> +        ${D}${MINIFI_HOME}/conf/minifi.properties
> +
> +    sed -i 's|export MINIFI_HOME=.*|export MINIFI_HOME='${MINIFI_HOME}'|g' ${D}${MINIFI_BIN}/minifi.sh
> +    sed -i 's|bin_dir=${MINIFI_HOME}/bin|bin_dir='${MINIFI_BIN}'|g' ${D}${MINIFI_BIN}/minifi.sh
> +    sed -i 's|pid_file=${bin_dir}|pid_file='${MINIFI_RUN}'|g' ${D}${MINIFI_BIN}/minifi.sh
> +
> +    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +        install -d ${D}${sysconfdir}/tmpfiles.d/
> +        install -m 0644 ${WORKDIR}/systemd-volatile.conf ${D}${sysconfdir}/tmpfiles.d/
> +        install -m 0755 -d ${D}${systemd_unitdir}/system
> +        install -m 0644 ${WORKDIR}/minifi.service ${D}${systemd_unitdir}/system/
> +
> +        sed -i 's|@LOCALSTATEDIR@|${localstatedir}|g' ${D}${systemd_unitdir}/system/minifi.service
> +        sed -i 's|@SYSCONFDIR@|${sysconfdir}|g' ${D}${systemd_unitdir}/system/minifi.service
> +        sed -i 's|@BINDIR@|${bindir}|g' ${D}${systemd_unitdir}/system/minifi.service
> +
> +        sed -i 's|@MINIFI_RUN@|'${MINIFI_RUN}'|g' ${D}${sysconfdir}/tmpfiles.d/systemd-volatile.conf
> +        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/tmpfiles.d/systemd-volatile.conf
> +
> +    elif ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
> +        install -d ${D}${sysconfdir}/default/volatiles
> +        install -m 0644 ${WORKDIR}/sysvinit-volatile.conf ${D}${sysconfdir}/default/volatiles/99_minifi
> +
> +        sed -i 's|@MINIFI_RUN@|'${MINIFI_RUN}'|g' ${D}${sysconfdir}/default/volatiles/99_minifi
> +        sed -i 's|@MINIFI_LOG@|'${MINIFI_LOG}'|g' ${D}${sysconfdir}/default/volatiles/99_minifi
> +    fi
> +}
> +
> +pkg_postinst_${PN}() {
> +    if [ -z "$D" ]; then
> +        if type systemd-tmpfiles >/dev/null; then
> +            systemd-tmpfiles --create
> +        elif [ -e ${sysconfdir}/init.d/populate-volatile.sh ]; then
> +            ${sysconfdir}/init.d/populate-volatile.sh update
> +        fi
> +    fi
> +}
> +
> +FILES_${PN} = " \
> +        ${bindir} \
> +        ${sysconfdir} \
> +        ${systemd_unitdir} \
> +        "
> --
> 2.28.0
>
> 
