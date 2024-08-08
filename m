Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81F84C3DA4A
	for <webhook@archiver.kernel.org>; Thu,  8 Aug 2024 20:27:30 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.69557.1723148845520855571
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Aug 2024 13:27:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FTHseyZK;
 spf=pass (domain: konsulko.com, ip: 209.85.218.53, mailfrom: tim.orling@konsulko.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a7a9cf7d3f3so166526766b.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 13:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723148844; x=1723753644; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wKmJaRdoT+cjU7kBbGBAmSTa/ZRQxvzFksnrAMdvj1A=;
        b=FTHseyZK3BcJbF1KUJVqV7iUGWWFyPXT6jA6xMivA/vk0S/P028DZYoSnisPdvAcg4
         ZASLJcXJV4M1FLzmPxfv4DSYyMUd+4OjVJ/j5dQwgNbm6BSrQo0Wy5IHZq7syXnGgoZz
         qCVwKAreVAdKK0kxFgw6CJXU4KldxZr3LJZCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723148844; x=1723753644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wKmJaRdoT+cjU7kBbGBAmSTa/ZRQxvzFksnrAMdvj1A=;
        b=ffP3yaxbgLXuTbSTa1nHsLzC1FQ7Xml84n3mVCij9pFhXS4U2YhlZG/m6R0l+qZvuZ
         kTHKkmkcaaIlU7tzfNcEroMa4z1vvK9hu0ua2BYV6Hp9lyI9NFUDwbKu2Tr5LTLFnSjn
         M2+G0KA1PnYKjd/xCxJn/5cjL/XpRjooHoaVkzSqykIb5wuY1ZeuuIJ/mYTjQDcG8NYq
         j2hNCapE8O5Jd5xnUad4oApMbPxnMNZoCtvX8mjQmFn450WYnsae6Am2T+eWsaRY9DUs
         r4C/Xq//WGUDYF4BdseKWVTfEt23qjVKsOLkY6V9oSlggXTOvcYO59bjICwi0wAdggG3
         pezQ==
X-Gm-Message-State: AOJu0YyCVfZpK9lPa94KF9qA1dRE0M8F78Y79lADPUTqOK7g5kgbvyVu
	7G0libNes1KBkxQsi9wjADKJwnJTxHSu5E0hXtyA8RjY7huv8l+vPlol4s2zp1pRVrUugSYRYIX
	ijakG42UPIMek3eY9xHSPKooMxHvTGgwbCKQdAA==
X-Google-Smtp-Source: AGHT+IEJUuwPnyxr4RihXMwMWWbRF8vcg9LlP35fRLXLe7Cp33YnkABsemBzkp48NqjkaxxgBJs/uHNibdZPFJAUSjc=
X-Received: by 2002:a17:907:f1e7:b0:a77:eb34:3b4e with SMTP id
 a640c23a62f3a-a8090beb704mr238756166b.7.1723148843558; Thu, 08 Aug 2024
 13:27:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1723134758.git.tim.orling@konsulko.com> <adc6a5be-ed84-48b5-865c-b14cd8495023@gmail.com>
In-Reply-To: <adc6a5be-ed84-48b5-865c-b14cd8495023@gmail.com>
From: Tim Orling <tim.orling@konsulko.com>
Date: Thu, 8 Aug 2024 13:27:12 -0700
Message-ID: <CAOyo-87fN--YEowZDE5ZtaBw6=prv61bsMpBYQ9CDE3ECU-4Ng@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH 0/5] Upgrade python3-pydantic-*
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000b74b76061f31dac0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 08 Aug 2024 20:27:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/111683

--000000000000b74b76061f31dac0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 8, 2024 at 11:38=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrote=
:

> does it address the buildpaths issue ? or should that patch be rebased
> on top of this.
>
> Patch 5/5 is the buildpaths issue and I'd rather not rebase again. I've
already run all this patch series through ptest etc.


