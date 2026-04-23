Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6128F9EDFE
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 07:04:58 +0000 (UTC)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14292.1776927895345286309
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 23 Apr 2026 00:04:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nS7+hwEk;
 spf=pass (domain: gmail.com, ip: 74.125.224.51, mailfrom: raj.khem@gmail.com)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65075c2ba66so4640409d50.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 00:04:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776927894; cv=none;
        d=google.com; s=arc-20240605;
        b=XHp1O+bV4I/sbM1PZGx6nbPeTUJWepud+3yan24zs/qIs0jGCdKOcQELrcmzqMMFca
         JZTIUV+JKyjW0dzEiqN41M1zqefu9fO4NImX76Q/kioVgGvLpXXaKX3xyVqjjdlidsoX
         I8msxjtD7tc3gvCH0hAlB0gMxPMJoLiKPft/+ph3/9jIJKyamt/e2AS1gRpKMgwXQFsO
         KYBSJY1j+ZYBDgVhntLNPfn9YUNGzzYUv3H1k5IlCuU/BMrOf1IHfEnJBdQ8JS3ixwYc
         G3atom+tqhLJkbM4Yzyh+YKlP91lamiCZrC2shQnbbaxcgRSRSLWwWJ9LaCEJX4tCMMJ
         WMxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=JAGRsk+gMQXs+tbAbLzvBxD8zSCn3xq4h/YHvcqsxXs=;
        fh=pqXs1Zj5el8SCB4ZVFB/22Udm7OCtXTsjsSPG5Cpfng=;
        b=W9h7V3UTA2rpBiQQv/eesdz8yd4/8sFMRfikEbRP54oBC3ibv8x2puacHT/jN1dS+I
         lmjiD3PAWMvF4lR9I9VAFUKnizDh6nao58RXe5A/Tcd0EpjIp9/n9fideLbxMFaGZH7n
         5xat6FoahEHdGfHMHGLr/1xqe9Esz3VMHou4MaFZ4tnn7xON2W4tUSxhb2ZzFuUAo2/l
         T+dHaOfPnumV2TAUEECvnkKqDB4X/74MiBQNDl8byIezfjU6L7X2swEzdG6wMM7Rcaqy
         HtF085mF2fdnVkBARYx2DGPEwKwfnsxufTljhPtVI9TzjwRNFG3m5+qgLJQUpvyvaVY1
         kRDg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776927894; x=1777532694; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JAGRsk+gMQXs+tbAbLzvBxD8zSCn3xq4h/YHvcqsxXs=;
        b=nS7+hwEkn7nT72y6qelBCLTFIU3f9dTDoFLDPd6hmWUsU/3E+/ZvT8bsrcvD8qg6P1
         PCnWOIWAPxjPJBxhukjsUS4PYrH3TXAPjRWKKCMBai0nRShNtkgXtmN49P5eIF0v9kNr
         wrTg2t4wTASnRflEJz+uNkCoTflnRDWRpl2g2Cd3MTriffWOmUP8T00a3UwhufcA1O62
         +k9MWiAJTPTjVxQayG1c+GT8gJaXavl0fvlVVDjFN9rId+8z3w54RsyAh7wwf4nR11EH
         431JMGOLE/ZUcaq970TTH5qGHQNZYhUyG4LGgD37LYDSTBoe1CJJbl3dwQnGpPtARoU0
         CA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776927894; x=1777532694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JAGRsk+gMQXs+tbAbLzvBxD8zSCn3xq4h/YHvcqsxXs=;
        b=hRXFlcFNEsvl3+8dZ/g7lW0W5KkkTnd+Olcqe8Axv5NKrqouXXwxweDR+WaeDnDzyu
         4EM47nvt+6XQ8QojVr+hcxydkXnBb8LB2bZd2299e2NKWxlt4+65xEp8vTwvQsWB5zYU
         daGw2bsu8ZrMO5P3XzLjl1qk6kExsxf94CZhL3R6HcXVaCBXeDLn5/bDGfj3MLXKfj02
         P6Qi43MtB3sVsIdBw9S8SZWDO5U0D9mXyDrscm/OQ/1hS7ONT8qPfqNFvgjYimnJWzah
         Ih0N+h8rIc8C0Fs3bhH/Q/nGkE1lKijX6kEHc/FQZ8kbISU3En6TUX6DukrXH4brCk5f
         zSQw==
X-Forwarded-Encrypted: i=1; AFNElJ+Ot2H30O7mnFD3vS1VdVTGlY93ziOTmk3qgJ5tdKxN8NENb5r0/YAQ2MlRo7yCjS6Odpv0jz66H4h1b28el60UQT8=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzPpNOSDDC6Kw2wf39wjJSwS7rjsMy3GIgUFHskIMIYWxhE2b3Y
	NM6Vr3ZVQTzYqMjrmf0SqdhUOowGTitKtmyBnFENCR0CmIQCGbXksjealiLEvQm3PGgU11qwoYX
	Utlj6Cl7dhdUCPyyknLxnbqbphU27s68=
