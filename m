Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19DFDCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 13:16:52 +0000 (UTC)
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
 by mx.groups.io with SMTP id smtpd.web10.19479.1755695808300472346
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Aug 2025 06:16:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KtTYYtXt;
 spf=pass (domain: gmail.com, ip: 209.85.219.174, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e94f5dbf726so870682276.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 06:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755695807; x=1756300607; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UiJ4bShfTNLUpKJTVtS/JNYPK+Aw4SJmx9EyihW7aQA=;
        b=KtTYYtXtpf0zVfIQxiV/y8FuA0531n23spmNSm51eY66Rf48x1PC4AvIMaKTFPrp4U
         Ogrens52e0xsbI5J96YlWvnOTYwcRGRTOZ64juLTdz6avFKipZB+4SrjjY/XAdRbIS77
         0EwogrHC6UuPZKUGdhZysuQMisax+VbGl4+JtRt3v41x4/ALzoI5xI/wCLvV9iI5gIQ+
         SLHk6MhGs7F4HOI0LhHj7lGKUvFX/fS+tu/JSqudHuCjK5L+lccwOTItyLSGVYFfblQe
         PIkes9c08QjAtwHwbzXhLWlcXqyFdFm+OudBW/MStDCSWqYCK8PFnqqPpDWLy50H5jcN
         RxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755695807; x=1756300607;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UiJ4bShfTNLUpKJTVtS/JNYPK+Aw4SJmx9EyihW7aQA=;
        b=is8dOLZGJJJX6QU+HouRguoMLudFQcoUxoSKPGm6TdS9wR19r2D4U7Z0zsNtpkBItd
         z+PWaSwLc7rx8nlLgOgt95jSsMS3lCbIhbEKMyjWml3wLOv3CnUvKzqoVuf4voMpZ0x/
         tTVvGy8PmkrI+6SU5OruC+N/NPaouboRnzdpD5NgVXSCo205EhEdt1fLvz1uvVzWeBZE
         A16oWMVCNqOeAPTpon8AtUPSBIBO/b8A0eYqzd2Gce1OhZ6ZQCXuQd3fnfq2FHtenjvA
         NdR9q2rwx9AEGiiy9hIRlTNu8q1EyV+XOD1JT+4G7XexiQr7/+Le0rQHcJVEJyl/gREy
         H8Dg==
X-Forwarded-Encrypted: i=1; AJvYcCXBmXti5fGQLUPJdUQd0FkWjMduY0s6YjjN8itO99Fg1xTQQ7RSGCHTiZw//IEz9kv4iAMVn3EugWO5GRezNxG9gLQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0YxLWgBgLEGlM7xlNE5ebTHYcj1VlCj+fdzyUGqUBPXbMfdB4Cvp
	DZ4+kK1X1voLtCjVRgH9vj4OB3PPkKoUZ/zLVK2WnjW202YAc3gNRiMJgW6uQtEjS8WT8NoUxQy
	jVNYtU6xpg7yJ3pSOd146NADhTQuI66c=
X-Gm-Gg: ASbGnctE++WVlB3AM+g9SQ7vwVV4kTALEvSYPi5db2EF50XjEq5sAL1lHGXIzBlVrS1
	y40cm7xzkVE6NmX/dE/Opyd471qIfrkkWJcPDJpUQLfxEdzQrUAjy0ygXG3rPCO0NHTiUeaE2HL
	TL2FF69gIUrXZcWvZ7ae57YTOzTWBWA9jWgq47+v+RYOw+OHKl8On37waDV55xu7y+/f6/DTw7S
	eCvUwlk
X-Google-Smtp-Source: AGHT+IGY6h7zI3q3lT6kY0Sqy1LI3tqS5NbbTrUKIhZbjalEvjNFSu1FvXdhouJFAR6jzIipusa9gmPUOEbDxJgduss=
X-Received: by 2002:a05:6902:6d04:b0:e94:25a2:f8fc with SMTP id
 3f1490d57ef6-e94f6524045mr3216701276.1.1755695806949; Wed, 20 Aug 2025
 06:16:46 -0700 (PDT)
MIME-Version: 1.0
References: <20250530171139.525281-1-jan.vermaete@gmail.com>
 <CAMKF1sqUJ3rK5Q18pmtNwAE8vfyqMLeC8_Mygpv5D-XSD-DMZw@mail.gmail.com>
 <CABF_=yixxqZh=sK3JbcvRPCEW17vWSXbK2_NhbOtR=5kD0CEpA@mail.gmail.com> <CAGAhMBwfoLh4oSiYu6Qut_V8HS4h6eCUVmiSnnELDQ2OK8MvUA@mail.gmail.com>
In-Reply-To: <CAGAhMBwfoLh4oSiYu6Qut_V8HS4h6eCUVmiSnnELDQ2OK8MvUA@mail.gmail.com>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Wed, 20 Aug 2025 09:16:35 -0400
X-Gm-Features: Ac12FXxkg06NWeMbPQ8R-OLMBZ88wp4v2aAXGfxwTzALdBVvvR82JUgRgNjHU9k
Message-ID: <CAGAhMByXN+2gDc5sNqqAe9qcmM-YTgDgJvbURykT2g1f+4QEKA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freeglut: version bump (3.4.0 -> 3.6.0)
To: jan.vermaete@gmail.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org, 
	ross.burton@arm.com
Content-Type: multipart/alternative; boundary="000000000000e82c2a063ccbc809"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Aug 2025 13:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119045

--000000000000e82c2a063ccbc809
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

(Resending with my GMail as I mistakenly used Ross' old email and got 3
messages about blocked messages from Gmail.)

My main reservation with my proposed fix is that the CMake page says "GLVND
is currently the only way to get OpenGL 3+ functionality via EGL in a
manner portable across vendors.".  So, upstream may want to retain
OpenGL::OpenGL.  This assertion may not be true for us with OpenEmbedded,
and this patch may be valid for us, but not for upstream.

Any feedback warmly welcomed.

Regards,
Rob

On Tue, Aug 19, 2025 at 5:37=E2=80=AFPM Rob Woolley <rob.woolley@windriver.=
com>
wrote:

> After the call today, I made an attempt at supporting both glvnd and
> legacy modes.  My potential fix is available here:  Add support for
> legacy OpenGL =C2=B7 robwoolley/meta-openembedded@d4732fd
> <https://github.com/robwoolley/meta-openembedded/commit/d4732fdca2ac32752=
0cd6d3d2438cbaff97025a9> I
> am looking for feedback from someone more familiar with OpenGL than I am
> before I send it upstream to the freeglut project.
>
> When I look at the CMake FindOpenGL page (
> https://cmake.org/cmake/help/latest/module/FindOpenGL.html ) it says that
> there is a OpenGL_GL_PREFERENCE variable that can be set to choose betwee=
n
> GLVND and LEGACY mode.  However, if the OpenGL::OpenGL component is added
> explicitly as a target dependency it implies GLVND.  The OpenGL::OpenGL
> component is used explicitly in freeglut 3.6.0.
>
> My interpretation of the Linux-specific (
> https://cmake.org/cmake/help/latest/module/FindOpenGL.html#linux-specific
> ) section is that using OpenGL:GL instead will use libGL.so when GLVND is
> not present.  However, when OpenGL_GL_PREFERENCE is set to GLVND it will
> set OPENGL_gl_LIBRARY (ie legacy GL) to empty and fallback to
> OpenGL::OpenGL (ie GLVND).
>
> I tested this using Yoe and qemuarm as reported before (
> https://errors.yoctoproject.org/Errors/Details/856261/ ).  The freeglut
> recipe successfully builds both with and without glvnd in DISTRO_FEATURES=
.
>
> Regards,
> Rob
>
> On Sun, Jun 1, 2025 at 9:35=E2=80=AFAM Jan Vermaete via lists.openembedde=
d.org
> <jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:
>
>> Hi Khem,
>>
>> Sorry for that.  I was testing it in a larger ROS 2 system where I did
>> not see this issue.
>>
>> I do have the same issue when running it in a minimal system.
>>
>> ```
>> BBLAYERS ?=3D " \
>>     ${TOPDIR}/../layers/meta-openembedded/meta-networking \
>>     ${TOPDIR}/../layers/meta-openembedded/meta-oe \
>>     ${TOPDIR}/../layers/meta-openembedded/meta-python \
>>     ${TOPDIR}/../layers/poky/meta \
>>     ${TOPDIR}/../layers/poky/meta-poky \
>>     ${TOPDIR}/../layers/poky/meta-yocto-bsp"
>> ```
>>
>> It must be related to this:
>>
>> https://github.com/freeglut/freeglut/commit/41a7cf81aa28cbbd5f7f3fc32c1f=
fef6465bbd8d
>>
>> And adding this to the recipe solved it.   However, for now I do not
>> have any system using it.
>>
>> EXTRA_OECMAKE +=3D "-DOPENGL_opengl_LIBRARY=3D${STAGING_LIBDIR}/libGL.so=
"
>>
>> Could you check if this solution seems to be okay for you?  If so I
>> can provide you with a v2 of the patch.
>>
>> Br
>>
>> On Sun, Jun 1, 2025 at 3:27=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wro=
te:
>> >
>> > it fails to configure
>> >
>> > https://errors.yoctoproject.org/Errors/Details/856261/
>> >
>> > On Fri, May 30, 2025 at 10:11=E2=80=AFAM Jan Vermaete via
>> > lists.openembedded.org <jan.vermaete=3Dgmail.com@lists.openembedded.or=
g>
>> > wrote:
>> > >
>> > > - apply upstream patch to compile at master
>> > > - added HOMEPAGE
>> > > - downloads are not from github
>> > >   "Stable releases are available on our releases page on github,
>> where you can find more information about each release. All releases are
>> also mirrored on the old downloads page on sourceforge."
>> > >   @see: https://freeglut.sourceforge.net/
>> > > - fixed 'devtool check-upgrade-status'
>> > >
>> > > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
>> > > ---
>> > >  ...formDestroyContext-prototype-for-C23.patch | 30
>> +++++++++++++++++++
>> > >  .../{freeglut_3.4.0.bb =3D> freeglut_3.6.0.bb}  | 14 +++++++--
>> > >  2 files changed, 41 insertions(+), 3 deletions(-)
>> > >  create mode 100644
>> meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformDestro=
yContext-prototype-for-C23.patch
>> > >  rename meta-oe/recipes-graphics/freeglut/{freeglut_3.4.0.bb =3D>
>> freeglut_3.6.0.bb} (69%)
>> > >
>> > > diff --git
>> a/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformDest=
royContext-prototype-for-C23.patch
>> b/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformDest=
royContext-prototype-for-C23.patch
>> > > new file mode 100644
>> > > index 0000000000..13ba2316f3
>> > > --- /dev/null
>> > > +++
>> b/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgPlatformDest=
royContext-prototype-for-C23.patch
>> > > @@ -0,0 +1,30 @@
>> > > +From 800772e993a3ceffa01ccf3fca449d3279cde338 Mon Sep 17 00:00:00
>> 2001
>> > > +From: Sam James <sam@gentoo.org>
>> > > +Date: Sun, 17 Nov 2024 01:14:26 +0000
>> > > +Subject: [PATCH 1/1] egl: fix fgPlatformDestroyContext prototype fo=
r
>> C23
>> > > +
>> > > +C23 removes unprototyped functions, so this conflicted with the
>> definition
>> > > +in fg_init_x11.c.
>> > > +
>> > > +Bug: https://github.com/freeglut/freeglut/issues/186
>> > > +
>> > > +Upstream-Status: Backport [
>> https://github.com/freeglut/freeglut/commit/800772e993a3ceffa01ccf3fca44=
9d3279cde338
>> ]
>> > > +---
>> > > + src/egl/fg_init_egl.h | 2 +-
>> > > + 1 file changed, 1 insertion(+), 1 deletion(-)
>> > > +
>> > > +diff --git a/src/egl/fg_init_egl.h b/src/egl/fg_init_egl.h
>> > > +index 592c5221..8753dc0b 100644
>> > > +--- a/src/egl/fg_init_egl.h
>> > > ++++ b/src/egl/fg_init_egl.h
>> > > +@@ -28,6 +28,6 @@
>> > > +
>> > > + extern void fghPlatformInitializeEGL();
>> > > + extern void fghPlatformCloseDisplayEGL();
>> > > +-extern void fgPlatformDestroyContext();
>> > > ++extern void fgPlatformDestroyContext ( SFG_PlatformDisplay
>> pDisplay, SFG_WindowContextType MContext );
>> > > +
>> > > + #endif
>> > > +--
>> > > +2.39.5
>> > > +
>> > > diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
>> b/meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
>> > > similarity index 69%
>> > > rename from meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
>> > > rename to meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
>> > > index 2cd00b0349..ebd5fbcbce 100644
>> > > --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
>> > > +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.6.0.bb
>> > > @@ -1,10 +1,15 @@
>> > >  DESCRIPTION =3D "FreeGLUT is a free-software/open-source alternativ=
e
>> to the OpenGL \
>> > >                 Utility Toolkit (GLUT) library"
>> > > +HOMEPAGE =3D "https://freeglut.sourceforge.net"
>> > >  LICENSE =3D "MIT"
>> > >  LIC_FILES_CHKSUM =3D
>> "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e78adfb"
>> > >
>> > > -SRC_URI =3D "
>> https://sourceforge.net/projects/${BPN}/files/${BPN}/${PV}/${BPN}-${PV}.=
tar.gz
>> "
>> > > -SRC_URI[sha256sum] =3D
>> "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
>> > > +SRC_URI =3D "\
>> > > +
>> https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.t=
ar.gz
>> \
>> > > +
>> file://0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch \
>> > > +"
>> > > +
>> > > +SRC_URI[sha256sum] =3D
>> "9c3d4d6516fbfa0280edc93c77698fb7303e443c1aaaf37d269e3288a6c3ea52"
>> > >
>> > >  inherit cmake features_check pkgconfig
>> > >
>> > > @@ -22,7 +27,10 @@ CFLAGS +=3D "-Wno-implicit-function-declaration"
>> > >
>> > >  PROVIDES +=3D "mesa-glut"
>> > >
>> > > -DEPENDS =3D "virtual/libgl libxi"
>> > > +DEPENDS +=3D "virtual/libgl libxi"
>> > > +
>> > > +UPSTREAM_CHECK_REGEX =3D "releases/tag/v(?P<pver>\d+(\.\d+)+)"
>> > > +UPSTREAM_CHECK_URI =3D "https://github.com/${BPN}/${BPN}/releases"
>> > >
>> > >  do_install:append() {
>> > >      # Remove buildpaths
>> > > --
>> > > 2.39.5
>> > >
>> > >
>> > >
>> > >
>>
>>
>>
>> --
>> Jan Vermaete
>> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#117694):
>> https://lists.openembedded.org/g/openembedded-devel/message/117694
>> Mute This Topic: https://lists.openembedded.org/mt/113383172/556952
>> Group Owner: openembedded-devel+owner@lists.openembedded.org
>> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
>> rob.woolleywr@gmail.com]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>
>>

--000000000000e82c2a063ccbc809
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">(Resending with my GMail as I mistakenly used Ross&#39; ol=
d email and got 3 messages about blocked messages from Gmail.)<br><br>My ma=
in reservation with my proposed fix is that the CMake page says &quot;GLVND=
 is currently the only way to get OpenGL 3+ functionality via EGL in a mann=
er portable across vendors.&quot;.=C2=A0 So, upstream may want to retain Op=
enGL::OpenGL.=C2=A0 This assertion may not be true for us with OpenEmbedded=
, and this patch may be valid for us, but not for upstream.<br><br>Any feed=
back warmly welcomed.<br><br>Regards,<div>Rob</div></div><br><div class=3D"=
gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, Aug 19, 2025 at 5:37=E2=80=AFPM Rob Woolley &lt;<a href=3D"mailto:rob=
.woolley@windriver.com">rob.woolley@windriver.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">After the=
 call today, I made an attempt at supporting both glvnd and legacy modes.=
=C2=A0 My potential fix is available here:=C2=A0

<a href=3D"https://github.com/robwoolley/meta-openembedded/commit/d4732fdca=
2ac327520cd6d3d2438cbaff97025a9" target=3D"_blank">Add support for legacy O=
penGL =C2=B7 robwoolley/meta-openembedded@d4732fd</a>=C2=A0I am looking for=
 feedback from someone more familiar with OpenGL than I am before I send it=
 upstream to the freeglut project.<br><br>When I look at the CMake FindOpen=
GL page (=C2=A0<a href=3D"https://cmake.org/cmake/help/latest/module/FindOp=
enGL.html" target=3D"_blank">https://cmake.org/cmake/help/latest/module/Fin=
dOpenGL.html</a> ) it says that there is a OpenGL_GL_PREFERENCE variable th=
at can be set to choose between GLVND and LEGACY mode.=C2=A0 However, if th=
e OpenGL::OpenGL component=C2=A0is added explicitly as a target dependency =
it implies GLVND.=C2=A0 The OpenGL::OpenGL component=C2=A0is used explicitl=
y in freeglut 3.6.0.<br><br>My interpretation of the Linux-specific (<a hre=
f=3D"https://cmake.org/cmake/help/latest/module/FindOpenGL.html#linux-speci=
fic" target=3D"_blank">https://cmake.org/cmake/help/latest/module/FindOpenG=
L.html#linux-specific</a> ) section=C2=A0is that using OpenGL:GL instead wi=
ll use libGL.so when GLVND is not present.=C2=A0 However, when OpenGL_GL_PR=
EFERENCE is set to GLVND it will set OPENGL_gl_LIBRARY (ie legacy GL) to em=
pty and fallback to OpenGL::OpenGL (ie GLVND).<br><br>I tested this using Y=
oe and qemuarm as reported before (=C2=A0<a href=3D"https://errors.yoctopro=
ject.org/Errors/Details/856261/" target=3D"_blank">https://errors.yoctoproj=
ect.org/Errors/Details/856261/</a> ).=C2=A0 The freeglut recipe successfull=
y builds both with and without glvnd in DISTRO_FEATURES.<br><br>Regards,<br=
>Rob</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Sun, Jun 1, 2025 at 9:35=E2=80=AFAM Jan Vermaete via <a href=3D"http=
://lists.openembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt=
;jan.vermaete=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" target=
=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">Hi Khem,<br>
<br>
Sorry for that.=C2=A0 I was testing it in a larger ROS 2 system where I did=
<br>
not see this issue.<br>
<br>
I do have the same issue when running it in a minimal system.<br>
<br>
```<br>
BBLAYERS ?=3D &quot; \<br>
=C2=A0 =C2=A0 ${TOPDIR}/../layers/meta-openembedded/meta-networking \<br>
=C2=A0 =C2=A0 ${TOPDIR}/../layers/meta-openembedded/meta-oe \<br>
=C2=A0 =C2=A0 ${TOPDIR}/../layers/meta-openembedded/meta-python \<br>
=C2=A0 =C2=A0 ${TOPDIR}/../layers/poky/meta \<br>
=C2=A0 =C2=A0 ${TOPDIR}/../layers/poky/meta-poky \<br>
=C2=A0 =C2=A0 ${TOPDIR}/../layers/poky/meta-yocto-bsp&quot;<br>
```<br>
<br>
It must be related to this:<br>
<a href=3D"https://github.com/freeglut/freeglut/commit/41a7cf81aa28cbbd5f7f=
3fc32c1ffef6465bbd8d" rel=3D"noreferrer" target=3D"_blank">https://github.c=
om/freeglut/freeglut/commit/41a7cf81aa28cbbd5f7f3fc32c1ffef6465bbd8d</a><br=
>
<br>
And adding this to the recipe solved it.=C2=A0 =C2=A0However, for now I do =
not<br>
have any system using it.<br>
<br>
EXTRA_OECMAKE +=3D &quot;-DOPENGL_opengl_LIBRARY=3D${STAGING_LIBDIR}/libGL.=
so&quot;<br>
<br>
Could you check if this solution seems to be okay for you?=C2=A0 If so I<br=
>
can provide you with a v2 of the patch.<br>
<br>
Br<br>
<br>
On Sun, Jun 1, 2025 at 3:27=E2=80=AFAM Khem Raj &lt;<a href=3D"mailto:raj.k=
hem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; it fails to configure<br>
&gt;<br>
&gt; <a href=3D"https://errors.yoctoproject.org/Errors/Details/856261/" rel=
=3D"noreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/De=
tails/856261/</a><br>
&gt;<br>
&gt; On Fri, May 30, 2025 at 10:11=E2=80=AFAM Jan Vermaete via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;jan.vermaete=3D<a href=3D"mailto:gm=
ail.com@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembed=
ded.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; - apply upstream patch to compile at master<br>
&gt; &gt; - added HOMEPAGE<br>
&gt; &gt; - downloads are not from github<br>
&gt; &gt;=C2=A0 =C2=A0&quot;Stable releases are available on our releases p=
age on github, where you can find more information about each release. All =
releases are also mirrored on the old downloads page on sourceforge.&quot;<=
br>
&gt; &gt;=C2=A0 =C2=A0@see: <a href=3D"https://freeglut.sourceforge.net/" r=
el=3D"noreferrer" target=3D"_blank">https://freeglut.sourceforge.net/</a><b=
r>
&gt; &gt; - fixed &#39;devtool check-upgrade-status&#39;<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jan Vermaete &lt;<a href=3D"mailto:jan.vermaete@gm=
ail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 ...formDestroyContext-prototype-for-C23.patch | 30 ++++++++=
+++++++++++<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://freeglut_3.4.0.bb" rel=3D"noreferrer=
" target=3D"_blank">freeglut_3.4.0.bb</a> =3D&gt; <a href=3D"http://freeglu=
t_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.6.0.bb</a>}=C2=
=A0 | 14 +++++++--<br>
&gt; &gt;=C2=A0 2 files changed, 41 insertions(+), 3 deletions(-)<br>
&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-graphics/freeglut/freegl=
ut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-C23.patch<br>
&gt; &gt;=C2=A0 rename meta-oe/recipes-graphics/freeglut/{<a href=3D"http:/=
/freeglut_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb<=
/a> =3D&gt; <a href=3D"http://freeglut_3.6.0.bb" rel=3D"noreferrer" target=
=3D"_blank">freeglut_3.6.0.bb</a>} (69%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-=
fix-fgPlatformDestroyContext-prototype-for-C23.patch b/meta-oe/recipes-grap=
hics/freeglut/freeglut/0001-egl-fix-fgPlatformDestroyContext-prototype-for-=
C23.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000..13ba2316f3<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/meta-oe/recipes-graphics/freeglut/freeglut/0001-egl-fix-fgP=
latformDestroyContext-prototype-for-C23.patch<br>
&gt; &gt; @@ -0,0 +1,30 @@<br>
&gt; &gt; +From 800772e993a3ceffa01ccf3fca449d3279cde338 Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; +From: Sam James &lt;<a href=3D"mailto:sam@gentoo.org" target=3D"=
_blank">sam@gentoo.org</a>&gt;<br>
&gt; &gt; +Date: Sun, 17 Nov 2024 01:14:26 +0000<br>
&gt; &gt; +Subject: [PATCH 1/1] egl: fix fgPlatformDestroyContext prototype=
 for C23<br>
&gt; &gt; +<br>
&gt; &gt; +C23 removes unprototyped functions, so this conflicted with the =
definition<br>
&gt; &gt; +in fg_init_x11.c.<br>
&gt; &gt; +<br>
&gt; &gt; +Bug: <a href=3D"https://github.com/freeglut/freeglut/issues/186"=
 rel=3D"noreferrer" target=3D"_blank">https://github.com/freeglut/freeglut/=
issues/186</a><br>
&gt; &gt; +<br>
&gt; &gt; +Upstream-Status: Backport [<a href=3D"https://github.com/freeglu=
t/freeglut/commit/800772e993a3ceffa01ccf3fca449d3279cde338" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/freeglut/freeglut/commit/800772e99=
3a3ceffa01ccf3fca449d3279cde338</a>]<br>
&gt; &gt; +---<br>
&gt; &gt; + src/egl/fg_init_egl.h | 2 +-<br>
&gt; &gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/src/egl/fg_init_egl.h b/src/egl/fg_init_egl.h<br>
&gt; &gt; +index 592c5221..8753dc0b 100644<br>
&gt; &gt; +--- a/src/egl/fg_init_egl.h<br>
&gt; &gt; ++++ b/src/egl/fg_init_egl.h<br>
&gt; &gt; +@@ -28,6 +28,6 @@<br>
&gt; &gt; +<br>
&gt; &gt; + extern void fghPlatformInitializeEGL();<br>
&gt; &gt; + extern void fghPlatformCloseDisplayEGL();<br>
&gt; &gt; +-extern void fgPlatformDestroyContext();<br>
&gt; &gt; ++extern void fgPlatformDestroyContext ( SFG_PlatformDisplay pDis=
play, SFG_WindowContextType MContext );<br>
&gt; &gt; +<br>
&gt; &gt; + #endif<br>
&gt; &gt; +--<br>
&gt; &gt; +2.39.5<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/meta-oe/recipes-graphics/freeglut/<a href=3D"http://=
freeglut_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</=
a> b/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.6.0.bb"=
 rel=3D"noreferrer" target=3D"_blank">freeglut_3.6.0.bb</a><br>
&gt; &gt; similarity index 69%<br>
&gt; &gt; rename from meta-oe/recipes-graphics/freeglut/<a href=3D"http://f=
reeglut_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a=
><br>
&gt; &gt; rename to meta-oe/recipes-graphics/freeglut/<a href=3D"http://fre=
eglut_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.6.0.bb</a><=
br>
&gt; &gt; index 2cd00b0349..ebd5fbcbce 100644<br>
&gt; &gt; --- a/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglu=
t_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglu=
t_3.6.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.6.0.bb</a><br>
&gt; &gt; @@ -1,10 +1,15 @@<br>
&gt; &gt;=C2=A0 DESCRIPTION =3D &quot;FreeGLUT is a free-software/open-sour=
ce alternative to the OpenGL \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Util=
ity Toolkit (GLUT) library&quot;<br>
&gt; &gt; +HOMEPAGE =3D &quot;<a href=3D"https://freeglut.sourceforge.net" =
rel=3D"noreferrer" target=3D"_blank">https://freeglut.sourceforge.net</a>&q=
uot;<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D89c0b58a3e0=
1ce3d8254c9f59e78adfb&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI =3D &quot;<a href=3D"https://sourceforge.net/projects/$%=
7BBPN%7D/files/$%7BBPN%7D/$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"nor=
eferrer" target=3D"_blank">https://sourceforge.net/projects/${BPN}/files/${=
BPN}/${PV}/${BPN}-${PV}.tar.gz</a>&quot;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;3c0bcb915d9b180a97edaebd011b7a1de54=
583a838644dcd42bb0ea0c6f3eaec&quot;<br>
&gt; &gt; +SRC_URI =3D &quot;\<br>
&gt; &gt; +=C2=A0 =C2=A0 <a href=3D"https://github.com/$%7BBPN%7D/$%7BBPN%7=
D/releases/download/v$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"noreferr=
er" target=3D"_blank">https://github.com/${BPN}/${BPN}/releases/download/v$=
{PV}/${BPN}-${PV}.tar.gz</a> \<br>
&gt; &gt; +=C2=A0 =C2=A0 file://0001-egl-fix-fgPlatformDestroyContext-proto=
type-for-C23.patch \<br>
&gt; &gt; +&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;9c3d4d6516fbfa0280edc93c77698fb7303=
e443c1aaaf37d269e3288a6c3ea52&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit cmake features_check pkgconfig<br>
&gt; &gt;<br>
&gt; &gt; @@ -22,7 +27,10 @@ CFLAGS +=3D &quot;-Wno-implicit-function-decla=
ration&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PROVIDES +=3D &quot;mesa-glut&quot;<br>
&gt; &gt;<br>
&gt; &gt; -DEPENDS =3D &quot;virtual/libgl libxi&quot;<br>
&gt; &gt; +DEPENDS +=3D &quot;virtual/libgl libxi&quot;<br>
&gt; &gt; +<br>
&gt; &gt; +UPSTREAM_CHECK_REGEX =3D &quot;releases/tag/v(?P&lt;pver&gt;\d+(=
\.\d+)+)&quot;<br>
&gt; &gt; +UPSTREAM_CHECK_URI =3D &quot;<a href=3D"https://github.com/$%7BB=
PN%7D/$%7BBPN%7D/releases" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/${BPN}/${BPN}/releases</a>&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 do_install:append() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 # Remove buildpaths<br>
&gt; &gt; --<br>
&gt; &gt; 2.39.5<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
<br>
<br>
<br>
-- <br>
Jan Vermaete<br>
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel<br=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117694): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117694" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117694</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/113383172/556=
952" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/113383172/556952</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:rob.woolleywr@gmail.com"=
 target=3D"_blank">rob.woolleywr@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>
</blockquote></div>

--000000000000e82c2a063ccbc809--

