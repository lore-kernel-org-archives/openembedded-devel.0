Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD294C3DA4A
	for <webhook@archiver.kernel.org>; Sat, 10 Aug 2024 15:10:39 +0000 (UTC)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
 by mx.groups.io with SMTP id smtpd.web11.7492.1723302637339263217
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 10 Aug 2024 08:10:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eKMZ9e81;
 spf=pass (domain: gmail.com, ip: 209.85.219.176, mailfrom: akuster808@gmail.com)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e0857a11862so2953310276.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 08:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723302636; x=1723907436; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UWJh35PDe2AzYxI12mupJrHDYEAF1duYRbN1meVb9EM=;
        b=eKMZ9e817Ewdmu+XtAu2rEJoLHz8hJpmlrL62JqW81bOF+V+YQqqh8lhC2YUqpUxIf
         fTRG/D2BwXNiUR3itkOXixNwweEuaLy81OZIVv6S8IT01QN8wvjJi1w2E5imzmrL4ejz
         j7gK+jkyjGjvI6YdJQxR8M6CKu/SI2yf80ezuApGg4pU4OD/kl8vBX/8M3krk/WXBdI3
         WbZAh38n3BWZOloeMKhLXnKLh0op2vtsdkHsZC4JA9QJT4J14EDWDD6LPw4Ww3R5rCV7
         zEtrfpBq7pNQXysDDIhK74d9uSiTki1+pS2iBX6iOB+MclT7OTZOi4SsIPUbIEzu1sOa
         LTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723302636; x=1723907436;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UWJh35PDe2AzYxI12mupJrHDYEAF1duYRbN1meVb9EM=;
        b=T38tf6Fc+8xbWk3ijmAPZfY5ysydJkWGmZHosPMrwLsG+MCnxhi/REyvwD/xaheFFB
         1JhsHD4CkhWWcY2omkBJ7jAMti/WA+1AY86TSvxBo+4NQuSYgaVtQPoQFvV5KZZRwaJo
         DzmDxl3bIst6mOPhM0YBC95uPdtuuMTllBB8XUxM1s7MI1N1lWxoxH0oTYFTdYLjib/U
         Kue8ZOeHn8f7HmK2eXAxerhMRlRDToGprm9TodKrqIxo90QuPZscLp/9VR590PYP8DMH
         yyAbN+yr+9zBQ5tiAeJ81T1euOzV66iOtHtrm39A7GMoqucA/saR4ymoER/+Wk0KaoMb
         +mLw==
X-Forwarded-Encrypted: i=1; AJvYcCWM6zwDVJv+VmoAamTpIcMl7ZVdN0RFCUAac8VpTTfPiQKSvsV1MDVnJnRu3a1ZF3D/DCVfxhnxzuDGovt/CuYczJBc0ZE1AaIw+YhAHWMF7pFcnl+jk/gNvA==
X-Gm-Message-State: AOJu0YxXx5tNK6DsNw+EBzk30dLK3zAEU2g8CcIk/d9EINNAacM2m+G4
	05Fa5iVOlYr/ntMvASxEaXuC3llKnU9xN5Gje3bGLLOqstXimFCW
X-Google-Smtp-Source: AGHT+IEpr+N9gov/I5nsqISDyYiqIVY5b8CusGjl6BFMjMFSe/4bc/ymOGLlpZcf1RieU98gpABNGw==
X-Received: by 2002:a05:6902:1021:b0:e0b:c297:8a23 with SMTP id 3f1490d57ef6-e0eb9a7c3d0mr4755727276.43.1723302636314;
        Sat, 10 Aug 2024 08:10:36 -0700 (PDT)
Received: from ?IPV6:2600:1700:45dd:7000:ad:eb2b:7538:7504? ([2600:1700:45dd:7000:ad:eb2b:7538:7504])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e0ec8ca637asm373136276.59.2024.08.10.08.10.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Aug 2024 08:10:35 -0700 (PDT)
Message-ID: <e1cf744b-c090-4ac4-ae1a-e24fbf175dc6@gmail.com>
Date: Sat, 10 Aug 2024 11:10:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe][scarthgap][master][PATCH] rocksdb: Add an option to set
 static library