X-Gm-Gg: AeBDiev5CJcFTnFFauiX3myhbZrvlKPbJUM9jm6eoaPBmP0mF8SRp0zVP0SBz4Fzd0R
	O4kpLTZoxCPSHKfphzic/MEz0hrbGE4+CtLHGsfURhLp56NiJ0O7TK300WXOMcOh6IUTURKGeXw
	PcQBi6EXq6T7yqlmNAPlS2NXiFpN70Lt3VSRsHjfgmcAv4UNyjGMMHELT+dHoPzleJYrP0OVNaG
	k6/1LrO30neLB1Sj/yGlW9vey57L1FZC1z1Eg346s735qMdZbMUT8cpQ6c9L/x0fFd6C5tLWG/R
	al7FEKOHtRiBLoToBZ1bHPUOCfddH8sGmDfp5euo1dZhjW0wXpzQmmQLRiWsHMqJwavfkr0fdFK
	kSVR0ooTVjo5EBKj1QSR/0hMWGLaYN00oI/xx7LxcYasBRq2T/tcJkCpJLbeb4gQauXJ/g3Wtv3
	Yqj9kEC9LgxiPn1Hi07YcrF6P8Yk6h
X-Received: by 2002:a05:690e:430c:b0:650:1960:c8b4 with SMTP id
 956f58d0204a3-653109f9d8bmr17044880d50.42.1776927894358; Thu, 23 Apr 2026
 00:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260423031717.4186749-1-wenlin.kang@windriver.com> <b9fbe190-229f-44ca-acb0-d25f61f52a9f@windriver.com>
In-Reply-To: <b9fbe190-229f-44ca-acb0-d25f61f52a9f@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Apr 2026 00:04:27 -0700
X-Gm-Features: AQROBzAcZis1ox-166_dEyKZKtaCrcMylu8CTrJc6v7MASpR4wyheSlJBDkIfoE
Message-ID: <CAMKF1spJur5cBF18bt7V5OsaPkb1b7fKauEhat-0eTt2c9FUsA@mail.gmail.com>
Subject: Re: [oe] [meta-xfce][PATCH] xfce4-session: Make libpam and systemd
 dependencies conditional
To: yi.zhao@eng.windriver.com
Cc: wenlin.kang@windriver.com, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ef50f006501b431f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 23 Apr 2026 07:04:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126572

--000000000000ef50f006501b431f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 22, 2026 at 8:40=E2=80=AFPM Yi Zhao via lists.openembedded.org =
<yi.zhao=3D
eng.windriver.com@lists.openembedded.org> wrote:

> Hi Wenlin,
>
> On 4/23/26 11:17, wenlin.kang@windriver.com via lists.openembedded.org
> wrote:
> > From: Wenlin Kang <wenlin.kang@windriver.com>
> >
> > libpam and systemd require the settings below:
> >    INIT_MANAGER =3D "systemd"
> >    DISTRO_FEATURES:append =3D " pam systemd usrmerge"
> >
> > So remove hardcoded libpam and systemd dependencies from DEPENDS.
> > Add conditional logic to include these dependencies only when
> > the corresponding DISTRO_FEATURES are enabled.
> >
> > Signed-off-by: Wenlin Kang <wenlin.kang@windriver.com>
> > ---
> >   .../xfce4-screensaver/xfce4-screensaver_4.20.2.bb         | 8 +++++++=
-
> >   1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/
> xfce4-screensaver_4.20.2.bb b/meta-xfce/recipes-apps/xfce4-screensaver/
> xfce4-screensaver_4.20.2.bb
> > index b95bfc170c..191c49b216 100644
> > --- a/meta-xfce/recipes-apps/xfce4-screensaver/
> xfce4-screensaver_4.20.2.bb
> > +++ b/meta-xfce/recipes-apps/xfce4-screensaver/
> xfce4-screensaver_4.20.2.bb
> > @@ -10,7 +10,13 @@ LIC_FILES_CHKSUM =3D
> "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4263 \
> >   XFCE_COMPRESS_TYPE =3D "xz"
> >   XFCEBASEBUILDCLASS =3D "meson"
> >
> > -DEPENDS =3D "dbus-glib garcon gtk+3 libxklavier libxscrnsaver
> virtual/libx11 xfconf libwnck3 libpam systemd"
> > +DEPENDS =3D "dbus-glib garcon gtk+3 libxklavier libxscrnsaver
> virtual/libx11 xfconf libwnck3"
> > +
> > +EXTRA_OEMESON +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', '',
> '-Dauthentication-scheme=3Dnone', d)}"
> > +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'libpam',
> '', d)}"
> > +
> > +EXTRA_OEMESON +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '', '-Dsession-manager=3Dnone', d)}"
> > +DEPENDS +=3D "${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'systemd', '', d)}"
>
>
how did you test it for runtime correctness


