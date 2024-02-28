Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83B16C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 16:05:56 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.348.1709136350074160194
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 28 Feb 2024 08:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WiQ2ELdy;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c1a7d51fb5so1877905b6e.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 08:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709136349; x=1709741149; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E8sHFSMC4f1OvdiJHuKw14GBsrWYbGxazWw2n2QkZEo=;
        b=WiQ2ELdykJlaP9ierUxs3rMP+mpgmqgD0Uth0uMem2k39QayhbKvE9T4L938D3LwYs
         srDl2IZ3/+9GMbh9k7cLiMXax36TMpS0kgW6wHTf5m/iceWBkhgtk3JOvtxW6wbf0ebl
         6Z03TWLme8g4zHkqYdUXZparKBUN5QlwENFqVyQSd5pyw40sgq3NQy1+eKpABsvz9JNf
         PtiX6lRL3kSoZIL3x5y7VfLf+Ix31uLGRHHJQOFFsG6r0bDTGJz4ZcreCV8cTq+AuMtA
         O60Z5t+9Fl/hOOrCIvpND9+/oeEWPVVaibE5T4qNgsJxMYzV2a8mTdgAHOOxW0+MVl1a
         W2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136349; x=1709741149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E8sHFSMC4f1OvdiJHuKw14GBsrWYbGxazWw2n2QkZEo=;
        b=Gps/MR+vV6KHhtF95CJP8mZfObsd9ZZrFzfCU9spDAFxD4iryRAkL7dlCNIwPufeON
         XaTRHN9KAL+PwIOSB0jgi4QzwMqUtlESghobnaFcFS5y+DnJAiZ9N+Uu7f5bceJgiTOA
         WTspQlHQmyVZKTAS1KkuWp2TlvE40K6NA5krSfS7IWLP6YDh8L2LyA82bOWUKj3ztUti
         6pJ0e0fnzeN0EbCgOwLewjs1iTQm3gWFS+v4TznbepwiJFa21fjgWjryNVdtdi59W921
         4xaDRnXFaEP2o3uQpFkiicohDaH7kr9r2+zPe+o17sapPYj7tTNvM01PKl3X528QGR5u
         nbIA==
X-Gm-Message-State: AOJu0Yz6BbdvhR0DniU5tBPPwqNC1sC2DNzVLCJ/F6JrM3DXVrMOaI+T
	1KMzFo3lXrinpaHnsXF8w1qaz42dKI7R6W3XfYFWAsegm1uAawmXBzZbwe3IAcWIDDFa90FIcDJ
	KPDG/PbeuHqW6eynmta1sbDZ5zr8=
X-Google-Smtp-Source: AGHT+IFeSLIk0FI/pXBGGQlTlUTp8TGbHQEzEvFOFeMGud7BlJwiskf1xbnbx+hNsNnPRp89DgUOMxyi7yJIbquhvUE=
X-Received: by 2002:a05:6871:3795:b0:21f:c7a2:909b with SMTP id
 nq21-20020a056871379500b0021fc7a2909bmr145025oac.26.1709136348977; Wed, 28
 Feb 2024 08:05:48 -0800 (PST)
MIME-Version: 1.0
References: <20240222134140.2367805-1-William.Lyu@windriver.com>
In-Reply-To: <20240222134140.2367805-1-William.Lyu@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 28 Feb 2024 08:05:22 -0800
Message-ID: <CAMKF1spgXkbYj446g_ujSO41hrR9kUx14SF-iyw1y33-4Y7x3g@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH] e2tools: Add ptest
To: william.lyu@windriver.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 28 Feb 2024 16:05:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109053

I am running into this error on some builders on AB

stdio: ERROR: Task
(/home/pokybuild/yocto-worker/meta-oe/build/meta/recipes-support/libexif/li=
bexif_0.6.24.bb:do_package_qa)
failed with exit code '1'
stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: QA Issue:
/usr/lib/e2tools/ptest/git/.git/hooks/update.sample contained in
package e2tools-ptest requires /usr/bin/sh, but no providers found in
RDEPENDS:e2tools-ptest? [file-rdeps]
stdio: ERROR: e2tools-0.1.0+git-r0 do_package_qa: Fatal QA errors were
found, failing task.
stdio: ERROR: Logfile of failure stored in:
/home/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/core2-64-poky-lin=
ux/e2tools/0.1.0+git/temp/log.do_package_qa.3114961

