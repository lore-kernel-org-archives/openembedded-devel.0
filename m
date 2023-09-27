Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961D3E82CD3
	for <webhook@archiver.kernel.org>; Wed, 27 Sep 2023 20:22:58 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.27758.1695846172063823085
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 27 Sep 2023 13:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fVUhskIy;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3226b8de467so10150165f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 13:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695846170; x=1696450970; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dhiz3FIE/CZ+3oe8uen6T5x9Sd6JDWdQbm7qWPnLi1c=;
        b=fVUhskIyKMlotDQbdO4E13KuzI8R5NJhBBtOI4vP3oV+uhT4LyTuBeJHJCKTSpMZJx
         zdvSjstT/pf7Y5nvJkmjC++f+RpaQvIPpCHcaJitK6/0E0HIgJm9e6KHrLWWPqesGJlu
         Qpq1J7mscBTNoA3e7M98OpaPZdtS0eN0N/e+m1yXjfTlt+d8gPu9EI9PBnR6OfhoLSE2
         Vxk+u0qbxPiW6Pn/jmKDqhYzdqK9mvJajuEyN6wRyqSWXjcEF/08VtX8AODyhMzOIxXr
         zqk1w3bsvvVpIbnULe3XSIx/L+Ancy9vvMZDPvTLcTUUiMqvo8NJe6IDVdN2K1Rra2VY
         ifTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695846170; x=1696450970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dhiz3FIE/CZ+3oe8uen6T5x9Sd6JDWdQbm7qWPnLi1c=;
        b=g/ELdgCKPE4A2ZGCp3sbwlozqZzxx6Y37bkGreQgl+KkXpNpBX8Df01TyN3bQES67P
         V0NvFeUL+iWaGI9C0sG7ZRtLWz1ox1o69I1l06An47BzrOR1O8SbDyGjaaJi3Zc0zg+6
         EfmaQ7oEyhFa6UjuQOHaVkcWxA0XvUMIbdJwHR+rQ/qmyI6i1WfK8nBbl34VtZcno5HI
         HUhlKK9otDdFSkhxfm0279+lYIPngnmQqWvj04MaC+JWg947gHt+T+Zi8yK3d+Jxd2DB
         Bmc6DiZQlcDwg2VRQtpLl/yR8bifuqDhjrr3s9M6/zeMnxSmtrXblg45bfZ8IfgjCi68
         i5cQ==
X-Gm-Message-State: AOJu0YxDRMdlgsqdopk/Xzmv6V5+F9rlYswlkg78lrcT159PVSzAQqre
	x/Jp74Da4eBB0nPFH3Y+TwUH0g0ljI7B+o7MgUA=
X-Google-Smtp-Source: AGHT+IE1Vf/Z7XAaSg3F2ewA1/Oqo9METh6dgbEep4w727viyZPHYj6aMVRJWxnSa1UxpNriRP6SolR0fZ6KdJEGU8Q=
X-Received: by 2002:adf:b341:0:b0:324:7bdd:709a with SMTP id
 k1-20020adfb341000000b003247bdd709amr2290057wrd.50.1695846170254; Wed, 27 Sep
 2023 13:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230927201136.2587713-1-martin.jansa@gmail.com> <CAJiuCcfBSBzCUjZ3CJkUB3x4DsE8BkQOSOMdfp3z1ZBwSgfkkg@mail.gmail.com>
In-Reply-To: <CAJiuCcfBSBzCUjZ3CJkUB3x4DsE8BkQOSOMdfp3z1ZBwSgfkkg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 27 Sep 2023 22:22:37 +0200
Message-ID: <CA+chaQfWzJ8MJu-L1jC8Dyy8xJ-5X5HSSpz_MRJwmNTnRapXNA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] mosquitto, etcd-cpp-apiv3: add missing Upstream-Status
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000092659906065cf423"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 27 Sep 2023 20:22:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105206

--00000000000092659906065cf423
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Which one? Can you send v2 of your changes as you clearly know the correct
status better than me?

On Wed, Sep 27, 2023 at 10:21=E2=80=AFPM Cl=C3=A9ment P=C3=A9ron <peron.cle=
m@gmail.com> wrote:

> Hi Martin
>
> On Wed, 27 Sept 2023 at 22:11, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> >  meta-networking/recipes-connectivity/mosquitto/files/2894.patch | 2 ++
> >  meta-networking/recipes-connectivity/mosquitto/files/2895.patch | 2 ++
> >  .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch    | 2 ++
> >  3 files changed, 6 insertions(+)
> >
> > diff --git
> a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> > index 3275e57e38..7374cbd26f 100644
> > --- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch
> > @@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets
> library if needed see:
> >
> >  Patch contributed by Joachim Zobel <jz-2017@heute-morgen.de> and
> Daniel Engberg <daniel.engberg.lists@pyret.net>
> >  ---
> > +Upstream-Status: Pending
> > +
> >   src/CMakeLists.txt | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git
> a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> > index a9e9c97b83..853f881754 100644
> > --- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> > +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch
> > @@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-online
> when starting
> >
> >  See: https://github.com/eclipse/mosquitto/issues/2878
> >  ---
> > +Upstream-Status: Pending
> > +
> >   service/systemd/mosquitto.service.simple | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git
> a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-=
compiling.patch
> b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-=
compiling.patch
> > index d1126aa05b..ce12d4270a 100644
> > ---
> a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-=
compiling.patch
> > +++
> b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when-cross-=
compiling.patch
> > @@ -17,6 +17,8 @@ CMake is cross compiling.
> >
> >  Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> >  ---
> > +Upstream-Status: Pending
>
> It has been accepted and merged.
>
> Thanks
>
> > +
> >   CMakeLists.txt | 28 ++++++++++++++++++++++++++--
> >   1 file changed, 26 insertions(+), 2 deletions(-)
> >
> > --
> > 2.42.0
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#105203):
> https://lists.openembedded.org/g/openembedded-devel/message/105203
> > Mute This Topic: https://lists.openembedded.org/mt/101625428/4240582
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> peron.clem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--00000000000092659906065cf423
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Which one? Can you send v2 of your changes as you clearly =
know the correct status better than me?</div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 27, 2023 at 10:21=E2=80=
=AFPM Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:peron.clem@gmail.com">p=
eron.clem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">Hi Martin<br>
<br>
On Wed, 27 Sept 2023 at 22:11, Martin Jansa &lt;<a href=3D"mailto:martin.ja=
nsa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta-networking/recipes-connectivity/mosquitto/files/2894.patch =
| 2 ++<br>
&gt;=C2=A0 meta-networking/recipes-connectivity/mosquitto/files/2895.patch =
| 2 ++<br>
&gt;=C2=A0 .../etcd-cpp-apiv3/0001-cmake-fix-when-cross-compiling.patch=C2=
=A0 =C2=A0 | 2 ++<br>
&gt;=C2=A0 3 files changed, 6 insertions(+)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2894=
.patch b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<br=
>
&gt; index 3275e57e38..7374cbd26f 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<=
br>
&gt; +++ b/meta-networking/recipes-connectivity/mosquitto/files/2894.patch<=
br>
&gt; @@ -5,6 +5,8 @@ Subject: [PATCH] Link correctly with shared websockets=
 library if needed see:<br>
&gt;<br>
&gt;=C2=A0 Patch contributed by Joachim Zobel &lt;<a href=3D"mailto:jz-2017=
@heute-morgen.de" target=3D"_blank">jz-2017@heute-morgen.de</a>&gt; and=C2=
=A0 Daniel Engberg &lt;<a href=3D"mailto:daniel.engberg.lists@pyret.net" ta=
rget=3D"_blank">daniel.engberg.lists@pyret.net</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0src/CMakeLists.txt | 2 +-<br>
&gt;=C2=A0 =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/meta-networking/recipes-connectivity/mosquitto/files/2895=
.patch b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<br=
>
&gt; index a9e9c97b83..853f881754 100644<br>
&gt; --- a/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<=
br>
&gt; +++ b/meta-networking/recipes-connectivity/mosquitto/files/2895.patch<=
br>
&gt; @@ -5,6 +5,8 @@ Subject: [PATCH] Mosquitto now waits for network-onlin=
e when starting<br>
&gt;<br>
&gt;=C2=A0 See: <a href=3D"https://github.com/eclipse/mosquitto/issues/2878=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/eclipse/mosquitto=
/issues/2878</a><br>
&gt;=C2=A0 ---<br>
&gt; +Upstream-Status: Pending<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0service/systemd/mosquitto.service.simple | 4 ++--<br>
&gt;=C2=A0 =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-f=
ix-when-cross-compiling.patch b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv=
3/0001-cmake-fix-when-cross-compiling.patch<br>
&gt; index d1126aa05b..ce12d4270a 100644<br>
&gt; --- a/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when=
-cross-compiling.patch<br>
&gt; +++ b/meta-oe/recipes-extended/etcd/etcd-cpp-apiv3/0001-cmake-fix-when=
-cross-compiling.patch<br>
&gt; @@ -17,6 +17,8 @@ CMake is cross compiling.<br>
&gt;<br>
&gt;=C2=A0 Signed-off-by: Cl=C3=A9ment P=C3=A9ron &lt;<a href=3D"mailto:per=
on.clem@gmail.com" target=3D"_blank">peron.clem@gmail.com</a>&gt;<br>
&gt;=C2=A0 ---<br>
&gt; +Upstream-Status: Pending<br>
<br>
It has been accepted and merged.<br>
<br>
Thanks<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0CMakeLists.txt | 28 ++++++++++++++++++++++++++--<br>
&gt;=C2=A0 =C2=A01 file changed, 26 insertions(+), 2 deletions(-)<br>
&gt;<br>
&gt; --<br>
&gt; 2.42.0<br>
&gt;<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#105203): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/105203" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/105203</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10162542=
8/4240582" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/101625428/4240582</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:peron.clem@gmail.co=
m" target=3D"_blank">peron.clem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--00000000000092659906065cf423--

