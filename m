Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55988C54E41
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 16:02:52 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.web10.15679.1709740966390331660
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 06 Mar 2024 08:02:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D9Fa4lNX;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3c1f55ba3ecso1755101b6e.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709740965; x=1710345765; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1uMURPmjcUfim9Ec6XS7PmQN6WKxLEpCZevnBURbCZ8=;
        b=D9Fa4lNXVr84k8Bf3gmMjWE1jUS35N9yqqH0+c7QUxylOIz/3mtkd9l5NyALyul4HH
         mDAQCahdkRUovAYTkgfnnKJUYi5KFKVRz0KCqedNEUq2wgOa10S/ZkJ+I5Vwm8KTXvvi
         Fj/shSzxMHhcKxeoCSCfq/9ZWxf3rvrpjByKN/V7ibRkb5YR26v7ZC+7YND6Vu0gcoxV
         YyUYo/EIU60iARkqtCHlnFwEKC9fDhO4r7Xwzt1xo6KD2PB8t+8hKjH67jpUvAUhcct4
         q7X7G9prfn5S32rFFjkA+eWmBnA9Dyc6Z30xbuuq8FXCxWgRV+gIDwQ8IFs/rBTGY0rD
         ioAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709740965; x=1710345765;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1uMURPmjcUfim9Ec6XS7PmQN6WKxLEpCZevnBURbCZ8=;
        b=TqeVOBiBmJhaw5QEy9PAv8llsBaGuV+FnhDy0SSLxijf+VNR0TaE3L2V28njS/ixo9
         uiM/HNjm9BmyjtbHCBmpEafifUmE3egjZ2rVAWBG6Ph9v9E0Mdmczf2NJQMmC+snhPNA
         dbZhHwS3c3dUva2goEQ12OefHFlwrO3EVjelw6OhLldBX60Tn6gmyduDLtq5X8fIg7I9
         nwl8lw1iBF+ubNfIU+926tvA4x+y4g1K/j0isOoFPluVDbppYKMjvAyLbacyxuYAa9IL
         48Nkcnhv4bJl+SOgOnGa78cTIWyj9NVLJijGY0xmprzlJ9GMjm5ZrWU1MhmA8c76b6RU
         AbYA==
X-Gm-Message-State: AOJu0YxvYsAYuzp+iD9IG2T/8JLfIMiMMrBFqesCJKNJ2yRbiRo0/wTE
	lJ+J84gAY8/xx0JyWNosFp1bXD9LJASrWl8ZAyQyg+OSv4IGNa1o3GgKmMGvf01v9jyjbnHN9/u
	YCKYwQfRSM+BdGkroCU2IKHUPMwVWSbdm
X-Google-Smtp-Source: AGHT+IEVduR+6LbZ0CwwMkbAVdT6F2r1WmCPYLrES/r6C+E5gUzbNUPdnWkf37XoUb/8EWRXv41SeiqX3IUSAxAh/Jc=
X-Received: by 2002:a05:6870:55d4:b0:220:be34:7ee2 with SMTP id
 qk20-20020a05687055d400b00220be347ee2mr5652118oac.26.1709740965129; Wed, 06
 Mar 2024 08:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
 <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
 <CAMKF1spywovBtYyEUOd5paR-4sSpe-aXLe8tY2jzg13mvSO03g@mail.gmail.com>
 <550e0375-89cc-4ec0-b16d-5a7882fd3a08@windriver.com> <3d1bd8f4-1e81-478e-96ad-f2956c065a50@windriver.com>
 <CAMKF1spUjLnzLuOh=doaMRx++MVEjVoXbz7p4Z5NV=FqbdPAxA@mail.gmail.com> <c5f6672d-9173-46c5-b455-06cb48fed3da@windriver.com>
In-Reply-To: <c5f6672d-9173-46c5-b455-06cb48fed3da@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 6 Mar 2024 08:02:33 -0800
Message-ID: <CAMKF1spQ_cNhb8trCRQVH5-GooXEyBfpMeOat2qpkjaFb+_FmQ@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
To: "Lyu, William" <William.Lyu@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e271c7061300169f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 06 Mar 2024 16:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109168

--000000000000e271c7061300169f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 6, 2024 at 8:00=E2=80=AFAM Lyu, William <William.Lyu@windriver.=
com>
wrote:

> I see that you pushed a commit that adds command removing unnecessary
> files and host paths in the e2tools recipe.
>
>
> https://github.com/openembedded/meta-openembedded/commit/92b6825a870fde29=
1b1244193dba8d7c1051c53f
>
> I have tested this latest e2tools recipe locally using the latest poky.
> I built an image using "bitbake core-image-minimal" with e2tools and its
> ptest package. The build was successful (still no QA errors) and the
> ptest for e2tools ran without any issue.
>
> Are you still seeing the [file-rdeps] QA issues on the Yocto Autobuilder?
>
No
This patch fixes the issue this is what I have been asking for all along


> Thank you for removing the unnecessary files and improving the e2tools
> recipe.
>
> On 3/4/2024 1:34 AM, Khem Raj wrote:
> > CAUTION: This email comes from a non Wind River email account!
> > Do not click links or open attachments unless you recognize the sender
> and know the content is safe.
> >
> > its happening quite consistently now on all kinds of AB workers, see
> > recent 4-5 failures on
> >
> > https://autobuilder.yoctoproject.org/typhoon/#/builders/88
> >
> > On Sun, Mar 3, 2024 at 10:01=E2=80=AFPM Lyu, William <William.Lyu@windr=
iver.com>
> wrote:
> >>
> >> On 3/4/2024 12:41 AM, Lyu, William wrote:
> >>> On 3/1/2024 4:52 PM, Khem Raj wrote:
> >>>> CAUTION: This email comes from a non Wind River email account!
> >>>> Do not click links or open attachments unless you recognize the send=
er
> >>>> and know the content is safe.
> >>>>
> >>>> On Fri, Mar 1, 2024 at 12:20=E2=80=AFPM Lyu, William
> >>>> <William.Lyu@windriver.com> wrote:
> >>>>>
> >>>>>> I am running into this error on some builders on AB
> >>>>>>
> >>>>>> stdio: ERROR: Task
> >>>>>>
> (/home/pokybuild/yocto-worker/meta-oe/build/meta/recipes-support/libexif/=
libexif_0.6.24.bb:
> do_package_qa)
> >>>>>> failed with exit code '1'
> >>>>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: QA Issue:
> >>>>>> /usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained in
> >>>>>> package e2tools-ptest requires /usr/bin/sh, but no providers found
> in
> >>>>>> RDEPENDS:e2tools-ptest? [file-rdeps]
> >>>>>
> >>>>> File "update.sample" is from ".git" directory. I do not actually ne=
ed
> >>>>> this
> >>>>> file or anything from ".git" directory. I only need the source tree
> >>>>> for ptest
> >>>>> to run.
> >>>>>
> >>>>> However, I am a bit confused about this QA issue because:
> >>>>> -   I do not see any file that has "#!/usr/bin/sh". Even
> >>>>> "update.sample" has
> >>>>>       "#!/bin/sh" as the first line. There are files in the source
> >>>>> tree (not
> >>>>>       under ".git" directory) that have "#!/bin/sh" as the first
> line.
> >>>>> -   "/bin/sh" is referring to the default POSIX shell, and the "bas=
h"
> >>>>> in the
> >>>>>       RDEPENDS:e2tools-ptest should already fulfill this runtime
> >>>>> dependency,
> >>>>> -   I am not yet able to reproduce this issue using poky. I assume
> >>>>> this is
> >>>>>       because the QA Issue checker "file-rdeps" in poky do not chec=
k
> >>>>> "sh" by
> >>>>>       default (excerpt taken from
> "meta/classes-global/insane.bbclass"):
> >>>>>
> >>>>>       if "file-rdeps" not in skip:
> >>>>>           ignored_file_rdeps =3D set(['/bin/sh', '/usr/bin/env',
> >>>>> 'rtld(GNU_HASH)'])
> >>>>>           if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True,
> >>>>> False, d):
> >>>>>               ignored_file_rdeps |=3D set(['/usr/bin/sh'])
> >>>>>           if bb.data.inherits_class('nativesdk', d):
> >>>>>               ignored_file_rdeps |=3D set(['/bin/bash',
> '/usr/bin/perl',
> >>>>> 'perl'])
> >>>>>               if bb.utils.contains('DISTRO_FEATURES', 'usrmerge',
> >>>>> True, False, d):
> >>>>>                   ignored_file_rdeps |=3D set(['/usr/bin/bash'])
> >>>>>
> >>>>> William
> >>>>
> >>>> what distro features do you have enabled ? perhaps try it with and
> >>>> without usermerge in DISTRO_FEATURES
>
> For the sake of documentation and preventing confusion for anyone
> stumbling upon this email thread, I would like to confirm if "usermerge"
> here is a typo. Is it correct that you meant "usrmerge"?
>
> William
>
> >>>> and rebuild this package after doing cleansstate to ensure its being
> >>>> rebuilt in both cases.
> >>>
> >>> I have not been able to reproduce this "QA Issue" error yet. Is it
> >>> possible that the [file-rdeps] checker on the autobuilder (AB) where
> you
> >>> saw this issue is defined differently than the default poky? The
> >>> following are the details regarding my previous and new builds.
> >>>
> >>> For my previous builds, there are no specified DISTRO_FEATURES. In
> >>> conf/local.conf, I only added the following line. The build command I
> >>> used was "bitbake core-image-minimal".
> >>>
> >>> IMAGE_INSTALL:append =3D " libexif e2tools e2tools-ptest"
> >>>
> >>> I tried a new build with the following line added to conf/local.conf.
> >>>
> >>> DISTRO_FEATURES:append =3D " usermerge"
> >>>
> >>> I also did "bitbake -c cleansstate e2tools" and "bitbake -c cleanssta=
te
> >>> core-image-minimal" before each build.
> >>>
> >>> William
> >>
> >> Just in case the [file-rdeps] checker is somehow not working, I remove=
d
> >> "bash" from "RDEPENDS:${PN}-ptest". I indeed get the following error
> >> message as expected when building "bitbake core-image-minimal":
> >>
> >> ERROR: QA Issue: /usr/lib/e2tools/ptest/build/config.status contained =
in
> >> package e2tools-ptest requires /bin/bash, but no providers found in
> >> RDEPENDS:e2tools-ptest? [file-rdeps]
> >>
> >> William
> >>
> >>>
> >>>>
> >>>>>
> >>>>>> stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: Fatal QA errors
> were
> >>>>>> found, failing task.
> >>>>>> stdio: ERROR: Logfile of failure stored in:
> >>>>>>
> /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-l=
inux/e2tools/0.1.0+git/temp/log.do_package_qa.3114961
> >>>>>>
> >>>>>> On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, William via
> >>>>>> lists.openembedded.org
> >>>>>> <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
> >>>>>>>
> >>>>>>> From: William Lyu <William.Lyu@windriver.com>
> >>>>>>>
> >>>>>>> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> >>>>>>> ---
> >>>>>>>    .../recipes-utils/e2tools/e2tools_git.bb      | 51
> >>>>>>> ++++++++++++++++++-
> >>>>>>>    .../recipes-utils/e2tools/files/run-ptest     |  5 ++
> >>>>>>>    2 files changed, 54 insertions(+), 2 deletions(-)
> >>>>>>>    create mode 100644
> >>>>>>> meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >>>>>>>
> >>>>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.b=
b
> >>>>>>> b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >>>>>>> index caf0025c8..a80b6f598 100644
> >>>>>>> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >>>>>>> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >>>>>>> @@ -9,17 +9,64 @@ SECTION =3D "base"
> >>>>>>>    LICENSE =3D "GPL-2.0-only"
> >>>>>>>    LIC_FILES_CHKSUM =3D
> >>>>>>> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >>>>>>>
> >>>>>>> -DEPENDS +=3D "e2fsprogs"
> >>>>>>> +DEPENDS +=3D "coreutils e2fsprogs"
> >>>>>>>
> >>>>>>>    PV =3D "0.1.0+git"
> >>>>>>>
> >>>>>>>    SRC_URI =3D " \
> >>>>>>>
> >>>>>>> git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dmaster=
 \
