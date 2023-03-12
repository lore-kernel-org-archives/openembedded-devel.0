Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9140CC6FA99
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 07:24:01 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web10.62552.1678605833567986264
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 11 Mar 2023 23:23:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=drKYdf2q;
 spf=pass (domain: gmail.com, ip: 209.85.208.176, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f176.google.com with SMTP id by8so9563542ljb.7
        for <openembedded-devel@lists.openembedded.org>; Sat, 11 Mar 2023 23:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678605832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f8PTwTtlBquGH+1ZjsTLqlLgwThSyZD7tEHM86F/euU=;
        b=drKYdf2qiM6iFCEvhC3wRUtReLLaasSFh7JcnJb/AJZsApkAxEWzUuBUqo/zFPLZuK
         AoUr8bRUGsd6une5Y++0WnYxD8bRAptAYiFE0jRyawMoeuA4UjaiNsS+YPxSQ1snMVe/
         jQ8dKpGXcXFznN9job6UuAUUyJdEDCzvhW9wPEUJ7PYQGcR+DD8qzU3qRNBu4WuWDJFm
         m7Ku3dbmLId9h+JEyhAVqLquifUeyqWx83HrmCdYaQ+JT6OdDlsRmHVw9ZhTvwirXkfx
         Vnxs+tQnpZ7QuBTWhJbKSxFS2//RqwMRMrrOQIZ2dKspQFNJ8RTM3EVsjOtuHKp0WSve
         xWoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678605832;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f8PTwTtlBquGH+1ZjsTLqlLgwThSyZD7tEHM86F/euU=;
        b=5/GQbLNzArY3i3G6yjwZhP4tDKCAmY1EGeOMYCJp0MlU9VjFi0hOVFwmFkYZrPFbv3
         mtpxwIlV5ey0+KquCL3IJS8vYY/t4/kMC8kthNdx4zx/e4f8H5CGxr0Co6EXsU+FDA6x
         gG9F/5WkB7lykSxsSrrjQDoOBI1nY7zVwPahn+q5iFxw5hj0EVw72irWLRBC03y1IqGN
         3bJjiMdiqzZ7kxb8IWdUz1BEPdCR2I1u4T3s28JPsC7si6TrJG1vU9oBWJ5zlTjATwtu
         GQAUVCsaxRpKa1H0lZ7TyoUeI2RbIutvEL1kLJOUmBl00NLUoLN7D8Pq84IzusYi/kzN
         zoUQ==
X-Gm-Message-State: AO0yUKUYoFhn5W+xPcVUHBdmnBN8FFesS3UcaxBIM7HGLPnaMP/sFCOc
	IMXBjvt9j7QbLoZxmJIf+7OS6+j5M050nHNWoSE=
X-Google-Smtp-Source: AK7set+QkBwr6pjMAtvPbIIZqfyAZ4JnpRKPxm6r6UqBC7EVGy064L6g/z+20P24OnJZPn0HEBkly286tFjk6DB2mds=
X-Received: by 2002:a2e:b5a5:0:b0:295:93eb:e790 with SMTP id
 f5-20020a2eb5a5000000b0029593ebe790mr9357717ljn.5.1678605831629; Sat, 11 Mar
 2023 23:23:51 -0800 (PST)
MIME-Version: 1.0
References: <20230310134637.108312-1-zboszor@gmail.com> <174B12D7752D1CA7.27660@lists.openembedded.org>
 <49c7d26c-91f1-0873-46b9-112809d2f5d9@gmail.com>
In-Reply-To: <49c7d26c-91f1-0873-46b9-112809d2f5d9@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 12 Mar 2023 08:23:40 +0100
Message-ID: <CANNYZj_Zd9GLfYzbS7W_4dziMGVGY-wTTpKjhHA8ww9aBq5JUQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2 2/3] python3-cmake: New recipe
To: Zoltan Boszormenyi <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Mar 2023 07:24:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101507

There are several 'master-next' branches, each integrator maintains their o=
wn.

The pypi patch did make it into
https://git.yoctoproject.org/poky-contrib/log/?h=3Dabelloni/master-next

Alex

On Sat, 11 Mar 2023 at 06:59, Zoltan Boszormenyi <zboszor@gmail.com> wrote:
>
> 2023. 03. 10. 14:46 keltez=C3=A9ssel, Zoltan Boszormenyi via lists.openem=
bedded.org =C3=ADrta:
> > Some python modules rely on "import cmake".
> >
> > Only build and ship the python parts, and don't download and
> > build cmake from sources. Use the already built cmake instead.
> >
> > The CMakeLists.txt file is a crippled copy from this cmake
> > python module's sources, removing almost everything, and
> > adding a dummy install target, so do_install() doesn't fail.
> >
> > The python code is patched so cmake is used from PATH.
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> > ---
> >   .../python/python3-cmake/CMakeLists.txt       | 11 ++++++
> >   .../python3-cmake/run-cmake-from-path.patch   | 11 ++++++
> >   .../python/python3-cmake_3.25.2.bb            | 37 ++++++++++++++++++=
+
> >   3 files changed, 59 insertions(+)
> >   create mode 100644 meta-python/recipes-devtools/python/python3-cmake/=
CMakeLists.txt
> >   create mode 100644 meta-python/recipes-devtools/python/python3-cmake/=
run-cmake-from-path.patch
> >   create mode 100644 meta-python/recipes-devtools/python/python3-cmake_=
3.25.2.bb
> >
> > ...
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-cmake_3.25.2.b=
b b/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
> > new file mode 100644
> > index 000000000..d0e11f9a6
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-cmake_3.25.2.bb
> > @@ -0,0 +1,37 @@
> > +SUMMARY =3D "CMake is an open-source, cross-platform family of tools d=
esigned to build, test and package software"
> > +LICENSE =3D "BSD-3-Clause & Apache-2.0"
> > +LIC_FILES_CHKSUM =3D " \
> > +     file://LICENSE_BSD_3;md5=3D9134cb61aebbdd79dd826ccb9ae6afcd \
> > +     file://LICENSE_Apache_20;md5=3D19cbd64715b51267a47bf3750cc6a8a5 \
> > +"
> > +
> > +DEPENDS =3D "ninja-native cmake-native python3-scikit-build-native"
> > +
> > +PYPI_PACKAGE =3D "cmake"
> > +PYPI_ARCHIVE_NAME_PREFIX =3D "pypi-"
>
> This line needs the pypi.bbclass change in OE-Core.
> As far as I can see it not even reached master-next there,
> while this series was merged into meta-openembedded
> master-next.
>
> As is, it will cause bad checksum warnings when building
> python3-cmake.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#101504): https://lists.openembedded.org/g/openembedde=
d-devel/message/101504
> Mute This Topic: https://lists.openembedded.org/mt/97536763/1686489
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [a=
lex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

