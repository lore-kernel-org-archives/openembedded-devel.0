Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE580C28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 14:15:39 +0000 (UTC)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
 by mx.groups.io with SMTP id smtpd.web10.38094.1741788934659967996
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Mar 2025 07:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cpNWCctx;
 spf=pass (domain: gmail.com, ip: 209.85.219.178, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e637669ef11so3223378276.1
        for <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 07:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741788934; x=1742393734; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jvvqOljs3y5E/7CmUDbeaHhDVxc/jjcnZWwdaVT/Ssw=;
        b=cpNWCctxJYGl49klyfJi/QbnKyB3ubVvabKNouffkNf2SkXfMKUSXoz1EXW9FS8HvE
         RzE84PUH6194L3VuoIcZ2IcUB8+yEnIzAQzB8W8KtM4KKrbxqQa6VyBCikKE59oGIVO9
         Ln4NvuPf8QH8fi26AoYO6vsx7mCBPM2XgSAytTnxL8UiMEO3X/gCWqzkylzYAO7650EI
         WmHWBQJw1YI9YKn/AKoCnf7Ama4Ewx4RqiMBHkXwxi8KhHFlMFHife4gTXn4+nM0L/0h
         xnQI5Vua2KAxhlOz2YQqqOSWLCaVeDtRKfEW7hjY/TQCc9G8yVtL8oNKS+SBkS6lkRhg
         LamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741788934; x=1742393734;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvvqOljs3y5E/7CmUDbeaHhDVxc/jjcnZWwdaVT/Ssw=;
        b=iqfX+aVFb3SPopj4Gifm2cW3G94/SZowJDb8/zve5fLFUdjpvgkOBmO4IROR88kMkA
         3TFpKyddnvjaCqjOnp9pB76nQ6Yo297NSCqDqbyFHuvPlX69RK7QNTQ8YC3264YjPqz9
         rCd5/rzJz+tI2Y4pOFb/s6INGqN0IwFsGxiJRt3Gi6l99aCBYcd0qKX0FPbbufELG0US
         6K30Q2B+zO+t6uk8ePPQYtI1YU/72bs0wOLkhYL4rCuKxngTjsL6fAAVNNAaSVvuBWYe
         G14zo+0CevOZMDPVjBroSfJS1Hv3fMNMxXckorkgzGB03jnTjI9uBde5Ip5rbBeBtkkD
         9iPw==
X-Gm-Message-State: AOJu0YwQ61ZqYHN8CzGX7LxyXftDDEXm3bEDOY9x4i5V1xk8uK+QuEJa
	VJhJB2BY33dFwJQ7zcnkHW5fJYYjwnjgpwhIBIMVh77zsUXVROnyrpdLtL53Aa8hKfZte8aDr/Y
	+UYKA+fwGZUiEXDXevQJB77Yd5vM=
X-Gm-Gg: ASbGncv5i4+n0QvIOOgTQlMEL/K1Mr0j50+b3Utvf0E0lHD4bIdIrpuP1kMR9qZgZXx
	AC0sdmzWoqwQSJ8NbpPqTjg6fSqGLhRd7ib//wrO6b7ua4DUB1o4Wp9zuknYKGu5o/ZUZOuATVt
	jlqoi6T4032Ll1rQ5dW+inOm3SMBg=
X-Google-Smtp-Source: AGHT+IEMGEPai1DwdWRjnczCGTppTUWJ4laZaP1kOfuoqH7qy3ev3/H4r5wDsXwFFxj9GViFNoY/4JLp3xO2ietE1Us=
X-Received: by 2002:a05:6902:260d:b0:e63:4a36:4332 with SMTP id
 3f1490d57ef6-e635c144d77mr25242020276.14.1741788933521; Wed, 12 Mar 2025
 07:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
 <c2743189-6b3d-4adc-b495-ff3d89ed4844@gmail.com>
In-Reply-To: <c2743189-6b3d-4adc-b495-ff3d89ed4844@gmail.com>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Wed, 12 Mar 2025 10:15:22 -0400
X-Gm-Features: AQ5f1JqtBIOcCIf-wGhek4ldO-mHX2X2KC6j6dVd2GW-Rc7kyHSML6yZwM6HAsM
Message-ID: <CAGAhMBxWJL=P20pcc4LS=Hzd6pSumjYV3Ma_7-zeTRJSbY08vQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] python3-scipy
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a80860063025d674"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Mar 2025 14:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115926

--000000000000a80860063025d674
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That works for me.

The meta-ros has an optional dependency on meta-scipy at the moment.  Would
you be okay with me changing it to point users to your layer instead?

Regards,
Rob

On Mon, Mar 10, 2025, 2:07 a.m. B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n <zbo=
szor@gmail.com>
wrote:

> 2025. 03. 06. 21:07 keltez=C3=A9ssel, Rob Woolley via lists.openembedded.=
org
> =C3=ADrta:
> > The meta-scipy layer was archived on Nov 30, 2023
> > (https://github.com/tuxable-ltd/meta-scipy)
> >
> > I need python3-scipy for some recipes in ROS 2 (notably pinocchio), so =
I
> patched it up
> > and got it building again: https://github.com/robwoolley/meta-scipy
>
> I have merged meta-scipy and meta-scikit-learn which were both archived.
> https://github.com/zboszor/meta-python-ai/
>
> It has a newer scipy version than meta-scipy ever had.
>
> The complete layer is not updated for walnascar yet
> (I am postponing updating the pytorch recipe), but
> python3-scipy and many others can be built from main.
>
> The styhead branch may be usable.
>
>

--000000000000a80860063025d674
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">That works for me.</p>
<p dir=3D"ltr">The meta-ros has an optional dependency on meta-scipy at the=
 moment.=C2=A0 Would you be okay with me changing it to point users to your=
 layer instead?</p>
<p dir=3D"ltr">Regards,<br>
Rob</p>
<br><div class=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Mar 10, 2025, 2:07 a.m. B=C3=B6sz=C3=B6rm=C3=A9nyi =
Zolt=C3=A1n &lt;<a href=3D"mailto:zboszor@gmail.com">zboszor@gmail.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex">2025. 03. 06. 21:07 kelt=
ez=C3=A9ssel, Rob Woolley via <a href=3D"http://lists.openembedded.org" rel=
=3D"noreferrer noreferrer" target=3D"_blank">lists.openembedded.org</a> =C3=
=ADrta:<br>
&gt; The meta-scipy layer was archived on Nov 30, 2023 <br>
&gt; (<a href=3D"https://github.com/tuxable-ltd/meta-scipy" rel=3D"noreferr=
er noreferrer" target=3D"_blank">https://github.com/tuxable-ltd/meta-scipy<=
/a>)<br>
&gt;<br>
&gt; I need python3-scipy for some recipes in ROS 2 (notably pinocchio), so=
 I patched it up <br>
&gt; and got it building again: <a href=3D"https://github.com/robwoolley/me=
ta-scipy" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/robwoolley/meta-scipy</a><br>
<br>
I have merged meta-scipy and meta-scikit-learn which were both archived.<br=
>
<a href=3D"https://github.com/zboszor/meta-python-ai/" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://github.com/zboszor/meta-python-ai/</a><=
br>
<br>
It has a newer scipy version than meta-scipy ever had.<br>
<br>
The complete layer is not updated for walnascar yet<br>
(I am postponing updating the pytorch recipe), but<br>
python3-scipy and many others can be built from main.<br>
<br>
The styhead branch may be usable.<br>
<br>
</blockquote></div>

--000000000000a80860063025d674--

