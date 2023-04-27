Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D44C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 17:36:14 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.27607.1682616965135610079
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 10:36:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JJY26uxs;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-38eda4ef362so3097114b6e.2
        for <Openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 10:36:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682616964; x=1685208964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3m/XgOjiRBAOmiFPU8sGMnHYXRbGDgjLFwro4e2qX+w=;
        b=JJY26uxssSdqLDsUap46VRopbIUhT3VQu6rAHcdzak/rFO0Z6kQdbTCQlI+8ZSvXR/
         sPqucXoWTkPFTAG/rnz9anuo/yCCVZULbPxIvKXaqwxZlC/JB0rJZjS4n54jit8VeFz9
         rMW8Xu8ABKOyEntH4RhMdk5nKmvnE6X2/MXNRQJY8TE7IClQ8uiP3146dbkVQxvGo1Bg
         J2z/vgWrnriNsdzPTB9AwuZKCFhP06oXBcVkIyPhR7s9L5lzGLBObzvhxaan//1lVx+x
         KIIKXIyUWNn1O5YtgnFZRLAIRzt/0qNSgOgM+xnecOrXDkzZDuLHQe/CZB0GKYPCQE2Y
         2tdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682616964; x=1685208964;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3m/XgOjiRBAOmiFPU8sGMnHYXRbGDgjLFwro4e2qX+w=;
        b=YGd1OAM8e9ZT4rnncgYj+uVlmE9tVJ1OAwRTc8wLrYIg4BEi6N5Viat3bj2aRBB+Ft
         r57SueW1Jcom0tSv3RF15SbqieKG0jLipzaSl2E+Klg7gEUC+upHPIHJStKCTpiWKI1C
         Bjxuf4HVukBDndk4BBwDP3H8kj4HnOKm4LraeCv6ACQWToxyF/GxrgmJ79StQKA3G499
         CnZeCJ/ZJM+L1/mELceXoYqLR8zkK3KGBsN3OqbZmcEiVkZbfkoz+ExKeUGRupBcuTED
         3yH7RFUt44I4CUxBEyorYHW0CFlLhPnDJaT+JuyYBr2XmQQ+GXw0eZ3aE/YlIS7dan1H
         S5/A==
X-Gm-Message-State: AC+VfDyvCYsD6SIpCFX0hK3MpuWzlQAaPoE7z/tyIrm6ivzufBdM6fNX
	0mSHwPkMuwthCUHr3k4HT0wAd1Mp8ksx9nNzZDQ=
X-Google-Smtp-Source: ACHHUZ4t1KkmtU7PCGTI+mCovkvWWWkOOkKRvvZgO2o1kNMzT7vaM6JeePyn1ruzWjwfvhHQMHlnM5KW2vZeXT9ZwTI=
X-Received: by 2002:aca:1b04:0:b0:389:92d6:18a1 with SMTP id
 b4-20020aca1b04000000b0038992d618a1mr1166915oib.24.1682616964291; Thu, 27 Apr
 2023 10:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230427164723.863197-1-rs@ti.com> <CAMKF1so-36v9=sJqy+-AN1Y-qSVCgLNTeueci9=Hyy3RSWM9Fw@mail.gmail.com>
 <5edc6746-3944-f358-1a49-06e67ff616ad@ti.com>
In-Reply-To: <5edc6746-3944-f358-1a49-06e67ff616ad@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 10:35:38 -0700
Message-ID: <CAMKF1sr6mJH+-qU+R7oX0rbDtpOJ15zcxPEzre4_j9SHYVv-mw@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [meta-oe][kirkstone][PATCHv2] glfw: add
 packageconfig and wayland dependencies
To: Randolph Sapp <rs@ti.com>
Cc: afd@ti.com, akuster808@gmail.com, detheridge@ti.com, reatmon@ti.com, 
	denis@denix.org, Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 17:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102219

On Thu, Apr 27, 2023 at 10:34=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:
>
> On 4/27/23 11:53, Khem Raj wrote:
> > On Thu, Apr 27, 2023 at 9:47=E2=80=AFAM <rs@ti.com> wrote:
> >>
> >> From: Randolph Sapp <rs@ti.com>
> >>
> >> GLFW has the ability to use a wayland backend. This patch adds a confi=
g
> >> for it, but does not enable it by default because it has a dependency =
on
> >> extra-cmake-modules which is provided (most commonly) by meta-qt5-extr=
a.
> >>
> >> Signed-off-by: Randolph Sapp <rs@ti.com>
> >> ---
> >>   meta-oe/recipes-core/glfw/glfw_3.3.bb | 14 ++++++++++++--
> >>   1 file changed, 12 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb b/meta-oe/recipes-c=
ore/glfw/glfw_3.3.bb
> >> index b31bba6b6b..5b0d61241e 100644
> >> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON -DGLFW=
_BUILD_DOCS=3DOFF"
> >>
> >>   CFLAGS +=3D "-fPIC"
> >>
> >> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcurso=
r"
> >> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> >> +DEPENDS =3D "libpng libglu zlib"
> >> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> >> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> >> +
> >> +# upstream considers x11 and wayland backends mutually exclusive and =
will
> >> +# prioritize wayland if it is enabled, but wayland has dependencies t=
hat cannot
> >> +# be satisfied by this layer so it is disabled by default
> >> +
> >> +PACKAGECONFIG ??=3D "x11"
> >> +
> >> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland wayland-=
native wayland-protocols extra-cmake-modules libxkbcommon"
> >
> > I wonder if extra-cmake-modules recipe is common enough to live in meta=
-oe
>
> I'd be happy to offer up a recipe loosely based on what we've got in
> meta-arago if you think it's worth it, but it seems to be mostly KDE
> specific excluding this weird instance and a handful of desktop
> applications that aren't packaged by oe-core or meta-oe.

We dont want KDE stuff, but the fact that enabling wayland support
needs it is less than ideal.

>
> >> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
> >>
> >>   COMPATIBLE_HOST:libc-musl =3D "null"
> >> --
> >> 2.40.0
> >>
>

