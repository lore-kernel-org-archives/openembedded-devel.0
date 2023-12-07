Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C74C4C4167B
	for <webhook@archiver.kernel.org>; Thu,  7 Dec 2023 18:07:49 +0000 (UTC)
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
 by mx.groups.io with SMTP id smtpd.web11.91428.1701972469077833158
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 Dec 2023 10:07:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MsT2sV75;
 spf=pass (domain: gmail.com, ip: 209.85.160.48, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-1f5da5df68eso813914fac.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 10:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701972468; x=1702577268; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9L2o2/6mKvEtfFG7EpWtM7ANYevpesvwPFz8jkAPEnA=;
        b=MsT2sV75TJyzHVbkah33J/r4yzbdtzkxiDfQSSDyQI1ADYGzBD5fyut8TeWn1EqHei
         JZxZ7lXV24D9Nqw4FrY1kBzEy+tgtDBodKEY5/iwI+JmJ16UY3/fqw/fdEE4uZqTCzAx
         zyDz8qL1SDnVThtJdWwx4fibZFhwA9J9+rf9xqIcnC7/MOMvMw8BKe6Ptp6hAzjVrRCF
         JfqmiTDP3xhs1aoQKG3740D7ZuLr+Z1x8c1C7rr2QrLPgrjL53mHb5tj7wEDzmyODLjm
         lKCTQYSytN1mCtXqj6E2rLoJkodd0Xaz25eiGQLGN4sUDKeCEwCxd529pIR7RL1OdLbi
         tkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701972468; x=1702577268;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9L2o2/6mKvEtfFG7EpWtM7ANYevpesvwPFz8jkAPEnA=;
        b=bVUk8/QJsreGTJaUx/Ci/pfPFwcxWZw6xAd7Ms8X5BFV1maWYuhZkruoqZZRtHp5nh
         iy/kzI2mXtY5r4UjCpk+dieuWNd6eRbokI6N0+ujZYIUs6/OO0AMWd4eUXnFrGbKvbNx
         tqGmHewkt6ES37yQPVYW6ypI+GbqbKuKW7JDhw1WvtEgEbhWjPSCZOA1lzKuwUhPZbcT
         H9woNf8TSnA2lmaosK9jZjW5QfJG5vPGcl/A3ww5Q4fVvaXxV3K0fIeZbNVr51kMLauB
         j2ScKBgOw9Z6vuHG8xbqQcMLd/SnHjBTaNfYHtax/7t5yWyHyRQS3++wXY6mcDDsCwTN
         e+BQ==
X-Gm-Message-State: AOJu0YzJKlFg9G+ua2VpEpPjkNVmwwUrPjIkuN7R+uo+cpbH0wh9Ejxd
	qQlA45IsTLC/QRYXXsMdFbgrfs6CTSeAjYXgZrg=
X-Google-Smtp-Source: AGHT+IEwe/of7XIf1UaXDIkAp139GrvmVPO393/soj37ekQ8/vvt7nOKmUe1SQJXK1ErPGs7AW49g+X2gDRWa03gTQc=
X-Received: by 2002:a05:6870:1712:b0:1fb:75b:1319 with SMTP id
 h18-20020a056870171200b001fb075b1319mr3534056oae.107.1701972468125; Thu, 07
 Dec 2023 10:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20231207091300.1292252-1-alperyasinak1@gmail.com>
 <CAMKF1srzfKRXu_hdf7s5ZV6Us5tKbZ_qjDi9JqMQmMivE7ha_A@mail.gmail.com> <CAGpma=4c4q5WpFnG6E7+ffzdjDJ2jcX1pSfF-m3QiCyQbvhBZg@mail.gmail.com>
In-Reply-To: <CAGpma=4c4q5WpFnG6E7+ffzdjDJ2jcX1pSfF-m3QiCyQbvhBZg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Dec 2023 10:07:37 -0800
Message-ID: <CAMKF1sqpxp1Qh30p7ak48Ssacrt+dojq5N6fh=CYYq-96SdoSQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] xf86-video-mga: upgrade 2.0.0 -> 2.0.1
To: alper ak <alperyasinak1@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006152a3060bef58d4"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 07 Dec 2023 18:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/107287

--0000000000006152a3060bef58d4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 7, 2023 at 9:54=E2=80=AFAM alper ak <alperyasinak1@gmail.com> w=
rote:

> They just fixed the typo in a word. "MERCHANTIBILITY" ->
> "MERCHANTABILITY". Also, I already added it as a description ->
> "License-Update: Fix spelling/wording"


That=E2=80=99s fine send that in with v2

>
>
>
> https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/1e4dbe=
f654bd31f5706b4b860f6b34c7e5e5f440
>
> Khem Raj <raj.khem@gmail.com>, 7 Ara 2023 Per, 20:44 tarihinde =C5=9Funu =
yazd=C4=B1:
> >
> > On Thu, Dec 7, 2023 at 1:13=E2=80=AFAM Alper Ak <alperyasinak1@gmail.co=
m> wrote:
> > >
> > > * checkfile.patch removed because fixed in the new version ->
> https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f227f2=
f286123a9ca64b567783825a2c18b87971
> > > * License-Update: Fix spelling/wording
> > >
> > > Changelog:
> > >
> > > * Fix uninitialized read in MGAEnableSecondOutPut
> > > * gitlab CI: add a basic build test
> > > * Fix spelling/wording issues
> > > * Build xz tarballs instead of bzip2
> > > * configure.ac: fix cross-compilation
> > >
> > > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > > ---
> > >  .../xf86-video-mga/checkfile.patch            | 68 -----------------=
--
> > >  ...o-mga_2.0.0.bb =3D> xf86-video-mga_2.0.1.bb} |  8 +--
> > >  2 files changed, 3 insertions(+), 73 deletions(-)
> > >  delete mode 100644
> meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> > >  rename meta-oe/recipes-graphics/xorg-driver/{xf86-video-mga_2.0.0.bb
> =3D> xf86-video-mga_2.0.1.bb} (66%)
> > >
> > > diff --git
> a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> > > deleted file mode 100644
> > > index ceae6dfba..000000000
> > > ---
> a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfile.patch
> > > +++ /dev/null
> > > @@ -1,68 +0,0 @@
> > > -Upstream-Status: Submitted [
> https://bugs.freedesktop.org/show_bug.cgi?id=3D57606]
> > > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > -
> > > -From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:00 20=
01
> > > -From: Ross Burton <ross.burton@intel.com>
> > > -Date: Thu, 29 Nov 2012 11:00:43 +0000
> > > -Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI
> > > -
> > > -Automatically enabling or disabling a feature based on installed
> files isn't
> > > -deterministic, and AC_CHECK_FILE returns an error when
> cross-compiling.
> > > -
> > > -Fix this by enabling DRI by default, and removing the explicit file
> checks as
> > > -pkg-config is good enough.
> > > -
> > > -(#57606)
> > > -
> > > -Signed-off-by: Ross Burton <ross.burton@intel.com>
> > > ----
> > > - configure.ac |   25 ++-----------------------
> > > - 1 file changed, 2 insertions(+), 23 deletions(-)
> > > -
> > > -diff --git a/configure.ac b/configure.ac
> > > -index fca1a9c..d2aa2ed 100644
> > > ---- a/configure.ac
> > > -+++ b/configure.ac
> > > -@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,
> > > -             [moduledir=3D"$libdir/xorg/modules"])
> > > -
> > > - AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],
> > > --                                  [Disable DRI support
> [[default=3Dauto]]]),
> > > -+                                  [Disable DRI support
> [[default=3Denabled]]]),
> > > -               [DRI=3D"$enableval"],
> > > --              [DRI=3Dauto])
> > > -+              [DRI=3Dyes])
> > > - AC_ARG_ENABLE(exa,
> > > -               AS_HELP_STRING([--disable-exa],
> > > -                              [Disable EXA support
> [[default=3Denabled]]]),
> > > -@@ -76,27 +76,6 @@ sdkdir=3D`$PKG_CONFIG --variable=3Dsdkdir xorg-se=
rver`
> > > -
> > > - # Checks for libraries.
> > > -
> > > --if test "x$DRI" !=3D xno; then
> > > --        AC_CHECK_FILE([${sdkdir}/dri.h],
> > > --                      [have_dri_h=3D"yes"], [have_dri_h=3D"no"])
> > > --        AC_CHECK_FILE([${sdkdir}/sarea.h],
> > > --                      [have_sarea_h=3D"yes"], [have_sarea_h=3D"no"]=
)
> > > --        AC_CHECK_FILE([${sdkdir}/dristruct.h],
> > > --                      [have_dristruct_h=3D"yes"],
> [have_dristruct_h=3D"no"])
> > > --fi
> > > --
> > > --AC_MSG_CHECKING([whether to include DRI support])
> > > --if test "x$DRI" =3D xauto; then
> > > --        if test "x$have_dri_h" =3D xyes && \
> > > --           test "x$have_sarea_h" =3D xyes && \
> > > --           test "x$have_dristruct_h" =3D xyes; then
> > > --                DRI=3D"yes"
> > > --        else
> > > --                DRI=3D"no"
> > > --        fi
> > > --fi
> > > --AC_MSG_RESULT([$DRI])
> > > --
> > > - AM_CONDITIONAL(DRI, test "x$DRI" =3D xyes)
> > > - if test "x$DRI" =3D xyes; then
> > > -         PKG_CHECK_MODULES(DRI, [libdrm >=3D 2.0 xf86driproto])
> > > ---
> > > -1.7.10.4
> > > -
> > > diff --git a/meta-oe/recipes-graphics/xorg-driver/
> xf86-video-mga_2.0.0.bb b/meta-oe/recipes-graphics/xorg-driver/
> xf86-video-mga_2.0.1.bb
> > > similarity index 66%
> > > rename from meta-oe/recipes-graphics/xorg-driver/
> xf86-video-mga_2.0.0.bb
> > > rename to meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.b=
b
> > > index a9ae901d0..34b3e4cde 100644
> > > --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.0.bb
> > > +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga_2.0.1.bb
> > > @@ -4,16 +4,14 @@ SUMMARY =3D "X.Org X server -- Matrox MGA display
> driver"
> > >
> > >  DESCRIPTION =3D "mga is an Xorg driver for Matrox video cards"
> > >
> > > -LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Dbc1395d2cd32dfc5d6c57d2d8f83d3fc"
> > > -
> > > -SRC_URI +=3D "file://checkfile.patch"
> > > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3D4aa220f495ce9be5ce4243d21ebac14f"
> >
> > Why did this checksum change? Please document the change in commit
> message with
> >
> > License-Update: <reason>
> >
> > >
> > >  DEPENDS +=3D "virtual/libx11 libpciaccess"
> > >
> > >  COMPATIBLE_HOST =3D '(i.86.*-linux|x86_64.*-linux)'
> > >
> > > -SRC_URI[md5sum] =3D "b8fc99b4adea8bfe80156b13df4b6c9c"
> > > -SRC_URI[sha256sum] =3D
> "268946e1a13e9d80e4f724a0740df9e6e8c8bad37697fcbf456924e9fdbb5d79"
> > > +XORG_DRIVER_COMPRESSOR =3D ".tar.xz"
> > > +SRC_URI[sha256sum] =3D
> "27a33b70837965bb4a5f27fd260be085ca5bba837a4e62907f093c2f205603ab"
> > >
> > >  PACKAGECONFIG ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'opengl'=
,
> 'dri', '', d)}"
> > >  PACKAGECONFIG[dri] =3D "--enable-dri,--disable-dri,drm
> xorgproto,xserver-xorg-extension-dri"
> > > --
> > > 2.25.1
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#107275):
> https://lists.openembedded.org/g/openembedded-devel/message/107275
> > > Mute This Topic: https://lists.openembedded.org/mt/103031116/1997914
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [raj.khem@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--0000000000006152a3060bef58d4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Dec 7, 2023 at 9:54=E2=80=AFAM alper ak &lt;<a href=
=3D"mailto:alperyasinak1@gmail.com">alperyasinak1@gmail.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">They just fixed the typo in a word.=
 &quot;MERCHANTIBILITY&quot; -&gt;<br>
&quot;MERCHANTABILITY&quot;. Also, I already added it as a description -&gt=
;<br>
&quot;License-Update: Fix spelling/wording&quot;</blockquote><div dir=3D"au=
to"><br></div><div dir=3D"auto">That=E2=80=99s fine send that in with v2</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
<a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/comm=
it/1e4dbef654bd31f5706b4b860f6b34c7e5e5f440" rel=3D"noreferrer" target=3D"_=
blank">https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/1=
e4dbef654bd31f5706b4b860f6b34c7e5e5f440</a><br>
<br>
Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.kh=
em@gmail.com</a>&gt;, 7 Ara 2023 Per, 20:44 tarihinde =C5=9Funu yazd=C4=B1:=
<br>
&gt;<br>
&gt; On Thu, Dec 7, 2023 at 1:13=E2=80=AFAM Alper Ak &lt;<a href=3D"mailto:=
alperyasinak1@gmail.com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt; =
wrote:<br>
&gt; &gt;<br>
&gt; &gt; * checkfile.patch removed because fixed in the new version -&gt; =
<a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/comm=
it/f227f2f286123a9ca64b567783825a2c18b87971" rel=3D"noreferrer" target=3D"_=
blank">https://gitlab.freedesktop.org/xorg/driver/xf86-video-mga/-/commit/f=
227f2f286123a9ca64b567783825a2c18b87971</a><br>
&gt; &gt; * License-Update: Fix spelling/wording<br>
&gt; &gt;<br>
&gt; &gt; Changelog:<br>
&gt; &gt;<br>
&gt; &gt; * Fix uninitialized read in MGAEnableSecondOutPut<br>
&gt; &gt; * gitlab CI: add a basic build test<br>
&gt; &gt; * Fix spelling/wording issues<br>
&gt; &gt; * Build xz tarballs instead of bzip2<br>
&gt; &gt; * <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a>: fix cross-compilation<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.=
com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../xf86-video-mga/checkfile.patch=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 68 -------------------<br>
&gt; &gt;=C2=A0 ...<a href=3D"http://o-mga_2.0.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">o-mga_2.0.0.bb</a> =3D&gt; <a href=3D"http://xf86-video-mga_=
2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-mga_2.0.1.bb</a>}=
 |=C2=A0 8 +--<br>
