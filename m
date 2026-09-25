Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26A4FC98321
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 16:50:49 +0000 (UTC)
Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2791.1790355044152887966
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2026 09:50:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XmstvkLU;
 spf=pass (domain: gmail.com, ip: 74.125.224.168, mailfrom: raj.khem@gmail.com)
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-67413c9dcf0so663509d50.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 09:50:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790355043; cv=none;
        d=google.com; s=arc-20260327;
        b=k4pHeUUI4u1Xb1X/qs8WdGpoUezjRXC9IOTElnYHRHvX5jtgGIPzXGnU6dbFvGytdY
         LRmb0t/L7T8QzB8i8PGofN8SFw5DDkOu4RYBFcKSAf0UpfUZNdL94xdi+fIE0QYG1q7R
         vGHifhwRvvt5JfGhwRSke7tfC6LLq0eroW5DGw6CbVuXrfzvPj6UMuX2Iyb746jXvfAp
         fGE1SzpX2sTcOGtaf+g6J+xEMnrgQpNk5C0wyCg0sk6WexqJBs4dlZSumea76VvOUZWL
         BCThyU1DvGuPJtz8WRWe4a10LNs+Gw9GIYpYhNHBKk0PwDAEYLP3ASxO6XBeVvFp4BRe
         6J4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UPCVCFZuHcf+CLPLkxNc8wlwldrSRlkHEG1oooymXK0=;
        fh=9CO2hlLOx76kh8JalTqcYO5YpepEQgVuPgsrRR8UJHg=;
        b=gb9yvEe1scVCzu2up4iKqEP7tRyH83cRSiP4Y7RbnnSEyUSaw++zj+wbfzGFtei7I5
         FrAPMBOaVfPYPqo6yoYMtEl+wRR8TyUD/JVL6jg2bIPSwQSQlk23DXpqTsIFmUCTbxx7
         3LDxSNTehOzIRGej7t0qqAuWEqydgXXhHuEm1vVDypovOa6kbo9sBk86lChVhnVToV6n
         kbAIw44vngUk/CqKOBhtxsGzBB8Y2lXIOYncFWMf5Zoz0g+0G6H8DcjUoUdeJc/1RHYW
         sOPKIQKEg59XXZ27pnvBwLRTwhkjK9kfRryJY+KKf64fGxzyYr4H+AJ20dTJugB5oAqx
         u5Wg==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790355043; x=1790959843; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UPCVCFZuHcf+CLPLkxNc8wlwldrSRlkHEG1oooymXK0=;
        b=XmstvkLUyzAUyx+FEnSLLukeiTz3mhZsZQn45Tb6Z0Zje/ONqXXMwOXaVxlOAzeolT
         sSKDLznXWDUWspewHMet3Lv4nEATuw289wUkBya7MX192jM6jJode/aPnmvoYAKVLZxt
         KUYC7pimAlsU9F/50cSguCXaiqWo7N8sEIyCFCTxDdq5tsBNDMrI1hQ2unTo4jn7eRSv
         9yoyqvHBqPIEEeeHEEWUdRgUPMB4wQ+2r0G7YncIsfJoyB1sssDxFNn1LIpp99HwRMXT
         h6JKksESawwgxogd/3sxVB+0wzPonc8BqDKAHdHlbgikcAQD0cHru7nke+p6MRtMAsW1
         PuYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790355043; x=1790959843;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UPCVCFZuHcf+CLPLkxNc8wlwldrSRlkHEG1oooymXK0=;
        b=A/hV+/y/ZgYkffOPLi+jy4NNK4EkuXPnf2jCXlEbdTIwyNV7asyL+zYg9xL53iFZ3C
         sZ5/4HQL24WYldyDlDbHMZOvH3G5D/zxsvx6SjB1Tr7kX04WVIikQzb9COYaJUKzKpLb
         fda4QIV6BLF/7JaNbQWRxY4PurLasWlZvYkmlpiRYT9TyzkvssCoPd6saWFhnuCrOJwX
         VbSGUctWeKF8q0MTUx8N0ZUAIQ+XXGt/y+DLqK2/DmxfmjxX+GJF7zMysWZ3S+uOrq44
         aMpZA43L83Ag5W/1vzUT0f8LP4fjAsJCEgpvDtYVO3BAB6mj8/nIaGK3JctyezcAHCZI
         BHKA==
