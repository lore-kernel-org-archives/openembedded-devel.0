Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36232C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 14:57:31 +0000 (UTC)
Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
 by mx.groups.io with SMTP id smtpd.web11.18506.1704812242275754344
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 06:57:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RTSXNcaf;
 spf=pass (domain: gmail.com, ip: 209.85.161.44, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-595d24ad466so1806695eaf.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 06:57:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704812241; x=1705417041; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkThSKNc5+JOr0uJi+2/PyzRtCXm3/3Ua4qJvbdNNBc=;
        b=RTSXNcafQN7HMShlHhPUfpfw3/nFL5OqYN3vuJQd35TSlFDvMAsjPqowgxeiCMTRcn
         Ua9D5dAh8yO3S2poAGyVExi1GODIIwk1qq8ZHc5sS7JVZ/7Ap/Gp+ej7IwqXewipszkp
         PCwg3HBtjqOQMWCzqymoddGg+mNxkQrI4M2C/MlyrW50Lkjhoq1XSH/MW1e94pZodDXx
         dQQKmWGAs861VCTHXOLRX6WsFhe7u/Cj9Z4mcwFMfjNQ5b1RkeNp3ur+3eyEnZN9MbGa
         UkTbuVFRIigDRyaqpSxw5tdX/8qHaqANh5/cukwR2JNknwj1N/0yDpNCqxdHqV4jAi+0
         5uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704812241; x=1705417041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XkThSKNc5+JOr0uJi+2/PyzRtCXm3/3Ua4qJvbdNNBc=;
        b=JR88FOACPfebC+7quFS1nqkMzFmIKwRMk4SaImGymhIOzGgV4Vav00Ey1MinljUas4
         lEUJMWv7rgMlJfpnMf/QAw1Z10HriYCEY6MtqPHnhxv+V+OS5fKEAe/xJMew2CXQxrNo
         xxkVJ7nDG7DzU8hznsKTFV/Xp8gvhU1Zy6q1Ni3/i8TPDzp/tGLsuSR1HJMQz83N03yb
         g5FQhkPar9Eoc/bRvVY1fmiADjiGdRO+XLpmX27KlHO+ylmIlQPaOReDhOHVV4LIGFOg
         vpbgB/wSnfRda89wV/QtVLwlrVabzyk/Fzwky1sAc4Kxjppd6pdoIM3k7PjUtGVpAu3M
         evMQ==
X-Gm-Message-State: AOJu0YzozVm2ICsK+t2oPfjft7lcGzN2GaCIzUefWX6Br90+3T5Zr6wC
	5fJu87A8oa6rz8F1EHUcHpyKppHaEccIqHiojfk=
X-Google-Smtp-Source: AGHT+IF3NORVq3q2eHLSoXWbN7ZonNYh/v7fSO3gUTXL03mbLKd+dj3iF/k2sYntYJm3EnwgzNVqkKTXioa5DMF3CbM=
X-Received: by 2002:a05:6870:35cf:b0:203:b5ec:ef08 with SMTP id
 c15-20020a05687035cf00b00203b5ecef08mr6207780oak.107.1704812241263; Tue, 09
 Jan 2024 06:57:21 -0800 (PST)
MIME-Version: 1.0
References: <20240105133611.3018041-1-alex@linutronix.de> <20240105133611.3018041-2-alex@linutronix.de>
 <CAMKF1srDmU9h8xP2JGX=6otiRGqVPKr4ZNX00bicU-R=C9ipmQ@mail.gmail.com> <CANNYZj8kkMN-dzw2YzXEQ1dTFo3d+Bg5jxSe9VCLDyF=DNFVPg@mail.gmail.com>
In-Reply-To: <CANNYZj8kkMN-dzw2YzXEQ1dTFo3d+Bg5jxSe9VCLDyF=DNFVPg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jan 2024 06:56:55 -0800
Message-ID: <CAMKF1sq4Da2ESxyO5vdrqiGfeCYptebHaYU4N0XA5m18wAkPWg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] python3-kivy: update 2.2.1 -> 2.3.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 14:57:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108196

On Tue, Jan 9, 2024 at 1:08=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> I think it's clang, so needs to be added to conf/nonclangable.conf?

yes, Although it will be good to report this error upstream, since
mixing const/non-const types can have
unintended consequences and result in subtle bugs.

>
> /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/python3-kivy/2.3=
.0/git/kivy/graphics/cgl_backend/cgl_gl.c:4549:52:
> error: incompatible function pointer types assigning to 'void
> (*)(GLuint, GLsizei, const GLchar **, const GLint *)' (aka 'void
> (*)(unsigned int, int, const char **, const int *)') from 'void
> (GLuint, GLsizei, const GLchar *const *, const GLint *)' (aka 'void
> (unsigned int, int, const char *const *, const int *)')
> [-Wincompatible-function-pointer-types]
>  4549 |   __pyx_v_4kivy_8graphics_3cgl_cgl->glShaderSource =3D glShaderSo=
urce;
>       |                                                    ^ ~~~~~~~~~~~~=
~~
>
> Note that this update is needed for both cython 3.x and python 3.12
> compatibility.
>
> Alex
>
> On Tue, 9 Jan 2024 at 04:32, Khem Raj <raj.khem@gmail.com> wrote:
> >
> > this fails to build here ( maybe its clang finding additional problems =
)
> >
> > https://sprunge.us/lq5PKS
> >
> > On Fri, Jan 5, 2024 at 5:36=E2=80=AFAM Alexander Kanavin <alex.kanavin@=
gmail.com> wrote:
> > >
> > > License-Update: years, mention that it is MIT at the start.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  .../python/{python3-kivy_2.2.1.bb =3D> python3-kivy_2.3.0.bb} | 6 ++=
+---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >  rename meta-python/recipes-devtools/python/{python3-kivy_2.2.1.bb =
=3D> python3-kivy_2.3.0.bb} (93%)
> > >
> > > diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.b=
b b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > > similarity index 93%
> > > rename from meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> > > rename to meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > > index a72ee14f6..0d4a1207f 100644
> > > --- a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> > > +++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > > @@ -2,7 +2,7 @@ SUMMARY =3D "Open source Python library for rapid dev=
elopment of applications \
> > >      that make use of innovative user interfaces, such as multi-touch=
 apps."
> > >  HOMEPAGE =3D "https://kivy.org/"
> > >  LICENSE =3D "MIT"
> > > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded5cd0f2cfda42852c332e3b8=
8c85fea"
> > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d3bc49400e35d5a2279d14c4=
0dcfb09"
> > >
> > >  inherit setuptools3 pkgconfig features_check
> > >  PIP_INSTALL_PACKAGE =3D "Kivy"
> > > @@ -11,11 +11,11 @@ PIP_INSTALL_PACKAGE =3D "Kivy"
> > >  # and mali-based OS's. We need to patch the setup file to tell Kivy =
setup
> > >  # that our machine has GLES libaries installed as well
> > >  # Also, if using SDL2 as backend, SDL2 needs to be configured with g=
les
> > > -SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=
=3Dstable \
> > > +SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=
=3Dmaster \
> > >             file://0001-add-support-for-glesv2.patch \
> > >             "
> > >
> > > -SRCREV =3D "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
> > > +SRCREV =3D "9ef218027178115a66b417ae34b21f488bdd3617"
> > >
> > >  S =3D "${WORKDIR}/git"
> > >
> > > --
> > > 2.39.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#108048): https://lists.openembedded.org/g/openemb=
edded-devel/message/108048
> > > Mute This Topic: https://lists.openembedded.org/mt/103542151/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >

