Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6248DD7789D
	for <webhook@archiver.kernel.org>; Fri, 23 Jan 2026 17:45:09 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1143.1769190306307878354
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 23 Jan 2026 09:45:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TIHHvAUX;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b884ad1026cso331927866b.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 09:45:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769190305; cv=none;
        d=google.com; s=arc-20240605;
        b=Cxjp6KHIRyaSyNeRSA8io5fHxtO58F6b2/YYelVEdqQSLMmaLsp6MVFoaoBoIOJ4kp
         rNUt8BQNsFM7dPpjWuKv+da14Ssf2WNF4Va5QcDxffH/Xwy+E5/eu++h6psfRWN1MMgQ
         O7nbE2U/jbMEqNjDV+kwLG8aSFinG4Mg/nSSr9xfDcvIdiaKtPhdegzb/m7ktj8yOVkL
         z51iz8fTEhcV2Jvn8T2CoHLdaTZcUEdlouZRK50jd+sGCaPsL8pXVS4UihvtRfILDXQR
         2wLc1CQkQ0bvgVVZ29yQPzMsWE+tb3riT3m4gTAIVGRv+yArtA7d11OZVQn3hW/GidOU
         deLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=7KYUeYcB5ZmpvFqU+fUscuiqmV3ooFX5R266Pjv5XGg=;
        fh=d6HXzyjkjrcU2+NDJi5oQlKQTPTBXzBFsZTP45+YwpQ=;
        b=JvN49UkDvV0mFJAkAiMAdbj/OpvQBLbNMSkHumh50kowq+vv8fwccfYLYYcetyMRD4
         dZZjkuFVlrT5byLQn3h9zFa65wBNCLcAAiSWCJ2Vq0As3CN6xFnWKr3dDTGC52UuqOPp
         RT4PS+0RWJiU3PPWgOzt2njFAHTNAZYX6HAIAp8FPmdRgP2HhSEDEeXNA07YhrNcVZrY
         8vb1DjsV5oYqrEdtEBa1uD9mTxTPi4VsRGSSeIwG8EXAZdDBWm7Ht6+tH6bvaAPQBnvJ
         eVf6mTgdouaxDHJsCFDHuyP1OW0tMVm1q2TM3EdLcFDnV2+LKnYbY1hKHy1bqrTFPbzh
         gaKQ==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769190305; x=1769795105; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7KYUeYcB5ZmpvFqU+fUscuiqmV3ooFX5R266Pjv5XGg=;
        b=TIHHvAUXx/oM6WfsYLC6TUUA50reBAsUEloDcjTamItbvxdfk4/d/OlyNUF8lFU5td
         XpyoGXD+Yy5oR5c2OAceWYDdqQkIaKrv4Pb0iHl/WSTF7Ujg6KK7yxQ+PwPXIbEuhRiO
         lhftO/AyLKiUa013BOkOPNVab3eQjZpxPV0Z9p8WhCBZ/y1MrDZUGreUuI1NVJb0zJTN
         WazEmTmabgmLp++bldktwfQnzr3zqNv3H+lpvKXm4nbX8rciZ9XSBB4JkJOhgiuMbstL
         ACG+u+gqYsjPL/5C3ZJIDmaywG2okhHEq5UeoI3TmRp3bBsJ/mL2ujy05GslLstXqspT
         DF6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769190305; x=1769795105;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KYUeYcB5ZmpvFqU+fUscuiqmV3ooFX5R266Pjv5XGg=;
        b=N3Bar6EwQ0/2gnThIrRDdg9YJhtxwfRoI/yLuAFxOVFLOdVfqjv516wGFRnfluLORM
         HvyUaGBq4FR/4VJjRA+35Y06Oh16Z7FApMS2iJYR13sqJOjeRFYollCy4ByO5xkx8K1c
         7kAv/e5U+bXbk69CFu3oldugUvgmPj1y3YEEp2u7St4/n7H0CzLHrY4doxf5b0IwrTTM
         VqiNvgQRsETDF1Dn35RvLbhDXS445/iFDxEdN76h5Opx3gDJXcaCguMVvYTB+rNVmxvI
         v27cPzYIwvC6IH1ck4ayz/eQRUkwCewLsSsTjWRUDKeAugpQayDVxN+h4pzZeAyosqHI
         vHXg==
X-Gm-Message-State: AOJu0YzGAFutFd07iJ0R6FOqwSrLPg6U9SyECY/qf1E/etVYZv2P2YyC
	dlB2VY2Fav5JDMyCdWftrgWB5urD1hFdm3N8wVaZ89HHbhztNDuUMbynKpW13kVNEkInps56DUj
	+xzMj5cu7TmIHzK1y0bjETRPRTRBkWmI=
X-Gm-Gg: AZuq6aL8k03iVytbTuv2PcedabP7FVrzaaN4MmVjx0TOqyWqM0DkLxE4Ru1xjR8a6qO
	zUHl2arVyZWRy76t1a08XDwST1M2fg2sp8hL6tJIlOITumGBeL+c7N4uhtKLyFn3d2HrS3f/BZE
	6/ZaesYxTo635LAmvvUKFgUkKBFIXbu98jplrZv2vnJwYCP88XtYg0/p5VvotyEbI3fOF6DKE4F
	Va8xNZkgbPt6yx7kxhGCCYhKn0EzPmJPVJuOU7JuO56ZPw0uSAxnB7EZMBahobZvC7L4D31bA==
X-Received: by 2002:a17:907:a4e:b0:b84:2b70:98ec with SMTP id
 a640c23a62f3a-b885ae2f845mr240092766b.42.1769190304449; Fri, 23 Jan 2026
 09:45:04 -0800 (PST)
MIME-Version: 1.0
References: <20260123094603.2835-2-shoudil@qti.qualcomm.com> <gboqr7bbhrgi5tjagywg7l4xxqtkegpxaolem2r73fhbaxmwpg@7t3melnto3tk>
In-Reply-To: <gboqr7bbhrgi5tjagywg7l4xxqtkegpxaolem2r73fhbaxmwpg@7t3melnto3tk>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 23 Jan 2026 17:44:53 +0000
X-Gm-Features: AZwV_QgYp4AEGE7C_beTgEy7AXwtwPvfO-Oi1DIzAyZpH3GTxHCEh-U22dKCU3I
Message-ID: <CANPvuR=HS44P0tPKkipP_7v60y+OvMx=3JY7BxbwCicP05oz9A@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH] android-tools-conf-configfs: handle multiple
 UDC controllers
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: openembedded-devel@lists.openembedded.org, 
	Jose Quaresma <jose.quaresma@oss.qualcomm.com>, Shoudi Li <shoudil@qti.qualcomm.com>
Content-Type: multipart/alternative; boundary="000000000000a308ff064911b7dc"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 23 Jan 2026 17:45:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/123799

--000000000000a308ff064911b7dc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> escreveu (sexta,
23/01/2026 =C3=A0(s) 17:24):

> Hi,
>
>
> On Fri, Jan 23, 2026 at 09:46:04AM +0000, Shoudi Li wrote:
> In the headers: `From: Shoudi Li <quaresma.jose@gmail.com> `
>
> What is going on?


The same issue as before. I will send a v2


>
>
> > From: Shoudi Li <shoudil@qti.qualcomm.com>
> >
> > For the boards with multiple UDC ports, adb funtion will be impacted du=
e
> > to below error.
> >
> > ls /sys/class/udc/ > /sys/kernel/config/usb_gadget/adb/UDC
> > ls: write error: Device or resource busy
> >
> > Signed-off-by: Shoudi Li <shoudil@qti.qualcomm.com>
>
> Missing SoB or 'quaresma.jose@gmail.com'.
>
>
> --
> With best wishes
> Dmitry
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000a308ff064911b7dc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Dmitry Baryshko=
v &lt;<a href=3D"mailto:dmitry.baryshkov@oss.qualcomm.com">dmitry.baryshkov=
@oss.qualcomm.com</a>&gt; escreveu (sexta, 23/01/2026 =C3=A0(s) 17:24):<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
<br>
On Fri, Jan 23, 2026 at 09:46:04AM +0000, Shoudi Li wrote:<br>
In the headers: `From: Shoudi Li &lt;<a href=3D"mailto:quaresma.jose@gmail.=
com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; `<br>
<br>
What is going on?</blockquote><div><br></div><div>The same issue as before.=
 I will send a v2</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" s=
tyle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pad=
ding-left:1ex"><br>
<br>
&gt; From: Shoudi Li &lt;<a href=3D"mailto:shoudil@qti.qualcomm.com" target=
=3D"_blank">shoudil@qti.qualcomm.com</a>&gt;<br>
&gt; <br>
&gt; For the boards with multiple UDC ports, adb funtion will be impacted d=
ue<br>
&gt; to below error.<br>
&gt; <br>
&gt; ls /sys/class/udc/ &gt; /sys/kernel/config/usb_gadget/adb/UDC<br>
&gt; ls: write error: Device or resource busy<br>
&gt; <br>
&gt; Signed-off-by: Shoudi Li &lt;<a href=3D"mailto:shoudil@qti.qualcomm.co=
m" target=3D"_blank">shoudil@qti.qualcomm.com</a>&gt;<br>
<br>
Missing SoB or &#39;<a href=3D"mailto:quaresma.jose@gmail.com" target=3D"_b=
lank">quaresma.jose@gmail.com</a>&#39;.<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></=
div></div></div>

--000000000000a308ff064911b7dc--