&gt; &gt;=C2=A0 2 files changed, 3 insertions(+), 73 deletions(-)<br>
&gt; &gt;=C2=A0 delete mode 100644 meta-oe/recipes-graphics/xorg-driver/xf8=
6-video-mga/checkfile.patch<br>
&gt; &gt;=C2=A0 rename meta-oe/recipes-graphics/xorg-driver/{<a href=3D"htt=
p://xf86-video-mga_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">xf86-vide=
o-mga_2.0.0.bb</a> =3D&gt; <a href=3D"http://xf86-video-mga_2.0.1.bb" rel=
=3D"noreferrer" target=3D"_blank">xf86-video-mga_2.0.1.bb</a>} (66%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/=
checkfile.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/check=
file.patch<br>
&gt; &gt; deleted file mode 100644<br>
&gt; &gt; index ceae6dfba..000000000<br>
&gt; &gt; --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-mga/checkfi=
le.patch<br>
&gt; &gt; +++ /dev/null<br>
&gt; &gt; @@ -1,68 +0,0 @@<br>
&gt; &gt; -Upstream-Status: Submitted [<a href=3D"https://bugs.freedesktop.=
org/show_bug.cgi?id=3D57606" rel=3D"noreferrer" target=3D"_blank">https://b=
ugs.freedesktop.org/show_bug.cgi?id=3D57606</a>]<br>
&gt; &gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@int=
el.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; -<br>
&gt; &gt; -From c9014a8f3c9b691b5aa7b1f3ec66cf7c84b8211b Mon Sep 17 00:00:0=
0 2001<br>
&gt; &gt; -From: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" t=
arget=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; -Date: Thu, 29 Nov 2012 11:00:43 +0000<br>
&gt; &gt; -Subject: [PATCH] build: dont use AC_CHECK_FILE when enabling DRI=
<br>
&gt; &gt; -<br>
&gt; &gt; -Automatically enabling or disabling a feature based on installed=
 files isn&#39;t<br>
&gt; &gt; -deterministic, and AC_CHECK_FILE returns an error when cross-com=
piling.<br>
&gt; &gt; -<br>
&gt; &gt; -Fix this by enabling DRI by default, and removing the explicit f=
ile checks as<br>
&gt; &gt; -pkg-config is good enough.<br>
&gt; &gt; -<br>
&gt; &gt; -(#57606)<br>
&gt; &gt; -<br>
&gt; &gt; -Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@int=
el.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
&gt; &gt; ----<br>
&gt; &gt; - <a href=3D"http://configure.ac" rel=3D"noreferrer" target=3D"_b=
lank">configure.ac</a> |=C2=A0 =C2=A025 ++-----------------------<br>
&gt; &gt; - 1 file changed, 2 insertions(+), 23 deletions(-)<br>
&gt; &gt; -<br>
&gt; &gt; -diff --git a/<a href=3D"http://configure.ac" rel=3D"noreferrer" =
target=3D"_blank">configure.ac</a> b/<a href=3D"http://configure.ac" rel=3D=
"noreferrer" target=3D"_blank">configure.ac</a><br>
&gt; &gt; -index fca1a9c..d2aa2ed 100644<br>
&gt; &gt; ---- a/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; &gt; -+++ b/<a href=3D"http://configure.ac" rel=3D"noreferrer" target=
=3D"_blank">configure.ac</a><br>
&gt; &gt; -@@ -55,9 +55,9 @@ AC_ARG_WITH(xorg-module-dir,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[moduledir=3D&qu=
ot;$libdir/xorg/modules&quot;])<br>
&gt; &gt; -<br>
&gt; &gt; - AC_ARG_ENABLE(dri, AS_HELP_STRING([--disable-dri],<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [Disable DRI suppor=
t [[default=3Dauto]]]),<br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [Disable DRI suppor=
t [[default=3Denabled]]]),<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0[DRI=3D&q=
uot;$enableval&quot;],<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [DRI=3Dauto])<=
br>
&gt; &gt; -+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [DRI=3Dyes])<b=
r>
&gt; &gt; - AC_ARG_ENABLE(exa,<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0AS_HELP_S=
TRING([--disable-exa],<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [Disable EXA support [[default=3D=
enabled]]]),<br>
&gt; &gt; -@@ -76,27 +76,6 @@ sdkdir=3D`$PKG_CONFIG --variable=3Dsdkdir xor=
g-server`<br>
&gt; &gt; -<br>
&gt; &gt; - # Checks for libraries.<br>
&gt; &gt; -<br>
&gt; &gt; --if test &quot;x$DRI&quot; !=3D xno; then<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CHECK_FILE([${sdkdir}/dri.h],<br=
>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 [have_dri_h=3D&quot;yes&quot;], [have_dri_h=3D&quot;no&quot;]=
)<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CHECK_FILE([${sdkdir}/sarea.h],<=
br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 [have_sarea_h=3D&quot;yes&quot;], [have_sarea_h=3D&quot;no&qu=
ot;])<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 AC_CHECK_FILE([${sdkdir}/dristruct.=
h],<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 [have_dristruct_h=3D&quot;yes&quot;], [have_dristruct_h=3D&qu=
ot;no&quot;])<br>
&gt; &gt; --fi<br>
&gt; &gt; --<br>
&gt; &gt; --AC_MSG_CHECKING([whether to include DRI support])<br>
&gt; &gt; --if test &quot;x$DRI&quot; =3D xauto; then<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test &quot;x$have_dri_h&quot; =
=3D xyes &amp;&amp; \<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;x$have_sare=
a_h&quot; =3D xyes &amp;&amp; \<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0test &quot;x$have_dris=
truct_h&quot; =3D xyes; then<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRI=3D&=
quot;yes&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DRI=3D&=
quot;no&quot;<br>
&gt; &gt; --=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
&gt; &gt; --fi<br>
&gt; &gt; --AC_MSG_RESULT([$DRI])<br>
&gt; &gt; --<br>
&gt; &gt; - AM_CONDITIONAL(DRI, test &quot;x$DRI&quot; =3D xyes)<br>
&gt; &gt; - if test &quot;x$DRI&quot; =3D xyes; then<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0PKG_CHECK_MODULES(DRI, [libdrm=
 &gt;=3D 2.0 xf86driproto])<br>
&gt; &gt; ---<br>
&gt; &gt; -1.7.10.4<br>
&gt; &gt; -<br>
&gt; &gt; diff --git a/meta-oe/recipes-graphics/xorg-driver/<a href=3D"http=
://xf86-video-mga_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video=
-mga_2.0.0.bb</a> b/meta-oe/recipes-graphics/xorg-driver/<a href=3D"http://=
xf86-video-mga_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-mg=
a_2.0.1.bb</a><br>
&gt; &gt; similarity index 66%<br>
&gt; &gt; rename from meta-oe/recipes-graphics/xorg-driver/<a href=3D"http:=
//xf86-video-mga_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-=
mga_2.0.0.bb</a><br>
&gt; &gt; rename to meta-oe/recipes-graphics/xorg-driver/<a href=3D"http://=
xf86-video-mga_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-mg=
a_2.0.1.bb</a><br>
&gt; &gt; index a9ae901d0..34b3e4cde 100644<br>
&gt; &gt; --- a/meta-oe/recipes-graphics/xorg-driver/<a href=3D"http://xf86=
-video-mga_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-mga_2.=
0.0.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-graphics/xorg-driver/<a href=3D"http://xf86=
-video-mga_2.0.1.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-mga_2.=
0.1.bb</a><br>
&gt; &gt; @@ -4,16 +4,14 @@ SUMMARY =3D &quot;X.Org X server -- Matrox MGA =
display driver&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DESCRIPTION =3D &quot;mga is an Xorg driver for Matrox vide=
o cards&quot;<br>
&gt; &gt;<br>
&gt; &gt; -LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Dbc1395d2cd32dfc5=
d6c57d2d8f83d3fc&quot;<br>
&gt; &gt; -<br>
&gt; &gt; -SRC_URI +=3D &quot;file://checkfile.patch&quot;<br>
&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D4aa220f495ce9be5=
ce4243d21ebac14f&quot;<br>
&gt;<br>
&gt; Why did this checksum change? Please document the change in commit mes=
sage with<br>
&gt;<br>
&gt; License-Update: &lt;reason&gt;<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 DEPENDS +=3D &quot;virtual/libx11 libpciaccess&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 COMPATIBLE_HOST =3D &#39;(i.86.*-linux|x86_64.*-linux)&#39;=
<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[md5sum] =3D &quot;b8fc99b4adea8bfe80156b13df4b6c9c&quot;=
<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;268946e1a13e9d80e4f724a0740df9e6e8c=
8bad37697fcbf456924e9fdbb5d79&quot;<br>
&gt; &gt; +XORG_DRIVER_COMPRESSOR =3D &quot;.tar.xz&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;27a33b70837965bb4a5f27fd260be085ca5=
bba837a4e62907f093c2f205603ab&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_F=
EATURES&#39;, &#39;opengl&#39;, &#39;dri&#39;, &#39;&#39;, d)}&quot;<br>
&gt; &gt;=C2=A0 PACKAGECONFIG[dri] =3D &quot;--enable-dri,--disable-dri,drm=
 xorgproto,xserver-xorg-extension-dri&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#107275): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-devel/message/107275" rel=3D"noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-devel/message/107275</a>=
<br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/103=
031116/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/103031116/1997914</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail=
.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>

--0000000000006152a3060bef58d4--

