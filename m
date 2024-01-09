Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B8F7C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 15:02:51 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.18835.1704812564489069576
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 07:02:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TjatBqIr;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-204e1203a22so1591548fac.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 07:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704812564; x=1705417364; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHvAJVgs1J2JIFdmK3qb8I8HGw0ajW4wiqqSC4aVYb8=;
        b=TjatBqIr++qBZ8tavKD5tg05JeD3cohCnlDMcWsVcMB46qk+ZeTxXO+YIJS+M4ZEX6
         J8WK6h8sO1fGIdgFCqmeeVivzkwJ0LsvzTctLZKDLwbP7p7TKqntvhDqBHWz+NQmzXEu
         zxl2dMu7qUMbEkSIgVN1835Sxcq1G2eOYOtQWO/69X0ggkqoERywGu05dnNGtUrIAB0i
         BsHJXMlUGcO8jSIr6RIKxmKWv7SW0Pi8O16LiZPEOCQq7g5wRw7VoZKtXM2Cr63OJrr9
         sgbvsMkMlOeusB5MumR+bz85RmVmOoclGhrqyuKPGfOYeZb7u4T+6J379Z0OPQa8M5HL
         SLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704812564; x=1705417364;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iHvAJVgs1J2JIFdmK3qb8I8HGw0ajW4wiqqSC4aVYb8=;
        b=lAzvBYy42yx2GbmFJkk5eME1Pd3Wu5ZGwFv6/8KG/yDe5bE249fmA8JZf6EIX54966
         cA8NJ7K3J+AYE1RIKpw8yltmoCfm0Qw91EErONQ20d5daLbmWSO8kczL0ephbprpN11T
         A3I2nVzfmrVkR/eB2nv3VhVUfZX5TfPN1eP/o7gD+uJMlz8tmif3DQBCTDEXK3m94kdp
         ueK+u3g2HlFPO26zNKCsgocMz9yj9k/W8/Q1OgVEeC7E0EL/A8xOan4Qv7zS71AXSd01
         sBHCehoQE0TlSKtaDgvHT2/pAjIPz6/9G+8VK95eDZn+XjF6qoqNzI0pV2EpjLmelZKb
         NHJA==
X-Gm-Message-State: AOJu0YxXHIra1NjsXOFS2kdC4uvtXmVwr+zMZ4KCcVuQZSLnAtb/v7s5
	XwDZ/R+ulD9WA9Xv2EYvs0zXTY2lhNRwl5NzGBKJ3+D5WCZAgA==
X-Google-Smtp-Source: AGHT+IG1/Nd04hikZPMFtUllQ3Lw4Yg2Jh350pOXKEIa8wXgP204pzJ6IWu+i0GN+r8ohjkI5U1jFtF7+v5/LRjFtc0=
X-Received: by 2002:a05:6870:d1c7:b0:204:d5e:8a63 with SMTP id
 b7-20020a056870d1c700b002040d5e8a63mr6613171oac.108.1704812563460; Tue, 09
 Jan 2024 07:02:43 -0800 (PST)
MIME-Version: 1.0
References: <20240105133611.3018041-1-alex@linutronix.de> <20240105133611.3018041-2-alex@linutronix.de>
 <CAMKF1srDmU9h8xP2JGX=6otiRGqVPKr4ZNX00bicU-R=C9ipmQ@mail.gmail.com>
 <CANNYZj8kkMN-dzw2YzXEQ1dTFo3d+Bg5jxSe9VCLDyF=DNFVPg@mail.gmail.com> <CAMKF1sq4Da2ESxyO5vdrqiGfeCYptebHaYU4N0XA5m18wAkPWg@mail.gmail.com>
In-Reply-To: <CAMKF1sq4Da2ESxyO5vdrqiGfeCYptebHaYU4N0XA5m18wAkPWg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Jan 2024 07:02:17 -0800
Message-ID: <CAMKF1soqdtZKAXsSuZV4gOXTcxtoLBT5iLUXO7cJVG7ijiRLUg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] python3-kivy: update 2.2.1 -> 2.3.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 15:02:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108198

btw, do we need to switch branch stable -> master ?
there is patch from Leon which has descriptive commit message. [1]

