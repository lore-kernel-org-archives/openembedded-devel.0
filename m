Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F5BC4828D
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 20:24:50 +0000 (UTC)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com [209.85.219.175])
 by mx.groups.io with SMTP id smtpd.web10.4606.1707164682485377628
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 12:24:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S8RXdJzt;
 spf=pass (domain: gmail.com, ip: 209.85.219.175, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-dc6d5206e96so4414077276.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 12:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707164681; x=1707769481; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ggc/ifd4MlHBjlAvxXuTgASjHxKmK5IMJIg+QjsBR4g=;
        b=S8RXdJztqwmktt1I82CkNtfbNGGVbd4g0oME6JDC2FRR6xIlsvt2a4u/qRkXGy0R4Y
         70pyUIc0j1yCzVQanmW0WP39SJ/RY27UDZYpTX2CbYJEwWmlms6yqysO8Rd4pNa1M8+m
         DjGg2U1kCd2Q9bQcX3+b5vJEzM+pQ7ZDUfb3mF9vVxpz2bztf+O4LKjjwIRLujuzkD0y
         W5YElMB9dBDu1kyHW7TwN/qXF5YWb449ZKk/3BOW+80d/jSjbCxXovRKnTsOCAMd9atG
         3/CtkXenLOcNDQWzVz7DekpHk1T5KXdsbnMtIjXdHD0l4UuEqQj6199qh+5+gpDJ7EcB
         pN8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707164681; x=1707769481;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ggc/ifd4MlHBjlAvxXuTgASjHxKmK5IMJIg+QjsBR4g=;
        b=Qg7mohXouszzqpDLBSNR4gHvbGNLFcgpOQZglll46/96xf3cpo65lVVZzZUuvl2uIt
         hEAajd3+OrLlG2mNSpfPu93eMsBYYUAbW7TNvIr2jzUAVySCl9ymPolPN5qMzJRuJdab
         cFP4lxNF80O/XUY9eguj8GIsks6MR7JbZ1gBp5LlINTr746YzLF7lhtHmNuqKGHB1PBm
         AvXIuUcFCPe/HxJK8wCjmKxejdHNax1Q66I2ArQPFHX9/ANQI1VUXhq6c5k8xFoTDInn
         m4R5g1HORhPpRSutnuU4ou9NbCbpzxtB5LWvbeppeOAWq63gF+nahSjb4Kva/v0KU3/J
         eAKA==
X-Gm-Message-State: AOJu0YzurWezeCpIyNGazEClhHljXVWXCBwdWTbjpgFEPUjvbtFK9ymQ
	JBSlaH6BcyJTMIN9/WBArcqhG+9WYczDR0aq/bSOFBSB8vOYe7961qFoOsxCA/EyDdU/0Z+WAJs
	amZYZm0e2uJG1vQCwQpz9oHzidNE=
X-Google-Smtp-Source: AGHT+IHlMLiEUVdOuOT6nCwGamkOdP5urVHObHwEyJfx+ffzJIZ6FQmwAPzoW8FTSjdCCkVYOJ/XtX02hYemQNfLDq0=
X-Received: by 2002:a5b:708:0:b0:dc7:12d:9a02 with SMTP id g8-20020a5b0708000000b00dc7012d9a02mr464012ybq.60.1707164681542;
 Mon, 05 Feb 2024 12:24:41 -0800 (PST)
MIME-Version: 1.0
References: <20240205125829.152301-1-dev@g0hl1n.net> <CANx9H-DF58NnD=2qWRsOCJENTy2H4700Ba1+TZMukrxB=woJFA@mail.gmail.com>
 <CAMKF1sqH8CHESnv+0XCMP-mui46OiVZ3ADbViEb7Mc6=twU5Jg@mail.gmail.com> <rt64rs5xzeqckjnw32bje2jcilxzxhn5ijxkwxklrg2tb35itz@5izrmc6blxcd>
In-Reply-To: <rt64rs5xzeqckjnw32bje2jcilxzxhn5ijxkwxklrg2tb35itz@5izrmc6blxcd>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 5 Feb 2024 12:24:30 -0800
Message-ID: <CANx9H-ChQxFaF24cXp9qxRi7h1ux4Rt093NzG5j_wJAuB=+_EA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/5] Add python3-httpx support
To: Richard Leitner <dev@g0hl1n.net>
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006aa28e0610a8406a"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 20:24:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108579

--0000000000006aa28e0610a8406a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 12:06=E2=80=AFPM Richard Leitner <dev@g0hl1n.net> wr=
ote:

