Return-Path: <alperyasinak1@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6537C52D7B
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 15:42:38 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.63239.1723131757145158003
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 08:42:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fugawcsL;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: alperyasinak1@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2cb4c584029so920963a91.3
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 08:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723131756; x=1723736556; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=87G/kTD327pjLzTEzlFDtnii8tY2j2n9VhS/z6haV/U=;
        b=fugawcsLPu1WZ6/6qhwjYLaKu6jtWOqxVfG7Ww2ZH+yL3gp66QLVfpiubALit7B8L4
         6dB+WsRXAHdtmRAZsSNCUxM4STJdVesbS5/iEBwpbcQuB6zUCZJplLE07TcYSXiZv6nm
         n9wBwlOQbONhJgeRD4QG9VRZmaeYBnLb7KvXf1HPtoZc683K4vQNT4+MKBU96a+xlshA
         OM1CY1kgcptmdha4tprJXcE4XnF/CS1rr0HzWxYMwkRUH1QrTlYgdxc8g06CaNWJkC3L
         5jKtbI8BJRRj2oTOaYlViJ5hfncPwjK0JNucUvI28K/tIVVN8omZFBGw4hKmoE8xxl2c
         28GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723131756; x=1723736556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=87G/kTD327pjLzTEzlFDtnii8tY2j2n9VhS/z6haV/U=;
        b=f5XAxpI6/rKvj4T9TGHT0OtGr+lkNo9kXoCBTyYbTFt2eCGbG3h/kDtD9SVL0C5cQ0
         rj3sCpk+C6rGaPP9HGBMZqv4cvfMD9Moz6p5J8mbkQGTLHKaI9pfHY0jhzpyfbObxMsz
         x2UbkKV6O0iCCI+8AUQ5leUk9QVHkqC/VX6vLgSuLpWJfc53AZVvGzLFPy10tf4NJKSa
         NPMA1TBMzLl6pdVhFfiJABDejCCxYNreo0c5K2Gvu98sJXRhWVps/N5MeOfQxPMDs9+B
         QM5ZSe6kj5vTUeeAXKsKvJdafqpTefV2EXZNIU7HEuWJTyZPRNmgebdsXaEwUmJQfgsG
         f4Dw==
X-Forwarded-Encrypted: i=1; AJvYcCVsZwf8ZsK4A3E0EYRY9bEVgpNsWbqPRqasLI6jzE/8JPzwwFWdjJL2FdH/BgycxyTtOPZuq7JKQ2kmJpPFz+zUKSlYIFCG+t2WSmQO8Qe9hpPBkIGPm47DGQ==
X-Gm-Message-State: AOJu0YxaX1Uywd6z8nvK15GnPaYtbF0OOm9DwixIGoXDVKf8c3+BP0B6
	LX0fXly0oeJL9HFmI356TULmHoxbUuamGarGerwi+q+AptM6v2+MRfItYUcLKOzmbxPwcKIvoZ2
	GGB5SNC3yq5TtHEMDtxbQvVGiG+QgIdZaaJ8=
X-Google-Smtp-Source: AGHT+IGl6li9A+/dgx/ZrxzdYrNEHNeouraUGOW7upGQ5R5JIkDknXO5SfblqiYiZxDR/Nguv+WRfZiN0jfQn+a6F0o=
X-Received: by 2002:a17:90b:180f:b0:2c9:5a87:f17c with SMTP id
 98e67ed59e1d1-2d1c33a4836mr2694324a91.15.1723131756380; Thu, 08 Aug 2024
 08:42:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240808101402.24626-1-alperyasinak1@gmail.com>
 <CAMSfU+5QtYgjPCvN3M6AQm8PvNArEOFGZidq-yxxd+MNN-fmTg@mail.gmail.com> <CAMKF1srOb7wA++o6pMrJn_YhJrp=dzf6pN1uro1vOMWckHu+2g@mail.gmail.com>
In-Reply-To: <CAMKF1srOb7wA++o6pMrJn_YhJrp=dzf6pN1uro1vOMWckHu+2g@mail.gmail.com>
From: Alper Ak <alperyasinak1@gmail.com>
Date: Thu, 8 Aug 2024 18:42:25 +0300
Message-ID: <CAGpma=7DmrXBRvKt7E9-rAmm6BDwkQcm0xUEm_-RYrkpprb7vQ@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-reedsolo: fix versioning
To: Khem Raj <raj.khem@gmail.com>
Cc: yoann.congal@smile.fr, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003d8970061f2de015"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 15:42:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111668

