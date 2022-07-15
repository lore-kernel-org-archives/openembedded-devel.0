Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0591AC43334
	for <webhook@archiver.kernel.org>; Fri, 15 Jul 2022 16:53:55 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com
 [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.web11.1564.1657904028310897243
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:53:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=M21gMF8d;
 spf=pass (domain: gmail.com, ip: 209.85.160.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f182.google.com with SMTP id l14so1816949qtv.4
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 15 Jul 2022 09:53:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mG4hlqa5wuPJ1X0X2tkfTwuuqrqEJd+mZtxShQ8lpAw=;
        b=M21gMF8dCbmfa/aPOQTOEq2Dwrk+BCFEoGBelGPtw2H6aKW16i/HDwdjM31oSRAjij
         jhhgsczDmJgy7w+hU7W7mDmGAnw6rw2tFsb7mKU4NbCsLsjbzAnqcFAPbOwZHaLZwd4/
         d4SoixdfbYTurQFMdxjm+Xigx21vrEvngqMz0nAG6fJ+lb0jqJ2VBw88WPgrKRvzv4+v
         SmMoNkYU6SgQstwq+rdiEtVSrRva6kTGR+8TIvHAfbEjxyEC1jgDEvDY+kQ6U+CsqhDc
         7t4Lj58ysrqTrunQ3335WTuh2YeqFa/6cLY31Z34gAlyHvgugNV/UIhq+OmdyVv5dads
         xWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mG4hlqa5wuPJ1X0X2tkfTwuuqrqEJd+mZtxShQ8lpAw=;
        b=TBOfQ1DJIFusARsWKUCr+PZoYUanV3QfrL4t/bdzTxW4xWETAqVNjZ1YKsUHL7Uo6q
         RbkEKXX45dNP8SLLTZlex/I5aPoR7yRhOy2RGzN1nSrimqUpmkT7+EM9NiCEcfOeYrMl
         8QIWxl4buNB19hPzYRdDJ9nHSXqR+QmKXNXNsG3nTwTEV8AmTILVH5TNj/w8i+wV8Fm+
         4VOjQx0TOO3WRPVoMRkQbmWYV6oMteDAeg6DTStrVrWR0Syr8U1bxUsW2pw8IjimnwNw
         uwoGFL5zoc6Fke33SJjfZxZ61TwRalOilNGOY5S0uarJC8MY4Ra6BULahIx0kNc/+538
         Hfiw==
X-Gm-Message-State: AJIora+GoBot9kZwojl0cW4LbEpQgLg2Tc5mqjvQdPCRdwP3CKPf+bZU
	ZzO4FWFKunu1mW24LvyE2YO93lHdqAe6R0JnNgCU9ucO43twJw==
X-Google-Smtp-Source: 
 AGRyM1vby5W2Hg73IgjRRK2u/ucPWW+iKQi2JdZK6NdGowNAqcuV1gZz0VMK7Ke8XPFv7YCHcH95SIWUo+CFvHD3aOM=
X-Received: by 2002:a05:622a:13ce:b0:31a:b4ce:1679 with SMTP id
 p14-20020a05622a13ce00b0031ab4ce1679mr13010599qtk.330.1657904026794; Fri, 15
 Jul 2022 09:53:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220713123014.1080802-1-andrej.valek@siemens.com>
In-Reply-To: <20220713123014.1080802-1-andrej.valek@siemens.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 15 Jul 2022 12:53:20 -0400
Message-ID: 
 <CAMKF1sr=jVfb7b7GC8QZuK+J2gUMJoP5e7rQZWr1+wgEBS4REg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] poco: upgrade 1.11.3 -> 1.12.0
To: Andrej Valek <andrej.valek@siemens.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 15 Jul 2022 16:53:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97847

it needs to link to libatomic on rv32 see

https://errors.yoctoproject.org/Errors/Details/660351/

On Wed, Jul 13, 2022 at 8:30 AM Andrej Valek <andrej.valek@siemens.com> wrote:
>
>  - switch from PCRE -> PCRE2
>  - add Prometheus library
>  - add option to enable/disable ActiveRecord (disabled by default)
>
> Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
> ---
>  .../0001-fix-unbundled-PCRE2-dependency.patch | 25 +++++++++++++
>  ...0002-remove-providers-unitialization.patch | 35 +++++++++++++++++++
>  .../poco/{poco_1.11.3.bb => poco_1.12.0.bb}   | 11 ++++--
>  3 files changed, 68 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency.patch
>  create mode 100644 meta-oe/recipes-support/poco/poco/0002-remove-providers-unitialization.patch
>  rename meta-oe/recipes-support/poco/{poco_1.11.3.bb => poco_1.12.0.bb} (89%)
>
> diff --git a/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency.patch b/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency.patch
> new file mode 100644
> index 000000000..1a9d23cee
> --- /dev/null
> +++ b/meta-oe/recipes-support/poco/poco/0001-fix-unbundled-PCRE2-dependency.patch
> @@ -0,0 +1,25 @@
> +From f049898c8bf058ed187de8e5fab20abeaab1f3b6 Mon Sep 17 00:00:00 2001
> +From: Alex Fabijanic <alex@pocoproject.org>
> +Date: Sat, 9 Jul 2022 19:13:04 +0200
> +Subject: [PATCH] fix(cmake): PocoFoundationConfig.cmake should now check for
> + PCRE2 #3677
> +
> +Upstream-Status: Backport [https://github.com/pocoproject/poco/issues/3677]
> +
> +---
> + Foundation/cmake/PocoFoundationConfig.cmake | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Foundation/cmake/PocoFoundationConfig.cmake b/Foundation/cmake/PocoFoundationConfig.cmake
> +index 46c2d3fc00..82c5788940 100644
> +--- a/Foundation/cmake/PocoFoundationConfig.cmake
> ++++ b/Foundation/cmake/PocoFoundationConfig.cmake
> +@@ -2,7 +2,7 @@ if(@POCO_UNBUNDLED@)
> +       include(CMakeFindDependencyMacro)
> +       list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}")
> +       find_dependency(ZLIB REQUIRED)
> +-      find_dependency(PCRE REQUIRED)
> ++      find_dependency(PCRE2 REQUIRED)
> + endif()
> +
> + include("${CMAKE_CURRENT_LIST_DIR}/PocoFoundationTargets.cmake")
> diff --git a/meta-oe/recipes-support/poco/poco/0002-remove-providers-unitialization.patch b/meta-oe/recipes-support/poco/poco/0002-remove-providers-unitialization.patch
> new file mode 100644
> index 000000000..7d24b79f1
> --- /dev/null
> +++ b/meta-oe/recipes-support/poco/poco/0002-remove-providers-unitialization.patch
> @@ -0,0 +1,35 @@
> +From c976c32e5249cb8a2433e7abfa095c1fe8dc4f8e Mon Sep 17 00:00:00 2001
> +From: Alex Fabijanic <alex@pocoproject.org>
> +Date: Wed, 13 Jul 2022 12:53:52 +0200
> +Subject: [PATCH] fix(OpenSSLInitializer): remove providers unitialization
> + #3562 #3567
> +
> +Upstream-Status: Backport [https://github.com/pocoproject/poco/issues/3562]
> +
> +---
> + Crypto/src/OpenSSLInitializer.cpp | 12 ------------
> + 1 file changed, 12 deletions(-)
> +
> +diff --git a/Crypto/src/OpenSSLInitializer.cpp b/Crypto/src/OpenSSLInitializer.cpp
> +index 4678d22299..c537c3f9c2 100644
> +--- a/Crypto/src/OpenSSLInitializer.cpp
> ++++ b/Crypto/src/OpenSSLInitializer.cpp
> +@@ -157,18 +157,6 @@ void OpenSSLInitializer::uninitialize()
> + #endif
> +               delete [] _mutexes;
> + #endif
> +-
> +-#if OPENSSL_VERSION_NUMBER >= 0x30000000L
> +-              OSSL_PROVIDER* provider = nullptr;
> +-              if ((provider = _defaultProvider.exchange(nullptr)))
> +-              {
> +-                      OSSL_PROVIDER_unload(provider);
> +-              }
> +-              if ((provider = _legacyProvider.exchange(nullptr)))
> +-              {
> +-                      OSSL_PROVIDER_unload(provider);
> +-              }
> +-#endif
> +       }
> + }
> +
> diff --git a/meta-oe/recipes-support/poco/poco_1.11.3.bb b/meta-oe/recipes-support/poco/poco_1.12.0.bb
> similarity index 89%
> rename from meta-oe/recipes-support/poco/poco_1.11.3.bb
> rename to meta-oe/recipes-support/poco/poco_1.12.0.bb
> index 757fa8983..6fff0707d 100644
> --- a/meta-oe/recipes-support/poco/poco_1.11.3.bb
> +++ b/meta-oe/recipes-support/poco/poco_1.12.0.bb
> @@ -6,13 +6,15 @@ LICENSE = "BSL-1.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=4267f48fc738f50380cbeeb76f95cebc"
>
>  # These dependencies are required by Foundation
> -DEPENDS = "libpcre zlib"
> +DEPENDS = "libpcre2 zlib"
>
>  SRC_URI = " \
>      git://github.com/pocoproject/poco.git;branch=master;protocol=https \
> +    file://0001-fix-unbundled-PCRE2-dependency.patch \
> +    file://0002-remove-providers-unitialization.patch \
>      file://run-ptest \
>     "
> -SRCREV = "191cbdc97e1d9de023b8a65e0dc844911c06f6a8"
> +SRCREV = "4ba8595ed83841d1fa240716b5652adc3772c36b"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "poco-(?P<pver>\d+(\.\d+)+)"
>
> @@ -23,7 +25,7 @@ inherit cmake ptest
>  # By default the most commonly used poco components are built
>  # Foundation is built anyway and doesn't need to be listed explicitly
>  # these don't have dependencies outside oe-core
> -PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto JWT Data DataSQLite Zip Encodings Redis"
> +PACKAGECONFIG ??= "XML JSON MongoDB PDF Util Net NetSSL Crypto JWT Data DataSQLite Zip Encodings Redis Prometheus"
>
>  PACKAGECONFIG[XML] = "-DENABLE_XML=ON,-DENABLE_XML=OFF,expat"
>  PACKAGECONFIG[JSON] = "-DENABLE_JSON=ON,-DENABLE_JSON=OFF"
> @@ -39,6 +41,7 @@ PACKAGECONFIG[DataSQLite] = "-DENABLE_DATA_SQLITE=ON -DSQLITE3_LIBRARY:STRING=sq
>  PACKAGECONFIG[Zip] = "-DENABLE_ZIP=ON,-DENABLE_ZIP=OFF"
>  PACKAGECONFIG[Encodings] = "-DENABLE_ENCODINGS=ON,-DENABLE_ENCODINGS=OFF"
>  PACKAGECONFIG[Redis] = "-DENABLE_REDIS=ON,-DENABLE_REDIS=OFF"
> +PACKAGECONFIG[Prometheus] = "-DENABLE_PROMETHEUS=ON,-DENABLE_PROMETHEUS=OFF"
>
>  # Additional components not build by default,
>  # they might have dependencies not included in oe-core
> @@ -47,6 +50,8 @@ PACKAGECONFIG[mod_poco] = "-DENABLE_APACHECONNECTOR=ON,-DENABLE_APACHECONNECTOR=
>  PACKAGECONFIG[CppParser] = "-DENABLE_CPPPARSER=ON,-DENABLE_CPPPARSER=OFF"
>  PACKAGECONFIG[DataMySQL] = "-DENABLE_DATA_MYSQL=ON -DMYSQL_LIB:STRING=mysqlclient_r,-DENABLE_DATA_MYSQL=OFF,mariadb"
>  PACKAGECONFIG[DataODBC] = "-DENABLE_DATA_ODBC=ON,-DENABLE_DATA_ODBC=OFF,libiodbc"
> +PACKAGECONFIG[ActiveRecord] = "-DENABLE_ACTIVERECORD=ON,-DENABLE_ACTIVERECORD=OFF"
> +PACKAGECONFIG[ActiveRecordCompiler] = "-DENABLE_ACTIVERECORD_COMPILER=ON,-DENABLE_ACTIVERECORD_COMPILER=OFF"
>  PACKAGECONFIG[PageCompiler] = "-DENABLE_PAGECOMPILER=ON,-DENABLE_PAGECOMPILER=OFF"
>  PACKAGECONFIG[PageCompilerFile2Page] = "-DENABLE_PAGECOMPILER_FILE2PAGE=ON,-DENABLE_PAGECOMPILER_FILE2PAGE=OFF"
>  PACKAGECONFIG[SevenZip] = "-DENABLE_SEVENZIP=ON,-DENABLE_SEVENZIP=OFF"
> --
> 2.34.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#97820): https://lists.openembedded.org/g/openembedded-devel/message/97820
> Mute This Topic: https://lists.openembedded.org/mt/92356100/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