On Thu, Feb 22, 2024 at 5:56=E2=80=AFAM Lyu, William via
lists.openembedded.org
<william.lyu=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: William Lyu <William.Lyu@windriver.com>
>
> Signed-off-by: William Lyu <William.Lyu@windriver.com>
> ---
>  .../recipes-utils/e2tools/e2tools_git.bb      | 51 ++++++++++++++++++-
>  .../recipes-utils/e2tools/files/run-ptest     |  5 ++
>  2 files changed, 54 insertions(+), 2 deletions(-)
>  create mode 100644 meta-filesystems/recipes-utils/e2tools/files/run-ptes=
t
>
> diff --git a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb b/meta=
-filesystems/recipes-utils/e2tools/e2tools_git.bb
> index caf0025c8..a80b6f598 100644
> --- a/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> +++ b/meta-filesystems/recipes-utils/e2tools/e2tools_git.bb
> @@ -9,17 +9,64 @@ SECTION =3D "base"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>
> -DEPENDS +=3D "e2fsprogs"
> +DEPENDS +=3D "coreutils e2fsprogs"
>
>  PV =3D "0.1.0+git"
>
>  SRC_URI =3D " \
>             git://github.com/e2tools/e2tools;protocol=3Dhttps;branch=3Dma=
ster \
> +           file://run-ptest \
>  "
> +
>  SRCREV =3D "fd092754a6b65c3a769f74f888668c066f09c36d"
>
>  S =3D "${WORKDIR}/git"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig ptest
> +
> +do_configure:prepend() {
> +    git -C "${WORKDIR}/git" reset --hard HEAD
> +
> +    # To install ptest for this package, special configuration needs to =
be
> +    # done before do_configure(). So, do_configure_ptest() which is sche=
duled
> +    # after do_configure() cannot be used.
> +
> +    # We only do special configuration if we are installing ptest for th=
is
> +    # package.
> +    if [ "${@d.getVar('PTEST_ENABLED')}" -eq "1" ]; then
> +        # Since we guarantee run-time dependency when installing the pte=
st for
> +        # this package, we do not need the check macros under section "c=
hecks
> +        # for programs" in "configure.ac". Plus, these check macros set =
the
> +        # ouput variables to incorrect values as these checks are perfor=
med on
> +        # the host environment. Still, we need these variables outputted=
 from
> +        # these check macros. So, we insert the following lines to manua=
lly
> +        # set these output variables to the correct value in "configure.=
ac".
> +
> +        # Note that HAVE_DD_COMMAND and HAVE_MKE2FS_COMMAND are only eve=
r used
> +        # in tests/Makefile-files which determines whether to include th=
e test
> +        # cases. As for output variables CHMOD, DD, and MKE2FS, they onl=
y
> +        # point to the programs which test cases need to run. Since thes=
e
> +        # commands are guaranteed to be present due to RDEPENDS and are
> +        # guaranteed to be accessible under PATH environment variable on=
 the
> +        # target, we only need to specify the name of these programs.
> +
> +        perl -i -0777 -pe 's/(^dnl\s*=3D+\s*^dnl\s*Checks for compiler f=
lags\s*^dnl\s*=3D+)/
> +AC_SUBST([CHMOD], 'chmod')
> +AC_SUBST([DD], 'dd')
> +AC_SUBST([MKE2FS], 'mke2fs')
> +AM_CONDITIONAL([HAVE_DD_COMMAND], [true])
> +AM_CONDITIONAL([HAVE_MKE2FS_COMMAND], [true])
> +\1/ms' "${WORKDIR}/git/configure.ac"
> +    fi
> +}
> +
> +do_install_ptest() {
> +    rm -rf "${D}${PTEST_PATH}/*"
> +    cp -r ../build "${D}${PTEST_PATH}"
> +    cp -r "${S}/build-aux" "${D}${PTEST_PATH}/build"
> +    cp -r "${S}" "${D}${PTEST_PATH}"
> +}
> +
> +RDEPENDS:${PN}-ptest +=3D "bash coreutils e2fsprogs e2tools gawk make pe=
rl"
>
>  BBCLASSEXTEND =3D "native"
> diff --git a/meta-filesystems/recipes-utils/e2tools/files/run-ptest b/met=
a-filesystems/recipes-utils/e2tools/files/run-ptest
> new file mode 100644
> index 000000000..3d4dd9cf3
> --- /dev/null
> +++ b/meta-filesystems/recipes-utils/e2tools/files/run-ptest
> @@ -0,0 +1,5 @@
> +#!/bin/sh
> +
> +set -e
> +
> +make -C build check
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108987): https://lists.openembedded.org/g/openembedde=
d-devel/message/108987
> Mute This Topic: https://lists.openembedded.org/mt/104508347/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [r=
aj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

