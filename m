Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.20426.1621846560449226496
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 01:56:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=R0GAcuIr;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id x7so8071814wrt.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 01:56:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsP+UtGfkTJfKvNmI390IDcjsVQTom8S4FZjWoL9Tlc=;
        b=R0GAcuIryabs0/yzAGmbkx9nBALthoVLd7M+poqBEFymRXMzlWliTlFIbee7fOIHNP
         aRIYKyZGYjsokk44G4SgFxGnendSRUy5mce4f3JIsOSSUBLxKEWRlZ33rG5V8UCtyGs5
         daPHULytXmhgQhKNr+Pgl+lNiJ3cAZVXGSEyhNcUOg6+Sh6GEvfr0hA630nfdlVhyfn3
         LkDJJnNmsnctPSV46R+uvmB7nfNsGPTG8+ORTGvpPzvP+RbYG255rhFFZP+eo1Yf9h4o
         x751dPzW8Y26vZq6sfxVvQMUgnGWBVnEL8gCWXHG75gOH1AaafDN3Ghg2mPGf0U5ipKe
         lh8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsP+UtGfkTJfKvNmI390IDcjsVQTom8S4FZjWoL9Tlc=;
        b=ACr8yVCkj2Qe7rzdBj4cxJ7A0UTE9ElBy3im5RJ1SiKa0JjrGogVI8xEx8jiQ/rVom
         lbed1POSfseezecYCLmP1afZFM9QqqWIDFIx4U4TY0+8gvu8JiqbHbGU5GLKqFXdXj7a
         xQCF6fUZ79WCOJi529VKd7vLzEcNspwDrOYVhD8KPDlJzjDkZtR1kv+7J5Y7WJk81fae
         UFxbsPIz3kmIIDM6oquBDbgoOCENGsPLS6QcGrvw/FXrtKd8YjGMQ40M6gfR1QRkGXn7
         ia1iDWprbPSeQNwQHgru8BQPtNCMIdy6S4V6DYUkooCFGue3YKT4xs6VknV3ASEQ+Z5A
         YfoA==
X-Gm-Message-State: AOAM533YDaYzomahRm3FiBSoaZgKy9KfSWILg2/YHy6Y7PC9x7U+/srI
	zREgewM0XGjX9E9RrWAdd194mikZRK0=
X-Google-Smtp-Source: ABdhPJx03WpuaWcYkqlap38xjfgk1DAd7ZqnVxZ/eV9FBTc8x+yJaLKMdKzUt0KBBzj8exKi1LEkOA==
X-Received: by 2002:a5d:62d0:: with SMTP id o16mr21699015wrv.164.1621846558732;
        Mon, 24 May 2021 01:55:58 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id y20sm7038054wmi.0.2021.05.24.01.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 01:55:58 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 1/2] snappy: explicity disable building tests and benchmark
Date: Mon, 24 May 2021 10:55:53 +0200
Message-Id: <20210524085554.4128366-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

* with these changes introduced in 1.1.9:
  https://github.com/google/snappy/commit/549685a
  https://github.com/google/snappy/commit/4ebd8b2
  it now installs gtest,gmock,benchmark with snappy which
  causes conflicts when something depends on both snappy and googletest
  or google-benchmark, e.g. leveldb-tl.do_prepare_recipe_sysroot:
    ERROR: The file /usr/lib/pkgconfig/gmock_main.pc is installed by both snappy and googletest, aborting

