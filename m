Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6257C197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 00:47:59 +0000 (UTC)
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
 by mx.groups.io with SMTP id smtpd.web10.2090.1700182071004418867
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Nov 2023 16:47:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=j+E0LvHP;
 spf=pass (domain: gmail.com, ip: 209.85.161.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-58a0154b4baso1240151eaf.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Nov 2023 16:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700182070; x=1700786870; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SLPM1/ZBUxm2tpZkQUucU464NIIGN2uhd844pMEHFdo=;
        b=j+E0LvHPFQKJMWeNWCdwHsG3qiO5s7QRLW/HnCV/218qSwtBNXOo3BVAc3B2AsOlJ7
         gEMtw1q5l3JNtgWL/LfmGNzcyGdx45MxOvzXF6urPfHX97KplVnFDIyGxcJslC/Vw7Rp
         dDPQpkAJZROPetvv2S5co4G03O+THBG4/FgwliUdtXtmVametdkuauwo1bJsdnD7+fLz
         yesQ4ajybbLCEt7fyySYHKLoPO2NjeePfEvIBrScAqf7PgYKlJPJMgCWR56XGNb0O74a
         EhtMT0q7gLmVH+4OZBev9s7RLMzABsk+A/xwopcBIkutCqnlnwuIH5ye7DqjJAVHhgZp
         9O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700182070; x=1700786870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SLPM1/ZBUxm2tpZkQUucU464NIIGN2uhd844pMEHFdo=;
        b=wgD/1+WUNxKsrazrgiDVqfw9CVKZIkIzGv+V3+PR3wxVN87Hnj6galx0M5fFm2xzPs
         yCt5d/qSmwJ4qiw+Ww8/n7wF9SeZsaHwFxMzm2+GbywQ8Bw8Sqmd3VI+XDQwqxXMkadl
         oC6bVSeS39WbY9emv5Tg/konxEWrEWGwB5d8KnXYHWSu/ghv1KIWVhhPKfJK7Yhb3uur
         FoYi37b4BKsSHilhs2lHTop8qQhm77xiOrTylEoECBLrMkDPuP9ImLk/XQm4M4qoz2DA
         2/+HxQsuyl84SVPwDEirTmoWnWm8vhP0fagv4Q0QR72N+GMZo6KjoqyJDcfdhiTa/LxD
         Sz7A==
X-Gm-Message-State: AOJu0YwarW3vQA3n/t/wcoYsYoQMojdOsGahglF7pu4iU1SGG0Pq2Owm
	xY2N/zbJbfpvUh79yGmqxEQiIDZhv3AaqfvD2cV9mYA4SJVNFQ==
X-Google-Smtp-Source: AGHT+IGR8IDg3kcFVROLgpOuCKfBTLeYvw4D+ONcTzmrwBkTk8KTgrtEfHXSO2SMFQJ3qLMddbp90tJcNNmEmRKaPu8=
X-Received: by 2002:a05:6871:62c9:b0:1e9:d5ac:dc9b with SMTP id
 rf9-20020a05687162c900b001e9d5acdc9bmr1472832oab.25.1700182069938; Thu, 16
 Nov 2023 16:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20231110115241.3613778-1-mingli.yu@windriver.com>
In-Reply-To: <20231110115241.3613778-1-mingli.yu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Nov 2023 16:47:24 -0800
Message-ID: <CAMKF1srHP044LcvC484_xzP2D7ouoKwoCNcPe88rPn8KsUZMbQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] nlohmann-json: Add ptest support
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 17 Nov 2023 00:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106844

its failing on AB with

stdio: ERROR: nlohmann-json-3.11.2-r0 do_package_qa: QA Issue:
/usr/lib/nlohmann-json/ptest/json_test_data/.git/hooks/update.sample
contained in package nlohmann-json-ptest requires /usr/bin/sh, but no
providers found in RDEPENDS:nlohmann-json-ptest? [file-rdeps]

see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3348/step=
s/14/logs/errors

