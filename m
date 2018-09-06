Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3E274745AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Sep 2018 21:24:02 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id r1-v6so15356019wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Sep 2018 14:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mEMCYHc/UnQjUo7HpfQQ/0LLoR1EHtKHd/1i+4zihgI=;
	b=Fxzka4exX87owNMTvK/s5WJs4IA24fVZrA50RtrKh/dGMCtfJ5ssT6nWu+xyCyEiiR
	ZPFoPpBOA34dLcw1uOx04hS8ji6dsly7BclMJ+hrtneYqiHdNzi5EJ4+m902jy6QuPLs
	SJl4xmJWPG2+68Jqx+65xZbn8Cq+gyUE2Ldco6Eof/rdFIeBBLzbXkxoDedQevWUcYKa
	26gPbrAY8/vsfrofpDeItryADAqI+qFNNyxh5iO3sYnRjmA3mHOjoyxyLGPnOFv+Fqvr
	GhVvBqkfSQ2Ia/hFsm+PI4udenr/UYIyu2Jtf5kXcmO6jLylkWzMY4lucUJ+8vFOleC5
	kJhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mEMCYHc/UnQjUo7HpfQQ/0LLoR1EHtKHd/1i+4zihgI=;
	b=MUmIgXeWIQ5GQpkfLPTxOkZj6dkaJ75oGJw2GKoHxivEBWl9PBHEtDTIz0sDzy/FHk
	hy/tDcP/5ZUQeb7634+qU5HOivbAHjZ42Z+usJAMtV1iOpLEfOfz0JpfP0M1Uh8K+9/e
	IwAfediuIvyVAr0Wd9L9DgXgViDxDBoZwhDOou8XTaVQsjEvG0qlZW7NBEouy/0Nf2xI
	ozccdwlNEVdtHGLHuH84fFyFlDlQv0dLVEXcoLv8aYhq9iJ8tGFHKIfQKMaryhcVaHbQ
	XLUq4rM3pfHU16L54T19WYMbwGih3eGZVBdmvsy54q0HVl8ABIcWt5CAvqmeLLqi7tmD
	zgSg==
X-Gm-Message-State: APzg51CWKlMFCqjwi3xh4OeSkv0ti3ku76ueuPChq2YYAKCA4sri2A8n
	2x2Rae018HpsLF/wKvEbpRRz6rr7MxkbRH99S3U=
X-Google-Smtp-Source: ANB0VdaRxB1zeVdmRLSZ0ZXdLbi8prmRAyoQ5qfVsOWmFvd7uCg4I+kxOGrs6PsWUD+tsFusuQ2T8r3mbbtLFO40M0I=
X-Received: by 2002:a1c:ca17:: with SMTP id
	a23-v6mr3090106wmg.122.1536269042887; 
	Thu, 06 Sep 2018 14:24:02 -0700 (PDT)
MIME-Version: 1.0
References: <20180906172210.42551-1-raj.khem@gmail.com>
	<20180906172210.42551-9-raj.khem@gmail.com>
In-Reply-To: <20180906172210.42551-9-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 6 Sep 2018 23:23:51 +0200
Message-ID: <CA+chaQdLgN3zcJX0JbezzJWwts-tP3qwZiFPBdv5QvhyP0t4nw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 09/17] poco: Fix cross compilation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Sep 2018 21:24:02 -0000
Content-Type: text/plain; charset="UTF-8"

I can confirm that issue with new cmake and that this fix fixed it.

Thanks!

Tested-By: Martin Jansa <Martin.Jansa@gmail.com>

On Thu, Sep 6, 2018 at 7:23 PM Khem Raj <raj.khem@gmail.com> wrote:

