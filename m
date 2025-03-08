Return-Path: <rob.woolleywr@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B943C282EC
	for <webhook@archiver.kernel.org>; Sat,  8 Mar 2025 13:28:52 +0000 (UTC)
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
 by mx.groups.io with SMTP id smtpd.web11.8877.1741440531053124965
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 08 Mar 2025 05:28:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XotvsgWL;
 spf=pass (domain: gmail.com, ip: 209.85.219.180, mailfrom: rob.woolleywr@gmail.com)
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e6343c68b8fso2076028276.2
        for <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 05:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741440530; x=1742045330; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/zun5Bj588mDmbab5+0CyPQf500LDnscrot9At7CEmQ=;
        b=XotvsgWLwWFds2bAWUz48hrVYQxKF2EpCYW0IfoDrslm31RsZy09cN6aj3zS5hOFN+
         YDYaBAEkjSdWRhYr5V4nv9DXAIbNUSja2dLiSbqgTDM4BV0GxVcDUVCgP/sg6ex1yHY1
         tSGHJpzGakmZ8BKJaqIDOZXt+nJAlSfkx7trOmZoptpCAxC2Yy4MPnZj19ZWbTJjSpRe
         KxTLH7MVxKZ1Qw6VHivT+ZrwWwkGgy+2tAlLHt77yvW65E9FMRyl5kFx1d4NMLe3YSY7
         pXciq0S/27ubFwdkqPdltaNxAT9cINT7yz1y8xGQaRPkuN+43hk3SNdZfpFsgUkSDw66
         i4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741440530; x=1742045330;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/zun5Bj588mDmbab5+0CyPQf500LDnscrot9At7CEmQ=;
        b=UGbmj0kc8cDkcQSU1cdptimOLo/lsbpKnNgBltvHCHZOgeKXH7jVOHWSeF9whHYP2b
         r9BT4xIMknuzYwHBW6D8U2cFx9RQdGBoj7SNqx3D8hcbtGn5v7w9SgMj8+bWMWXYiQY0
         hQC/9CevP1OR57L8fFxYrnAD8t81dhwcGqk4s4a6Ppaqitpjew8t7s+mzm1yRmAkj71W
         8C3eN7BQmw7YWZZuPV3PP1HFYHfZjwF1LPqUrSMs+6xuSNkRFTL4ZXL5EVLGP/rd2xfA
         e4O6k+EPapwfrCaP+WbUTKal18MU5MkfFfZgFwDjDGaR/3ARscnigiMpjmxt9sJGh2PL
         DiFg==
X-Forwarded-Encrypted: i=1; AJvYcCUKM2XRjcK3LfkV6HIc+yfN+9ybrQ8zdvkIZfuB09fF+iogtPvUN58pbugliSQhbUJnE4huSUnj0RE0OvN6uyt4NxA=@lists.openembedded.org
X-Gm-Message-State: AOJu0YzQjXClQwmvPiwb8/Z1RalwzN7pbrjNUdm1P4dos/3vmX5/xFO7
	dknrPkt+up0Q2lg/OJq4KMN0PCMXcBhAU1nUlAs6pEwNbPCzMmA+7jF/cqBzbqc+3T9LR8eZKTl
	TnnuTDT3iMNtoIZ/dkqj2HOc6DWI=
X-Gm-Gg: ASbGnct/TV5mBg+X+uEVqSGFL83oNhqJkfleOwuG+A/zXAGJDUkMpkW5yYMyASqz8I4
	fB/XFIYdNWvUuChes5sV4vO+Vv0Nzd4rpxP3msPWYzwgPyuJbusUrNpLAP2P6/q8om/ldCuPjvi
	MtgcVnBbwqkZZLgKwgw2NUQqporfo=
X-Google-Smtp-Source: AGHT+IFaojJscXQraikETN4Z2BbluMX3+zwGPBkCkehAUJRhVIvuI1JNeh290jUGgJc8ZF71Jl28aYm54dnqbJZ3MJw=
X-Received: by 2002:a05:6902:705:b0:e63:5bdd:f46d with SMTP id
 3f1490d57ef6-e635c179cddmr8313178276.25.1741440529953; Sat, 08 Mar 2025
 05:28:49 -0800 (PST)
