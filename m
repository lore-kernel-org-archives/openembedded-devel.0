Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web08.18052.1609395990706431758
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 30 Dec 2020 22:26:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m+AKzHkN;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id v5so12364953qtv.7
        for <openembedded-devel@lists.openembedded.org>; Wed, 30 Dec 2020 22:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dDY0V7RKQG13LGeKl/2ZmyU7211ueDotpFqPIjgv5ac=;
        b=m+AKzHkNfRYvY8dDblef0q7YMZcUeT6VufP/xZgYJq9wZQ3NBckh6b/+3Fm68lld6F
         Hq/mFZC9N6F31dST9rfFWlzGW3KFSNXHZYT1TpG6dHglrcJqnfuTG/n4v2hBwu6vnHCH
         0M3RUauHBaRrFDa+k6V6VqcgAHjTIxDmtaj1GAY/EQU1zfdAhxJkP1VoUUR/dNqCMpVK
         Glpx4VWIKQGpckHy5iXmXCiIWxlbaP/ezXTQGP/Idljz6RBiBo5ziiNfOv4VJC9Rzo/l
         gHqyhdGVWqZMfkxh5flzwcR0hwWQsF3rOivOQZIEQr1x8J7i7vXBt1J6+UTLGI7h7oVg
         J87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dDY0V7RKQG13LGeKl/2ZmyU7211ueDotpFqPIjgv5ac=;
        b=M0j9XcVEYo68k4oyGSwU/hbom0zLZhrP1bFM1zxxDrTJVVN7JUbPJzERN+gYeOXQLe
         TROFpdXXISjBcjKy4G/bBLVD0mvG0inKehdMbB0KosIVBj7B0YbIOV1wv+2wyhTl+9Xe
         PwjpgQ2vMna+7psmeLgvZPh1jd4QClYb/7iOZ8nYiD23dVJBhuwSat2CrjViMJ4In0ZP
         uVu3nZxG8eIG3t6CARI3VIRJaO6eYLzk8t5nrAY7eKWnCOskmN6cbC7wsP2BYTgEye91
         /QkYxkBuHgBr3il1fuYW3tvSfsmlnD5uqgNJeeuwS1JDRHR1W7+fzp7/n/iW0Wycx5jp
         mOBQ==
X-Gm-Message-State: AOAM533m29f8l4Yy9gcuOUTi9T/zeq/LFSr/MMFJRfLX+sieDrjw5CTq
	vp6OvBm3MLij9LuSUw95TiTAZkgldw4ww1zZlnE=
X-Google-Smtp-Source: ABdhPJxMGLSL97P6QwU0iCT4x9UZQqQgUl7m64vJJ+ZQF6bBzBUDMK1TfsGkm8oo4B0lj1sapmlqyr4zn9HLYnKDgis=
X-Received: by 2002:ac8:3417:: with SMTP id u23mr55828897qtb.80.1609395989686;
 Wed, 30 Dec 2020 22:26:29 -0800 (PST)
MIME-Version: 1.0
References: <20201230021128.17080-1-mingli.yu@windriver.com>
In-Reply-To: <20201230021128.17080-1-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 30 Dec 2020 22:26:03 -0800
Message-ID: <CAMKF1so_N34oWGvbL-eDi2ud_rh=s1qWGprqF1gmZzJsTVT4uw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: upgrade to 10.5.8
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails on musl see https://errors.yoctoproject.org/Errors/Details/540392/

On Tue, Dec 29, 2020 at 6:12 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes for the following security vulnerabilities:
> CVE-2020-14812
> CVE-2020-14765
> CVE-2020-14776
> CVE-2020-14789
> CVE-2020-28912 (MDEV-24040)
>
> Rebase c11_atomics.patch to avoid fuzz warnings
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...b-native_10.5.6.bb => mariadb-native_10.5.8.bb} |  0
>  meta-oe/recipes-dbs/mysql/mariadb.inc              |  2 +-
>  .../recipes-dbs/mysql/mariadb/c11_atomics.patch    | 14 +++++++-------
>  .../mysql/{mariadb_10.5.6.bb => mariadb_10.5.8.bb} |  0
>  4 files changed, 8 insertions(+), 8 deletions(-)
>  rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.6.bb => mariadb-native_10.5.8.bb} (100%)
>  rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.6.bb => mariadb_10.5.8.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.8.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index e3ce29761..5631f041b 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -21,7 +21,7 @@ SRC_URI = "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>             file://0001-Fix-library-LZ4-lookup.patch \
>             file://0001-innobase-Define-__NR_futex-if-it-does-not-exist.patch \
>            "
> -SRC_URI[sha256sum] = "ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74edfaf6013c45c4"
> +SRC_URI[sha256sum] = "eb4824f6f2c532cd3fc6a6bce7bf78ea7c6b949f8bdd07656b2c84344e757be8"
>
>  UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> index 36217f9aa..32c9818ab 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/c11_atomics.patch
> @@ -17,10 +17,10 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   3 files changed, 27 insertions(+), 1 deletion(-)
>
>  diff --git a/configure.cmake b/configure.cmake
> -index a355214..6ee595f 100644
> +index bb3ad43..2ff4f19 100644
>  --- a/configure.cmake
>  +++ b/configure.cmake
> -@@ -865,7 +865,25 @@ int main()
> +@@ -861,7 +861,25 @@ int main()
>     long long int *ptr= &var;
>     return (int)__atomic_load_n(ptr, __ATOMIC_SEQ_CST);
>   }"
> @@ -48,11 +48,11 @@ index a355214..6ee595f 100644
>   IF(WITH_VALGRIND)
>     SET(HAVE_valgrind 1)
>  diff --git a/mysys/CMakeLists.txt b/mysys/CMakeLists.txt
> -index 3d8a20e..42f1441 100644
> +index 6a3a1ef..e306ae7 100644
>  --- a/mysys/CMakeLists.txt
>  +++ b/mysys/CMakeLists.txt
> -@@ -129,6 +129,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
> -  ${LIBNSL} ${LIBM} ${LIBRT} ${LIBDL} ${LIBSOCKET} ${LIBEXECINFO})
> +@@ -140,6 +140,10 @@ TARGET_LINK_LIBRARIES(mysys dbug strings ${ZLIB_LIBRARY}
> +  ${LIBNSL} ${LIBM} ${LIBRT} ${CMAKE_DL_LIBS} ${LIBSOCKET} ${LIBEXECINFO})
>   DTRACE_INSTRUMENT(mysys)
>
>  +IF (HAVE_GCC_C11_ATOMICS_WITH_LIBATOMIC)
> @@ -63,10 +63,10 @@ index 3d8a20e..42f1441 100644
>     TARGET_LINK_LIBRARIES(mysys bfd)
>   ENDIF(HAVE_BFD_H)
>  diff --git a/sql/CMakeLists.txt b/sql/CMakeLists.txt
> -index 616017b..53575f6 100644
> +index 4978d01..883a930 100644
>  --- a/sql/CMakeLists.txt
>  +++ b/sql/CMakeLists.txt
> -@@ -219,6 +219,10 @@ ELSE()
> +@@ -220,6 +220,10 @@ ELSE()
>     SET(MYSQLD_SOURCE main.cc ${DTRACE_PROBES_ALL})
>   ENDIF()
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb b/meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.8.bb
> --
> 2.26.2
>
>
> 
>
