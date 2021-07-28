Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web12.1201.1627450912621554402
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Jul 2021 22:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m8KXmZCb;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: akuster808@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id a4-20020a17090aa504b0290176a0d2b67aso8334032pjq.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 27 Jul 2021 22:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=WQ6wuvMggkBXkZLEPQvLoYVJYWsjzaBA+P9i+yYYVLo=;
        b=m8KXmZCbt2cumVsSa+Uvl0sUIUmwJJ2Za2S5fi8DqLR6nVlZbEqanPnzkpYDXITWqK
         GUKlOiJhnKN9tCuPwjSKaArr4qOk69TzI26PHRvdcL69KjHMQwdKWZ8nHQOS1xr5nb2Z
         s7xwLa6rtqFePaF9LDL5EAF+x9S6v7MYHpb7pN4K2a3NUm0r0DbpsAG9abyoTcdnTmSR
         ddycInV4/3LzdCHxo3WPQFJLvQEZ+HmGOIxDb67LFZYF3fmu2zLRbOWgMPEzvI3PZtGH
         tbyOzyDpGgCkaZTLdc+/OOpjA1SyqPQ8TaNl/AH4pviVRcogx4/SYkBr7O0V/9PUzud5
         t+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=WQ6wuvMggkBXkZLEPQvLoYVJYWsjzaBA+P9i+yYYVLo=;
        b=fdAsS5+iQkRLgl02mPUNXFg3pHMnLjiCLwE69T/PlAMeVNvYmRu2iEHKPl+utKY4lr
         koeDXIh3j4WQRQsq80lxwAz3KsSykbG1R1C16DZBPLgaUnVNHrWZQab7lEZQpHu8/uVp
         BsAXnWCkchCbI6NPhM/jO3sn/zza5G02ejF7SyMoZGQrjjnimpPD63aO0IiLIJmrRFuN
         iKTc/W0mx3Nk3vDOBUD04yDOKRIyKnwHQ27M5sNq9YSxtS7oVoXJLEP853ElKuYYmbg1
         VSh2cB0FygnISzJeJITavwpT8+5x+SRrSnadvEhFHIzDo3tHkrzrnn8liKmE9cUDWxFF
         0ghw==
X-Gm-Message-State: AOAM531MMPs1t5YxYpTMZZzgTyK1tGyJEcdPzcs0vP5VanDDGKjWG7Qo
	18O9z3u30D7VFMweEhD/2H6bbV6uO7RvQg==
X-Google-Smtp-Source: ABdhPJyo6C4dUEU7W8fKVe7T3WTyBVhV/NRDSaWVJOSHIcBlvvskgHDy7ecI1Iee3gqnxGgOPMxxJg==
X-Received: by 2002:a17:903:186:b029:12b:8d80:5d78 with SMTP id z6-20020a1709030186b029012b8d805d78mr21966394plg.17.1627450911850;
        Tue, 27 Jul 2021 22:41:51 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from ?IPv6:2601:202:4180:a5c0:cbf5:d7b8:4de2:e344? ([2601:202:4180:a5c0:cbf5:d7b8:4de2:e344])
        by smtp.gmail.com with ESMTPSA id f19sm4757053pjj.22.2021.07.27.22.41.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jul 2021 22:41:51 -0700 (PDT)
Subject: Re: [oe] [hardknott][meta-oe][PATCH] mariadb: Upgrade to 10.5.10
To: "Yu, Mingli" <mingli.yu@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20210727053348.39811-1-mingli.yu@windriver.com>
From: "Armin Kuster" <akuster808@gmail.com>
Message-ID: <afd4eb85-8fed-5332-e843-8a0662833fb7@gmail.com>
Date: Tue, 27 Jul 2021 22:41:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210727053348.39811-1-mingli.yu@windriver.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/26/21 10:33 PM, Yu, Mingli wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Drop fix-a-building-failure.patch because upstream has made is narrower
> to apply to emulator builds and not just any cross compiling builds
>
> Add missing dependency on boost

Thanks. I backported this a few days ago and is in stable/hardknott-nut

