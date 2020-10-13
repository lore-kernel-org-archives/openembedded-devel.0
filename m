Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.911.1602610671355723016
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 13 Oct 2020 10:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=F8xblrLw;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id de3so358509qvb.5
        for <openembedded-devel@lists.openembedded.org>; Tue, 13 Oct 2020 10:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PTC7ZqhyGEwtBMnUTKFYIfGJN6yR7lcAKc96VwFlZEI=;
        b=F8xblrLwNHrKWehf0U72Dz2w99hGQ4H3EhGTBQFQIAx2St8KueP+qaddtWtTexrkkl
         jeh2BUl4JNoHfRr8WKEN4eg8pL41dZvpCPEFs+tyJLhLYMajeCaZY6Wyff1QQkTKSEuq
         ed1zqciXOZP5Bj/djVaGQv87TWY5igsXjqEMPiwiyNAqAgxjvEIIc5BT+6vZWD1RYa0J
         5UYUUN9Vq8gGnEKh3Klz3Sskoc0/Mb5BqIXCtINbYH9NrkiLKxftdbtj2yDItohWZj3d
         2PYhYbAS6+XTewVTM69steolT2du9kkLjeSPq01grXqv1XzadgSYWyAvP3fIJChV5H7z
         umVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PTC7ZqhyGEwtBMnUTKFYIfGJN6yR7lcAKc96VwFlZEI=;
        b=AY0SGl2kbWOv7g6PmFOJ8W1rXDhhWwoRMXqSWKpwN+CyEz7+jfabsOoWVZxxGUwPYR
         /wS8uf2fRjxncZv7LBRa5jQAljyv5ArCJBhHW845hRYJv9+utklx9rIj1YA3+D6dQTZq
         goRAhchRWO/zzlyvSUouuln/HAz7sNX9Yozia1QL/8F56XoW1+IPEWlTYBbVf+1XHHFI
         oD/NbY6arbXSV/LRwhovJoqUSCQ093sHUEOVfcAtzNn3fP/CYDWnF7gKuTY9mETvnmH0
         oGr2s5AUE7FclxZXT0Dt6eT8ph6XevHvSYEtqh0mpEUIrRgIkEyHYAwRRAKN+R1gPxaz
         I8Yw==
X-Gm-Message-State: AOAM5305l6SpF82KjRjblaqwYw62NW7MKpzh7yE8m3cunIvVZfjGwK5M
	ltAwshAJnxPP8dRzur+3PJ5AXdSlbEvz/403tEI=
X-Google-Smtp-Source: ABdhPJxKLWBFxX+3N10OYBiE3ZHXqpNvtpGkHInW7YPy+JPOSPgX4ak0vv33eF+e4z2n6TH6a43v74/mGqlZRyNbzmk=
X-Received: by 2002:a05:6214:16d0:: with SMTP id d16mr1117761qvz.38.1602610670370;
 Tue, 13 Oct 2020 10:37:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201013090826.23778-1-mingli.yu@windriver.com> <25212fd4-b0dd-f207-7702-2b896c78ef7a@windriver.com>
In-Reply-To: <25212fd4-b0dd-f207-7702-2b896c78ef7a@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 13 Oct 2020 10:37:24 -0700
Message-ID: <CAMKF1sqKK2Q3gbRJiWM1ty+nO8qEYNeefmANmMwVGXa5O-XipA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mariadb: Upgrade to 10.5.6
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

please rebase it on master or master-next and resend.

