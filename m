Return-Path: <jaminlin1207@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A19CC5320E
	for <webhook@archiver.kernel.org>; Thu, 22 Aug 2024 09:56:32 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.9682.1724320586618348952
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Aug 2024 02:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AAVTE5cE;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: jaminlin1207@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-39d2e4d73bcso2477625ab.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 02:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724320586; x=1724925386; darn=lists.openembedded.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcMYIr8ucyS1S+1OfqJ7fGFBP45utMV8g95nNtfoxYw=;
        b=AAVTE5cEWAA20iAqc707efdv9OMU7apGOX/6kzMXXgQoficLt2KJs/91Tg26oPTTBj
         K4cnuUE+1y1xQBPxD/vOGQJ4RizuCjsp7/igxW6U/XsN3c5gjaLvQ9weGUtSB/bybPbA
         YJhQLyPbkkXYw8vfYd21lYiKKoAHdlAyw+9o50UItydF0nuedZZvtjmWtKuEkYPDJY9z
         iWWx1PA0/0cFSxJaGaZIYRz+68u7lkTsD3Z1Lo798aYpCmQd+lqfAYX2dAXKisoMEzCl
         tm7tygMxf5kp6K+t2+jHH6mP0EVNO6InxkCwXzogcpYvMnFnAbVtFS2uU0HCM7GI+xY9
         C4aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724320586; x=1724925386;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NcMYIr8ucyS1S+1OfqJ7fGFBP45utMV8g95nNtfoxYw=;
        b=J51sK2IqGZ62CS0LMHC+AeDN5sYlH1KqSztCVVZTIKiXs4bQa6quZVb/6B+ypPRmOh
         H9t+qvyBMZLxKS/SboLgKAZ0vEtYxkMyX0Ljf4B8D1SB1s3CWFhc16yBlrLmojOy97cq
         HXCfoem+iI81dVQWd8FdBvsDjhmtCtTTnEjBY0NAhWjDqiuFtrsBNq4xaygAalVGGwRT
         hZ5/gjTPKKl1Bqwfr/j+++t7sGJfRug8cNKjQz5wLeRj4aRqJGJSDwoX+pAGyzxGKeOC
         DFHa+4pgCUfcaBxGn21Xjd2x1SAAQUYFxNfkaqgFW/2nAImsN5YB/Y0hFRWLk/O53jTq
         8bMg==
X-Gm-Message-State: AOJu0YyzDZN8gLJRFY12x/J4e+159xcvuJPUFXw4ZCQlBdOHL8JeF5EP
	qb/SYdWFjF6phw80qITJUo02yi/m6ZZ1tyoVM4wE/98a8m1bIUyTR/EtXsM9roxOFKVI1vmOmeW
	KrWmvm1XEyOC4jYDbWp/GUJFvCcQk8/rR
X-Google-Smtp-Source: AGHT+IF232DmjKSGorOi1ku4VcjKSWngRgqKvgh4TfOo70xt4SFjy2Kw6UVpPTH3es5sVAPB9+X8kLR9I3Lvfs4Q3xU=
X-Received: by 2002:a05:6e02:1e0d:b0:39d:3c61:cfe1 with SMTP id
 e9e14a558f8ab-39d6c3b1746mr65086715ab.17.1724320585603; Thu, 22 Aug 2024
 02:56:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240820054044.1538795-1-jamin_lin@aspeedtech.com>
 <20240820054044.1538795-3-jamin_lin@aspeedtech.com> <CAMKF1spTFR5anMr8isUP+r1XJSj5xYe-c=CVSGv0nVwhJBcVAQ@mail.gmail.com>
In-Reply-To: <CAMKF1spTFR5anMr8isUP+r1XJSj5xYe-c=CVSGv0nVwhJBcVAQ@mail.gmail.com>
From: =?UTF-8?B?5p6X5bu65piO?= <jaminlin1207@gmail.com>
Date: Thu, 22 Aug 2024 17:56:16 +0800
Message-ID: <CA+8rw5x=Q3wOd0LjtH-+x_xcvQwuKp6Rmr+3BcVj9gFDaTQRAg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] meta-oe:drgn: add new recipe
To: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 22 Aug 2024 09:56:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111903

Hi Khem Raj

Khem Raj <raj.khem@gmail.com>=EF=BC=9A
>
> this seems to fail with clang and llvm provided libomp  see
>
Thanks for review.
Sorry for lost to test Yoe DISTRO Features about clang toolchain.
I re-send v2 patch to fix it.

