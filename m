Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64725C5475B
	for <webhook@archiver.kernel.org>; Fri,  1 Mar 2024 16:50:25 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.28507.1709311820094254319
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 Mar 2024 08:50:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f98BuL8O;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3c1c44a9554so1018606b6e.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 08:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709311819; x=1709916619; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Eq/DKkwTCp0CWoeEM4jmU7bSh31ZGXn0ktJbsFeTuQ=;
        b=f98BuL8OorEUf/OBmwGI+1xPEY+i0vB0NWhhnFLsY8/Z/YY61TnI2nL4LlDHldITon
         meUpf+VmoiI/TK/CXMBxNKtMwrN75va9Ya9pJYtiTNavFeTChzqGW6NSNoc21wLU6nTH
         px2/LQqSW9QSAPUSFsu+09of9NSAD9X9bDLi3BfrtO2cJYipzqx5+WQiTt4uWsH6nUvf
         /mGwg33Oy5ryzutILmwIMJbdMFSJLF6vknivPobtXR5ISALCJq8Kpclch8MIpTMYHbKz
         krpos5EIuuaVNk5LxQDZeODbC1JnmvikNKPbuaC9T+ddXWJrom8AhjubECLeZr8BaBqb
         cxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709311819; x=1709916619;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Eq/DKkwTCp0CWoeEM4jmU7bSh31ZGXn0ktJbsFeTuQ=;
        b=pFtkanIK05nCiTbF0MAcDrXwnQCPL90wjHGsFXXLd/jLBjTlylQEsxKtFdaovl/Cu8
         y7tPnOol4BbrcqZJIJO4AJuGvOoCXvTSgg5t7TOa1tgLm6SiqhazpJYpxYyK0TAfc4x2
         7msmfy6EY856GbhdtJAfkv6LJrVkxJ5477SsK8krg1qBZSlVYaumXkFtddFhjeVLqwe9
         pZEqQiYG6Dg/6jYze/IYKq57il6ezy0RX37/hbBDlVV7z2uE01ric6PW3ksAA9wVA7VL
         hfsMJ7Z2efqHxQaXv5JlmFsr9+7b7koQBJPAARKn9jqvY3kzn8PfVIuZJfwMFwrL6mvP
         fDew==
X-Gm-Message-State: AOJu0YyXMORCWbKoPlZMxDZOeyp7xlUBzRq/Bs5jeKwyTouuEIUVxhyB
	h1sAHqmCVFN+Yq8cmV7vKUNljup3SWkh5+glmowY2UlwOeOiKFeJAkd+7cOJTNMbNUBHXLZug5Z
	iYuNhcBQak3vd/x9rzFzdTjT9yI/VT32Y
X-Google-Smtp-Source: AGHT+IF94ubuN1DolXWqOCuqO63DMWWWiH+Xzm8Pk2/GYkFnK9d8NCAe80B2zYgXUSA4ER1dykUhYocxEz924iSZyuk=
X-Received: by 2002:a05:6870:f14c:b0:21e:95d9:dc7b with SMTP id
 l12-20020a056870f14c00b0021e95d9dc7bmr2147105oac.30.1709311819361; Fri, 01
 Mar 2024 08:50:19 -0800 (PST)
MIME-Version: 1.0
References: <20240222205827.2813212-1-raj.khem@gmail.com> <CA+chaQfOOMdDvQE1Q+7qMBdb37A3UUins90d+=hUy7OVYT60Xw@mail.gmail.com>
 <CA+chaQdtcOvfmXtPM2W2ZeVo1XtvUtNC_b4m78b7krrQedZaLQ@mail.gmail.com>
In-Reply-To: <CA+chaQdtcOvfmXtPM2W2ZeVo1XtvUtNC_b4m78b7krrQedZaLQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Mar 2024 08:50:08 -0800
Message-ID: <CAMKF1sqnTK3OPZpxxo5COcZ9Fr8ba6VtZY2jeMtAMuxdoRrJNg@mail.gmail.com>
Subject: Re: [oe] [meta-filesystems][PATCH 1/4] fuse3: Add missing runtime
 deps for ptests
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000cdb36f06129c2b5c"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 01 Mar 2024 16:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109080

--000000000000cdb36f06129c2b5c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 1, 2024 at 2:45=E2=80=AFAM Martin Jansa <martin.jansa@gmail.com=
> wrote:

> or is it typo cuse -> fuse?


No


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

--000000000000cdb36f06129c2b5c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Fri, Mar 1, 2024 at 2:45=E2=80=AFAM Martin Jansa &lt;<a =
href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">or is it typo cuse -&gt; fuse?</b=
lockquote><div dir=3D"auto"><br></div><div dir=3D"auto">No</div><div dir=3D=
"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
On Fri, Mar 1, 2024 at 11:43=E2=80=AFAM Martin Jansa &lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wr=
ote:<br>
&gt;<br>
&gt; does it need virtual/kernel dependency now?<br>
&gt;<br>
&gt; in world build I&#39;ve seen:<br>
&gt; ERROR: QA Issue: fuse3-ptest rdepends on kernel-module-cuse, but it<br=
>
&gt; isn&#39;t a build dependency? [build-deps]<br>
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

--000000000000cdb36f06129c2b5c--

