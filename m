Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.9039.1625590403432831993
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 Jul 2021 09:53:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H+Wjz1sp;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id fi7so9524141qvb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 06 Jul 2021 09:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=6P1YMKdysO7I578XrRIX4cIKa/AKLMr0VxaBODBlhc4=;
        b=H+Wjz1spPHh1gtLN+PYqMlCwiEgcDfMVgqiG1hCm3R7taDW3hfKfWDGfu/YyuNv+CI
         sdgo9kUZCEEOqk25dCg9hsBSkSmfLq0zpKXJVs/8Xd2E4HKj/rO2oWzSGvMZYO18uizz
         uG874M750R6T5dRBPUTVXorAf726ytikOGGfJ328BPJyFNDmYqTi6s5qYvCTLLmo+nT/
         lC0KGIZYkkZmT3K2Ir5Ksm4KNQmTCaeT6HExlGgG5QpjzWXsngnHZ3hEE0lKh5vUZ+Fs
         UEl9zSY6QOocdVtVHVJhUyDulDw4ArW78mF3IuYzwcA/jHg5q6R6C/Mj97J1bIgToQQe
         5yYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=6P1YMKdysO7I578XrRIX4cIKa/AKLMr0VxaBODBlhc4=;
        b=dAF2fHiCeaLK9ul5o1IMJYUllSxCOTjIPT+GJ+UGT9dYmvCf+SB/LdPAsGKLYQDTnD
         nTge4d6I+5WOzSGEKeNO8RJC4sMxXUQX5IX3s0M58tvHb8yRrn/Ewdu6tK6t1ifgsFbT
         t4V3UsfufUXK0iGG2Ob0OAWMS2DWa5PwgKXaZIPoaHv2p8OmLwUHDelIClFZ9mOZ1H3M
         8POvA3++F7rUDAxP2aEjqFFkRe1H4gnx9JJnQ67alcVaRF72tygm67SGu8nvL2zbYXOh
         EweXAB2zm4J0MGfyDtYmdLFwmFRKcb6Wf5WdIRoFlBig1tQEI/o//Xdrm7R37D7PffKL
         7Eqg==
X-Gm-Message-State: AOAM533r/NbwCmbzkKf9aJDeWQ3U5/f4g0bolOhrHEorZWx3VvaCPPKt
	OE2TPwE8EW2I8vcZmEB4YuHc1Q8altZWMKK+6Z4=
X-Google-Smtp-Source: ABdhPJy1hPsOw8/1wcNIGj4gpJoGcp3a9DCwurFV/w4koTUBCR4OjTfA43ByEShyR8rJWLflNSosTYKhONU3DoDrtoo=
X-Received: by 2002:a05:6214:c8c:: with SMTP id r12mr19145388qvr.16.1625590402377;
 Tue, 06 Jul 2021 09:53:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210706065549.187176-1-zboszor@gmail.com> <CAMKF1srZS52Vt+YRVi-7WCzYOjBWAJH3Cy8PZCc2B8XgTgO2Xw@mail.gmail.com>
 <ccf11a0f-eed1-553c-772f-2631618d0529@pr.hu>
In-Reply-To: <ccf11a0f-eed1-553c-772f-2631618d0529@pr.hu>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 6 Jul 2021 09:52:56 -0700
Message-ID: <CAMKF1srUo4WPW_vmCOj4VuQBADSxTckjBwbDbNMtroxAwKggEg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] mariadb: Use qemu to run cross-compiled binaries
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 6, 2021 at 2:56 AM B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbos=
zor@pr.hu> wrote:
>
> 2021. 07. 06. 10:37 keltez=C3=A9ssel, Khem Raj =C3=ADrta:
> > On Mon, Jul 5, 2021 at 11:56 PM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi=
 <zboszor@gmail.com> wrote:
> >>
> >> This way, mariadb does not depend on mariadb-native anymore.
> >>
> >
> > how does build time gets impacted ? you can count that native build is
> > not needed but still it will be good to know.
>
> The build time of mariadb itself does not change significantly,
> it's around 15 minutes either way on our 16-core build machine.
> Same amount of time for mariadb-native, which is saved now.
>

