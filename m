Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B96F8E6B26E
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 02:20:30 +0000 (UTC)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.93786.1766456425013771837
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 22 Dec 2025 18:20:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mZ7HTblP;
 spf=pass (domain: gmail.com, ip: 209.85.128.173, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-78c66bdf675so37702057b3.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 22 Dec 2025 18:20:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766456424; x=1767061224; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vVboVEylOAll3cZ9zighuuxNbs2D6KeIbMR/4VONAvw=;
        b=mZ7HTblPo086irSMuH9Oa4K1IohZfHrOqb4OSwLnK7Un6T177/sUBpthBso1Py9RKA
         Itcle7o3SV65JcOvDdUnAu1HVRU29i77tBVRV17SK7J0QrOjMsUaltZMap3n65D19eZK
         u6sQcUmzUzIqHgiMGzwr8QYgwEzqlWXf9egoNuSy3SU6VVV8Pfb7Wbffmzgty+xPsFeS
         p4DUGFGyApAcG6YR5aypArfJfQFOJUzIo3+I4xBNwvO+YdrSuKWBA/+HPFwypKe3uCqp
         K6E7rDC06VXooTkMGRnPcbwL2v8+nk5JajTSrZ1OUnzU0MKr2AMbsTpvDyODB/sWEKib
         ZSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766456424; x=1767061224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vVboVEylOAll3cZ9zighuuxNbs2D6KeIbMR/4VONAvw=;
        b=ld0UJyrjf1HyZ0fsyBeLMiOfc4aq3DQtFA1Bhq5P8DmeRd+nlPva3hKm5wfbdE+Q8+
         kjCHmXTIn9l/+N6DvZ3lwS59w+gmiVuI572KUbfN918QX0eiRZkpOX7UogjpDXcT60w4
         Zcwoa5NMa4TwZyFPKRhHGmHQxMriNqv5gajn7cLIdjMGrqHaEHyVRnL5aUPQGtundw38
         Ll9CS2R+d2Mh2HDXtxXmZVVzmYjvBYCkpzMebYoU/qvhEEphOhIR+JHOYyBa+Ted8OBw
         4obXElLZlumjencJ7jvIKH2LnZSq0+yyADY7dTdb3ugtvNufkDeUun2ZBD3wIgr7b5+5
         ZxfQ==
X-Gm-Message-State: AOJu0YwUHZ8AC/RQ6eoVUqWwmoT+PdLjiRhE20HS8J6a24WBJJ/EvayW
	sUOHiBfoeiueWLb2sDvOXF8mDDtCiEJd2xlEEc34jBeTBdJvVdeVJR4Gm5yxpwwxrDqUQy6nrZP
	CYCgC/1Hwq5L01U/L3EF7CzLnAP98AACw+BkriRg=
X-Gm-Gg: AY/fxX4z24gbD13c1SSMu44myN0SEreCVUWKQALFE1zk3kiJTZgXb7sheeQDOtqpdzj
	m+3vMEVwmL/9GoTObHuQ/Zz25lqYZdukJ4MQfwkTAN9kGEjYgqc5LowRNsDkDk9GKHz+wBq9m60
	klEeVDiF6sFygRUjmMzEFYFUwcnZrNRXum8se3zqKvaLQVDx9XdpejkR3okvCwPn3KE6o3NbTFV
	oRoueLiHklnX5lhyv5urRanNjZa9xs+CHlYuLbGE2lsY4PEIZHJu1kLjGIbyGYJlfmU/aNuUx6X
	A07kLmVD8kLszAMGaxpKYJ2EhhawW7ou7tUxrahXxSXY5Br+IDXLIE31a41YBg08bx5Y7Zw93ri
	4NTcwgO3wS9IXTZA91EoP6eMt7AQ=
X-Google-Smtp-Source: AGHT+IExJmJ1093s5AFjuIquYqi1VbTYaVPmSBZAmo5NPaaTRATuhyRNO1ckkPtnMvHOzoxncVleObogKBd/1crUOHU=
X-Received: by 2002:a05:690c:9b0a:b0:787:eca1:50cf with SMTP id
 00721157ae682-78fb4186acfmr117612437b3.50.1766456423974; Mon, 22 Dec 2025
 18:20:23 -0800 (PST)
MIME-Version: 1.0
References: <20251222185220.1722980-1-jan.vermaete@gmail.com> <CABF_=yhOCYZ2htospYbwxFfTyGV+B=ZQ74yVCrk28JhXnckfxA@mail.gmail.com>
In-Reply-To: <CABF_=yhOCYZ2htospYbwxFfTyGV+B=ZQ74yVCrk28JhXnckfxA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Dec 2025 18:19:57 -0800
X-Gm-Features: AQt7F2qB1AeRpbIXe07Bd5rlh2ttHck2gcGtVWKpolSgdwTrA30uTtWrEZts6Vw
Message-ID: <CAMKF1srSv9cU9kZ3t0CNN_tE3wcg7xfuv9AJWUDWFyxj8og5Uw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freeglut: version 3.4.0 -> 3.8.0
To: jan.vermaete@gmail.com
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a990ad0646952f52"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Dec 2025 02:20:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122814

--000000000000a990ad0646952f52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

it fails to build on YP AB -
https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/4644384/raw_inlin=
e

 -- Found OpenGL:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/freeglut/3.8.0/recipe-sysroot/usr/lib/libGL.so
 found components: OpenGL
| -- Found PkgConfig:
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/freeglut/3.8.0/recipe-sysroot-native/usr/bin/pkg-config
(found version "0.29.2")
| CMake Error at
/srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-lin=
ux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.2/Modules/FindPac=
kageHandleStandardArgs.cmake:290
(message):
|   Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY)
| Call Stack (most recent call first):
|   /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky=
-linux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.2/Modules/Fin=
dPackageHandleStandardArgs.cmake:654
(_FPHSA_FAILURE_MESSAGE)
|   /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky=
-linux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.2/Modules/Fin=
dOpenGL.cmake:698
(find_package_handle_standard_args)
|   CMakeLists.txt:435 (FIND_PACKAGE)
|
|
| -- Configuring incomplete, errors occurred!
| WARNING: exit code 1 from a shell command.


