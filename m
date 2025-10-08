Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD23CAC5BB
	for <webhook@archiver.kernel.org>; Wed,  8 Oct 2025 19:33:19 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.455.1759951996044717270
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Oct 2025 12:33:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=h9LhXv2a;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b48d8deafaeso40598066b.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 12:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759951994; x=1760556794; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ynaqqw09LxzcVpyt1VFREXIMk+7oMiMEFkDvOOJeXYg=;
        b=h9LhXv2aP1wpRwkhTfxtxX/HYTGrMpK6D7BP0qao9dLhMecY0DKZe2DfsmyluvMBRe
         hYBjjmCFv5beiuZ2dX5sr7vumFyLgwRNbKaRLRb7yvYq6leV+BSpm7kBkRycmJ3sLqZj
         M8cbrLqYIfWt0fLfDm1RrIZTla+GEJ9mE5mZEwQovTVwF/IktnTHpEfka9hay4/AokuL
         JlGY5gHj3a7OPlDA6/BLNBFAKJJkzVh54zBv1txpBUBCEc7MIuhud6IONUwHPa8C4iw8
         Jqp72FJTMq2OocUg8drrk0rQVa3/Kef0M7wvT7CPmK3jjXs15x/dtcG7+9bOD9m1ZBp3
         Wp0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759951994; x=1760556794;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ynaqqw09LxzcVpyt1VFREXIMk+7oMiMEFkDvOOJeXYg=;
        b=M5H8pRdovAjp/oPZzmh4TTG+QlnP84W061NQHaG8tiT7EGCfmdlQzkvecl8Hwv3rC6
         p1UyxMaAvr5GMANdTBR15f3Uw6Bc+02TOmrTEn0NGAqXFH729cFNG0jiIEgQ/VDYEJ2P
         ltZYZ7itElMBNBpXcCdWd7G3uvQPn/zop1rSTIcQGFtRfOXpiC1aNYXrDTgcq8aPk77u
         s07h4S3DPhy8EuaS/uppRwb8GRCjF2gbW2OW54C4EKQG/mFUO9+7XSTkX01oGX1uDcoa
         hjHt827Nzkq0L2QHFCQhIgObWhn4ctyoxyU3W0wmlwwGUKNnCguxfFoQ1UleP1S/Ji7P
         csaQ==
X-Gm-Message-State: AOJu0Yw2JNJWAQqSPymyH+2Temi6QnJGRa8EOZN7g0w1ee6t+L50rlzp
	JNsHbkcWENbDb6sQsx5DNSIhcNJSPtD5fTVlG9UqOghHjfl0h9C5LyvBAInVlJY3
X-Gm-Gg: ASbGncsXfQ8duMdk5cFzz7zU6lQw4vzrdY8xXQ5o1ib1cf3QWBz5Lil52g7uKhgSlQx
	r2NlSfaYI3Uqgme9H/NJsUDSKj09r+2ZC9nqFuWQqGZoNpumGPISMATZabByZ2G7Ua70CuzhOpx
	zb8nnj3s/exMldkQJNVmgsnBwjXtgLp4bb1JApBkZWXOFLqeiUcTa+f8djDjJY53yNtf/TBBEn8
	38J0b+oVpAcOBx0QtnCrV7U+PVCFwHxuDOWhGH5m0hvIZY02bts74FrOteaN1f20vvXMA86JVuO
	y/7lY7Fc70F3kRoOD3mwEZbjo/BPENCsSWsL6vCPPKnk6Gq9f8mT2SK48gZzUFzf4q2Eq9+MS2y
	sSc/o7I0IpprOtMp6zs0R+fEYMzGYR5iiDKWnsZhMDm/GV5XOYm3EIJeSNjt3iJZNGg==
X-Google-Smtp-Source: AGHT+IHXZ5y/wnX5rOkHqdZHwmXbHv/eIXVdextDl+DFQ6VjCm4jDoi4bo+3WiJxcl5diQ/6t9DCQA==
X-Received: by 2002:a17:907:980f:b0:b42:9840:eac5 with SMTP id a640c23a62f3a-b50acb0e645mr514899566b.61.1759951994108;
        Wed, 08 Oct 2025 12:33:14 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486a173b4csm1727114966b.86.2025.10.08.12.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 12:33:13 -0700 (PDT)
Message-ID: <c54796f0-0428-49b4-bb37-543750a20578@gmail.com>
Date: Wed, 8 Oct 2025 21:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-networking][PATCH] libiec61850: upgrade 1.5.3 -> 1.6.1
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
References: <20251007174858.87288-1-skandigraun@gmail.com>
 <CAMKF1sp1koMAGbD4fthXFfvKRBu04-cppJhw8-kOQ9-WZbWxGg@mail.gmail.com>
 <f2c615a4-2559-42f4-8e79-883629e65a9e@gmail.com>
 <CAMKF1sr2a7p9Sj0g3-qeXks+XW4yPFAcsCPFAH1+gkM4r743YA@mail.gmail.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <CAMKF1sr2a7p9Sj0g3-qeXks+XW4yPFAcsCPFAH1+gkM4r743YA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 08 Oct 2025 19:33:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120381

