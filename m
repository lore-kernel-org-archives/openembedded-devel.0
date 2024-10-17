Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68E7D3C52B
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 17:55:22 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
 by mx.groups.io with SMTP id smtpd.web10.4394.1729187713658163578
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 10:55:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=crdAiRYW;
 spf=pass (domain: gmail.com, ip: 209.85.167.171, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-3e5fa17a79dso699248b6e.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 10:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729187713; x=1729792513; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOhoRtTrpUZJI9bomlbigeQlayFZW5DToVjVfHQ9+JM=;
        b=crdAiRYWouFc4aTugczMQ0A+XV8mmYf0NEc1xDnLUtEbPO0yePTnMmGxBFp3+GRKQv
         mgI8s951nLgn9Iwo4XD17TNuaicOhUN2wmySeD3oCbwSnstlFR24gwSPNX3sD2W+7vCt
         jb6805rTEvrUXfq1fJbFkAgF50+8wl6glU/gLFwd+5jw9CiCWzjp7uB2HNiZOeJNClCf
         lDeiSYhmbfVwtV6BMnN073ZDo9mlUV5rEd3NvcanzUPFlevId739OsfjMjHxypKHFAXo
         uWX4nULM5RmTg84rC/CmIJABhiYe7jOO8H3PIT7aZwf6YW41atsI8w8XCza9D0SvI5+A
         /4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729187713; x=1729792513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yOhoRtTrpUZJI9bomlbigeQlayFZW5DToVjVfHQ9+JM=;
        b=dzvmyfbV1R/jIksi8SG2sTvSEvK7McQJt/XwhN/rpyoVR5PChbTdTrvVJjtxK/mRmK
         +7i36TV9AnU4iWojumug47UbUpndN8P5yAmUS2VFPerVuVMeYYCfcHIHqsMfm3v1YEcj
         6G86yGmFVXki+eAY00OzZBlDZFQIxSuY+4QryOJioWJzLbksjpyQu7tZWDF8s7TdBlXS
         XGXD6vzHHTosGg073tCZ1lcrC9L6KZpgb7x/UxHdDJM6oDB5NrUvy6rQuZTYx2BuKVED
         FDBpUolz6Z0fiII21L4R1nTesBNo9+T3XxUKNfbN4wCfFF21WP0v4sd+pZIFVJv0arTc
         mUTA==
X-Forwarded-Encrypted: i=1; AJvYcCXne97HNFWgAQmNDwqCZMNbBlBiMSc75vCzG34woiTWQNSNJ/jeDKDy1y263oCE96lAe4kjh1MBjhC2r3w6F0jeewU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyPJjcgkAOYFxCbHEmIjGXenvdrbnhh8ys360+0uF4ePlbRvhGg
	9+md0jXTL0zNhgvDtGaGqmISP0h+RbCwbFRzuaPYweEv/0HQk6TzK59C5OWPMSwC0SRSFsgXlsW
	JFmnn+ToQI4PSwdI9x+5RoHOLDm0=
X-Google-Smtp-Source: AGHT+IEe7R0DxV2gGMlWCK1yqw0jJx8lKFPTiGlsTrK/E2tRVwM4hWOp3+5I64fXVNBxOVJ3pz08HjiGERFbyyr/eDw=
X-Received: by 2002:a05:6808:3091:b0:3e4:d3f6:6c97 with SMTP id
 5614622812f47-3e5c912933emr18716267b6e.46.1729187712706; Thu, 17 Oct 2024
 10:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20241012100147.618578-1-mingli.yu@windriver.com>
 <20241012100147.618578-2-mingli.yu@windriver.com> <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
 <5fa70fce-33a6-477d-a988-0e4063e5d0e1@windriver.com> <CAMKF1soKVFA=z9HG6AkKO9wudOTjUCXFgry46EtRkwFdsQkufA@mail.gmail.com>
 <17FE3E9DA0225DA0.4702@lists.openembedded.org> <824f78eb-9de1-459b-b934-73adf806f7ef@windriver.com>
 <CAMKF1srL9Vx=GTm8Man9MXKKgHmv+orud-MsCAG10fWZU93y9w@mail.gmail.com> <e35926d2-08b5-4b3f-bf57-6af09d7652e8@windriver.com>
In-Reply-To: <e35926d2-08b5-4b3f-bf57-6af09d7652e8@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2024 10:54:45 -0700
Message-ID: <CAMKF1spChaTAfX0bny03hReJe5SGYpQsHHyb8qOx0LoSc3=oiQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 17:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112968

On Thu, Oct 17, 2024 at 2:03=E2=80=AFAM Yu, Mingli <mingli.yu@windriver.com=
> wrote:
>
>
>
> On 10/17/24 15:40, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
> >
> > On Thu, Oct 17, 2024 at 12:35=E2=80=AFAM Yu, Mingli <mingli.yu@windrive=
r.com> wrote:
> >>
> >>
> >>
> >> On 10/14/24 14:42, Yu, Mingli wrote:
> >>>
> >>>
> >>> On 10/14/24 10:36, Khem Raj wrote:
> >>>> CAUTION: This email comes from a non Wind River email account!
> >>>> Do not click links or open attachments unless you recognize the send=
er
> >>>> and know the content is safe.
> >>>>
> >>>> On Sun, Oct 13, 2024 at 7:31=E2=80=AFPM Yu, Mingli <mingli.yu@windri=
ver.com>
> >>>> wrote:
> >>>>>
> >>>>> Hi Khem,
> >>>>>
> >>>>> On 10/14/24 00:18, Khem Raj wrote:
> >>>>>> CAUTION: This email comes from a non Wind River email account!
> >>>>>> Do not click links or open attachments unless you recognize the
> >>>>>> sender and know the content is safe.
> >>>>>>
> >>>>>> ptests seems to be failing for qemux86-64 -
> >>>>>> https://snips.sh/f/PWrmTR3-bm
> >>>>>
> >>>>> I didn't reproduce the issue locally as below:
> >>>>>
> >>>>> root@qemux86-64:/usr/lib64/tomlplusplus/ptest# ./run-ptest
> >>>>> PASS: tomlplusplus_odr_test
> >>>>> PASS: tomlplusplus_tests
> >>>>
> >>>> Did you build and run with meta-oe-image-ptest-tomlplusplus ?
> >>>> secondly, I ran with image built with clang compiler
> >>>
> >>> Yes, I have tested with "$ bitbake meta-oe-image-ptest-tomlplusplus
> >>> -ctestimage" and it succeeded as below:
> >>> $ bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
> >>> [snip]
> >>> Output from runqemu:
> >>> runqemu - INFO - Received signal: 15
> >>> runqemu - INFO - Cleaning up
> >>> runqemu - INFO - Host uptime: 10209822.71
> >>>
> >>> tput: No value for $TERM and no -T specified
> >>>
> >>> RESULTS:
> >>> RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
> >>> RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.02s)
> >>> RESULTS - ping.PingTest.test_ping: PASSED (0.01s)
> >>> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (=
0.36s)
> >>> RESULTS - ssh.SSHTest.test_ssh: PASSED (0.50s)
> >>> RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPP=
ED
> >>> (0.00s)
> >>> SUMMARY:
> >>> meta-oe-image-ptest-tomlplusplus () - Ran 6 tests in 2.892s
> >>> meta-oe-image-ptest-tomlplusplus - OK - All required tests passed
> >>> (successes=3D4, skipped=3D1, failures=3D0, errors=3D0)
> >>> NOTE: Tasks Summary: Attempted 1430 tasks of which 1429 didn't need t=
o
> >>> be rerun and all succeeded.
> >>>
> >>>
> >>> $ tail -2 conf/local.conf
> >>> TOOLCHAIN =3D "clang"
> >>> IMAGE_CLASSES +=3D "testimage"
> >>>
> >>> Could you help to provide your local.conf to help to reproduce the is=
sue?
> >>
> >> Or could you help to provide the reproduce steps based on poky?
> >
> > You might need couple of more entries
> > TC_CXX_RUNTIME ?=3D "llvm"
> > RUNTIME ?=3D "llvm"
> >
> > and add ld-is-lld to DISTRO_FEATURES and see if that helps to reproduce=
 it