X-Forwarded-Encrypted: i=1; AKwUvBy+rd+SmsRipOjV2yubaE8SU2A+mSgffAXgjzuKE95dDjPi38rs2U7uAmrmha+MMMoJrJm0iIBRPttGUhwtl0nJwFE=@lists.openembedded.org
X-Gm-Message-State: AFuF++lSG0DzgZ/fUaAujSgJFh8b1li9dHkpZzNE6zkeaFjGEOZogBDo
	5XxUK62vQq1QWpNkDEL4OZAR2o7g6aWgnNVhd1KX233fNAVltemhvsHD55PyTJt2ucisAu6Z6gx
	5o9hUP5yqabQKk2vbwIs+gGwMfL3H8DA=
X-Gm-Gg: AYBFou2ElypM/02X+ZyKMomcsux2mISMJeYKq0s/oiPGEglJ/wZxW/1nngic1MqEjqQ
	T3HsjBFEBM3i7luDBXTELkm5UodZa+AyHpn9qM6hf+8G0o6P70iXOy3PcqdKm7mFYbwdhbJJabd
	q1ABuGicKzYTr8HtnqeiEvYZkqKDxvKIs2fXfQeNtcpYSX7BPqmpSrAjI5TqrvXCO70y6DgYhTG
	/5qSqJryQYGXSg9Ml29zRFWk+dPit0c6R894mJQEEFvukjHbTLbE9clbAbkjmltWHan30/KttBo
	kmemR8rvUyeni8CQ8fCNu5tRRLfDRpHPpv3CX8V46VWZMosQGybeM6Uh+c262koFH/sxyVx+yah
	FbPBhcG2afjer/MFkL7FEI5dfavjptK06AQdQRbqZwVC5EHTjh9pe4CoKn/CBsr3yDcj4+LNryc
	WfKHtqKHR3XmEfzjpfOQZGbXtjvA2IdEf9HxtYZeIbmzwKzeCGcPypmdj3RIDSmqRzDW7OAhAb4
	8/Wm+7XvYYr9cx/01IJ0ynKLNoTB4/JDhFPMCQ4gg1lJQHwm8DzYWbTD9J9gZ8Y80v+YWqKsCMx
	4rxEDKSy
X-Received: by 2002:a05:690e:242:b0:672:99e1:11ef with SMTP id
 956f58d0204a3-672ed51fbd9mr1917238d50.140.1790355042988; Fri, 25 Sep 2026
 09:50:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260925133929.1991-1-mark.jonas@de.bosch.com>
 <20260925133929.1991-3-mark.jonas@de.bosch.com> <CAMRc=MeH8bFxdrrA3MA6+Zz90As_ZP=nOCyoeToSH8NzAU-5Nw@mail.gmail.com>
 <DB9PR10MB5354348A5D98BF744C883337AD802@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DB9PR10MB5354348A5D98BF744C883337AD802@DB9PR10MB5354.EURPRD10.PROD.OUTLOOK.COM>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 25 Sep 2026 09:50:16 -0700
X-Gm-Features: AclHuK_EoBAHpY-ewB-xhZFrHE-nSPEcuWC0O-4MvN0nZP4hgs6ChfsEnl5SK2g
Message-ID: <CAMKF1somHy5ePhF43zu_pDaJ9wB50Y+J8yX0q1dAEwuBJ64UMg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 2/2] libgpiod: add missing CC0-1.0
To: mark.jonas@de.bosch.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, 
	"bartosz.golaszewski@oss.qualcomm.com" <bartosz.golaszewski@oss.qualcomm.com>, 
	"khem.raj@oss.qualcomm.com" <khem.raj@oss.qualcomm.com>, 
	"Simoes Ricardo (BT-EL/ESW2)" <Ricardo.Simoes@pt.bosch.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005bf89e065c51847f"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2026 16:50:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/130309

