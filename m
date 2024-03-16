Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5F19C54E60
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 16:31:00 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.web11.579.1710606658413977989
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 09:30:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FWC0haVa;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-221822a7dc7so1753891fac.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 09:30:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710606657; x=1711211457; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lx3o08qHSm8ubloKWHdbE2i988I3EGIvdcBCAxydhcM=;
        b=FWC0haVaztbR9Rhb7wbmAIwtedMH48B9zocSr0WVRG52wtuFO3f+GTIWzHgmmH73Sv
         IIFTgMKf/XseJ3K34FC4CV8xibVMNS4iYVvl7uewxpqIn43D7LYkjonQGwVKrFj21Tce
         3PIQ61gr4Pfdzmzd2wxwDQ5VhvbQB5+QEQZJvhPp0N7OThcX6hQt6twJWvJ66v/h67G8
         MmLrQKi48Hkt0/1Yr8C5k0owxW4aHiBNwLFo3AF/0aKQisrv1y05TANpztSo32N8VlNq
         mUxfWF1dHrDNqJaROqpBYA7uMDIsfeOmghnM+6dtskvjlIt5bnXyYNvbi/LtKdcygM7o
         PM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710606657; x=1711211457;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lx3o08qHSm8ubloKWHdbE2i988I3EGIvdcBCAxydhcM=;
        b=IgmUYsZblr/lG6waBBRTcZDX7U24CtAMQHIByn2y0hEOBomLyMCWNonvc9W7LPp0rf
         KIwAZpxy27l8kKHF1Eok28yDQHwIiXsImRAfSC1Jvtz2j6giZVcgxv7UMpL1R+RWbjbo
         dWcTcx2tyLVQJPuKg98O4swWoadRNaLDHQDMWiudHo9T1+fsaNsMK34IUI4WOkvn8YuH
         f6n7J/KVKJA6O7P/aWU+K6VmNFKZUKMJzgw4lFDb1tGw3QXs07OOWWgGZkSPOXGTijXo
         uoauydmSvJwpsi5Zs6+Ovb9SjT0bRbPbvH6laWU1BX/vjSVaWfTS2OqVaj7CniPGePY9
         WMHA==
X-Forwarded-Encrypted: i=1; AJvYcCVN6tc4gEzKfhmA8i78E/182qEBoo+HdZjbjPQZJR86/cEPL+Hj+DY1F9k1bpbqYxUuOhoO7zZ8XGUloBoiRbayaxhWvhDxCCBEE8p+z2qoyPrWt4L595BaDA==
X-Gm-Message-State: AOJu0YyrMDnxs5F3lKuzrmfZS75NPSMqdAZsLPKpTa4yE6Knq3QN/7Re
	JvDMAbCVEerQlKIYhCRnR3SNzonJMytl/1AzY7TmqBF8wsrPf4HlXAWC9mAjx9aFY5f0mnMj/o0
	+g5wGyFxgu8McJa8ZHmN9wsf1iHE=
X-Google-Smtp-Source: AGHT+IHVL0/nSfxqGb8dXVVUfHgeFwgacD22Ss6YeMIxHNSi0ppYR6sIy4EVhAOMu+6N2sTW0AvYE2tzYxKsKpdY7ac=
X-Received: by 2002:a05:6870:64a0:b0:21e:854d:e846 with SMTP id
 cz32-20020a05687064a000b0021e854de846mr8669597oab.30.1710606657621; Sat, 16
 Mar 2024 09:30:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-6-chris.chapuis@gmail.com> <CAMKF1sr8SzZsb9ZVuvEEDCDSqitWrQjDN+-iHjRcOO9i-_njuA@mail.gmail.com>
 <CACA7eUSRiGS-seMoMha2Wjs-vg6UKh=FbAWp2mBiQCwK0Q7NSA@mail.gmail.com>
In-Reply-To: <CACA7eUSRiGS-seMoMha2Wjs-vg6UKh=FbAWp2mBiQCwK0Q7NSA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 16 Mar 2024 09:30:46 -0700
Message-ID: <CAMKF1sr+cuO=mjCsm4mi0mif=qVNHV_KQLDGYnVm36zP_DaAdg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
To: Christophe Chapuis <chris.chapuis@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, Marek Vasut <marex@denx.de>, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002d960a0613c9a682"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 16:31:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109366

--0000000000002d960a0613c9a682
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok thx

On Sat, Mar 16, 2024 at 9:18=E2=80=AFAM Christophe Chapuis <chris.chapuis@g=
mail.com>
wrote:

> Yes, it fixes exactly this issue.
>
> On Sat, Mar 16, 2024 at 5:09=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wro=
te:
>
>> does this fix
>>
>> https://errors.yoctoproject.org/Errors/Details/758522/
>>
>> On Sat, Mar 16, 2024 at 3:01=E2=80=AFAM Christophe Chapuis
>> <chris.chapuis@gmail.com> wrote:
>> >
>> > When DRM is activated for LVGL, it adds a dependency on drm.h.
>> > As for lvgl-demo-fb, add an include path to fix this usecase.
>> >
>> > Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
>> > ---
>> >  meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 2 ++
>> >  1 file changed, 2 insertions(+)
>> >
>> > diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
>> b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
>> > index 8bd718efd..6a9a7411b 100644
>> > --- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
>> > +++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
>> > @@ -21,6 +21,8 @@ inherit cmake
>> >  EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=
=3DON"
>> >  S =3D "${WORKDIR}/git"
>> >
>> > +TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
>> > +
>> >  ALLOW_EMPTY:${PN} =3D "1"
>> >
>> >  PACKAGECONFIG ??=3D "drm"
>> > --
>> > 2.44.0
>> >
>>
>

--0000000000002d960a0613c9a682
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Ok thx</div><div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Mar 16, 2024 at 9:18=E2=80=AFAM Chris=
tophe Chapuis &lt;<a href=3D"mailto:chris.chapuis@gmail.com">chris.chapuis@=
gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr">Yes, it fixes exactly this issue.<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 16, 2024 at 5:09=
=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_b=
lank">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">does this fix<br>
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
</blockquote></div></div>

--0000000000002d960a0613c9a682--