On Mon, Dec 22, 2025 at 10:58=E2=80=AFAM Jan Vermaete via lists.openembedde=
d.org
<jan.vermaete=3Dgmail.com@lists.openembedded.org> wrote:

> Note: I could not test these changes. The previous recipe did not
> compile on master in the meta-ros layer, and I=E2=80=99m not sure where i=
t is
> currently used within meta-ros.
>
> On Mon, Dec 22, 2025 at 7:54=E2=80=AFPM Jan Vermaete <jan.vermaete@gmail.=
com>
> wrote:
> >
> >     2025-11-16  John Tsiombikas <nuclear@mutantstargoat.com>
> >
> >         freeglut 3.8 changes:
> >
> >         * New experimental Cocoa (native MacOS X) backend.
> >         * Add glutSwapInterval, to control vsync (currently X11 and
> win32 only).
> >         * glutExtensionSupported now also reports platform extensions
> (GLX/WGL).
> >         * Fix build issues with new cmake versions while maintaining
> >           compatibility with old cmake.
> >         * Fix handling of UTF8 window/icon titles.
> >         * Fix issue with some X11 window managers not properly restorin=
g
> >           iconified windows (send _NET_ACTIVE_WINDOW EWMH client
> message).
> >         * Fix build issues with C23 compilers (empty argument list
> semantics).
> >         * Fix compatibility with older versions of windows which don't
> have
> >           RAWHID support (before XP), by loading the entry points
> dynamically.
> >         * Fix glutInitDisplayString parsing of "aux", and add =3DN pars=
ing
> support
> >           to specify samples and auxbufs.
> >         * Various fixes and improvements in the GameCube/Wii backend.
> >         * Altbuild support for Solaris 2.6/SUN Workshop C.
> >         * Started conversion of documentation from the website to
> markdown in
> >           the source tree: doc/api.md
> >         * Added the original GLUT manpages, with permission from Mark
> Kilgard.
> >         * New demos: accum, vsync, and windows.
> >         * Cleanup of some old and no longer relevant, or redundant
> comments in
> >           the source code.
> >         * Removed some out of date README files, and updated others.
> >
> >     2024-06-08  John Tsiombikas <nuclear@member.fsf.org>
> >
> >         freeglut 3.6 changes:
> >
> >         * New platforms: Nintendo Gamecube and Nintendo Wii.
> >         * Minimum cmake version raised to 3.1.
> >         * Make XInput an optional dependency.
> >         * Fix incorrect modifier bit mapped to GLUT_ACTIVE_SUPER on X11=
.
> >         * Add support for ARM64 MSVC targets.
> >         * Fix for unicode builds on windows.
> >         * Fix build on some versions of MinGW carrying an incorrect
> winuser.h.
> >         * Fix menu-related memory leak when an error occurs.
> >         * Various build improvements & fixes.
> >
> > Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
> > ---
> >  .../freeglut/{freeglut_3.4.0.bb =3D> freeglut_3.8.0.bb}        | 5 ++-=
--
> >  1 file changed, 2 insertions(+), 3 deletions(-)
> >  rename meta-oe/recipes-graphics/freeglut/{freeglut_3.4.0.bb =3D>
> freeglut_3.8.0.bb} (90%)
> >
> > diff --git a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
> > similarity index 90%
> > rename from meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> > rename to meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
> > index 13f3d111fe..25ba1e05bb 100644
> > --- a/meta-oe/recipes-graphics/freeglut/freeglut_3.4.0.bb
> > +++ b/meta-oe/recipes-graphics/freeglut/freeglut_3.8.0.bb
> > @@ -5,12 +5,10 @@ LICENSE =3D "MIT"
> >  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D89c0b58a3e01ce3d8254c9f59e7=
8adfb"
> >
> >  SRC_URI =3D "
> https://github.com/${BPN}/${BPN}/releases/download/v${PV}/${BPN}-${PV}.ta=
r.gz
> "
> > -SRC_URI[sha256sum] =3D
> "3c0bcb915d9b180a97edaebd011b7a1de54583a838644dcd42bb0ea0c6f3eaec"
> > +SRC_URI[sha256sum] =3D
> "674dcaff25010e09e450aec458b8870d9e98c46f99538db457ab659b321d9989"
> >
> >  inherit cmake features_check pkgconfig
> >
> > -EXTRA_OECMAKE =3D "-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5"
> > -
> >  # depends on virtual/libgl and libxi
> >  REQUIRED_DISTRO_FEATURES =3D "opengl x11"
> >
> > @@ -19,6 +17,7 @@ PACKAGECONFIG[gles] =3D
> "-DFREEGLUT_GLES=3DON,-DFREEGLUT_GLES=3DOFF,"
> >  PACKAGECONFIG[wayland] =3D
> "-DFREEGLUT_WAYLAND=3DON,-DFREEGLUT_WAYLAND=3DOFF,libxkbcommon"
> >  PACKAGECONFIG[demos] =3D
> "-DFREEGLUT_BUILD_DEMOS=3DON,-DFREEGLUT_BUILD_DEMOS=3DOFF,"
> >  PACKAGECONFIG[x11] =3D ",,virtual/libx11 libice libxmu libglu libxrand=
r
> libxext"
> > +
> >  # Add -Wno-implicit-function-declaration since it might be otherwise
> treated at
> >  # error by clang16+ and this is not really a problem
> >  CFLAGS +=3D "-Wno-implicit-function-declaration"
> > --
> > 2.47.3
> >
>
>
> --
> Jan Vermaete
> =E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#122798):
> https://lists.openembedded.org/g/openembedded-devel/message/122798
> Mute This Topic: https://lists.openembedded.org/mt/116905850/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000a990ad0646952f52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">it fails to build on YP AB -=C2=A0<a href=3D"https://autob=
uilder.yoctoproject.org/valkyrie/api/v2/logs/4644384/raw_inline">https://au=
tobuilder.yoctoproject.org/valkyrie/api/v2/logs/4644384/raw_inline</a><div>=
<br></div><div><pre style=3D"color:rgb(255,255,255)"> -- Found OpenGL: /srv=
/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky-linux/f=
reeglut/3.8.0/recipe-sysroot/usr/lib/libGL.so  found components: OpenGL
| -- Found PkgConfig: /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/w=
ork/x86-64-v3-poky-linux/freeglut/3.8.0/recipe-sysroot-native/usr/bin/pkg-c=
onfig (found version &quot;0.29.2&quot;)
| CMake Error at /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x=
86-64-v3-poky-linux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.=
2/Modules/FindPackageHandleStandardArgs.cmake:290 (message):
|   Could NOT find OpenGL (missing: OPENGL_opengl_LIBRARY)
| Call Stack (most recent call first):
|   /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky=
-linux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.2/Modules/Fin=
dPackageHandleStandardArgs.cmake:654 (_FPHSA_FAILURE_MESSAGE)
|   /srv/pokybuild/yocto-worker/meta-oe/build/build/tmp/work/x86-64-v3-poky=
-linux/freeglut/3.8.0/recipe-sysroot-native/usr/share/cmake-4.2/Modules/Fin=
dOpenGL.cmake:698 (find_package_handle_standard_args)
|   CMakeLists.txt:435 (FIND_PACKAGE)
|=20
|=20
| -- Configuring incomplete, errors occurred!
| WARNING: exit code 1 from a shell command.</pre></div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Mon, Dec 22, 2025 at 10:58=E2=80=AFAM Jan Vermaete via <a href=3D"htt=
p://lists.openembedded.org">lists.openembedded.org</a> &lt;jan.vermaete=3D<=
a href=3D"mailto:gmail.com@lists.openembedded.org">gmail.com@lists.openembe=
dded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Note: I could not test these changes. The previous recipe did not<b=
r>
compile on master in the meta-ros layer, and I=E2=80=99m not sure where it =
is<br>
currently used within meta-ros.<br>
<br>
On Mon, Dec 22, 2025 at 7:54=E2=80=AFPM Jan Vermaete &lt;<a href=3D"mailto:=
jan.vermaete@gmail.com" target=3D"_blank">jan.vermaete@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A02025-11-16=C2=A0 John Tsiombikas &lt;<a href=3D"mai=
lto:nuclear@mutantstargoat.com" target=3D"_blank">nuclear@mutantstargoat.co=
m</a>&gt;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freeglut 3.8 changes:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* New experimental Cocoa (native MacO=
S X) backend.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add glutSwapInterval, to control vs=
ync (currently X11 and win32 only).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* glutExtensionSupported now also rep=
orts platform extensions (GLX/WGL).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix build issues with new cmake ver=
sions while maintaining<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatibility with old cmake.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix handling of UTF8 window/icon ti=
tles.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix issue with some X11 window mana=
gers not properly restoring<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0iconified windows (send _NET_A=
CTIVE_WINDOW EWMH client message).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix build issues with C23 compilers=
 (empty argument list semantics).<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix compatibility with older versio=
