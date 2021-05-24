Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.23836.1621866391147664411
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 May 2021 07:26:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nKGgtGxI;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so11339030pjt.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 May 2021 07:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rf1UgxESeaGdHuHHTZgLKUctCFK+bSILDGMFduDxdQg=;
        b=nKGgtGxIzqIG166vVo/5uMw3e4qrTKSo+4UpOiheZpNlf5z7fEtVAR7vFl0uLml4+E
         S1sIRfoscPdyr0xcFK/A64W1NxdBmFvNw/tY9rE0OcQOnZbBErnXiYeb642hpML3bhJ+
         PP8imlCMG1tA/f2AQr50PyfrZesXqbSLxV6zPT28xFKJcSGd7BqrXfsVz5v/So23z8IW
         AobeqNAsEckk0+83KaKDKnqrH74r7UBUK9vn1OiiIhzlBi7sD3AqXLdJW7+I4ytWGuCy
         vr6iMtCDkdbQ0GKUckmP31FBfE2AW72jB8h1V+hFNSNtwGWOKiXO82HVzKEcXnOaED0I
         +AVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=rf1UgxESeaGdHuHHTZgLKUctCFK+bSILDGMFduDxdQg=;
        b=W1+jSNBQNa/Hy9tf2DhA1/3uEFIsueN3xCD8whd0IHFAVsoAleG1wBFUIZOpOswkjk
         qGJ4GY7W6Tiu6LKFyEi9JMXnU2e/cuW3fA421hcMfDhJjx6fnRroOdX5hYweWQY+atUx
         +aGUAMBGYTlV/T4g+plWlw7AgVG2JVKbrCAX8lNBj/RPwDWtPqf0j+qwlXcK0fqlgxAJ
         0YQ5AiMk7RMY1Khk8bYzxCFqLmXedEMUvvpp7e7G3OGrK8ddhuTEnmy/JVgjKoN+KXdx
         L1CYd2ifYKsvowx8SCxtTygLxXr1yH1tRyWu3R7NzG0nij3sZm5Hqb+Vv0M8csJJVQXY
         gAPQ==
X-Gm-Message-State: AOAM530twnqHDwU7xHK/PXGlIm4hrqpDRpNRVboLnz2/6LKwTaNWMMB5
	wnwkgNYrUJ6bv9gxdmkIO7EgW7smSVTaJA==
X-Google-Smtp-Source: ABdhPJyKVvCxpUw28AxUzwEWtfV0MzoDRD1zknktqRUGzQNtJ1Mhc0TkulaGGNmLLkQq2OTx+MJORA==
X-Received: by 2002:a17:903:1243:b029:ed:8298:7628 with SMTP id u3-20020a1709031243b02900ed82987628mr25403982plh.11.1621866390255;
        Mon, 24 May 2021 07:26:30 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0::9c7a? ([2601:646:9200:a0f0::9c7a])
        by smtp.gmail.com with ESMTPSA id s140sm1832185pfs.73.2021.05.24.07.26.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 May 2021 07:26:29 -0700 (PDT)
Subject: Re: [oe] [meta-oe][PATCH 1/2] snappy: explicity disable building tests and benchmark
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
References: <20210524085554.4128366-1-Martin.Jansa@gmail.com>
 <CAMKF1sopj=TPavxz59VtO4BNZ9nqQAg8kcPEF7NQkcGYkGq4mw@mail.gmail.com>
 <20210524141701.spau4sax34ckndza@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <5bf95d3c-a044-957a-af65-e02c4c6cccb7@gmail.com>
Date: Mon, 24 May 2021 07:26:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210524141701.spau4sax34ckndza@jama>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/24/21 7:17 AM, Martin Jansa wrote:
> On Mon, May 24, 2021 at 07:07:16AM -0700, Khem Raj wrote:
>> its not clear what is the advantage of turning DBUILD_SHARED_LIBS on.
> 
> that was already there.
> 
>> Disabling tests may get over the issue but perhaps having tests is
>> also good
>> so turning it into a packageconfig which can be enabled with ptest
>> might be a better option.
> 
> Building and installing tests for snappy would be fine, but even
> with it controlled by ptest you don't want snappy to install
> gtest/gmock/google-benchmark frameworks which are provided by their
> respective recipes:
> 
> http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-test/googletest/googletest_git.bb?h=master
> https://github.com/ros/meta-ros/blob/master/meta-ros2/recipes-benchmark/google-benchmark/google-benchmark_git.bb
> 
> If someone is really interested in snappy tests then it could be
> improved, but right now it's broken and this change just restores the
> behavior from 1.1.8. (the same does apply for the libtinyxml2 change).
> 

