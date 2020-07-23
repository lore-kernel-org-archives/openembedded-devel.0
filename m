Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
 by mx.groups.io with SMTP id smtpd.web12.13669.1595514853884467674
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Jul 2020 07:34:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lVvhMDmP;
 spf=pass (domain: gmail.com, ip: 209.85.216.65, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f65.google.com with SMTP id gc9so3250355pjb.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Jul 2020 07:34:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:autocrypt:organization:message-id
         :date:user-agent:mime-version:in-reply-to;
        bh=3TAuUz0OCn5gfFsIRgTcJIpuwz/LxDjM9jO5wkqTIDI=;
        b=lVvhMDmPr1r3ogdFAv099aiZ7E+/c37EPocjRWf/N9anX1sxLrrRyQKmt/MkaPeHDB
         Q/67LcoSl/Ft2NurOVSBTnEeOjKXpA/VtgquaT7Na5KzaqD8C5UT0SX3HNsPiGsSpWvD
         l7hap1bJx9JFHyLsQBHzn5jMGPo3Zi8u57zu52alq3pChVxbVJ/2KO64SgnviB5yN26x
         jNnlyHvepZz3dSnnejyf31wS4XcrwMgvmYbYUGOFxbLf+yopir1UZ515a3F6AsGPJekG
         4dqoGLHlVIeOIQAYlYsDKG+BIpMt9nMYxNsTDgergmwy4gdh2+YnUmXHnXdc4EqdhAvZ
         Pv6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to;
        bh=3TAuUz0OCn5gfFsIRgTcJIpuwz/LxDjM9jO5wkqTIDI=;
        b=Ai4/A4tnhhRnrEntXoXgrBfA5LBElt+RhOcwVZ6nkiaXt5eG1EIYtVv7v7VZ8mbTxv
         QDRkdrzA236un/BTDb9PIvB7RG4PjFiMc2k2GN9Lfb+06tve6PT6zS5LQHswQAXb+aTn
         OMM69NoLNTgDNhIw4U2Q6Rk3s85RuwpHewswsp5DPNxg4fPQ+Rlock955rWY5cd81CUn
         ErNlEWro9EjetOC2QgtKuIvNfQ6F7ZQ5KjXgF2RkgG8JzLWeF9LJelI6jN9Z6fXdk/Kh
         6Im+Qibrek2UwnpPv3YvJZOJS2t5jHmY5rn06FMsZN6dKdELR0F0zNvD621BY26jTTqW
         POgw==
X-Gm-Message-State: AOAM532z11mY4VfXjhFgGSKwLb9Teru/myZvm6nTbRSMn8OadUZVKNpU
	iMUM2o87+BVHfGYmUWuO8ZI=
X-Google-Smtp-Source: ABdhPJxuUtTaQclkC93D/YC00lFZV6yYS0mybBKnexacniJRDA02pRL4dAqX8WgeGH7UUWT6UgZE5g==
X-Received: by 2002:a17:90a:f68c:: with SMTP id cl12mr624544pjb.116.1595514853067;
        Thu, 23 Jul 2020 07:34:13 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::fba5? ([2601:646:9200:4e0::fba5])
        by smtp.gmail.com with ESMTPSA id h131sm3351961pfe.138.2020.07.23.07.34.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jul 2020 07:34:12 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH v2] minifi: Add recipe for c++ version
To: "wonjong.lee" <wonjong.lee@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: Junhwa.Rhee@windriver.com, jeff.kim@windriver.com, andy.kang@windriver.com
References: <20200723052122.22468-1-wonjong.lee@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Autocrypt: addr=raj.khem@gmail.com; keydata=
 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
Organization: HIMVIS LLC
Message-ID: <fe9266ec-3367-c805-a892-0c8eb905b78e@gmail.com>
Date: Thu, 23 Jul 2020 07:34:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723052122.22468-1-wonjong.lee@windriver.com>
X-Groupsio-MsgNum: 85873
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="UTRfPE7LvnEFPPzkzLfiynMpqUKq2QQP5"

--UTRfPE7LvnEFPPzkzLfiynMpqUKq2QQP5
Content-Type: multipart/mixed; boundary="xPUlgYeyGOjZydObwWqCccNbtl2EEuV3M";
 protected-headers="v1"