On 10/8/25 21:25, Khem Raj wrote:
> On Wed, Oct 8, 2025 at 11:48 AM Gyorgy Sarvari <skandigraun@gmail.com> wrote:
>> On 10/8/25 17:53, Khem Raj wrote:
>>> seeing failures on qemux86
>>>
>>> https://errors.yoctoproject.org/Errors/Details/884900/
>>>
>>> qemuarm
>>>
>>> https://errors.yoctoproject.org/Errors/Details/884889/
>>>
>>> I think it is related to target being 32bit.
>> Right, the cmake's findPython returns python from
>> ${RECIPE_SYSROOT_NATIVE} instead of ${RECIPE_SYSROOT}... will look if I
>> can solve it more elegantly than just patching the include path to the
>> correct one.
>
> adding
>
> inherit python3targetconfig
>
> might be all you need here.

Indeed, you seem to be right - thank you.
v2 will land soon.

>>> On Tue, Oct 7, 2025 at 10:49 AM Gyorgy Sarvari via
>>> lists.openembedded.org <skandigraun=gmail.com@lists.openembedded.org>
>>> wrote:
>>>> This update contains a fix for CVE-2024-26529, CVE-2024-45970 and CVE-2024-45971
>>>>
>>>> Changelog: https://github.com/mz-automation/libiec61850/blob/v1.6/CHANGELOG
>>>>
>>>> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
>>>> ---
>>>>  ...MAKE_INSTALL_LIBDIR-from-GNUInstallD.patch | 24 +++++++-----
>>>>  ...-break-CMAKE_INSTALL_PATH-by-trying-.patch | 39 -------------------
>>>>  ...iec61850_1.5.3.bb => libiec61850_1.6.1.bb} | 10 ++---
>>>>  3 files changed, 20 insertions(+), 53 deletions(-)
>>>>  delete mode 100644 meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>>>>  rename meta-networking/recipes-connectivity/libiec61850/{libiec61850_1.5.3.bb => libiec61850_1.6.1.bb} (77%)
>>>>
>>>> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>>>> index e778e8158b..a33a6248a7 100644
>>>> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>>>> +++ b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch
>>>> @@ -7,7 +7,7 @@ Subject: [PATCH] pyiec61850: Use CMAKE_INSTALL_LIBDIR from GNUInstallDirs in
>>>>  This ensures that it gets installed in platform specified system libdir
>>>>  all platforms do not use /usr/lib as assumed here e.g. ppc64 uses lib64
>>>>
>>>> -Upstream-Status: Submitted [https://github.com/mz-automation/libiec61850/pull/376]
>>>> +Upstream-Status: Denied [https://github.com/mz-automation/libiec61850/pull/376 - closed without a word]
>>>>  Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>  ---
>>>>   pyiec61850/CMakeLists.txt | 6 ++++--
>>>> @@ -15,15 +15,21 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>
>>>>  --- a/pyiec61850/CMakeLists.txt
>>>>  +++ b/pyiec61850/CMakeLists.txt
>>>> -@@ -31,7 +31,9 @@ endif()
>>>> +@@ -31,14 +31,9 @@ swig_add_library(pyiec61850
>>>>
>>>> - swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
>>>> + swig_link_libraries(pyiec61850 ${LIBS})
>>>>
>>>> --install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>>>> --install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>>>> +-# Finding python modules install path
>>>> +-execute_process(
>>>> +-      COMMAND ${Python_EXECUTABLE} -c
>>>> +-      "from sysconfig import get_path; import sys; sys.stdout.write(get_path('platlib'))"
>>>> +-      OUTPUT_VARIABLE PYTHON_SITE_DIR
>>>> +-)
>>>>  +include(GNUInstallDirs)
>>>> -+
>>>> -+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>>>> -+install(TARGETS _iec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}//python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>>>>
>>>> - add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
>>>> +-install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${PYTHON_SITE_DIR})
>>>> +-install(TARGETS pyiec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
>>>> ++install(FILES ${CMAKE_CURRENT_BINARY_DIR}/pyiec61850.py DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
>>>> ++install(TARGETS pyiec61850 LIBRARY DESTINATION ${CMAKE_INSTALL_PREFIX}/${CMAKE_INSTALL_LIBDIR}/python${PYTHON_BASEVERSION}/site-packages)
>>>> +
>>>> + add_test(test_pyiec61850 ${Python_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
>>>> diff --git a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch b/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>>>> deleted file mode 100644
>>>> index 3f0490cb80..0000000000
>>>> --- a/meta-networking/recipes-connectivity/libiec61850/files/0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch
>>>> +++ /dev/null
>>>> @@ -1,39 +0,0 @@
>>>> -From d4ddfc7a350011b7944ed8d6bca80f164dfd1387 Mon Sep 17 00:00:00 2001
>>>> -From: Romain Naour <romain.naour@smile.fr>
>>>> -Date: Fri, 10 Jul 2020 17:08:34 +0200
>>>> -Subject: [PATCH] pyiec61850: don't break CMAKE_INSTALL_PATH by trying to find
>>>> - python modules install path (site-packages)
>>>> -
>>>> -https://stackoverflow.com/questions/1242904/finding-python-site-packages-directory-with-cmake
>>>> -
>>>> -Signed-off-by: Romain Naour <romain.naour@smile.fr>
>>>> ----
>>>> -Upstream-Status: Pending
>>>> -
>>>> - pyiec61850/CMakeLists.txt | 11 ++---------
>>>> - 1 file changed, 2 insertions(+), 9 deletions(-)
>>>> -
>>>> -diff --git a/pyiec61850/CMakeLists.txt b/pyiec61850/CMakeLists.txt
>>>> -index 159ef4b..d1732a1 100644
>>>> ---- a/pyiec61850/CMakeLists.txt
>>>> -+++ b/pyiec61850/CMakeLists.txt
>>>> -@@ -31,14 +31,7 @@ endif()
>>>> -
>>>> - swig_link_libraries(iec61850 ${PYTHON_LIBRARIES} ${LIBS})
>>>> -
>>>> --# Finding python modules install path
>>>> --execute_process(
>>>> --      COMMAND ${PYTHON_EXECUTABLE} -c
>>>> --      "from distutils.sysconfig import get_python_lib; import sys; sys.stdout.write(get_python_lib())"
>>>> --      OUTPUT_VARIABLE PYTHON_SITE_DIR
>>>> --)
>>>> --
>>>> --install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION ${PYTHON_SITE_DIR})
>>>> --install(TARGETS _iec61850 LIBRARY DESTINATION ${PYTHON_SITE_DIR})
>>>> -+install(FILES ${CMAKE_CURRENT_BINARY_DIR}/iec61850.py DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>>>> -+install(TARGETS _iec61850 LIBRARY DESTINATION /usr/lib/python${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}/site-packages)
>>>> -
>>>> - add_test(test_pyiec61850 ${PYTHON_EXECUTABLE} ${CMAKE_CURRENT_LIST_DIR}/test_pyiec61850.py)
>>>> ---
>>>> -2.31.1
>>>> -
>>>> diff --git a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
>>>> similarity index 77%
>>>> rename from meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
>>>> rename to meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
>>>> index cfded66e41..eb9ab9b4fe 100644
>>>> --- a/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.5.3.bb
>>>> +++ b/meta-networking/recipes-connectivity/libiec61850/libiec61850_1.6.1.bb
>>>> @@ -13,10 +13,9 @@ SECTION = "console/network"
>>>>  LICENSE = "GPL-3.0-only"
>>>>  LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
>>>>  DEPENDS = "swig-native python3"
>>>> -SRCREV = "6f557c490f0b46ab5d7ef1b01bb3bc9fab3f442f"
>>>> +SRCREV = "a13961110b8238d2d8ea577c1fb7592ba3017ad8"
>>>>
>>>> -SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.5;protocol=https \
>>>> -           file://0001-pyiec61850-don-t-break-CMAKE_INSTALL_PATH-by-trying-.patch \
>>>> +SRC_URI = "git://github.com/mz-automation/${BPN}.git;branch=v1.6;protocol=https;tag=v${PV} \
>>>>             file://0001-pyiec61850-Use-CMAKE_INSTALL_LIBDIR-from-GNUInstallD.patch \
>>>>  "
>>>>
>>>> @@ -26,12 +25,13 @@ inherit cmake pkgconfig python3-dir python3native siteinfo
>>>>  EXTRA_OECMAKE = " \
>>>>      -DBUILD_EXAMPLES=OFF \
>>>>      -DBUILD_PYTHON_BINDINGS=ON \
>>>> +    -DPYTHON_BASEVERSION=${PYTHON_BASEVERSION} \
>>>>  "
>>>>
>>>>  RDEPENDS:${PN}-python = " python3-core "
>>>>  RDEPENDS:${PN} = " python3-core "
>>>>
>>>>  FILES:${PN} += " \
>>>> -    ${PYTHON_SITEPACKAGES_DIR}/iec61850.py \
>>>> -    ${PYTHON_SITEPACKAGES_DIR}/_iec61850.so \
>>>> +    ${PYTHON_SITEPACKAGES_DIR}/pyiec61850.py \
>>>> +    ${PYTHON_SITEPACKAGES_DIR}/_pyiec61850.so \
>>>>  "
>>>>
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#120342): https://lists.openembedded.org/g/openembedded-devel/message/120342
>>>> Mute This Topic: https://lists.openembedded.org/mt/115640790/1997914
>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>


