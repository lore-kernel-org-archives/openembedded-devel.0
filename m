Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web08.3508.1625560671030607099
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 01:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=A3vHnhA0;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id v17so9370881qvw.12
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 01:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=akZhRHZ7oTY8rTGxK02HY2Im+nlZdLJKsL8iiT6Qn0g=;
        b=A3vHnhA0i6OBMH8ow4ZViYPebNY4Y+xEaiKN02FtVAfzko2iBGeRP3M1cLk//nc7t0
         IiSBHNuXqbUEWx0/rRw2iEyP+p0+VxqVAUvJarrotkPONH4FKvZp2dcmayyIQ895cc12
         M7fYISyEQ5EYmj3luTyCnkzgnxfr+mxdLrDyocStIbyypPeAP5mUOYyM4eiqYUCOLfGO
         u/oL8+LvGGPzKoANxmEhkc99V+Z/anxDxBBFW/Guko5kLkKjman3FRCaF9PbHxWIX7tI
         w53Nv6u/V3lSM2u447/EHCpeWFccMXj9YT7TpTvPp1bylMQYSRXfZN91e4ayZrmlbdKo
         auxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=akZhRHZ7oTY8rTGxK02HY2Im+nlZdLJKsL8iiT6Qn0g=;
        b=WgWpakwUk8sr3+Zv4Gnun0Kf0duCtT2WdkMexGZXq/NNV1rGL3Fa0nWH693cnSdRsu
         K6rySh8ROxJj8jlbzG5nV0+5Apjia3VMDoZi3mRotlgpyZTGWWUcZzcMZ6TZ8IB6S1FK
         57BZV1LKmbxZEYp5maQJQki/kOzIo7Nu414JGD/fFykCJ6R8POngAOGuSwWaww2rd+xw
         7q+MmdDajkiV9qHlW0QuhTkXEEkVz/ONX/5hByyVJp1T02QOF/QJJNDzK++gtW1GE6oM
         McOau8GwIY2t0HrkFxBes6QxKBKizEnbwpmGJNMZj7wxNHqLjTx9fgyux9v3tVxD/4JD
         pTmw==
X-Gm-Message-State: AOAM531z6+8quIZe+qXDEh3Iq9rQ12RMfEE12ZYOlZk0tnJC9Df3X8OB
	AqraFrK38AfRGqi9xJ5eW7ffq/5IXTaQpkGogyw=
X-Google-Smtp-Source: ABdhPJyy7h88N7bmdcs5tfQc5LKfibgBhR2gPmpiWR7NsnVhQI9YVdjWbNEdexx5+VtynxrP618zv6y0bgUt5IOz7mk=
X-Received: by 2002:a0c:ecc8:: with SMTP id o8mr17161672qvq.55.1625560670127;
 Tue, 06 Jul 2021 01:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210706065549.187176-1-zboszor@gmail.com>
In-Reply-To: <20210706065549.187176-1-zboszor@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Jul 2021 01:37:24 -0700
Message-ID: <CAMKF1srZS52Vt+YRVi-7WCzYOjBWAJH3Cy8PZCc2B8XgTgO2Xw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 1/2] mariadb: Use qemu to run cross-compiled binaries
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 5, 2021 at 11:56 PM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zbo=
szor@gmail.com> wrote:
>
> This way, mariadb does not depend on mariadb-native anymore.
>

how does build time gets impacted ? you can count that native build is
not needed but still it will be good to know.
qemu dependency also means that qemu usermode has to be supported for
this to work, which maybe troublesome on some
newer or lesser known architectures but perhaps thats a fine compromise per=
haps.

> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  meta-oe/recipes-dbs/mysql/mariadb.inc         | 27 ++++----
>  .../mysql/mariadb/cross-compiling.patch       | 25 -------
>  ...Lists.txt-fix-gen_lex_hash-not-found.patch | 67 -------------------
>  meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb  |  4 +-
>  4 files changed, 15 insertions(+), 108 deletions(-)
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.pat=
ch
>  delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-=
fix-gen_lex_hash-not-found.patch
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/=
mysql/mariadb.inc
> index 18b025070..7b1f537fb 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -12,7 +12,6 @@ SRC_URI =3D "https://downloads.mariadb.org/interstitial=
/${BP}/source/${BP}.tar.gz
>             file://mysql-systemd-start \
>             file://configure.cmake-fix-valgrind.patch \
>             file://support-files-CMakeLists.txt-fix-do_populate_sysroot.p=
atch \
> -           file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>             file://0001-disable-ucontext-on-musl.patch \
>             file://c11_atomics.patch \
>             file://clang_version_header_conflict.patch \
> @@ -21,7 +20,6 @@ SRC_URI =3D "https://downloads.mariadb.org/interstitial=
/${BP}/source/${BP}.tar.gz
>             file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.p=
atch \
>             file://0001-aio_linux-Check-if-syscall-exists-before-using-it=
.patch \
>             file://sys_futex.patch \
> -           file://cross-compiling.patch \
>             file://ssize_t.patch \
>             file://mm_malloc.patch \
>            "
> @@ -60,8 +58,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?=3D "enable"
>  ALLOW_EMPTY_${PN}-setupdb ?=3D "1"
>  FILES_${PN}-setupdb =3D "${sysconfdir}/init.d/install_db"
>
> -EXTRA_OEMAKE =3D "'GEN_LEX_HASH=3D${STAGING_BINDIR_NATIVE}/gen_lex_hash'=
"
> -
>  PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} se=
tupdb"
>  PACKAGECONFIG_class-native =3D ""
>  PACKAGECONFIG[pam] =3D ",-DWITHOUT_AUTH_PAM=3DTRUE,libpam"
> @@ -95,6 +91,8 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
>                   -DCAT_EXECUTABLE=3D`which cat` \
>                   -DCMAKE_AR:FILEPATH=3D${AR}"
>
> +EXTRA_OECMAKE_prepend_class-target =3D "-DCMAKE_CROSSCOMPILING_EMULATOR=
=3D${WORKDIR}/qemuwrapper "
> +
>  # With Ninja it fails with:
>  # make: *** No rule to make target `install'.  Stop.
>  OECMAKE_GENERATOR =3D "Unix Makefiles"
> @@ -117,12 +115,18 @@ do_generate_toolchain_file_append_class-native () {
>      sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cmake
>  }
>
> -do_compile_prepend_class-target () {
> -    # These need to be in-tree or make will think they need to be built,
> -    # and since we're cross-compiling that is disabled
> -    cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
> -    cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
> +do_configure_prepend_class-target () {
> +       # Write out a qemu wrapper that will be used by cmake
> +       # so that it can run target helper binaries through that.
> +       qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_DIR_H=
OST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DIR_HO=
ST}${base_libdir}')])}"
> +       cat > ${WORKDIR}/qemuwrapper << EOF
> +#!/bin/sh
> +$qemu_binary "\$@"
> +EOF
> +       chmod +x ${WORKDIR}/qemuwrapper
> +}
>
> +do_compile_prepend_class-target () {
>      if [ "${@bb.utils.contains('PACKAGECONFIG', 'krb5', 'yes', 'no', d)}=
" =3D "no" ]; then
>          if ! [ -e ${B}/include/openssl/kssl.h ] ; then
>              mkdir -p ${B}/include/openssl
> @@ -132,11 +136,6 @@ do_compile_prepend_class-target () {
>              echo "#endif" >>${B}/include/openssl/kssl.h
>          fi
>      fi
> -    # workaround to handle out-of-source build from source package
> -    yacc_files=3D"sql_yacc.hh sql_yacc.cc sql_yacc_ora.hh sql_yacc_ora.c=
c"
> -    for yacc_file in ${yacc_files}; do
> -        cp ${S}/sql/${yacc_file} ${B}/sql/${yacc_file}
> -    done
>  }
>
>  SYSROOT_PREPROCESS_FUNCS +=3D "mariadb_sysroot_preprocess"
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch b/me=
ta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> deleted file mode 100644
> index 0f4815b18..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> +++ /dev/null
> @@ -1,25 +0,0 @@
> -This is not needed for OE builds
> -
> -building failed since native does not generate import_executables.cmake
> -In fact, our building system will export the needed commands
> -
> -Upstream-Status: Inappropriate [configuration]
> -
> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ---- a/CMakeLists.txt
> -+++ b/CMakeLists.txt
> -@@ -392,11 +392,6 @@ CHECK_PCRE()
> -
> - CHECK_SYSTEMD()
> -
> --IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
> --  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to =
import_executables.cmake from a native build")
> --  INCLUDE(${IMPORT_EXECUTABLES})
> --ENDIF()
> --
> - #
> - # Setup maintainer mode options. Platform checks are
> - # not run with the warning options as to not perturb fragile checks
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen=
_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeList=
s.txt-fix-gen_lex_hash-not-found.patch
> deleted file mode 100644
> index 4cb044339..000000000
> --- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_lex_ha=
sh-not-found.patch
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Thu, 23 Jul 2020 00:08:16 -0700
> -Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
> -
> -Fix the below do_compile issue in cross-compiling env.
> -| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linu=
x/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_hash', needed by 'sql/lex_=
hash.h'.  Stop.
> -| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-linu=
x/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_token', needed by 'sql/lex=
_token.h'.  Stop.
> -
> -Upstream-Status: Inappropriate [oe build specific]
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
> - 1 file changed, 20 insertions(+), 10 deletions(-)
> -
> -diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> -index 0dc3caa..616017b 100644
> ---- a/sql/CMakeLists.txt
> -+++ b/sql/CMakeLists.txt
> -@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
> - ${CMAKE_SOURCE_DIR}/tpool
> - )
> -
> --ADD_CUSTOM_COMMAND(
> --  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> --  COMMAND gen_lex_token > lex_token.h
> --  DEPENDS gen_lex_token
> --)
> -+IF(NOT CMAKE_CROSSCOMPILING)
> -+  ADD_CUSTOM_COMMAND(
> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> -+   COMMAND gen_lex_token > lex_token.h
> -+   DEPENDS gen_lex_token)
> -+ELSE()
> -+  ADD_CUSTOM_COMMAND(
> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> -+   COMMAND gen_lex_token > lex_token.h)
> -+ENDIF()
> -
> - ADD_CUSTOM_COMMAND(
> -   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
> -@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
> -   ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
> - ENDIF()
> -
> --ADD_CUSTOM_COMMAND(
> --  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> --  COMMAND gen_lex_hash > lex_hash.h
> --  DEPENDS gen_lex_hash
> --)
> -+IF(NOT CMAKE_CROSSCOMPILING)
> -+  ADD_CUSTOM_COMMAND(
> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> -+   COMMAND gen_lex_hash > lex_hash.h
> -+   DEPENDS gen_lex_hash)
> -+ELSE()
> -+  ADD_CUSTOM_COMMAND(
> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> -+   COMMAND gen_lex_hash > lex_hash.h)
> -+ENDIF()
> -
> - MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Server)
> - SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAGS "-=
DTZINFO2SQL")
> ---
> -2.17.1
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb b/meta-oe/recip=
es-dbs/mysql/mariadb_10.5.10.bb
> index 8ae8241b0..57d7736ea 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> @@ -1,8 +1,8 @@
>  require mariadb.inc
>
> -EXTRA_OECMAKE +=3D "-DSTACK_DIRECTION=3D-1"
> +inherit qemu
>
> -DEPENDS +=3D "mariadb-native bison-native boost libpcre2 curl openssl nc=
urses zlib libaio libedit libevent libxml2"
> +DEPENDS +=3D "qemu-native bison-native boost libpcre2 curl openssl ncurs=
es zlib libaio libedit libevent libxml2"
>
>  PROVIDES +=3D "mysql5 libmysqlclient"
>
> --
> 2.31.1
>
