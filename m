Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.290.1587407545662425876
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 11:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pMRy7A+s;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id n143so5018323qkn.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 11:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CjRdNir4tMRH2YXtmtU1thE6Cjo55KT8h1Oot9XX0go=;
        b=pMRy7A+sxCs1pyfq5SDwZ5JRBSeEr9MJ6gf9GFO8fbYbYnrmUjLz0LniN6PN2mdzU4
         Rxy/Qiw0KrUSszpXQSYPtPaDyekAeMKRce5asi9CznT3o8tpCB/XTBMCuwJbedCUy0Qa
         TloTfO21eVHancNs6xkgFA9MyMUfeI1JBGfPRmUuyRc2O0FBWdn/lI12qpEmFYc+fiiw
         yRDp/DPjT09ajUU5LLFVa17Ijxnp9QffGjhGyv4fMNT8QuDn6hsd34OlcEP1b8W9F8++
         uQdQY0I8kf68mu/RkWyOouQ0zTelrqBCLOLZteB5GE8gkCO5wctsA7F7KR3cPv17+4Yl
         RANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CjRdNir4tMRH2YXtmtU1thE6Cjo55KT8h1Oot9XX0go=;
        b=IAi2pJgvU4y1QtHJEot/nT43bEPeHgj1rSte6xXca+wV1c/BJ7sYMt2KK2iaEIVI0M
         uoUtZ2NNynYp7C489sLioe4RyqBTCl43ag5z2jDexPR3VbII0/HouMQW6B5hUvvcumgV
         RHGRsYFBHwqGCv3V+kSpTaht0CJPGnePE7H/bFnbHCOhkw7vDZSgeoOhVArsol3UajYZ
         zxODlOF5sD+9pGSvw/6tmi0jYw7tzdjZQo2clR8N13x4N9ld8mwbKqZey1yljzG3oAt+
         UA3SRcCaR6TDsUaBxIBq/SWXCcx7Qul4gNvd3IttkE6u2XOwhlIQqe08WOty2Y15Eogd
         3yag==
X-Gm-Message-State: AGi0PubhLODwpnBJ5aT8QBKsdsPTxrpGtENN+eJ2/mfKJg6oZm5RHyg4
	K0fwTfIdv7a1K0/Umw3grtnXkpyhteYdgFQcuoY=
X-Google-Smtp-Source: APiQypIVcGDCgC5FAawoFC0MTZpuhCzgNJjo1VHP5nK07O8LYHu1dIxpLSCsjwCAvsj51hE1Zjn+91g3e3iXG7ND1aQ=
X-Received: by 2002:a37:bec5:: with SMTP id o188mr17496079qkf.165.1587407544498;
 Mon, 20 Apr 2020 11:32:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200420170656.10895-1-andrea.adami@gmail.com>
 <CAMKF1sr+nAmaQzpN_eWvsS8_KdyfzHdF7AfgDdhsWRgmgO=3YA@mail.gmail.com> <CAAQYJAuXKGz8vH11d05D9f_uN0YC4CghdC=ZOL6=XAfESUVX8g@mail.gmail.com>
In-Reply-To: <CAAQYJAuXKGz8vH11d05D9f_uN0YC4CghdC=ZOL6=XAfESUVX8g@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 20 Apr 2020 11:32:13 -0700
Message-ID: <CAMKF1sqBVxnMoF8LuO5jzZ7jRXpsWU2+nL9WbDgYtojs3D_2mA@mail.gmail.com>
Subject: Re: [oe] [meta-handheld][PATCH 1/4] zaurusd: fix build with kernels < 4.16 and newer libc headers
To: Andrea Adami <andrea.adami@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000cdbe5805a3bd1e01"

--000000000000cdbe5805a3bd1e01
Content-Type: text/plain; charset="UTF-8"

Thanks!

On Mon, Apr 20, 2020 at 11:26 AM Andrea Adami <andrea.adami@gmail.com>
wrote:

> On Mon, Apr 20, 2020 at 7:44 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Apr 20, 2020 at 10:07 AM Andrea Adami <andrea.adami@gmail.com>
> wrote:
> > >
> > > The Y2038 changes broke the build for older 32bit devices using
> > > older kernels.
> > >
> > > As seen on: https://sourceware.org/glibc/wiki/Y2038ProofnessDesign
> > >
> > > Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > ---
> > >  .../zaurusd/zaurusd/add_64bit_time_t.patch    | 43 +++++++++++++++++++
> > >  recipes-bsp/zaurusd/zaurusd_git.bb            |  3 +-
> > >  2 files changed, 45 insertions(+), 1 deletion(-)
> > >  create mode 100644 recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> > >
> > > diff --git a/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> > > new file mode 100644
> > > index 0000000..5f9587a
> > > --- /dev/null
> > > +++ b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch
> > > @@ -0,0 +1,43 @@
> > > +From d15b20fd9e8927db5dc4303f2e6c11cfa8d6fe95 Mon Sep 17 00:00:00 2001
> > > +From: Andrea Adami <andrea.adami@gmail.com>
> > > +Date: Mon, 20 Apr 2020 16:21:22 +0200
> > > +Subject: [PATCH] tskeys.c: add support for 64bit time_t
> > > +
> > > +Upgrade the recipe to cope with the 64-bit time changes introduced in
> 4.16
> > > +
> > > +Fix:
> > > +
> > > +| tskeys.c: In function 'press_key':
> > > +| tskeys.c:141:4: error: 'struct input_event' has no member named
> 'time'
> > > +|   141 |  ev.time.tv_sec = time(0);
> > > +|       |    ^
> > > +| tskeys.c:142:4: error: 'struct input_event' has no member named
> 'time'
> > > +|   142 |  ev.time.tv_usec = 0;
> > > +|       |    ^
> > > +
> > > +Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
> > > +---
> > > + apps/tskeys/tskeys.c | 5 +++++
> > > + 1 file changed, 5 insertions(+)
> > > +
> > > +diff --git a/apps/tskeys/tskeys.c b/apps/tskeys/tskeys.c
> > > +index 264dfb7..36e3bfd 100644
> > > +--- a/apps/tskeys/tskeys.c
> > > ++++ b/apps/tskeys/tskeys.c
> > > +@@ -138,8 +138,13 @@ void press_key(int fd, int key, int pressed)
> > > +       struct input_event ev;
> > > +       int r;
> > > +
> > > ++#if !defined(__USE_TIME_BITS64)
> > > +       ev.time.tv_sec = time(0);
> > > +       ev.time.tv_usec = 0;
> > > ++#else
> > > ++      ev.input_event_sec = time(0);
> > > ++      ev.input_event_usec = 0;
> > > ++#endif
> >
> > does this work with musl ?
> >
>
>
> Yes, actually I tested it on musl first.
>
> Build Configuration:
> BB_VERSION           = "1.46.0"
> BUILD_SYS            = "x86_64-linux"
> NATIVELSBSTRING      = "ubuntu-18.04"
> TARGET_SYS           = "arm-oe-linux-musleabi"
> MACHINE              = "spitz"
> DISTRO               = "nodistro"
> DISTRO_VERSION       = "nodistro.0"
> TUNE_FEATURES        = "arm armv5 thumb dsp"
> TARGET_FPU           = "soft"
> meta                 =
> "master-next:b450b0a2f5df27c4ea903ae9c5f6f5b96b9ddfc3"
> meta-oe              =
> "master-next:205440e40f9a2d37a4f48391b03673a4aa042982"
> meta-handheld        = "master:a876aaa33317d388aa2e865f665fe6cc58d500a7"
>
>
>
>
> > > +       ev.type = EV_KEY;
> > > +       ev.code = key;
> > > +       ev.value = pressed;
> > > +--
> > > +2.17.1
> > > +
> > > diff --git a/recipes-bsp/zaurusd/zaurusd_git.bb b/recipes-bsp/zaurusd/
> zaurusd_git.bb
> > > index d69805b..1f8e40b 100644
> > > --- a/recipes-bsp/zaurusd/zaurusd_git.bb
> > > +++ b/recipes-bsp/zaurusd/zaurusd_git.bb
> > > @@ -24,7 +24,8 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}
> <http://git.yoctoproject.org/$%7BBPN%7D> \
> > >             file://01-check-toggle-portait \
> > >             file://use-ts-symlink-instead-of-hardcoding.diff \
> > >             file://0001-zaurusd-add-support-for-collie.patch \
> > > -           file://allow-newer-tslib.patch"
> > > +           file://allow-newer-tslib.patch \
> > > +           file://add_64bit_time_t.patch"
> > >
> > >
> > >  S = "${WORKDIR}/git"
> > > --
> > > 2.17.1
> > >
> > > 
>

