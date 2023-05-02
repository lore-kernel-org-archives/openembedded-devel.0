Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38E06C77B73
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 16:08:35 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
 by mx.groups.io with SMTP id smtpd.web10.163.1683043714405081774
 for <Openembedded-devel@lists.openembedded.org>;
 Tue, 02 May 2023 09:08:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=IDbHwhzA;
 spf=pass (domain: gmail.com, ip: 209.85.167.175, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-38dfdc1daa9so2437688b6e.1
        for <Openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 09:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683043713; x=1685635713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LGa5Fb4seo9CXNfS3CYeZt0ynQFfXOtXiwPUwo6+f4=;
        b=IDbHwhzAFkF1GAKPvVFzzrpvZC+mIHfQ2r+YoodSTovVCtCYZQI+R+F1/oqxhfVcpx
         4nBCiLd72qckmWhafsKnVeKyNtVHULjV+RJBx9mc3/l3ULyJLhF/nNmqkjLag7xwdH9a
         dc9C+YyWeGn3VQKcMjq9Fs7Y+joqYtigilylKdgdNpeNGuV3kK+Xwivw21gRKTqcqbYg
         i+q3WuPb5k7iHaw2aeYSxqzyHTYfSc5uSQBn/oa2mI6c18Q+2S6WpRwTcb1xWRRWfbOo
         HlX3p1D1kmjtF2S4mPSdOGGV0f3uL6U2UvBdLtViZS4Y4gd9ElL2SfPU+g+R/widNzMi
         +EIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683043713; x=1685635713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LGa5Fb4seo9CXNfS3CYeZt0ynQFfXOtXiwPUwo6+f4=;
        b=dBQVzmRfD921x+/2STtXFjfIKN8JMrNtSCfQghr8kCXeqwHiYDnolAV1jtXzVuEMKM
         qi2PSCw02kRMPJ517swSvMbedubIQ0ho2Nqq9B+psl7t5XfbDV61TwHAzG9N1u1+doaR
         GVVjscBsmz1XrOhSo1IXBjIoPQXlXWjm4z+6N6AOlH9w6pA69ac0FLSvp36ma1R2/JNP
         kWOTtRiiFgENZfXzZWssOItoyieySjWPf75rpSQ3JyZo5hLbo+1ZW36COu4axY3A/WFe
         iMdZH4kVXm3V8NM8JJj++u6APZMCeWWAaT4xAfh+4azPClRtdChPkQLcKmm7gA7kuIkd
         ItcQ==
X-Gm-Message-State: AC+VfDxMZ9fvhWEDGXakTnw5qBNw9VfU7EhfmxuSKD8AxqOxXvv/VwzW
	/d68Nb+iDE23IXYfyLaVkSZXFBK/WaOSj8g83PY=
X-Google-Smtp-Source: ACHHUZ6Cz+dWB/tLh3BDSAyiraae/G9RGsHNaf25o/v4946p0xUXatfAYnYHgztwAwCtaNL0BK7QGffE7kGKgWTQmaI=
X-Received: by 2002:a05:6808:4285:b0:38d:f03f:935b with SMTP id
 dq5-20020a056808428500b0038df03f935bmr9154317oib.24.1683043713521; Tue, 02
 May 2023 09:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230427164723.863197-1-rs@ti.com> <36d695de-8152-c528-4b17-f85ff1e4c4ff@gmail.com>
 <df484615-b1eb-d368-f48e-f9da599cd4c4@ti.com> <CA+chaQfpAZwtAk4kOG56xiCmOm62MGW6YPEG661-n7XqC08Rxg@mail.gmail.com>
 <055e898a-d85e-2f86-da85-b7b00db1cf54@ti.com>
In-Reply-To: <055e898a-d85e-2f86-da85-b7b00db1cf54@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 2 May 2023 09:08:07 -0700
Message-ID: <CAMKF1squ-NOf4+qgDGVV3yPjX95Kp_nCOq0zK5QWGeqxb=h9OQ@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [oe] [meta-oe][kirkstone][PATCHv2] glfw: add
 packageconfig and wayland dependencies
To: Randolph Sapp <rs@ti.com>
Cc: Martin Jansa <martin.jansa@gmail.com>, akuster808 <akuster808@gmail.com>, afd@ti.com, 
	detheridge@ti.com, reatmon@ti.com, denis@denix.org, 
	Openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 02 May 2023 16:08:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102263

On Tue, May 2, 2023 at 9:06=E2=80=AFAM Randolph Sapp <rs@ti.com> wrote:
>
> On 5/2/23 10:56, Martin Jansa wrote:
> > The version which was merged with:
> >
> > PACKAGECONFIG ??=3D "x11"
> >
> > Should still respect x11 in DISTRO_FEATURES, now this causes:
> >
> > ERROR: Nothing PROVIDES 'libxi' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r
> > otherwise requires it)
> > libxi was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'libxinerama' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r
> > otherwise requires it)
> > libxinerama was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'libxrandr' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r
> > otherwise requires it)
> > libxrandr was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'libglu' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r
> > otherwise requires it)
> > libglu was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> > ERROR: Nothing PROVIDES 'libxcursor' (but
> > meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> DEPENDS on o=
r
> > otherwise requires it)
> > libxcursor was skipped: missing required distro feature 'x11' (not in
> > DISTRO_FEATURES)
> >
> > when wayland and opengl are in DISTRO_FEATURES, but x11 isn't.
> >
>
> Yeah, that's expected behavior at this point. You need to manually
> override the PACKAGECONFIG for wayland in this patch. Just slightly
> better than no wayland at all.
>
> The only way we can get around it is if this layer or one of it's
> dependencies decides to adopt extra-cmake-modules. They the
> packageconfig can automatically configure itself. Discussion on who's
> job it is to carry this package has yet to conclude.
>

