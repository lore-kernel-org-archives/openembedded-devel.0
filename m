Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7D21C77B61
	for <webhook@archiver.kernel.org>; Thu, 27 Apr 2023 16:21:33 +0000 (UTC)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
 by mx.groups.io with SMTP id smtpd.web10.25499.1682612491290604811
 for <Openembedded-devel@lists.openembedded.org>;
 Thu, 27 Apr 2023 09:21:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=imFxn226;
 spf=pass (domain: gmail.com, ip: 209.85.222.48, mailfrom: raj.khem@gmail.com)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-76ee8f09692so3033006241.1
        for <Openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 09:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682612490; x=1685204490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b7iwmDb8GCu+IiQk94OWnr5B80rTmWlVYPapOInqixg=;
        b=imFxn226NtC2dYT4fDKLeXtjif+ooRTIS/2G4YaWFOXxNx/kuCqY+A+HvOQAc79fX+
         xLNKxxnBjVYFoV7lQTvwpPxcG7fo1Dg68QuIpD1GKyYoFoH2ye9Ta5MIKxmrSXdpphIz
         W/TYswoJLarYEZ6EwsYbsY2hl2W2sGLolhEzgrYy2AzJ1cQxDU+t9Xgm34vH3Rvk66hI
         mGq9bcG+W2Dep2AzXChh5YqMC/2/o6EpP6QxqZDfWB4QO6n2tnzXSsKVYwhzJmB85o2o
         4wBv9Kd9T26pR8pnLwnhx1mHb+fDxhPItFK2SordfbjOZvSP/7IscTQLIy5ieYiKDJy2
         oQ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682612490; x=1685204490;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b7iwmDb8GCu+IiQk94OWnr5B80rTmWlVYPapOInqixg=;
        b=F6NfVWYtlLEv2XQfYWP2Vv4yHG+cKfH66Yxu/PNy2BBQ6ccR64qcR/GZMrhxX/YDqX
         ZhkrGC4vwlnGJqJmIEo4JtvZ1JHdceUJ9qUtVDB63Q9XiqJJBLkgLP0xr6x4UgWsUsM8
         5SycfPrnTHgSdoGFy4jS6JJDNzoGr6zhYoKQRaRwbQObt0+NxX+aE8AMjTmCoW6j7gf+
         MNvBhpjtXQCptQqIdt9JqCGgxfeQQzq/9vjIoQ91T+x+8sZ3/097FuEcXryo8vApchWp
         OQDbfvH7+xhJBEuTS0p3SNr2icRwAHClK+cOppZQfsiNbHTGCB4cFPlNl+Jfos161+ny
         iodA==
X-Gm-Message-State: AC+VfDy5sM6ZZcVvgWOppArVDNEv8IxZ7Vk7gnbYzftIdABOo63kIOPI
	AaPxvp3lxZ7aV1yzf55qA0eS+vgZP0a6vFnGBw0=
X-Google-Smtp-Source: ACHHUZ7N4BB4AKNkNGCdMuVCg4cKN7NKERdgSIjaoNIstS3WfAuOXub9s+cw+OPKjXgRBTkc7t+7ft78wOteRiqpX+w=
X-Received: by 2002:a67:cfc5:0:b0:426:13e9:7ca9 with SMTP id
 h5-20020a67cfc5000000b0042613e97ca9mr1306802vsm.5.1682612490010; Thu, 27 Apr
 2023 09:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230426203453.3497409-1-rs@ti.com> <20230426203453.3497409-2-rs@ti.com>
 <CAMKF1soDfEAhBYq91JVt9xhvQFr6yV2gsiOAcebCvX5wNio8iw@mail.gmail.com>
 <20230427160243.GK9226@denix.org> <19d24e40-7918-3329-6745-741fcd260dfd@ti.com>
In-Reply-To: <19d24e40-7918-3329-6745-741fcd260dfd@ti.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 27 Apr 2023 09:21:19 -0700
Message-ID: <CAMKF1srVyFcNkGMOshndO1w3yL_4TzhX5XtSWTLq8Uetnx-LvA@mail.gmail.com>
Subject: Re: [EXTERNAL] Re: [oe] [meta-oe][kirkstone][PATCH] glfw: add
 packageconfig and wayland dependencies
