Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BE8C3ABB6
	for <webhook@archiver.kernel.org>; Mon,  5 May 2025 21:52:50 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.62955.1746481969313290084
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 May 2025 14:52:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VMFOpJdK;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: ticotimo@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54b0d638e86so6121706e87.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746481967; x=1747086767; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cEukPaOjTN4lHRdVtb0hl8RSndheSEepqtqag4g8qFk=;
        b=VMFOpJdKrYq2uAhFdFc3ibn0C49xCRz00/MwDeMQr7rX66Q1nDamKrYAl+2eA0Cvy7
         xPfjAVh5gpefHhpu4XBjkcB8HEy8dvYRxdlN4Kp3CHnrtFEzzyiAT4KvDZYqUYmsjtQv
         dk9mW8Kx5782asApHf1xVuRExWyWC7VvCek8eJaFYdaVid+51E5G8T6zqrg2XI+u8epW
         7lis/Bjj262pF12M/FoArlJkdxcUStAF9pbNd/f3pPEdM56aUq4ZslEx52YsISi9lGs0
         8imAbNSs2+WnWFMsdnYb+jJx3bmvk9dhkwySdJhuaR7QnsB8D5K3eFpIDibJNtbXXeuc
         xQrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481967; x=1747086767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cEukPaOjTN4lHRdVtb0hl8RSndheSEepqtqag4g8qFk=;
        b=XM+aN8rT7aymaG4KOgUtutEEE2UXb5Nztt4+tZXgM2UyRjbpLt7f316KR1rw2sPk6Z
         6ZcfsPeOOq6Mfatp8QwEB53/Z7d70idRJk2BfFAdRJdWei7E5ZexBairIIUEjGrr/gTB
         dP4xz2epQ7UX/ajc3sZRl1OrS+rVUcon1hFEwy/GcajPXBUsyxqpAh5KvKISRLwvPNuH
         noXr7s+UvM3FYCkbaZ3grUDJWp4YkykJ6HWB4c4DcTGF8rdS/Pm8IUlScor7Pfcz2cdU
         n3DbP4Wwb389TVIrwWXVV3S3KgwMNNj0U8FCJzcGJe0eDjH1Y0fomkJHDfxNBaqo67rM
         9y0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVPsTrCtOpvfyPZTh1nVc4tRSf3P3AzcfiVXVYWgheFMKSh9HJbxxtvv4Wcn9X3rJLRgVm4OE2i7/0RHmUTh5gznVU=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwaeBjfBReepynPRGc2YEmAV5oTScSLxpoC+szR+lf1roFvWzkI
	1sejJaa0+cZlZV33b73qBTmhlv9DLm8u94646rFQnz1JuubqzXhCbHWB2wL27BaeMnmD+qnFk5H
	Bij7vOY9OXcLmcko+qKEBDLm7jCs=
X-Gm-Gg: ASbGnctP67AkZbutS+dRENs3w38AXmp8gconj/szJRkG5C1eelc8DycwX8qCJYAf6nO
	o5ybi6oq73NaBzquTt8QTqU3KN30j+NkRwaDhanwMlmfHehyveU4O9OmJtTw3uLtjnVc+GGkISZ
	xMRD0j4L1vbJIHWArtkyL6i/pcQRzfrQWOYJYPmq3OZCix32JDkldWew0=
X-Google-Smtp-Source: AGHT+IFmU2EQhBcMTrC+ii69qUpq8nobc57btIQOtgcx7Cq4AP3ry73gXjOJWneimJM4MRYEvB4bEKg4CvDPzM6CfC8=
X-Received: by 2002:a05:6512:3f1a:b0:549:b0e3:925d with SMTP id
 2adb3069b0e04-54fb49f9918mr169199e87.7.1746481967054; Mon, 05 May 2025
 14:52:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250505150451.2675990-1-f.pflug@pengutronix.de>
 <f79a78f5-0b9a-4f17-9ce8-9e48945db579@baylibre.com> <a3a06f7205cb4aebbee8c045ed9a28fa57286052.camel@pengutronix.de>
In-Reply-To: <a3a06f7205cb4aebbee8c045ed9a28fa57286052.camel@pengutronix.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 5 May 2025 14:52:35 -0700
X-Gm-Features: ATxdqUEWTWmNE9UkLABptvVmqW9ZHPoIMQnErsHwzlN1UtoA0uP03cAuaEcv6yY
Message-ID: <CANx9H-CpromEyc800E_eifb-XD553Yo74TiJygCrhk+40KKeFQ@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 to scarthgap
To: f.pflug@pengutronix.de
Cc: Trevor Gamblin <tgamblin@baylibre.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000040c5e006346a8582"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 May 2025 21:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117332

