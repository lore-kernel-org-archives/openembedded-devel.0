Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 678EDD2F7FC
	for <webhook@archiver.kernel.org>; Thu, 17 Oct 2024 07:40:43 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.43953.1729150838025156373
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 17 Oct 2024 00:40:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VhRG1KiC;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3e3e2687200so256081b6e.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 00:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729150837; x=1729755637; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Flyqz/o/YauHMLTAmKowGJhGEhnnToIFyU/8KI5fkS4=;
        b=VhRG1KiCruJgmwa4Q7tdxEUzGtRjL8Cky5pyiCDyQW2IQlIz/w1Cuvmj/8SSu2xp0c
         +U6PxTeKFBstiyX2LTTOOy5YaSzO9vu9e6gnHg1l+BFLpTJ8G94f1zvC/oz5xtWO+H5l
         SRqW9dEKwA+i/Z4ZbYifnkP1UtHXYr42CnHryN8H/flnuIrvXv27SxsSoMGaMvatfCFu
         Uf8kYsMn4b6rxKbnupQ9ebD/KWSiqGehgtt4/Gw6r+x6JeVYeDf0Q2meiZM5toNcC1Rj
         IpvdZLaNkxPYLOhsPEm+D7eQl+NMJpLIIQQ+dBitq+mmWKDfAVvJuGlNwvBHiesZtmoF
         9hXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729150837; x=1729755637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Flyqz/o/YauHMLTAmKowGJhGEhnnToIFyU/8KI5fkS4=;
        b=qe2ghXgWHiPD6IW2TDKKpx6wMqUFTzTfyfDTLs7euhNHg2b82teLQ+kp4kvBkTAdeU
         hhA1HB6O8+PDUwGHMtDg50xZmKuBsyPB1BgJJfkQe3LQRsMnQ/f3XhIr8MgQwLruytES
         L/iL/0ZNWWNuI99V7QQ0iTRvRw0x9uexBeHlifi/QK2JZg6Yn3rAC8ooWsIyr6dijzk9
         iwNpOr4uIzfbTJIOEwULa+Ans86gTVCQremV+1pjN+iiI0exkAo1mH22frGOscQxPwF5
         7/sjlD4vTK0J97Dxj0Oo3nUcfh6Ar0KtmK4bK+dxFV5PKUK09HbrvQ3pMOMWWKeqpawq
         hI0g==
X-Forwarded-Encrypted: i=1; AJvYcCWnRiZ2DrBch2GX7fmnjV/uHau2bAWagREVGJMaj7rdAuC/fMu+hevEJi7j9M273eL20BsVx0HH5MX5NHqu5edRQ0o=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDE1rKqxJdkq5EQfzq3BC97Cn5Kq/P6eFelMDpA02Cccb0Uf87
	NcaR0dCVAG5qUVwOGBdg01w2AJkZXPgOYzFyJxcO+SNLHULrbBQqzBsBaqFeIkNd/Z66qK5mOzX
	0OBfDnMfJDP1sMdToB42Oau6wMXw=
X-Google-Smtp-Source: AGHT+IGrtVI7Ag6xYE1f+TLGOdCMuciUN8FBhLNfiUVFxLOx44HqUDp0q+0597IVa7e/OPKIGEnAv/W69eoy8fhFktE=
X-Received: by 2002:a05:6808:3c85:b0:3e5:fd5a:d3cc with SMTP id
 5614622812f47-3e5fd5ad447mr374275b6e.16.1729150837031; Thu, 17 Oct 2024
 00:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <20241012100147.618578-1-mingli.yu@windriver.com>
 <20241012100147.618578-2-mingli.yu@windriver.com> <CAMKF1sp_GqfxcDnExPfi+sh6PuyrZoQpOrf48mYqfiC_sjr61Q@mail.gmail.com>
 <5fa70fce-33a6-477d-a988-0e4063e5d0e1@windriver.com> <CAMKF1soKVFA=z9HG6AkKO9wudOTjUCXFgry46EtRkwFdsQkufA@mail.gmail.com>
 <17FE3E9DA0225DA0.4702@lists.openembedded.org> <824f78eb-9de1-459b-b934-73adf806f7ef@windriver.com>