ns of windows which don&#39;t have<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0RAWHID support (before XP), by=
 loading the entry points dynamically.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix glutInitDisplayString parsing o=
f &quot;aux&quot;, and add =3DN parsing support<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to specify samples and auxbufs=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Various fixes and improvements in t=
he GameCube/Wii backend.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Altbuild support for Solaris 2.6/SU=
N Workshop C.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Started conversion of documentation=
 from the website to markdown in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the source tree: doc/api.md<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Added the original GLUT manpages, w=
ith permission from Mark Kilgard.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* New demos: accum, vsync, and window=
s.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Cleanup of some old and no longer r=
elevant, or redundant comments in<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0the source code.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Removed some out of date README fil=
es, and updated others.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A02024-06-08=C2=A0 John Tsiombikas &lt;<a href=3D"mai=
lto:nuclear@member.fsf.org" target=3D"_blank">nuclear@member.fsf.org</a>&gt=
;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0freeglut 3.6 changes:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* New platforms: Nintendo Gamecube an=
d Nintendo Wii.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Minimum cmake version raised to 3.1=
.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Make XInput an optional dependency.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix incorrect modifier bit mapped t=
o GLUT_ACTIVE_SUPER on X11.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Add support for ARM64 MSVC targets.=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix for unicode builds on windows.<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix build on some versions of MinGW=
 carrying an incorrect winuser.h.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Fix menu-related memory leak when a=
