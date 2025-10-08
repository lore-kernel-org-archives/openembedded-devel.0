Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD100CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 18:48:13 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.1882.1759949283828703702
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 11:48:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LbRK2o+b;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6394938e0ecso218640a12.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 11:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759949282; x=1760554082; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E4X68o5eNMcWvtXeIzmgSy0r+KKDW7gQhZ9f72RQkDs=;
        b=LbRK2o+b5j/kWyXC5BNk5KGSJmFlOYm0zUsYFCt5t5gZkkwILBxU2dMnjskOuyk5Tz
         WpmYNTRey3zr3Z+2DlxpW654COugmbUHK7NIDjYSKIIs8rvkTbqDxpeeDt93Q3NzJzSl
         o0QF2VQe9wav9W1OeNIqapN/ZU+q07arUNC1daQ+a0Yo5TSC9tmFiNoMuXsMNPEMkFmY
         HLvcM/iZOX3WxWh68ZrbeZCLMsyLBanryQJ0RyDjnf/gQ0/O0kobjjmXXsm3+Qt8w/s9
         9H+JqL9IduBFQJNBX3mD4us7leeWASigWp0kArPE0Rr5UUU2gPcVhtfiIaSVvVC38VTr
         WSrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759949282; x=1760554082;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E4X68o5eNMcWvtXeIzmgSy0r+KKDW7gQhZ9f72RQkDs=;
        b=u2ECcGowNHBOcLBTCgx6znPzghx4IZOIBT9MptJ2tAhA1fDiOFn4O/bo1my7VMq/W1
         cJZGhxe7jUSojt8Ub3/eZbI7oA1r+3t9deNxQ2XGPgCuZZYb7JHFHhiyJDaKuy0xubEk
         /Qq+vfrTcpeG31dkWV3cHiq717IZuTGntTNte9Oi1MOiDYrHvbOWVI1qHGjxy0vnWhUh
         9Uq98j/dPKHvZl0EPAb1hWlxCI7MixflgFnApuCgzFq0f9TfRzMvTkRfhNCKWKdzDbaZ
         02TJVvMk59C5y7Z2aZV4otKcPUUTBMly8LnNa8QW3qUhhPUdj8i1o0jO7SCxgMjUyf+E
         n9Gw==
X-Gm-Message-State: AOJu0YzqnQl+3NPPM6J0LaRtK3XMOvvLAjw1etKBEYwMy/i5LlXptjUa
	jRlZ/EqI9lBTOkV1cbQcIT4sTrwjLCO2JjBC6a0cOUIh93Hlh8uvYXx2
X-Gm-Gg: ASbGncv0qa4nT0dEsdYUGXJfwZjNz5mOvxMdQ65Z9HP2ON9Sgrylt/fLnRILLH+fAsS
	ir8sKTEoCLImvOTBbyKDhwxsaa/89R/OblW+cJpAORrSszf8uSmWutuoDfnceLDVHaeAb2X2+Ac
	bKBI/MusTlkjN4YTYhuQ8jtIdD/HTop2o2fgaGTuT2mpYKjV2SKcXpbxrdB0fy8bi8M19spLby1
	KDPXS5Igzhg7bLs3eUEB3m8x+ygmaOX8zf9MoQn47r/plT0Dvfet+3tqBjyfnCO8AMqtRDQEIfi
	ZcLqPs0QOe5DwG8ZslfxkQwNOWY94nlw3CIQaIBYk97iKGWKgILX63VxrItEdmzcX5x1jAAzetO
	YG/CCHkCK7KvDoRcLptu4E3decYiYCl2l4Ntg9VaWsqihtBwskLSQJVY=
X-Google-Smtp-Source: AGHT+IHWqpjonYH4WdJZRLDjnhPB8ZtlkF/2Jsiy7MuN5HWOsFPt343Oy4xZ3C4LAhe9YU9j+DFeIw==
X-Received: by 2002:a17:906:ef02:b0:b2a:10a3:7113 with SMTP id a640c23a62f3a-b50ab27f33amr495743966b.29.1759949281750;
        Wed, 08 Oct 2025 11:48:01 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4869c4f93esm1727960766b.83.2025.10.08.11.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 11:48:01 -0700 (PDT)
Message-ID: <f2c615a4-2559-42f4-8e79-883629e65a9e@gmail.com>
Date: Wed, 8 Oct 2025 20:48:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] libiec61850: upgrade 1.5.3 -> 1.6.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251007174858.87288-1-skandigraun@gmail.com>
 <CAMKF1sp1koMAGbD4fthXFfvKRBu04-cppJhw8-kOQ9-WZbWxGg@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sp1koMAGbD4fthXFfvKRBu04-cppJhw8-kOQ9-WZbWxGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 18:48:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120378

On 10/8/25 17:53, Khem Raj wrote:
> seeing failures on qemux86
>
> https://errors.yoctoproject.org/Errors/Details/884900/
>
> qemuarm
>
> https://errors.yoctoproject.org/Errors/Details/884889/
>
> I think it is related to target being 32bit.

Right, the cmake's findPython returns python from
${RECIPE_SYSROOT_NATIVE} instead of ${RECIPE_SYSROOT}... will look if I
can solve it more elegantly than just patching the include path to the
correct one.