To: nikhil.r@kpit.com, openembedded-devel@lists.openembedded.org,
 bindu.bhabu@kpit.com
References: <20240809110619.25499-1-nikhil.r@kpit.com>
Content-Language: en-US
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; keydata=
 xsDNBGNNaZMBDAC6/Mhpw3EGOOTPtIpcUHT4lI974zN/QqccMPxH4oyBPRJbjVImYs9avXwV
 Ae9xoWKMM/vocEZWm6SOESZSGf+7l05Eo6MxU50cIQh0/bcOcdDAtFRDk4pZIL6X7vGzvFe6
 17tfNwKrTPgDFSSvq6XLUOqukInaVMHPeZum5GNnfuJswSDEQdxGTgudLWhCYwwoJ1AsVhg1
 nJXjQLOGUHFAZPYMhTak5jFXwG+CFzJ1OPpoAfcjQGYEYY5k5Yr1dESl/zgZSwwRLAAXo6JZ
 lm1rdd0c54XG4ah6fvZkd8r05uBVvbvmrdw5OohqqWzMq7RB9DAsszLvOaxN1epwUYnpkQ6x
 yYRBQxt766hLxtW6+bIXUZdinUsc0cD+MlLfynTzpT3eJPhvU9EtpTkA7hlFtHrhENRlT5rE
 F1ZCGykIhg5J/BL/JO3AISgliu0pPLg9r6tgZKu8r2LBf05LJ1vT2P1wVwlzpAdgHKAmTDF8
 MFEASfeJ4o9TrVFGbt8+cA0AEQEAAc0hYWt1c3RlcjgwOCA8YWt1c3RlcjgwOEBnbWFpbC5j
 b20+wsEHBBMBCAAxFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZQCGwMECwkIBwUVCAkK
 CwUWAgMBAAAKCRB5KfJxvOuR703oDAC4coUucV3gE+pNQAJcNWqIQwZHiwxbMy2fBgvTP0bx
 TQj6ZFl4tkiXGydUy9c2lcOj4XfaJuG85Z24IIJE0d8hWZMOZkSv5bmyB/NxbM5xRnPkHb6M
 n58wMSRCfNj/fsOoJE9nj5s41ktg1CA9QFBl9Dt0/8J/Mq+TxOKqYvzL4L8KEIw9nsi/yHQX
 ukXDwI2V01hTPZ6P7a4cZsjuvzCVN/WK2N3LzoVhQZHOOHGgx3h8XmsXMZ2ZxKjIdFTO2gFS
 48zXa4+LW/ZyJIUlnBIUdSnpS826wSq6Zn3TyvLJrFD3KSviX0N48htIfiYFJmTcGdDU+Zqr
 wKnPQWdZXgWLsv+3deGZ8z0UCdt3n/OSwRML3gFfYd7QBLazXIkFyplFmgOLwXkf+YifwSbu
 P3KTOpYN9bcl1Og2zU1dPTEg7RndDAvRUUA+XWrp7VM5gZgc0UFRNkrf4CZhxuMwATCJQVPj
 aII+TOxThBkx6NJqXD3tvlNozjLy4fLNZd8sAsrOwM0EY01plAEMAJ5IoQo1AbOAoMYUytqx
 zi1uOQa+ak48yVg4llEs55D9h9ANFEY8C5CyEYyXYKjHCgepUUHDRKIMIMxxzYLKDkd8bgvt
 +cmi1Jj36Wrzrf9qGFq5SvGL66IoUBCTsN64UexxbnNWMDF8qO2aXLvJZtfFJfYGc1ATDw8i
 96pv+FpjE3N76RdYRSFv5UGRqSKhT6jGlVMHb+Z/h1BOIsEBmbtgCozzJ45zhOY9635B4D7w
 i6CB2Aau3/FycPrKk/ZvkSq28tGYWwuhr/fvfvowg+IeClP1oCdKbaWsEwkGTN/PsRM8dPPe
 n07jesJUgpiHCUTF9oY3wJ1a86otszmWbvtJieM7vOxP3YnzF/VVFgDhTzRS0VqAjNRNOMoF
 E7ENS8o7uj7jrrGPuuM9cOhuDqqHwla3Rh0VX+W0//8qGZJ61oGV9paoGUb4PoRqC8ZpLrMB
 Z+f1VQ4iH7rzSQTOLEqGMZ+A34266TtKZKgmBxyqgNFd1HEeO4PD46ycLpnZAQARAQABwsD2
 BBgBCAAgFiEEztCAddKAZuvtYngBeSnycbzrke8FAmNNaZUCGwwACgkQeSnycbzrke+SWgv/
 QvvX84fAHEl7dkhla/oPdqY2bULh+hOxpo3WZmFhHi+41z2GhOJ78S3mY3yD+O7rdXkQIgIu
 bZDOIBMJc0lY/qKfXGpFOg5b8/hW3pYdjmUP1NQmdFK4XRLRL4OhLttgxVgO2yqDtlt9x1o3
 RLgTSJNsy/gQzUJw4m1zYs9qPRz7xglHwrn0OdDwgk6UofiS31cTZgz7txdNJ5pMNEOcjsaD
 KE+3jd6mAOz/VTG7mH3/5z0t+g9onQmfxBFpgxSM8HVtmjT4KWkqqUJzyXLtawbxhdv+fcUv
 5qUSr9ktwA8NJHmIHHcXBqiZLtLWFMJrdsgTFvjCXmTpm3ncsHS9L+JLVwIVCmUQUUCN1LhG
 itDSpYIEGrZObj82rX1wvxf/ZQ8VXS+owIR2F4yeeqPH/CyrPA1ASdtt+Am28/dJ2krr72at
 J++uLxA0cein1kjcosFDpQscnDcPzohnGyyjgEd6VwelZboIS1jt4lIa1badtV+cWMGMgM8W
 ApZ86eOP