n error occurs.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Various build improvements &amp; fi=
xes.<br>
&gt;<br>
&gt; Signed-off-by: Jan Vermaete &lt;<a href=3D"mailto:jan.vermaete@gmail.c=
om" target=3D"_blank">jan.vermaete@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../freeglut/{<a href=3D"http://freeglut_3.4.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">freeglut_3.4.0.bb</a> =3D&gt; <a href=3D"http://fre=
eglut_3.8.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.8.0.bb</a>}=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 5 ++---<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 3 deletions(-)<br>
&gt;=C2=A0 rename meta-oe/recipes-graphics/freeglut/{<a href=3D"http://free=
glut_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a> =
=3D&gt; <a href=3D"http://freeglut_3.8.0.bb" rel=3D"noreferrer" target=3D"_=
blank">freeglut_3.8.0.bb</a>} (90%)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeg=
lut_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a> b/=
meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.8.0.bb" rel=
=3D"noreferrer" target=3D"_blank">freeglut_3.8.0.bb</a><br>
&gt; similarity index 90%<br>
&gt; rename from meta-oe/recipes-graphics/freeglut/<a href=3D"http://freegl=
ut_3.4.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a><br>
&gt; rename to meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut=
_3.8.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.8.0.bb</a><br>
&gt; index 13f3d111fe..25ba1e05bb 100644<br>
&gt; --- a/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.4=
.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.4.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/freeglut/<a href=3D"http://freeglut_3.8=
.0.bb" rel=3D"noreferrer" target=3D"_blank">freeglut_3.8.0.bb</a><br>
&gt; @@ -5,12 +5,10 @@ LICENSE =3D &quot;MIT&quot;<br>
&gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D89c0b58a3e01ce3d=
8254c9f59e78adfb&quot;<br>
&gt;<br>
&gt;=C2=A0 SRC_URI =3D &quot;<a href=3D"https://github.com/$%7BBPN%7D/$%7BB=
PN%7D/releases/download/v$%7BPV%7D/$%7BBPN%7D-$%7BPV%7D.tar.gz" rel=3D"nore=
ferrer" target=3D"_blank">https://github.com/${BPN}/${BPN}/releases/downloa=
d/v${PV}/${BPN}-${PV}.tar.gz</a>&quot;<br>
&gt; -SRC_URI[sha256sum] =3D &quot;3c0bcb915d9b180a97edaebd011b7a1de54583a8=
38644dcd42bb0ea0c6f3eaec&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;674dcaff25010e09e450aec458b8870d9e98c46f=
99538db457ab659b321d9989&quot;<br>
&gt;<br>
&gt;=C2=A0 inherit cmake features_check pkgconfig<br>
&gt;<br>
&gt; -EXTRA_OECMAKE =3D &quot;-DCMAKE_POLICY_VERSION_MINIMUM=3D3.5&quot;<br=
>
&gt; -<br>
&gt;=C2=A0 # depends on virtual/libgl and libxi<br>
&gt;=C2=A0 REQUIRED_DISTRO_FEATURES =3D &quot;opengl x11&quot;<br>
&gt;<br>
&gt; @@ -19,6 +17,7 @@ PACKAGECONFIG[gles] =3D &quot;-DFREEGLUT_GLES=3DON,-=
DFREEGLUT_GLES=3DOFF,&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[wayland] =3D &quot;-DFREEGLUT_WAYLAND=3DON,-DFREEG=
LUT_WAYLAND=3DOFF,libxkbcommon&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[demos] =3D &quot;-DFREEGLUT_BUILD_DEMOS=3DON,-DFRE=
EGLUT_BUILD_DEMOS=3DOFF,&quot;<br>
&gt;=C2=A0 PACKAGECONFIG[x11] =3D &quot;,,virtual/libx11 libice libxmu libg=
lu libxrandr libxext&quot;<br>
&gt; +<br>
&gt;=C2=A0 # Add -Wno-implicit-function-declaration since it might be other=
wise treated at<br>
&gt;=C2=A0 # error by clang16+ and this is not really a problem<br>
&gt;=C2=A0 CFLAGS +=3D &quot;-Wno-implicit-function-declaration&quot;<br>
&gt; --<br>
&gt; 2.47.3<br>
&gt;<br>
<br>
<br>
-- <br>
Jan Vermaete<br>
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel<br=
>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#122798): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/122798" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/122798</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/116905850/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/116905850/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000a990ad0646952f52--