sounds good. poco is perhaps only other usecase for mariadb-native

> > qemu dependency also means that qemu usermode has to be supported for
> > this to work, which maybe troublesome on some
> > newer or lesser known architectures but perhaps thats a fine compromis=
e perhaps.
> >
> >> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.=
com>
> >> ---
> >>   meta-oe/recipes-dbs/mysql/mariadb.inc         | 27 ++++----
> >>   .../mysql/mariadb/cross-compiling.patch       | 25 -------
> >>   ...Lists.txt-fix-gen_lex_hash-not-found.patch | 67 ----------------=
---
> >>   meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb  |  4 +-
> >>   4 files changed, 15 insertions(+), 108 deletions(-)
> >>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/cross-compilin=
g.patch
> >>   delete mode 100644 meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists=
.txt-fix-gen_lex_hash-not-found.patch
> >>
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-=
dbs/mysql/mariadb.inc
> >> index 18b025070..7b1f537fb 100644
> >> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> >> @@ -12,7 +12,6 @@ SRC_URI =3D "https://downloads.mariadb.org/intersti=
tial/${BP}/source/${BP}.tar.gz
> >>              file://mysql-systemd-start \
> >>              file://configure.cmake-fix-valgrind.patch \
> >>              file://support-files-CMakeLists.txt-fix-do_populate_sysr=
oot.patch \
> >> -           file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patc=
h \
> >>              file://0001-disable-ucontext-on-musl.patch \
> >>              file://c11_atomics.patch \
> >>              file://clang_version_header_conflict.patch \
> >> @@ -21,7 +20,6 @@ SRC_URI =3D "https://downloads.mariadb.org/intersti=
tial/${BP}/source/${BP}.tar.gz
> >>              file://0001-innobase-Define-__NR_futex-if-it-does-not-ex=
ist.patch \
> >>              file://0001-aio_linux-Check-if-syscall-exists-before-usi=
ng-it.patch \
> >>              file://sys_futex.patch \
> >> -           file://cross-compiling.patch \
> >>              file://ssize_t.patch \
> >>              file://mm_malloc.patch \
> >>             "
> >> @@ -60,8 +58,6 @@ SYSTEMD_AUTO_ENABLE_${PN}-setupdb ?=3D "enable"
> >>   ALLOW_EMPTY_${PN}-setupdb ?=3D "1"
> >>   FILES_${PN}-setupdb =3D "${sysconfdir}/init.d/install_db"
> >>
> >> -EXTRA_OEMAKE =3D "'GEN_LEX_HASH=3D${STAGING_BINDIR_NATIVE}/gen_lex_h=
ash'"
> >> -
> >>   PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d=
)} setupdb"
> >>   PACKAGECONFIG_class-native =3D ""
> >>   PACKAGECONFIG[pam] =3D ",-DWITHOUT_AUTH_PAM=3DTRUE,libpam"
> >> @@ -95,6 +91,8 @@ EXTRA_OECMAKE =3D "-DWITH_EMBEDDED_SERVER=3DON \
> >>                    -DCAT_EXECUTABLE=3D`which cat` \
> >>                    -DCMAKE_AR:FILEPATH=3D${AR}"
> >>
> >> +EXTRA_OECMAKE_prepend_class-target =3D "-DCMAKE_CROSSCOMPILING_EMULA=
TOR=3D${WORKDIR}/qemuwrapper "
> >> +
> >>   # With Ninja it fails with:
> >>   # make: *** No rule to make target `install'.  Stop.
> >>   OECMAKE_GENERATOR =3D "Unix Makefiles"
> >> @@ -117,12 +115,18 @@ do_generate_toolchain_file_append_class-native =
() {
> >>       sed -i "/set( CMAKE_SYSTEM_PROCESSOR/d" ${WORKDIR}/toolchain.cm=
ake
> >>   }
> >>
> >> -do_compile_prepend_class-target () {
> >> -    # These need to be in-tree or make will think they need to be bu=
ilt,
> >> -    # and since we're cross-compiling that is disabled
> >> -    cp ${STAGING_BINDIR_NATIVE}/comp_err ${S}/extra
> >> -    cp ${STAGING_BINDIR_NATIVE}/comp_sql ${S}/scripts
> >> +do_configure_prepend_class-target () {
> >> +       # Write out a qemu wrapper that will be used by cmake
> >> +       # so that it can run target helper binaries through that.
> >> +       qemu_binary=3D"${@qemu_wrapper_cmdline(d, d.getVar('STAGING_D=
IR_HOST'), [d.expand('${STAGING_DIR_HOST}${libdir}'),d.expand('${STAGING_DI=
R_HOST}${base_libdir}')])}"
> >> +       cat > ${WORKDIR}/qemuwrapper << EOF
> >> +#!/bin/sh
> >> +$qemu_binary "\$@"
> >> +EOF
> >> +       chmod +x ${WORKDIR}/qemuwrapper
> >> +}
> >>
> >> +do_compile_prepend_class-target () {
> >>       if [ "${@bb.utils.contains('PACKAGECONFIG', 'krb5', 'yes', 'no'=
, d)}" =3D "no" ]; then
> >>           if ! [ -e ${B}/include/openssl/kssl.h ] ; then
> >>               mkdir -p ${B}/include/openssl
> >> @@ -132,11 +136,6 @@ do_compile_prepend_class-target () {
> >>               echo "#endif" >>${B}/include/openssl/kssl.h
> >>           fi
> >>       fi
> >> -    # workaround to handle out-of-source build from source package
> >> -    yacc_files=3D"sql_yacc.hh sql_yacc.cc sql_yacc_ora.hh sql_yacc_o=
ra.cc"
> >> -    for yacc_file in ${yacc_files}; do
> >> -        cp ${S}/sql/${yacc_file} ${B}/sql/${yacc_file}
> >> -    done
> >>   }
> >>
> >>   SYSROOT_PREPROCESS_FUNCS +=3D "mariadb_sysroot_preprocess"
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch =
b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> >> deleted file mode 100644
> >> index 0f4815b18..000000000
> >> --- a/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> >> +++ /dev/null
> >> @@ -1,25 +0,0 @@
> >> -This is not needed for OE builds
> >> -
> >> -building failed since native does not generate import_executables.cm=
ake
> >> -In fact, our building system will export the needed commands
> >> -
> >> -Upstream-Status: Inappropriate [configuration]
> >> -
> >> -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> >> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> -
> >> ---- a/CMakeLists.txt
> >> -+++ b/CMakeLists.txt
> >> -@@ -392,11 +392,6 @@ CHECK_PCRE()
> >> -
> >> - CHECK_SYSTEMD()
> >> -
> >> --IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULAT=
OR)
> >> --  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path=
 to import_executables.cmake from a native build")