>
> On Tue, Oct 7, 2025 at 10:49 AM Gyorgy Sarvari via
> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
> wrote:
>> This update contains a fix for CVE-2024-26529, CVE-2024-45970 and CVE-2024-45971
>>
>> Changelog: https://github.com/mz-automation/libiec61850/blob/v1.6/CHANGELOG
>>
>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>> ---
>>  ...MAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 24 +++++++-----
>>  ...-break-CMAKE_INSTALL_PATH-by-trying-.patch | 39 -------------------
>>  ...iec61850_1.5.3.bb => libiec61850_1.6.1.bb} | 10 ++---
>>  3 files changed, 20 insertions(+), 53 deletions(-)
>>  delete mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>>  rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5.3.bb => libiec61850_1.6.1.bb} (77%)
>>
>> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>> index e778e8158b..a33a6248a7 100644
>> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>> @@ -7,7 +7,7 @@ Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs in
>>  This ensures that it gets installed in platform specified system libdir
>>  all platforms do not use /usr/lib as assumed here e.g. ppc64 uses lib64
>>
>> -Upstream-Status: Submitted [https://github.com/mz-automation/libiec61850/pull/376]
>> +Upstream-Status: Denied [https://github.com/mz-automation/libiec61850/pull/376 - closed without a word]
>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>  ---
>>   pyiec61850/CMakeLists.txt | 6 ++++--
>> @@ -15,15 +15,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>
>>  --- a/pyiec61850/CMakeLists.txt
>>  +++ b/pyiec61850/CMakeLists.txt
>> -@@ -31,7 +31,9 @@ endif()
>> +@@ -31,14 +31,9 @@ swig_add_library(pyiec61850
>>
>> - swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
>> + swig_link_libraries(pyiec61850 ${LIBS})
>>
>> --install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>> --install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>> +-# Finding python modules install path
>> +-execute_process(
>> +-      COMMAND ${Python_EXECUTABLE} -c
>> +-      "from sysconfig import get_path; import sys; sys.stdout.write(get_path('platlib'))"
>> +-      OUTPUT_VARIABLE PYTHON_SITE_DIR
>> +-)
>>  +include(GNUInstallDirs)
>> -+
>> -+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>> -+install(TARGETS _iec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}//python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>>
>> - add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
>> +-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${PYTHON_SITE_DIR})
>> +-install(TARGETS pyiec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
>> ++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
>> ++install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
>> +
>> + add_test(test_pyiec61850 ${Python_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
>> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>> deleted file mode 100644
>> index 3f0490cb80..0000000000
>> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>> +++ /dev/null
>> @@ -1,39 +0,0 @@
>> -From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 2001
>> -From: Romain Naour <romain.naour@smile.fr>
>> -Date: Fri, 10 Jul 2020 17:08:34 +0200
>> -Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to find
>> - python modules install path (site-packages)
>> -
>> -https://stackoverflow.com/questions/1242904/finding-python-site-packages-directory-with-cmake
>> -
>> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> ----
>> -Upstream-Status: Pending
>> -
>> - pyiec61850/CMakeLists.txt | 11 ++---------
>> - 1 file changed, 2 insertions(+), 9 deletions(-)
>> -
>> -diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
>> -index 159ef4b..d1732a1 100644
>> ---- a/pyiec61850/CMakeLists.txt
>> -+++ b/pyiec61850/CMakeLists.txt
>> -@@ -31,14 +31,7 @@ endif()
>> -
>> - swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
>> -
>> --# Finding python modules install path
>> --execute_process(
>> --      COMMAND ${PYTHON_EXECUTABLE} -c
>> --      "from distutils.sysconfig import get_python_lib; import sys; sys.stdout.write(get_python_lib())"
>> --      OUTPUT_VARIABLE PYTHON_SITE_DIR
>> --)
>> --
>> --install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${PYTHON_SITE_DIR})
>> --install(TARGETS _iec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
>> -+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>> -+install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>> -
>> - add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
>> ---
>> -2.31.1
>> -
>> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
>> similarity index 77%
>> rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
>> rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
>> index cfded66e41..eb9ab9b4fe 100644
>> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
>> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
>> @@ -13,10 +13,9 @@ SECTION = "console/network"
>>  LICENSE = "GPL-3.0-only"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>  DEPENDS = "swig-native python3"
>> -SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
>> +SRCREV = "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
>>
>> -SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
>> -           file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
>> +SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;tag=v${PV} \
>>             file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
>>  "
>>
>> @@ -26,12 +25,13 @@ inherit cmake pkgconfig python3-dir python3native siteinfo
>>  EXTRA_OECMAKE = " \
>>      -DBUILD_EXAMPLES=OFF \
>>      -DBUILD_PYTHON_BINDINGS=ON \
>> +    -DPYTHON_BASEVERSION=${PYTHON_BASEVERSION} \
>>  "
>>
>>  RDEPENDS:${PN}-python = " python3-core "
>>  RDEPENDS:${PN} = " python3-core "
>>
>>  FILES:${PN} += " \
>> -    ${PYTHON_SITEPACKAGES_DIR}/iec61850.py \
>> -    ${PYTHON_SITEPACKAGES_DIR}/_iec61850.so \
>> +    ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
>> +    ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
>>  "
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#120342): https://lists.openembedded.org/g/openembedded-devel/message/120342
>> Mute This Topic: https://lists.openembedded.org/mt/115640790/1997914
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>


