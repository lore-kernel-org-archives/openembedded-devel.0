Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FF60C43458
	for <webhook@archiver.kernel.org>; Mon,  6 Jul 2026 09:08:04 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.146158.1783328875147999573
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Jul 2026 02:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=cWkJcw6t;
 spf=pass (domain: snapchat.com, ip: 209.85.221.45, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47d70879764so716729f8f.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 02:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783328873; cv=none;
        d=google.com; s=arc-20260327;
        b=DCGKkVlk+uvH2osoiIhVgHeduFI9QmwpAH96l4btkEuGjHy24PSGv71vVIBW3Oirps
         oG4qz8zawP9v1OAnczDhBqgp6XlzOiU3/05+qxOj6eBJj+E3JyDzNzEqE3y8kb72d5J3
         /vxBQ+JNl6WwCk/yRQAxBApyug9MaQtlPbNmeuKVsZ3pLfhJQTjeHAm3vZlbTw6yVOIS
         Y+IaBX5XL26IwWQ3yTDUF2jsf0pRxSizBODnMNOBrL4QPFdVWPe8Dnj7OBN3ttNXJff8
         hweMPEJVyrx3XtL8Q/psu9MTimz2LWdRkI5IlK56HakE3XRIqEchNvvNULdFPyhUBVl9
         n6AA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sGq4jCNLG/+C3rcMk3m6fs3Y5DkmRfE3zlDE/TJ/qYE=;
        fh=niJB9ttJggaW01kO+Yds+PKlzKsKMugB2EtMpa+ueC8=;
        b=IQzt124uS1pH+S7FZybiiIH9Mo9fi1BKMxvcecP5u88/ivaWVtS7+k9B5G9a8dLKpY
         0CYhIkjy5th0y+HZZZ2CxPYayv2r4iMPvg6FcTk99/jpxkBP/zMtsGPG4rI4GpRRInCk
         emlKFcfEYAx5uDMu1monhAdJz6Jaztm5eiXd0MgpcqD1RdpXkGTAjNE1VEurvPwmZ++E
         N9Zar0U55B0vAqpmI743RJdYnGsKVtnEDT3CmHETeYLfIn8Yg1pLx8tJV2hRD4ebu2tP
         AyjDPy2r8XwY2QIfYk+lcpFPZ1yJ17aP1tWLnWQ2ZHM1td39G9vDgxNW7rjU1Bo5zop/
         BkcA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1783328873; x=1783933673; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sGq4jCNLG/+C3rcMk3m6fs3Y5DkmRfE3zlDE/TJ/qYE=;
        b=cWkJcw6tttIQkmUDKgqwsuhkCQV3eFkDU5Izd1VQ9I3I3aimapsG9cQHHtcr8uW0aP
         yorebWQ88KvWbqkHUrxYp9MkEyZEeHO7gVeGufLeCWjHvgJaiJI95lBNIeoSHE1VcUJv
         FOmo1WzitFM1AmwwdBnfhILDTiDgMov5HoOOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783328873; x=1783933673;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sGq4jCNLG/+C3rcMk3m6fs3Y5DkmRfE3zlDE/TJ/qYE=;
        b=IRlwtD25tgrTm45LHxMOxrMoBTMCo1osBQ7tPt2H+xh18uIfwxANBnjLBO8IA8386I
         /Rq1nLyWDQfb4lDAIjo6z8hn/k6buhGy4tipmCZsF21od+Sy3hLnEd8pCiD99hHh/1QW
         72DxyXaeZyGeLeeRqn9RY5MqDOalvWo2mbViGFxwmQlrHY4PUVhkSdUepV2/QRzoGLWW
         RE6HCLRxjXoH2yK1lVxwO2sWQOSc4L/8FYoiaJYd11y+NZfZicBb+/AHvpZwpFCuCEE3
         CxUdOsBkeJTKWZApNSqi8FqVoaiYyy5RbdpDaLhP9PhiOQOA/vtkhOQ+n5bBKcIPFloy
         7a8A==
X-Forwarded-Encrypted: i=1; AHgh+RpXJ83rOFN4/Ea6qUYlTghNodOerMOunQeDdNDFt1J5bk6/D8wbiTgX52f7ynotyZLVG86jbxOcUzkVCAMqdlAGU3o=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwKWt6GDwIqdbRENMKQaPDkdxYl7ljCbeYl1GtnX7z37W5v5xH
	WWNXAWCeIJg9ybHA7eskaNhFJ3CtcxNC5Se+iu9LKqeKPFo5twsrbfc/wSG/j3o5Pp1uHRGqOMq
	fvEbY5XuLubz1sz2KF3Yqx6WbO0OzO0GjlLPXMPFA7866DeTpjzB+XpncWA==
X-Gm-Gg: AfdE7clL6cCVmpIGIlQ5C5X0UMVVnsDcnwL75mXTdqMZpqFYB4Au6nL+aMKAlNewsN9
	w5LQjtFw9QVZdjkgPQRvcMIguGYWPTs/BLQ4hesgv3VigSdTB0JaC7qHHUo3wpTYr/4JefTR5ZG
	UPao66u74vBMsc/F50JStRw8Xk86M6s/nSPZvyjNqyA+uiulZo10f5Plyewf7/A+3cEuZau3KhQ
	x1xxAlOhnoMl5/IpBFnNeMl3iezBrtZoJZRa6KtPFQZ2ZWKRswagRDSHb87C86rruVMk2AQHWkQ
	a/groRJ949TOPRyoRcRHOQjnU8NdBw==
X-Received: by 2002:a05:6000:716:b0:461:9950:da50 with SMTP id
 ffacd0b85a97d-47aa92c05fbmr11486118f8f.11.1783328873130; Mon, 06 Jul 2026
 02:07:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260706083445.2842309-1-ross.burton@arm.com> <20260706083445.2842309-2-ross.burton@arm.com>
 <CAHUKmYa5UeP58KtKS8KgM3aF0ejnKMiUHTRaGSP7CeHb-P7mdg@mail.gmail.com> <aktu_EN4zkSjImFj@nuoska>
In-Reply-To: <aktu_EN4zkSjImFj@nuoska>
From: Etienne Cordonnier <ecordonnier@snap.com>
Date: Mon, 6 Jul 2026 11:07:40 +0200
X-Gm-Features: AVVi8Cd7je3TT8Kzi25ZImAQTgR-7St6wpVW8RFQe7K4zdsSVBFaFoYmv93R5UU
Message-ID: <CAHUKmYbyTbUPs3CXuZHXmXj9NYJ_iiB9zpgu6-nrSShiATqJjw@mail.gmail.com>
Subject: Re: [oe] [PATCH 2/2] uutils-coreutils: delete .cargo/config.toml
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: ross.burton@arm.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000000616e0655ed9c64"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Jul 2026 09:08:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128036

--00000000000000616e0655ed9c64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

OK, thanks. I'll need to investigate whether something changed. In the past
I had to send fixes specifically because this file was ignored in yocto
builds ( see https://github.com/uutils/coreutils/pull/8360 ).

On Mon, Jul 6, 2026 at 11:01=E2=80=AFAM Mikko Rapeli <mikko.rapeli@linaro.o=
rg>
wrote:

> Hi,
>
> The file is not ignored. It gets used and overrides linker set by
> cargo.bbclass/rust.
> uutils-coreutils builds are currently broken on arm64 build hosts and thi=
s
> patch fixed them.
>
> Cheers,
>
> -Mikko
>
> On Mon, Jul 06, 2026 at 10:50:19AM +0200, Etienne Cordonnier via
> lists.openembedded.org wrote:
> > Hi Ross,
> >
> > what is the use-case of the patch? config.toml file is ignored in
> > out-of-tree builds ( https://github.com/rust-lang/cargo/issues/2930  ),
> so
> > AFAIU removing it shouldn't make any difference for a bitbake build. Is
> it
> > for devtool builds?
> >
> > =C3=89tienne
> >
> >
> > On Mon, Jul 6, 2026 at 10:34=E2=80=AFAM Ross Burton via lists.openembed=
ded.org
> > <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> >
> > > This file hardcodes a specific compiler for aarch64-linux builds, whi=
ch
> > > is not the compiler that we provide.  As it's otherwise useless, we c=
an
> > > just delete the file.
> > >
> > > Signed-off-by: Ross Burton <ross.burton@arm.com>
> > > ---
> > >  .../recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb   | 4
> ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/meta-oe/recipes-core/uutils-coreutils/
> > > uutils-coreutils_0.9.0.bb b/meta-oe/recipes-core/uutils-coreutils/
> > > uutils-coreutils_0.9.0.bb
> > > index d294736395..2c7d3a3200 100644
> > > --- a/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
> > > +++ b/meta-oe/recipes-core/uutils-coreutils/uutils-coreutils_0.9.0.bb
> > > @@ -65,6 +65,10 @@ python __anonymous() {
> > >
> > >  BBCLASSEXTEND =3D "native nativesdk"
> > >
> > > +do_configure:prepend() {
> > > +    rm -f ${S}/.cargo/config.toml
> > > +}
> > > +
> > >  do_compile:prepend() {
> > >      export LIBSTDBUF_DIR=3D"${libdir}/coreutils"
> > >  }
> > > --
> > > 2.43.0
> > >
> > >
> > >
> > >
> > >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#128031):
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_128031&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0=
hpF_4vCHvabgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&=
m=3DuLBAxAVxvPA0OdjZ6ENLmT8jfeji5R00bAuSC7pG1WThhqcr5s4ImgHl2V2Ksvon&s=3DGq=
PIL0bx8OcFWM9cn_D5VM-RjX-XWtIMAIOBYhIQDKY&e=3D
> > Mute This Topic:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_mt_120136596_7159507&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC=
2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DuLBAxAVxvPA0O=
djZ6ENLmT8jfeji5R00bAuSC7pG1WThhqcr5s4ImgHl2V2Ksvon&s=3Di2fZUu8gqjbAx4GrXTh=
yR-Ef6r7RD9Zi78eiCpHFsXM&e=3D
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe:
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_unsub&d=3DDwIDaQ&c=3DncDTmphkJTvjIDPh0hpF_4vCHv=
abgGkICC2epckfdiw&r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&m=3DuLBAx=
AVxvPA0OdjZ6ENLmT8jfeji5R00bAuSC7pG1WThhqcr5s4ImgHl2V2Ksvon&s=3DN5X_J-Kw5XX=
iqJL6mqgIKED8BMXuK0S7uIHndfvs03k&e=3D
> [mikko.rapeli@linaro.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--00000000000000616e0655ed9c64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">OK, thanks. I&#39;ll need to investigate whether something=
 changed. In the past I had to send fixes specifically because this file wa=
s ignored in yocto builds ( see=C2=A0<a href=3D"https://github.com/uutils/c=
oreutils/pull/8360">https://github.com/uutils/coreutils/pull/8360</a> ).</d=
iv><br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Mon, Jul 6, 2026 at 11:01=E2=80=AFAM Mikko Rapeli &lt=
;<a href=3D"mailto:mikko.rapeli@linaro.org">mikko.rapeli@linaro.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
The file is not ignored. It gets used and overrides linker set by cargo.bbc=
lass/rust.<br>
uutils-coreutils builds are currently broken on arm64 build hosts and this<=
br>
patch fixed them.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
On Mon, Jul 06, 2026 at 10:50:19AM +0200, Etienne Cordonnier via <a href=3D=
"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.=
openembedded.org</a> wrote:<br>
&gt; Hi Ross,<br>
&gt; <br>
&gt; what is the use-case of the patch? config.toml file is ignored in<br>
&gt; out-of-tree builds ( <a href=3D"https://github.com/rust-lang/cargo/iss=
ues/2930" rel=3D"noreferrer" target=3D"_blank">https://github.com/rust-lang=
/cargo/issues/2930</a>=C2=A0 ), so<br>
&gt; AFAIU removing it shouldn&#39;t make any difference for a bitbake buil=
d. Is it<br>
&gt; for devtool builds?<br>
&gt; <br>
&gt; =C3=89tienne<br>
&gt; <br>
&gt; <br>
&gt; On Mon, Jul 6, 2026 at 10:34=E2=80=AFAM Ross Burton via <a href=3D"htt=
p://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.open=
embedded.org</a><br>
&gt; &lt;ross.burton=3D<a href=3D"mailto:arm.com@lists.openembedded.org" ta=
rget=3D"_blank">arm.com@lists.openembedded.org</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; This file hardcodes a specific compiler for aarch64-linux builds,=
 which<br>
&gt; &gt; is not the compiler that we provide.=C2=A0 As it&#39;s otherwise =
useless, we can<br>
&gt; &gt; just delete the file.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@arm.=
com" target=3D"_blank">ross.burton@arm.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../recipes-core/uutils-coreutils/<a href=3D"http://uutils-=
coreutils_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreutils_0=
.9.0.bb</a>=C2=A0 =C2=A0| 4 ++++<br>
&gt; &gt;=C2=A0 1 file changed, 4 insertions(+)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-oe/recipes-core/uutils-coreutils/<br>
&gt; &gt; <a href=3D"http://uutils-coreutils_0.9.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">uutils-coreutils_0.9.0.bb</a> b/meta-oe/recipes-core/uutil=
s-coreutils/<br>
&gt; &gt; <a href=3D"http://uutils-coreutils_0.9.0.bb" rel=3D"noreferrer" t=
arget=3D"_blank">uutils-coreutils_0.9.0.bb</a><br>
&gt; &gt; index d294736395..2c7d3a3200 100644<br>
&gt; &gt; --- a/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uut=
ils-coreutils_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreuti=
ls_0.9.0.bb</a><br>
&gt; &gt; +++ b/meta-oe/recipes-core/uutils-coreutils/<a href=3D"http://uut=
ils-coreutils_0.9.0.bb" rel=3D"noreferrer" target=3D"_blank">uutils-coreuti=
ls_0.9.0.bb</a><br>
&gt; &gt; @@ -65,6 +65,10 @@ python __anonymous() {<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 BBCLASSEXTEND =3D &quot;native nativesdk&quot;<br>
&gt; &gt;<br>
&gt; &gt; +do_configure:prepend() {<br>
&gt; &gt; +=C2=A0 =C2=A0 rm -f ${S}/.cargo/config.toml<br>
&gt; &gt; +}<br>
&gt; &gt; +<br>
&gt; &gt;=C2=A0 do_compile:prepend() {<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 export LIBSTDBUF_DIR=3D&quot;${libdir}/coreut=
ils&quot;<br>
&gt; &gt;=C2=A0 }<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.0<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; <br>
&gt; &gt;<br>
&gt; &gt;<br>
<br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#128031): <a href=3D"https://urldefense.proofpoint.=
com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_mess=
age_128031&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfd=
iw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DuLBAxAVxvPA0=
OdjZ6ENLmT8jfeji5R00bAuSC7pG1WThhqcr5s4ImgHl2V2Ksvon&amp;s=3DGqPIL0bx8OcFWM=
9cn_D5VM-RjX-XWtIMAIOBYhIQDKY&amp;e=3D" rel=3D"noreferrer" target=3D"_blank=
">https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded=
.org_g_openembedded-2Ddevel_message_128031&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJ=
TvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTK=
UkSGa66m67E&amp;m=3DuLBAxAVxvPA0OdjZ6ENLmT8jfeji5R00bAuSC7pG1WThhqcr5s4ImgH=
l2V2Ksvon&amp;s=3DGqPIL0bx8OcFWM9cn_D5VM-RjX-XWtIMAIOBYhIQDKY&amp;e=3D</a> =
<br>
&gt; Mute This Topic: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=
=3Dhttps-3A__lists.openembedded.org_mt_120136596_7159507&amp;d=3DDwIDaQ&amp=
;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRfPx_Q=
j9TsRih1DULJTKUkSGa66m67E&amp;m=3DuLBAxAVxvPA0OdjZ6ENLmT8jfeji5R00bAuSC7pG1=
WThhqcr5s4ImgHl2V2Ksvon&amp;s=3Di2fZUu8gqjbAx4GrXThyR-Ef6r7RD9Zi78eiCpHFsXM=
&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proofpoi=
nt.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_mt_120136596_7159507&amp=
;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhk=
bNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DuLBAxAVxvPA0OdjZ6ENLmT8jfe=
ji5R00bAuSC7pG1WThhqcr5s4ImgHl2V2Ksvon&amp;s=3Di2fZUu8gqjbAx4GrXThyR-Ef6r7R=
D9Zi78eiCpHFsXM&amp;e=3D</a> <br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dh=
ttps-3A__lists.openembedded.org_g_openembedded-2Ddevel_unsub&amp;d=3DDwIDaQ=
&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw&amp;r=3DAhkbNonVuMIGRf=
Px_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DuLBAxAVxvPA0OdjZ6ENLmT8jfeji5R00bAuSC=
7pG1WThhqcr5s4ImgHl2V2Ksvon&amp;s=3DN5X_J-Kw5XXiqJL6mqgIKED8BMXuK0S7uIHndfv=
s03k&amp;e=3D" rel=3D"noreferrer" target=3D"_blank">https://urldefense.proo=
fpoint.com/v2/url?u=3Dhttps-3A__lists.openembedded.org_g_openembedded-2Ddev=
el_unsub&amp;d=3DDwIDaQ&amp;c=3DncDTmphkJTvjIDPh0hpF_4vCHvabgGkICC2epckfdiw=
&amp;r=3DAhkbNonVuMIGRfPx_Qj9TsRih1DULJTKUkSGa66m67E&amp;m=3DuLBAxAVxvPA0Od=
jZ6ENLmT8jfeji5R00bAuSC7pG1WThhqcr5s4ImgHl2V2Ksvon&amp;s=3DN5X_J-Kw5XXiqJL6=
mqgIKED8BMXuK0S7uIHndfvs03k&amp;e=3D</a>=C2=A0 [<a href=3D"mailto:mikko.rap=
eli@linaro.org" target=3D"_blank">mikko.rapeli@linaro.org</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--00000000000000616e0655ed9c64--

