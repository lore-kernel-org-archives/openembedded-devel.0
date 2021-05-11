Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web09.217.1620745530192410051
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 May 2021 08:05:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ijdoJ0l7;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id v8so1062220qkv.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 May 2021 08:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pyTVuEOyS7SETLWDwPMFstcRj1TcDJqsJQqrd90lEWo=;
        b=ijdoJ0l7R4SfwulMJyRd9n5VU4866gWGp6aBXn8i7CL6K88J6tupQHbnW3sLvIvypT
         KyEbYToqm2XIK24TIF+e0msP58TKFLJbMGZkCMnUrIzoXhjDfLsfGEai5YCfBcDxSrDv
         CMiIbhZXzeEEZ81UAwn3tR2Zh6pAN0qryeuNOgKXqtqXBt0zvC0Hq+XHxb/Q4ZpLkzxe
         bYpPDgpAFrqdHSbWRl4YJS/aFd2d6ROAAqN0I9WB2+iRD3kghgViLv8Y9PsU0uyX9oNW
         qffi9Wq3cBBfmGzK+UI7KdkKEJIAh1upmPRMSMAL67Pu0KFnZ8Gr4zKOwuLpUSYdx9X9
         NAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pyTVuEOyS7SETLWDwPMFstcRj1TcDJqsJQqrd90lEWo=;
        b=kLCC6fC+Bqs5XOrYSJwqtgC5q0QQx5ZP5h8zrkCz05zlpjEYRXZFgx9XNXIjCmlBA1
         zE555yl6sciqzrnoVkxz7ykm21riewhavQx/lqB3fliYj1yFCUQ3cuXhJvRVhyrBrD2E
         EHraiSrS6rd8yXuMTxYV5gap2yfsGZuTCcWmROFppU/G3sGCF7jNnnGfm0FAWYG+bvTG
         7sSeryM05eCC1qyjjQ7yI37QgErlfQW4JXxw/Bi9S2PSlZcQFx4DeExn6OvdmXAZEFUw
         r2No/dTZ08LlQH5NIi0iXMQ68BxCG2fi8Yao+tFozsEcDfSPASQNajXfL6/YFsZk8be1
         wWRA==
X-Gm-Message-State: AOAM530AK7XLwR1PGPt2Ker4mElw18AIUCcAdiq9WJb7m6xKUCLtKlQ6
	g4FtAfuRYQPTBdq4CVhJH5VWQ++hdd9lsdUA4gg=
X-Google-Smtp-Source: ABdhPJwL80TXVvUjEdMfDGeIUC+uQ6zjC26B5EqSNTRBQnAsNTQPSVn+l5hWB6yO5gp9M0aGQGXJtoFG/nS/7x/dPHw=
X-Received: by 2002:a37:8ec4:: with SMTP id q187mr28411902qkd.381.1620745529161;
 Tue, 11 May 2021 08:05:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210508143843.2039576-1-raj.khem@gmail.com> <OS0PR01MB61782626117F4A2B9E03CFCAA0539@OS0PR01MB6178.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB61782626117F4A2B9E03CFCAA0539@OS0PR01MB6178.jpnprd01.prod.outlook.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 11 May 2021 08:05:02 -0700
Message-ID: <CAMKF1squZXHvPHkgmcSk2fCV_jXmQaw15PRkDW9EuZORc49Yww@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.5.10
To: "leimaohui@fujitsu.com" <leimaohui@fujitsu.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Please try latest master-next, I think this is addressed there