On Tue, Oct 13, 2020 at 2:10 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> Fixes for the following security vulnerabilities:
> - CVE-2020-15180
>
> Rebase one patch and remove one backported patch
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>   ...ive_10.5.4.bb => mariadb-native_10.5.6.bb} |  0
>   meta-oe/recipes-dbs/mysql/mariadb.inc         |  3 +-
>   .../mariadb/0001-Fix-library-LZ4-lookup.patch |  4 +-
>   ...DB-undefined-reference-to-crc32c_arm.patch | 48 -------------------
>   .../{mariadb_10.5.4.bb => mariadb_10.5.6.bb}  |  0
>   5 files changed, 3 insertions(+), 52 deletions(-)
>   rename meta-oe/recipes-dbs/mysql/{mariadb-native_10.5.4.bb =>
> mariadb-native_10.5.6.bb} (100%)
>   delete mode 100644
> meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
>   rename meta-oe/recipes-dbs/mysql/{mariadb_10.5.4.bb =>
> mariadb_10.5.6.bb} (100%)
>
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
> b/meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb-native_10.5.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb-native_10.5.6.bb
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb.inc
> b/meta-oe/recipes-dbs/mysql/mariadb.inc
> index 46a64006d..7c92bbaad 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb.inc
> +++ b/meta-oe/recipes-dbs/mysql/mariadb.inc
> @@ -19,9 +19,8 @@ SRC_URI =
> "https://downloads.mariadb.org/interstitial/${BP}/source/${BP}.tar.gz
>              file://clang_version_header_conflict.patch \
>              file://fix-arm-atomic.patch \
>              file://0001-Fix-library-LZ4-lookup.patch \
> -
> file://0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch \
>             "
> -SRC_URI[sha256sum] =
> "26db2becc9cec37e99a4e73390bd2eaa74568e21f9cf110359f4f68b37154c72"
> +SRC_URI[sha256sum] =
> "ff05dd69e9f6992caf1053242db704f04eda6f9accbcc98b74edfaf6013c45c4"
>    UPSTREAM_CHECK_URI = "https://github.com/MariaDB/server/releases"
>   diff --git
> a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
> b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
> index 574dfd317..0cf0560e1 100644
> --- a/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
> +++ b/meta-oe/recipes-dbs/mysql/mariadb/0001-Fix-library-LZ4-lookup.patch
> @@ -14,12 +14,12 @@ index e97dd63e2b0..2f4694e727c 100644
>   +++ b/cmake/FindLZ4.cmake
>   @@ -1,5 +1,10 @@
>   -find_path(LZ4_INCLUDE_DIR NAMES lz4.h)
> --find_library(LZ4_LIBRARY NAMES lz4)
> +-find_library(LZ4_LIBRARIES NAMES lz4)
>   +find_path(LZ4_INCLUDE_DIR
>   +  NAMES      lz4.h
>   +  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
>   +
> -+find_library(LZ4_LIBRARY
> ++find_library(LZ4_LIBRARIES
>   +  NAMES lz4
>   +  NO_DEFAULT_PATH NO_CMAKE_FIND_ROOT_PATH)
>    diff --git
> a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
> b/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
> deleted file mode 100644
> index 1856c1af7..000000000
> ---
> a/meta-oe/recipes-dbs/mysql/mariadb/0001-MDEV-23137-RocksDB-undefined-reference-to-crc32c_arm.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From d88ea260882ca414e940cd6af225617f00503f71 Mon Sep 17 00:00:00 2001
> -From: Krunal Bauskar <krunalbauskar@gmail.com>
> -Date: Mon, 27 Jul 2020 18:38:10 +0800
> -Subject: [PATCH] MDEV-23137: RocksDB: undefined reference to crc32c_arm64
> -
> -RocksDB fails to build on arm64: undefined reference to
> -            `crc32c_arm64(unsigned int, unsigned char const*, unsigned
> int)'
> -
> -MariaDB uses storage/rocksdb/build_rocksdb.cmake to compile RocksDB.
> -Said cmake missed adding crc32c_arm64 compilation target so if
> -machine native architecture supported crc32 then complier would enable
> -usage of function defined in crc32c_arm64 causing the listed error.
> -
> -Added crc32c_arm64 complition target.
> -
> -closes #1642
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ----
> - storage/rocksdb/build_rocksdb.cmake | 10 ++++++++++
> - 1 file changed, 10 insertions(+)
> -
> -diff --git a/storage/rocksdb/build_rocksdb.cmake
> b/storage/rocksdb/build_rocksdb.cmake
> -index 3f3dca7e990..7d2252c5f77 100644
> ---- a/storage/rocksdb/build_rocksdb.cmake
> -+++ b/storage/rocksdb/build_rocksdb.cmake
> -@@ -442,6 +442,16 @@ else()
> -       util/crc32c_ppc.c
> -       util/crc32c_ppc_asm.S)
> -   endif(CMAKE_SYSTEM_PROCESSOR MATCHES "ppc64")
> -+  # aarch
> -+  if(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
> -+    CHECK_CXX_COMPILER_FLAG("-march=armv8-a+crc+crypto" HAS_ARMV8_CRC)
> -+    if(HAS_ARMV8_CRC)
> -+      message(STATUS " HAS_ARMV8_CRC yes")
> -+      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}
> -march=armv8-a+crc+crypto -Wno-unused-function")
> -+      list(APPEND ROCKSDB_SOURCES
> -+        util/crc32c_arm64.cc)
> -+    endif(HAS_ARMV8_CRC)
> -+  endif(CMAKE_SYSTEM_PROCESSOR MATCHES "aarch64|AARCH64")
> - endif()
> - SET(SOURCES)
> - FOREACH(s ${ROCKSDB_SOURCES})
> --- -2.17.1
> -
> diff --git a/meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
> b/meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
> similarity index 100%
> rename from meta-oe/recipes-dbs/mysql/mariadb_10.5.4.bb
> rename to meta-oe/recipes-dbs/mysql/mariadb_10.5.6.bb
> --
> 2.17.1
>
>
> 
>