In-Reply-To: <824f78eb-9de1-459b-b934-73adf806f7ef@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Oct 2024 00:40:11 -0700
Message-ID: <CAMKF1srL9Vx=GTm8Man9MXKKgHmv+orud-MsCAG10fWZU93y9w@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/3] tomlplusplus: Add ptest support
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 17 Oct 2024 07:40:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112963

On Thu, Oct 17, 2024 at 12:35=E2=80=AFAM Yu, Mingli <mingli.yu@windriver.co=
m> wrote:
>
>
>
> On 10/14/24 14:42, Yu, Mingli wrote:
> >
> >
> > On 10/14/24 10:36, Khem Raj wrote:
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the sender
> >> and know the content is safe.
> >>
> >> On Sun, Oct 13, 2024 at 7:31=E2=80=AFPM Yu, Mingli <mingli.yu@windrive=
r.com>
> >> wrote:
> >>>
> >>> Hi Khem,
> >>>
> >>> On 10/14/24 00:18, Khem Raj wrote:
> >>>> CAUTION: This email comes from a non Wind River email account!
> >>>> Do not click links or open attachments unless you recognize the
> >>>> sender and know the content is safe.
> >>>>
> >>>> ptests seems to be failing for qemux86-64 -
> >>>> https://snips.sh/f/PWrmTR3-bm
> >>>
> >>> I didn't reproduce the issue locally as below:
> >>>
> >>> root@qemux86-64:/usr/lib64/tomlplusplus/ptest# ./run-ptest
> >>> PASS: tomlplusplus_odr_test
> >>> PASS: tomlplusplus_tests
> >>
> >> Did you build and run with meta-oe-image-ptest-tomlplusplus ?
> >> secondly, I ran with image built with clang compiler
> >
> > Yes, I have tested with "$ bitbake meta-oe-image-ptest-tomlplusplus
> > -ctestimage" and it succeeded as below:
> > $ bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
> > [snip]
> > Output from runqemu:
> > runqemu - INFO - Received signal: 15
> > runqemu - INFO - Cleaning up
> > runqemu - INFO - Host uptime: 10209822.71
> >
> > tput: No value for $TERM and no -T specified
> >
> > RESULTS:
> > RESULTS - parselogs.ParseLogsTest.test_get_context: PASSED (0.00s)
> > RESULTS - parselogs.ParseLogsTest.test_parselogs: PASSED (2.02s)
> > RESULTS - ping.PingTest.test_ping: PASSED (0.01s)
> > RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectfail: PASSED (0.=
36s)
> > RESULTS - ssh.SSHTest.test_ssh: PASSED (0.50s)
> > RESULTS - ptest.PtestRunnerTest.test_ptestrunner_expectsuccess: SKIPPED
> > (0.00s)
> > SUMMARY:
> > meta-oe-image-ptest-tomlplusplus () - Ran 6 tests in 2.892s
> > meta-oe-image-ptest-tomlplusplus - OK - All required tests passed
> > (successes=3D4, skipped=3D1, failures=3D0, errors=3D0)
> > NOTE: Tasks Summary: Attempted 1430 tasks of which 1429 didn't need to
> > be rerun and all succeeded.
> >
> >
> > $ tail -2 conf/local.conf
> > TOOLCHAIN =3D "clang"
> > IMAGE_CLASSES +=3D "testimage"
> >
> > Could you help to provide your local.conf to help to reproduce the issu=
e?
>
> Or could you help to provide the reproduce steps based on poky?

You might need couple of more entries
TC_CXX_RUNTIME ?=3D "llvm"
RUNTIME ?=3D "llvm"

and add ld-is-lld to DISTRO_FEATURES and see if that helps to reproduce it

