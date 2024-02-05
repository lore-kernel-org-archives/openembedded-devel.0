Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 448E0C48297
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 17:48:48 +0000 (UTC)
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
 by mx.groups.io with SMTP id smtpd.web10.388.1707155322164784452
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 09:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fg0e81NB;
 spf=pass (domain: gmail.com, ip: 209.85.219.181, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dc6e08fde11so4212063276.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707155321; x=1707760121; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OatAfUwM9+jiBjnQ2vJt2pAdn849pZaa8X/TYA3qcF8=;
        b=Fg0e81NBXCucW692WNpwCum3PYdGLMR27uakUv+Xy2yHTraL2witQfHVVzQpWZs8lO
         2T1TRlZtknapd+twvSkN8Ei9zJBgVnDJ2XNC4YU7uq4D1tQ3mI1EnHZ0uMxeBz7iu+9i
         rCSU049KzPQvbb3Sc+JuQ/KdpHkipHAkU8UD0xL/47ZpHiuamhWX08VZOfXajZGNUIlj
         SrXFrHWjroTKdscqf+n/+xWJpP7n9GtAniLQv3my/l0ytkesqbZ5KX7uZ6sT4JUs6D/M
         1UL7sIJ6qh0vW3tpXBaf7aBMN3E1Z+09b9qSbR6lj7jckiB+pLpjIo7NWkH0ibKFGO68
         s5wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707155321; x=1707760121;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OatAfUwM9+jiBjnQ2vJt2pAdn849pZaa8X/TYA3qcF8=;
        b=U5m9ORy/XPVIE5aD8IPboQdAAT2IgcF9GMD6Zo0Q9NwGoYYJ6SUy6LB5j37K8oswWM
         QzK4ShVhSVOaWgF66WCsZqlCuppU2tRDv4N1OClYa/0N1nPc3RIg0UvSbYZoJxOvdZX+
         UxZKtoX1QXYtd+EHzMIe/ac4bMt3F9yN+Lnzza2JIDwXDgTPRNTzwTZdKDipruLvGIxa
         QmdJhtOYKQXpPnFxw5tTqp9pfl2WFkGtNNW3w3ZtT3baePmYQ4PskXwYkhqAb3CKRdEB
         XcXcFylsCjhF2qWKyxGaiw+A63130RpkAH04wILNAateXbMY4n/eSP44+FkOF+DYNe5Q
         Yxxg==
X-Gm-Message-State: AOJu0Yyips6UazFnXFUc533FskNenjgfialP7iGwcmR5hhjG997QliM9
	k9dM1vRMAYaJrVXAyxpRKzuKmegPRGQWrsFchO/5VlpeVyfut9c8E9l/sM6VmYgX/Md6e5v0siM
	4ZWjxqkzmTEve2b9o2oOG8IvkyRM=
X-Google-Smtp-Source: AGHT+IE2Lf28aLzf80BcVq6jzb9JKpyPMuNSpPfk0ayq1friBQ1LrwrS4PZKHVhbkW/HHA5B+yTtxXxeZg7lvhUGeXg=
X-Received: by 2002:a25:d854:0:b0:dc6:db64:67a8 with SMTP id
 p81-20020a25d854000000b00dc6db6467a8mr102969ybg.43.1707155321250; Mon, 05 Feb
 2024 09:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20240205125829.152301-1-dev@g0hl1n.net> <CANx9H-DF58NnD=2qWRsOCJENTy2H4700Ba1+TZMukrxB=woJFA@mail.gmail.com>
 <CAMKF1sqH8CHESnv+0XCMP-mui46OiVZ3ADbViEb7Mc6=twU5Jg@mail.gmail.com>
In-Reply-To: <CAMKF1sqH8CHESnv+0XCMP-mui46OiVZ3ADbViEb7Mc6=twU5Jg@mail.gmail.com>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 5 Feb 2024 09:48:30 -0800
Message-ID: <CANx9H-DvSdH1etHgsQM3LEhkH9Uyi02+wFJeARubNzwG3g30iA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/5] Add python3-httpx support
To: Khem Raj <raj.khem@gmail.com>
Cc: dev@g0hl1n.net, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000007fe8fe0610a612d0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 17:48:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108577

--0000000000007fe8fe0610a612d0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 9:44=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote:

> On Mon, Feb 5, 2024 at 7:55=E2=80=AFAM Tim Orling <ticotimo@gmail.com> wr=
ote:
> >
> >
> >
> > On Mon, Feb 5, 2024 at 4:58=E2=80=AFAM Richard Leitner via
> lists.openembedded.org <dev=3Dg0hl1n.net@lists.openembedded.org> wrote:
> >>
> >> This series adds support for python3-httpx and its dependencies.
> >>
> >
> > Can you look into adding ptest also for these new packages? It doesn't
> necessarily block adding them, but we don't want to keep piling on
> technical debt of more recipes without ptest.
>
> I think this is a good idea. We run ptests for meta-python regularly
> as acceptance and do find issues these days. So adding ptest would
> be good here, perhaps for meta-python it could be made a needed thing
> for new recipes.
>

I am definitely leaning in that direction, but I also know that some of the
dependency trees get very deep very quickly. This is one of the reasons
I have wished for recursive "devtool add", but that is an entirely differen=
t
topic.


