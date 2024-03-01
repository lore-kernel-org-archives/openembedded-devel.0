Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2596FC5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 21:53:07 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
 by mx.groups.io with SMTP id smtpd.web10.36323.1709329981860508546
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 13:53:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gLj7vdHU;
 spf=pass (domain: gmail.com, ip: 209.85.210.42, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6dc8b280155so1994663a34.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 13:53:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709329981; x=1709934781; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJySSTn3GZEWi2OQTOWxyITNhTJvH6fSJeTQY0H2GQA=;
        b=gLj7vdHUd36enF7npWugo7tlFYTCBbmiTJ3JpO7SAEi5ocE3YVcT3W5dXRsiOGQTo4
         +QC3gCyeNr9G3EhGAOCjLRVze39g+kZy+40ZAcl/JYXvSRN+c+YjBC9UIK2f/wRutbFx
         8Vg1OpVR/ubimU8KrClYlInj2M/Ti7YzANs9F3f/UwJGZzekVN6gv14VOalLATIaK6Qu
         Ynuxvu5T+nXrRq8F/mRCxzA7+gPpxjmwwQnzd+W3JsZJ2iqXhjwI9r31Xe177ll4/JJG
         GagEl4Dim4Jqnj+98fFVp42lGba2ga+m6/yo1P+RSTw3HhTl4vPRM7+qf541l3+FwpXY
         Zi2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709329981; x=1709934781;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJySSTn3GZEWi2OQTOWxyITNhTJvH6fSJeTQY0H2GQA=;
        b=MNqIWUFByHPjRzHfsaZA5tJ2cwCi3YDyJQQ7xeFUllwHQgMj0DRzvkEZo0asRGXX3B
         7UkhpKVPZjBezgEbL2C60cX1TFds4MkQNpIFGCDsO69wK9IUDlsPzNq8jovYKsk7rfA1
         uWJJTPnobQV0xdb+dQ4zPpyqC7/fmwvtfeI6AONYn4YP9wll9YPQ0CHpXtNDpwzWmRma
         Tdi9xpRgqojIM34e4vpr6DWYEkRwBBL5W8RzqdZeVq5ui7RWvgDNSL7Fg/NNK/y4uIgS
         H4s0aoNNo7Sr4dFhOcwEEzXuXWpne1SXq6fnGmx5+48BLjZ7RUrctgGxQ2h5UbevB8bu
         0kyA==
X-Gm-Message-State: AOJu0YxQljs5v8qKxSg9lRJGmT99hsquJk3sWYmVLS1HZMgoDXTPdzIE
	hC5MF+/0tD+doioyIyLUjRkMusFvNDAVs7TKh92ftAaeiJ/abV5nm0nsuu5UG66/Zgs2uA6DnDx
	S7nvvFiXffTXQIhiVNjZ+/PIo6OQ7/EcW
X-Google-Smtp-Source: AGHT+IHPMMFSmnWn/vStKzZ62//AIhe9O7DEpD8qjCIKQvxoy963xHPT9fZSKm0TZ2F+wtql49oatuGM+lj/gRc03v0=
X-Received: by 2002:a05:6870:a2d0:b0:21f:abc8:d210 with SMTP id
 w16-20020a056870a2d000b0021fabc8d210mr3172850oak.8.1709329980876; Fri, 01 Mar
 2024 13:53:00 -0800 (PST)
MIME-Version: 1.0
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
 <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com> <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
In-Reply-To: <LV3PR11MB8767C8BB2545D95BF7131C3FEE5E2@LV3PR11MB8767.namprd11.prod.outlook.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2024 13:52:34 -0800
Message-ID: <CAMKF1spywovBtYyEUOd5paR-4sSpe-aXLe8tY2jzg13mvSO03g@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
To: "Lyu, William" <William.Lyu@windriver.com>
Cc: "openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 21:53:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109085

On Fri, Mar 1, 2024 at 12:20=E2=80=AFPM Lyu, William <William.Lyu@windriver=
.com> wrote:
>
> > I am running into this error on some builders on AB
> >
> > stdio: ERROR: Task
> > (/home/pokybuild/yocto-worker/meta-oe/build/meta/recipes-support/libexi=
f/libexif_0.6.24.bb:do_package_qa)
> > failed with exit code '1'
> > stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: QA Issue:
> > /usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained in
> > package e2tools-ptest requires /usr/bin/sh, but no providers found in
> > RDEPENDS:e2tools-ptest? [file-rdeps]
>
> File "update.sample" is from ".git" directory. I do not actually need thi=
s
> file or anything from ".git" directory. I only need the source tree for p=
test
> to run.
>
> However, I am a bit confused about this QA issue because:
> -   I do not see any file that has "#!/usr/bin/sh". Even "update.sample" =
has
>     "#!/bin/sh" as the first line. There are files in the source tree (no=
t
>     under ".git" directory) that have "#!/bin/sh" as the first line.
> -   "/bin/sh" is referring to the default POSIX shell, and the "bash" in =
the
>     RDEPENDS:e2tools-ptest should already fulfill this runtime dependency=
,
> -   I am not yet able to reproduce this issue using poky. I assume this i=
s
>     because the QA Issue checker "file-rdeps" in poky do not check "sh" b=
y
>     default (excerpt taken from "meta/classes-global/insane.bbclass"):
>
>     if "file-rdeps" not in skip:
>         ignored_file_rdeps =3D set(['/bin/sh', '/usr/bin/env', 'rtld(GNU_=
HASH)'])
>         if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True, False, =
d):
>             ignored_file_rdeps |=3D set(['/usr/bin/sh'])
>         if bb.data.inherits_class('nativesdk', d):
>             ignored_file_rdeps |=3D set(['/bin/bash', '/usr/bin/perl', 'p=
erl'])
>             if bb.utils.contains('DISTRO_FEATURES', 'usrmerge', True, Fal=
se, d):
>                 ignored_file_rdeps |=3D set(['/usr/bin/bash'])
>
> William

what distro features do you have enabled ? perhaps try it with and
without usermerge in DISTRO_FEATURES
and rebuild this package after doing cleansstate to ensure its being
rebuilt in both cases.

>
> > stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: Fatal QA errors were
> > found, failing task.
> > stdio: ERROR: Logfile of failure stored in:
> > /home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky=
-linux/e2tools/0.1.0+git/temp/log.do_package_qa.3114961
> >
> > On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, William via
> > lists.openembedded.org
> > <william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
> >>
> >> From: William Lyu <William.Lyu@windriver.com>
> >>
> >> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> >> ---
> >>  .../recipes-utils/e2tools/e2tools_git.bb      | 51 ++++++++++++++++++=
-
> >>  .../recipes-utils/e2tools/files/run-ptest     |  5 ++
> >>  2 files changed, 54 insertions(+), 2 deletions(-)
> >>  create mode 100644 meta-filesystems/recipes-utils/e2tools/files/run-p=
test
> >>
> >> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/m=
eta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >> index caf0025c8..a80b6f598 100644
> >> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> >> @@ -9,17 +9,64 @@ SECTION =3D "base"
> >>  LICENSE =3D "GPL-2.0-only"
> >>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf=
4a4263"
> >>
> >> -DEPENDS +=3D "e2fsprogs"
> >> +DEPENDS +=3D "coreutils e2fsprogs"
> >>
> >>  PV =3D "0.1.0+git"
> >>
> >>  SRC_URI =3D " \
> >>             git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=
=3Dmaster \
> >> +           file://run-ptest \
> >>  "
> >> +
> >>  SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
> >>
> >>  S =3D "${WORKDIR}/git"
> >>
> >> -inherit autotools pkgconfig
> >> +inherit autotools pkgconfig ptest
> >> +
> >> +do_configure:prepend() {
> >> +    git -C "${WORKDIR}/git" reset --hard HEAD
> >> +
> >> +    # To install ptest for this package, special configuration needs =
to be
> >> +    # done before do_configure(). So, do_configure_ptest() which is s=
cheduled
> >> +    # after do_configure() cannot be used.
> >> +
> >> +    # We only do special configuration if we are installing ptest for=
 this
> >> +    # package.
> >> +    if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; then
> >> +        # Since we guarantee run-time dependency when installing the =
ptest for
> >> +        # this package, we do not need the check macros under section=
 "checks
> >> +        # for programs" in "configure.ac". Plus, these check macros s=
et the
> >> +        # ouput variables to incorrect values as these checks are per=
formed on
> >> +        # the host environment. Still, we need these variables output=
ted from
> >> +        # these check macros. So, we insert the following lines to ma=
nually
> >> +        # set these output variables to the correct value in "configu=
re.ac".
> >> +
> >> +        # Note that HAVE_DD_COMMAND and HAVE_MKE2FS_COMMAND are only =
ever used
> >> +        # in tests/Makefile-files which determines whether to include=
 the test
> >> +        # cases. As for output variables CHMOD, DD, and MKE2FS, they =
only
> >> +        # point to the programs which test cases need to run. Since t=
hese
> >> +        # commands are guaranteed to be present due to RDEPENDS and a=
re
> >> +        # guaranteed to be accessible under PATH environment variable=
 on the
> >> +        # target, we only need to specify the name of these programs.
> >> +
> >> +        perl -i -0777 -pe 's/(^dnl\s*=3D+\s*^dnl\s*Checks for compile=
r flags\s*^dnl\s*=3D+)/
> >> +AC_SUBST([CHMOD], 'chmod')
> >> +AC_SUBST([DD], 'dd')
> >> +AC_SUBST([MKE2FS], 'mke2fs')
> >> +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
> >> +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
> >> +\1/ms' "${WORKDIR}/git/configure.ac"
> >> +    fi
> >> +}
> >> +
> >> +do_install_ptest() {
> >> +    rm -rf "${D}${PTEST_PATH}/*"
> >> +    cp -r ../build "${D}${PTEST_PATH}"
> >> +    cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
> >> +    cp -r "${S}" "${D}${PTEST_PATH}"
> >> +}
> >> +
> >> +RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk make=
 perl"
> >>
> >>  BBCLASSEXTEND =3D "native"
> >> diff --git a/meta-filesystems/recipes-utils/e2tools/files/run-ptest b/=
meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >> new file mode 100644
> >> index 000000000..3d4dd9cf3
> >> --- /dev/null
> >> +++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
> >> @@ -0,0 +1,5 @@
> >> +#!/bin/sh
> >> +
> >> +set -e
> >> +
> >> +make -C build check
> >> --
> >> 2.43.0
> >>
> >>
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> Links: You receive all messages sent to this group.
> >> View/Reply Online (#108987): https://lists.openembedded.org/g/openembe=
dded-devel/message/108987
> >> Mute This Topic: https://lists.openembedded.org/mt/104508347/1997914
> >> Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub=
 [raj.khem@gmail.com]
> >> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