> Hi Tim, Hi Khem,
>
> thanks for your feedback!
>
> On Mon, Feb 05, 2024 at 09:44:28AM -0800, Khem Raj wrote:
> > On Mon, Feb 5, 2024 at 7:55=E2=80=AFAM Tim Orling <ticotimo@gmail.com> =
wrote:
> > >
> > >
> > >
> > > On Mon, Feb 5, 2024 at 4:58=E2=80=AFAM Richard Leitner via
> lists.openembedded.org <dev=3Dg0hl1n.net@lists.openembedded.org> wrote:
> > >>
> > >> This series adds support for python3-httpx and its dependencies.
> > >>
> > >
> > > Can you look into adding ptest also for these new packages? It doesn'=
t
> necessarily block adding them, but we don't want to keep piling on
> technical debt of more recipes without ptest.
> >
> > I think this is a good idea. We run ptests for meta-python regularly
> > as acceptance and do find issues these days. So adding ptest would
> > be good here, perhaps for meta-python it could be made a needed thing
> > for new recipes.
>
> Sure. I will add them. Basically I totally agree on adding tests wherever
> possible. So from my side making them a requirement (unless there is a
> really good reason against) would be a good thing.
>
> Should I send a v2 or a separate series for that?
>
If it turns out to be "straight forward" a v2 is good. but if you get
bogged down maybe let us know and khem can just merge as is.


>
> As we are talking about "defaults" for python recipes. What is the
> "policy" for native and nativesdk? Is there any? Or should they be just
> added based on user needs/gut feeling?
>

The trick is that many folks were just adding BBCLASSEXTENDS =3D "native
nativesdk" blindly without ever verifying that those things build.
So, if you verify that all your recipes build, you can add it. But if any
recipes you depend on do not currently build with "native" or "nativesdk"
then you would need to go make all of those also work.

For those that don't know: "bitbake -c populate_sdk python3-<foo>" is the
syntax to build the nativesdk-python3-<foo> recipe and
"bitbake python3-<foo>-native" is the syntax to build the native version.
If either of those has missing dependencies, then you either
need to fix all the dependent recipes or do not send a patch with it
enabled.

>
> regards;rl
>
> >
> > >
> > >>
> > >> Richard Leitner (5):
> > >>   python3-socksio: add recipe for v1.0.0
> > >>   python3-anyio: add recipe for v4.2.0
> > >>   python3-sniffio: add recipe for v1.3.0
> > >>   python3-httpcore: add recipe for v1.0.2
> > >>   python3-httpx: add recipe for v0.26.0
> > >>
> > >>  .../python/python3-anyio_4.2.0.bb             | 23 ++++++++++
> > >>  .../python/python3-httpcore_1.0.2.bb          | 26 +++++++++++
> > >>  .../python/python3-httpx_0.26.0.bb            | 44
> +++++++++++++++++++
> > >>  .../python/python3-sniffio_1.3.0.bb           | 12 +++++
> > >>  .../0001-Unpin-flit-core-dependency.patch     | 21 +++++++++
> > >>  .../python/python3-socksio_1.0.0.bb           | 10 +++++
> > >>  6 files changed, 136 insertions(+)
> > >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-anyio_4.2.0.bb
> > >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-httpcore_1.0.2.bb
> > >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-httpx_0.26.0.bb
> > >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-sniffio_1.3.0.bb
> > >>  create mode 100644
> meta-python/recipes-devtools/python/python3-socksio/0001-Unpin-flit-core-=
dependency.patch
> > >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-socksio_1.0.0.bb
> > >>
> > >> --
> > >> 2.40.1
> > >>
> > >>
> > >>
> > >>
>

--0000000000006aa28e0610a8406a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 5, 2024 at 12:06=E2=80=AF=
PM Richard Leitner &lt;<a href=3D"mailto:dev@g0hl1n.net">dev@g0hl1n.net</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi T=
im, Hi Khem,<br>
<br>
thanks for your feedback!<br>
<br>
On Mon, Feb 05, 2024 at 09:44:28AM -0800, Khem Raj wrote:<br>
&gt; On Mon, Feb 5, 2024 at 7:55=E2=80=AFAM Tim Orling &lt;<a href=3D"mailt=
o:ticotimo@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<b=
r>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; On Mon, Feb 5, 2024 at 4:58=E2=80=AFAM Richard Leitner via <a hre=
f=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">li=
sts.openembedded.org</a> &lt;dev=3D<a href=3D"mailto:g0hl1n.net@lists.opene=
mbedded.org" target=3D"_blank">g0hl1n.net@lists.openembedded.org</a>&gt; wr=
ote:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; This series adds support for python3-httpx and its dependenci=
es.<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Can you look into adding ptest also for these new packages? It do=
esn&#39;t necessarily block adding them, but we don&#39;t want to keep pili=
ng on technical debt of more recipes without ptest.<br>
&gt; <br>
&gt; I think this is a good idea. We run ptests for meta-python regularly<b=
r>
&gt; as acceptance and do find issues these days. So adding ptest would<br>
&gt; be good here, perhaps for meta-python it could be made a needed thing<=
br>
&gt; for new recipes.<br>
<br>
Sure. I will add them. Basically I totally agree on adding tests wherever<b=
r>
possible. So from my side making them a requirement (unless there is a<br>
really good reason against) would be a good thing.<br>
<br>
Should I send a v2 or a separate series for that?<br></blockquote><div>If i=
t turns out to be &quot;straight forward&quot; a v2 is good. but if you get=
 bogged down maybe let us know and khem can just merge as is.</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