--00000000000040c5e006346a8582
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I made it very clear this would not receive any continued support.

On Mon, May 5, 2025 at 8:42=E2=80=AFAM Fabian Pflug via lists.openembedded.=
org
<f.pflug=3Dpengutronix.de@lists.openembedded.org> wrote:

> On Mon, 2025-05-05 at 11:13 -0400, Trevor Gamblin wrote:
> >
> > On 2025-05-05 11:04, Fabian Pflug via lists.openembedded.org wrote:
> > > Layer is compatible with all version up till scarthgap.
> >
> > Do we really want to be making Python 2 recipes compatible with
> > Scarthgap?
> they already are. It is just not declared that way. My current problem
> is that meta-qt5 in scarthgap requires python2 for some of its
> packages, so there is a need here for me to have it compatible.
>
> >
> > It's been EOL since 2020.
> that is why there is the meta-python2 repository and not part of oe-
> core
>
>
> > >
> > > Signed-off-by: Fabian Pflug <f.pflug@pengutronix.de>
> > > ---
> > >   conf/layer.conf | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/conf/layer.conf b/conf/layer.conf
> > > index 38ef579..b1d9820 100644
> > > --- a/conf/layer.conf
> > > +++ b/conf/layer.conf
> > > @@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 =3D "1"
> > >
> > >   LAYERDEPENDS_meta-python2 =3D "core openembedded-layer"
> > >
> > > -LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone"
> > > +LAYERSERIES_COMPAT_meta-python2 =3D "kirkstone langdale mickledore
> > > nanbield scarthgap"
> > >
> > >   LICENSE_PATH +=3D "${LAYERDIR}/licenses"
> > >
> > >
> > >
> > >
> >
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#117324):
> https://lists.openembedded.org/g/openembedded-devel/message/117324
> Mute This Topic: https://lists.openembedded.org/mt/112631225/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000040c5e006346a8582
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">I made it very clear this would not receive any continued=
 support.</div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Mon, May 5, 2025 at 8:42=E2=80=AFAM =
Fabian Pflug via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;f.pflug=3D<a href=3D"mailto:pengutronix.de@lists.openembedde=
d.org">pengutronix.de@lists.openembedded.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-w=
idth:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204=
,204,204)">On Mon, 2025-05-05 at 11:13 -0400, Trevor Gamblin wrote:<br>
&gt; <br>
&gt; On 2025-05-05 11:04, Fabian Pflug via <a href=3D"http://lists.openembe=
dded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> w=
rote:<br>
&gt; &gt; Layer is compatible with all version up till scarthgap.<br>
&gt; <br>
&gt; Do we really want to be making Python 2 recipes compatible with<br>
&gt; Scarthgap?<br>
they already are. It is just not declared that way. My current problem<br>
is that meta-qt5 in scarthgap requires python2 for some of its<br>
packages, so there is a need here for me to have it compatible.<br>
<br>
&gt; <br>
&gt; It&#39;s been EOL since 2020.<br>
that is why there is the meta-python2 repository and not part of oe-<br>
core<br>
<br>
<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Fabian Pflug &lt;<a href=3D"mailto:f.pflug@pengutr=
onix.de" target=3D"_blank">f.pflug@pengutronix.de</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt; =C2=A0 conf/layer.conf | 2 +-<br>
&gt; &gt; =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/conf/layer.conf b/conf/layer.conf<br>
&gt; &gt; index 38ef579..b1d9820 100644<br>
&gt; &gt; --- a/conf/layer.conf<br>
&gt; &gt; +++ b/conf/layer.conf<br>
&gt; &gt; @@ -14,7 +14,7 @@ LAYERVERSION_meta-python2 =3D &quot;1&quot;<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; =C2=A0 LAYERDEPENDS_meta-python2 =3D &quot;core openembedded-laye=
r&quot;<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; -LAYERSERIES_COMPAT_meta-python2 =3D &quot;kirkstone&quot;<br>
&gt; &gt; +LAYERSERIES_COMPAT_meta-python2 =3D &quot;kirkstone langdale mic=
kledore<br>
&gt; &gt; nanbield scarthgap&quot;<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; =C2=A0 LICENSE_PATH +=3D &quot;${LAYERDIR}/licenses&quot;<br>
&gt; &gt; =C2=A0 <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; <br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#117324): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/117324" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/117324</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/112631225/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/112631225/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000040c5e006346a8582--

