Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web09.5404.1619263728705287753
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 24 Apr 2021 04:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ltt38HGy;
 spf=pass (domain: gmail.com, ip: 209.85.208.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f50.google.com with SMTP id e7so60145950edu.10
        for <openembedded-devel@lists.openembedded.org>; Sat, 24 Apr 2021 04:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6GaWf7ey8QFlsQH/CrSdLTV74iXlfp4kao24d5lrlA4=;
        b=ltt38HGyaojRb38c3YjhuRn8LIBy2+x4tPWkOkPSEPZ3t2Wy65L4eT8qTtKe6pEeju
         NTgMFS+7x21Plsgbqd8QdQ1Fe11+ZwFBoubrBwXAuNfiqU3Go1vA703mJh8EJvI52Z8l
         URaEHKVl5V/+hBWIuKMyGKCHvSbqLRpXLLXKQo3+iVC2L7d/UcMCod1cVBKp6lM8UH0d
         D6o1+Hh+GvRS3lBnObeIROzD/4H4R/YxlOXiHdhDZ0QGAJShYQAN8JEZnpqI+7B96fc+
         8e17MQXa+/xT4CkDkbcQHtxbBr7+qD60Mfv0ohEHm11050jTacfJFFkPiR+EbuQPX47g
         e14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6GaWf7ey8QFlsQH/CrSdLTV74iXlfp4kao24d5lrlA4=;
        b=GByI7I9O7cNq/zhSA737a+POBLPplMr96q0GSCuHtVqJjc6219uJsOw4QqRopK8c5Z
         j0m5qnbEPUupmILxic2YlZU2MQuuo9/oSICSEUh+TwSEeDw1+KD8xhd4SKjnvmEEL0sS
         xFQX4vWld+8B7j1Ww6w6FXYw/vp0zfUCt4wv3iMnyyobUmylzECmKa0LamScLmytFJip
         0fRlgMZuRow/ACW2XcohTIYl/sSp5XiwDazkIj1vliXKjUB/HuKjunfyDy507gGUISNj
         GmzeYKE4QanDi5U42EY9MD1mGaaYXEIk1O2BaSjpiziUzo5z2pWqmU9De5tYvm2txuNB
         QljA==
X-Gm-Message-State: AOAM530WZrjzst+SsftFiPxOmCGP3ywTEyRKj6gl94CrP9N7LyJ6s+0Q
	cXxctSqCEGrWm8Hjdck2/S5jHpBKGe2S/OceeBtxGWrz
X-Google-Smtp-Source: ABdhPJy9G4rqDpiwImogfdXCscJOQlaWqMSTlVCYmInHav2hejvXTlXPTlLcMDUXfvbwXsqLNFb0cwRGJK33Sdyboeg=
X-Received: by 2002:aa7:d587:: with SMTP id r7mr9742259edq.388.1619263727266;
 Sat, 24 Apr 2021 04:28:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210424102451.885867-1-peron.clem@gmail.com> <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
 <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com> <CAJiuCcew5bi+kR=FEWjYzjSJSHzG_pDyrrGjqEVFNzNRNaQRmQ@mail.gmail.com>
In-Reply-To: <CAJiuCcew5bi+kR=FEWjYzjSJSHzG_pDyrrGjqEVFNzNRNaQRmQ@mail.gmail.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Sat, 24 Apr 2021 13:28:35 +0200
Message-ID: <CA+chaQcO9cMcP9PxjnAU_SzEt+PJkQKgVhxwjAWAyngapev3Gw@mail.gmail.com>
Subject: Re: [oe] [PATCH] [RFC] gator: Add new package
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000042ed7205c0b63762"

--00000000000042ed7205c0b63762
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ah, even better than, but I would keep the recipe name as gator, if it's
going to completely replace these older gator versions in other layers.

On Sat, Apr 24, 2021 at 1:24 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.=
com> wrote:

> Hi Martin,
>
> On Sat, 24 Apr 2021 at 12:45, Martin Jansa <martin.jansa@gmail.com> wrot=
e:
> >
> > Why do you want to build only the daemon?
> >
> > There are already 4 variants of this recipe in various layers (at leas=
t
> by what's reported on layerindex):
> >
> http://git.linaro.org/openembedded/meta-linaro.git/tree/meta-linaro/reci=
pes-kernel/gator/gator_git.bb?h=3Dmaster
> >
> https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes=
-core/gator/gator_git.bb
> >
> https://github.com/kratsg/meta-l1calo/blob/master/recipes-kernel/gator/g=
ator_git.bb
> >
> https://github.com/robseb/meta-intelfpga/blob/master/recipes-devtools/ga=
tor/gator_git.bb
> >
> > so sharing some recipe which would suit most of these needs in meta-oe
> is definitely welcome, but starting with just a daemon will just complic=
ate
> things to these layers.
>
> New gator daemon doesn't need a kernel module anymore, it's now fully
> userspace.
>
> Regards,
> Clement
>
> >
> > But I understand that building the kernel modules for wider range of
> kernels in different MACHINEs is quite pain (been there:
> >
> https://github.com/shr-project/meta-webosose/commit/f4674ac6fa18a0a96cef=
efa49ebf397a383a88f1
> > and given up shortly after:
> >
> https://github.com/shr-project/meta-webosose/commit/d4bc575623dfbfad780f=
c39fef47d55d4d6e698d
> > as I don't really use gator, it was just one of many build issues in
> 'bitbake world' I was looking at).
> >
> > Regards,
> >
> > On Sat, Apr 24, 2021 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gm=
ail.com>
> wrote:
> >>
> >> Hi,
> >>
> >> I have some questions regarding my patch.
> >>
> >> On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron <peron.clem@gma=
il.com>
> wrote:
> >> >
> >> > To communicate with the target device, Streamline requires the
> >> > gator daemon, gatord, to be running on the device.
> >>
> >> Is gator the correct name for this package? or would gatord be better=
?
> >>
> >> >
> >> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >> > ---
> >> >  .../gator/0001-gator-don-t-strip-debug.patch  | 24
> +++++++++++++++++++
> >> >  meta-oe/recipes-devtools/gator/gator_7.5.0.bb | 22 +++++++++++++++=
++
> >> >  2 files changed, 46 insertions(+)
> >> >  create mode 100644
> meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patch
> >> >  create mode 100644 meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> >> >
> >> > diff --git
> a/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patc=
h
> b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patc=
h
> >> > new file mode 100644
> >> > index 000000000000..8e59fffa1fc2
> >> > --- /dev/null
> >> > +++
> b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-strip-debug.patc=
h
> >> > @@ -0,0 +1,24 @@
> >> > +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00:00:00
> 2001
> >> > +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D <cpe@out=
sight.tech>
> >> > +Date: Fri, 16 Apr 2021 15:27:16 +0200
> >> > +Subject: [PATCH] gator: don't strip debug
> >> > +
> >> > +---
> >> > + daemon/Makefile | 2 --
> >> > + 1 file changed, 2 deletions(-)
> >> > +
> >> > +diff --git a/daemon/Makefile b/daemon/Makefile
> >> > +index ba5f29cfeb10..6807948310f9 100644
> >> > +--- a/daemon/Makefile
> >> > ++++ b/daemon/Makefile
> >> > +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion | cut -f=
1
> -d.` \>=3D 5),1)
> >> > +       CXXFLAGS +=3D -fno-sized-deallocation
> >> > + endif
> >> > +
> >> > +-# -s strips the binary of debug info
> >> > +-LDFLAGS     +=3D -s
> >> > + LDLIBS      +=3D -lrt -lm -pthread
> >> > + TARGET      :=3D $(OBJ_DIR)gatord
> >> > + ESCAPE_EXE  :=3D $(OBJ_DIR)escape/escape
> >> > +--
> >> > +2.25.1
> >> > diff --git a/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> >> > new file mode 100644
> >> > index 000000000000..8e15b1ca5fc5
> >> > --- /dev/null
> >> > +++ b/meta-oe/recipes-devtools/gator/gator_7.5.0.bb
> >> > @@ -0,0 +1,22 @@
> >> > +SUMMARY =3D "DS-5 Streamine Gator daemon"
> >> > +DESCRIPTION =3D "Target-side daemon gathering data for ARM Streaml=
ine
> Performance Analyzer."
> >> > +
> >> > +LICENSE =3D "GPL-2.0-only"
> >> > +LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263"
> >> > +LICENSE_libsensors =3D "LGPL-2.1-or-later"
> >>
> >> Gator git specifies that:
> >>
> >> -libsensors source code in daemon/libsensors licensed under
> LGPL-2.1-or-later
> >> -mxml source code in daemon/mxml licensed under APACHE-2.0 WITH
> >> Mini-XML-exception
> >> -perf_event.h from Linux userspace kernel headers in daemon/k license=
d
> >> under GPL-2.0-only WITH Linux-syscall-note.
> >>
> >> I'm not sure how to properly reflect this in the recipe.
> >>
> >> Thanks for your help,
> >> Clement
> >>
> >> > +
> >> > +SRCREV =3D "6088d3533146d7b7c9700b8e396292053240b25f"
> >> > +SRC_URI =3D "git://
> github.com/ARM-software/gator.git;protocol=3Dhttp;branch=3Dmaster \
> >> > +          file://0001-gator-don-t-strip-debug.patch;patchdir=3D.. =
\
> >> > +         "
> >> > +
> >> > +S =3D "${WORKDIR}/git/daemon"
> >> > +
> >> > +EXTRA_OEMAKE =3D "'CFLAGS=3D${CFLAGS} ${TARGET_CC_ARCH}
> -D_DEFAULT_SOURCE -DETCDIR=3D\"${sysconfdir}\"' \
> >> > +    'LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}'
> 'CROSS_COMPILE=3D${TARGET_PREFIX}' \
> >> > +    'CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH} -fno-rtti' CC=3D'${C=
C}'
> CXX=3D'${CXX}'"
> >> > +
> >> > +do_install() {
> >> > +       install -d ${D}${sbindir}
> >> > +       install -m 0755 ${S}/gatord ${D}${sbindir}/gatord
> >> > +}
> >> > --
> >> > 2.25.1
> >> >
> >>
> >>=20
> >>
>

--00000000000042ed7205c0b63762
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ah, even better than, but I would keep the recipe name as =
gator, if it&#39;s going to completely replace these older gator versions i=
n other layers.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sat, Apr 24, 2021 at 1:24 PM Cl=C3=A9ment P=C3=A9ron &l=
t;<a href=3D"mailto:peron.clem@gmail.com">peron.clem@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Martin,<br=
>
<br>
On Sat, 24 Apr 2021 at 12:45, Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Why do you want to build only the daemon?<br>
&gt;<br>
&gt; There are already 4 variants of this recipe in various layers (at lea=
st by what&#39;s reported on layerindex):<br>
&gt; <a href=3D"http://git.linaro.org/openembedded/meta-linaro.git/tree/me=
ta-linaro/recipes-kernel/gator/gator_git.bb?h=3Dmaster" rel=3D"noreferrer" =
target=3D"_blank">http://git.linaro.org/openembedded/meta-linaro.git/tree/m=
eta-linaro/recipes-kernel/gator/gator_git.bb?h=3Dmaster</a><br>
&gt; <a href=3D"https://github.com/webosose/meta-webosose/blob/master/meta=
-webos/recipes-core/gator/gator_git.bb" rel=3D"noreferrer" target=3D"_blank=
">https://github.com/webosose/meta-webosose/blob/master/meta-webos/recipes-=
core/gator/gator_git.bb</a><br>
&gt; <a href=3D"https://github.com/kratsg/meta-l1calo/blob/master/recipes-=
kernel/gator/gator_git.bb" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/kratsg/meta-l1calo/blob/master/recipes-kernel/gator/gator_git.bb</a=
><br>
&gt; <a href=3D"https://github.com/robseb/meta-intelfpga/blob/master/recip=
es-devtools/gator/gator_git.bb" rel=3D"noreferrer" target=3D"_blank">https:=
//github.com/robseb/meta-intelfpga/blob/master/recipes-devtools/gator/gator=
_git.bb</a><br>
&gt;<br>
&gt; so sharing some recipe which would suit most of these needs in meta-o=
e is definitely welcome, but starting with just a daemon will just complica=
te things to these layers.<br>
<br>
New gator daemon doesn&#39;t need a kernel module anymore, it&#39;s now fu=
lly userspace.<br>
<br>
Regards,<br>
Clement<br>
<br>
&gt;<br>
&gt; But I understand that building the kernel modules for wider range of =
kernels in different MACHINEs is quite pain (been there:<br>
&gt; <a href=3D"https://github.com/shr-project/meta-webosose/commit/f4674a=
c6fa18a0a96cefefa49ebf397a383a88f1" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/shr-project/meta-webosose/commit/f4674ac6fa18a0a96cefefa49=
ebf397a383a88f1</a><br>
&gt; and given up shortly after:<br>
&gt; <a href=3D"https://github.com/shr-project/meta-webosose/commit/d4bc57=
5623dfbfad780fc39fef47d55d4d6e698d" rel=3D"noreferrer" target=3D"_blank">ht=
tps://github.com/shr-project/meta-webosose/commit/d4bc575623dfbfad780fc39fe=
f47d55d4d6e698d</a><br>
&gt; as I don&#39;t really use gator, it was just one of many build issues=
 in &#39;bitbake world&#39; I was looking at).<br>
&gt;<br>
&gt; Regards,<br>
&gt;<br>
&gt; On Sat, Apr 24, 2021 at 3:29 AM Cl=C3=A9ment P=C3=A9ron &lt;<a href=
=3D"mailto:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi,<br>
&gt;&gt;<br>
&gt;&gt; I have some questions regarding my patch.<br>
&gt;&gt;<br>
&gt;&gt; On Sat, 24 Apr 2021 at 12:24, Cl=C3=A9ment P=C3=A9ron &lt;<a href=
=
=3D"mailto:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a=
>&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; To communicate with the target device, Streamline requires t=
he<br>
&gt;&gt; &gt; gator daemon, gatord, to be running on the device.<br>
&gt;&gt;<br>
&gt;&gt; Is gator the correct name for this package? or would gatord be be=
tter?<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto=
:peron.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 .../gator/0001-gator-don-t-strip-debug.patch=C2=A0 | 2=
4 +++++++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 meta-oe/recipes-devtools/gator/<a href=3D"http://gator=
_7.5.0.bb" rel=3D"noreferrer" target=3D"_blank">gator_7.5.0.bb</a> | 22 +++=
++++++++++++++<br>
&gt;&gt; &gt;=C2=A0 2 files changed, 46 insertions(+)<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/gator/gato=
r/0001-gator-don-t-strip-debug.patch<br>
&gt;&gt; &gt;=C2=A0 create mode 100644 meta-oe/recipes-devtools/gator/<a h=
ref=3D"http://gator_7.5.0.bb" rel=3D"noreferrer" target=3D"_blank">gator_7.=
5.0.bb</a><br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/gator/gator/0001-gator=
-don-t-strip-debug.patch b/meta-oe/recipes-devtools/gator/gator/0001-gator-=
don-t-strip-debug.patch<br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000000..8e59fffa1fc2<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/gator/gator/0001-gator-don-t-=
strip-debug.patch<br>
&gt;&gt; &gt; @@ -0,0 +1,24 @@<br>
&gt;&gt; &gt; +From 370e9c97f1bc07a63aa87e954823c0063058aad7 Mon Sep 17 00=
:00:00 2001<br>
&gt;&gt; &gt; +From: =3D?UTF-8?q?Cl=3DC3=3DA9ment=3D20P=3DC3=3DA9ron?=3D &=
lt;cpe@outsight.tech&gt;<br>
&gt;&gt; &gt; +Date: Fri, 16 Apr 2021 15:27:16 +0200<br>
&gt;&gt; &gt; +Subject: [PATCH] gator: don&#39;t strip debug<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +---<br>
&gt;&gt; &gt; + daemon/Makefile | 2 --<br>
&gt;&gt; &gt; + 1 file changed, 2 deletions(-)<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +diff --git a/daemon/Makefile b/daemon/Makefile<br>
&gt;&gt; &gt; +index ba5f29cfeb10..6807948310f9 100644<br>
&gt;&gt; &gt; +--- a/daemon/Makefile<br>
&gt;&gt; &gt; ++++ b/daemon/Makefile<br>
&gt;&gt; &gt; +@@ -26,8 +26,6 @@ ifeq ($(shell expr `$(CXX) -dumpversion |=
 cut -f1 -d.` \&gt;=3D 5),1)<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CXXFLAGS +=3D -fno-sized-dealloc=
ation<br>
&gt;&gt; &gt; + endif<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +-# -s strips the binary of debug info<br>
&gt;&gt; &gt; +-LDFLAGS=C2=A0 =C2=A0 =C2=A0+=3D -s<br>
&gt;&gt; &gt; + LDLIBS=C2=A0 =C2=A0 =C2=A0 +=3D -lrt -lm -pthread<br>
&gt;&gt; &gt; + TARGET=C2=A0 =C2=A0 =C2=A0 :=3D $(OBJ_DIR)gatord<br>
&gt;&gt; &gt; + ESCAPE_EXE=C2=A0 :=3D $(OBJ_DIR)escape/escape<br>
&gt;&gt; &gt; +--<br>
&gt;&gt; &gt; +2.25.1<br>
&gt;&gt; &gt; diff --git a/meta-oe/recipes-devtools/gator/<a href=3D"http:=
//gator_7.5.0.bb" rel=3D"noreferrer" target=3D"_blank">gator_7.5.0.bb</a> b=
/meta-oe/recipes-devtools/gator/<a href=3D"http://gator_7.5.0.bb" rel=3D"no=
referrer" target=3D"_blank">gator_7.5.0.bb</a><br>
&gt;&gt; &gt; new file mode 100644<br>
&gt;&gt; &gt; index 000000000000..8e15b1ca5fc5<br>
&gt;&gt; &gt; --- /dev/null<br>
&gt;&gt; &gt; +++ b/meta-oe/recipes-devtools/gator/<a href=3D"http://gator=
_7.5.0.bb" rel=3D"noreferrer" target=3D"_blank">gator_7.5.0.bb</a><br>
&gt;&gt; &gt; @@ -0,0 +1,22 @@<br>
&gt;&gt; &gt; +SUMMARY =3D &quot;DS-5 Streamine Gator daemon&quot;<br>
&gt;&gt; &gt; +DESCRIPTION =3D &quot;Target-side daemon gathering data for=
 ARM Streamline Performance Analyzer.&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +LICENSE =3D &quot;GPL-2.0-only&quot;<br>
&gt;&gt; &gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f=
5fce4486a80fdaf4a4263&quot;<br>
&gt;&gt; &gt; +LICENSE_libsensors =3D &quot;LGPL-2.1-or-later&quot;<br>
&gt;&gt;<br>
&gt;&gt; Gator git specifies that:<br>
&gt;&gt;<br>
&gt;&gt; -libsensors source code in daemon/libsensors licensed under LGPL-=
2.1-or-later<br>
&gt;&gt; -mxml source code in daemon/mxml licensed under APACHE-2.0 WITH<b=
r>
&gt;&gt; Mini-XML-exception<br>
&gt;&gt; -perf_event.h from Linux userspace kernel headers in daemon/k lic=
ensed<br>
&gt;&gt; under GPL-2.0-only WITH Linux-syscall-note.<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m not sure how to properly reflect this in the recipe.<br>
&gt;&gt;<br>
&gt;&gt; Thanks for your help,<br>
&gt;&gt; Clement<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +SRCREV =3D &quot;6088d3533146d7b7c9700b8e396292053240b25f&q=
uot;<br>
&gt;&gt; &gt; +SRC_URI =3D &quot;git://<a href=3D"http://github.com/ARM-so=
ftware/gator.git;protocol=3Dhttp;branch=3Dmaster" rel=3D"noreferrer" target=
=
=3D"_blank">github.com/ARM-software/gator.git;protocol=3Dhttp;branch=3Dmas=
ter</a> \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-gator-don-t-=
strip-debug.patch;patchdir=3D.. \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +S =3D &quot;${WORKDIR}/git/daemon&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +EXTRA_OEMAKE =3D &quot;&#39;CFLAGS=3D${CFLAGS} ${TARGET_CC_=
ARCH} -D_DEFAULT_SOURCE -DETCDIR=3D\&quot;${sysconfdir}\&quot;&#39; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;LDFLAGS=3D${LDFLAGS} ${TARGET_CC_ARCH}&#=
39; &#39;CROSS_COMPILE=3D${TARGET_PREFIX}&#39; \<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 &#39;CXXFLAGS=3D${CXXFLAGS} ${TARGET_CC_ARCH}=
 -fno-rtti&#39; CC=3D&#39;${CC}&#39; CXX=3D&#39;${CXX}&#39;&quot;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt; +do_install() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}${sbindir}<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 0755 ${S}/gatord ${D}=
${sbindir}/gatord<br>
&gt;&gt; &gt; +}<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.25.1<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; <br>
&gt;&gt;<br>
</blockquote></div>

--00000000000042ed7205c0b63762--