To: Randolph Sapp <rs@ti.com>
Cc: Denys Dmytriyenko <denis@denix.org>, Openembedded-devel@lists.openembedded.org, afd@ti.com, 
	akuster808@gmail.com, detheridge@ti.com, reatmon@ti.com
Content-Type: multipart/alternative; boundary="000000000000c3050805fa53bf58"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Apr 2023 16:21:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/102211

--000000000000c3050805fa53bf58
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 9:14 AM Randolph Sapp <rs@ti.com> wrote:

> On 4/27/23 11:02, Denys Dmytriyenko wrote:
> > On Thu, Apr 27, 2023 at 01:22:16AM -0700, Khem Raj wrote:
> >> fails layer check perhaps it has some cross layer deps
> >>
> >> https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/2693
> >>
> >> On Wed, Apr 26, 2023 at 1:35=E2=80=AFPM Randolph Sapp via
> >> lists.openembedded.org <rs=3Dti.com@lists.openembedded.org> wrote:
> >>>
> >>> From: Randolph Sapp <rs@ti.com>
> >>>
> >>> GLFW has the ability to use a wayland backend. This patch adds a conf=
ig
> >>> for it and attempts to automatically resolve the most common collisio=
n
> >>> since the wayland and x11 backends are mutually exclusive.
> >>>
> >>> Signed-off-by: Randolph Sapp <rs@ti.com>
> >>> ---
> >>>   meta-oe/recipes-core/glfw/glfw_3.3.bb | 15 +++++++++++++--
> >>>   1 file changed, 13 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >>> index b31bba6b6b..29d7b5de42 100644
> >>> --- a/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >>> +++ b/meta-oe/recipes-core/glfw/glfw_3.3.bb
> >>> @@ -20,7 +20,18 @@ EXTRA_OECMAKE +=3D "-DBUILD_SHARED_LIBS=3DON
> -DGLFW_BUILD_DOCS=3DOFF"
> >>>
> >>>   CFLAGS +=3D "-fPIC"
> >>>
> >>> -DEPENDS =3D "libpng libglu zlib libxrandr libxinerama libxi libxcurs=
or"
> >>> -REQUIRED_DISTRO_FEATURES =3D "x11 opengl"
> >>> +DEPENDS =3D "libpng libglu zlib"
> >>> +REQUIRED_DISTRO_FEATURES =3D "opengl"
> >>> +ANY_OF_DISTRO_FEATURES =3D "wayland x11"
> >>> +
> >>> +# upstream considers x11 and wayland backends mutually exclusive and
> will
> >>> +# prioritize wayland if it is enabled
> >>> +
> >>> +PACKAGECONFIG ??=3D " \
> >>> +    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland',
> 'x11', d)} \
> >>> +"
> >>> +
> >>> +PACKAGECONFIG[wayland] =3D "-DGLFW_USE_WAYLAND=3DON,,wayland
> wayland-native wayland-protocols extra-cmake-modules libxkbcommon"
> >
> > ^^^ extra-cmake-modules is a KDE piece and available from these layers:
> >
> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dext=
ra-cmake-modules
> >
> >
> >>> +PACKAGECONFIG[x11] =3D ",,libxrandr libxinerama libxi libxcursor"
> >>>
> >>>   COMPATIBLE_HOST:libc-musl =3D "null"
> >>> --
> >>> 2.40.0
>
> Rats. Well now I guess I know why this was never enabled. What's the
> play? Drop this or add a new layer dependency? I think I already know


You can add this as dependency via packageconfig and keep it disabled by
default


> the answer but I figure I should ask anyway.
>

--000000000000c3050805fa53bf58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Apr 27, 2023 at 9:14 AM Randolph Sapp &lt;<a href=
=3D"mailto:rs@ti.com">rs@ti.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 4/27/23 11:02, Denys Dmytriyenko wrote:<br>
&gt; On Thu, Apr 27, 2023 at 01:22:16AM -0700, Khem Raj wrote:<br>
&gt;&gt; fails layer check perhaps it has some cross layer deps<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://autobuilder.yoctoproject.org/typhoon/#/builders=
/88/builds/2693" rel=3D"noreferrer" target=3D"_blank">https://autobuilder.y=
octoproject.org/typhoon/#/builders/88/builds/2693</a><br>
&gt;&gt;<br>
&gt;&gt; On Wed, Apr 26, 2023 at 1:35=E2=80=AFPM Randolph Sapp via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> &lt;rs=3D<a href=3D"mailto:ti.com@l=
ists.openembedded.org" target=3D"_blank">ti.com@lists.openembedded.org</a>&=
gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; From: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" target=3D=
"_blank">rs@ti.com</a>&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; GLFW has the ability to use a wayland backend. This patch adds=
 a config<br>