> On 8/8/24 9:38 AM, Tim Orling via lists.openembedded.org wrote:
> > From: Tim Orling <tim.orling@konsulko.com>
> >
> > We've had some trouble with python3-pydantic being upgrading without th=
e
> > required version of python3-pydantic-core being available. To ensure we
> > do not keep having this happen, this series sets RECIPE_NO_UPDATE_REASO=
N
> > in python3-pydantic.
> >
> > There were a number of missing ptest dependencies, including
> python3-tzdata
> > which we did not have a recipe for yet. This series adds this new recip=
e.
> >
> > Upstream has a patch, not yet in a release, for the TMPDIR [build-paths=
]
> > contamination which was injecting RUSTFLAGS into the _pydantic-core.*.s=
o.
> > This series backports that patch.
> >
> > The following changes since commit
> 49d707e0301d7bcbad386cbf3dd205ef6fdc561c:
> >
> >    python3-cachetools: Upgrade 5.3.3 -> 5.4.0 (2024-08-02 08:52:53 -070=
0)
> >
> > are available in the Git repository at:
> >
> >    https://git.openembedded.org/meta-openembedded-contrib
> timo/python3-pydantic-upgrade
> >
> https://git.openembedded.org/meta-openembedded-contrib/log/?h=3Dtimo/pyth=
on3-pydantic-upgrade
> >
> > Tim Orling (5):
> >    python3-tzdata: add recipe for v2024.1
> >    python3-tzdata: enable ptest
> >    python3-pydantic-core: upgrade 2.18.4 -> 2.21.0
> >    python3-pydantic: upgrade 2.7.3 -> 2.8.2
> >    python3-pydantic-core: backport patch
> >
> >   .../ptest-packagelists-meta-python.inc        |   1 +
> >   .../python/python3-pydantic-core-crates.inc   | 280 ++++++++++-------=
-
> >   ...sion-from-1.76-to-1.75-in-Cargo.toml.patch |  29 --
> >   ...8.4.bb =3D> python3-pydantic-core_2.21.0.bb} |  16 +-
> >   ...tic_2.7.3.bb =3D> python3-pydantic_2.8.2.bb} |   8 +-
> >   .../python/python3-tzdata/run-ptest           |   3 +
> >   .../python/python3-tzdata_2024.1.bb           |  24 ++
> >   7 files changed, 198 insertions(+), 163 deletions(-)
> >   delete mode 100644
> meta-python/recipes-devtools/python/python3-pydantic-core/0001-Set-rust-v=
ersion-from-1.76-to-1.75-in-Cargo.toml.patch
> >   rename meta-python/recipes-devtools/python/{
> python3-pydantic-core_2.18.4.bb =3D> python3-pydantic-core_2.21.0.bb} (80=
%)
> >   rename meta-python/recipes-devtools/python/{python3-pydantic_2.7.3.bb
> =3D> python3-pydantic_2.8.2.bb} (87%)
> >   create mode 100644
> meta-python/recipes-devtools/python/python3-tzdata/run-ptest
> >   create mode 100644 meta-python/recipes-devtools/python/
> python3-tzdata_2024.1.bb
> >
>
>
>
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#111669):
> https://lists.openembedded.org/g/openembedded-devel/message/111669
> > Mute This Topic: https://lists.openembedded.org/mt/107793237/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--000000000000b74b76061f31dac0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 8, 2024 at 11:38=E2=80=AF=
AM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">doe=
s it address the buildpaths issue ? or should that patch be rebased <br>
on top of this.<br>
<br></blockquote><div>Patch 5/5 is the buildpaths issue and I&#39;d rather =
not rebase again. I&#39;ve already run all this patch series through ptest =
etc.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
On 8/8/24 9:38 AM, Tim Orling via <a href=3D"http://lists.openembedded.org"=
 rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wrote:<br>
&gt; From: Tim Orling &lt;<a href=3D"mailto:tim.orling@konsulko.com" target=
=3D"_blank">tim.orling@konsulko.com</a>&gt;<br>
&gt; <br>
&gt; We&#39;ve had some trouble with python3-pydantic being upgrading witho=
ut the<br>
&gt; required version of python3-pydantic-core being available. To ensure w=
e<br>
&gt; do not keep having this happen, this series sets RECIPE_NO_UPDATE_REAS=
ON<br>
&gt; in python3-pydantic.<br>
&gt; <br>
&gt; There were a number of missing ptest dependencies, including python3-t=
zdata<br>
&gt; which we did not have a recipe for yet. This series adds this new reci=
pe.<br>
&gt; <br>
&gt; Upstream has a patch, not yet in a release, for the TMPDIR [build-path=
s]<br>
&gt; contamination which was injecting RUSTFLAGS into the _pydantic-core.*.=
so.<br>
&gt; This series backports that patch.<br>
&gt; <br>
&gt; The following changes since commit 49d707e0301d7bcbad386cbf3dd205ef6fd=
c561c:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 python3-cachetools: Upgrade 5.3.3 -&gt; 5.4.0 (2024-08-02=
 08:52:53 -0700)<br>