--0000000000005bf89e065c51847f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 7:03=E2=80=AFAM Mark Jonas via lists.openembedded.o=
rg
<mark.jonas=3Dde.bosch.com@lists.openembedded.org> wrote:

> Hi Bart,
>
> > Betreff: Re: [oe] [meta-oe][PATCH 2/2] libgpiod: add missing CC0-1.0
> >
> > On Fri, 25 Sep 2026 15:39:29 +0200, "Mark Jonas via
> > lists.openembedded.org"
> > <mark.jonas=3Dde.bosch.com@lists.openembedded.org> said:
> > > From: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > >
> > > The package PN-manager-cfg is shipped with the file 90-gpio.rules,
> > > which is licensed under CC0-1.0.
> > >
> > > Thus, include the CC0-1.0 license to the recipe.
> > >
> > > Signed-off-by: Ricardo Simoes <ricardo.simoes@pt.bosch.com>
> > > Signed-off-by: Mark Jonas <mark.jonas@de.bosch.com>
> > > ---
> >
> > Shouldn't this be squashed with patch 1/2?
>
> We thought we should make it obvious that we are adding a license. We did
> not want to sneak in the CC0-1.0 license.
>
> Shall we squash?
>

Yes. I think that is good.


>
> Cheers,
> Mark
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#130303):
> https://lists.openembedded.org/g/openembedded-devel/message/130303
> Mute This Topic: https://lists.openembedded.org/mt/121426454/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000005bf89e065c51847f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 25,=
 2026 at 7:03=E2=80=AFAM Mark Jonas via <a href=3D"http://lists.openembedde=
d.org">lists.openembedded.org</a> &lt;mark.jonas=3D<a href=3D"mailto:de.bos=
ch.com@lists.openembedded.org">de.bosch.com@lists.openembedded.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Bart,<=
br>
<br>
&gt; Betreff: Re: [oe] [meta-oe][PATCH 2/2] libgpiod: add missing CC0-1.0<b=
r>
&gt; <br>
&gt; On Fri, 25 Sep 2026 15:39:29 +0200, &quot;Mark Jonas via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a>&quot;<br>
&gt; &lt;mark.jonas=3D<a href=3D"mailto:de.bosch.com@lists.openembedded.org=
" target=3D"_blank">de.bosch.com@lists.openembedded.org</a>&gt; said:<br>
&gt; &gt; From: Ricardo Simoes &lt;<a href=3D"mailto:ricardo.simoes@pt.bosc=
h.com" target=3D"_blank">ricardo.simoes@pt.bosch.com</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt; The package PN-manager-cfg is shipped with the file 90-gpio.rules=
,<br>
&gt; &gt; which is licensed under CC0-1.0.<br>
&gt; &gt;<br>
&gt; &gt; Thus, include the CC0-1.0 license to the recipe.<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Ricardo Simoes &lt;<a href=3D"mailto:ricardo.simoe=
s@pt.bosch.com" target=3D"_blank">ricardo.simoes@pt.bosch.com</a>&gt;<br>
&gt; &gt; Signed-off-by: Mark Jonas &lt;<a href=3D"mailto:mark.jonas@de.bos=
ch.com" target=3D"_blank">mark.jonas@de.bosch.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; <br>
&gt; Shouldn&#39;t this be squashed with patch 1/2?<br>
<br>
We thought we should make it obvious that we are adding a license. We did n=
ot want to sneak in the CC0-1.0 license.<br>
<br>
Shall we squash?<br></blockquote><div><br></div><div>Yes. I think that is g=
ood.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Cheers,<br>
Mark<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#130303): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/130303" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/130303</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121426454/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121426454/1997914</a><br>
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

--0000000000005bf89e065c51847f--

