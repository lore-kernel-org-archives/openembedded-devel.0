Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4F6EC2BB3F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 04:18:26 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web10.43939.1700453905831336150
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 19 Nov 2023 20:18:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VAzr/Ih0;
 spf=pass (domain: gmail.com, ip: 209.85.167.180, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3b2e72fe47fso2850478b6e.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 19 Nov 2023 20:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700453905; x=1701058705; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnaHyJXoSq+VZNHFZ1NApazZ3njJ/GhNgRr6Ij81lEw=;
        b=VAzr/Ih0akOI5F8fhb9+BJg74Nrdg84hncVuVO2UOh7kibEUeLUEOAo5p8DZdZEhes
         5Z6K8BEKvVa9412GehYpvos5fQQqv5Y1XdF4RQbwO+3XDljO0kcmw6+MFSsBJYW5f/KW
         uPWutHGSfIzNPkqpigxTALSlrXwbyv9FPoJHKrZqMQj4cY1tTymJKFggmHj4H1rZk978
         PaBtWo3JMn5+3IXjxDYI6CuM/7vyx3aj8yLshsIOJYwX4uLoShGBSXdLLiWFzeJu2wzW
         rd39NRAGRc5H4YDj9kcknw+kbMA0Ugd2Y2USXViY4q9NgcSSnhFeZFsiKyJ19OfOpoLc
         bZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700453905; x=1701058705;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xnaHyJXoSq+VZNHFZ1NApazZ3njJ/GhNgRr6Ij81lEw=;
        b=RH87AQg3Mcr7njB/u53dhhf5y9umpHaLGiBJY5YJcwuKN9EOQTU4VpfJ9qf3kGwJYS
         yOIcU+xBMZ9l3cx0qZn/49yLK2uYZ2oadxDmgUFajFgX2uKFq2wGDIqjRrzeD3lSKAqQ
         35LMTV4AK9vtgvj/7vqX+ytLNPwvhdLGkCoF9Hj/ZOnsN3OwgfKz3a/N3B4SCTccSKpj
         dFZH9pCbo6KNVrsSwt29zRX8D+dq2Lj38rqyhkAauhMH+cpDGMVFiefCm4W6KAyItSOG
         /BBZyK0Z1+sl/rqKvF2MR6OdkSJp1H2yLLvVljrjAOtSDshUxMHWJ/TbbMulYugyq/RQ
         pgbw==
X-Gm-Message-State: AOJu0YyAJVq/YajdrWHz9BfWKgKwEigXKnvwtwNxfm8rl9RwRWH/agkL
	5Z58IN2w8IN55LQN2cndCLd7jAFwTtCbXq/iCK1f6VgMJUlvCA==
X-Google-Smtp-Source: AGHT+IHVxNlTfWUogkCqM304mceQz8SmJic1i9zitNSCFoDDAFMBXnzoSJgIfpkUltThBbQ1RTGWS3H/xKtpGOwBRRc=
X-Received: by 2002:a05:6871:7387:b0:1ea:c913:3494 with SMTP id
 na7-20020a056871738700b001eac9133494mr8335479oac.6.1700453904687; Sun, 19 Nov
 2023 20:18:24 -0800 (PST)
MIME-Version: 1.0
References: <20231109091526.484831-1-mingli.yu@windriver.com>
 <CAMKF1sq2xBvS1FOey8yY=w6FtUB=eUbc_dAo_4ekJjY+vkd4eA@mail.gmail.com>
 <CAMKF1sqKyAet9VeRkKZK3nizW=Hjc-KkL3TbQoDynjEhyaZOKQ@mail.gmail.com> <CO1PR11MB5009EA382F54505B425BD3FBF1AEA@CO1PR11MB5009.namprd11.prod.outlook.com>
In-Reply-To: <CO1PR11MB5009EA382F54505B425BD3FBF1AEA@CO1PR11MB5009.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Nov 2023 20:17:58 -0800
Message-ID: <CAMKF1sp8FbNH2b6OQb0jD9MwfXDP2QfqKO1x90xdkEWhG_9roQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] nlohmann-json: Add ptest support
To: "Yu, Mingli" <Mingli.Yu@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Nov 2023 04:18:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/106957

