Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D052CC54E5D
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 16:18:20 +0000 (UTC)
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
 by mx.groups.io with SMTP id smtpd.web10.278.1710605891117414916
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 09:18:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D6rl1DZD;
 spf=pass (domain: gmail.com, ip: 209.85.166.169, mailfrom: chris.chapuis@gmail.com)
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-366a0b53d94so5322575ab.1
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 09:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710605890; x=1711210690; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mdg21rX1fC3WQOe/EwdiVs+j1jkAGZIL6KL/lhjvMnQ=;
        b=D6rl1DZDUYNqZ3MK4eET/vdNMGnJ3R7lsmAMmUHGeidwMZvICxwM4YZa/M8FrFZT2F
         H8JvADiXidxIeRfwPpa67ylWt62iF8bh8sTHX8sRBLQivdA5VhoW4SHJqS8uHQtJW0e+
         ITA4W6Fkh7LEjetm19iXr2yQ856ptOrxGSqwR2za9JgnVSv3x/Y37cGJgU6vuAosQYO1
         2ItlbVpSgt2ml7GuoSKccwk9m/LcLnSa89BWQBGtvv9Ls5lfkwq9KYo0M7tXzWjEA8R4
         wqOjEaxTCcWjro2eSwgOIGvupsim/1DrnoB2vGkNXhdd1Zjqg2WZLWx6WKD/FSf6kBG4
         KklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710605890; x=1711210690;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mdg21rX1fC3WQOe/EwdiVs+j1jkAGZIL6KL/lhjvMnQ=;
        b=MPOsKg1USuCdNTpN6LCawB5tfzztdmEJ0ngNZVpG5AGUMJ9uTg2P3RQx3Bf7OIGoqY
         F1hUEJk4p5GYVU3xT0FDL00llQLAA+ROV/MMvsqbA65HuV5El75dgcELMGmJ2UwoTnfs
         FN1/pz1HqdQM5ixl6Z9oL/tjAh71NJyl/p8JuBs1SsfmkPmkO/1nhcoxsl6fVXgMZIPh
         Mq8g7X2X7EBfNZySn0DdW+F0qISZLgfZFK7W6l06hRz3pC+/V/xWz5wyMgUdsF4iDinO
         f9L/RnSYCkzyqTf6T9eCypH/HBPvjiaZEeoiu2/sUc3U+6f+DIcUfyAo1+QQ2pGNK/aY
         5orA==
X-Gm-Message-State: AOJu0YzTwm14M/MkY49rl9DBAxCzJU3rHXh1eWcBC34Hf5AucWcr024q
	ldqZR3oGup2na+yXhgCQDLCMFRHzEX0Y2h0sTwwfR4suLYR741Fn2WDUcnJh2e31STi4Q9NJuaG
	ol5q0ULv+PBCDLjyOMyDy6Dwq31k=
X-Google-Smtp-Source: AGHT+IGSbO13+NY8piWGhD26LJ067mq59MrlEG+dg0XD7C2ur8L8xw2CtvD5AsJ7fFhDcmz5Cv5zB9y1aBZkq7zWN0o=
X-Received: by 2002:a92:ce05:0:b0:366:7b23:763f with SMTP id
 b5-20020a92ce05000000b003667b23763fmr7367340ilo.9.1710605890116; Sat, 16 Mar
 2024 09:18:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-6-chris.chapuis@gmail.com> <CAMKF1sr8SzZsb9ZVuvEEDCDSqitWrQjDN+-iHjRcOO9i-_njuA@mail.gmail.com>
In-Reply-To: <CAMKF1sr8SzZsb9ZVuvEEDCDSqitWrQjDN+-iHjRcOO9i-_njuA@mail.gmail.com>
From: Christophe Chapuis <chris.chapuis@gmail.com>
Date: Sat, 16 Mar 2024 17:17:59 +0100
Message-ID: <CACA7eUSRiGS-seMoMha2Wjs-vg6UKh=FbAWp2mBiQCwK0Q7NSA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, Marek Vasut <marex@denx.de>, 
	Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="0000000000006e67d50613c97894"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 16:18:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109365

--0000000000006e67d50613c97894
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, it fixes exactly this issue.

On Sat, Mar 16, 2024 at 5:09=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote=
:

> does this fix
>
> https://errors.yoctoproject.org/Errors/Details/758522/
>
> On Sat, Mar 16, 2024 at 3:01=E2=80=AFAM Christophe Chapuis
> <chris.chapuis@gmail.com> wrote:
> >
> > When DRM is activated for LVGL, it adds a dependency on drm.h.
> > As for lvgl-demo-fb, add an include path to fix this usecase.
> >
> > Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> > ---
> >  meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> > index 8bd718efd..6a9a7411b 100644
> > --- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> > +++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> > @@ -21,6 +21,8 @@ inherit cmake
> >  EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=
=3DON"
> >  S =3D "${WORKDIR}/git"
> >
> > +TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
> > +
> >  ALLOW_EMPTY:${PN} =3D "1"
> >
> >  PACKAGECONFIG ??=3D "drm"
> > --
> > 2.44.0
> >
>

--0000000000006e67d50613c97894
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, it fixes exactly this issue.<br></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 16, 2024=
 at 5:09=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.=
khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">does this fix<br>
<br>
<a href=3D"https://errors.yoctoproject.org/Errors/Details/758522/" rel=3D"n=
oreferrer" target=3D"_blank">https://errors.yoctoproject.org/Errors/Details=
/758522/</a><br>
<br>
On Sat, Mar 16, 2024 at 3:01=E2=80=AFAM Christophe Chapuis<br>
&lt;<a href=3D"mailto:chris.chapuis@gmail.com" target=3D"_blank">chris.chap=
uis@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; When DRM is activated for LVGL, it adds a dependency on drm.h.<br>
&gt; As for lvgl-demo-fb, add an include path to fix this usecase.<br>
&gt;<br>
&gt; Signed-off-by: Christophe Chapuis &lt;<a href=3D"mailto:chris.chapuis@=
gmail.com" target=3D"_blank">chris.chapuis@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_9.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">lvgl_9.0.0.bb</a> | 2 ++<br>
&gt;=C2=A0 1 file changed, 2 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_9.0.=
0.bb" rel=3D"noreferrer" target=3D"_blank">lvgl_9.0.0.bb</a> b/meta-oe/reci=
pes-graphics/lvgl/<a href=3D"http://lvgl_9.0.0.bb" rel=3D"noreferrer" targe=
t=3D"_blank">lvgl_9.0.0.bb</a><br>
&gt; index 8bd718efd..6a9a7411b 100644<br>
&gt; --- a/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_9.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">lvgl_9.0.0.bb</a><br>
&gt; +++ b/meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_9.0.0.bb" r=
el=3D"noreferrer" target=3D"_blank">lvgl_9.0.0.bb</a><br>
&gt; @@ -21,6 +21,8 @@ inherit cmake<br>
&gt;=C2=A0 EXTRA_OECMAKE =3D &quot;-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_S=
HARED_LIBS=3DON&quot;<br>
&gt;=C2=A0 S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;<br>
&gt; +TARGET_CFLAGS +=3D &quot;-I${STAGING_INCDIR}/libdrm&quot;<br>
&gt; +<br>
&gt;=C2=A0 ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
&gt;<br>
&gt;=C2=A0 PACKAGECONFIG ??=3D &quot;drm&quot;<br>
&gt; --<br>
&gt; 2.44.0<br>
&gt;<br>
</blockquote></div>

--0000000000006e67d50613c97894--