-armin
>
> (master rev: 2183f0894110a6913c44bee9a1f4b1cea7639bdc)
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...ve_10.5.9.bb => mariadb-native_10.5.10.bb} |  0
>  meta-oe/recipes-dbs/mysql/mariadb.inc         |  4 ++--
>  ...ng-failure.patch => cross-compiling.patch} | 22 +++++--------------
>  .../mysql/mariadb/ppc-remove-glibc-dep.patch  |  2 +-
>  .../{mariadb_10.5.9.bb => mariadb_10.5.10.bb} |  2 +-
>  5 files changed, 10 insertions(+), 20 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.9.bb => mariadb-native_10.5.10.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/mariadb/{fix-a-building-failure.patch => cross-compiling.patch} (61%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.9.bb => mariadb_10.5.10.bb} (85%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.9.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.10.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 9833b2885..2974341bf 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -11,7 +11,6 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>             file://install_db \
>             file://mysql-systemd-start \
>             file://configure.cmake-fix-valgrind.patch \
> -           file://fix-a-building-failure.patch \
>             file://support-files-CMakeLists.txt-fix-do_populate_sysroot.patch \
>             file://sql-CMakeLists.txt-fix-gen_lex_hash-not-found.patch \
>             file://0001-disable-ucontext-on-musl.patch \
> @@ -22,10 +21,11 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>             file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>             file://0001-aio_linux-Check-if-syscall-exists-before-using-it.patch \
>             file://sys_futex.patch \
> +           file://cross-compiling.patch \
>            "
>  SRC_URI_append_libc-musl = " file://ppc-remove-glibc-dep.patch"
>  
> -SRC_URI[sha256sum] = "40ab19aeb8de141fdc188cf2251213c9e7351bee4d0cd29db704fae68d1068cf"
> +SRC_URI[sha256sum] = "a5ff32f9fcaaf26bf5cba94accc7b246d2d5eb75710d027e40122df6bac0babb"
>  
>  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>  
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> similarity index 61%
> rename from meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
> rename to meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> index 9149ee21f..0f4815b18 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/fix-a-building-failure.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/cross-compiling.patch
> @@ -1,28 +1,21 @@
> -From 1b2b6a61c9f82157cd2e0c3744f6c07e07aeb0bd Mon Sep 17 00:00:00 2001
> -From: Mingli Yu <mingli.yu@windriver.com>
> -Date: Mon, 4 Mar 2019 01:11:30 -0800
> -Subject: [PATCH] fix a building failure
> -
> -Upstream-Status: Inappropriate [configuration]
> +This is not needed for OE builds
>  
>  building failed since native does not generate import_executables.cmake
>  In fact, our building system will export the needed commands
>  
> +Upstream-Status: Inappropriate [configuration]
> +
>  Signed-off-by: Roy Li <rongqing.li@windriver.com>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - CMakeLists.txt | 5 -----
> - 1 file changed, 5 deletions(-)
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  
> -diff --git a/CMakeLists.txt b/CMakeLists.txt
> -index fc30750..4f9110e 100644
>  --- a/CMakeLists.txt
>  +++ b/CMakeLists.txt
> -@@ -347,11 +347,6 @@ CHECK_PCRE()
> +@@ -392,11 +392,6 @@ CHECK_PCRE()
>   
>   CHECK_SYSTEMD()
>   
> --IF(CMAKE_CROSSCOMPILING)
> +-IF(CMAKE_CROSSCOMPILING AND NOT DEFINED CMAKE_CROSSCOMPILING_EMULATOR)
>  -  SET(IMPORT_EXECUTABLES "IMPORTFILE-NOTFOUND" CACHE FILEPATH "Path to import_executables.cmake from a native build")
>  -  INCLUDE(${IMPORT_EXECUTABLES})
>  -ENDIF()
> @@ -30,6 +23,3 @@ index fc30750..4f9110e 100644
>   #
>   # Setup maintainer mode options. Platform checks are
>   # not run with the warning options as to not perturb fragile checks
> --- 
> -2.17.1
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> index 1ca86bcca..d082d424b 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/ppc-remove-glibc-dep.patch
> @@ -36,7 +36,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>  +  __builtin_ppc_get_timebase();
>   #elif defined __GNUC__ && (defined __arm__ || defined __aarch64__)
>     /* Mainly, prevent the compiler from optimizing away delay loops */
> -   __asm__ __volatile__ ("":::"memory");
> +   __asm__ __volatile__ ("isb":::"memory");
>  --- a/storage/tokudb/PerconaFT/portability/toku_time.h
>  +++ b/storage/tokudb/PerconaFT/portability/toku_time.h
>  @@ -124,7 +124,7 @@ static inline tokutime_t toku_time_now(v
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> similarity index 85%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> index e6743fe97..8ae8241b0 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb_10.5.9.bb
> +++ b/meta-oe/recipes-dbs/mysql/mariadb_10.5.10.bb
> @@ -2,7 +2,7 @@ require mariadb.inc
>  
>  EXTRA_OECMAKE += "-DSTACK_DIRECTION=-1"
>  
> -DEPENDS += "mariadb-native bison-native libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
> +DEPENDS += "mariadb-native bison-native boost libpcre2 curl openssl ncurses zlib libaio libedit libevent libxml2"
>  
>  PROVIDES += "mysql5 libmysqlclient"
>  
>
> 
>