>
> Thanks,
>
> >
> > Thanks,
> >
> >>
> >>>
> >>> Anyway, I will look into this then.
> >>>
> >>> Thanks,
> >>>
> >>>>
> >>>> bitbake meta-oe-image-ptest-tomlplusplus
> >>>> bitbake meta-oe-image-ptest-tomlplusplus -ctestimage
> >>>>
> >>>> On Sat, Oct 12, 2024 at 3:01=E2=80=AFAM Yu, Mingli via lists.openemb=
edded.org
> >>>> <mingli.yu=3Deng.windriver.com@lists.openembedded.org> wrote:
> >>>>>
> >>>>> From: Mingli Yu <mingli.yu@windriver.com>
> >>>>>
> >>>>>    # ./run-ptest
> >>>>> PASS: tomlplusplus_odr_test
> >>>>> PASS: tomlplusplus_tests
> >>>>>
> >>>>> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> >>>>> ---
> >>>>>    .../recipes-devtools/tomlplusplus/files/run-ptest | 12 +++++++++=
+++
> >>>>>    .../tomlplusplus/tomlplusplus_git.bb              | 15
> >>>>> +++++++++++++--
> >>>>>    2 files changed, 25 insertions(+), 2 deletions(-)
> >>>>>    create mode 100755
> >>>>> meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >>>>>
> >>>>> diff --git a/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >>>>> b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >>>>> new file mode 100755
> >>>>> index 000000000..4f682c5eb
> >>>>> --- /dev/null
> >>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/files/run-ptest
> >>>>> @@ -0,0 +1,12 @@
> >>>>> +#!/bin/sh
> >>>>> +
> >>>>> +cd tests
> >>>>> +for atest in tomlplusplus_* ; do
> >>>>> +    rm -rf tests.log
> >>>>> +    ./${atest} > tests.log 2>&1
> >>>>> +    if [ $? =3D 0 ] ; then
> >>>>> +        echo "PASS: ${atest}"
> >>>>> +    else
> >>>>> +        echo "FAIL: ${atest}"
> >>>>> +    fi
> >>>>> +done
> >>>>> diff --git
> >>>>> a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >>>>> b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >>>>> index 0e8202bdc..245c309a2 100644
> >>>>> --- a/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >>>>> +++ b/meta-oe/recipes-devtools/tomlplusplus/tomlplusplus_git.bb
> >>>>> @@ -3,7 +3,9 @@ HOMEPAGE =3D "https://github.com/marzer/tomlplusplu=
s"
> >>>>>    LICENSE =3D "MIT"
> >>>>>    LIC_FILES_CHKSUM =3D
> >>>>> "file://LICENSE;md5=3D90960f22c10049c117d56ed2ee5ee167"
> >>>>>
> >>>>> -SRC_URI =3D
> >>>>> "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;branch=
=3Dmaster"
> >>>>> +SRC_URI =3D
> >>>>> "git://github.com/marzer/tomlplusplus.git;protocol=3Dhttps;branch=
=3Dmaster \
> >>>>> +           file://run-ptest \
> >>>>> +"
> >>>>>
> >>>>>    PV =3D "3.4.0"
> >>>>>    SRCREV =3D "30172438cee64926dc41fdd9c11fb3ba5b2ba9de"
> >>>>> @@ -11,4 +13,13 @@ S =3D "${WORKDIR}/git"
> >>>>>
> >>>>>    DEPENDS =3D "cmake-native"
> >>>>>
> >>>>> -inherit meson
> >>>>> +inherit meson ptest
> >>>>> +
> >>>>> +EXTRA_OEMESON +=3D
> >>>>> "-Dbuild_tests=3D${@bb.utils.contains("DISTRO_FEATURES", "ptest",
> >>>>> "true", "false", d)} \
> >>>>> +"
> >>>>> +
> >>>>> +do_install_ptest () {
> >>>>> +    install -d ${D}${PTEST_PATH}/tests
> >>>>> +    cp ${B}/tests/tomlplusplus_odr_test ${D}${PTEST_PATH}/tests
> >>>>> +    cp ${B}/tests/tomlplusplus_tests ${D}${PTEST_PATH}/tests
> >>>>> +}
> >>>>> --
> >>>>> 2.34.1
> >>>>>
> >>>>>
> >>>>>
> >>>>>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#112847): https://lists.openembedded.org/g/openembed=
ded-devel/message/112847
> > Mute This Topic: https://lists.openembedded.org/mt/108964413/3618448
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[mingli.yu@eng.windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

