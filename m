Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 828D6C5478C
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 16:50:05 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
 by mx.groups.io with SMTP id smtpd.web11.28500.1709311802049246578
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 08:50:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nEKFlmuh;
 spf=pass (domain: gmail.com, ip: 209.85.210.41, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6e49833ccdfso1003809a34.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 08:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709311801; x=1709916601; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2cwng0X01POSUalV8J6ZQve7/RVy/KIxTVgdF1f+SpE=;
        b=nEKFlmuh0+xrOnleUNysOJSuc9Xkl0CElWSU9kxuuEMybSsLEeow8Z+qwZJtnLWusH
         JeIHNJZv8UKzLnJb/Hjc+tr3yXkpzRAWhi0JPfflisoxUgWTJ5XgMF7zncppK1cflEuQ
         1wOsDa3n3hhFkO5HF4OvDPoZ9bzu1VK0t0SBW24tkStL/rxt4unhzdEKozw1uWzxtt+A
         UBUOGpE6Eygw50gtgq197HLJNmwMzI/vvoamE71qyVQzwjGLbK1wtHIOw1BepKRgPLK+
         pwKLZJM1sHJx7pkcLqYHuUsc1hQUSMDwjaYbOxxHVuoTh7duhRcCHXDh3SuYJtnY6BxZ
         vqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709311801; x=1709916601;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cwng0X01POSUalV8J6ZQve7/RVy/KIxTVgdF1f+SpE=;
        b=hJ6qc+dVZp8Q1KN1CoL9fp3nGQW1CMjXvZbGpS7GAWlQGu7g71qO9Xwz1o48ReBmtp
         mSORnQZ+/JeQxZ/z9VtxEeMgC+x3yG51MBYh7bNs7gbjyUoZN+DT8e6qEBFLunBVqZ9y
         /T0HGgpuNbfJXx/rYTqEPX8D+gBl3FAx1en17hpIfeBqYxsRiXvmfiBM1CJ44MyK2kcb
         WGUoJWNxiNTB9EqSNLXIMUqR/QssrVgTudMRJ2kN+tLxyYgzAduwCtG4X6/zJ9Vte2pI
         Pb2OItY6G2Wrt/QHWtVyK/ItbTaFNly7i1/6eCmwy4HVG8SwEhIebe+DIWi1XHE/YgZp
         xSuA==
X-Gm-Message-State: AOJu0Ywd3jV7Jiy3ATpMswEBkerb/3FiBhHKYbfbV8hjUtYl7gjOEOBC
	UHTuJfiHatK0FZX4gEccvlSX2F70Ar7VrI05yEVnUKYPWzNkc5YELdVe3bzbiwB8/v7sXLWBN1y
	yv9842etJ865LFQ8+59YyQOwYEBQ=
X-Google-Smtp-Source: AGHT+IHNmfErrbilJ3rEjemjEysJDnd8rcqXG9lpKeocrpGA2igp08Rveb6/SP766av/Wgfx1QLIlLV2t1WOsvHh8qw=
X-Received: by 2002:a05:6871:818b:b0:220:be60:b6fc with SMTP id
 so11-20020a056871818b00b00220be60b6fcmr1940317oab.25.1709311801237; Fri, 01
 Mar 2024 08:50:01 -0800 (PST)
MIME-Version: 1.0
References: <20240222205827.2813212-1-raj.khem@gmail.com> <CA+chaQfOOMdDvQE1Q+7qMBdb37A3UUins90d+=hUy7OVYT60Xw@mail.gmail.com>
 <CA+chaQdtcOvfmXtPM2W2ZeVo1XtvUtNC_b4m78b7krrQedZaLQ@mail.gmail.com>
In-Reply-To: <CA+chaQdtcOvfmXtPM2W2ZeVo1XtvUtNC_b4m78b7krrQedZaLQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2024 08:49:50 -0800
Message-ID: <CAMKF1srLd2oZ1S3Zq=Jhr6n1cude0AAZeqAMxgxa+L7TEMd=1Q@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 1/4] fuse3: Add missing runtime
 deps for ptests
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b9262806129c2a75"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 16:50:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109079

--000000000000b9262806129c2a75
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 2:45=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:

> or is it typo cuse -> fuse?
>
> On Fri, Mar 1, 2024 at 11:43=E2=80=AFAM Martin Jansa <martin.jansa@gmail.=
com>
> wrote:
> >
> > does it need virtual/kernel dependency now?
> >




> > in world build I've seen:
> > ERROR: QA Issue: fuse3-ptest rdepends on kernel-module-cuse, but it
> > isn't a build dependency? [build-deps]


