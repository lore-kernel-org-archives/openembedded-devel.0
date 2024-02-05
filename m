Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DECB4C48298
	for <webhook@archiver.kernel.org>; Mon,  5 Feb 2024 15:55:57 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web10.66413.1707148556140307828
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Feb 2024 07:55:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IhO4Xphp;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: ticotimo@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-dc6f6d10ea9so2648385276.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 07:55:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707148555; x=1707753355; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=DpKRcRnLYd2B2+dBdDD/2gLoE0qL7MqvebGYR29+1zs=;
        b=IhO4Xphp/1av1K+qJbvS775sWcc9FU40Hvy0YFqZwzqZopyFCJQ4EQvLSYLTv4eYE6
         PNDhZ7xEB9IxWlq5lnR3MXMqveU8b0ZBACNikC6XbdPZJ1varl7sze9+ZJNUrzdjiLmq
         9VgBmu8ix3JOgOvpViXdm6qGdGtYhy9QGI0Lez/JvH9pgUQkpIcQIO0sPLJOwnlKooF/
         NxLjMydtXG/P3qH6xMlWNrcGl8uyC4XP3xIjDo9P2aj/fVHd6zhFOw2XbDl3dhVg8fmg
         uF8VYN6hLpOmA0Y3pxGnNMfmxqiwhuYp4qHX0/V7xe3H4a5iINjFMPcsqJoSafT5DVj+
         dVzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707148555; x=1707753355;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DpKRcRnLYd2B2+dBdDD/2gLoE0qL7MqvebGYR29+1zs=;
        b=IuNgIb4uJR8ywhYUP2JKT9HhCJCmlCHFxz1aaWFi/svQT1pu2VmJ/MfclLH8pKVT09
         h4xd7N2UlaKrglTENPLq4ntVuLl/bJoIU2bNcLTkVBByPKQkR/07C762QbHuESKxafjf
         ldoDMpOMGfmp4u0dhwF3XotjQQO5785FKIzsmXXLZtDN+46H3ESvHdDgfx5P8nE9qRy2
         Rv/Z/hRlGaHdWSEbNipeje8jgC0umarp/YysB5TX2kZJ5tlh9066MVcSDBjss+MIFlsY
         SS3iYuXIafIHHKZNBGsIKBbQBEsZ6Uw4OarOzCAVtMqViEPY68JvfWOYZO4jTimhFm2G
         kd+g==
X-Gm-Message-State: AOJu0Yw9BKnTTBFkUWNDLymFxAwG+XSqsIUaPA1IrMtriJtOUMO8duKH
	RC51GPkc1k5Kng/1ytmdnPJHekG3xD+WyTFSRgjozMm2RIo/c/uUiETqZsJLgylnP7YNQKAdFbq
	mAAlImUUPTzDItS/bFCNB8ZkN3pg0nhnl
X-Google-Smtp-Source: AGHT+IGumQULCKoBrTiDMRG99CJAg5p36ssHO59+1pHD0DdMyRtTjFklJO+4LAG1Om/Romm+wVFpiKPOqwKGAIQF9zA=
X-Received: by 2002:a25:6994:0:b0:dbd:5780:ff77 with SMTP id
 e142-20020a256994000000b00dbd5780ff77mr8812140ybc.12.1707148555254; Mon, 05
 Feb 2024 07:55:55 -0800 (PST)
MIME-Version: 1.0
References: <20240205125829.152301-1-dev@g0hl1n.net>
In-Reply-To: <20240205125829.152301-1-dev@g0hl1n.net>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 5 Feb 2024 07:55:44 -0800
Message-ID: <CANx9H-DF58NnD=2qWRsOCJENTy2H4700Ba1+TZMukrxB=woJFA@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/5] Add python3-httpx support
To: dev@g0hl1n.net
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000003703c40610a47fe8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 05 Feb 2024 15:55:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108574

--0000000000003703c40610a47fe8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 5, 2024 at 4:58=E2=80=AFAM Richard Leitner via lists.openembedd=
ed.org
<dev=3Dg0hl1n.net@lists.openembedded.org> wrote:

> This series adds support for python3-httpx and its dependencies.
>
>
Can you look into adding ptest also for these new packages? It doesn't
necessarily block adding them, but we don't want to keep piling on
technical debt of more recipes without ptest.


> Richard Leitner (5):
>   python3-socksio: add recipe for v1.0.0
>   python3-anyio: add recipe for v4.2.0
>   python3-sniffio: add recipe for v1.3.0
>   python3-httpcore: add recipe for v1.0.2
>   python3-httpx: add recipe for v0.26.0
>
>  .../python/python3-anyio_4.2.0.bb             | 23 ++++++++++
>  .../python/python3-httpcore_1.0.2.bb          | 26 +++++++++++
>  .../python/python3-httpx_0.26.0.bb            | 44 +++++++++++++++++++
>  .../python/python3-sniffio_1.3.0.bb           | 12 +++++
>  .../0001-Unpin-flit-core-dependency.patch     | 21 +++++++++
>  .../python/python3-socksio_1.0.0.bb           | 10 +++++
>  6 files changed, 136 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-anyio_4.2.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-httpcore_1.0.2.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-httpx_0.26.0.bb
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-sniffio_1.3.0.bb
>  create mode 100644
> meta-python/recipes-devtools/python/python3-socksio/0001-Unpin-flit-core-=
dependency.patch
>  create mode 100644 meta-python/recipes-devtools/python/
> python3-socksio_1.0.0.bb
>
> --
> 2.40.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#108567):
> https://lists.openembedded.org/g/openembedded-devel/message/108567
> Mute This Topic: https://lists.openembedded.org/mt/104175047/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000003703c40610a47fe8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 5, 2024 at 4:58=E2=80=AFA=
M Richard Leitner via <a href=3D"http://lists.openembedded.org">lists.opene=
mbedded.org</a> &lt;dev=3D<a href=3D"mailto:g0hl1n.net@lists.openembedded.o=
rg">g0hl1n.net@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">This series adds support for python3-h=
ttpx and its dependencies.<br>
<br></blockquote><div><br></div><div>Can you look into adding ptest also fo=
r these new packages? It doesn&#39;t necessarily block adding them, but we =
don&#39;t want to keep piling on technical debt of more recipes without pte=
st.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
Richard Leitner (5):<br>
=C2=A0 python3-socksio: add recipe for v1.0.0<br>
=C2=A0 python3-anyio: add recipe for v4.2.0<br>
=C2=A0 python3-sniffio: add recipe for v1.3.0<br>
=C2=A0 python3-httpcore: add recipe for v1.0.2<br>
=C2=A0 python3-httpx: add recipe for v0.26.0<br>
<br>
=C2=A0.../python/<a href=3D"http://python3-anyio_4.2.0.bb" rel=3D"noreferre=
r" target=3D"_blank">python3-anyio_4.2.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 23 ++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-httpcore_1.0.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">python3-httpcore_1.0.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 26 +++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-httpx_0.26.0.bb" rel=3D"noreferr=
er" target=3D"_blank">python3-httpx_0.26.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 44 +++++++++++++++++++<br>
=C2=A0.../python/<a href=3D"http://python3-sniffio_1.3.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-sniffio_1.3.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 12 +++++<br>
=C2=A0.../0001-Unpin-flit-core-dependency.patch=C2=A0 =C2=A0 =C2=A0| 21 +++=
++++++<br>
=C2=A0.../python/<a href=3D"http://python3-socksio_1.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">python3-socksio_1.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 10 +++++<br>
=C2=A06 files changed, 136 insertions(+)<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-anyio_4.2.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-an=
yio_4.2.0.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-httpcore_1.0.2.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-httpcore_1.0.2.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-httpx_0.26.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-h=
ttpx_0.26.0.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-sniffio_1.3.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
sniffio_1.3.0.bb</a><br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/python3-socksi=
o/0001-Unpin-flit-core-dependency.patch<br>
=C2=A0create mode 100644 meta-python/recipes-devtools/python/<a href=3D"htt=
p://python3-socksio_1.0.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-=
socksio_1.0.0.bb</a><br>
<br>
-- <br>
2.40.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#108567): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/108567" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/108567</a><br>
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

--0000000000003703c40610a47fe8--