MIME-Version: 1.0
References: <CAGAhMBz9zz0K8Fnj__NkEVvbsD8SibEs=BKR8YFE9mv+mG6tsw@mail.gmail.com>
 <17fde519-38d7-4c44-8592-a0ff6efd56fe@balister.org> <CA+chaQdAgNa4V-c9B48CkLOAxYhGcc2bcmb=mUMqe2U+gFf+Hg@mail.gmail.com>
 <CAMKF1sprcWE99WFDtfF1SeMYzZ_M5RbkeJtN4DACTyyB0WKcwg@mail.gmail.com>
In-Reply-To: <CAMKF1sprcWE99WFDtfF1SeMYzZ_M5RbkeJtN4DACTyyB0WKcwg@mail.gmail.com>
From: Rob Woolley <rob.woolleywr@gmail.com>
Date: Sat, 8 Mar 2025 08:28:40 -0500
X-Gm-Features: AQ5f1JpC363LWfXe4Zu9eGk4_sE3qbCwlb5dE2mezdvuqPej5osQp_9cJgMhCto
Message-ID: <CAGAhMBzDoS9ihpnbFBW3wLmxCkxyO9fxgwZnfGBYWtd4OmGGzQ@mail.gmail.com>
Subject: Re: [oe] [meta-python] python3-scipy
To: Khem Raj <raj.khem@gmail.com>
Cc: martin.jansa@gmail.com, philip@balister.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000002f7d5f062fd4b84d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 08 Mar 2025 13:28:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115807

--0000000000002f7d5f062fd4b84d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I don't mind signing up to help maintain it in meta-python.  I need to make
sure they keep building either way.

I have some other Python recipes in meta-ros that are not specific to ROS
itself, that I'd prefer to maintain upstream.

Are new recipes allowed in meta-openembedded for all supported branches or
just the development release?

Regards,
Rob

On Fri, Mar 7, 2025 at 2:08=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:

> On Fri, Mar 7, 2025 at 10:55=E2=80=AFAM Martin Jansa via
> lists.openembedded.org <martin.jansa=3Dgmail.com@lists.openembedded.org>
> wrote:
> >
> > On Fri, Mar 7, 2025 at 7:38=E2=80=AFPM Philip Balister via
> > lists.openembedded.org <philip=3Dbalister.org@lists.openembedded.org>
> > wrote:
> > >
> > > On 3/6/25 1:07 PM, Rob Woolley via lists.openembedded.org wrote:
> > > > The meta-scipy layer was archived on Nov 30, 2023 (
> https://github.com/
> > > > tuxable-ltd/meta-scipy <https://github.com/tuxable-ltd/meta-scipy>)
> > > >
> > > > I need python3-scipy for some recipes in ROS 2 (notably pinocchio),
> so I
> > > > patched it up and got it building again:
> https://github.com/robwoolley/
> > > > meta-scipy <https://github.com/robwoolley/meta-scipy>
> > > >
> > > > I don't know the history behind why it was in a separate layer.
> Would
> > > > it be worth submitting to meta-python instead of resurrecting the
> meta-
> > > > scipy layer?
> > >
> > > I want to say because scipy needs fortran and that is not built by
> > > default. So world builds woul dneed to skip scipy unless fortran was
> > > enabled.
> > >
> > > Does this sound right?
> >
> > Which is the same as meta-oe/recipes-devtools/lapack/lapack_3.12.1.bb
> > which also depends on libgfortran and only has:
> > EXCLUDE_FROM_WORLD =3D "1"
> > and comment about how to enable fortran in gcc.
> >
> > Just depending on fortran shouldn't eliminate it from meta-python.
>
> I think, I will need someone to signup to maintain it there, there are
> changes always
> happening that will require fixing these packages, In the end it falls
> on my plate whenever
> there is a python upgrade in core or something else which breaks it,
>
> >
> > Cheers,
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#115798):
> https://lists.openembedded.org/g/openembedded-devel/message/115798
> > Mute This Topic: https://lists.openembedded.org/mt/111555507/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub =
[
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000002f7d5f062fd4b84d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I don&#39;t mind signing up to help maintain it in meta-py=
thon.=C2=A0 I need to make sure they keep building either way.<br><br>I hav=
e some other Python recipes in meta-ros that are not specific to ROS itself=
, that I&#39;d prefer to maintain upstream.<div><br></div><div>Are new reci=
pes allowed in meta-openembedded for all supported branches or just the dev=
elopment release?<br><br>Regards,<br>Rob</div></div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri,=
 Mar 7, 2025 at 2:08=E2=80=AFPM Khem Raj &lt;<a href=3D"mailto:raj.khem@gma=
il.com">raj.khem@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Fri, Mar 7, 2025 at 10:55=E2=80=AFAM Martin Ja=
nsa via<br>
<a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.openembedded.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.c=
om@lists.openembedded.org" target=3D"_blank">gmail.com@lists.openembedded.o=
rg</a>&gt;<br>
wrote:<br>
&gt;<br>
&gt; On Fri, Mar 7, 2025 at 7:38=E2=80=AFPM Philip Balister via<br>
&gt; <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> &lt;philip=3D<a href=3D"mailto:balister=
.org@lists.openembedded.org" target=3D"_blank">balister.org@lists.openembed=
ded.org</a>&gt;<br>
&gt; wrote:<br>
&gt; &gt;<br>
&gt; &gt; On 3/6/25 1:07 PM, Rob Woolley via <a href=3D"http://lists.openem=
bedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a>=
 wrote:<br>
&gt; &gt; &gt; The meta-scipy layer was archived on Nov 30, 2023 (<a href=
=3D"https://github.com/" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/</a><br>
&gt; &gt; &gt; tuxable-ltd/meta-scipy &lt;<a href=3D"https://github.com/tux=
able-ltd/meta-scipy" rel=3D"noreferrer" target=3D"_blank">https://github.co=
m/tuxable-ltd/meta-scipy</a>&gt;)<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I need python3-scipy for some recipes in ROS 2 (notably pino=
cchio), so I<br>
&gt; &gt; &gt; patched it up and got it building again: <a href=3D"https://=
github.com/robwoolley/" rel=3D"noreferrer" target=3D"_blank">https://github=
.com/robwoolley/</a><br>
&gt; &gt; &gt; meta-scipy &lt;<a href=3D"https://github.com/robwoolley/meta=
-scipy" rel=3D"noreferrer" target=3D"_blank">https://github.com/robwoolley/=
meta-scipy</a>&gt;<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I don&#39;t know the history behind why it was in a separate=
 layer.=C2=A0 Would<br>
&gt; &gt; &gt; it be worth submitting to meta-python instead of resurrectin=
g the meta-<br>
&gt; &gt; &gt; scipy layer?<br>
&gt; &gt;<br>
&gt; &gt; I want to say because scipy needs fortran and that is not built b=
y<br>
&gt; &gt; default. So world builds woul dneed to skip scipy unless fortran =
was<br>
&gt; &gt; enabled.<br>
&gt; &gt;<br>
&gt; &gt; Does this sound right?<br>
&gt;<br>
&gt; Which is the same as meta-oe/recipes-devtools/lapack/<a href=3D"http:/=
/lapack_3.12.1.bb" rel=3D"noreferrer" target=3D"_blank">lapack_3.12.1.bb</a=
><br>
&gt; which also depends on libgfortran and only has:<br>
&gt; EXCLUDE_FROM_WORLD =3D &quot;1&quot;<br>
&gt; and comment about how to enable fortran in gcc.<br>
&gt;<br>
&gt; Just depending on fortran shouldn&#39;t eliminate it from meta-python.=
<br>
<br>
I think, I will need someone to signup to maintain it there, there are<br>
changes always<br>
happening that will require fixing these packages, In the end it falls<br>
on my plate whenever<br>
there is a python upgrade in core or something else which breaks it,<br>
<br>
&gt;<br>
&gt; Cheers,<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#115798): <a href=3D"https://lists.openembedded.org=
/g/openembedded-devel/message/115798" rel=3D"noreferrer" target=3D"_blank">=
https://lists.openembedded.org/g/openembedded-devel/message/115798</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11155550=
7/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.=
org/mt/111555507/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-devel%2Bowner@lists.openem=
bedded.org" target=3D"_blank">openembedded-devel+owner@lists.openembedded.o=
rg</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
devel/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedde=
d.org/g/openembedded-devel/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com"=
 target=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div>

--0000000000002f7d5f062fd4b84d--