On Tue, May 11, 2021 at 12:52 AM leimaohui@fujitsu.com
<leimaohui@fujitsu.com> wrote:
>
> Hi, Khem
>
> I have backport your upgrade patch, but still have a build error as following:
> -----------------------------------
> CMake Error at CMakeLists.txt:397 (INCLUDE):
>   INCLUDE could not find requested file:
>
>     IMPORTFILE-NOTFOUND
> -----------------------------------
>
> So, I think " fix-a-building-failure.patch " is still necessary, but need to be updated to :
> -----------------------------------
> CMakeLists.txt | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/CMakeLists.txt b/CMakeLists.txt
> index cec9cd7e..d090d3d5 100644
> --- a/CMakeLists.txt
> +++ b/CMakeLists.txt
> @@ -392,11 +392,6 @@ CHECK_PCRE()
>
>  CHECK_SYSTEMD()
>
> -IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
> -  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
> -  INCLUDE(${IMPORT_EXECUTABLES})
> -ENDIF()
> -
>  #
>  # Setup maintainer mode options. Platform checks are
>  # not run with the warning options as to not perturb fragile checks
> --
> 2.25.1
> -----------------------------------
>
>
> Best regards
> Lei
>
> > -----Original Message-----
> > From: openembedded-devel@lists.openembedded.org
> > <openembedded-devel@lists.openembedded.org> On Behalf Of Khem Raj
> > Sent: Saturday, May 8, 2021 10:39 PM
> > To: openembedded-devel@lists.openembedded.org
> > Cc: Khem Raj <raj.khem@gmail.com>
> > Subject: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.5.10
> >
> > Drop fix-a-building-failure.patch because upstream has made is narrower to
> > apply to emulator builds and not just any cross compiling builds
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...ve_10.5.9.bb => mariadb-native_10.5.10.bb} |  0
> >  meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
> >  .../mariadb/fix-a-building-failure.patch      | 35 -------------------
> >  .../mysql/mariadb/ppc-remove-glibc-dep.patch  |  2
> > +-  .../{mariadb_10.5.9.bb => mariadb_10.5.10.bb} |  0
> >  5 files changed, 2 insertions(+), 38 deletions(-)  rename
> > meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.9.bb =>
> > mariadb-native_10.5.10.bb} (100%)  delete mode 100644
> > meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
> >  rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.9.bb =>
> > mariadb_10.5.10.bb} (100%)
> >
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
> > b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
> > similarity index 100%
> > rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
> > rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> > b/meta-oe/recipes-dbs/mysql/mariadb.inc
> > index 9833b28857..50cf5ed236 100644
> > --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> > +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> > @@ -11,7 +11,6 @@ SRC_URI =
> > "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
> >             file://install_db \
> >             file://mysql-systemd-start \
> >             file://configure.cmake-fix-valgrind.patch \
> > -           file://fix-a-building-failure.patch \
> >             file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch
> > \
> >             file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
> >             file://0001-disable-ucontext-on-musl.patch \ @@ -25,7 +24,7
> > @@ SRC_URI =
> > "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
> >            "
> >  SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
> >
> > -SRC_URI[sha256sum] =
> > "40ab19aeb8de141fdc188cf2251213c9e7351bee4d0cd29db704fae68d1068cf"
> > +SRC_URI[sha256sum] =
> > "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e40122df6bac0babb"
> >
> >  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
> >
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
> > b/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
> > deleted file mode 100644
> > index 9149ee21f2..0000000000
> > --- a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
> > +++ /dev/null
> > @@ -1,35 +0,0 @@
> > -From 1b2b6a61c9f82157cd2e0c3744f6c07e07aeb0bd Mon Sep 17 00:00:00
> > 2001
> > -From: Mingli Yu <mingli.yu@windriver.com>
> > -Date: Mon, 4 Mar 2019 01:11:30 -0800
> > -Subject: [PATCH] fix a building failure
> > -
> > -Upstream-Status: Inappropriate [configuration]
> > -
> > -building failed since native does not generate import_executables.cmake -In
> > fact, our building system will export the needed commands
> > -
> > -Signed-off-by: Roy Li <rongqing.li@windriver.com>
> > -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ----
> > - CMakeLists.txt | 5 -----
> > - 1 file changed, 5 deletions(-)
> > -
> > -diff --git a/CMakeLists.txt b/CMakeLists.txt -index fc30750..4f9110e 100644
> > ---- a/CMakeLists.txt
> > -+++ b/CMakeLists.txt
> > -@@ -347,11 +347,6 @@ CHECK_PCRE()
> > -
> > - CHECK_SYSTEMD()
> > -
> > --IF(CMAKE_CROSSCOMPILING)
> > --  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH
> > "Path to import_executables.cmake from a native build")
> > --  INCLUDE(${IMPORT_EXECUTABLES})
> > --ENDIF()
> > --
> > - #
> > - # Setup maintainer mode options. Platform checks are
> > - # not run with the warning options as to not perturb fragile checks
> > ---
> > -2.17.1
> > -
> > diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> > b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> > index 1ca86bcca2..d082d424b0 100644
> > --- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> > +++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> > @@ -36,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>  +
> > __builtin_ppc_get_timebase();
> >   #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
> >     /* Mainly, prevent the compiler from optimizing away delay loops */
> > -   __asm__ __volatile__ ("":::"memory");
> > +   __asm__ __volatile__ ("isb":::"memory");
> >  --- a/storage/tokudb/PerconaFT/portability/toku_time.h
> >  +++ b/storage/tokudb/PerconaFT/portability/toku_time.h
> >  @@ -124,7 +124,7 @@ static inline tokutime_t toku_time_now(v diff --git
> > a/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
> > b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> > similarity index 100%
> > rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
> > rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> > --
> > 2.31.1
>