I am fine as such. somehow installing shared libs should be decoupled 
from googletest shared libs option, if its controlling main package 
being built as shared lib. Perhaps it should be broken into two options.

> Regards,
> 
>> On Mon, May 24, 2021 at 1:56 AM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>>>
>>> * with these changes introduced in 1.1.9:
>>>    https://github.com/google/snappy/commit/549685a
>>>    https://github.com/google/snappy/commit/4ebd8b2
>>>    it now installs gtest,gmock,benchmark with snappy which
>>>    causes conflicts when something depends on both snappy and googletest
>>>    or google-benchmark, e.g. leveldb-tl.do_prepare_recipe_sysroot:
>>>      ERROR: The file /usr/lib/pkgconfig/gmock_main.pc is installed by both snappy and googletest, aborting
>>>
>>> * looking at buildhistory the 1.1.9 upgrade added a lot of files to snappy:
>>>
>>>      diff --git a/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-package.txt b/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-package.txt
>>>      index 4bb97db2..559c84fc 100644
>>>      --- a/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-package.txt
>>>      +++ b/packages/core2-64-webos-linux/snappy/snappy-dev/files-in-package.txt
>>>      @@ -1,14 +1,85 @@
>>>       drwxr-xr-x root       root             4096 ./usr
>>>       drwxr-xr-x root       root             4096 ./usr/include
>>>      +drwxr-xr-x root       root             4096 ./usr/include/benchmark
>>>      +-rw-r--r-- root       root            56897 ./usr/include/benchmark/benchmark.h
>>>      +drwxr-xr-x root       root             4096 ./usr/include/gmock
>>>      +-rw-r--r-- root       root            61607 ./usr/include/gmock/gmock-actions.h
>>>      +-rw-r--r-- root       root             6037 ./usr/include/gmock/gmock-cardinalities.h
>>>      +-rw-r--r-- root       root            24223 ./usr/include/gmock/gmock-function-mocker.h
>>>      +-rw-r--r-- root       root            30996 ./usr/include/gmock/gmock-generated-actions.h
>>>      +-rw-r--r-- root       root            15545 ./usr/include/gmock/gmock-generated-actions.h.pump
>>>      +-rw-r--r-- root       root             3711 ./usr/include/gmock/gmock.h
>>>      +-rw-r--r-- root       root           200261 ./usr/include/gmock/gmock-matchers.h
>>>      +-rw-r--r-- root       root             3341 ./usr/include/gmock/gmock-more-matchers.h
>>>      +-rw-r--r-- root       root             8967 ./usr/include/gmock/gmock-nice-strict.h
>>>      +-rw-r--r-- root       root            76003 ./usr/include/gmock/gmock-spec-builders.h
>>>      +drwxr-xr-x root       root             4096 ./usr/include/gmock/internal
>>>      +drwxr-xr-x root       root             4096 ./usr/include/gmock/internal/custom
>>>      +-rw-r--r-- root       root              365 ./usr/include/gmock/internal/custom/gmock-generated-actions.h
>>>      +-rw-r--r-- root       root              451 ./usr/include/gmock/internal/custom/gmock-generated-actions.h.pump
>>>      +-rw-r--r-- root       root             1861 ./usr/include/gmock/internal/custom/gmock-matchers.h
>>>      +-rw-r--r-- root       root             1894 ./usr/include/gmock/internal/custom/gmock-port.h
>>>      +-rw-r--r-- root       root              439 ./usr/include/gmock/internal/custom/README.md
>>>      +-rw-r--r-- root       root            17975 ./usr/include/gmock/internal/gmock-internal-utils.h
>>>      +-rw-r--r-- root       root             3788 ./usr/include/gmock/internal/gmock-port.h
>>>      +-rw-r--r-- root       root            13530 ./usr/include/gmock/internal/gmock-pp.h
>>>      +drwxr-xr-x root       root             4096 ./usr/include/gtest
>>>      +-rw-r--r-- root       root            14374 ./usr/include/gtest/gtest-death-test.h
>>>      +-rw-r--r-- root       root            94367 ./usr/include/gtest/gtest.h
>>>      +-rw-r--r-- root       root            27455 ./usr/include/gtest/gtest-matchers.h
>>>      +-rw-r--r-- root       root             8030 ./usr/include/gtest/gtest-message.h
>>>      +-rw-r--r-- root       root            22681 ./usr/include/gtest/gtest-param-test.h
>>>      +-rw-r--r-- root       root            14850 ./usr/include/gtest/gtest_pred_impl.h
>>>      +-rw-r--r-- root       root            32033 ./usr/include/gtest/gtest-printers.h
>>>      +-rw-r--r-- root       root             2519 ./usr/include/gtest/gtest_prod.h
>>>      +-rw-r--r-- root       root            10097 ./usr/include/gtest/gtest-spi.h
>>>      +-rw-r--r-- root       root             6853 ./usr/include/gtest/gtest-test-part.h
>>>      +-rw-r--r-- root       root            15988 ./usr/include/gtest/gtest-typed-test.h
>>>      +drwxr-xr-x root       root             4096 ./usr/include/gtest/internal
>>>      +drwxr-xr-x root       root             4096 ./usr/include/gtest/internal/custom
>>>      +-rw-r--r-- root       root             1843 ./usr/include/gtest/internal/custom/gtest.h
>>>      +-rw-r--r-- root       root             1858 ./usr/include/gtest/internal/custom/gtest-port.h
>>>      +-rw-r--r-- root       root             2079 ./usr/include/gtest/internal/custom/gtest-printers.h
>>>      +-rw-r--r-- root       root             1682 ./usr/include/gtest/internal/custom/README.md
>>>      +-rw-r--r-- root       root            13436 ./usr/include/gtest/internal/gtest-death-test-internal.h
>>>      +-rw-r--r-- root       root             9764 ./usr/include/gtest/internal/gtest-filepath.h
>>>      +-rw-r--r-- root       root            61757 ./usr/include/gtest/internal/gtest-internal.h
>>>      +-rw-r--r-- root       root            35114 ./usr/include/gtest/internal/gtest-param-util.h
>>>      +-rw-r--r-- root       root             4090 ./usr/include/gtest/internal/gtest-port-arch.h
>>>      +-rw-r--r-- root       root            84530 ./usr/include/gtest/internal/gtest-port.h
>>>      +-rw-r--r-- root       root             7213 ./usr/include/gtest/internal/gtest-string.h
>>>      +-rw-r--r-- root       root             6270 ./usr/include/gtest/internal/gtest-type-util.h
>>>       -rw-r--r-- root       root             5414 ./usr/include/snappy-c.h
>>>      --rw-r--r-- root       root             9885 ./usr/include/snappy.h
>>>      --rw-r--r-- root       root             7256 ./usr/include/snappy-sinksource.h
>>>      --rw-r--r-- root       root             2845 ./usr/include/snappy-stubs-public.h
>>>      +-rw-r--r-- root       root             9909 ./usr/include/snappy.h
>>>      +-rw-r--r-- root       root             7265 ./usr/include/snappy-sinksource.h
>>>      +-rw-r--r-- root       root             2579 ./usr/include/snappy-stubs-public.h
>>>       drwxr-xr-x root       root             4096 ./usr/lib
>>>       drwxr-xr-x root       root             4096 ./usr/lib/cmake
>>>      +drwxr-xr-x root       root             4096 ./usr/lib/cmake/benchmark
>>>      +-rw-r--r-- root       root               60 ./usr/lib/cmake/benchmark/benchmarkConfig.cmake
>>>      +-rw-r--r-- root       root             2742 ./usr/lib/cmake/benchmark/benchmarkConfigVersion.cmake
>>>      +-rw-r--r-- root       root             4247 ./usr/lib/cmake/benchmark/benchmarkTargets.cmake
>>>      +-rw-r--r-- root       root             1380 ./usr/lib/cmake/benchmark/benchmarkTargets-noconfig.cmake
>>>      +drwxr-xr-x root       root             4096 ./usr/lib/cmake/GTest
>>>      +-rw-r--r-- root       root             1438 ./usr/lib/cmake/GTest/GTestConfig.cmake
>>>      +-rw-r--r-- root       root             1978 ./usr/lib/cmake/GTest/GTestConfigVersion.cmake
>>>      +-rw-r--r-- root       root             4958 ./usr/lib/cmake/GTest/GTestTargets.cmake
>>>      +-rw-r--r-- root       root             2525 ./usr/lib/cmake/GTest/GTestTargets-noconfig.cmake
>>>       drwxr-xr-x root       root             4096 ./usr/lib/cmake/Snappy
>>>       -rw-r--r-- root       root             2864 ./usr/lib/cmake/Snappy/SnappyConfig.cmake
>>>       -rw-r--r-- root       root             2742 ./usr/lib/cmake/Snappy/SnappyConfigVersion.cmake
>>>       -rw-r--r-- root       root             3616 ./usr/lib/cmake/Snappy/SnappyTargets.cmake
>>>       -rw-r--r-- root       root              806 ./usr/lib/cmake/Snappy/SnappyTargets-noconfig.cmake
>>>      +lrwxrwxrwx root       root               22 ./usr/lib/libbenchmark_main.so -> libbenchmark_main.so.1
>>>      +lrwxrwxrwx root       root               17 ./usr/lib/libbenchmark.so -> libbenchmark.so.1
>>>      +lrwxrwxrwx root       root               23 ./usr/lib/libgmock_main.so -> libgmock_main.so.1.10.0
>>>      +lrwxrwxrwx root       root               18 ./usr/lib/libgmock.so -> libgmock.so.1.10.0
>>>      +lrwxrwxrwx root       root               23 ./usr/lib/libgtest_main.so -> libgtest_main.so.1.10.0
>>>      +lrwxrwxrwx root       root               18 ./usr/lib/libgtest.so -> libgtest.so.1.10.0
>>>       lrwxrwxrwx root       root               14 ./usr/lib/libsnappy.so -> libsnappy.so.1
>>>      +drwxr-xr-x root       root             4096 ./usr/lib/pkgconfig
>>>      +-rw-r--r-- root       root              240 ./usr/lib/pkgconfig/benchmark.pc
>>>      +-rw-r--r-- root       root              275 ./usr/lib/pkgconfig/gmock_main.pc
>>>      +-rw-r--r-- root       root              268 ./usr/lib/pkgconfig/gmock.pc
>>>      +-rw-r--r-- root       root              275 ./usr/lib/pkgconfig/gtest_main.pc
>>>      +-rw-r--r-- root       root              243 ./usr/lib/pkgconfig/gtest.pc
>>>      diff --git a/packages/core2-64-webos-linux/snappy/snappy-dev/latest b/packages/core2-64-webos-linux/snappy/snappy-dev/latest
>>>      index 0cc143d2..19a23796 100644
>>>      --- a/packages/core2-64-webos-linux/snappy/snappy-dev/latest
>>>      +++ b/packages/core2-64-webos-linux/snappy/snappy-dev/latest
>>>      @@ -1,9 +1,8 @@
>>>      -PV = 1.1.8
>>>      +PV = 1.1.9
>>>       PR = r0
>>>      -PKG = libsnappy-dev
>>>      -RPROVIDES = snappy-dev (=1.1.8)
>>>      -RDEPENDS = snappy (= 1.1.8-r0)
>>>      +RPROVIDES =
>>>      +RDEPENDS = snappy (= 1.1.9-r0)
>>>       RRECOMMENDS = glibc-dev libgcc-dev libstdc++-dev snappy-lic
>>>      -PKGSIZE = 35442
>>>      +PKGSIZE = 1062733
>>>       FILES = /usr/include /lib/lib*.so /usr/lib/lib*.so /usr/lib/*.la /usr/lib/*.o /usr/lib/pkgconfig /usr/share/pkgconfig /usr/share/aclocal /lib/*.o /usr/lib/snappy/*.la /lib/*.la /usr/lib/cmake /usr/share/cmake
>>>      -FILELIST = /usr/lib/libsnappy.so.1 /usr/lib/libsnappy.so.1.1.8
>>>      +FILELIST = /usr/lib/libbenchmark.so.1 /usr/lib/libbenchmark.so.1.5.2 /usr/lib/libbenchmark_main.so.1 /usr/lib/libbenchmark_main.so.1.5.2 /usr/lib/libgmock.so.1.10.0 /usr/lib/libgmock_main.so.1.10.0 /usr/lib/libgtest.so.1.10.0 /usr/lib/libgtest_main.so.1.10.0 /usr/lib/libsnappy.so.1 /usr/lib/libsnappy.so.1.1.9
>>>
>>> * disable tests and benchmarks to install only the files 1.1.8 version used to install
>>>
>>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>>> ---
>>>   meta-oe/recipes-extended/snappy/snappy_1.1.9.bb | 3 +--
>>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
>>> index 2ebe3760a5..151c4ddc38 100644
>>> --- a/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
>>> +++ b/meta-oe/recipes-extended/snappy/snappy_1.1.9.bb
>>> @@ -21,5 +21,4 @@ PACKAGECONFIG ??= ""
>>>   PACKAGECONFIG[lzo] = "-DHAVE_LIBLZO2=1,-DHAVE_LIBLZO2=0,lzo,"
>>>   TARGET_CFLAGS += "-fPIC"
>>>
>>> -EXTRA_OECMAKE += '-DBUILD_SHARED_LIBS="ON" \
>>> -                  '
>>> +EXTRA_OECMAKE += '-DBUILD_SHARED_LIBS="ON" -DSNAPPY_BUILD_TESTS="OFF" -DSNAPPY_BUILD_BENCHMARKS="OFF"'
>>> --
>>> 2.30.2
>>>
>>>
>>> 
>>>