On Fri, Nov 10, 2023 at 3:52=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windriver=
.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> * Backport 2 patches [1] [2] to fix the build failure under tests dir.
>
> * Fetch the test data during do_fetch phase to avoid internet access
> during test as some tests need test data.
>  # ./run-ptest
> PASS: test-algorithms_cpp11
> PASS: test-allocator_cpp11
> PASS: test-alt-string_cpp11
> PASS: test-assert_macro_cpp11
> PASS: test-binary_formats_cpp11
> [snip]
> PASS: test-unicode5_cpp11
> PASS: test-user_defined_input_cpp11
> PASS: test-windows_h_cpp11
> PASS: test-wstring_cpp11
>
> [1] https://github.com/nlohmann/json/commit/6cec5aefc97ad219b6fd5a4132f88=
f7c8f6800ee
> [2] https://github.com/nlohmann/json/commit/660d0b58565073975d6f5d94365d6=
cbf150a4cf8
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...tors-define-missing-rebind-type-3895.patch | 61 +++++++++++++++++++
>  ...tors2-use-std-ranges-equals-for-rang.patch | 31 ++++++++++
>  .../nlohmann-json/files/run-ptest             | 12 ++++
>  .../nlohmann-json/nlohmann-json_3.11.2.bb     | 22 ++++++-
>  4 files changed, 123 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001-cus=
tom-allocators-define-missing-rebind-type-3895.patch
>  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001-tes=
ts-unit-iterators2-use-std-ranges-equals-for-rang.patch
>  create mode 100755 meta-oe/recipes-devtools/nlohmann-json/files/run-ptes=
t
>
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-all=
ocators-define-missing-rebind-type-3895.patch b/meta-oe/recipes-devtools/nl=
ohmann-json/files/0001-custom-allocators-define-missing-rebind-type-3895.pa=
tch
> new file mode 100644
> index 000000000..d964586c1
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-allocators=
-define-missing-rebind-type-3895.patch
> @@ -0,0 +1,61 @@
> +From 6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee Mon Sep 17 00:00:00 2001
> +From: Sergei Trofimovich <slyich@gmail.com>
> +Date: Wed, 8 Mar 2023 11:31:56 +0000
> +Subject: [PATCH] custom allocators: define missing 'rebind' type (#3895)
> +
> +Upstream-Status: Backport [https://github.com/nlohmann/json/commit/6cec5=
aefc97ad219b6fd5a4132f88f7c8f6800ee]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + tests/src/unit-allocator.cpp   | 9 +++++++++
> + tests/src/unit-regression2.cpp | 9 +++++++++
> + 2 files changed, 18 insertions(+)
> +
> +diff --git a/tests/src/unit-allocator.cpp b/tests/src/unit-allocator.cpp
> +index 76e3b03f..f2e63552 100644
> +--- a/tests/src/unit-allocator.cpp
> ++++ b/tests/src/unit-allocator.cpp
> +@@ -20,11 +20,20 @@ struct bad_allocator : std::allocator<T>
> + {
> +     using std::allocator<T>::allocator;
> +
> ++    bad_allocator() =3D default;
> ++    template<class U> bad_allocator(const bad_allocator<U>& /*unused*/)=
 { }
> ++
> +     template<class... Args>
> +     void construct(T* /*unused*/, Args&& ... /*unused*/)
> +     {
> +         throw std::bad_alloc();
> +     }
> ++
> ++    template <class U>
> ++    struct rebind
> ++    {
> ++        using other =3D bad_allocator<U>;
> ++    };
> + };
> + } // namespace
> +
> +diff --git a/tests/src/unit-regression2.cpp b/tests/src/unit-regression2=
.cpp
> +index 2bb9b32e..dbafb436 100644
> +--- a/tests/src/unit-regression2.cpp
> ++++ b/tests/src/unit-regression2.cpp
> +@@ -189,6 +189,15 @@ class my_allocator : public std::allocator<T>
> + {
> +   public:
> +     using std::allocator<T>::allocator;
> ++
> ++    my_allocator() =3D default;
> ++    template<class U> my_allocator(const my_allocator<U>& /*unused*/) {=
 }
> ++
> ++    template <class U>
> ++    struct rebind
> ++    {
> ++        using other =3D my_allocator<U>;
> ++    };
> + };
> +
> + /////////////////////////////////////////////////////////////////////
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit=
-iterators2-use-std-ranges-equals-for-rang.patch b/meta-oe/recipes-devtools=
/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-for-r=
ang.patch
> new file mode 100644
> index 000000000..463912e4b
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-iterat=
ors2-use-std-ranges-equals-for-rang.patch
> @@ -0,0 +1,31 @@
> +From 660d0b58565073975d6f5d94365d6cbf150a4cf8 Mon Sep 17 00:00:00 2001
> +From: =3D?UTF-8?q?Arsen=3D20Arsenovi=3DC4=3D87?=3D <arsen@aarsen.me>
> +Date: Sun, 5 Mar 2023 14:11:22 +0100
> +Subject: [PATCH] tests/unit-iterators2: use std::ranges::equals for rang=
e
> + comparisons (#3950)
> +
> +Closes https://github.com/nlohmann/json/issues/3927
> +
> +Upstream-Status: Backport [https://github.com/nlohmann/json/commit/660d0=
b58565073975d6f5d94365d6cbf150a4cf8]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + tests/src/unit-iterators2.cpp | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/tests/src/unit-iterators2.cpp b/tests/src/unit-iterators2.c=
pp
> +index 27926084..72a5d9dc 100644
> +--- a/tests/src/unit-iterators2.cpp
> ++++ b/tests/src/unit-iterators2.cpp
> +@@ -943,7 +943,7 @@ TEST_CASE("iterators 2")
> +                 json j_expected{5, 4, 3, 2, 1};
> +
> +                 auto reversed =3D j | std::views::reverse;
> +-                CHECK(reversed =3D=3D j_expected);
> ++                CHECK(std::ranges::equal(reversed, j_expected));
> +             }
> +
> +             SECTION("transform")
> +--
> +2.25.1
> +
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest b/met=
a-oe/recipes-devtools/nlohmann-json/files/run-ptest
> new file mode 100755
> index 000000000..2f00267d5
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
> @@ -0,0 +1,12 @@
> +#!/bin/sh
> +
> +cd tests
> +for atest in test-* ; do
> +    rm -rf tests.log
> +    ./${atest} > tests.log 2>&1
> +    if [ $? =3D 0 ] ; then
> +        echo "PASS: ${atest}"
> +    else
> +        echo "FAIL: ${atest}"
> +    fi
> +done
> diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.=
bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> index 74e40942a..694d632cb 100644
> --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> @@ -7,22 +7,38 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3Df969127d=
7b7ed0a8a63c2bbeae002588"
>  CVE_PRODUCT =3D "json-for-modern-cpp"
>
>  SRC_URI =3D "git://github.com/nlohmann/json.git;branch=3Ddevelop;protoco=
l=3Dhttps \
> -           "
> +           git://github.com/nlohmann/json_test_data.git;destsuffix=3Dgit=
/json_test_data;name=3Djson-test-data;branch=3Dmaster;protocol=3Dhttps \
> +           file://0001-custom-allocators-define-missing-rebind-type-3895=
.patch \
> +           file://0001-tests-unit-iterators2-use-std-ranges-equals-for-r=
ang.patch \
> +           file://run-ptest \
> +"
>
>  SRCREV =3D "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
> +SRCREV_json-test-data =3D "a1375cea09d27cc1c4cadb8d00470375b421ac37"
> +
> +SRCREV_FORMAT =3D "json-test-data"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit cmake
> +inherit cmake ptest
>
> -EXTRA_OECMAKE +=3D "-DJSON_BuildTests=3DOFF"
> +EXTRA_OECMAKE +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '-DJSON_B=
uildTests=3DON -DJSON_TestDataDirectory=3D${PTEST_PATH}/json_test_data', '-=
DJSON_BuildTests=3DOFF', d)}"
>
>  # nlohmann-json is a header only C++ library, so the main package will b=
e empty.
>  ALLOW_EMPTY:${PN} =3D "1"
>  RDEPENDS:${PN}-dev =3D ""
> +RDEPENDS:${PN}-ptest =3D "perl"
>
>  BBCLASSEXTEND =3D "native nativesdk"
>
> +
> +do_install_ptest () {
> +    install -d ${D}${PTEST_PATH}/tests
> +    cp -r ${S}/json_test_data/ ${D}${PTEST_PATH}/
> +    cp -r ${B}/tests/test-* ${D}${PTEST_PATH}/tests
> +}
> +
> +
>  # other packages commonly reference the file directly as "json.hpp"
>  # create symlink to allow this usage
>  do_install:append() {
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#106543): https://lists.openembedded.org/g/openembedde=
d-devel/message/106543
> Mute This Topic: https://lists.openembedded.org/mt/102504904/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