&gt;&gt;&gt; for it and attempts to automatically resolve the most common c=
ollision<br>
&gt;&gt;&gt; since the wayland and x11 backends are mutually exclusive.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Randolph Sapp &lt;<a href=3D"mailto:rs@ti.com" =
target=3D"_blank">rs@ti.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 =C2=A0meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3=
.3.bb" rel=3D"noreferrer" target=3D"_blank">glfw_3.3.bb</a> | 15 ++++++++++=
+++--<br>
&gt;&gt;&gt;=C2=A0 =C2=A01 file changed, 13 insertions(+), 2 deletions(-)<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_=
3.3.bb" rel=3D"noreferrer" target=3D"_blank">glfw_3.3.bb</a> b/meta-oe/reci=
pes-core/glfw/<a href=3D"http://glfw_3.3.bb" rel=3D"noreferrer" target=3D"_=
blank">glfw_3.3.bb</a><br>
&gt;&gt;&gt; index b31bba6b6b..29d7b5de42 100644<br>
&gt;&gt;&gt; --- a/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">glfw_3.3.bb</a><br>
&gt;&gt;&gt; +++ b/meta-oe/recipes-core/glfw/<a href=3D"http://glfw_3.3.bb"=
 rel=3D"noreferrer" target=3D"_blank">glfw_3.3.bb</a><br>
&gt;&gt;&gt; @@ -20,7 +20,18 @@ EXTRA_OECMAKE +=3D &quot;-DBUILD_SHARED_LIB=
S=3DON -DGLFW_BUILD_DOCS=3DOFF&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0CFLAGS +=3D &quot;-fPIC&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; -DEPENDS =3D &quot;libpng libglu zlib libxrandr libxinerama li=
bxi libxcursor&quot;<br>
&gt;&gt;&gt; -REQUIRED_DISTRO_FEATURES =3D &quot;x11 opengl&quot;<br>
&gt;&gt;&gt; +DEPENDS =3D &quot;libpng libglu zlib&quot;<br>
&gt;&gt;&gt; +REQUIRED_DISTRO_FEATURES =3D &quot;opengl&quot;<br>
&gt;&gt;&gt; +ANY_OF_DISTRO_FEATURES =3D &quot;wayland x11&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +# upstream considers x11 and wayland backends mutually exclus=
ive and will<br>
&gt;&gt;&gt; +# prioritize wayland if it is enabled<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +PACKAGECONFIG ??=3D &quot; \<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;wayland&#39;, &#39;wayland&#39;, &#39;x11&#39;, d)} \<br>
&gt;&gt;&gt; +&quot;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt; +PACKAGECONFIG[wayland] =3D &quot;-DGLFW_USE_WAYLAND=3DON,,way=
land wayland-native wayland-protocols extra-cmake-modules libxkbcommon&quot=
;<br>
&gt; <br>
&gt; ^^^ extra-cmake-modules is a KDE piece and available from these layers=
:<br>
&gt; <a href=3D"https://layers.openembedded.org/layerindex/branch/master/re=
cipes/?q=3Dextra-cmake-modules" rel=3D"noreferrer" target=3D"_blank">https:=
//layers.openembedded.org/layerindex/branch/master/recipes/?q=3Dextra-cmake=
-modules</a><br>
&gt; <br>
&gt; <br>
&gt;&gt;&gt; +PACKAGECONFIG[x11] =3D &quot;,,libxrandr libxinerama libxi li=
bxcursor&quot;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0COMPATIBLE_HOST:libc-musl =3D &quot;null&quot;<br>
&gt;&gt;&gt; --<br>
&gt;&gt;&gt; 2.40.0<br>
<br>
Rats. Well now I guess I know why this was never enabled. What&#39;s the <b=
r>
play? Drop this or add a new layer dependency? I think I already know </blo=
ckquote><div dir=3D"auto"><br></div><div dir=3D"auto">You can add this as d=
ependency via packageconfig and keep it disabled by default</div><div dir=
=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
the answer but I figure I should ask anyway.<br>
</blockquote></div></div>

--000000000000c3050805fa53bf58--