--000000000000cdbe5805a3bd1e01
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>Thanks!</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">On Mon, Apr 20, 2020 at 11:26 AM Andrea Adami &lt;<a href=
=3D"mailto:andrea.adami@gmail.com">andrea.adami@gmail.com</a>&gt; wrote:<b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex">On Mon, Apr 20, 2020 at 7:44 PM Khem=
 Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@g=
mail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Apr 20, 2020 at 10:07 AM Andrea Adami &lt;<a href=3D"mailto:a=
ndrea.adami@gmail.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt; wro=
te:<br>
&gt; &gt;<br>
&gt; &gt; The Y2038 changes broke the build for older 32bit devices using<=
br>
&gt; &gt; older kernels.<br>
&gt; &gt;<br>
&gt; &gt; As seen on: <a href=3D"https://sourceware.org/glibc/wiki/Y2038Pr=
oofnessDesign" rel=3D"noreferrer" target=3D"_blank">https://sourceware.org/=
glibc/wiki/Y2038ProofnessDesign</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@g=
mail.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../zaurusd/zaurusd/add_64bit_time_t.patch=C2=A0 =C2=A0 | =
43 +++++++++++++++++++<br>
&gt; &gt;=C2=A0 recipes-bsp/zaurusd/<a href=3D"http://zaurusd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">zaurusd_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 3 +-<br>
&gt; &gt;=C2=A0 2 files changed, 45 insertions(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 create mode 100644 recipes-bsp/zaurusd/zaurusd/add_64bit_t=
ime_t.patch<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch =
b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..5f9587a<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; +++ b/recipes-bsp/zaurusd/zaurusd/add_64bit_time_t.patch<br>
&gt; &gt; @@ -0,0 +1,43 @@<br>
&gt; &gt; +From d15b20fd9e8927db5dc4303f2e6c11cfa8d6fe95 Mon Sep 17 00:00:=
00 2001<br>
&gt; &gt; +From: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@gmail.com=
" target=3D"_blank">andrea.adami@gmail.com</a>&gt;<br>
&gt; &gt; +Date: Mon, 20 Apr 2020 16:21:22 +0200<br>
&gt; &gt; +Subject: [PATCH] tskeys.c: add support for 64bit time_t<br>
&gt; &gt; +<br>
&gt; &gt; +Upgrade the recipe to cope with the 64-bit time changes introdu=
ced in 4.16<br>
&gt; &gt; +<br>
&gt; &gt; +Fix:<br>
&gt; &gt; +<br>
&gt; &gt; +| tskeys.c: In function &#39;press_key&#39;:<br>
&gt; &gt; +| tskeys.c:141:4: error: &#39;struct input_event&#39; has no me=
mber named &#39;time&#39;<br>
&gt; &gt; +|=C2=A0 =C2=A0141 |=C2=A0 ev.time.tv_sec =3D time(0);<br>
&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 ^<br>
&gt; &gt; +| tskeys.c:142:4: error: &#39;struct input_event&#39; has no me=
mber named &#39;time&#39;<br>
&gt; &gt; +|=C2=A0 =C2=A0142 |=C2=A0 ev.time.tv_usec =3D 0;<br>
&gt; &gt; +|=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 ^<br>
&gt; &gt; +<br>
&gt; &gt; +Signed-off-by: Andrea Adami &lt;<a href=3D"mailto:andrea.adami@=
gmail.com" target=3D"_blank">andrea.adami@gmail.com</a>&gt;<br>
&gt; &gt; +---<br>
&gt; &gt; + apps/tskeys/tskeys.c | 5 +++++<br>
&gt; &gt; + 1 file changed, 5 insertions(+)<br>
&gt; &gt; +<br>
&gt; &gt; +diff --git a/apps/tskeys/tskeys.c b/apps/tskeys/tskeys.c<br>
&gt; &gt; +index 264dfb7..36e3bfd 100644<br>
&gt; &gt; +--- a/apps/tskeys/tskeys.c<br>
&gt; &gt; ++++ b/apps/tskeys/tskeys.c<br>
&gt; &gt; +@@ -138,8 +138,13 @@ void press_key(int fd, int key, int presse=
d)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0struct input_event ev;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0int r;<br>
&gt; &gt; +<br>
&gt; &gt; ++#if !defined(__USE_TIME_BITS64)<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.time.tv_sec =3D time(0);<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.time.tv_usec =3D 0;<br>
&gt; &gt; ++#else<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ev.input_event_sec =3D time(0);<br>
&gt; &gt; ++=C2=A0 =C2=A0 =C2=A0 ev.input_event_usec =3D 0;<br>
&gt; &gt; ++#endif<br>
&gt;<br>
&gt; does this work with musl ?<br>
&gt;<br>
<br>
<br>
Yes, actually I tested it on musl first.<br>
<br>
Build Configuration:<br>
BB_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;1.46.0&quot;<=
br>
BUILD_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-linux&=
quot;<br>
NATIVELSBSTRING=C2=A0 =C2=A0 =C2=A0 =3D &quot;ubuntu-18.04&quot;<br>
TARGET_SYS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;arm-oe-linux-=
musleabi&quot;<br>
MACHINE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;spitz&qu=
ot;<br>
DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;nod=
istro&quot;<br>
DISTRO_VERSION=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;nodistro.0&quot;<br>
TUNE_FEATURES=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;arm armv5 thumb dsp&quo=
t;<br>
TARGET_FPU=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;soft&quot;<br=
>
meta=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quo=
t;master-next:b450b0a2f5df27c4ea903ae9c5f6f5b96b9ddfc3&quot;<br>
meta-oe=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master-n=
ext:205440e40f9a2d37a4f48391b03673a4aa042982&quot;<br>
meta-handheld=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;master:a876aaa33317d388=
aa2e865f665fe6cc58d500a7&quot;<br>
<br>
<br>
<br>
<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.type =3D EV_KEY;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.code =3D key;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0ev.value =3D pressed;<br>
&gt; &gt; +--<br>
&gt; &gt; +2.17.1<br>
&gt; &gt; +<br>
&gt; &gt; diff --git a/recipes-bsp/zaurusd/<a href=3D"http://zaurusd_git.b=
b" rel=3D"noreferrer" target=3D"_blank">zaurusd_git.bb</a> b/recipes-bsp/za=
urusd/<a href=3D"http://zaurusd_git.bb" rel=3D"noreferrer" target=3D"_blank=
">zaurusd_git.bb</a><br>
&gt; &gt; index d69805b..1f8e40b 100644<br>
&gt; &gt; --- a/recipes-bsp/zaurusd/<a href=3D"http://zaurusd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">zaurusd_git.bb</a><br>
&gt; &gt; +++ b/recipes-bsp/zaurusd/<a href=3D"http://zaurusd_git.bb" rel=
=3D"noreferrer" target=3D"_blank">zaurusd_git.bb</a><br>
&gt; &gt; @@ -24,7 +24,8 @@ SRC_URI =3D &quot;git://<a href=3D"http://git.=
yoctoproject.org/$%7BBPN%7D" rel=3D"noreferrer" target=3D"_blank">git.yocto=
project.org/${BPN}</a> \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://01-check-t=
oggle-portait \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://use-ts-sym=
link-instead-of-hardcoding.diff \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-zauru=
sd-add-support-for-collie.patch \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://allow-newer-tsl=
ib.patch&quot;<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://allow-newer-tsl=
ib.patch \<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://add_64bit_time_=
t.patch&quot;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; --<br>
&gt; &gt; 2.17.1<br>
&gt; &gt;<br>
&gt; &gt; <br>
</blockquote></div></div>

--000000000000cdbe5805a3bd1e01--