--0000000000003d8970061f2de015
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I didn't know that we had to increase the PE. I learned a new thing, thanks
:)

I will upgrade to 2.1 when I can and that way there will be no need PE.

Khem Raj <raj.khem@gmail.com>, 8 A=C4=9Fu 2024 Per, 18:31 tarihinde =C5=9Fu=
nu yazd=C4=B1:

> On Thu, Aug 8, 2024 at 7:39=E2=80=AFAM Yoann Congal via lists.openembedde=
d.org
> <yoann.congal=3Dsmile.fr@lists.openembedded.org> wrote:
> >
> >
> >
> > Le jeudi 8 ao=C3=BBt 2024, Alper Ak via lists.openembedded.org
> <alperyasinak1=3Dgmail.com@lists.openembedded.org> a =C3=A9crit :
> > > The latest release version 1.7.0.
> > >
> > > https://pypi.org/project/reedsolo/#description
> > > https://github.com/tomerfiliba-org/reedsolomon/releases
> > >
> > > Signed-off-by: alperak <alperyasinak1@gmail.com>
> > > ---
> > >  .../{python3-reedsolo_2.0.13.bb =3D> python3-reedsolo_1.7.0.bb}   | =
2
> +-
> >
> > Hi,
> >
> > I haven't looked at what the correct PV should be, but don't we need to
> increase PE when PV decrease like this?
>
> yes thats the right thing for downgrades and its sad that 2.0.13 was
> recalled. We should perhaps upgrade to 2.1 release
> even though its in beta but that would be better imo.
>
> >
> > Thanks!
> >
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta-python/recipes-devtools/python3-reedsolo/{
> python3-reedsolo_2.0.13.bb =3D> python3-reedsolo_1.7.0.bb} (75%)
> > >
> > > diff --git a/meta-python/recipes-devtools/python3-reedsolo/
> python3-reedsolo_2.0.13.bb
> b/meta-python/recipes-devtools/python3-reedsolo/python3-reedsolo_1.7.0.bb
> > > similarity index 75%
> > > rename from meta-python/recipes-devtools/python3-reedsolo/
> python3-reedsolo_2.0.13.bb
> > > rename to meta-python/recipes-devtools/python3-reedsolo/
> python3-reedsolo_1.7.0.bb
> > > index bb5b973d8..b6c40921c 100644
> > > --- a/meta-python/recipes-devtools/python3-reedsolo/
> python3-reedsolo_2.0.13.bb
> > > +++ b/meta-python/recipes-devtools/python3-reedsolo/
> python3-reedsolo_1.7.0.bb
> > > @@ -3,7 +3,7 @@ HOMEPAGE =3D "https://github.com/tomerfiliba/reedsolo=
mon
> "
> > >  LICENSE =3D "MIT-0 | Unlicense"
> > >  LIC_FILES_CHKSUM =3D
> "file://LICENSE;md5=3Dffde61aeb8917e70e0257e0a4b6d103c"
> > >
> > > -SRC_URI[sha256sum] =3D
> "71b4121c6860a55899435c552051a19d5f023c50358be4b1c0fa0c6e2f4ac717"
> > > +SRC_URI[sha256sum] =3D
> "c1359f02742751afe0f1c0de9f0772cc113835aa2855d2db420ea24393c87732"
> > >
> > >  inherit pypi setuptools3
> > >
> > > --
> > > 2.25.1
> > >
> > >
> >
> > --
> > Yoann Congal
> > Smile ECS - Tech expert
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111665):
> https://lists.openembedded.org/g/openembedded-devel/message/111665
> > Mute This Topic: https://lists.openembedded.org/mt/107786892/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000003d8970061f2de015
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I didn&#39;t know that we had to increase the PE. I learne=
d a new thing, thanks :)<br><br>I will upgrade to 2.1 when I can and that w=
ay there will be no need PE.<br></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt;, 8 A=C4=9Fu 2024 Per, 18:31 tarihinde =
=C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Thu, Aug 8, 2024 at 7:39=E2=80=AFAM Yoann Congal via <a href=3D"ht=
tp://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.ope=
nembedded.org</a><br>
&lt;yoann.congal=3D<a href=3D"mailto:smile.fr@lists.openembedded.org" targe=
t=3D"_blank">smile.fr@lists.openembedded.org</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Le jeudi 8 ao=C3=BBt 2024, Alper Ak via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 &lt;alperyasinak1=3D<a href=3D"mailto:gmail.com@lists.openembedded.org" ta=
rget=3D"_blank">gmail.com@lists.openembedded.org</a>&gt; a =C3=A9crit :<br>
&gt; &gt; The latest release version 1.7.0.<br>
&gt; &gt;<br>
&gt; &gt; <a href=3D"https://pypi.org/project/reedsolo/#description" rel=3D=
"noreferrer" target=3D"_blank">https://pypi.org/project/reedsolo/#descripti=
on</a><br>
&gt; &gt; <a href=3D"https://github.com/tomerfiliba-org/reedsolomon/release=
s" rel=3D"noreferrer" target=3D"_blank">https://github.com/tomerfiliba-org/=
reedsolomon/releases</a><br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: alperak &lt;<a href=3D"mailto:alperyasinak1@gmail.=
com" target=3D"_blank">alperyasinak1@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 .../{<a href=3D"http://python3-reedsolo_2.0.13.bb" rel=3D"n=
oreferrer" target=3D"_blank">python3-reedsolo_2.0.13.bb</a> =3D&gt; <a href=
=3D"http://python3-reedsolo_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-reedsolo_1.7.0.bb</a>}=C2=A0 =C2=A0| 2 +-<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; I haven&#39;t looked at what the correct PV should be, but don&#39;t w=
e need to increase PE when PV decrease like this?<br>
<br>
yes thats the right thing for downgrades and its sad that 2.0.13 was<br>
recalled. We should perhaps upgrade to 2.1 release<br>
even though its in beta but that would be better imo.<br>
<br>
&gt;<br>
&gt; Thanks!<br>
&gt;<br>
&gt; &gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt;=C2=A0 rename meta-python/recipes-devtools/python3-reedsolo/{<a hr=
ef=3D"http://python3-reedsolo_2.0.13.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-reedsolo_2.0.13.bb</a> =3D&gt; <a href=3D"http://python3-reedsol=
o_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-reedsolo_1.7.0.bb<=
/a>} (75%)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-python/recipes-devtools/python3-reedsolo/<a hre=
f=3D"http://python3-reedsolo_2.0.13.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-reedsolo_2.0.13.bb</a> b/meta-python/recipes-devtools/python3-ree=
dsolo/<a href=3D"http://python3-reedsolo_1.7.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">python3-reedsolo_1.7.0.bb</a><br>
&gt; &gt; similarity index 75%<br>
&gt; &gt; rename from meta-python/recipes-devtools/python3-reedsolo/<a href=
=3D"http://python3-reedsolo_2.0.13.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-reedsolo_2.0.13.bb</a><br>
&gt; &gt; rename to meta-python/recipes-devtools/python3-reedsolo/<a href=
=3D"http://python3-reedsolo_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-reedsolo_1.7.0.bb</a><br>
&gt; &gt; index bb5b973d8..b6c40921c 100644<br>
&gt; &gt; --- a/meta-python/recipes-devtools/python3-reedsolo/<a href=3D"ht=
tp://python3-reedsolo_2.0.13.bb" rel=3D"noreferrer" target=3D"_blank">pytho=
n3-reedsolo_2.0.13.bb</a><br>
&gt; &gt; +++ b/meta-python/recipes-devtools/python3-reedsolo/<a href=3D"ht=
tp://python3-reedsolo_1.7.0.bb" rel=3D"noreferrer" target=3D"_blank">python=
3-reedsolo_1.7.0.bb</a><br>
&gt; &gt; @@ -3,7 +3,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://github.com/=
tomerfiliba/reedsolomon" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/tomerfiliba/reedsolomon</a>&quot;<br>
&gt; &gt;=C2=A0 LICENSE =3D &quot;MIT-0 | Unlicense&quot;<br>
&gt; &gt;=C2=A0 LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dffde61aeb89=
17e70e0257e0a4b6d103c&quot;<br>
&gt; &gt;<br>
&gt; &gt; -SRC_URI[sha256sum] =3D &quot;71b4121c6860a55899435c552051a19d5f0=
23c50358be4b1c0fa0c6e2f4ac717&quot;<br>
&gt; &gt; +SRC_URI[sha256sum] =3D &quot;c1359f02742751afe0f1c0de9f0772cc113=
835aa2855d2db420ea24393c87732&quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 inherit pypi setuptools3<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; 2.25.1<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt; --<br>
&gt; Yoann Congal<br>
&gt; Smile ECS - Tech expert<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111665): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111665" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/111665</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10778689=
2/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107786892/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000003d8970061f2de015--