> I think it would be better to use PACKAGECONFIG.
>
>



>
> //Yi
>
> >
> >   inherit xfce-app
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126568):
> https://lists.openembedded.org/g/openembedded-devel/message/126568
> Mute This Topic: https://lists.openembedded.org/mt/118966722/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000ef50f006501b431f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 22,=
 2026 at 8:40=E2=80=AFPM Yi Zhao via <a href=3D"http://lists.openembedded.o=
rg">lists.openembedded.org</a> &lt;yi.zhao=3D<a href=3D"mailto:eng.windrive=
r.com@lists.openembedded.org">eng.windriver.com@lists.openembedded.org</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi We=
nlin,<br>
<br>
On 4/23/26 11:17, <a href=3D"mailto:wenlin.kang@windriver.com" target=3D"_b=
lank">wenlin.kang@windriver.com</a> via <a href=3D"http://lists.openembedde=
d.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> <br>
wrote:<br>
&gt; From: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windriver.com" tar=
get=3D"_blank">wenlin.kang@windriver.com</a>&gt;<br>
&gt;<br>
&gt; libpam and systemd require the settings below:<br>
&gt;=C2=A0 =C2=A0 INIT_MANAGER =3D &quot;systemd&quot;<br>
&gt;=C2=A0 =C2=A0 DISTRO_FEATURES:append =3D &quot; pam systemd usrmerge&qu=
ot;<br>
&gt;<br>
&gt; So remove hardcoded libpam and systemd dependencies from DEPENDS.<br>
&gt; Add conditional logic to include these dependencies only when<br>
&gt; the corresponding DISTRO_FEATURES are enabled.<br>
&gt;<br>
&gt; Signed-off-by: Wenlin Kang &lt;<a href=3D"mailto:wenlin.kang@windriver=
.com" target=3D"_blank">wenlin.kang@windriver.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0.../xfce4-screensaver/<a href=3D"http://xfce4-screensaver_=
4.20.2.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-screensaver_4.20.2.bb=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 8 +++++++-<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-xfce/recipes-apps/xfce4-screensaver/<a href=3D"http:=
//xfce4-screensaver_4.20.2.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-s=
creensaver_4.20.2.bb</a> b/meta-xfce/recipes-apps/xfce4-screensaver/<a href=
=3D"http://xfce4-screensaver_4.20.2.bb" rel=3D"noreferrer" target=3D"_blank=
">xfce4-screensaver_4.20.2.bb</a><br>
&gt; index b95bfc170c..191c49b216 100644<br>
&gt; --- a/meta-xfce/recipes-apps/xfce4-screensaver/<a href=3D"http://xfce4=
-screensaver_4.20.2.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-screensa=
ver_4.20.2.bb</a><br>
&gt; +++ b/meta-xfce/recipes-apps/xfce4-screensaver/<a href=3D"http://xfce4=
-screensaver_4.20.2.bb" rel=3D"noreferrer" target=3D"_blank">xfce4-screensa=
ver_4.20.2.bb</a><br>
&gt; @@ -10,7 +10,13 @@ LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db23=
4ee4d69f5fce4486a80fdaf4a4263 \<br>
&gt;=C2=A0 =C2=A0XFCE_COMPRESS_TYPE =3D &quot;xz&quot;<br>
&gt;=C2=A0 =C2=A0XFCEBASEBUILDCLASS =3D &quot;meson&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -DEPENDS =3D &quot;dbus-glib garcon gtk+3 libxklavier libxscrnsaver vi=
rtual/libx11 xfconf libwnck3 libpam systemd&quot;<br>
&gt; +DEPENDS =3D &quot;dbus-glib garcon gtk+3 libxklavier libxscrnsaver vi=
rtual/libx11 xfconf libwnck3&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMESON +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;pam&#39;, &#39;&#39;, &#39;-Dauthentication-scheme=3Dnone&#39;, d)=
}&quot;<br>
&gt; +DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;pam&#39;, &#39;libpam&#39;, &#39;&#39;, d)}&quot;<br>
&gt; +<br>
&gt; +EXTRA_OEMESON +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;systemd&#39;, &#39;&#39;, &#39;-Dsession-manager=3Dnone&#39;, d)}&=
quot;<br>
&gt; +DEPENDS +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#=
39;systemd&#39;, &#39;systemd&#39;, &#39;&#39;, d)}&quot;<br>
<br></blockquote><div><br></div><div>how did you test it for runtime correc=
tness=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
I think it would be better to use PACKAGECONFIG.<br>
<br></blockquote><div><br></div><div><br></div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
<br>
//Yi<br>
<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0inherit xfce-app<br>
&gt;=C2=A0 =C2=A0<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#126568): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/126568" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/126568</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/118966722/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/118966722/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" targ=
et=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--000000000000ef50f006501b431f--