As we are talking about &quot;defaults&quot; for python recipes. What is th=
e<br>
&quot;policy&quot; for native and nativesdk? Is there any? Or should they b=
e just<br>
added based on user needs/gut feeling?<br></blockquote><div><br></div><div>=
The trick is that many folks were just adding BBCLASSEXTENDS =3D &quot;nati=
ve nativesdk&quot; blindly without ever verifying that those things build.<=
/div><div>So, if you verify that all your recipes build, you can add it. Bu=
t if any recipes you depend on do not currently build with &quot;native&quo=
t; or &quot;nativesdk&quot;</div><div>then you would need to go make all of=
 those also work.</div><div><br></div><div>For those that don&#39;t know: &=
quot;bitbake -c populate_sdk python3-&lt;foo&gt;&quot; is the syntax to bui=
ld the nativesdk-python3-&lt;foo&gt; recipe and</div><div>&quot;bitbake pyt=
hon3-&lt;foo&gt;-native&quot; is the syntax to build the native version. If=
 either of those has missing dependencies, then you either</div><div>need t=
o fix all the dependent recipes or do not send a patch with it enabled.=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
regards;rl<br>
<br>
&gt; <br>
&gt; &gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Richard Leitner (5):<br>
&gt; &gt;&gt;=C2=A0 =C2=A0python3-socksio: add recipe for v1.0.0<br>
&gt; &gt;&gt;=C2=A0 =C2=A0python3-anyio: add recipe for v4.2.0<br>
&gt; &gt;&gt;=C2=A0 =C2=A0python3-sniffio: add recipe for v1.3.0<br>
&gt; &gt;&gt;=C2=A0 =C2=A0python3-httpcore: add recipe for v1.0.2<br>
&gt; &gt;&gt;=C2=A0 =C2=A0python3-httpx: add recipe for v0.26.0<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-anyio_4.2.0.bb" re=
l=3D"noreferrer" target=3D"_blank">python3-anyio_4.2.0.bb</a>=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++++++<br>
&gt; &gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-httpcore_1.0.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-httpcore_1.0.2.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 26 +++++++++++<br>
&gt; &gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-httpx_0.26.0.bb" r=
el=3D"noreferrer" target=3D"_blank">python3-httpx_0.26.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 44 +++++++++++++++++++<br>
&gt; &gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-sniffio_1.3.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-sniffio_1.3.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++<br>
&gt; &gt;&gt;=C2=A0 .../0001-Unpin-flit-core-dependency.patch=C2=A0 =C2=A0 =
=C2=A0| 21 +++++++++<br>
&gt; &gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-socksio_1.0.0.bb" =
rel=3D"noreferrer" target=3D"_blank">python3-socksio_1.0.0.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++<br>
&gt; &gt;&gt;=C2=A0 6 files changed, 136 insertions(+)<br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/=
<a href=3D"http://python3-anyio_4.2.0.bb" rel=3D"noreferrer" target=3D"_bla=
nk">python3-anyio_4.2.0.bb</a><br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/=
<a href=3D"http://python3-httpcore_1.0.2.bb" rel=3D"noreferrer" target=3D"_=
blank">python3-httpcore_1.0.2.bb</a><br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/=
<a href=3D"http://python3-httpx_0.26.0.bb" rel=3D"noreferrer" target=3D"_bl=
ank">python3-httpx_0.26.0.bb</a><br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/=
<a href=3D"http://python3-sniffio_1.3.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-sniffio_1.3.0.bb</a><br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/=
python3-socksio/0001-Unpin-flit-core-dependency.patch<br>
&gt; &gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/=
<a href=3D"http://python3-socksio_1.0.0.bb" rel=3D"noreferrer" target=3D"_b=
lank">python3-socksio_1.0.0.bb</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; 2.40.1<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
</blockquote></div></div>

--0000000000006aa28e0610a8406a--

