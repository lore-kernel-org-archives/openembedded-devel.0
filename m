Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web12.23570.1621865263363501972
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 07:07:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=jUpthXim;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id ee9so14198837qvb.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=B/UTgnc/wfZwP5EvRq1p8NsY+6DmL/36QzgLIUmWpDg=;
        b=jUpthXimDh54yVcbGyuT5KlYlO24GAfzRiURxxil5aDIqsEjzCeQ/OaHO64XtqmqpW
         hMDxMLUm2/gJp7X8Y2797gJN0JUMtFpU1hct+r5O+DeadnRZ7Bkw6psaMo5mcfAlqACe
         8QmfIEBS+hPELm4dOk4E4RYPdov8FepmeYoo7hiyDNqSC/2h3zbswe+M3jYmJBOmPbV4
         iizbT2CXkTTfLK3uR62SKKMtdy1En3tB8LVDc+Ca4/7ZwF54j+09sSelpqVL1X0Y2DKS
         SgYb2CtYDed4kVhOLjPk/CcB5E3dDUfnI/+J6exF7mzO1+QJP966/b0NYID+eiHUzVBO
         ecWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=B/UTgnc/wfZwP5EvRq1p8NsY+6DmL/36QzgLIUmWpDg=;
        b=bHxxuktIF7iKn49ln2/KelAaX8IDWEeHgs5Cq21daEw7xHnSCwcjgfhveUMDNs5eDY
         ijmD5i6b1XeCVuZuGBBS93dI/44CZM0/LrW2yPTRVD3KoPdnIl6HbOlv8YBMcT9bs/hl
         muTdFvR3t9APMkKFiQaBn0a2ibeVzrz3RTtPGINL5cE1zVEX6/s5DivhnvCXMFHk6cSj
         nd0ZVTDCDP6hEdBS4hvToQS/kPzAoNqX14y6DEgBageXRFMcWt2rHXvK1caN51TV9ROJ
         ddXnamJA8CzJPFs24Wle3WqzWPz82tYr3AmIbslFTu9qhCW7Wyj913RN8f7WYy34Cy/7
         RLeA==
X-Gm-Message-State: AOAM532gG4F3izDllbDRrOg+KJRvFHx0hU+AMJWu5a3YPtdmMAuLn50a
	/IIq55zSw5o8HGN24ehNafm1j90KJPP8pSQwUWk=
X-Google-Smtp-Source: ABdhPJwQX9wwL0Wy60bZWmV848g1mguDefKZjLqD/pErY0MQXjYEiYEdB8qt+QWeXN5Y+Or0wYV+JcC4H4nEzFGbY/o=
X-Received: by 2002:ad4:4dc8:: with SMTP id cw8mr30090119qvb.16.1621865262370;
 Mon, 24 May 2021 07:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210524085554.4128366-1-Martin.Jansa@gmail.com>
In-Reply-To: <20210524085554.4128366-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 24 May 2021 07:07:16 -0700
Message-ID: <CAMKF1sopj=TPavxz59VtO4BNZ9nqQAg8kcPEF7NQkcGYkGq4mw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] snappy: explicity disable building tests and benchmark
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

its not clear what is the advantage of turning DBUILD_SHARED_LIBS on.
Disabling tests may get over the issue but perhaps having tests is
also good
so turning it into a packageconfig which can be enabled with ptest
might be a better option.