> Backport a pull request to fix build error seen during cross compiling
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...tall-non-existing-Encodings-testsuit.patch | 31 +++++++++++++++++++
>  meta-oe/recipes-support/poco/poco_1.9.0.bb    |  5 +--
>  2 files changed, 34 insertions(+), 2 deletions(-)
>  create mode 100644
> meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
>
> diff --git
> a/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
> b/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
> new file mode 100644
> index 0000000000..f4a358f47f
> --- /dev/null
> +++
> b/meta-oe/recipes-support/poco/poco/0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch
> @@ -0,0 +1,31 @@
> +From fa079dfc5e1d22ea35762bf4c5b09999bdc5e731 Mon Sep 17 00:00:00 2001
> +From: Jochen Sprickerhof <git@jochen.sprickerhof.de>
> +Date: Wed, 22 Aug 2018 21:42:09 +0200
> +Subject: [PATCH] Don't try to install non existing
> Encodings/testsuite/data
> +
> +Upstream-Status: Backport [https://github.com/pocoproject/poco/pull/2437]
> +---
> + Encodings/testsuite/CMakeLists.txt | 5 +----
> + 1 file changed, 1 insertion(+), 4 deletions(-)
> +
> +diff --git a/Encodings/testsuite/CMakeLists.txt
> b/Encodings/testsuite/CMakeLists.txt
> +index 7508e5522..79495ae02 100644
> +--- a/Encodings/testsuite/CMakeLists.txt
> ++++ b/Encodings/testsuite/CMakeLists.txt
> +@@ -19,12 +19,9 @@ POCO_SOURCES_AUTO_PLAT( TEST_SRCS WINCE
> + add_executable( ${TESTUNIT} ${TEST_SRCS} )
> + if(ANDROID)
> +       add_test(NAME ${LIBNAME} WORKING_DIRECTORY
> ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
> +-                      COMMAND ${CMAKE_COMMAND}
> -DANDROID_NDK=${ANDROID_NDK}
> "-DTEST_FILES=${CMAKE_CURRENT_SOURCE_DIR}/data;"
> -DLIBRARY_DIR=${CMAKE_BINARY_DIR}/lib
> -DUNITTEST=${CMAKE_BINARY_DIR}/bin/${TESTUNIT} -DTEST_PARAMETER=-all -P
> ${CMAKE_SOURCE_DIR}/cmake/ExecuteOnAndroid.cmake)
> ++                      COMMAND ${CMAKE_COMMAND}
> -DANDROID_NDK=${ANDROID_NDK} -DLIBRARY_DIR=${CMAKE_BINARY_DIR}/lib
> -DUNITTEST=${CMAKE_BINARY_DIR}/bin/Encodings-testrunner
> -DTEST_PARAMETER=-all -P ${CMAKE_SOURCE_DIR}/cmake/ExecuteOnAndroid.cmake)
> + else()
> +       add_test(NAME ${LIBNAME} WORKING_DIRECTORY
> ${CMAKE_CURRENT_BINARY_DIR} COMMAND ${TESTUNIT} -all)
> +-      # The test is run in the build directory. So the test data is
> copied there too
> +-      add_custom_command(TARGET ${TESTUNIT} POST_BUILD
> +-                                 COMMAND ${CMAKE_COMMAND} -E
> copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/data
> ${CMAKE_CURRENT_BINARY_DIR}/data )
> + endif()
> + #set_target_properties( ${TESTUNIT} PROPERTIES COMPILE_FLAGS
> ${RELEASE_CXX_FLAGS} )
> + target_link_libraries( ${TESTUNIT}  PocoEncodings PocoFoundation CppUnit
> )
> +--
> +2.18.0
> +
> diff --git a/meta-oe/recipes-support/poco/poco_1.9.0.bb
> b/meta-oe/recipes-support/poco/poco_1.9.0.bb
> index a4f8a05188..258cc4994f 100644
> --- a/meta-oe/recipes-support/poco/poco_1.9.0.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.9.0.bb
> @@ -9,10 +9,11 @@ LIC_FILES_CHKSUM =
> "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
>  DEPENDS = "libpcre zlib"
>
>  SRC_URI = " \
> -    git://github.com/pocoproject/poco.git \
> +    git://github.com/pocoproject/poco.git;branch=poco-${PV}
> <http://github.com/pocoproject/poco.git;branch=poco-$%7BPV%7D> \
> +
> file://0001-Don-t-try-to-install-non-existing-Encodings-testsuit.patch \
>      file://run-ptest \
>     "
> -SRCREV = "94966785a8f9ad0191dffd075ebd67826e6e4b6d"
> +SRCREV = "daf00da73ab917e4d4581e3aa00c0ee61e0cc58b"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.18.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

