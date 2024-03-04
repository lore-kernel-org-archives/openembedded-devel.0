Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53B5CC48BF6
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 06:34:57 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web10.92692.1709534094490308143
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 03 Mar 2024 22:34:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=GjcSaiy4;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-21fdf31a154so2390285fac.3
        for <openembedded-devel@lists.openembedded.org>; Sun, 03 Mar 2024 22:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709534094; x=1710138894; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNTZ6TM20wLASD6S+DEsWBzMkNnNwJ4lAsmFH5tHh3Y=;
        b=GjcSaiy4gD50YDOzqMMdx1U+7Ph98LlrJXEp5WaJVdiVCKK0eqaYVx7TRgO1mcOohq
         S6j0ld54Qj+JHJfPVGvb422OA1Dq86iDjp8ajwBaeCsLp/NpM8PNQy9TSgVueE/Z3Ss2
         mtpqjaRMa43xe3P7uHI5ictGWaoLGq133BsCM3VxEzouGeB7LhBeq1H/wnPeg9lFErGs
         fhPqlbTLzaoMd0Ixq4ln08nDRh3Go7vzqnCkxNVC2yJN2ka+OkYrdaptGBrq5gX8Nbo8
         LS1mKnlYtcJXAiEmAmgQHLsK0z+izI5v8rzAP+qhFarc0OX/N0mvK6UQPp1TOlfOQyCd
         IduA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709534094; x=1710138894;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNTZ6TM20wLASD6S+DEsWBzMkNnNwJ4lAsmFH5tHh3Y=;
        b=pEgfnLUhKPuG0c0DAEib2f8taIpfGglKPoGzPWGH5l3pxxwnxssr18m+8MAZyivWWD
         2dKzfq/0n76Q7+PpBNiMEokeDqnSmrJs4evbdDoh4AjHBpqtgYVeAG+n+jC6sSLL6D26
         rrynYxfZrYq/OQSM06QHpK1CWb2u1qS4KOP5a/grqgj/UrPZUWJta9mz68mN8GA8K/Fq
         NZbH6uzsssi1To7BXpqa1FxrTUxjYHnL5cy4rRbiODEKJ0/CRYp3ZDHvISU9zACYCHeo
         eEY48jpC65M9bJFz5gChtwSn5DITSXgLw1ZqG8YoDf0/H5x99/cZuWyyaW5VTWp5WnhT
         /E5g==
X-Gm-Message-State: AOJu0Yx1J8XHzRNweRQQ2B0g2OllNJP1CZ4wL22Yu+0JLiStahQJ7ZRc
	a036VCjY3L00di5FD3olLT/ONFjUNBudIGueTmKlzLYO85Qojj4oMclabNDWHH/N6yIRyGlRFTH
	dzFQHtSixXJ8Hl0YzDUF2GOMl+pg=
X-Google-Smtp-Source: AGHT+IHoFoEGO3lSUJGI1cC842QemfhcaNEETXP+cm6T+EMKSpcHCEV68jyp6C3ukCRh+3R45Spq+qHsAvQadKZkNLI=
X-Received: by 2002:a05:6871:206:b0:21f:1f78:adc9 with SMTP id
 t6-20020a056871020600b0021f1f78adc9mr10331360oad.29.1709534093545; Sun, 03
 Mar 2024 22:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
 <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
 <CAMKF1spywovBtYyEUOd5paR-4sSpe-aXLe8tY2jzg13mvSO03g@mail.gmail.com>
 <550e0375-89cc-4ec0-b16d-5a7882fd3a08@windriver.com> <3d1bd8f4-1e81-478e-96ad-f2956c065a50@windriver.com>
In-Reply-To: <3d1bd8f4-1e81-478e-96ad-f2956c065a50@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 3 Mar 2024 22:34:26 -0800
Message-ID: <CAMKF1spUjLnzLuOh=doaMRx++MVEjVoXbz7p4Z5NV=FqbdPAxA@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
To: "Lyu, William" <William.Lyu@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 04 Mar 2024 06:34:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109096

its happening quite consistently now on all kinds of AB workers, see
recent 4-5 failures on

https://autobuilder.yoctoproject.org/typhoon/#/builders/88

