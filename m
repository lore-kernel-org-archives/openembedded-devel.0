Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6547E7C6F2
	for <webhook@archiver.kernel.org>; Sat, 31 Jan 2026 22:05:00 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18626.1769897099239045260
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 31 Jan 2026 14:04:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=COFC5gXz;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47ff94b46afso29109875e9.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 14:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769897097; x=1770501897; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6me6hLAmAIjiS0NfFrXJYQQmaA+ZVo5TS/Gq83Q48FM=;
        b=COFC5gXznFl2YyUMhDOZ0W9kSrhctG/Rdx8/F0RClKZ3M+6g9PSaiQdvqI0Ajg8EzQ
         MISKwUk9N/4lHdywTSaStzVyv73rZXxQRrbE2+9QF6EDxfKGUwfYDyI+tpovlWhaENOg
         Z5LVvYKAQbfpgVZTCp+la83ggUHlWlJOHeI2nlCthanKB2pfCAG7eBQep6AQiJQ4tn5w
         wopMDRpUklXC9tBI91HDe3+Kv2iwZ56KCm3SyNr9jeavJbZtmBJwrc/evnLYPc6K3DsV
         P1QsGhkxawSuSCxz2JVq3Z4bsxNX8ao8UskASD57e142Eug41n4ATPXZURI/5Va/tpH2
         Tygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769897097; x=1770501897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6me6hLAmAIjiS0NfFrXJYQQmaA+ZVo5TS/Gq83Q48FM=;
        b=NH+gfP+W+ogHyszAFyn9ki885qeoHPttf0rm7YsTjhtUGFeBlGcz2naA5G8WxOerKq
         c16yQxwcp4vBUVoAbpqt3rRODGT1jLDOZQLkcpOg/kuGqvtGwD6ckDam9ijrsoA7h4Ne
         w0qLanSuCdEjJItNsoStU2PylhlX7STauNvFFmrV5rixeAkL6JRhQZoak4kNlDOHgYMO
         9liiOJ2OgNtiEjGD8g44WTfOwcVIkWOu20iKI5gGHgZpZnUrxZNu/BUkWoc9E0ijUXVW
         CtnNH00A7NMp5M2ltYOUNLnmwnq/1Aio4/5AVTlTMR48zBXWzMbV0wQZh1GjZ75SyYBh
         ftLQ==
X-Gm-Message-State: AOJu0YwLJrM7ijP8WhYXxTLSVtuWiKKpjFCpvmWO1ferZu8b+raqJlA+
	J+OObGRIqEPK9W4M55wyPPf9BTDcSraU23REUwYglDlggZMobLYER8UyG+/xfw==
X-Gm-Gg: AZuq6aIdv1kA4/vEVc02GGScWR2mHSt8NtEHmSX398lyiY/5vRggRNuTl/VoeOeHxaJ
	Kebg8vP0lckaLKuSX5pBqeaM6CHaGGBKL7w7mUcYBRsk7xPuToOCEM8qdmrTETVnzotmvwOL364
	7tx1Mr1zKQl5KTXWsItYvbok10c1i7IWydgUSgFEqUV1qSUoKeaigG0XkzfDyQDz+SlOUyWpERl
	DYbVAv9hCesAhtx9zJI+5XichzrWRg+Epde90ENQmrlgQybiEzybaeGiZbRWPUgC9QMskjasSOl
	dT8VrpRUVE688LGr+zKoGGYKCg+qGuCWLTmf/nTecoKDgBj+KXVqsBEbC1/4gH/1UcNdNc+UxCy
	pbeL3VY//kiHtHeH8Zk7Gg1C5XG1oZQB78JXXVkrNoDJJj5uxb/H7aEG/iX5GR5w9OYLwqdBYQ/
	QWqNDcqN2NXrlgMNKyMDs=
X-Received: by 2002:a05:600c:680a:b0:47e:e051:79ee with SMTP id 5b1f17b1804b1-480828745d7mr144039395e9.3.1769897097360;
        Sat, 31 Jan 2026 14:04:57 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cddffe9sm412441735e9.4.2026.01.31.14.04.56
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 14:04:56 -0800 (PST)
Message-ID: <8b1ab6f4-fa01-455f-be10-4e9ee6c21e81@gmail.com>
Date: Sat, 31 Jan 2026 23:04:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][kirkstone][PATCH 1/5] exiv2: add ptest support
To: openembedded-devel@lists.openembedded.org
References: <188ADA3D0F3E598C.2595076@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <188ADA3D0F3E598C.2595076@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 31 Jan 2026 22:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124024

Quick note: While running YP compatibility check, it turned out that
this patch tries to pull in python3-lxml recipe from meta-python,
breaking YP compatibility - this change is now dropped because of that.
It will rather live as a bbappend in my meta-oe-test layer.