There is another issue I sent info on for mickledore

https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3355/step=
s/14/logs/stdio

On Fri, Nov 10, 2023 at 3:54=E2=80=AFAM Yu, Mingli <Mingli.Yu@windriver.com=
> wrote:
>
> v2 sent.
>
> Thanks,
> ________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: Friday, November 10, 2023 12:49
> To: Yu, Mingli <Mingli.Yu@windriver.com>
> Cc: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org>
> Subject: Re: [oe] [meta-oe][PATCH 1/2] nlohmann-json: Add ptest support
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> another CI log
> https://errors.yoctoproject.org/Errors/Details/742264/
>
> On Thu, Nov 9, 2023 at 8:47=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > fails in build QA
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/3323/=
steps/14/logs/stdio
> >
> > On Thu, Nov 9, 2023 at 1:15=E2=80=AFAM Yu, Mingli <mingli.yu@eng.windri=
ver.com> wrote:
> > >
> > > From: Mingli Yu <mingli.yu@windriver.com>
> > >
> > > * Backport 2 patches [1] [2] to fix the build failure under tests dir=
.
> > >
> > > * Fetch the test data during do_fetch phase to avoid internet access
> > > during test as some tests need test data.
> > >  # ./run-ptest
> > > PASS: test-algorithms_cpp11
> > > PASS: test-allocator_cpp11
> > > PASS: test-alt-string_cpp11
> > > PASS: test-assert_macro_cpp11
> > > PASS: test-binary_formats_cpp11
> > > [snip]
> > > PASS: test-unicode5_cpp11
> > > PASS: test-user_defined_input_cpp11
> > > PASS: test-windows_h_cpp11
> > > PASS: test-wstring_cpp11
> > >
> > > [1] https://github.com/nlohmann/json/commit/6cec5aefc97ad219b6fd5a413=
2f88f7c8f6800ee
> > > [2] https://github.com/nlohmann/json/commit/660d0b58565073975d6f5d943=
65d6cbf150a4cf8
> > >
> > > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > ---
> > >  ...tors-define-missing-rebind-type-3895.patch | 61 +++++++++++++++++=
++
> > >  ...tors2-use-std-ranges-equals-for-rang.patch | 31 ++++++++++
> > >  .../nlohmann-json/files/run-ptest             | 12 ++++
> > >  .../nlohmann-json/nlohmann-json_3.11.2.bb     | 21 ++++++-
> > >  4 files changed, 122 insertions(+), 3 deletions(-)
> > >  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001=
-custom-allocators-define-missing-rebind-type-3895.patch
> > >  create mode 100644 meta-oe/recipes-devtools/nlohmann-json/files/0001=
-tests-unit-iterators2-use-std-ranges-equals-for-rang.patch
> > >  create mode 100755 meta-oe/recipes-devtools/nlohmann-json/files/run-=
ptest
> > >
> > > diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom=
-allocators-define-missing-rebind-type-3895.patch b/meta-oe/recipes-devtool=
s/nlohmann-json/files/0001-custom-allocators-define-missing-rebind-type-389=
5.patch
> > > new file mode 100644
> > > index 000000000..d964586c1
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/nlohmann-json/files/0001-custom-alloca=
tors-define-missing-rebind-type-3895.patch
> > > @@ -0,0 +1,61 @@
> > > +From 6cec5aefc97ad219b6fd5a4132f88f7c8f6800ee Mon Sep 17 00:00:00 20=
01
> > > +From: Sergei Trofimovich <slyich@gmail.com>
> > > +Date: Wed, 8 Mar 2023 11:31:56 +0000
> > > +Subject: [PATCH] custom allocators: define missing 'rebind' type (#3=
895)
> > > +
> > > +Upstream-Status: Backport [https://github.com/nlohmann/json/commit/6=
cec5aefc97ad219b6fd5a4132f88f7c8f6800ee]
> > > +
> > > +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > +---
> > > + tests/src/unit-allocator.cpp   | 9 +++++++++
> > > + tests/src/unit-regression2.cpp | 9 +++++++++
> > > + 2 files changed, 18 insertions(+)
> > > +
> > > +diff --git a/tests/src/unit-allocator.cpp b/tests/src/unit-allocator=
.cpp
> > > +index 76e3b03f..f2e63552 100644
> > > +--- a/tests/src/unit-allocator.cpp
> > > ++++ b/tests/src/unit-allocator.cpp
> > > +@@ -20,11 +20,20 @@ struct bad_allocator : std::allocator<T>
> > > + {
> > > +     using std::allocator<T>::allocator;
> > > +
> > > ++    bad_allocator() =3D default;
> > > ++    template<class U> bad_allocator(const bad_allocator<U>& /*unuse=
d*/) { }
> > > ++
> > > +     template<class... Args>
> > > +     void construct(T* /*unused*/, Args&& ... /*unused*/)
> > > +     {
> > > +         throw std::bad_alloc();
> > > +     }
> > > ++
> > > ++    template <class U>
> > > ++    struct rebind
> > > ++    {
> > > ++        using other =3D bad_allocator<U>;
> > > ++    };
> > > + };
> > > + } // namespace
> > > +
> > > +diff --git a/tests/src/unit-regression2.cpp b/tests/src/unit-regress=
ion2.cpp
> > > +index 2bb9b32e..dbafb436 100644
> > > +--- a/tests/src/unit-regression2.cpp
> > > ++++ b/tests/src/unit-regression2.cpp
> > > +@@ -189,6 +189,15 @@ class my_allocator : public std::allocator<T>
> > > + {
> > > +   public:
> > > +     using std::allocator<T>::allocator;
> > > ++
> > > ++    my_allocator() =3D default;
> > > ++    template<class U> my_allocator(const my_allocator<U>& /*unused*=
/) { }
> > > ++
> > > ++    template <class U>
> > > ++    struct rebind
> > > ++    {
> > > ++        using other =3D my_allocator<U>;
> > > ++    };
> > > + };
> > > +
> > > + ///////////////////////////////////////////////////////////////////=
//
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-=
unit-iterators2-use-std-ranges-equals-for-rang.patch b/meta-oe/recipes-devt=
ools/nlohmann-json/files/0001-tests-unit-iterators2-use-std-ranges-equals-f=
or-rang.patch
> > > new file mode 100644
> > > index 000000000..463912e4b
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/nlohmann-json/files/0001-tests-unit-it=
erators2-use-std-ranges-equals-for-rang.patch
> > > @@ -0,0 +1,31 @@
> > > +From 660d0b58565073975d6f5d94365d6cbf150a4cf8 Mon Sep 17 00:00:00 20=
01
> > > +From: =3D?UTF-8?q?Arsen=3D20Arsenovi=3DC4=3D87?=3D <arsen@aarsen.me>
> > > +Date: Sun, 5 Mar 2023 14:11:22 +0100
> > > +Subject: [PATCH] tests/unit-iterators2: use std::ranges::equals for =
range
> > > + comparisons (#3950)
> > > +
> > > +Closes https://github.com/nlohmann/json/issues/3927
> > > +
> > > +Upstream-Status: Backport [https://github.com/nlohmann/json/commit/6=
60d0b58565073975d6f5d94365d6cbf150a4cf8]
> > > +
> > > +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > > +---
> > > + tests/src/unit-iterators2.cpp | 2 +-
> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > > +
> > > +diff --git a/tests/src/unit-iterators2.cpp b/tests/src/unit-iterator=
s2.cpp
> > > +index 27926084..72a5d9dc 100644
> > > +--- a/tests/src/unit-iterators2.cpp
> > > ++++ b/tests/src/unit-iterators2.cpp
> > > +@@ -943,7 +943,7 @@ TEST_CASE("iterators 2")
> > > +                 json j_expected{5, 4, 3, 2, 1};
> > > +
> > > +                 auto reversed =3D j | std::views::reverse;
> > > +-                CHECK(reversed =3D=3D j_expected);
> > > ++                CHECK(std::ranges::equal(reversed, j_expected));
> > > +             }
> > > +
> > > +             SECTION("transform")
> > > +--
> > > +2.25.1
> > > +
> > > diff --git a/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest b=
/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
> > > new file mode 100755
> > > index 000000000..2f00267d5
> > > --- /dev/null
> > > +++ b/meta-oe/recipes-devtools/nlohmann-json/files/run-ptest
> > > @@ -0,0 +1,12 @@
> > > +#!/bin/sh
> > > +
> > > +cd tests
> > > +for atest in test-* ; do
> > > +    rm -rf tests.log
> > > +    ./${atest} > tests.log 2>&1
> > > +    if [ $? =3D 0 ] ; then
> > > +        echo "PASS: ${atest}"
> > > +    else
> > > +        echo "FAIL: ${atest}"
> > > +    fi
> > > +done
> > > diff --git a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.1=
1.2.bb b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> > > index 74e40942a..d6a8fbe63 100644
> > > --- a/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> > > +++ b/meta-oe/recipes-devtools/nlohmann-json/nlohmann-json_3.11.2.bb
> > > @@ -7,15 +7,22 @@ LIC_FILES_CHKSUM =3D "file://LICENSE.MIT;md5=3Df969=
127d7b7ed0a8a63c2bbeae002588"
> > >  CVE_PRODUCT =3D "json-for-modern-cpp"
> > >
> > >  SRC_URI =3D "git://github.com/nlohmann/json.git;branch=3Ddevelop;pro=
tocol=3Dhttps \
> > > -           "
> > > +           git://github.com/nlohmann/json_test_data.git;destsuffix=
=3Dgit/json_test_data;name=3Djson-test-data;branch=3Dmaster;protocol=3Dhttp=
s \
> > > +           file://0001-custom-allocators-define-missing-rebind-type-=
3895.patch \
> > > +           file://0001-tests-unit-iterators2-use-std-ranges-equals-f=
or-rang.patch \
> > > +           file://run-ptest \
> > > +"
> > >
> > >  SRCREV =3D "bc889afb4c5bf1c0d8ee29ef35eaaf4c8bef8a5d"
> > > +SRCREV_json-test-data =3D "a1375cea09d27cc1c4cadb8d00470375b421ac37"
> > > +
> > > +SRCREV_FORMAT =3D "json-test-data"
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > -inherit cmake
> > > +inherit cmake ptest
> > >
> > > -EXTRA_OECMAKE +=3D "-DJSON_BuildTests=3DOFF"
> > > +EXTRA_OECMAKE +=3D "${@bb.utils.contains('PTEST_ENABLED', '1', '-DJS=
ON_BuildTests=3DON -DJSON_TestDataDirectory=3D${PTEST_PATH}/json_test_data'=
, '-DJSON_BuildTests=3DOFF', d)}"
> > >
> > >  # nlohmann-json is a header only C++ library, so the main package wi=
ll be empty.
> > >  ALLOW_EMPTY:${PN} =3D "1"
> > > @@ -23,6 +30,14 @@ RDEPENDS:${PN}-dev =3D ""
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > >
> > > +
> > > +do_install_ptest () {
> > > +    install -d ${D}${PTEST_PATH}/tests
> > > +    cp -r ${S}/json_test_data/ ${D}${PTEST_PATH}/
> > > +    cp -r ${B}/tests/test-* ${D}${PTEST_PATH}/tests
> > > +}
> > > +
> > > +
> > >  # other packages commonly reference the file directly as "json.hpp"
> > >  # create symlink to allow this usage
> > >  do_install:append() {
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#106511): https://lists.openembedded.org/g/openemb=
edded-devel/message/106511
> > > Mute This Topic: https://lists.openembedded.org/mt/102482301/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