> >> --  INCLUDE(${IMPORT_EXECUTABLES})
> >> --ENDIF()
> >> --
> >> - #
> >> - # Setup maintainer mode options. Platform checks are
> >> - # not run with the warning options as to not perturb fragile checks
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix=
-gen_lex_hash-not-found.patch b/meta-oe/recipes-dbs/mysql/mariadb/sql-CMake=
Lists.txt-fix-gen_lex_hash-not-found.patch
> >> deleted file mode 100644
> >> index 4cb044339..000000000
> >> --- a/meta-oe/recipes-dbs/mysql/mariadb/sql-CMakeLists.txt-fix-gen_le=
x_hash-not-found.patch
> >> +++ /dev/null
> >> @@ -1,67 +0,0 @@
> >> -From cfce1491827e5a581878b5e166bf4d30e6d90e07 Mon Sep 17 00:00:00 20=
01
> >> -From: Mingli Yu <mingli.yu@windriver.com>
> >> -Date: Thu, 23 Jul 2020 00:08:16 -0700
> >> -Subject: [PATCH] sql/CMakeLists.txt: fix gen_lex_hash not found
> >> -
> >> -Fix the below do_compile issue in cross-compiling env.
> >> -| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-=
linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_hash', needed by 'sql/=
lex_hash.h'.  Stop.
> >> -| make[2]: *** No rule to make target '/build/tmp/work/aarch64-poky-=
linux/mariadb/10.3.13-r0/mariadb-10.3.13/sql/gen_lex_token', needed by 'sql=
/lex_token.h'.  Stop.
> >> -
> >> -Upstream-Status: Inappropriate [oe build specific]
> >> -
> >> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >> ----
> >> - sql/CMakeLists.txt | 30 ++++++++++++++++++++----------
> >> - 1 file changed, 20 insertions(+), 10 deletions(-)
> >> -
> >> -diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> >> -index 0dc3caa..616017b 100644
> >> ---- a/sql/CMakeLists.txt
> >> -+++ b/sql/CMakeLists.txt
> >> -@@ -52,11 +52,16 @@ ${CMAKE_BINARY_DIR}/sql
> >> - ${CMAKE_SOURCE_DIR}/tpool
> >> - )
> >> -
> >> --ADD_CUSTOM_COMMAND(
> >> --  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> >> --  COMMAND gen_lex_token > lex_token.h
> >> --  DEPENDS gen_lex_token
> >> --)
> >> -+IF(NOT CMAKE_CROSSCOMPILING)
> >> -+  ADD_CUSTOM_COMMAND(
> >> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> >> -+   COMMAND gen_lex_token > lex_token.h
> >> -+   DEPENDS gen_lex_token)
> >> -+ELSE()
> >> -+  ADD_CUSTOM_COMMAND(
> >> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_token.h
> >> -+   COMMAND gen_lex_token > lex_token.h)
> >> -+ENDIF()
> >> -
> >> - ADD_CUSTOM_COMMAND(
> >> -   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/sql_yacc_ora.yy
> >> -@@ -345,11 +350,16 @@ IF(NOT CMAKE_CROSSCOMPILING)
> >> -   ADD_EXECUTABLE(gen_lex_hash gen_lex_hash.cc)
> >> - ENDIF()
> >> -
> >> --ADD_CUSTOM_COMMAND(
> >> --  OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> >> --  COMMAND gen_lex_hash > lex_hash.h
> >> --  DEPENDS gen_lex_hash
> >> --)
> >> -+IF(NOT CMAKE_CROSSCOMPILING)
> >> -+  ADD_CUSTOM_COMMAND(
> >> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> >> -+   COMMAND gen_lex_hash > lex_hash.h
> >> -+   DEPENDS gen_lex_hash)
> >> -+ELSE()
> >> -+  ADD_CUSTOM_COMMAND(
> >> -+   OUTPUT ${CMAKE_CURRENT_BINARY_DIR}/lex_hash.h
> >> -+   COMMAND gen_lex_hash > lex_hash.h)
> >> -+ENDIF()
> >> -
> >> - MYSQL_ADD_EXECUTABLE(mariadb-tzinfo-to-sql tztime.cc COMPONENT Serv=
er)
> >> - SET_TARGET_PROPERTIES(mariadb-tzinfo-to-sql PROPERTIES COMPILE_FLAG=
S "-DTZINFO2SQL")
> >> ---
> >> -2.17.1
> >> -
> >> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb b/meta-oe/r=
ecipes-dbs/mysql/mariadb_10.5.10.bb
> >> index 8ae8241b0..57d7736ea 100644
> >> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> >> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> >> @@ -1,8 +1,8 @@
> >>   require mariadb.inc
> >>
> >> -EXTRA_OECMAKE +=3D "-DSTACK_DIRECTION=3D-1"
> >> +inherit qemu
> >>
> >> -DEPENDS +=3D "mariadb-native bison-native boost libpcre2 curl openss=
l ncurses zlib libaio libedit libevent libxml2"
> >> +DEPENDS +=3D "qemu-native bison-native boost libpcre2 curl openssl n=
curses zlib libaio libedit libevent libxml2"
> >>
> >>   PROVIDES +=3D "mysql5 libmysqlclient"
> >>
> >> --
> >> 2.31.1
> >>
> >>
> >>
> >>=20
> >>
>