On 1/15/26 09:29, Gyorgy Sarvari via lists.openembedded.org wrote:
> The project has extensive runtime- and unittest suite - make use of it.
>
> It takes around 10 seconds to run both suites.
>
> Added two patches:
> One is needed to convert python unittest output into automake output.
>
> The other is required to be able to configure test data folder at
> compile time - otherwise the tests are looking for the test-data
> with absolute paths from the build machine.
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> (cherry picked from commit 35bc4860f18cd56a80ee29d492540acfcb620b59)
>
> Adapted to Kirkstone. (It also required an extra patch to be able to
> compile with the current googletest library)
>
> Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> ---
>  ...1-Allow-test-data-path-configuration.patch | 30 ++++++++++++++++
>  .../0001-Fix-build-with-gtest-1.11.patch      | 35 +++++++++++++++++++
>  meta-oe/recipes-support/exiv2/exiv2/run-ptest |  6 ++++
>  meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb | 33 +++++++++++++++--
>  4 files changed, 102 insertions(+), 2 deletions(-)
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/0001-Fix-build-with-gtest-1.11.patch
>  create mode 100644 meta-oe/recipes-support/exiv2/exiv2/run-ptest
>
> diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch
> new file mode 100644
> index 0000000000..9d6072a799
> --- /dev/null
> +++ b/meta-oe/recipes-support/exiv2/exiv2/0001-Allow-test-data-path-configuration.patch
> @@ -0,0 +1,30 @@
> +From 2483e51df6e02ad0ad5ae636767279fa230da44f Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Sun, 23 Nov 2025 11:52:24 +0100
> +Subject: [PATCH] Allow test data path configuration
> +
> +The unittests expect to the executed in the source folder before/after build,
> +and they expect the test data to be in the source folder. However for ptests
> +these folders are not available.
> +
> +This patch allows the test data folders to be configuration during build time.
> +
> +Upstream-Status: Inappropriate [ptest-specific]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + unitTests/CMakeLists.txt | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/unitTests/CMakeLists.txt b/unitTests/CMakeLists.txt
> +index 51040c0e2..e2604d4a7 100644
> +--- a/unitTests/CMakeLists.txt
> ++++ b/unitTests/CMakeLists.txt
> +@@ -40,7 +40,7 @@ add_executable(unit_tests
> + target_compile_definitions(unit_tests
> +   PRIVATE
> +     exiv2lib_STATIC
> +-    TESTDATA_PATH="${PROJECT_SOURCE_DIR}/test/data"
> ++    TESTDATA_PATH="${TEST_FOLDER}/test/data"
> + )
> + 
> + if (exiv2lib_COMPILE_DEFINITIONS)
> diff --git a/meta-oe/recipes-support/exiv2/exiv2/0001-Fix-build-with-gtest-1.11.patch b/meta-oe/recipes-support/exiv2/exiv2/0001-Fix-build-with-gtest-1.11.patch
> new file mode 100644
> index 0000000000..fd4c88f062
> --- /dev/null
> +++ b/meta-oe/recipes-support/exiv2/exiv2/0001-Fix-build-with-gtest-1.11.patch
> @@ -0,0 +1,35 @@
> +From 14d482f9e2353e195149fff196e65cb3a6b46e25 Mon Sep 17 00:00:00 2001
> +From: Gyorgy Sarvari <skandigraun@gmail.com>
> +Date: Fri, 18 Jun 2021 18:53:46 +0200
> +Subject: [PATCH] Fix build with gtest 1.11
> +
> +From: Antonio Rojas <arojas@archlinux.org>
> +
> +INSTANTIATE_TYPED_TEST_CASE_P requires a non-empty prefix now
> +
> +Upstream-Status: Backport [https://github.com/Exiv2/exiv2/commit/c069e36605f05e8e58bf964e5ecbde04efb90a20]
> +Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
> +---
> + unitTests/test_slice.cpp | 6 +++---
> + 1 file changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/unitTests/test_slice.cpp b/unitTests/test_slice.cpp
> +index bbc6785..ab51cda 100644
> +--- a/unitTests/test_slice.cpp
> ++++ b/unitTests/test_slice.cpp
> +@@ -422,12 +422,12 @@ REGISTER_TYPED_TEST_CASE_P(slice, atAccess, iteratorAccess, constructionFailsFro
> +                            constMethodsPreserveConst);
> + 
> + typedef ::testing::Types<const std::vector<int>, std::vector<int>, int*, const int*> test_types_t;
> +-INSTANTIATE_TYPED_TEST_CASE_P(, slice, test_types_t);
> ++INSTANTIATE_TYPED_TEST_CASE_P(slice, slice, test_types_t);
> + 
> + REGISTER_TYPED_TEST_CASE_P(mutableSlice, iterators, at);
> + typedef ::testing::Types<std::vector<int>, int*> mut_test_types_t;
> +-INSTANTIATE_TYPED_TEST_CASE_P(, mutableSlice, mut_test_types_t);
> ++INSTANTIATE_TYPED_TEST_CASE_P(slice, mutableSlice, mut_test_types_t);
> + 
> + REGISTER_TYPED_TEST_CASE_P(dataBufSlice, successfulConstruction, failedConstruction);
> + typedef ::testing::Types<DataBuf&, const DataBuf&> data_buf_types_t;
> +-INSTANTIATE_TYPED_TEST_CASE_P(, dataBufSlice, data_buf_types_t);
> ++INSTANTIATE_TYPED_TEST_CASE_P(slice, dataBufSlice, data_buf_types_t);
> diff --git a/meta-oe/recipes-support/exiv2/exiv2/run-ptest b/meta-oe/recipes-support/exiv2/exiv2/run-ptest
> new file mode 100644
> index 0000000000..d7ed07d7c9
> --- /dev/null
> +++ b/meta-oe/recipes-support/exiv2/exiv2/run-ptest
> @@ -0,0 +1,6 @@
> +#!/bin/sh
> +cd tests
> +python3 ./runner.py -v 2>&1 | sed -e '/\.\.\. ok/ s/^/PASS: /g' -e '/\.\.\. [ERROR|FAIL]/ s/^/FAIL: /g' -e '/\.\.\. skipped/ s/^/SKIP: /g' -e 's/ \.\.\. ok//g' -e 's/ \.\.\. ERROR//g' -e 's/ \.\.\. FAIL//g' -e 's/ \.\.\. skipped//g'
> +
> +cd ..
> +./build/bin/unit_tests --gtest_print_time=0 | sed -E  '/^\[ RUN/d ; s/\[       OK \]/PASS: / ; s/\[ DISABLED \]/SKIP: / ; s/\[ FAILED \]/FAIL: /'
> diff --git a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
> index 1c1c05dfaa..0b70c3b235 100644
> --- a/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
> +++ b/meta-oe/recipes-support/exiv2/exiv2_0.27.3.bb
> @@ -2,10 +2,13 @@ SUMMARY = "Exif, Iptc and XMP metadata manipulation library and tools"
>  LICENSE = "GPL-2.0-only"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=625f055f41728f84a8d7938acc35bdc2"
>  
> -DEPENDS = "zlib expat"
> +DEPENDS = "zlib expat ${@bb.utils.contains('PTEST_ENABLED', '1', 'googletest', '', d)}"
>  
>  SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source.tar.gz \
> +           file://run-ptest \
> +           file://0001-Allow-test-data-path-configuration.patch \
>             file://0001-Use-compiler-fcf-protection-only-if-compiler-arch-su.patch \
> +           file://0001-Fix-build-with-gtest-1.11.patch \
>             file://CVE-2021-29457.patch \
>             file://CVE-2021-29458.patch \
>             file://CVE-2021-29463.patch \
> @@ -26,8 +29,34 @@ SRC_URI = "https://github.com/Exiv2/${BPN}/releases/download/v${PV}/${BP}-Source
>  SRC_URI[sha256sum] = "a79f5613812aa21755d578a297874fb59a85101e793edc64ec2c6bd994e3e778"
>  
>  # Once patch is obsolete (project should be aware due to PRs), dos2unix can be removed either
> -inherit dos2unix
> +inherit dos2unix ptest
>  
>  S = "${WORKDIR}/${BPN}-${PV}-Source"
>  
>  inherit cmake gettext
> +
> +RDEPENDS:${PN}-ptest += " \
> +    python3-html \
> +    python3-lxml \
> +    python3-multiprocessing \
> +    python3-shell \
> +    python3-unittest"
> +
> +EXTRA_OECMAKE = "\
> +    ${@bb.utils.contains('PTEST_ENABLED', \
> +    '1', \
> +    '-DEXIV2_BUILD_SAMPLES=ON -DEXIV2_ENABLE_WEBREADY=ON -DEXIV2_BUILD_UNIT_TESTS=ON -DTEST_FOLDER=${PTEST_PATH}', \
> +    '', \
> +    d)} \
> +"
> +
> +do_install_ptest(){
> +    cp -r ${S}/tests ${D}${PTEST_PATH}/
> +    cp -r ${S}/test ${D}${PTEST_PATH}/
> +
> +    install -d ${D}${PTEST_PATH}/build/bin
> +    install ${B}/bin/* ${D}${PTEST_PATH}/build/bin
> +
> +    install -d ${D}${PTEST_PATH}/src
> +    install ${S}/src/canonmn_int.cpp ${D}${PTEST_PATH}/src
> +}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#123493): https://lists.openembedded.org/g/openembedded-devel/message/123493
> Mute This Topic: https://lists.openembedded.org/mt/117276144/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