May be bring it to meta-oe at this point.

> > REQUIRED_DISTRO_FEATURES is satisfied by "opengl" and
> > ANY_OF_DISTRO_FEATURES by "wayland", but the default PACKAGECONFIG
> > doesn't match with that.
> >
> > On Fri, Apr 28, 2023 at 6:32=E2=80=AFPM Randolph Sapp via lists.openemb=
edded.org
> > <http://lists.openembedded.org> <rs=3Dti.com@lists.openembedded.org
> > <mailto:ti.com@lists.openembedded.org>> wrote:
> >
> >     On 4/28/23 06:16, akuster808 wrote:
> >      > Doesn't this need to land it Master first? Kirkstone is in the
> >     subject
> >      >
> >      > - armin
> >      >
> >
> >     Perhaps, but I've only had a chance to test it against kirkstone so=
 I
> >     flagged it as such. At this point I'm still vetting solutions to th=
is
> >     dependency chain though. Looking for something this layer would
> >     actually
> >     like to carry.
> >
> >      > On 4/27/23 12:47 PM, rs@ti.com <mailto:rs@ti.com> wrote:
> >      >> From: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
> >      >>
> >      >> GLFW has the ability to use a wayland backend. This patch adds =
a
> >     config
> >      >> for it, but does not enable it by default because it has a
> >     dependency on
> >      >> extra-cmake-modules which is provided (most commonly) by
> >     meta-qt5-extra.
> >      >>
> >      >> Signed-off-by: Randolph Sapp <rs@ti.com <mailto:rs@ti.com>>
> >      >> ---
> >      >>   meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb> |
> >     14 ++++++++++++--
> >      >>   1 file changed, 12 insertions(+), 2 deletions(-)
> >      >>
> >      >> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >     <http://glfw_3.3.bb>
> >      >> b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb>
> >      >> index b31bba6b6b..5b0d61241e 100644
> >      >> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb=
>
> >      >> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb <http://glfw_3.3.bb=
>
> >      >> @@ -20,7 +20,17 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON
> >      >> -DGLFW_BUILD_DOCS=3DOFF"
> >      >>   CFLAGS +=3D "-fPIC"
> >      >> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi
> >     libxcursor"
> >      >> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> >      >> +DEPENDS =3D "libpng libglu zlib"
> >      >> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> >      >> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> >      >> +
> >      >> +# upstream considers x11 and wayland backends mutually
> >     exclusive and
> >      >> will
> >      >> +# prioritize wayland if it is enabled, but wayland has
> >     dependencies
> >      >> that cannot
> >      >> +# be satisfied by this layer so it is disabled by default
> >      >> +
> >      >> +PACKAGECONFIG ??=3D "x11"
> >      >> +
> >      >> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland
> >      >> wayland-native wayland-protocols extra-cmake-modules libxkbcomm=
on"
> >      >> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcurs=
or"
> >      >>   COMPATIBLE_HOST:libc-musl =3D "null"
> >      >
> >
> >
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >     Links: You receive all messages sent to this group.
> >     View/Reply Online (#102225):
> >     https://lists.openembedded.org/g/openembedded-devel/message/102225
> >     <https://lists.openembedded.org/g/openembedded-devel/message/102225=
>
> >     Mute This Topic: https://lists.openembedded.org/mt/98540896/3617156
> >     <https://lists.openembedded.org/mt/98540896/3617156>
> >     Group Owner: openembedded-devel+owner@lists.openembedded.org
> >     <mailto:openembedded-devel%2Bowner@lists.openembedded.org>
> >     Unsubscribe:
> >     https://lists.openembedded.org/g/openembedded-devel/unsub
> >     <https://lists.openembedded.org/g/openembedded-devel/unsub>
> >     [Martin.Jansa@gmail.com <mailto:Martin.Jansa@gmail.com>]
> >     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