From: Khem Raj <raj.khem@gmail.com>
To: "wonjong.lee" <wonjong.lee@windriver.com>,
 openembedded-devel@lists.openembedded.org
Cc: Junhwa.Rhee@windriver.com, jeff.kim@windriver.com, andy.kang@windriver.com
Message-ID: <fe9266ec-3367-c805-a892-0c8eb905b78e@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] minifi: Add recipe for c++ version
References: <20200723052122.22468-1-wonjong.lee@windriver.com>
In-Reply-To: <20200723052122.22468-1-wonjong.lee@windriver.com>

--xPUlgYeyGOjZydObwWqCccNbtl2EEuV3M
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



On 7/22/20 10:21 PM, wonjong.lee wrote:
> MiNiFi--a subproject of Apache NiFi--is a complementary data
> collection approach that supplements the core tenets of NiFi
> in dataflow management, focusing on the collection of data at
> the source of its creation. The C++ implementation is an
> additional implementation to the one in Java with the aim of
> an even smaller resource footprint.
>=20

fails to build on mips
https://errors.yoctoproject.org/Errors/Details/423802/

> Signed-off-by: wonjong.lee <wonjong.lee@windriver.com>
> ---
>  .../files/fix-OSSPUUID-cross-compile.patch    | 70 +++++++++++++++++++
>  .../files/fix-build-issue-in-yocto.patch      | 62 ++++++++++++++++
>  .../minifi-cpp/files/minifi.service           | 13 ++++
>  .../minifi-cpp/minifi-cpp_0.7.0.bb            | 64 +++++++++++++++++
>  4 files changed, 209 insertions(+)
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUU=
ID-cross-compile.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/fix-build-=
issue-in-yocto.patch
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/files/minifi.ser=
vice
>  create mode 100644 meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0=
.bb
>=20
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cros=
s-compile.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cr=
oss-compile.patch
> new file mode 100644
> index 000000000..6af47cafb
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-OSSPUUID-cross-compi=
le.patch
> @@ -0,0 +1,70 @@
> +diff -urN orig/cmake/BundledOSSPUUID.cmake patched/cmake/BundledOSSPUUI=
D.cmake
> +--- orig/cmake/BundledOSSPUUID.cmake	2020-01-07 22:55:55.000000000 +090=
0
> ++++ patched/cmake/BundledOSSPUUID.cmake	2020-07-14 11:32:28.221092406 +=
0900
> +@@ -22,7 +22,8 @@
> +=20
> +     # Define patch step
> +     find_package(Patch REQUIRED)
> +-    set(PC "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/ossp=
-uuid/ossp-uuid-mac-fix.patch")
> ++    set(PATCH1 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/=
ossp-uuid/ossp-uuid-mac-fix.patch")
> ++    set(PATCH2 "${Patch_EXECUTABLE}" -p1 -i "${SOURCE_DIR}/thirdparty/=
ossp-uuid/cross-compile-fix.patch")
> +=20
> +     # Define byproducts
> +     set(BYPRODUCTS "lib/libuuid.a"
> +@@ -35,7 +36,9 @@
> +     ENDFOREACH(BYPRODUCT)
> +=20
> +     # Build project
> +-    set(CONFIGURE_COMMAND ./configure "CFLAGS=3D-fPIC" "CXXFLAGS=3D-fP=
IC" --with-cxx --without-perl --without-php --without-pgsql "--prefix=3D${B=
INARY_DIR}/thirdparty/ossp-uuid-install")
> ++    set(CONFIGURE_COMMAND ac_cv_va_copy=3DC99 ./configure CFLAGS=3D-fP=
IC CXXFLAGS=3D-fPIC --host=3D${HOST_SYS}
> ++        --with-cxx --without-perl --without-php --without-pgsql
> ++        --prefix=3D${BINARY_DIR}/thirdparty/ossp-uuid-install)
> +     string(TOLOWER "${CMAKE_BUILD_TYPE}" build_type)
> +     if(NOT build_type MATCHES debug)
> +         list(APPEND CONFIGURE_COMMAND --enable-debug=3Dyes)
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
> +diff -urN orig/thirdparty/ossp-uuid/cross-compile-fix.patch patched/thi=
rdparty/ossp-uuid/cross-compile-fix.patch
> +--- orig/thirdparty/ossp-uuid/cross-compile-fix.patch	1970-01-01 09:00:=
00.000000000 +0900
> ++++ patched/thirdparty/ossp-uuid/cross-compile-fix.patch	2020-07-14 11:=
48:13.781090409 +0900
> +@@ -0,0 +1,31 @@
> ++diff -urN orig/config.sub patched/config.sub
> ++--- orig/config.sub	2008-07-05 06:43:08.000000000 +0900
> +++++ patched/config.sub	2020-07-14 11:46:47.249090591 +0900
> ++@@ -238,6 +238,7 @@
> ++ =09# Some are omitted here because they have special meanings below.
> ++ =091750a | 580 \
> ++ =09| a29k \
> +++	| aarch64 | aarch64_be \
> ++ =09| alpha | alphaev[4-8] | alphaev56 | alphaev6[78] | alphapca5[67] =
\
> ++ =09| alpha64 | alpha64ev[4-8] | alpha64ev56 | alpha64ev6[78] | alpha6=
4pca5[67] \
> ++ =09| am33_2.0 \
> ++@@ -314,6 +315,7 @@
> ++ =09# Recognize the basic CPU types with company name.
> ++ =09580-* \
> ++ =09| a29k-* \
> +++	| aarch64-* | aarch64_be-* \
> ++ =09| alpha-* | alphaev[4-8]-* | alphaev56-* | alphaev6[78]-* \
> ++ =09| alpha64-* | alpha64ev[4-8]-* | alpha64ev56-* | alpha64ev6[78]-* =
\
> ++ =09| alphapca5[67]-* | alpha64pca5[67]-* | arc-* \
> ++diff -urN orig/shtool patched/shtool
> ++--- orig/shtool	2008-07-05 06:43:08.000000000 +0900
> +++++ patched/shtool	2020-07-13 19:35:49.557213657 +0900
> ++@@ -1400,7 +1400,7 @@
> ++             if [ ".$opt_t" =3D .yes ]; then
> ++                 echo "strip $dsttmp" 1>&2
> ++             fi
> ++-            strip $dsttmp || shtool_exit $?
> +++            $STRIP $dsttmp || shtool_exit $?
> ++         fi
> ++         if [ ".$opt_o" !=3D . ]; then
> ++             if [ ".$opt_t" =3D .yes ]; then
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-i=
n-yocto.patch b/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-i=
n-yocto.patch
> new file mode 100644
> index 000000000..a7232c025
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/fix-build-issue-in-yocto=
.patch
> @@ -0,0 +1,62 @@
> +diff -urN orig/cmake/LibreSSL.cmake patched/cmake/LibreSSL.cmake
> +--- orig/cmake/LibreSSL.cmake	2020-01-07 22:55:55.000000000 +0900
> ++++ patched/cmake/LibreSSL.cmake	2020-07-14 12:01:28.321088730 +0900
> +@@ -27,6 +27,17 @@
> + =09	set(BYPRODUCT_PREFIX "" CACHE STRING "" FORCE)
> + =09set(BUILD_ARGS " -GVisual Studio 15 2017")
> + =09endif(WIN32)
> ++
> ++	set(BYPRODUCTS
> ++	=09"lib/${BYPRODUCT_PREFIX}crypto${BYPRODUCT_SUFFIX}"
> ++	=09"lib/${BYPRODUCT_PREFIX}ssl${BYPRODUCT_SUFFIX}"
> ++	=09"lib/${BYPRODUCT_PREFIX}tls${BYPRODUCT_SUFFIX}"
> ++	)
> ++	set(LIBRESSL_INSTALL_DIR "${BINARY_DIR}/thirdparty/libressl-install" =
CACHE STRING "" FORCE)
> ++	FOREACH(BYPRODUCT ${BYPRODUCTS})
> ++	=09LIST(APPEND LIBRESSL_LIBRARIES_LIST "${LIBRESSL_INSTALL_DIR}/${BYP=
RODUCT}")
> ++	ENDFOREACH(BYPRODUCT)
> ++
> + =09ExternalProject_Add(
> + =09libressl-portable
> + =09URL https://cdn.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar=
.gz https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-2.8.3.tar.gz http=
s://gentoo.osuosl.org/distfiles/libressl-2.8.3.tar.gz
> +@@ -37,6 +48,7 @@
> + =09	=09	"-DLIBRESSL_APPS=3DOFF"
> + =09	=09	"-DLIBRESSL_TESTS=3DOFF"
> + =09	=09	"${BUILD_ARGS}"
> ++	BUILD_BYPRODUCTS ${LIBRESSL_LIBRARIES_LIST}
> + =09)
> +=20
> + =09add_library(crypto STATIC IMPORTED)
> +diff -urN orig/CMakeLists.txt patched/CMakeLists.txt
> +--- orig/CMakeLists.txt	2020-01-07 22:55:55.000000000 +0900
> ++++ patched/CMakeLists.txt	2020-07-14 16:25:51.581055220 +0900
> +@@ -120,12 +120,12 @@
> + endif()
> +=20
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
> +=20
> + if (UNIX AND USE_GOLD_LINKER AND NOT APPLE )
> +   execute_process(COMMAND ${CMAKE_C_COMPILER} -fuse-ld=3Dgold -Wl,--ve=
rsion ERROR_QUIET OUTPUT_VARIABLE ld_version)
> +@@ -303,8 +303,10 @@
> +     GIT_TAG "f3294d9d86e6a7915a967efff2842089b8b0d071"  # Version 7.64=
.0
> +     SOURCE_DIR "${CMAKE_CURRENT_BINARY_DIR}/thirdparty/curl-src"
> +     LIST_SEPARATOR % # This is needed for passing semicolon-separated =
lists
> ++    TLS_VERIFY OFF
> +     CMAKE_ARGS ${PASSTHROUGH_CMAKE_ARGS}
> +                "-DCMAKE_INSTALL_PREFIX=3D${CMAKE_CURRENT_BINARY_DIR}/t=
hirdparty/curl-install"
> ++               "-DCMAKE_INSTALL_LIBDIR=3Dlib${LIBSUFFIX}"
> +                 -DCMAKE_POSITION_INDEPENDENT_CODE=3DON
> +                 -DBUILD_CURL_EXE=3DOFF
> +                 -DBUILD_TESTING=3DOFF
> diff --git a/meta-oe/recipes-extended/minifi-cpp/files/minifi.service b/=
meta-oe/recipes-extended/minifi-cpp/files/minifi.service
> new file mode 100644
> index 000000000..c0e419c67
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/files/minifi.service
> @@ -0,0 +1,13 @@
> +[Unit]
> +Description=3DMiNiFi Service
> +After=3Dnetwork.target
> +RequiresMountsFor=3D/var
> +
> +[Service]
> +Type=3Dsimple
> +Environment=3DMINIFI_HOME=3D/etc/minifi
> +ExecStartPre=3D@BASE_BINDIR@/mkdir -p /var/lib/minifi /var/log/minifi
> +ExecStart=3D@BINDIR@/minifi
> +
> +[Install]
> +WantedBy=3Dmulti-user.target
> diff --git a/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb b/m=
eta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
> new file mode 100644
> index 000000000..b7e6c26fd
> --- /dev/null
> +++ b/meta-oe/recipes-extended/minifi-cpp/minifi-cpp_0.7.0.bb
> @@ -0,0 +1,64 @@
> +SUMMARY =3D "A subproject of Apache NiFi to collect data where it origi=
nates."
> +DESCRIPTION =3D "MiNiFi--a subproject of Apache NiFi--is a complementar=
y \
> +data collection approach that supplements the core tenets of NiFi in da=
taflow \
> +management, focusing on the collection of data at the source of its cre=
ation."
> +HOMEPAGE =3D "https://nifi.apache.org/minifi/index.html"
> +SECTION =3D "console/network"
> +LICENSE =3D "Apache-2.0"
> +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Df9534eb5f4ab800b573a37bffc62=
f3a7"
> +
> +DEPENDS =3D "libxcrypt bzip2 expat flex zlib python3 bison-native"
> +RDEPENDS_${PN} =3D "python3-core"
> +
> +SRCREV =3D "aa42957a2e227df41510047cece3cd606dc1cb6a"
> +SRC_URI =3D "git://github.com/apache/nifi-minifi-cpp.git \
> +           file://fix-build-issue-in-yocto.patch \
> +           file://fix-OSSPUUID-cross-compile.patch \
> +           file://minifi.service \
> +           "
> +
> +S =3D "${WORKDIR}/git"
> +
> +inherit pkgconfig cmake systemd
> +
> +SYSTEMD_PACKAGES =3D "minifi-cpp"
> +SYSTEMD_SERVICE_${PN} =3D "minifi.service"
> +
> +EXTRA_OECMAKE +=3D " \
> +    -DHOST_SYS=3D${HOST_SYS} -DBUILD_SYS=3D${BUILD_SYS} \
> +    -DSKIP_TESTS=3DON \
> +    "
> +
> +OECMAKE_FIND_ROOT_PATH_MODE_PROGRAM =3D "BOTH"
> +
> +
> +do_install() {
> +    DESTDIR=3D'${B}/minifi-install' cmake_runcmake_build --target ${OEC=
MAKE_TARGET_INSTALL}
> +
> +    CONF_DIR=3D${D}${base_prefix}/etc/minifi/conf
> +    install -d ${D}${base_prefix}/usr/bin
> +    install -d ${CONF_DIR}
> +    cp -a ${B}/minifi-install/usr/bin/*   ${D}${base_prefix}/usr/bin/
> +    cp -a ${B}/minifi-install/usr/conf/*  ${CONF_DIR}/
> +    sed -i 's|#appender.rolling.directory=3D.*|appender.rolling.directo=
ry=3D/var/log/minifi|g' \
> +        ${CONF_DIR}/minifi-log.properties
> +    sed -i 's|nifi.provenance.repository.directory.default=3D.*|nifi.pr=
ovenance.repository.directory.default=3D/var/lib/minifi/provenance_reposito=
ry|g' \
> +        ${CONF_DIR}/minifi.properties
> +    sed -i 's|nifi.flowfile.repository.directory.default=3D.*|nifi.flow=
file.repository.directory.default=3D/var/lib/minifi/flowfile_repository|g' =
\
> +        ${CONF_DIR}/minifi.properties
> +    sed -i 's|nifi.database.content.repository.directory.default=3D.*|n=
ifi.database.content.repository.directory.default=3D/var/lib/minifi/content=
_repository|g' \
> +        ${CONF_DIR}/minifi.properties
> +    sed -i 's|nifi.flow.configuration.file=3D.*|nifi.flow.configuration=
.file=3D/etc/minifi/conf/config.yml|g' \
> +        ${CONF_DIR}/minifi.properties
> +
> +    install -m 0755 -d ${D}${systemd_unitdir}/system
> +    install -m 0644 ${WORKDIR}/minifi.service ${D}${systemd_unitdir}/sy=
stem/
> +    sed -i -e 's|@BASE_BINDIR@|${base_bindir}|g' ${D}${systemd_unitdir}=
/system/minifi.service
> +    sed -i -e 's|@BINDIR@|${bindir}|g' ${D}${systemd_unitdir}/system/mi=
nifi.service
> +}
> +
> +FILES_${PN} =3D " \
> +        /usr/bin/* \
> +        /etc/minifi/* \
> +        ${systemd_unitdir}/system/minifi.service \
> +        "
>=20
>=20
>=20
>=20


--xPUlgYeyGOjZydObwWqCccNbtl2EEuV3M--

--UTRfPE7LvnEFPPzkzLfiynMpqUKq2QQP5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSPpVvapDR0rgZCCc27BTNVkZ0zFAUCXxmf2QAKCRC7BTNVkZ0z
FM6BAKCSINtVrquOpqJp/Yk/N1d5FWdMywCdFH7M1/wzZkJlXBEXDQFITcLGFI0=
=b9nW
-----END PGP SIGNATURE-----

--UTRfPE7LvnEFPPzkzLfiynMpqUKq2QQP5--