* looking at buildhistory the 1.1.9 upgrade added a lot of files to snappy:

    diff --git a/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-package.txt b/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-package.txt
    index 4bb97db2..559c84fc 100644
    --- a/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-package.txt
    +++ b/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-package.txt
    @@ -1,14 +1,85 @@
     drwxr-xr-x root       root             4096 ./usr
     drwxr-xr-x root       root             4096 ./usr/include
    +drwxr-xr-x root       root             4096 ./usr/include/benchmark
    +-rw-r--r-- root       root            56897 ./usr/include/benchmark/benchmark.h
    +drwxr-xr-x root       root             4096 ./usr/include/gmock
    +-rw-r--r-- root       root            61607 ./usr/include/gmock/gmock-actions.h
    +-rw-r--r-- root       root             6037 ./usr/include/gmock/gmock-cardinalities.h
    +-rw-r--r-- root       root            24223 ./usr/include/gmock/gmock-function-mocker.h
    +-rw-r--r-- root       root            30996 ./usr/include/gmock/gmock-generated-actions.h
    +-rw-r--r-- root       root            15545 ./usr/include/gmock/gmock-generated-actions.h.pump
    +-rw-r--r-- root       root             3711 ./usr/include/gmock/gmock.h
    +-rw-r--r-- root       root           200261 ./usr/include/gmock/gmock-matchers.h
    +-rw-r--r-- root       root             3341 ./usr/include/gmock/gmock-more-matchers.h
    +-rw-r--r-- root       root             8967 ./usr/include/gmock/gmock-nice-strict.h
    +-rw-r--r-- root       root            76003 ./usr/include/gmock/gmock-spec-builders.h
    +drwxr-xr-x root       root             4096 ./usr/include/gmock/internal
    +drwxr-xr-x root       root             4096 ./usr/include/gmock/internal/custom
    +-rw-r--r-- root       root              365 ./usr/include/gmock/internal/custom/gmock-generated-actions.h
    +-rw-r--r-- root       root              451 ./usr/include/gmock/internal/custom/gmock-generated-actions.h.pump
    +-rw-r--r-- root       root             1861 ./usr/include/gmock/internal/custom/gmock-matchers.h
    +-rw-r--r-- root       root             1894 ./usr/include/gmock/internal/custom/gmock-port.h
    +-rw-r--r-- root       root              439 ./usr/include/gmock/internal/custom/README.md
    +-rw-r--r-- root       root            17975 ./usr/include/gmock/internal/gmock-internal-utils.h
    +-rw-r--r-- root       root             3788 ./usr/include/gmock/internal/gmock-port.h
    +-rw-r--r-- root       root            13530 ./usr/include/gmock/internal/gmock-pp.h
    +drwxr-xr-x root       root             4096 ./usr/include/gtest
    +-rw-r--r-- root       root            14374 ./usr/include/gtest/gtest-death-test.h
    +-rw-r--r-- root       root            94367 ./usr/include/gtest/gtest.h
    +-rw-r--r-- root       root            27455 ./usr/include/gtest/gtest-matchers.h
    +-rw-r--r-- root       root             8030 ./usr/include/gtest/gtest-message.h
    +-rw-r--r-- root       root            22681 ./usr/include/gtest/gtest-param-test.h
    +-rw-r--r-- root       root            14850 ./usr/include/gtest/gtest_pred_impl.h
    +-rw-r--r-- root       root            32033 ./usr/include/gtest/gtest-printers.h
    +-rw-r--r-- root       root             2519 ./usr/include/gtest/gtest_prod.h
    +-rw-r--r-- root       root            10097 ./usr/include/gtest/gtest-spi.h
    +-rw-r--r-- root       root             6853 ./usr/include/gtest/gtest-test-part.h
    +-rw-r--r-- root       root            15988 ./usr/include/gtest/gtest-typed-test.h
    +drwxr-xr-x root       root             4096 ./usr/include/gtest/internal
    +drwxr-xr-x root       root             4096 ./usr/include/gtest/internal/custom
    +-rw-r--r-- root       root             1843 ./usr/include/gtest/internal/custom/gtest.h
    +-rw-r--r-- root       root             1858 ./usr/include/gtest/internal/custom/gtest-port.h
    +-rw-r--r-- root       root             2079 ./usr/include/gtest/internal/custom/gtest-printers.h
    +-rw-r--r-- root       root             1682 ./usr/include/gtest/internal/custom/README.md
    +-rw-r--r-- root       root            13436 ./usr/include/gtest/internal/gtest-death-test-internal.h
    +-rw-r--r-- root       root             9764 ./usr/include/gtest/internal/gtest-filepath.h
    +-rw-r--r-- root       root            61757 ./usr/include/gtest/internal/gtest-internal.h
    +-rw-r--r-- root       root            35114 ./usr/include/gtest/internal/gtest-param-util.h
    +-rw-r--r-- root       root             4090 ./usr/include/gtest/internal/gtest-port-arch.h
    +-rw-r--r-- root       root            84530 ./usr/include/gtest/internal/gtest-port.h
    +-rw-r--r-- root       root             7213 ./usr/include/gtest/internal/gtest-string.h
    +-rw-r--r-- root       root             6270 ./usr/include/gtest/internal/gtest-type-util.h
     -rw-r--r-- root       root             5414 ./usr/include/snappy-c.h
    --rw-r--r-- root       root             9885 ./usr/include/snappy.h
    --rw-r--r-- root       root             7256 ./usr/include/snappy-sinksource.h
    --rw-r--r-- root       root             2845 ./usr/include/snappy-stubs-public.h
    +-rw-r--r-- root       root             9909 ./usr/include/snappy.h
    +-rw-r--r-- root       root             7265 ./usr/include/snappy-sinksource.h
    +-rw-r--r-- root       root             2579 ./usr/include/snappy-stubs-public.h
     drwxr-xr-x root       root             4096 ./usr/lib
     drwxr-xr-x root       root             4096 ./usr/lib/cmake
    +drwxr-xr-x root       root             4096 ./usr/lib/cmake/benchmark
    +-rw-r--r-- root       root               60 ./usr/lib/cmake/benchmark/benchmarkConfig.cmake
    +-rw-r--r-- root       root             2742 ./usr/lib/cmake/benchmark/benchmarkConfigVersion.cmake
    +-rw-r--r-- root       root             4247 ./usr/lib/cmake/benchmark/benchmarkTargets.cmake
    +-rw-r--r-- root       root             1380 ./usr/lib/cmake/benchmark/benchmarkTargets-noconfig.cmake
    +drwxr-xr-x root       root             4096 ./usr/lib/cmake/GTest
    +-rw-r--r-- root       root             1438 ./usr/lib/cmake/GTest/GTestConfig.cmake
    +-rw-r--r-- root       root             1978 ./usr/lib/cmake/GTest/GTestConfigVersion.cmake
    +-rw-r--r-- root       root             4958 ./usr/lib/cmake/GTest/GTestTargets.cmake
    +-rw-r--r-- root       root             2525 ./usr/lib/cmake/GTest/GTestTargets-noconfig.cmake
     drwxr-xr-x root       root             4096 ./usr/lib/cmake/Snappy
     -rw-r--r-- root       root             2864 ./usr/lib/cmake/Snappy/SnappyConfig.cmake
     -rw-r--r-- root       root             2742 ./usr/lib/cmake/Snappy/SnappyConfigVersion.cmake
     -rw-r--r-- root       root             3616 ./usr/lib/cmake/Snappy/SnappyTargets.cmake
     -rw-r--r-- root       root              806 ./usr/lib/cmake/Snappy/SnappyTargets-noconfig.cmake
    +lrwxrwxrwx root       root               22 ./usr/lib/libbenchmark_main.so -> libbenchmark_main.so.1
    +lrwxrwxrwx root       root               17 ./usr/lib/libbenchmark.so -> libbenchmark.so.1
    +lrwxrwxrwx root       root               23 ./usr/lib/libgmock_main.so -> libgmock_main.so.1.10.0
    +lrwxrwxrwx root       root               18 ./usr/lib/libgmock.so -> libgmock.so.1.10.0
    +lrwxrwxrwx root       root               23 ./usr/lib/libgtest_main.so -> libgtest_main.so.1.10.0
    +lrwxrwxrwx root       root               18 ./usr/lib/libgtest.so -> libgtest.so.1.10.0
     lrwxrwxrwx root       root               14 ./usr/lib/libsnappy.so -> libsnappy.so.1
    +drwxr-xr-x root       root             4096 ./usr/lib/pkgconfig
    +-rw-r--r-- root       root              240 ./usr/lib/pkgconfig/benchmark.pc
    +-rw-r--r-- root       root              275 ./usr/lib/pkgconfig/gmock_main.pc
    +-rw-r--r-- root       root              268 ./usr/lib/pkgconfig/gmock.pc
    +-rw-r--r-- root       root              275 ./usr/lib/pkgconfig/gtest_main.pc
    +-rw-r--r-- root       root              243 ./usr/lib/pkgconfig/gtest.pc
    diff --git a/packages/core2-64-webos-linux/snappy/snappy-dev/latest b/packages/core2-64-webos-linux/snappy/snappy-dev/latest
    index 0cc143d2..19a23796 100644
    --- a/packages/core2-64-webos-linux/snappy/snappy-dev/latest
    +++ b/packages/core2-64-webos-linux/snappy/snappy-dev/latest
    @@ -1,9 +1,8 @@
    -PV = 1.1.8
    +PV = 1.1.9
     PR = r0
    -PKG = libsnappy-dev
    -RPROVIDES = snappy-dev (=1.1.8)
    -RDEPENDS = snappy (= 1.1.8-r0)
    +RPROVIDES =
    +RDEPENDS = snappy (= 1.1.9-r0)
     RRECOMMENDS = glibc-dev libgcc-dev libstdc++-dev snappy-lic
    -PKGSIZE = 35442
    +PKGSIZE = 1062733
     FILES = /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o /usr/lib/snappy/*.la /lib/*.la /usr/lib/cmake /usr/share/cmake
    -FILELIST = /usr/lib/libsnappy.so.1 /usr/lib/libsnappy.so.1.1.8
    +FILELIST = /usr/lib/libbenchmark.so.1 /usr/lib/libbenchmark.so.1.5.2 /usr/lib/libbenchmark_main.so.1 /usr/lib/libbenchmark_main.so.1.5.2 /usr/lib/libgmock.so.1.10.0 /usr/lib/libgmock_main.so.1.10.0 /usr/lib/libgtest.so.1.10.0 /usr/lib/libgtest_main.so.1.10.0 /usr/lib/libsnappy.so.1 /usr/lib/libsnappy.so.1.1.9

* disable tests and benchmarks to install only the files 1.1.8 version used to install

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-oe/recipes-extended/snappy/snappy_1.1.9.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
index 2ebe3760a5..151c4ddc38 100644
--- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
+++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
@@ -21,5 +21,4 @@ PACKAGECONFIG ??= ""
 PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"
 TARGET_CFLAGS += "-fPIC"
 
-EXTRA_OECMAKE += '-DBUILD_SHARED_LIBS="ON" \
-                  '
+EXTRA_OECMAKE += '-DBUILD_SHARED_LIBS="ON" -DSNAPPY_BUILD_TESTS="OFF" -DSNAPPY_BUILD_BENCHMARKS="OFF"'
-- 
2.30.2

