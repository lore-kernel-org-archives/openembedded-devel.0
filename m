Return-Path: <chris.chapuis@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B467EC48BF6
	for <webhook@archiver.kernel.org>; Sat, 16 Mar 2024 21:55:22 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web10.6900.1710626121703724745
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 16 Mar 2024 14:55:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lTm6OacD;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: chris.chapuis@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-366aee15850so4303365ab.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 14:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710626121; x=1711230921; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtsDO5eLRNxLmxt/+RxLtONWPk8lb/L25+fKaIPBnyo=;
        b=lTm6OacDww1zN9lLnmYbNl1C7XB/4AYYkOJRNcWX640L5RNLtRUFfdIXcAGFxMQNbV
         pZEwRIv3vJEHBWRWcb0yW0N2FAwZ833KIAgANaMY2D01/swWumMocxOnywwl/PpiifSe
         nipLt8oNNrhtVx8gsNPbZLuGQXVDz7jXeUp3G4CKto3iMxiv776ObvTahsvqUIrwvIwZ
         ohlsyImX6EBdmCKbhwXAw8FvcW/daYerq/D9oFZIbq5lXSg7TGb2C0QzRnbgRsmk5Lkm
         JNrH41b8OU2I5twqPBcpfohMKQfv9k7Uv3OW0oZ1SIN1i2UGaDvJilFXnCrrpRI+/QVW
         jS7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710626121; x=1711230921;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZtsDO5eLRNxLmxt/+RxLtONWPk8lb/L25+fKaIPBnyo=;
        b=E69akZIzhBidl/yvNb5Es1V7Zf2bWugNF4ioNvrTnwfhB8nHi1hJkz4gdKVS2jb96h
         LuS55MMnNOUHqSGNpa7tSqL5H+k/XRMSlU2RzqvVXZU/vHnnRaObkcZ9xE/lriR7a2Lp
         TLHI+N5byoGJo1pMasrB9DO8qLD/cPGyvyOqHmZP3Fza63vDqAJ249OJZc53fu/5Ov+s
         y+SJUjYWPXZVlg4G1hndS/3afgyaP35XJ/MoI0KV2YOkX0oeaqUz2As0CxtZeTZZcCXa
         SoK3cGQgiYi75igXADD9vq6fUbG3lNmVsuE61qv9x1e92PgJyx7xm+RCCKAzOwZZzR1j
         jF7w==
X-Gm-Message-State: AOJu0YxyGm5czs0IStSSHrlDJs6mcy+n0MJ2Pjj+hvWzOa+dvKkRCNMO
	zDsYlxo4USgq2eQhfyXPXhBbSMg/1AixK1GQM7Ao5DxDQFHPNMf4GTN82AV+KUvI98ZPhjwBJgu
	S1H0zo5nFe7uycFgyyJDmdFG2Uow=
X-Google-Smtp-Source: AGHT+IHt+lSrrsacfz06V2RhfDYquryfNnAUE5PavF07aH3RdrlbjfU0Izs7B1iJxs5i1fXt0jfE3oe74cbXZ7qHfyY=
X-Received: by 2002:a05:6e02:c71:b0:366:b599:c1a6 with SMTP id
 f17-20020a056e020c7100b00366b599c1a6mr1597387ilj.11.1710626120654; Sat, 16
 Mar 2024 14:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20240316100056.409758-1-chris.chapuis@gmail.com>
 <20240316100056.409758-6-chris.chapuis@gmail.com> <6a591af2-3a00-468d-b9d7-1ff0368b5065@denx.de>
In-Reply-To: <6a591af2-3a00-468d-b9d7-1ff0368b5065@denx.de>
From: Christophe Chapuis <chris.chapuis@gmail.com>
Date: Sat, 16 Mar 2024 22:55:09 +0100
Message-ID: <CACA7eUS-t+wCoW2Pv8P4CFAhp3LzZnRNU7ytQAGN7=xuTwmAxg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH v4 6/7] lvgl: fix libdrm include
To: Marek Vasut <marex@denx.de>
Cc: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>, 
	Fabio Estevam <festevam@denx.de>
Content-Type: multipart/alternative; boundary="00000000000043ea1a0613ce2eea"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 16 Mar 2024 21:55:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109375

--00000000000043ea1a0613ce2eea
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

It could be conditional eventually; I just took the line from lvgl-demo-fb,
where it wasn't.

Ideally, both should be moved in lv-conf.inc, where the lvgl drm setting is
activated. But I didn't want to expand again the scope of this patchset,
initially focused simply on adding some variables to lv-conf.inc.

On Sat, Mar 16, 2024 at 10:08=E2=80=AFPM Marek Vasut <marex@denx.de> wrote:

> On 3/16/24 11:00 AM, Christophe Chapuis wrote:
> > When DRM is activated for LVGL, it adds a dependency on drm.h.
> > As for lvgl-demo-fb, add an include path to fix this usecase.
> >
> > Signed-off-by: Christophe Chapuis <chris.chapuis@gmail.com>
> > ---
> >   meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> > index 8bd718efd..6a9a7411b 100644
> > --- a/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> > +++ b/meta-oe/recipes-graphics/lvgl/lvgl_9.0.0.bb
> > @@ -21,6 +21,8 @@ inherit cmake
> >   EXTRA_OECMAKE =3D "-DLIB_INSTALL_DIR=3D${baselib} -DBUILD_SHARED_LIBS=
=3DON"
> >   S =3D "${WORKDIR}/git"
> >
> > +TARGET_CFLAGS +=3D "-I${STAGING_INCDIR}/libdrm"
>
> Shouldn't this be conditional only if PACKAGECONFIG contains 'drm' ?
>

--00000000000043ea1a0613ce2eea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>It could be conditional eventually; I just took the l=
ine from lvgl-demo-fb, where it wasn&#39;t.</div><div><br></div><div>Ideall=
y, both should be moved in lv-conf.inc, where the lvgl drm setting is activ=
ated. But I didn&#39;t want to expand again the scope of this patchset, ini=
tially focused simply on adding some variables to lv-conf.inc.<br></div></d=
iv><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On =
Sat, Mar 16, 2024 at 10:08=E2=80=AFPM Marek Vasut &lt;<a href=3D"mailto:mar=
ex@denx.de">marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On 3/16/24 11:00 AM, Christophe Chapuis wrote:<br>
&gt; When DRM is activated for LVGL, it adds a dependency on drm.h.<br>
&gt; As for lvgl-demo-fb, add an include path to fix this usecase.<br>
&gt; <br>
&gt; Signed-off-by: Christophe Chapuis &lt;<a href=3D"mailto:chris.chapuis@=
gmail.com" target=3D"_blank">chris.chapuis@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-graphics/lvgl/<a href=3D"http://lvgl_9.0.0=
.bb" rel=3D"noreferrer" target=3D"_blank">lvgl_9.0.0.bb</a> | 2 ++<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+)<br>
&gt; <br>
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
&gt;=C2=A0 =C2=A0EXTRA_OECMAKE =3D &quot;-DLIB_INSTALL_DIR=3D${baselib} -DB=
UILD_SHARED_LIBS=3DON&quot;<br>
&gt;=C2=A0 =C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +TARGET_CFLAGS +=3D &quot;-I${STAGING_INCDIR}/libdrm&quot;<br>
<br>
Shouldn&#39;t this be conditional only if PACKAGECONFIG contains &#39;drm&#=
39; ?<br>
</blockquote></div>

--00000000000043ea1a0613ce2eea--