[1] https://patchwork.yoctoproject.org/project/oe/patch/20240109135121.3460=
927-3-leon.anavi@konsulko.com/

On Tue, Jan 9, 2024 at 6:56=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Tue, Jan 9, 2024 at 1:08=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com> wrote:
> >
> > I think it's clang, so needs to be added to conf/nonclangable.conf?
>
> yes, Although it will be good to report this error upstream, since
> mixing const/non-const types can have
> unintended consequences and result in subtle bugs.
>
> >
> > /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/python3-kivy/2=
.3.0/git/kivy/graphics/cgl_backend/cgl_gl.c:4549:52:
> > error: incompatible function pointer types assigning to 'void
> > (*)(GLuint, GLsizei, const GLchar **, const GLint *)' (aka 'void
> > (*)(unsigned int, int, const char **, const int *)') from 'void
> > (GLuint, GLsizei, const GLchar *const *, const GLint *)' (aka 'void
> > (unsigned int, int, const char *const *, const int *)')
> > [-Wincompatible-function-pointer-types]
> >  4549 |   __pyx_v_4kivy_8graphics_3cgl_cgl->glShaderSource =3D glShader=
Source;
> >       |                                                    ^ ~~~~~~~~~~=
~~~~
> >
> > Note that this update is needed for both cython 3.x and python 3.12
> > compatibility.
> >
> > Alex
> >
> > On Tue, 9 Jan 2024 at 04:32, Khem Raj <raj.khem@gmail.com> wrote:
> > >
> > > this fails to build here ( maybe its clang finding additional problem=
s )
> > >
> > > https://sprunge.us/lq5PKS
> > >
> > > On Fri, Jan 5, 2024 at 5:36=E2=80=AFAM Alexander Kanavin <alex.kanavi=
n@gmail.com> wrote:
> > > >
> > > > License-Update: years, mention that it is MIT at the start.
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  .../python/{python3-kivy_2.2.1.bb =3D> python3-kivy_2.3.0.bb} | 6 =
+++---
> > > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > >  rename meta-python/recipes-devtools/python/{python3-kivy_2.2.1.bb =
=3D> python3-kivy_2.3.0.bb} (93%)
> > > >
> > > > diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.2.1=
.bb b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > > > similarity index 93%
> > > > rename from meta-python/recipes-devtools/python/python3-kivy_2.2.1.=
bb
> > > > rename to meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > > > index a72ee14f6..0d4a1207f 100644
> > > > --- a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> > > > +++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > > > @@ -2,7 +2,7 @@ SUMMARY =3D "Open source Python library for rapid d=
evelopment of applications \
> > > >      that make use of innovative user interfaces, such as multi-tou=
ch apps."
> > > >  HOMEPAGE =3D "https://kivy.org/"
> > > >  LICENSE =3D "MIT"
> > > > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded5cd0f2cfda42852c332e3=
b88c85fea"
> > > > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d3bc49400e35d5a2279d14=
c40dcfb09"
> > > >
> > > >  inherit setuptools3 pkgconfig features_check
> > > >  PIP_INSTALL_PACKAGE =3D "Kivy"
> > > > @@ -11,11 +11,11 @@ PIP_INSTALL_PACKAGE =3D "Kivy"
> > > >  # and mali-based OS's. We need to patch the setup file to tell Kiv=
y setup
> > > >  # that our machine has GLES libaries installed as well
> > > >  # Also, if using SDL2 as backend, SDL2 needs to be configured with=
 gles
> > > > -SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branc=
h=3Dstable \
> > > > +SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branc=
h=3Dmaster \
> > > >             file://0001-add-support-for-glesv2.patch \
> > > >             "
> > > >
> > > > -SRCREV =3D "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
> > > > +SRCREV =3D "9ef218027178115a66b417ae34b21f488bdd3617"
> > > >
> > > >  S =3D "${WORKDIR}/git"
> > > >
> > > > --
> > > > 2.39.2
> > > >
> > > >
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > > Links: You receive all messages sent to this group.
> > > > View/Reply Online (#108048): https://lists.openembedded.org/g/opene=
mbedded-devel/message/108048
> > > > Mute This Topic: https://lists.openembedded.org/mt/103542151/199791=
4
> > > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/un=
sub [raj.khem@gmail.com]
> > > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > >

