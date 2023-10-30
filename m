Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BAF5C4167D
	for <webhook@archiver.kernel.org>; Mon, 30 Oct 2023 16:15:33 +0000 (UTC)
Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
 by mx.groups.io with SMTP id smtpd.web10.153349.1698682530416471618
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 30 Oct 2023 09:15:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fV4subvE;
 spf=pass (domain: gmail.com, ip: 209.85.160.53, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-1e0ee4e777bso3155601fac.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 09:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698682529; x=1699287329; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7SeFMd0BbxStyL7DNM55g8De+TNFTzdI8gIrgX0y6WU=;
        b=fV4subvEcymywg7BmYl6fZiEYhRv7XspQJysmDgMuvS6XyL+D5ZyJ0IYEeM+8YgusZ
         ZMXPYbSkVTF7hO9LuJzcAqaQO6UjA31UqKCHRtNJbf+mJOj8BCeqjD+bBtDAjYVV3RGz
         wTxCZ5JJQ4bEVoE+rpeM4P1m+8zTuSoMlqYQhulBDJeoA3kAq6gaO5MSZw5Pfaf9YUDo
         c2uKjNiKFhKuApJxzzxH/RvuD5ydPyhSQjtQbdF0T+PfIwloW6UStZIYLrfvD3krn6hD
         zUVFR8bEXLiZI5k0jdBwlxBvT9yqdlO9ANgmVCiNj4h+yfyD77wgk1uKEY0+bRADhY3c
         R1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698682529; x=1699287329;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7SeFMd0BbxStyL7DNM55g8De+TNFTzdI8gIrgX0y6WU=;
        b=bvx7UTQz2ehxJmcPnvhZ34Sc+tGHDT9jk3U8dKv2BHMv84NCIdxzdD1bYOwP1eJL5v
         t4R/VOS/RSGtmv0rGb96TSlNxh1/vST2ZhptBFEQMPYrztAl+jJgCSKpVjeQisJpi0Ru
         D5FWf/LdEDU1KkdvDX2TPAC7J/a3J9co6IFtYnmenGNILzjXX8gcH2qxHAf3gagtARl3
         k4rZTzCReH5vmRnHdz7Ee/HDkCMRZClG2iToUj98Jm1rfrUgYytL7G6xtPKu6fFkXF2o
         wIu98rGHke0+Wa5rf7/HA1go2xopkKP6z2SJ8zYEuobkee03Eudix3vmQKu/py3l8zNb
         1ylg==
X-Gm-Message-State: AOJu0YwbDEToC4hiUzQYVb6F1+L/4/w3Z4Fc/JaPPsWsLxNIJxV41l83
	bxvSU+M87uraC1wi69Js/PCvriIKJ9+7gKQBWII=
X-Google-Smtp-Source: AGHT+IHdL4wqeSn7HRnQ5NFAJDiS8saop1w2NV0m56mHO0B99K54x3Nr1Wr7F0aC6PGUukWGXslsZeyhwrQOwn38cxs=
X-Received: by 2002:a05:6871:7893:b0:1ef:b591:5733 with SMTP id
 oz19-20020a056871789300b001efb5915733mr5883999oac.15.1698682529632; Mon, 30
 Oct 2023 09:15:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230507163305.3261044-1-akuster808@gmail.com>
 <20230507163305.3261044-8-akuster808@gmail.com> <CAD2FfiEvMk+zQSK0db+nP4wNNp74igf3fP861w-oY-R-UH+oGA@mail.gmail.com>
In-Reply-To: <CAD2FfiEvMk+zQSK0db+nP4wNNp74igf3fP861w-oY-R-UH+oGA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 30 Oct 2023 09:15:18 -0700
Message-ID: <CAMKF1sqN2qnm9yZfF6fnf3mX101qQpB-mT9PzN8DxVvGeZq2Dg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][mickledore][PATCH 08/29] fwupd: Do not emit build
 time paths into generated headers
To: Richard Hughes <hughsient@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000c3d7c50608f15866"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 30 Oct 2023 16:15:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105795

--000000000000c3d7c50608f15866
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 30, 2023 at 4:31 AM Richard Hughes <hughsient@gmail.com> wrote:

> On Sun, 7 May 2023 at 17:33, Armin Kuster <akuster808@gmail.com> wrote:
> > Fixes
> > WARNING: fwupd-1.8.9-r0 do_package_qa: QA Issue: File
> /usr/src/debug/fwupd/1.8.9-r0/src/fu-plugin-builtin.h in package fwupd-src
> contains reference to TMPDIR [buildpaths]
> > +Upstream-Status: Pending
>
> Pending?



Pending is a tracking status for OE it does not mean that we are expecting
someone for
 Package community to take action that will be of it was in Submitted state
which means someone from OE community or others have submitted it for
review upstream

Did anyone send this to upstream, either as a pull request or
> as a fire-and-forget email?


Understand that this is a downstream distro and we will have a small delta
always to support use cases we encounter which may not be of importance for
upstream. While some are fire and forget some are not

Someone pointed me to this patch today and
> it's the first time I've even seen it. I've created a PR here:
> https://github.com/fwupd/fwupd/pull/6297


Thanks for doing it

<https://github.com/fwupd/fwupd/pull/6297>
>
> Richard
>

--000000000000c3d7c50608f15866
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Mon, Oct 30, 2023 at 4:31 AM Richard Hughes &lt;<a href=
=3D"mailto:hughsient@gmail.com">hughsient@gmail.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On Sun, 7 May 2023 at 17:33, Armin Kuster &=
lt;<a href=3D"mailto:akuster808@gmail.com" target=3D"_blank">akuster808@gma=
il.com</a>&gt; wrote:<br>
&gt; Fixes<br>
&gt; WARNING: fwupd-1.8.9-r0 do_package_qa: QA Issue: File /usr/src/debug/f=
wupd/1.8.9-r0/src/fu-plugin-builtin.h in package fwupd-src contains referen=
ce to TMPDIR [buildpaths]<br>
&gt; +Upstream-Status: Pending<br>
<br>
Pending?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto"><br></di=
v><div dir=3D"auto">Pending is a tracking status for OE it does not mean th=
at we are expecting someone for</div><div dir=3D"auto">=C2=A0Package commun=
ity to take action that will be of it was in Submitted state which means so=
meone from OE community or others have submitted it for review upstream</di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"> =
Did anyone send this to upstream, either as a pull request or<br>
as a fire-and-forget email?</blockquote><div dir=3D"auto"><br></div><div di=
r=3D"auto">Understand that this is a downstream distro and we will have a s=
mall delta always to support use cases we encounter which may not be of imp=
ortance for upstream. While some are fire and forget some are not=C2=A0</di=
v><div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"> =
Someone pointed me to this patch today and<br>
it&#39;s the first time I&#39;ve even seen it. I&#39;ve created a PR here:<=
br>
<a href=3D"https://github.com/fwupd/fwupd/pull/6297" rel=3D"noreferrer" tar=
get=3D"_blank">https://github.com/fwupd/fwupd/pull/6297</a></blockquote><di=
v dir=3D"auto"><br></div><div dir=3D"auto">Thanks for doing it=C2=A0</div><=
div dir=3D"auto"><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex" dir=3D"auto"><a h=
ref=3D"https://github.com/fwupd/fwupd/pull/6297" rel=3D"noreferrer" target=
=3D"_blank"></a><br>
<br>
Richard<br>
</blockquote></div></div>

--000000000000c3d7c50608f15866--