>
> >
> >>
> >> Richard Leitner (5):
> >>   python3-socksio: add recipe for v1.0.0
> >>   python3-anyio: add recipe for v4.2.0
> >>   python3-sniffio: add recipe for v1.3.0
> >>   python3-httpcore: add recipe for v1.0.2
> >>   python3-httpx: add recipe for v0.26.0
> >>
> >>  .../python/python3-anyio_4.2.0.bb             | 23 ++++++++++
> >>  .../python/python3-httpcore_1.0.2.bb          | 26 +++++++++++
> >>  .../python/python3-httpx_0.26.0.bb            | 44 ++++++++++++++++++=
+
> >>  .../python/python3-sniffio_1.3.0.bb           | 12 +++++
> >>  .../0001-Unpin-flit-core-dependency.patch     | 21 +++++++++
> >>  .../python/python3-socksio_1.0.0.bb           | 10 +++++
> >>  6 files changed, 136 insertions(+)
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-anyio_4.2.0.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-httpcore_1.0.2.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-httpx_0.26.0.bb
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-sniffio_1.3.0.bb
> >>  create mode 100644
> meta-python/recipes-devtools/python/python3-socksio/0001-Unpin-flit-core-=
dependency.patch
> >>  create mode 100644 meta-python/recipes-devtools/python/
> python3-socksio_1.0.0.bb
> >>
> >> --
> >> 2.40.1
> >>
> >>
> >>
> >>
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108576):
> https://lists.openembedded.org/g/openembedded-devel/message/108576
> Mute This Topic: https://lists.openembedded.org/mt/104175047/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000007fe8fe0610a612d0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 5, 2024 at 9:44=E2=80=AFA=
M Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On M=
on, Feb 5, 2024 at 7:55=E2=80=AFAM Tim Orling &lt;<a href=3D"mailto:ticotim=
o@gmail.com" target=3D"_blank">ticotimo@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On Mon, Feb 5, 2024 at 4:58=E2=80=AFAM Richard Leitner via <a href=3D"=
http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.o=
penembedded.org</a> &lt;dev=3D<a href=3D"mailto:g0hl1n.net@lists.openembedd=
ed.org" target=3D"_blank">g0hl1n.net@lists.openembedded.org</a>&gt; wrote:<=
br>
&gt;&gt;<br>
&gt;&gt; This series adds support for python3-httpx and its dependencies.<b=
r>
&gt;&gt;<br>
&gt;<br>
&gt; Can you look into adding ptest also for these new packages? It doesn&#=
39;t necessarily block adding them, but we don&#39;t want to keep piling on=
 technical debt of more recipes without ptest.<br>
<br>
I think this is a good idea. We run ptests for meta-python regularly<br>
as acceptance and do find issues these days. So adding ptest would<br>
be good here, perhaps for meta-python it could be made a needed thing<br>
for new recipes.<br></blockquote><div><br></div><div>I am definitely leanin=
g in that direction, but I also know that some of the</div><div>dependency =
trees get very deep very quickly. This is one of the reasons</div><div>I ha=
ve wished for recursive &quot;devtool add&quot;, but that is an entirely di=
fferent</div><div>topic.</div><div>=C2=A0</div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Richard Leitner (5):<br>
&gt;&gt;=C2=A0 =C2=A0python3-socksio: add recipe for v1.0.0<br>
&gt;&gt;=C2=A0 =C2=A0python3-anyio: add recipe for v4.2.0<br>
&gt;&gt;=C2=A0 =C2=A0python3-sniffio: add recipe for v1.3.0<br>
&gt;&gt;=C2=A0 =C2=A0python3-httpcore: add recipe for v1.0.2<br>
&gt;&gt;=C2=A0 =C2=A0python3-httpx: add recipe for v0.26.0<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-anyio_4.2.0.bb" rel=3D"=
noreferrer" target=3D"_blank">python3-anyio_4.2.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-httpcore_1.0.2.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-httpcore_1.0.2.bb</a>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 26 +++++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-httpx_0.26.0.bb" rel=3D=
"noreferrer" target=3D"_blank">python3-httpx_0.26.0.bb</a>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 44 +++++++++++++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-sniffio_1.3.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-sniffio_1.3.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 12 +++++<br>
&gt;&gt;=C2=A0 .../0001-Unpin-flit-core-dependency.patch=C2=A0 =C2=A0 =C2=
=A0| 21 +++++++++<br>
&gt;&gt;=C2=A0 .../python/<a href=3D"http://python3-socksio_1.0.0.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-socksio_1.0.0.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++<br>
&gt;&gt;=C2=A0 6 files changed, 136 insertions(+)<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-anyio_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-anyio_4.2.0.bb</a><br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-httpcore_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank=
">python3-httpcore_1.0.2.bb</a><br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-httpx_0.26.0.bb" rel=3D"noreferrer" target=3D"_blank">=
python3-httpx_0.26.0.bb</a><br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-sniffio_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-sniffio_1.3.0.bb</a><br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/pytho=
n3-socksio/0001-Unpin-flit-core-dependency.patch<br>
&gt;&gt;=C2=A0 create mode 100644 meta-python/recipes-devtools/python/<a hr=
ef=3D"http://python3-socksio_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank"=
>python3-socksio_1.0.0.bb</a><br>
&gt;&gt;<br>
&gt;&gt; --<br>
&gt;&gt; 2.40.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108576): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108576" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108576</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/104175047/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/104175047/924729</a><br>
Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openembedde=
d.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.org</a=
><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-devel=
/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org=
/g/openembedded-devel/unsub</a> [<a href=3D"mailto:ticotimo@gmail.com" targ=
et=3D"_blank">ticotimo@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000007fe8fe0610a612d0--

