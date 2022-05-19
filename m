Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC024C4332F
	for <webhook@archiver.kernel.org>; Thu, 19 May 2022 17:51:30 +0000 (UTC)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 by mx.groups.io with SMTP id smtpd.web12.10823.1652982686693038653
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 10:51:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V9GJvXeB;
 spf=pass (domain: gmail.com, ip: 209.85.160.174,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f174.google.com with SMTP id fu47so5352880qtb.5
        for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 May 2022 10:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=1qhBjbI7R+/X+w6bDMsdBcfeeWEZKytXY9DcDTEb8RA=;
        b=V9GJvXeB4Ac5JM5bfp3FrRnxKAv44IhuM7uNqdmGKhUCEmAFke2hM/w0Tqio2jPXGw
         iA2eWi//xalaD82hKGO7JirJ8QciDXQMMLNhal5YwQ1+nskMlSZPPQTvbgDs0d9j2xdj
         jAvqKfO6T39ppxMOcIJ+695rJZeHpRRo3lN3yLgCx2cBpJAje+DYJ4a1igYiqUm/MCfU
         HFec4sEwJ6frpL2vxRlyYc/nuBWC800bJOMUbL0k3McV96J0cIKSveg9hk6DGONQCalG
         eyBV7RodjknfAfNEsPH21AJ11FW9tkuOiVjOvTJyXFEC9l0U+zHTq+/MdI6hjRKMtPJh
         BOQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=1qhBjbI7R+/X+w6bDMsdBcfeeWEZKytXY9DcDTEb8RA=;
        b=k7U95/HplxqrQK8ZmtjE2LYucguSGgsXiw7F646VvHDfi2C2CQtjGOH8wpxy2MnaJO
         9CA4dI6pqRQEyt7lkPNzeRB6GMFk5fKuEQ8umndQ9kXOh34ap3SxDqVCwEw5G/IC5Y7V
         bru8AsE1dNWNsDN3/UbVFZJ/DGjoTPueHXLmt74cJQFZeebwk8UZAO9hQhA8K28YiTo9
         l2uT4A0Wl/260xCjIgbCstYnlyc+HLQtbxJb2bC/VFxR8xe0gDd4r6fdh3Fl7Hissitg
         Y6MQsbOUjyPNylWhXl6dkUmARj4hkgX/BjByR6irpDoLDXwqQuTV8bt0i1m+lIZlhzCk
         8oRg==
X-Gm-Message-State: AOAM533t4w+EG0aE8niAr/NplQLnyHD3Hhm1LNwx65nqFwu3HBqpwzrK
	WIaTtDdo7BHVO/8sAa/DsY+tm6hL19vhshdwkuoQOHo+BWtu3Q==
X-Google-Smtp-Source: 
 ABdhPJxSC9HsnZS1zFbmm6Mm91/PtEMmAnj/3jwya3SjYq5Ph0e3fHS0vQvU3C2zh4ydVHy3p+6/cCwmpoL6gU5amy8=
X-Received: by 2002:ac8:574d:0:b0:2f3:b4aa:700f with SMTP id
 13-20020ac8574d000000b002f3b4aa700fmr4880766qtx.54.1652982685696; Thu, 19 May
 2022 10:51:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220519051622.1050304-1-zboszor@pr.hu>
 <20220519051622.1050304-2-zboszor@pr.hu>
 <CAMKF1sokAW+7zY46o5aJGGTatpc+g8Ft_9dgX5FAW4cgLdihDw@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sokAW+7zY46o5aJGGTatpc+g8Ft_9dgX5FAW4cgLdihDw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 May 2022 10:50:59 -0700
Message-ID: 
 <CAMKF1srDJJSZ6kR_xbe5Qr3_uvECTWz54W7fMLmxnyy5zcOdmg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 2/2] python3-pyproj: New recipe for
 pyproj version 3.3.1
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 19 May 2022 17:51:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97203

forgot the error link
https://errors.yoctoproject.org/Errors/Details/657040/

On Thu, May 19, 2022 at 10:50 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> fails to build. Seems to access proj-native libs instead of target proj
>
> On Wed, May 18, 2022 at 10:16 PM Zoltan Boszormenyi via
> lists.openembedded.org <zboszor=3Dpr.hu@lists.openembedded.org> wrote:
> >
> > From: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> >
> > It needs PROJ.4 >=3D 8.x and the fix for setuptools in oe-core.
> >
> > Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.co=
m>
> > ---
> >  .../recipes-devtools/python/python3-pyproj_3.3.1.bb | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >  create mode 100644 meta-python/recipes-devtools/python/python3-pyproj_=
3.3.1.bb
> >
> > diff --git a/meta-python/recipes-devtools/python/python3-pyproj_3.3.1.b=
b b/meta-python/recipes-devtools/python/python3-pyproj_3.3.1.bb
> > new file mode 100644
> > index 000000000..ebef1e74c
> > --- /dev/null
> > +++ b/meta-python/recipes-devtools/python/python3-pyproj_3.3.1.bb
> > @@ -0,0 +1,13 @@
> > +SUMMARY =3D "Python interface to PROJ (cartographic projections and co=
ordinate transformations library)"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Ddc4bb2668871655e24030dfe8d2=
a7ce7"
> > +DEPENDS =3D "python3-cython proj"
> > +DEPENDS:append:class-target =3D " proj-native python3-cython-native"
> > +
> > +PYPI_PACKAGE =3D "pyproj"
> > +
> > +inherit pypi setuptools3
> > +
> > +SRC_URI[sha256sum] =3D "b3d8e14d91cc95fb3dbc03a9d0588ac58326803eefa5bb=
b0978d109de3304fbe"
> > +
> > +RDEPENDS:${PN} =3D "${PYTHON_PN}-cython proj"
> > --
> > 2.36.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#97169): https://lists.openembedded.org/g/openembedd=
ed-devel/message/97169
> > Mute This Topic: https://lists.openembedded.org/mt/91202579/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