>
> Still can't reproduce locally.
> Paste my steps below to help to check if I miss something.
> 1, mkdir -p /build/builds
> 2, cd /build && git clone git://git.yoctoproject.org/poky
> 3, git clone git://git.openembedded.org/meta-openembedded
> 3, git clone https://github.com/kraj/meta-clang.git
> 4, cd /build/poky
> 5, . oe-init-build-env ../builds/my-build
> 6, Add below layers into conf/bblayers.conf
> /build/meta-openembedded/meta-python
> /build/meta-openembedded/meta-oe
> /build/meta-clang
> 7, add below config into conf/local.conf
> TOOLCHAIN =3D "clang"
> TCLIBC =3D "musl"
> IMAGE_CLASSES +=3D "testimage"
> TC_CXX_RUNTIME ?=3D "llvm"
> RUNTIME ?=3D "llvm"
> DISTRO_FEATURES:append =3D " ld-is-lld"
>
> $ tail -7  conf/local.conf
> CONF_VERSION =3D "2"
> TOOLCHAIN =3D "clang"
> TCLIBC =3D "musl"
> IMAGE_CLASSES +=3D "testimage"
> TC_CXX_RUNTIME ?=3D "llvm"
> RUNTIME ?=3D "llvm"
> DISTRO_FEATURES:append =3D " ld-is-lld"
>
> 8, bitbake meta-oe-image-ptest-tomlplusplus && bitbake
> meta-oe-image-ptest-tomlplusplus -ctestimage

the issue happens when using libc++ instead of libstdc++
you can see the problem with yoe distro which uses llvm libc++ by
default with clang.
I added

LIBCPLUSPLUS:toolchain-clang =3D "-stdlib=3Dlibstdc++"

and then the tests started to pass. I will add this to meta-clang
nonclangable.conf file.

>
> Thanks,
>
> >
> >>
> >> Thanks,
> >>
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>>>
> >>>>> Anyway, I will look into this then.
> >>>>>
> >>>>> Thanks,
> >>>>>
> >>>>>>
> >>>>>> bitbake meta-oe-image-ptest-tomlplusplus
> >>>>>> bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
> >>>>>>
> >>>>>> On Sat, Oct 12, 2024 at 3:01=E2=80=AFAM Yu, Mingli via lists.opene=
mbedded.org
> >>>>>> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
> >>>>>>>
> >>>>>>> From: Mingli Yu <mingli.yu@windriver.com>
> >>>>>>>
> >>>>>>>     # ./run-ptest
> >>>>>>> PASS: tomlplusplus_odr_test
> >>>>>>> PASS: tomlplusplus_tests
> >>>>>>>
> >>>>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>>>>>> ---
> >>>>>>>     .../recipes-devtools/tomlplusplus/files/run-ptest | 12 ++++++=
++++++
> >>>>>>>     .../tomlplusplus/tomlplusplus_git.bb              | 15
> >>>>>>> +++++++++++++--
> >>>>>>>     2 files changed, 25 insertions(+), 2 deletions(-)
> >>>>>>>     create mode 100755
> >>>>>>> meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >>>>>>>
> >>>>>>> diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptes=
t
> >>>>>>> b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >>>>>>> new file mode 100755
> >>>>>>> index 000000000..4f682c5eb
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >>>>>>> @@ -0,0 +1,12 @@
> >>>>>>> +#!/bin/sh
> >>>>>>> +
> >>>>>>> +cd tests
> >>>>>>> +for atest in tomlplusplus_* ; do
> >>>>>>> +    rm -rf tests.log
> >>>>>>> +    ./${atest} > tests.log 2>&1
> >>>>>>> +    if [ $? =3D 0 ] ; then
> >>>>>>> +        echo "PASS: ${atest}"
> >>>>>>> +    else
> >>>>>>> +        echo "FAIL: ${atest}"
> >>>>>>> +    fi
> >>>>>>> +done
> >>>>>>> diff --git
> >>>>>>> a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >>>>>>> b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >>>>>>> index 0e8202bdc..245c309a2 100644
> >>>>>>> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >>>>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >>>>>>> @@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/marzer/tomlplusp=
lus"
> >>>>>>>     LICENSE =3D "MIT"
> >>>>>>>     LIC_FILES_CHKSUM =3D
> >>>>>>> "file://LICENSE;md5=3D90960f22c10049c117d56ed2ee5ee167"
> >>>>>>>
> >>>>>>> -SRC_URI =3D
> >>>>>>> "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;branch=
=3Dmaster"
> >>>>>>> +SRC_URI =3D
> >>>>>>> "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;branch=
=3Dmaster \
> >>>>>>> +           file://run-ptest \
> >>>>>>> +"
> >>>>>>>
> >>>>>>>     PV =3D "3.4.0"
> >>>>>>>     SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
> >>>>>>> @@ -11,4 +13,13 @@ S =3D "${WORKDIR}/git"
> >>>>>>>
> >>>>>>>     DEPENDS =3D "cmake-native"
> >>>>>>>
> >>>>>>> -inherit meson
> >>>>>>> +inherit meson ptest
> >>>>>>> +
> >>>>>>> +EXTRA_OEMESON +=3D
> >>>>>>> "-Dbuild_tests=3D${@bb.utils.contains("DISTRO_FEATURES", "ptest",
> >>>>>>> "true", "false", d)} \
> >>>>>>> +"
> >>>>>>> +
> >>>>>>> +do_install_ptest () {
> >>>>>>> +    install -d ${D}${PTEST_PATH}/tests
> >>>>>>> +    cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
> >>>>>>> +    cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
> >>>>>>> +}
> >>>>>>> --
> >>>>>>> 2.34.1
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>>>>>
> >>>
> >>>
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#112847): https://lists.openembedded.org/g/openemb=
edded-devel/message/112847
> >>> Mute This Topic: https://lists.openembedded.org/mt/108964413/3618448
> >>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [mingli.yu@eng.windriver.com]
> >>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>