On Sun, Mar 3, 2024 at 10:01=E2=80=AFPM Lyu, William <William.Lyu@windriver=
.com> wrote:
>
> On 3/4/2024 12:41 AM, Lyu, William wrote:
> > On 3/1/2024 4:52 PM, Khem Raj wrote:
> >> CAUTION: This email comes from a non Wind River email account!
> >> Do not click links or open attachments unless you recognize the sender
> >> and know the content is safe.
> >>
> >> On Fri, Mar 1, 2024 at 12:20=E2=80=AFPM Lyu, William
> >> <William.Lyu@windriver.com> wrote:
> >>>
> >>>> I am running into this error on some builders on AB
> >>>>
> >>>> stdio: ERROR: Task
> >>>> (/home/pokybuild/yocto-worker/meta-oe/build/meta/recipes-support/lib=
exif/libexif_0.6.24.bb:do_package_qa)
> >>>> failed with exit code '1'
> >>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: QA Issue:
> >>>> /usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained in
> >>>> package e2tools-ptest requires /usr/bin/sh, but no providers found i=
n
> >>>> RDEPENDS:e2tools-ptest? [file-rdeps]
> >>>
> >>> File "update.sample" is from ".git" directory. I do not actually need
> >>> this
> >>> file or anything from ".git" directory. I only need the source tree
> >>> for ptest
> >>> to run.
> >>>
> >>> However, I am a bit confused about this QA issue because:
> >>> -   I do not see any file that has "#!/usr/bin/sh". Even
> >>> "update.sample" has
> >>>      "#!/bin/sh" as the first line. There are files in the source
> >>> tree (not
> >>>      under ".git" directory) that have "#!/bin/sh" as the first line.
> >>> -   "/bin/sh" is referring to the default POSIX shell, and the "bash"
> >>> in the
> >>>      RDEPENDS:e2tools-ptest should already fulfill this runtime
> >>> dependency,
> >>> -   I am not yet able to reproduce this issue using poky. I assume
> >>> this is
> >>>      because the QA Issue checker "file-rdeps" in poky do not check
> >>> "sh" by
> >>>      default (excerpt taken from "meta/classes-global/insane.bbclass"=
):
> >>>
> >>>      if "file-rdeps" not in skip:
> >>>          ignored_file_rdeps =3D set(['/bin/sh', '/usr/bin/env',
> >>> 'rtld(GNU_HASH)'])
> >>>          if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True,
> >>> False, d):
> >>>              ignored_file_rdeps |=3D set(['/usr/bin/sh'])
> >>>          if bb.data.inherits_class('nativesdk', d):
> >>>              ignored_file_rdeps |=3D set(['/bin/bash', '/usr/bin/perl=
',
> >>> 'perl'])
> >>>              if bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
> >>> True, False, d):
> >>>                  ignored_file_rdeps |=3D set(['/usr/bin/bash'])
> >>>
> >>> William
> >>
> >> what distro features do you have enabled ? perhaps try it with and
> >> without usermerge in DISTRO_FEATURES
> >> and rebuild this package after doing cleansstate to ensure its being
> >> rebuilt in both cases.
> >
> > I have not been able to reproduce this "QA Issue" error yet. Is it
> > possible that the [file-rdeps] checker on the autobuilder (AB) where yo=
u
> > saw this issue is defined differently than the default poky? The
> > following are the details regarding my previous and new builds.
> >
> > For my previous builds, there are no specified DISTRO_FEATURES. In
> > conf/local.conf, I only added the following line. The build command I
> > used was "bitbake core-image-minimal".
> >
> > IMAGE_INSTALL:append =3D " libexif e2tools e2tools-ptest"
> >
> > I tried a new build with the following line added to conf/local.conf.
> >
> > DISTRO_FEATURES:append =3D " usermerge"
> >
> > I also did "bitbake -c cleansstate e2tools" and "bitbake -c cleansstate
> > core-image-minimal" before each build.
> >
> > William
>
> Just in case the [file-rdeps] checker is somehow not working, I removed
> "bash" from "RDEPENDS:${PN}-ptest". I indeed get the following error
> message as expected when building "bitbake core-image-minimal":
>
> ERROR: QA Issue: /usr/lib/e2tools/ptest/build/config.status contained in
> package e2tools-ptest requires /bin/bash, but no providers found in
> RDEPENDS:e2tools-ptest? [file-rdeps]
>
> William
>
> >
> >>
> >>>
> >>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: Fatal QA errors we=
re
> >>>> found, failing task.
> >>>> stdio: ERROR: Logfile of failure stored in:
> >>>> /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-p=
oky-linux/e2tools/0.1.0+git/temp/log.do_package_qa.3114961
> >>>>
> >>>> On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, William via
> >>>> lists.openembedded.org
> >>>> <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
> >>>>>
> >>>>> From: William Lyu <William.Lyu@windriver.com>
> >>>>>
> >>>>> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> >>>>> ---
> >>>>>   .../recipes-utils/e2tools/e2tools_git.bb      | 51
> >>>>> ++++++++++++++++++-
> >>>>>   .../recipes-utils/e2tools/files/run-ptest     |  5 ++
> >>>>>   2 files changed, 54 insertions(+), 2 deletions(-)
> >>>>>   create mode 100644
> >>>>> meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >>>>>
> >>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >>>>> b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >>>>> index caf0025c8..a80b6f598 100644
> >>>>> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >>>>> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >>>>> @@ -9,17 +9,64 @@ SECTION =3D "base"
> >>>>>   LICENSE =3D "GPL-2.0-only"
> >>>>>   LIC_FILES_CHKSUM =3D
> >>>>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >>>>>
> >>>>> -DEPENDS +=3D "e2fsprogs"
> >>>>> +DEPENDS +=3D "coreutils e2fsprogs"
> >>>>>
> >>>>>   PV =3D "0.1.0+git"
> >>>>>
> >>>>>   SRC_URI =3D " \
> >>>>>
> >>>>> git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dmaster \
> >>>>> +           file://run-ptest \
> >>>>>   "
> >>>>> +
> >>>>>   SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
> >>>>>
> >>>>>   S =3D "${WORKDIR}/git"
> >>>>>
> >>>>> -inherit autotools pkgconfig
> >>>>> +inherit autotools pkgconfig ptest
> >>>>> +
> >>>>> +do_configure:prepend() {
> >>>>> +    git -C "${WORKDIR}/git" reset --hard HEAD
> >>>>> +
> >>>>> +    # To install ptest for this package, special configuration
> >>>>> needs to be
> >>>>> +    # done before do_configure(). So, do_configure_ptest() which
> >>>>> is scheduled
> >>>>> +    # after do_configure() cannot be used.
> >>>>> +
> >>>>> +    # We only do special configuration if we are installing ptest
> >>>>> for this
> >>>>> +    # package.
> >>>>> +    if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; then
> >>>>> +        # Since we guarantee run-time dependency when installing
> >>>>> the ptest for
> >>>>> +        # this package, we do not need the check macros under
> >>>>> section "checks
> >>>>> +        # for programs" in "configure.ac". Plus, these check
> >>>>> macros set the
> >>>>> +        # ouput variables to incorrect values as these checks are
> >>>>> performed on
> >>>>> +        # the host environment. Still, we need these variables
> >>>>> outputted from
> >>>>> +        # these check macros. So, we insert the following lines to
> >>>>> manually
> >>>>> +        # set these output variables to the correct value in
> >>>>> "configure.ac".
> >>>>> +
> >>>>> +        # Note that HAVE_DD_COMMAND and HAVE_MKE2FS_COMMAND are
> >>>>> only ever used
> >>>>> +        # in tests/Makefile-files which determines whether to
> >>>>> include the test
> >>>>> +        # cases. As for output variables CHMOD, DD, and MKE2FS,
> >>>>> they only
> >>>>> +        # point to the programs which test cases need to run.
> >>>>> Since these
> >>>>> +        # commands are guaranteed to be present due to RDEPENDS
> >>>>> and are
> >>>>> +        # guaranteed to be accessible under PATH environment
> >>>>> variable on the
> >>>>> +        # target, we only need to specify the name of these progra=
ms.
> >>>>> +
> >>>>> +        perl -i -0777 -pe 's/(^dnl\s*=3D+\s*^dnl\s*Checks for
> >>>>> compiler flags\s*^dnl\s*=3D+)/
> >>>>> +AC_SUBST([CHMOD], 'chmod')
> >>>>> +AC_SUBST([DD], 'dd')
> >>>>> +AC_SUBST([MKE2FS], 'mke2fs')
> >>>>> +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
> >>>>> +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
> >>>>> +\1/ms' "${WORKDIR}/git/configure.ac"
> >>>>> +    fi
> >>>>> +}
> >>>>> +
> >>>>> +do_install_ptest() {
> >>>>> +    rm -rf "${D}${PTEST_PATH}/*"
> >>>>> +    cp -r ../build "${D}${PTEST_PATH}"
> >>>>> +    cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
> >>>>> +    cp -r "${S}" "${D}${PTEST_PATH}"
> >>>>> +}
> >>>>> +
> >>>>> +RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk
> >>>>> make perl"
> >>>>>
> >>>>>   BBCLASSEXTEND =3D "native"
> >>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >>>>> b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >>>>> new file mode 100644
> >>>>> index 000000000..3d4dd9cf3
> >>>>> --- /dev/null
> >>>>> +++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >>>>> @@ -0,0 +1,5 @@
> >>>>> +#!/bin/sh
> >>>>> +
> >>>>> +set -e
> >>>>> +
> >>>>> +make -C build check
> >>>>> --
> >>>>> 2.43.0
> >>>>>
> >>>>>
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>> Links: You receive all messages sent to this group.
> >>>>> View/Reply Online (#108987):
> >>>>> https://lists.openembedded.org/g/openembedded-devel/message/108987
> >>>>> Mute This Topic: https://lists.openembedded.org/mt/104508347/199791=
4
> >>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>>>> Unsubscribe:
> >>>>> https://lists.openembedded.org/g/openembedded-devel/unsub
> >>>>> [raj.khem@gmail.com]
> >>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