> >>>>>>> +           file://run-ptest \
> >>>>>>>    "
> >>>>>>> +
> >>>>>>>    SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
> >>>>>>>
> >>>>>>>    S =3D "${WORKDIR}/git"
> >>>>>>>
> >>>>>>> -inherit autotools pkgconfig
> >>>>>>> +inherit autotools pkgconfig ptest
> >>>>>>> +
> >>>>>>> +do_configure:prepend() {
> >>>>>>> +    git -C "${WORKDIR}/git" reset --hard HEAD
> >>>>>>> +
> >>>>>>> +    # To install ptest for this package, special configuration
> >>>>>>> needs to be
> >>>>>>> +    # done before do_configure(). So, do_configure_ptest() which
> >>>>>>> is scheduled
> >>>>>>> +    # after do_configure() cannot be used.
> >>>>>>> +
> >>>>>>> +    # We only do special configuration if we are installing ptes=
t
> >>>>>>> for this
> >>>>>>> +    # package.
> >>>>>>> +    if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; then
> >>>>>>> +        # Since we guarantee run-time dependency when installing
> >>>>>>> the ptest for
> >>>>>>> +        # this package, we do not need the check macros under
> >>>>>>> section "checks
> >>>>>>> +        # for programs" in "configure.ac". Plus, these check
> >>>>>>> macros set the
> >>>>>>> +        # ouput variables to incorrect values as these checks ar=
e
> >>>>>>> performed on
> >>>>>>> +        # the host environment. Still, we need these variables
> >>>>>>> outputted from
> >>>>>>> +        # these check macros. So, we insert the following lines =
to
> >>>>>>> manually
> >>>>>>> +        # set these output variables to the correct value in
> >>>>>>> "configure.ac".
> >>>>>>> +
> >>>>>>> +        # Note that HAVE_DD_COMMAND and HAVE_MKE2FS_COMMAND are
> >>>>>>> only ever used
> >>>>>>> +        # in tests/Makefile-files which determines whether to
> >>>>>>> include the test
> >>>>>>> +        # cases. As for output variables CHMOD, DD, and MKE2FS,
> >>>>>>> they only
> >>>>>>> +        # point to the programs which test cases need to run.
> >>>>>>> Since these
> >>>>>>> +        # commands are guaranteed to be present due to RDEPENDS
> >>>>>>> and are
> >>>>>>> +        # guaranteed to be accessible under PATH environment
> >>>>>>> variable on the
> >>>>>>> +        # target, we only need to specify the name of these
> programs.
> >>>>>>> +
> >>>>>>> +        perl -i -0777 -pe 's/(^dnl\s*=3D+\s*^dnl\s*Checks for
> >>>>>>> compiler flags\s*^dnl\s*=3D+)/
> >>>>>>> +AC_SUBST([CHMOD], 'chmod')
> >>>>>>> +AC_SUBST([DD], 'dd')
> >>>>>>> +AC_SUBST([MKE2FS], 'mke2fs')
> >>>>>>> +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
> >>>>>>> +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
> >>>>>>> +\1/ms' "${WORKDIR}/git/configure.ac"
> >>>>>>> +    fi
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +do_install_ptest() {
> >>>>>>> +    rm -rf "${D}${PTEST_PATH}/*"
> >>>>>>> +    cp -r ../build "${D}${PTEST_PATH}"
> >>>>>>> +    cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
> >>>>>>> +    cp -r "${S}" "${D}${PTEST_PATH}"
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk
> >>>>>>> make perl"
> >>>>>>>
> >>>>>>>    BBCLASSEXTEND =3D "native"
> >>>>>>> diff --git a/meta-filesystems/recipes-utils/e2tools/files/run-pte=
st
> >>>>>>> b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >>>>>>> new file mode 100644
> >>>>>>> index 000000000..3d4dd9cf3
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >>>>>>> @@ -0,0 +1,5 @@
> >>>>>>> +#!/bin/sh
> >>>>>>> +
> >>>>>>> +set -e
> >>>>>>> +
> >>>>>>> +make -C build check
> >>>>>>> --
> >>>>>>> 2.43.0
> >>>>>>>
> >>>>>>>
> >>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >>>>>>> Links: You receive all messages sent to this group.
> >>>>>>> View/Reply Online (#108987):
> >>>>>>> https://lists.openembedded.org/g/openembedded-devel/message/10898=
7
> >>>>>>> Mute This Topic:
> https://lists.openembedded.org/mt/104508347/1997914
> >>>>>>> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >>>>>>> Unsubscribe:
> >>>>>>> https://lists.openembedded.org/g/openembedded-devel/unsub
> >>>>>>> [raj.khem@gmail.com]
> >>>>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

--000000000000e271c7061300169f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, Mar 6, 2024 at 8:00=E2=80=AFAM Lyu, William &lt;<a =
href=3D"mailto:William.Lyu@windriver.com">William.Lyu@windriver.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">I see that you pushed a com=
mit that adds command removing unnecessary <br>
files and host paths in the e2tools recipe.<br>
<br>
<a href=3D"https://github.com/openembedded/meta-openembedded/commit/92b6825=
a870fde291b1244193dba8d7c1051c53f" rel=3D"noreferrer" target=3D"_blank">htt=
ps://github.com/openembedded/meta-openembedded/commit/92b6825a870fde291b124=
4193dba8d7c1051c53f</a><br>
<br>
I have tested this latest e2tools recipe locally using the latest poky. <br=
>
I built an image using &quot;bitbake core-image-minimal&quot; with e2tools =
and its <br>
ptest package. The build was successful (still no QA errors) and the <br>
ptest for e2tools ran without any issue.<br>
<br>
Are you still seeing the [file-rdeps] QA issues on the Yocto Autobuilder?<b=
r>
</blockquote><div dir=3D"auto">No</div><div dir=3D"auto">This patch fixes t=
he issue this is what I have been asking for all along=C2=A0</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Thank you for removing the unnecessary files and improving the e2tools <br>
recipe.<br>
<br>
On 3/4/2024 1:34 AM, Khem Raj wrote:<br>
&gt; CAUTION: This email comes from a non Wind River email account!<br>
&gt; Do not click links or open attachments unless you recognize the sender=
 and know the content is safe.<br>
&gt; <br>
&gt; its happening quite consistently now on all kinds of AB workers, see<b=
r>
&gt; recent 4-5 failures on<br>
&gt; <br>
&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders/88"=
 rel=3D"noreferrer" target=3D"_blank">https://autobuilder.yoctoproject.org/=
typhoon/#/builders/88</a><br>
&gt; <br>
&gt; On Sun, Mar 3, 2024 at 10:01=E2=80=AFPM Lyu, William &lt;<a href=3D"ma=
ilto:William.Lyu@windriver.com" target=3D"_blank">William.Lyu@windriver.com=
</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On 3/4/2024 12:41 AM, Lyu, William wrote:<br>
&gt;&gt;&gt; On 3/1/2024 4:52 PM, Khem Raj wrote:<br>
&gt;&gt;&gt;&gt; CAUTION: This email comes from a non Wind River email acco=
unt!<br>
&gt;&gt;&gt;&gt; Do not click links or open attachments unless you recogniz=
e the sender<br>
&gt;&gt;&gt;&gt; and know the content is safe.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; On Fri, Mar 1, 2024 at 12:20=E2=80=AFPM Lyu, William<br>
&gt;&gt;&gt;&gt; &lt;<a href=3D"mailto:William.Lyu@windriver.com" target=3D=
"_blank">William.Lyu@windriver.com</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; I am running into this error on some builders on A=
B<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; stdio: ERROR: Task<br>
&gt;&gt;&gt;&gt;&gt;&gt; (/home/pokybuild/yocto-worker/meta-oe/build/meta/r=
ecipes-support/libexif/libexif_0.6.24.bb:do_package_qa)<br>
&gt;&gt;&gt;&gt;&gt;&gt; failed with exit code &#39;1&#39;<br>
&gt;&gt;&gt;&gt;&gt;&gt; stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: =
QA Issue:<br>
&gt;&gt;&gt;&gt;&gt;&gt; /usr/lib/e2tools/ptest/git/.git/hooks/update.sampl=
e contained in<br>
&gt;&gt;&gt;&gt;&gt;&gt; package e2tools-ptest requires /usr/bin/sh, but no=
 providers found in<br>
&gt;&gt;&gt;&gt;&gt;&gt; RDEPENDS:e2tools-ptest? [file-rdeps]<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; File &quot;update.sample&quot; is from &quot;.git&quot=
; directory. I do not actually need<br>
&gt;&gt;&gt;&gt;&gt; this<br>
&gt;&gt;&gt;&gt;&gt; file or anything from &quot;.git&quot; directory. I on=
ly need the source tree<br>
&gt;&gt;&gt;&gt;&gt; for ptest<br>
&gt;&gt;&gt;&gt;&gt; to run.<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; However, I am a bit confused about this QA issue becau=
se:<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0I do not see any file that has &quot;#!/=
usr/bin/sh&quot;. Even<br>
&gt;&gt;&gt;&gt;&gt; &quot;update.sample&quot; has<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;#!/bin/sh&quot; as the=
 first line. There are files in the source<br>
&gt;&gt;&gt;&gt;&gt; tree (not<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0under &quot;.git&quot; direc=
tory) that have &quot;#!/bin/sh&quot; as the first line.<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0&quot;/bin/sh&quot; is referring to the =
default POSIX shell, and the &quot;bash&quot;<br>
&gt;&gt;&gt;&gt;&gt; in the<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0RDEPENDS:e2tools-ptest shoul=
d already fulfill this runtime<br>
&gt;&gt;&gt;&gt;&gt; dependency,<br>
&gt;&gt;&gt;&gt;&gt; -=C2=A0 =C2=A0I am not yet able to reproduce this issu=
e using poky. I assume<br>
&gt;&gt;&gt;&gt;&gt; this is<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0because the QA Issue checker=
 &quot;file-rdeps&quot; in poky do not check<br>
&gt;&gt;&gt;&gt;&gt; &quot;sh&quot; by<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default (excerpt taken from =
&quot;meta/classes-global/insane.bbclass&quot;):<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0if &quot;file-rdeps&quot; no=
t in skip:<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ignored_file_r=
deps =3D set([&#39;/bin/sh&#39;, &#39;/usr/bin/env&#39;,<br>
&gt;&gt;&gt;&gt;&gt; &#39;rtld(GNU_HASH)&#39;])<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.utils.co=
ntains(&#39;DISTRO_FEATURES&#39;, &#39;usrmerge&#39;, True,<br>
&gt;&gt;&gt;&gt;&gt; False, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ignored_file_rdeps |=3D set([&#39;/usr/bin/sh&#39;])<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if bb.data.inh=
erits_class(&#39;nativesdk&#39;, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
ignored_file_rdeps |=3D set([&#39;/bin/bash&#39;, &#39;/usr/bin/perl&#39;,<=
br>
&gt;&gt;&gt;&gt;&gt; &#39;perl&#39;])<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
if bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;usrmerge&#39;,<br>
&gt;&gt;&gt;&gt;&gt; True, False, d):<br>
&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ignored_file_rdeps |=3D set([&#39;/usr/bin/bash&#39;])<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt; William<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; what distro features do you have enabled ? perhaps try it =
with and<br>
&gt;&gt;&gt;&gt; without usermerge in DISTRO_FEATURES<br>
<br>
For the sake of documentation and preventing confusion for anyone <br>
stumbling upon this email thread, I would like to confirm if &quot;usermerg=
e&quot; <br>
here is a typo. Is it correct that you meant &quot;usrmerge&quot;?<br>
<br>
William<br>
<br>
&gt;&gt;&gt;&gt; and rebuild this package after doing cleansstate to ensure=
 its being<br>
&gt;&gt;&gt;&gt; rebuilt in both cases.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I have not been able to reproduce this &quot;QA Issue&quot; er=
ror yet. Is it<br>
&gt;&gt;&gt; possible that the [file-rdeps] checker on the autobuilder (AB)=
 where you<br>
&gt;&gt;&gt; saw this issue is defined differently than the default poky? T=
he<br>
&gt;&gt;&gt; following are the details regarding my previous and new builds=
.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; For my previous builds, there are no specified DISTRO_FEATURES=
. In<br>
&gt;&gt;&gt; conf/local.conf, I only added the following line. The build co=
mmand I<br>
&gt;&gt;&gt; used was &quot;bitbake core-image-minimal&quot;.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; IMAGE_INSTALL:append =3D &quot; libexif e2tools e2tools-ptest&=
quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I tried a new build with the following line added to conf/loca=
l.conf.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; DISTRO_FEATURES:append =3D &quot; usermerge&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I also did &quot;bitbake -c cleansstate e2tools&quot; and &quo=
t;bitbake -c cleansstate<br>
&gt;&gt;&gt; core-image-minimal&quot; before each build.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; William<br>
&gt;&gt;<br>
&gt;&gt; Just in case the [file-rdeps] checker is somehow not working, I re=
moved<br>
&gt;&gt; &quot;bash&quot; from &quot;RDEPENDS:${PN}-ptest&quot;. I indeed g=
et the following error<br>
&gt;&gt; message as expected when building &quot;bitbake core-image-minimal=
&quot;:<br>
&gt;&gt;<br>
&gt;&gt; ERROR: QA Issue: /usr/lib/e2tools/ptest/build/config.status contai=
ned in<br>
&gt;&gt; package e2tools-ptest requires /bin/bash, but no providers found i=
n<br>
&gt;&gt; RDEPENDS:e2tools-ptest? [file-rdeps]<br>
&gt;&gt;<br>
&gt;&gt; William<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: =
Fatal QA errors were<br>
&gt;&gt;&gt;&gt;&gt;&gt; found, failing task.<br>
&gt;&gt;&gt;&gt;&gt;&gt; stdio: ERROR: Logfile of failure stored in:<br>
&gt;&gt;&gt;&gt;&gt;&gt; /home/pokybuild/yocto-worker/meta-oe/build/build/t=
mp/work/core2-64-poky-linux/e2tools/0.1.0+git/temp/log.do_package_qa.311496=
1<br>
&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt; On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, Willi=
am via<br>
&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"n=
oreferrer" target=3D"_blank">lists.openembedded.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt; &lt;william.lyu=3D<a href=3D"mailto:windriver.com@=
lists.openembedded.org" target=3D"_blank">windriver.com@lists.openembedded.=
org</a>&gt; wrote:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; From: William Lyu &lt;<a href=3D"mailto:Willia=
m.Lyu@windriver.com" target=3D"_blank">William.Lyu@windriver.com</a>&gt;<br=
>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Signed-off-by: William Lyu &lt;<a href=3D"mail=
to:William.Lyu@windriver.com" target=3D"_blank">William.Lyu@windriver.com</=
a>&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 .../recipes-utils/e2tools/<a href=
=3D"http://e2tools_git.bb" rel=3D"noreferrer" target=3D"_blank">e2tools_git=
.bb</a>=C2=A0 =C2=A0 =C2=A0 | 51<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; ++++++++++++++++++-<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 .../recipes-utils/e2tools/files/r=
un-ptest=C2=A0 =C2=A0 =C2=A0|=C2=A0 5 ++<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 2 files changed, 54 insertions(+)=
, 2 deletions(-)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 create mode 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; meta-filesystems/recipes-utils/e2tools/files/r=
un-ptest<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/meta-filesystems/recipes-utils/e2=
tools/<a href=3D"http://e2tools_git.bb" rel=3D"noreferrer" target=3D"_blank=
">e2tools_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta-filesystems/recipes-utils/e2tools/<a hr=
ef=3D"http://e2tools_git.bb" rel=3D"noreferrer" target=3D"_blank">e2tools_g=
it.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index caf0025c8..a80b6f598 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- a/meta-filesystems/recipes-utils/e2tools/<=
a href=3D"http://e2tools_git.bb" rel=3D"noreferrer" target=3D"_blank">e2too=
ls_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/meta-filesystems/recipes-utils/e2tools/<=
a href=3D"http://e2tools_git.bb" rel=3D"noreferrer" target=3D"_blank">e2too=
ls_git.bb</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -9,17 +9,64 @@ SECTION =3D &quot;base&quot;=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 LICENSE =3D &quot;GPL-2.0-only&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 LIC_FILES_CHKSUM =3D<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;file://COPYING;md5=3Db234ee4d69f5fce4486=
a80fdaf4a4263&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -DEPENDS +=3D &quot;e2fsprogs&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +DEPENDS +=3D &quot;coreutils e2fsprogs&quot;<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 PV =3D &quot;0.1.0+git&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 SRC_URI =3D &quot; \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; git://<a href=3D"http://github.com/e2tools/e2t=
ools;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_blank"=
>github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dmaster</a> \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://run-ptest \<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 &quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 SRCREV =3D &quot;fd092754a6b65c3a=
769f74f888668c066f09c36d&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 S =3D &quot;${WORKDIR}/git&quot;<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -inherit autotools pkgconfig<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +inherit autotools pkgconfig ptest<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +do_configure:prepend() {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 git -C &quot;${WORKDIR}/git&quo=
t; reset --hard HEAD<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 # To install ptest for this pac=
kage, special configuration<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; needs to be<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 # done before do_configure(). S=
o, do_configure_ptest() which<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; is scheduled<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 # after do_configure() cannot b=
e used.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 # We only do special configurat=
ion if we are installing ptest<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; for this<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 # package.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 if [ &quot;${@d.getVar(&#39;PTE=
ST_ENABLED&#39;)}&quot; -eq &quot;1&quot; ]; then<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Since we guaran=
tee run-time dependency when installing<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; the ptest for<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # this package, w=
e do not need the check macros under<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; section &quot;checks<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # for programs&qu=
ot; in &quot;<a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_=
blank">configure.ac</a>&quot;. Plus, these check<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; macros set the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # ouput variables=
 to incorrect values as these checks are<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; performed on<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # the host enviro=
nment. Still, we need these variables<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; outputted from<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # these check mac=
ros. So, we insert the following lines to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; manually<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # set these outpu=
t variables to the correct value in<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; &quot;<a href=3D"http://configure.ac" rel=3D"n=
oreferrer" target=3D"_blank">configure.ac</a>&quot;.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # Note that HAVE_=
DD_COMMAND and HAVE_MKE2FS_COMMAND are<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; only ever used<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # in tests/Makefi=
le-files which determines whether to<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; include the test<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # cases. As for o=
utput variables CHMOD, DD, and MKE2FS,<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; they only<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # point to the pr=
ograms which test cases need to run.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Since these<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # commands are gu=
aranteed to be present due to RDEPENDS<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; and are<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # guaranteed to b=
e accessible under PATH environment<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; variable on the<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # target, we only=
 need to specify the name of these programs.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 perl -i -0777 -pe=
 &#39;s/(^dnl\s*=3D+\s*^dnl\s*Checks for<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; compiler flags\s*^dnl\s*=3D+)/<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +AC_SUBST([CHMOD], &#39;chmod&#39;)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +AC_SUBST([DD], &#39;dd&#39;)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +AC_SUBST([MKE2FS], &#39;mke2fs&#39;)<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])=
<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +\1/ms&#39; &quot;${WORKDIR}/git/<a href=3D"ht=
tp://configure.ac" rel=3D"noreferrer" target=3D"_blank">configure.ac</a>&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 fi<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +do_install_ptest() {<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 rm -rf &quot;${D}${PTEST_PATH}/=
*&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 cp -r ../build &quot;${D}${PTES=
T_PATH}&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 cp -r &quot;${S}/build-aux&quot=
; &quot;${D}${PTEST_PATH}/build&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 cp -r &quot;${S}&quot; &quot;${=
D}${PTEST_PATH}&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +}<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +RDEPENDS:${PN}-ptest +=3D &quot;bash coreutil=
s e2fsprogs e2tools gawk<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; make perl&quot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;=C2=A0 =C2=A0 BBCLASSEXTEND =3D &quot;native&qu=
ot;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; diff --git a/meta-filesystems/recipes-utils/e2=
tools/files/run-ptest<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; b/meta-filesystems/recipes-utils/e2tools/files=
/run-ptest<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; new file mode 100644<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; index 000000000..3d4dd9cf3<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --- /dev/null<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +++ b/meta-filesystems/recipes-utils/e2tools/f=
iles/run-ptest<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; @@ -0,0 +1,5 @@<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +#!/bin/sh<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +set -e<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; +make -C build check<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; --<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; 2.43.0<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<=
br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Links: You receive all messages sent to this g=
roup.<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; View/Reply Online (#108987):<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108987" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108987</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Mute This Topic: <a href=3D"https://lists.open=
embedded.org/mt/104508347/1997914" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.openembedded.org/mt/104508347/1997914</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Group Owner: <a href=3D"mailto:openembedded-de=
vel%2Bowner@lists.openembedded.org" target=3D"_blank">openembedded-devel+ow=
ner@lists.openembedded.org</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; Unsubscribe:<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.=
openembedded.org/g/openembedded-devel/unsub</a><br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<=
br>
</blockquote></div></div>

--000000000000e271c7061300169f--