&gt; <br>
&gt; are available in the Git repository at:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded=
-contrib" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded.org=
/meta-openembedded-contrib</a> timo/python3-pydantic-upgrade<br>
&gt;=C2=A0 =C2=A0 <a href=3D"https://git.openembedded.org/meta-openembedded=
-contrib/log/?h=3Dtimo/python3-pydantic-upgrade" rel=3D"noreferrer" target=
=3D"_blank">https://git.openembedded.org/meta-openembedded-contrib/log/?h=
=3Dtimo/python3-pydantic-upgrade</a><br>
&gt; <br>
&gt; Tim Orling (5):<br>
&gt;=C2=A0 =C2=A0 python3-tzdata: add recipe for v2024.1<br>
&gt;=C2=A0 =C2=A0 python3-tzdata: enable ptest<br>
&gt;=C2=A0 =C2=A0 python3-pydantic-core: upgrade 2.18.4 -&gt; 2.21.0<br>
&gt;=C2=A0 =C2=A0 python3-pydantic: upgrade 2.7.3 -&gt; 2.8.2<br>
&gt;=C2=A0 =C2=A0 python3-pydantic-core: backport patch<br>
&gt; <br>
&gt;=C2=A0 =C2=A0.../ptest-packagelists-meta-python.inc=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 =C2=A01 +<br>
&gt;=C2=A0 =C2=A0.../python/python3-pydantic-core-crates.inc=C2=A0 =C2=A0| =
280 ++++++++++--------<br>
&gt;=C2=A0 =C2=A0...sion-from-1.76-to-1.75-in-Cargo.toml.patch |=C2=A0 29 -=
-<br>
&gt;=C2=A0 =C2=A0...<a href=3D"http://8.4.bb" rel=3D"noreferrer" target=3D"=
_blank">8.4.bb</a> =3D&gt; <a href=3D"http://python3-pydantic-core_2.21.0.b=
b" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-core_2.21.0.bb</a>=
} |=C2=A0 16 +-<br>
&gt;=C2=A0 =C2=A0...<a href=3D"http://tic_2.7.3.bb" rel=3D"noreferrer" targ=
et=3D"_blank">tic_2.7.3.bb</a> =3D&gt; <a href=3D"http://python3-pydantic_2=
.8.2.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.8.2.bb</a>=
} |=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0.../python/python3-tzdata/run-ptest=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +<br>
&gt;=C2=A0 =C2=A0.../python/<a href=3D"http://python3-tzdata_2024.1.bb" rel=
=3D"noreferrer" target=3D"_blank">python3-tzdata_2024.1.bb</a>=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 24 ++<br>
&gt;=C2=A0 =C2=A07 files changed, 198 insertions(+), 163 deletions(-)<br>
&gt;=C2=A0 =C2=A0delete mode 100644 meta-python/recipes-devtools/python/pyt=
hon3-pydantic-core/0001-Set-rust-version-from-1.76-to-1.75-in-Cargo.toml.pa=
tch<br>
&gt;=C2=A0 =C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"htt=
p://python3-pydantic-core_2.18.4.bb" rel=3D"noreferrer" target=3D"_blank">p=
ython3-pydantic-core_2.18.4.bb</a> =3D&gt; <a href=3D"http://python3-pydant=
ic-core_2.21.0.bb" rel=3D"noreferrer" target=3D"_blank">python3-pydantic-co=
re_2.21.0.bb</a>} (80%)<br>
&gt;=C2=A0 =C2=A0rename meta-python/recipes-devtools/python/{<a href=3D"htt=
p://python3-pydantic_2.7.3.bb" rel=3D"noreferrer" target=3D"_blank">python3=
-pydantic_2.7.3.bb</a> =3D&gt; <a href=3D"http://python3-pydantic_2.8.2.bb"=
 rel=3D"noreferrer" target=3D"_blank">python3-pydantic_2.8.2.bb</a>} (87%)<=
br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-python/recipes-devtools/python/pyt=
hon3-tzdata/run-ptest<br>
&gt;=C2=A0 =C2=A0create mode 100644 meta-python/recipes-devtools/python/<a =
href=3D"http://python3-tzdata_2024.1.bb" rel=3D"noreferrer" target=3D"_blan=
k">python3-tzdata_2024.1.bb</a><br>
&gt; <br>
<br>
<br>
<br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#111669): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/111669" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/111669</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/10779323=
7/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/107793237/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--000000000000b74b76061f31dac0--