In-Reply-To: <20240809110619.25499-1-nikhil.r@kpit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 10 Aug 2024 15:10:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111737



On 8/9/24 7:06 AM, Nikhil via lists.openembedded.org wrote:
> Modify the CMakeLists.txt to add an Option for
> STATIC target import, as available for shared library.
>
> Link: https://github.com/facebook/rocksdb/pull/12890
>
> Configure static library default to switched off
> as shared libraries are sufficient in most cases.

I believe Master will need this change first.

- armin
>
> Signed-off-by: Bhabu Bindu <bindu.bhabu@kpit.com>
> ---
>   .../files/static_library_as_option.patch      | 72 +++++++++++++++++++
>   meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb  |  2 +
>   2 files changed, 74 insertions(+)
>   create mode 100644 meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
>
> diff --git a/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
> new file mode 100644
> index 000000000..58914bd22
> --- /dev/null
> +++ b/meta-oe/recipes-dbs/rocksdb/files/static_library_as_option.patch
> @@ -0,0 +1,72 @@
> +From 285d306494bde3e9c24c8cd6fea1eb380a304d03 Mon Sep 17 00:00:00 2001
> +From: Bindu-Bhabu <bindudaniel1996@gmail.com>
> +Date: Fri, 26 Jul 2024 15:14:45 +0530
> +Subject: Add option to CMake for building static libraries
> +
> +ROCKSDB creates a STATIC library target reference by default.
> +Modify the cmake so that the STATIC library is also an option
> +just like creating a SHARED library and set default to ON.
> +
> +Upstream-Status: Accepted
> +Link: https://github.com/facebook/rocksdb/pull/12890
> +
> +Signed-off-by: Nisha Parrakat <nisha.m.parrakat@bmw.de>
> +Signed-off-by: Bindu Bhabu <bhabu.bindu@kpit.com>
> +---
> + CMakeLists.txt | 29 +++++++++++++++++------------
> + 1 file changed, 17 insertions(+), 12 deletions(-)
> +
> +diff --git a/CMakeLists.txt b/CMakeLists.txt
> +index 93b884dd9c1..2ca925d505c 100644
> +--- a/CMakeLists.txt
> ++++ b/CMakeLists.txt
> +@@ -98,6 +98,7 @@ if (WITH_WINDOWS_UTF8_FILENAMES)
> +   add_definitions(-DROCKSDB_WINDOWS_UTF8_FILENAMES)
> + endif()
> + option(ROCKSDB_BUILD_SHARED "Build shared versions of the RocksDB libraries" ON)
> ++option(ROCKSDB_BUILD_STATIC "Build static versions of the RocksDB libraries" ON)
> +
> + if( NOT DEFINED CMAKE_CXX_STANDARD )
> +   set(CMAKE_CXX_STANDARD 17)
> +@@ -1139,11 +1140,13 @@ string(REGEX REPLACE "[^0-9: /-]+" "" GIT_DATE "${GIT_DATE}")
> + set(BUILD_VERSION_CC ${CMAKE_BINARY_DIR}/build_version.cc)
> + configure_file(util/build_version.cc.in ${BUILD_VERSION_CC} @ONLY)
> +
> +-add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
> +-target_include_directories(${ROCKSDB_STATIC_LIB} PUBLIC
> +-  $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>)
> +-target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
> +-  ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
> ++if(ROCKSDB_BUILD_STATIC)
> ++  add_library(${ROCKSDB_STATIC_LIB} STATIC ${SOURCES} ${BUILD_VERSION_CC})
> ++  target_include_directories(${ROCKSDB_STATIC_LIB} PUBLIC
> ++    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>)
> ++  target_link_libraries(${ROCKSDB_STATIC_LIB} PRIVATE
> ++    ${THIRDPARTY_LIBS} ${SYSTEM_LIBS})
> ++endif()
> +
> + if(ROCKSDB_BUILD_SHARED)
> +   add_library(${ROCKSDB_SHARED_LIB} SHARED ${SOURCES} ${BUILD_VERSION_CC})
> +@@ -1238,13 +1241,15 @@ if(NOT WIN32 OR ROCKSDB_INSTALL_ON_WINDOWS)
> +
> +   install(DIRECTORY "${PROJECT_SOURCE_DIR}/cmake/modules" COMPONENT devel DESTINATION ${package_config_destination})
> +
> +-  install(
> +-    TARGETS ${ROCKSDB_STATIC_LIB}
> +-    EXPORT RocksDBTargets
> +-    COMPONENT devel
> +-    ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> +-    INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
> +-  )
> ++  if(ROCKSDB_BUILD_STATIC)
> ++    install(
> ++      TARGETS ${ROCKSDB_STATIC_LIB}
> ++      EXPORT RocksDBTargets
> ++      COMPONENT devel
> ++      ARCHIVE DESTINATION "${CMAKE_INSTALL_LIBDIR}"
> ++      INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
> ++    )
> ++  endif()
> +
> +   if(ROCKSDB_BUILD_SHARED)
> +     install(
> diff --git a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
> index 444351dbb..fae54fdba 100644
> --- a/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
> +++ b/meta-oe/recipes-dbs/rocksdb/rocksdb_9.0.0.bb
> @@ -17,6 +17,7 @@ SRC_URI = "git://github.com/facebook/${BPN}.git;branch=${SRCBRANCH};protocol=htt
>              file://0005-Implement-timer-implementation-for-mips-platform.patch \
>              file://0006-Implement-timer-for-arm-v6.patch \
>              file://0007-Fix-declaration-scope-of-LE_LOAD32-in-crc32c.patch \
> +           file://static_library_as_option.patch \
>             "
>
>   SRC_URI:append:riscv32 = " file://0001-replace-old-sync-with-new-atomic-builtin-equivalents.patch"
> @@ -43,6 +44,7 @@ EXTRA_OECMAKE = "\
>       -DWITH_BENCHMARK_TOOLS=OFF \
>       -DWITH_TOOLS=OFF \
>       -DFAIL_ON_WARNINGS=OFF \
> +    -DROCKSDB_BUILD_STATIC=OFF \
>   "
>
>   CXXFLAGS += "${@bb.utils.contains('SELECTED_OPTIMIZATION', '-Og', '-DXXH_NO_INLINE_HINTS', '', d)}"
> --
> 2.25.1
>
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#111692): https://lists.openembedded.org/g/openembedded-devel/message/111692
> Mute This Topic: https://lists.openembedded.org/mt/107805972/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


