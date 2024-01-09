Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 803D2C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 09:08:39 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.12791.1704791316415251450
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 09 Jan 2024 01:08:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=T6HrTOZ4;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-50e7b273352so2663938e87.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 01:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704791314; x=1705396114; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYevx4gEq4U+5v8exUmCrwYvTHTiXWw5/VD0+bcYUQ0=;
        b=T6HrTOZ4+xQHC4p8TvTZ/CCV7V601JG+jQiWvt9kpONRnJPr6Mg1fv0mbmoNe3u7zh
         jTKEbpeFK1Eju4KCNA/2j664BS4N8vl7V7LK7KAOkDkrUouai972IyQ8ubJdoo729Crm
         YGX/8h+7tKVM4Is8aK7jJbOybgYYgtk0loClvmnQK99F+m1W6zUCuebcKT7X+tz1LDc2
         TzzXDGgjwSdpx2wPHe8ovCwnUr5Rh8GqIP4p0EXiErhIQPSPKOej1DfkIJG7xJ0unqqJ
         N13TdlF8OZMixuZplAHP6xEpiWpzm1Y0EH6k5hAs5YlWq+aR+zntAIlK3Lnzpafqetwg
         R+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704791314; x=1705396114;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DYevx4gEq4U+5v8exUmCrwYvTHTiXWw5/VD0+bcYUQ0=;
        b=bmVl9pW9xJ98FzihONMt8h7FZ5PaNE8WBvQ+FO4kkQQHe8kgFlRUDOvcLWpZrYJ96x
         5M9BToLwsrnkIbQTZv7wnvcwYXLq9c51iyWsrM+G6ijHFFPaG2+kglVkYNI/TTbIYHak
         xbR+6RIdGpF2ACZ3KXiTURfrj8t1QPcZrtqzcYxKudczD8gLEbfPi8F8ubrPOPzLcgng
         HmU0TAhAfGbB1olJUuRoqZ/9FrtEUuhAIyCnhlY571AqkMlNs/gZKpWyldZOzrOSJFB2
         EIanKdHuGjBEINM+BR7L6vVVKPX//Vu2S4IpkGcyd4Nv5ZuLYzvaPngPRFcyGT6B38uS
         n3eQ==
X-Gm-Message-State: AOJu0YygZm9SV6VCYSvcZB1S46BqD9cEpWMks1uPezHIbPXntxstLZx8
	0RN5Pl5ljfPJNWIIeHM9n2Oq+i64fSEGletYNbc=
X-Google-Smtp-Source: AGHT+IEz4muPtxirgvEJrPDj91UsLnOmozVtHz8QYd8RzHNxGa1bINuph3WZLA1qF5TfMPEFjoSieJ2gEF3j6cOEMs0=
X-Received: by 2002:a05:6512:202f:b0:50e:769b:7165 with SMTP id
 s15-20020a056512202f00b0050e769b7165mr1543129lfs.57.1704791313990; Tue, 09
 Jan 2024 01:08:33 -0800 (PST)
MIME-Version: 1.0
References: <20240105133611.3018041-1-alex@linutronix.de> <20240105133611.3018041-2-alex@linutronix.de>
 <CAMKF1srDmU9h8xP2JGX=6otiRGqVPKr4ZNX00bicU-R=C9ipmQ@mail.gmail.com>
In-Reply-To: <CAMKF1srDmU9h8xP2JGX=6otiRGqVPKr4ZNX00bicU-R=C9ipmQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 9 Jan 2024 10:08:22 +0100
Message-ID: <CANNYZj8kkMN-dzw2YzXEQ1dTFo3d+Bg5jxSe9VCLDyF=DNFVPg@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] python3-kivy: update 2.2.1 -> 2.3.0
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jan 2024 09:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108184

I think it's clang, so needs to be added to conf/nonclangable.conf?

/mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/python3-kivy/2.3.0=
/git/kivy/graphics/cgl_backend/cgl_gl.c:4549:52:
error: incompatible function pointer types assigning to 'void
(*)(GLuint, GLsizei, const GLchar **, const GLint *)' (aka 'void
(*)(unsigned int, int, const char **, const int *)') from 'void
(GLuint, GLsizei, const GLchar *const *, const GLint *)' (aka 'void
(unsigned int, int, const char *const *, const int *)')
[-Wincompatible-function-pointer-types]
 4549 |   __pyx_v_4kivy_8graphics_3cgl_cgl->glShaderSource =3D glShaderSour=
ce;
      |                                                    ^ ~~~~~~~~~~~~~~

Note that this update is needed for both cython 3.x and python 3.12
compatibility.

Alex

On Tue, 9 Jan 2024 at 04:32, Khem Raj <raj.khem@gmail.com> wrote:
>
> this fails to build here ( maybe its clang finding additional problems )
>
> https://sprunge.us/lq5PKS
>
> On Fri, Jan 5, 2024 at 5:36=E2=80=AFAM Alexander Kanavin <alex.kanavin@gm=
ail.com> wrote:
> >
> > License-Update: years, mention that it is MIT at the start.
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  .../python/{python3-kivy_2.2.1.bb =3D> python3-kivy_2.3.0.bb} | 6 +++-=
--
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python3-kivy_2.2.1.bb =3D>=
 python3-kivy_2.3.0.bb} (93%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb =
b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > similarity index 93%
> > rename from meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> > rename to meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > index a72ee14f6..0d4a1207f 100644
> > --- a/meta-python/recipes-devtools/python/python3-kivy_2.2.1.bb
> > +++ b/meta-python/recipes-devtools/python/python3-kivy_2.3.0.bb
> > @@ -2,7 +2,7 @@ SUMMARY =3D "Open source Python library for rapid devel=
opment of applications \
> >      that make use of innovative user interfaces, such as multi-touch a=
pps."
> >  HOMEPAGE =3D "https://kivy.org/"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ded5cd0f2cfda42852c332e3b88c=
85fea"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D6d3bc49400e35d5a2279d14c40d=
cfb09"
> >
> >  inherit setuptools3 pkgconfig features_check
> >  PIP_INSTALL_PACKAGE =3D "Kivy"
> > @@ -11,11 +11,11 @@ PIP_INSTALL_PACKAGE =3D "Kivy"
> >  # and mali-based OS's. We need to patch the setup file to tell Kivy se=
tup
> >  # that our machine has GLES libaries installed as well
> >  # Also, if using SDL2 as backend, SDL2 needs to be configured with gle=
s
> > -SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=3D=
stable \
> > +SRC_URI =3D "git://github.com/kivy/kivy.git;protocol=3Dhttps;branch=3D=
master \
> >             file://0001-add-support-for-glesv2.patch \
> >             "
> >
> > -SRCREV =3D "344768bfefd2e8f5302cc9dfb8ca41991ce6f7e7"
> > +SRCREV =3D "9ef218027178115a66b417ae34b21f488bdd3617"
> >
> >  S =3D "${WORKDIR}/git"
> >
> > --
> > 2.39.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#108048): https://lists.openembedded.org/g/openembed=
ded-devel/message/108048
> > Mute This Topic: https://lists.openembedded.org/mt/103542151/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