Yeah this should be a recommends not rdepends


>
> >
> > On Thu, Feb 22, 2024 at 9:58=E2=80=AFPM Khem Raj <raj.khem@gmail.com> w=
rote:
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> > > index 5e532ba7ed..321851da5c 100644
> > > --- a/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> > > +++ b/meta-filesystems/recipes-support/fuse/fuse3_3.16.2.bb
> > > @@ -29,8 +29,10 @@ SRC_URI +=3D " \
> > >  "
> > >
> > >  RDEPENDS:${PN}-ptest +=3D " \
> > > -        python3-pytest \
> > > -       bash \
> > > +    python3-pytest \
> > > +    python3-looseversion \
> > > +    kernel-module-cuse \
> > > +    bash \
> > >  "
> > >
> > >  do_install_ptest() {
> > > --
> > > 2.43.2
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#108994):
> https://lists.openembedded.org/g/openembedded-devel/message/108994
> > > Mute This Topic: https://lists.openembedded.org/mt/104516894/3617156
> > > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsu=
b
> [martin.jansa@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

--000000000000b9262806129c2a75
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Fri, Mar 1, 2024 at 2:45=E2=80=AFAM Martin Jansa &lt;=
<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;padd=
ing-left:1ex;border-left-color:rgb(204,204,204)">or is it typo cuse -&gt; f=
use?<br>
<br>
On Fri, Mar 1, 2024 at 11:43=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; does it need virtual/kernel dependency now?<br>
&gt;</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)" dir=3D"auto"><br>
&gt; in world build I&#39;ve seen:<br>
&gt; ERROR: QA Issue: fuse3-ptest rdepends on kernel-module-cuse, but it<br=
>
&gt; isn&#39;t a build dependency? [build-deps]</blockquote><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Yeah this should be a recommends not rdepend=
s=C2=A0</div><div dir=3D"auto">=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style=
:solid;padding-left:1ex;border-left-color:rgb(204,204,204)" dir=3D"auto"><b=
r>
&gt;<br>
&gt; On Thu, Feb 22, 2024 at 9:58=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto=
:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.com</a>&gt; wrote:<br=
>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 meta-filesystems/recipes-support/fuse/<a href=3D"http://fus=
e3_3.16.2.bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a> | 6 =
++++--<br>
&gt; &gt;=C2=A0 1 file changed, 4 insertions(+), 2 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/meta-filesystems/recipes-support/fuse/<a href=3D"htt=
p://fuse3_3.16.2.bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</=
a> b/meta-filesystems/recipes-support/fuse/<a href=3D"http://fuse3_3.16.2.b=
b" rel=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a><br>
&gt; &gt; index 5e532ba7ed..321851da5c 100644<br>
&gt; &gt; --- a/meta-filesystems/recipes-support/fuse/<a href=3D"http://fus=
e3_3.16.2.bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a><br>
&gt; &gt; +++ b/meta-filesystems/recipes-support/fuse/<a href=3D"http://fus=
e3_3.16.2.bb" rel=3D"noreferrer" target=3D"_blank">fuse3_3.16.2.bb</a><br>
&gt; &gt; @@ -29,8 +29,10 @@ SRC_URI +=3D &quot; \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 RDEPENDS:${PN}-ptest +=3D &quot; \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3-pytest \<br>
&gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0bash \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-pytest \<br>
&gt; &gt; +=C2=A0 =C2=A0 python3-looseversion \<br>
&gt; &gt; +=C2=A0 =C2=A0 kernel-module-cuse \<br>
&gt; &gt; +=C2=A0 =C2=A0 bash \<br>
&gt; &gt;=C2=A0 &quot;<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 do_install_ptest() {<br>
&gt; &gt; --<br>
&gt; &gt; 2.43.2<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt; Links: You receive all messages sent to this group.<br>
&gt; &gt; View/Reply Online (#108994): <a href=3D"https://lists.openembedde=
d.org/g/openembedded-devel/message/108994" rel=3D"noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-devel/message/108994</a>=
<br>
&gt; &gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104=
516894/3617156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembe=
dded.org/mt/104516894/3617156</a><br>
&gt; &gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.o=
penembedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembed=
ded.org</a><br>
&gt; &gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembe=
dded-devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:martin.jansa@g=
mail.com" target=3D"_blank">martin.jansa@gmail.com</a>]<br>
&gt; &gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; &gt;<br>
</blockquote></div></div>
</div>

--000000000000b9262806129c2a75--

