Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C7FD0EE05
	for <webhook@archiver.kernel.org>; Fri, 11 Oct 2024 15:51:51 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.15372.1728661903325009998
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Oct 2024 08:51:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=kbPnBfp8;
 spf=pass (domain: smile.fr, ip: 209.85.128.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43118c9a955so15512985e9.3
        for <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 08:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1728661902; x=1729266702; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LVSF4t5OHqEhSnNPzjTENVHIqE5UyrkCF2url7h9BHE=;
        b=kbPnBfp8kZtAnf/0eRdEmcxEuhW5W9MVrEv4ebtTuE9tMqamCknEzIv4qJJKveXWdm
         0gjsKhq50kbb0CBU/GvYeceRnyE2vnmX+UlrSPt+mRyH20xPUeoCi1gDxf6Rx/y8OTNh
         srCKR76OVbwXCge9WuW+PhEgVQB48Fy3qtSWc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728661902; x=1729266702;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LVSF4t5OHqEhSnNPzjTENVHIqE5UyrkCF2url7h9BHE=;
        b=FpmdeFvnLJDuKGOVh1KhyhW1fZhCGVniV6pb2uy9sfE34hJGklT4qgY4Q3t8Olm+Tt
         W1PaYC8oWECA8Q0GX1bJRz7MuF/kVRP493+6fVrTejnvp7S/IJvq3c/qc9DCXWdB57yJ
         5ZQygkO2USCV9J+NNpr35za8kmNfZNNrI71H/u9/bqdnbgyZyFuyZd+9HR1qsNPeLEOL
         D1AC1X1iWOCNUHgBVF1QLK4mJJ/cUrn3nN1NIVdX1aP1nbsjRP5E6jivaR3Z+aBx2/JN
         h+Qxder9duiac6f6iR023eP+kNm3lkASJGMo1bVyGE//A9NTth0J1lKRxFuERiMOtf6H
         tXJA==
X-Gm-Message-State: AOJu0Yy5XfooDTZIcp+eX/5DtrESj1K6V24PzSmnasEwPBANj7mi/WQS
	9nykPYMho4kcEbloARifWD16oj5FxyrFt9jJ9qMYp28vheCp0OeaWB/hImoMweujilX8QViGrq0
	UMBAWXx2FnGxgYO3x+f4qst9aktmNsEdppPrVKw==
X-Google-Smtp-Source: AGHT+IHF7SEl6kE5Lm1ee5a3TvFMOHDQu+S7ZrEFoU+Mev8Cvq17Rj9crBWrGZmhTH7zsj6TjdKit2Xi8ndQ3ZPOWdg=
X-Received: by 2002:a5d:6452:0:b0:37c:d1c7:a0c0 with SMTP id
 ffacd0b85a97d-37d551fc572mr2020978f8f.30.1728661901619; Fri, 11 Oct 2024
 08:51:41 -0700 (PDT)
MIME-Version: 1.0
References: <20241011151023.1516957-1-yoann.congal@smile.fr>
 <CAMKF1sosOO0BEOewee+wJBazF9LMKmXXVypA6tJ77PV97gQsYg@mail.gmail.com>
 <CAMSfU+4x=KwZx3UbPH=DhNqwAOTGub9QOqvBHEHYiDKJMSRAaw@mail.gmail.com> <CAMKF1sqTxHSL3yhb0Y486YDB56jgsRj-Y9WhpOCYXomV1CKEhg@mail.gmail.com>
In-Reply-To: <CAMKF1sqTxHSL3yhb0Y486YDB56jgsRj-Y9WhpOCYXomV1CKEhg@mail.gmail.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 11 Oct 2024 17:51:15 +0200
Message-ID: <CAMSfU+5RCkCT+VytkR+PN_pv60O+wg5Zr0yOg_XjSqW9D7R6zQ@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gimp: fix buildpaths QA error by
 removing gimptool
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000954c870624357680"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Oct 2024 15:51:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112811

--000000000000954c870624357680
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 11 oct. 2024 =C3=A0 17:37, Khem Raj <raj.khem@gmail.com> a =C3=A9cr=
it :

> On Fri, Oct 11, 2024 at 8:34=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr>
> wrote:
> >
> >
> >
> > Le ven. 11 oct. 2024 =C3=A0 17:15, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
> >>
> >> On Fri, Oct 11, 2024 at 8:10=E2=80=AFAM Yoann Congal via
> >> lists.openembedded.org <yoann.congal=3Dsmile.fr@lists.openembedded.org=
>
> >> wrote:
> >> >
> >> > From: Yoann Congal <yoann.congal@smile.fr>
> >> >
> >> > gimptool can be used in GIMP plugin compilation. It would make more
> >> > sense as a native tool. It also contains the sysroot path which brea=
k
> >> > build with buildpaths QA error. Remove it from target packages.
> >> >
> >> > Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
> >> > ---
> >> >  meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb | 7 +++++++
> >> >  1 file changed, 7 insertions(+)
> >> >
> >> > diff --git a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> >> > index a17e03b103..8755af94a9 100644
> >> > --- a/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> >> > +++ b/meta-gnome/recipes-gimp/gimp/gimp_2.10.38.bb
> >> > @@ -70,6 +70,13 @@ do_compile:prepend() {
> >> >      export GEGL_PATH=3D`find ${STAGING_LIBDIR_NATIVE} -maxdepth 1
> -name 'gegl-*'`
> >> >  }
> >> >
> >> > +do_install:append:class-target() {
> >> > +    # gimptool can be used in GIMP plugin compilation. It would mak=
e
> more sense
> >> > +    # as a native tool. It also contains the sysroot path which
> break build
> >> > +    # with buildpaths QA error. Remove it from target packages.
> >> > +    rm ${D}/${bindir}/gimptool-2.0
> >> > +}
> >>
> >> it does mean we can't build plugins in a usecase where an on-device
> >> SDK is being used, even though it is a rare usecase.
> >> Can we explore a way to omit the sysroot from being emitted into the
> >> target version of gimptool ?
> >
> >
> > Sure!
> >
> > Right now, Host CC is embedded in the target binary as a last-resort
> default to make gimptool output a reasonable CC for gimp plugins
> compilation.
> > I don't see how to provide a good value to put there unless I can get
> the CC that will be used in the target SDK? (I don't think I can)
> >
>
> Perhaps replacing instances of SYSROOT with target exec_prefix in CC
> emitted to binary would be a workable solution.
>

For Poky/qemux86-64, that would output
CC=3D"x86_64-poky-linux-gcc  -m64 -march=3Dcore2 -mtune=3Dcore2 -msse3
-mfpmath=3Dsse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=3D2 -Wformat
-Wformat-security -Werror=3Dformat-security --sysroot=3D/usr"

Does this look correct to you? (I've never tried the target SDK) Is the
compiler really called "x86_64-poky-linux-gcc" (or just "gcc")?


> > What do you think about removing this last-resort default with a patch?
> That would make gimptool dependent on a correct CC being provided to it
> (but the target SDK should already do that)
> >
> >>
> >> > +
> >> >  FILES:${PN}  +=3D "${datadir}/metainfo"
> >> >
> >> >  RDEPENDS:${PN} +=3D "mypaint-brushes-1.0"
> >> >
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> > Links: You receive all messages sent to this group.
> >> > View/Reply Online (#112807):
> https://lists.openembedded.org/g/openembedded-devel/message/112807
> >> > Mute This Topic: https://lists.openembedded.org/mt/108950447/1997914
> >> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> >> > Unsubscribe:
> https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> >> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >> >
> >
> >
> >
> > --
> > Yoann Congal
> > Smile ECS - Tech expert
>


--=20
Yoann Congal
Smile ECS - Tech expert

--000000000000954c870624357680
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 11 oct. 2024 =C3=A0=C2=
=A017:37, Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail=
.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">On Fri, Oct 11, 2024 at 8:34=E2=80=AFAM Yoann Congal &lt;<=
a href=3D"mailto:yoann.congal@smile.fr" target=3D"_blank">yoann.congal@smil=
e.fr</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le ven. 11 oct. 2024 =C3=A0 17:15, Khem Raj &lt;<a href=3D"mailto:raj.=
khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; a =C3=A9crit :=
<br>
&gt;&gt;<br>
&gt;&gt; On Fri, Oct 11, 2024 at 8:10=E2=80=AFAM Yoann Congal via<br>
&gt;&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" targe=
t=3D"_blank">lists.openembedded.org</a> &lt;yoann.congal=3D<a href=3D"mailt=
o:smile.fr@lists.openembedded.org" target=3D"_blank">smile.fr@lists.openemb=
edded.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Yoann Congal &lt;<a href=3D"mailto:yoann.congal@smile.f=
r" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; gimptool can be used in GIMP plugin compilation. It would mak=
e more<br>
&gt;&gt; &gt; sense as a native tool. It also contains the sysroot path whi=
ch break<br>
&gt;&gt; &gt; build with buildpaths QA error. Remove it from target package=
s.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Signed-off-by: Yoann Congal &lt;<a href=3D"mailto:yoann.conga=
l@smile.fr" target=3D"_blank">yoann.congal@smile.fr</a>&gt;<br>
&gt;&gt; &gt; ---<br>
&gt;&gt; &gt;=C2=A0 meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.1=
0.38.bb" rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a> | 7 +++++=
++<br>
&gt;&gt; &gt;=C2=A0 1 file changed, 7 insertions(+)<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; diff --git a/meta-gnome/recipes-gimp/gimp/<a href=3D"http://g=
imp_2.10.38.bb" rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a> b/=
meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.10.38.bb" rel=3D"nore=
ferrer" target=3D"_blank">gimp_2.10.38.bb</a><br>
&gt;&gt; &gt; index a17e03b103..8755af94a9 100644<br>
&gt;&gt; &gt; --- a/meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.1=
0.38.bb" rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a><br>
&gt;&gt; &gt; +++ b/meta-gnome/recipes-gimp/gimp/<a href=3D"http://gimp_2.1=
0.38.bb" rel=3D"noreferrer" target=3D"_blank">gimp_2.10.38.bb</a><br>
&gt;&gt; &gt; @@ -70,6 +70,13 @@ do_compile:prepend() {<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0 export GEGL_PATH=3D`find ${STAGING_LIBDIR=
_NATIVE} -maxdepth 1 -name &#39;gegl-*&#39;`<br>
&gt;&gt; &gt;=C2=A0 }<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; +do_install:append:class-target() {<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 # gimptool can be used in GIMP plugin compilat=
ion. It would make more sense<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 # as a native tool. It also contains the sysro=
ot path which break build<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 # with buildpaths QA error. Remove it from tar=
get packages.<br>
&gt;&gt; &gt; +=C2=A0 =C2=A0 rm ${D}/${bindir}/gimptool-2.0<br>
&gt;&gt; &gt; +}<br>
&gt;&gt;<br>
&gt;&gt; it does mean we can&#39;t build plugins in a usecase where an on-d=
evice<br>
&gt;&gt; SDK is being used, even though it is a rare usecase.<br>
&gt;&gt; Can we explore a way to omit the sysroot from being emitted into t=
he<br>
&gt;&gt; target version of gimptool ?<br>
&gt;<br>
&gt;<br>
&gt; Sure!<br>
&gt;<br>
&gt; Right now, Host CC is embedded in the target binary as a last-resort d=
efault to make gimptool output a reasonable CC for gimp plugins compilation=
.<br>
&gt; I don&#39;t see how to provide a good value to put there unless I can =
get the CC that will be used in the target SDK? (I don&#39;t think I can)<b=
r>
&gt;<br>
<br>
Perhaps replacing instances of SYSROOT with target exec_prefix in CC<br>
emitted to binary would be a workable solution.<br></blockquote><div><br></=
div><div>For Poky/qemux86-64, that would output<br></div><div>CC=3D&quot;x8=
6_64-poky-linux-gcc =C2=A0-m64 -march=3Dcore2 -mtune=3Dcore2 -msse3 -mfpmat=
h=3Dsse -fstack-protector-strong =C2=A0-O2 -D_FORTIFY_SOURCE=3D2 -Wformat -=
Wformat-security -Werror=3Dformat-security --sysroot=3D/usr&quot;<br></div>=
<div><br></div><div>Does this look correct to you? (I&#39;ve never tried th=
e target SDK) Is the compiler really called &quot;x86_64-poky-linux-gcc&quo=
t; (or just &quot;gcc&quot;)?</div><div><br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
<br>
&gt; What do you think about removing this last-resort default with a patch=
? That would make gimptool dependent on a correct CC being provided to it (=
but the target SDK should already do that)<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; &gt; +<br>
&gt;&gt; &gt;=C2=A0 FILES:${PN}=C2=A0 +=3D &quot;${datadir}/metainfo&quot;<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 RDEPENDS:${PN} +=3D &quot;mypaint-brushes-1.0&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt;&gt; &gt; View/Reply Online (#112807): <a href=3D"https://lists.openemb=
edded.org/g/openembedded-devel/message/112807" rel=3D"noreferrer" target=3D=
"_blank">https://lists.openembedded.org/g/openembedded-devel/message/112807=
</a><br>
&gt;&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt=
/108950447/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.open=
embedded.org/mt/108950447/1997914</a><br>
&gt;&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lis=
ts.openembedded.org" target=3D"_blank">openembedded-devel+owner@lists.opene=
mbedded.org</a><br>
&gt;&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/open=
embedded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.op=
enembedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@g=
mail.com" target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt;&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS - Tech expert<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr"><font face=3D"Raleway, regular">Yoann Congal</font><div><font face=3D"R=
aleway, regular">Smile ECS - Tech expert<br></font></div></div></div></div>

--000000000000954c870624357680--