On Mon, May 24, 2021 at 1:56 AM Martin Jansa <Martin.Jansa@gmail.com> wrot=
e:
>
> * with these changes introduced in 1.1.9:
>   https://github.com/google/snappy/commit/549685a
>   https://github.com/google/snappy/commit/4ebd8b2
>   it now installs gtest,gmock,benchmark with snappy which
>   causes conflicts when something depends on both snappy and googletest
>   or google-benchmark, e.g. leveldb-tl.do_prepare_recipe_sysroot:
>     ERROR: The file /usr/lib/pkgconfig/gmock_main.pc is installed by bot=
h snappy and googletest, aborting
>
> * looking at buildhistory the 1.1.9 upgrade added a lot of files to snap=
py:
>
>     diff --git a/packages/core2-64-webos-linux/snappy/snappy-dev/files-i=
n-package.txt b/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-pa=
ckage.txt
>     index 4bb97db2..559c84fc 100644
>     --- a/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-packa=
ge.txt
>     +++ b/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-packa=
ge.txt
>     @@ -1,14 +1,85 @@
>      drwxr-xr-x root       root             4096 ./usr
>      drwxr-xr-x root       root             4096 ./usr/include
>     +drwxr-xr-x root       root             4096 ./usr/include/benchmark
>     +-rw-r--r-- root       root            56897 ./usr/include/benchmark=
/benchmark.h
>     +drwxr-xr-x root       root             4096 ./usr/include/gmock
>     +-rw-r--r-- root       root            61607 ./usr/include/gmock/gmo=
ck-actions.h
>     +-rw-r--r-- root       root             6037 ./usr/include/gmock/gmo=
ck-cardinalities.h
>     +-rw-r--r-- root       root            24223 ./usr/include/gmock/gmo=
ck-function-mocker.h
>     +-rw-r--r-- root       root            30996 ./usr/include/gmock/gmo=
ck-generated-actions.h
>     +-rw-r--r-- root       root            15545 ./usr/include/gmock/gmo=
ck-generated-actions.h.pump
>     +-rw-r--r-- root       root             3711 ./usr/include/gmock/gmo=
ck.h
>     +-rw-r--r-- root       root           200261 ./usr/include/gmock/gmo=
ck-matchers.h
>     +-rw-r--r-- root       root             3341 ./usr/include/gmock/gmo=
ck-more-matchers.h
>     +-rw-r--r-- root       root             8967 ./usr/include/gmock/gmo=
ck-nice-strict.h
>     +-rw-r--r-- root       root            76003 ./usr/include/gmock/gmo=
ck-spec-builders.h
>     +drwxr-xr-x root       root             4096 ./usr/include/gmock/int=
ernal
>     +drwxr-xr-x root       root             4096 ./usr/include/gmock/int=
ernal/custom
>     +-rw-r--r-- root       root              365 ./usr/include/gmock/int=
ernal/custom/gmock-generated-actions.h
>     +-rw-r--r-- root       root              451 ./usr/include/gmock/int=
ernal/custom/gmock-generated-actions.h.pump
>     +-rw-r--r-- root       root             1861 ./usr/include/gmock/int=
ernal/custom/gmock-matchers.h
>     +-rw-r--r-- root       root             1894 ./usr/include/gmock/int=
ernal/custom/gmock-port.h
>     +-rw-r--r-- root       root              439 ./usr/include/gmock/int=
ernal/custom/README.md
>     +-rw-r--r-- root       root            17975 ./usr/include/gmock/int=
ernal/gmock-internal-utils.h
>     +-rw-r--r-- root       root             3788 ./usr/include/gmock/int=
ernal/gmock-port.h
>     +-rw-r--r-- root       root            13530 ./usr/include/gmock/int=
ernal/gmock-pp.h
>     +drwxr-xr-x root       root             4096 ./usr/include/gtest
>     +-rw-r--r-- root       root            14374 ./usr/include/gtest/gte=
st-death-test.h
>     +-rw-r--r-- root       root            94367 ./usr/include/gtest/gte=
st.h
>     +-rw-r--r-- root       root            27455 ./usr/include/gtest/gte=
st-matchers.h
>     +-rw-r--r-- root       root             8030 ./usr/include/gtest/gte=
st-message.h
>     +-rw-r--r-- root       root            22681 ./usr/include/gtest/gte=
st-param-test.h
>     +-rw-r--r-- root       root            14850 ./usr/include/gtest/gte=
st_pred_impl.h
>     +-rw-r--r-- root       root            32033 ./usr/include/gtest/gte=
st-printers.h
>     +-rw-r--r-- root       root             2519 ./usr/include/gtest/gte=
st_prod.h
>     +-rw-r--r-- root       root            10097 ./usr/include/gtest/gte=
st-spi.h
>     +-rw-r--r-- root       root             6853 ./usr/include/gtest/gte=
st-test-part.h
>     +-rw-r--r-- root       root            15988 ./usr/include/gtest/gte=
st-typed-test.h
>     +drwxr-xr-x root       root             4096 ./usr/include/gtest/int=
ernal
>     +drwxr-xr-x root       root             4096 ./usr/include/gtest/int=
ernal/custom
>     +-rw-r--r-- root       root             1843 ./usr/include/gtest/int=
ernal/custom/gtest.h
>     +-rw-r--r-- root       root             1858 ./usr/include/gtest/int=
ernal/custom/gtest-port.h
>     +-rw-r--r-- root       root             2079 ./usr/include/gtest/int=
ernal/custom/gtest-printers.h
>     +-rw-r--r-- root       root             1682 ./usr/include/gtest/int=
ernal/custom/README.md
>     +-rw-r--r-- root       root            13436 ./usr/include/gtest/int=
ernal/gtest-death-test-internal.h
>     +-rw-r--r-- root       root             9764 ./usr/include/gtest/int=
ernal/gtest-filepath.h
>     +-rw-r--r-- root       root            61757 ./usr/include/gtest/int=
ernal/gtest-internal.h
>     +-rw-r--r-- root       root            35114 ./usr/include/gtest/int=
ernal/gtest-param-util.h
>     +-rw-r--r-- root       root             4090 ./usr/include/gtest/int=
ernal/gtest-port-arch.h
>     +-rw-r--r-- root       root            84530 ./usr/include/gtest/int=
ernal/gtest-port.h
>     +-rw-r--r-- root       root             7213 ./usr/include/gtest/int=
ernal/gtest-string.h
>     +-rw-r--r-- root       root             6270 ./usr/include/gtest/int=
ernal/gtest-type-util.h
>      -rw-r--r-- root       root             5414 ./usr/include/snappy-c.=
h
>     --rw-r--r-- root       root             9885 ./usr/include/snappy.h
>     --rw-r--r-- root       root             7256 ./usr/include/snappy-si=
nksource.h
>     --rw-r--r-- root       root             2845 ./usr/include/snappy-st=
ubs-public.h
>     +-rw-r--r-- root       root             9909 ./usr/include/snappy.h
>     +-rw-r--r-- root       root             7265 ./usr/include/snappy-si=
nksource.h
>     +-rw-r--r-- root       root             2579 ./usr/include/snappy-st=
ubs-public.h
>      drwxr-xr-x root       root             4096 ./usr/lib
>      drwxr-xr-x root       root             4096 ./usr/lib/cmake
>     +drwxr-xr-x root       root             4096 ./usr/lib/cmake/benchma=
rk
>     +-rw-r--r-- root       root               60 ./usr/lib/cmake/benchma=
rk/benchmarkConfig.cmake
>     +-rw-r--r-- root       root             2742 ./usr/lib/cmake/benchma=
rk/benchmarkConfigVersion.cmake
>     +-rw-r--r-- root       root             4247 ./usr/lib/cmake/benchma=
rk/benchmarkTargets.cmake
>     +-rw-r--r-- root       root             1380 ./usr/lib/cmake/benchma=
rk/benchmarkTargets-noconfig.cmake
>     +drwxr-xr-x root       root             4096 ./usr/lib/cmake/GTest
>     +-rw-r--r-- root       root             1438 ./usr/lib/cmake/GTest/G=
TestConfig.cmake
>     +-rw-r--r-- root       root             1978 ./usr/lib/cmake/GTest/G=
TestConfigVersion.cmake
>     +-rw-r--r-- root       root             4958 ./usr/lib/cmake/GTest/G=
TestTargets.cmake
>     +-rw-r--r-- root       root             2525 ./usr/lib/cmake/GTest/G=
TestTargets-noconfig.cmake
>      drwxr-xr-x root       root             4096 ./usr/lib/cmake/Snappy
>      -rw-r--r-- root       root             2864 ./usr/lib/cmake/Snappy/=
SnappyConfig.cmake
>      -rw-r--r-- root       root             2742 ./usr/lib/cmake/Snappy/=
SnappyConfigVersion.cmake
>      -rw-r--r-- root       root             3616 ./usr/lib/cmake/Snappy/=
SnappyTargets.cmake
>      -rw-r--r-- root       root              806 ./usr/lib/cmake/Snappy/=
SnappyTargets-noconfig.cmake
>     +lrwxrwxrwx root       root               22 ./usr/lib/libbenchmark_=
main.so -> libbenchmark_main.so.1
>     +lrwxrwxrwx root       root               17 ./usr/lib/libbenchmark.=
so -> libbenchmark.so.1
>     +lrwxrwxrwx root       root               23 ./usr/lib/libgmock_main=
.so -> libgmock_main.so.1.10.0
>     +lrwxrwxrwx root       root               18 ./usr/lib/libgmock.so -=
> libgmock.so.1.10.0
>     +lrwxrwxrwx root       root               23 ./usr/lib/libgtest_main=
.so -> libgtest_main.so.1.10.0
>     +lrwxrwxrwx root       root               18 ./usr/lib/libgtest.so -=
> libgtest.so.1.10.0
>      lrwxrwxrwx root       root               14 ./usr/lib/libsnappy.so =
-> libsnappy.so.1
>     +drwxr-xr-x root       root             4096 ./usr/lib/pkgconfig
>     +-rw-r--r-- root       root              240 ./usr/lib/pkgconfig/ben=
chmark.pc
>     +-rw-r--r-- root       root              275 ./usr/lib/pkgconfig/gmo=
ck_main.pc
>     +-rw-r--r-- root       root              268 ./usr/lib/pkgconfig/gmo=
ck.pc
>     +-rw-r--r-- root       root              275 ./usr/lib/pkgconfig/gte=
st_main.pc
>     +-rw-r--r-- root       root              243 ./usr/lib/pkgconfig/gte=
st.pc
>     diff --git a/packages/core2-64-webos-linux/snappy/snappy-dev/latest =
b/packages/core2-64-webos-linux/snappy/snappy-dev/latest
>     index 0cc143d2..19a23796 100644
>     --- a/packages/core2-64-webos-linux/snappy/snappy-dev/latest
>     +++ b/packages/core2-64-webos-linux/snappy/snappy-dev/latest
>     @@ -1,9 +1,8 @@
>     -PV =3D 1.1.8
>     +PV =3D 1.1.9
>      PR =3D r0
>     -PKG =3D libsnappy-dev
>     -RPROVIDES =3D snappy-dev (=3D1.1.8)
>     -RDEPENDS =3D snappy (=3D 1.1.8-r0)
>     +RPROVIDES =3D
>     +RDEPENDS =3D snappy (=3D 1.1.9-r0)
>      RRECOMMENDS =3D glibc-dev libgcc-dev libstdc++-dev snappy-lic
>     -PKGSIZE =3D 35442
>     +PKGSIZE =3D 1062733
>      FILES =3D /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la =
/usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /li=
b/*.o /usr/lib/snappy/*.la /lib/*.la /usr/lib/cmake /usr/share/cmake
>     -FILELIST =3D /usr/lib/libsnappy.so.1 /usr/lib/libsnappy.so.1.1.8
>     +FILELIST =3D /usr/lib/libbenchmark.so.1 /usr/lib/libbenchmark.so.1.=
5.2 /usr/lib/libbenchmark_main.so.1 /usr/lib/libbenchmark_main.so.1.5.2 /us=
r/lib/libgmock.so.1.10.0 /usr/lib/libgmock_main.so.1.10.0 /usr/lib/libgtest=
.so.1.10.0 /usr/lib/libgtest_main.so.1.10.0 /usr/lib/libsnappy.so.1 /usr/li=
b/libsnappy.so.1.1.9
>
> * disable tests and benchmarks to install only the files 1.1.8 version u=
sed to install
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-extended/snappy/snappy_1.1.9.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/r=
ecipes-extended/snappy/snappy_1.1.9.bb
> index 2ebe3760a5..151c4ddc38 100644
> --- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
> @@ -21,5 +21,4 @@ PACKAGECONFIG ??=3D ""
>  PACKAGECONFIG[lzo] =3D "-DHAVE_LIBLZO2=3D1,-DHAVE_LIBLZO2=3D0,lzo,"
>  TARGET_CFLAGS +=3D "-fPIC"
>
> -EXTRA_OECMAKE +=3D '-DBUILD_SHARED_LIBS=3D"ON" \
> -                  '
> +EXTRA_OECMAKE +=3D '-DBUILD_SHARED_LIBS=3D"ON" -DSNAPPY_BUILD_TESTS=3D"=
OFF" -DSNAPPY_BUILD_BENCHMARKS=3D"OFF"'
> --
> 2.30.2
>
>
>=20
>