Drgn depends on:
openmp
a. clang toolchain should use libomp(openmp) from meta-clang
b. gnu gcc toolchain should use libgomp(gcc-runtime) from openembedded-core

Thanks-Jamin

> https://errors.yoctoproject.org/Errors/Details/798433/
>
> On Mon, Aug 19, 2024 at 10:40=E2=80=AFPM Jamin Lin via lists.openembedded=
.org
> <jamin_lin=3Daspeedtech.com@lists.openembedded.org> wrote:
> >
> > drgn is a debugger with an emphasis on programmability
> > drgn exposes the types and variables in a program
> > for easy, expressive scripting in Python.
> >
> > Drgn depends on:
> > 1. python3
> > 2. elfutils
> >
> > The build requires:
> > 1. setuptools
> > 2. automake
> > 3. autoconf
> > 4. libtool
> > 5. pkgconf
> >
> > Reference:
> > https://drgn.readthedocs.io/en/latest/installation.html
> >
> > Signed-off-by: Jamin Lin <jamin_lin@aspeedtech.com>
> > ---
> >  .../drgn/python3-drgn_0.0.27.bb               | 69 +++++++++++++++++++
> >  1 file changed, 69 insertions(+)
> >  create mode 100644 meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
> >
> > diff --git a/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb b/meta-=
oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
> > new file mode 100644
> > index 000000000..5c0dbe963
> > --- /dev/null
> > +++ b/meta-oe/recipes-kernel/drgn/python3-drgn_0.0.27.bb
> > @@ -0,0 +1,69 @@
> > +SUMMARY =3D "drgn (pronounced dragon) is a debugger with an emphasis o=
n  \
> > +programmability. drgn exposes the types and variables in a program for=
 easy, \
> > +expressive scripting in Python."
> > +HOMEPAGE =3D "https://github.com/osandov/drgn"
> > +LICENSE =3D " LGPL-2.1-or-later"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D7c83d30e99508d6b790eacdd3ab=
ab846"
> > +
> > +SRC_URI =3D "git://github.com/osandov/drgn.git;protocol=3Dhttps;branch=
=3Dmain"
> > +SRCREV =3D "a8dfc9e31f551d4b3c3d4307fa19ab6b3bfafb1c"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +DEPENDS =3D "\
> > +    autoconf-native \
> > +    automake-native \
> > +    libtool-native \
> > +    elfutils \
> > +    "
> > +
> > +RDEPENDS:${PN} =3D "\
> > +    python3-crypt \
> > +    python3-io \
> > +    python3-logging \
> > +    python3-math \
> > +    python3-pickle \
> > +    python3-stringold \
> > +    python3-compression \
> > +    "
> > +
> > +RDEPENDS:${PN}:append:class-target =3D "\
> > +    libdw \
> > +    libelf \
> > +    libgomp \
> > +    "
> > +
> > +RDEPENDS:${PN}:append:class-native =3D "\
> > +    elfutils-native \
> > +    "
> > +
> > +RDEPENDS:${PN}:append:class-nativesdk =3D "\
> > +    nativesdk-elfutils \
> > +    "
> > +
> > +export CONFIGURE_FLAGS =3D "\
> > +    --build=3D${BUILD_SYS}, \
> > +    --host=3D${HOST_SYS}, \
> > +    --target=3D${TARGET_SYS}, \
> > +    --prefix=3D${prefix}, \
> > +    --exec_prefix=3D${exec_prefix}, \
> > +    --bindir=3D${bindir}, \
> > +    --sbindir=3D${sbindir}, \
> > +    --libexecdir=3D${libexecdir}, \
> > +    --datadir=3D${datadir}, \
> > +    --sysconfdir=3D${sysconfdir}, \
> > +    --sharedstatedir=3D${sharedstatedir}, \
> > +    --localstatedir=3D${localstatedir}, \
> > +    --libdir=3D${libdir}, \
> > +    --includedir=3D${includedir}, \
> > +    --oldincludedir=3D${includedir}, \
> > +    --infodir=3D${infodir}, \
> > +    --mandir=3D${mandir}, \
> > +    --with-libtool-sysroot=3D${STAGING_DIR_HOST} \
> > +    "
> > +
> > +export PYTHON_CPPFLAGS =3D "-I${STAGING_INCDIR}/${PYTHON_DIR}"
> > +
> > +inherit python3native pkgconfig setuptools3
> > +
> > +BBCLASSEXTEND =3D "native nativesdk"
> > --
> > 2.25.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111862): https://lists.openembedded.org/g/openembed=
ded-devel/message/111862
> > Mute This Topic: https://lists.openembedded.org/mt/107995862/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

