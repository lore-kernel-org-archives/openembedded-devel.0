Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9CA3C4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 11:10:29 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.40391.1670843425652578884
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 12 Dec 2022 03:10:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BUxO0TZ6;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id h11so11654663wrw.13
        for <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 03:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pDE8ldW1wLJ4zxbRo3B/wNoyJdueS9NEEoc5OyDQJmw=;
        b=BUxO0TZ6Y0gsayUjpOqjbZWo55eYSlSwl3pvvLQ4KFr9GMr5hFmkRim9B4tZCBwwLF
         wWPy57gDdLvEmWL9LONbVFxwJ9FOKQ9HbYssP5cI/y8/tD3MefCjGcyTQUQwApnx9ow+
         uczjiS1m2xVw0LB9P1ryUn3OIefvuAPrHgYM9ETzu1jrPaKAD39p9EE7GW61vZNETIET
         WVyeojEMdC1LyctgQxNMCAS8Ee6uv6BLtkOt6dIw201oyU96Dp0B164R/qlHNkA2CMik
         H07HGe4HHd4QOQmxaDcKXB6BjZL3Ku0k9kgEntyQxiOX8/nLuB8FY2B/FSi36BXryjSP
         i8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pDE8ldW1wLJ4zxbRo3B/wNoyJdueS9NEEoc5OyDQJmw=;
        b=3jpCaYMDwFsvMCgWVp5cZPirHdchBaejBAuzGhdBGfTBB+xhdpOYWG1+71Plw9hw38
         19ZcoJE/qmcuYJIXVDXQJsS6dI2ue5yOcCJYsfrz1YLasmxYc3/ql08whUi+ca6/xYdM
         Wgv98wo+ZKcfLsAx2jVufJbk3ZANN2eplTPantkDyvxzJXbfjsx7cVkdb2NjPRrzrRwZ
         kLevXpq3oLvha697fbiL8aKcfJK498lvvznGhhmWTng3wV5+l+MfyJk+/X7eRBAJ+Vie
         aUfz4JbJOWU7LdxTQAf6N+LmvmdBBwUY2ldn0v0w2WySB726G7q/US5+rkpkS239LZJe
         4ygA==
X-Gm-Message-State: ANoB5pn/5azuXNi3UtNpAlYtdv5M5bxuuJYqCiwgb36WLK4y9bwVs8pz
	JRKpT16Vlkkc/KIlegTIMExMvEHUm6cKxzYA8Do=
X-Google-Smtp-Source: AA0mqf7VzDKs9wxPVdiOrn8PzDJSL+7jX7+4mUrfG1dPjxD+VDyCGAWWxKkk94yrM16/QZLQKSZ+qR7K+quFKshmG3k=
X-Received: by 2002:adf:ff88:0:b0:242:4a32:900e with SMTP id
 j8-20020adfff88000000b002424a32900emr14290900wrr.129.1670843424008; Mon, 12
 Dec 2022 03:10:24 -0800 (PST)
MIME-Version: 1.0
References: <20221118182718.2548901-1-archana.polampalli@windriver.com>
 <CA+chaQeUgwE0kPWymzP7C4pupbOYHfKH3SG13KoaPbt8eX3KxA@mail.gmail.com>
 <f0a3b575-dfc2-829f-6100-9e1eaedf0be5@windriver.com> <CA+chaQcyKNdkqmBFwr15m9u+EhAKP75p56=261SL_1G-vNRbDw@mail.gmail.com>
 <b10b1591-933f-0ac3-07bb-d80a490ddd1d@gmail.com>
In-Reply-To: <b10b1591-933f-0ac3-07bb-d80a490ddd1d@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 12 Dec 2022 12:10:12 +0100
Message-ID: <CA+chaQdaOOKGy=VpN6kR_EeJMQL=cvzrTmzBWB2tNeWfLKej_A@mail.gmail.com>
Subject: Re: [oe][meta-oe][kirkstone][PATCH 1/1] Nodejs - Upgrade to 16.18.1
To: akuster808 <akuster808@gmail.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, 
	"Polampalli, Archana" <archana.polampalli@windriver.com>, 
	openembedded-devel@lists.openembedded.org, hari.gpillai@windriver.com
Content-Type: multipart/alternative; boundary="000000000000c3700905ef9f8c26"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 12 Dec 2022 11:10:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100060

--000000000000c3700905ef9f8c26
Content-Type: text/plain; charset="UTF-8"

On Sat, Nov 26, 2022 at 5:05 PM akuster808 <akuster808@gmail.com> wrote:

>
>
> On 11/24/22 2:18 PM, Martin Jansa wrote:
> > On Thu, Nov 24, 2022 at 7:06 PM Randy MacLeod
> > <randy.macleod@windriver.com> wrote:
> >
> >     Add Armin to ensure he seems this once he recovers from US
> >     Thanksgiving indulgences.
> >
> >     On 2022-11-24 12:05, Martin Jansa wrote:
> >>     I see this is now queued in kirkstone-next
> >>
> https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&id=08b6b6846a84d9a0459f42d1d730c9ea1d50c43f
> >>     <
> https://urldefense.com/v3/__https://git.openembedded.org/meta-openembedded/commit/?h=kirkstone-next&id=08b6b6846a84d9a0459f42d1d730c9ea1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDWE$
> >
> >>
> >>     I see bunch of recipes failing since this upgrade landed in
> >>     master, mostly due to npm dependency resolution being more strict
> >>     now and builds failing with
> >>
> >>     npm ERR! code ERESOLVE
> >>     npm ERR! ERESOLVE could not resolve
> >>     ...
> >>     npm ERR! Fix the upstream dependency conflict, or retry
> >>     npm ERR! this command with --force, or --legacy-peer-deps
> >>     npm ERR! to accept an incorrect (and potentially broken)
> >>     dependency resolution.
> >>
> >>     Can we please delay backporting to kirkstone and langdale a bit
> more?
> >
> >     Seconded!
> >
>
> Noted. will remove from kirkstone-next
> -armin


I've tested my work arounds for both kinds of build failures I've mentioned
here and it seems to work fine.

Nobody else reported seeing similar failures in this thread, so it might be
less wide spread than what I've seen in our internal LGE layers (or other
people aren't testing their builds against master often enough, which is
their problem and shouldn't block this).

I'm no longer against getting this merged in langdale and kirkstone.

--000000000000c3700905ef9f8c26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Nov 26, 2022 at 5:05 PM akuster80=
8 &lt;<a href=3D"mailto:akuster808@gmail.com">akuster808@gmail.com</a>&gt; =
wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex"><br>
<br>
On 11/24/22 2:18 PM, Martin Jansa wrote:<br>
&gt; On Thu, Nov 24, 2022 at 7:06 PM Randy MacLeod <br>
&gt; &lt;<a href=3D"mailto:randy.macleod@windriver.com" target=3D"_blank">r=
andy.macleod@windriver.com</a>&gt; wrote:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Add Armin to ensure he seems this once he recovers =
from US<br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanksgiving indulgences.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0On 2022-11-24 12:05, Martin Jansa wrote:<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0I see this is now queued in kirkstone-next<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://git.openembedded.org/meta-op=
enembedded/commit/?h=3Dkirkstone-next&amp;id=3D08b6b6846a84d9a0459f42d1d730=
c9ea1d50c43f" rel=3D"noreferrer" target=3D"_blank">https://git.openembedded=
.org/meta-openembedded/commit/?h=3Dkirkstone-next&amp;id=3D08b6b6846a84d9a0=
459f42d1d730c9ea1d50c43f</a><br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://urldefense.com/v3/__http=
s://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-next&amp;i=
d=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eo=
ea7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyD=
WE$" rel=3D"noreferrer" target=3D"_blank">https://urldefense.com/v3/__https=
://git.openembedded.org/meta-openembedded/commit/?h=3Dkirkstone-next&amp;id=
=3D08b6b6846a84d9a0459f42d1d730c9ea1d50c43f__;!!AjveYdw8EvQ!bcx80wmigop8Eoe=
a7TohEOVlX1wPfDp0MAiO-8lZQDzv5nw5ai-FPfVsVaCxBstk-GtvN-eKnWtaUipHYjAMDDlyDW=
E$</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0I see bunch of recipes failing since this upgra=
de landed in<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0master, mostly due to npm dependency resolution=
 being more strict<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0now and builds failing with<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0npm ERR! code ERESOLVE<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0npm ERR! ERESOLVE could not resolve<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0...<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0npm ERR! Fix the upstream dependency conflict, =
or retry<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0npm ERR! this command with --force, or --legacy=
-peer-deps<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0npm ERR! to accept an incorrect (and potentiall=
y broken)<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0dependency resolution.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0Can we please delay backporting to kirkstone an=
d langdale a bit more?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0Seconded!<br>
&gt;<br>
<br>
Noted. will remove from kirkstone-next<br>
-armin</blockquote><div><br></div><div>I&#39;ve tested my work arounds for =
both kinds of build failures I&#39;ve mentioned here and it seems to work f=
ine.</div><div><br></div><div>Nobody else reported seeing similar failures =
in this thread, so it might be less wide spread than what I&#39;ve seen in =
our internal LGE layers (or other people aren&#39;t testing their builds ag=
ainst master often enough, which is their problem and shouldn&#39;t block t=
his).</div><div><br></div><div>I&#39;m no longer against getting this merge=
d in langdale and kirkstone.</div></div></div>

--000000000000c3700905ef9f8c26--

