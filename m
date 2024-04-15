Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F34AC4345F
	for <webhook@archiver.kernel.org>; Mon, 15 Apr 2024 15:20:58 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
 by mx.groups.io with SMTP id smtpd.web11.24121.1713194457929364908
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Apr 2024 08:20:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=elRcUVuY;
 spf=pass (domain: gmail.com, ip: 209.85.128.178, mailfrom: ticotimo@gmail.com)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-61aaf71c495so18003427b3.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 08:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713194457; x=1713799257; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4AIhzx7T4j1HaG04salp13Y/lJLm9WrB4Qxz6mUwcXA=;
        b=elRcUVuYz8/FTitP45pgejT9vcuaXxhmgKu/1N6qUUoUZbRugboVBs12pE+LAexur0
         IsqDfh37Wx6wW3VDS08idGlKttmum73ontIa7mixmOxnKC7FCn0nhecQdhaVcq+0F3Gx
         iSZRSkjXUATVQ33J+2uuwMUPyg92TMXUFYbESveJmW57ppLTw1pKfcQoPaQPXIxKKWBQ
         xTe4lT3pQ0e558X8SF2uBBUcUD62oAY5i9pN+9TtoPg3r3Z+rjZSZ57ohZIvjYKXrcq+
         fuFH85ABggHGPAbMllCa6wUjfPsmAPRJEIoXYHR+YSwjYwz4+IAaoPAUznoKSVWeSGSH
         wwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713194457; x=1713799257;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4AIhzx7T4j1HaG04salp13Y/lJLm9WrB4Qxz6mUwcXA=;
        b=Nh8WPs3Plm3LpEiQj7V1XCDG66gsShETcLZQ4DDcT7Te/VgVQwG93KYHXrvi/7olNQ
         v/FfSL+g4u5bCdgrueK6vycAbYmqwX1WkLOHhZ781VY1wmhS/FZFe7d04t7+CP4hOZeo
         3L35Fiaviu4H/f0a4qPwguDxBNUebK9Ls7oVS2GGeqrrkd87yq9YHxxCJOuh8HZO4/R2
         +sfgXLWJlGRYfTorBkbdl6UiBTYRXxitU+3pkoY6D2newrc2/lZ5LeCWfGlpuUKh88vL
         Uk8t4RpndIrB6c6J0ZNg/JS1KJNxOWkZYYDpJkUQny5wsIM3l9MEzFNF8ihvsDjnB8Z6
         vGdQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAw15uI5Py2dApfKPo6BftspfD0eV9hdNky7Ljn3kLSgB/fBLpKwRJAel0y3w9Kmi/QZUHSfsWLwHrkFOC4eVU0nYwqNUz1x2xdjFtwRJGYE9sBNeYWIB9Dw==
X-Gm-Message-State: AOJu0YyPodeE0F8iCHGcg5s9xzfLdPgJa5hfhNoG9g2k0s2DYmeTmWz/
	zpOVcOxdKUN83P+TRlQP2jEowiR0eoEz2w9ECeOx2rd+yBhsR7ETlXsDNnPXGwi5N8JbKHxc1j8
	abxjyPd76s1n2XKCNcUzEKSL/p9M=
X-Google-Smtp-Source: AGHT+IFDD55Wa6NUwDyzuoGm7fmbkVybnoqHTI6kZ9VSdgbjbSr4w9PEuUCvcF3eV1T9JLe7oysdB/IRTRQN0Ouyte4=
X-Received: by 2002:a81:b3c5:0:b0:618:7a0d:554a with SMTP id
 r188-20020a81b3c5000000b006187a0d554amr8817323ywh.2.1713194456957; Mon, 15
 Apr 2024 08:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240415131443.7295-1-marex@denx.de> <CANPvuR=KbhHUzs33CHSNut2Nx=fFLLu1NpMxYcJBM652DQ8bdQ@mail.gmail.com>
 <6153557a-8b52-4080-87c5-a427df64ba96@denx.de>
In-Reply-To: <6153557a-8b52-4080-87c5-a427df64ba96@denx.de>
From: Tim Orling <ticotimo@gmail.com>
Date: Mon, 15 Apr 2024 08:20:45 -0700
Message-ID: <CANx9H-Da+bFvX6ogKNCkjONkESMfw1T47ncc+a6-mDoYg4pWYQ@mail.gmail.com>
Subject: Re: [oe] [meta-python2][PATCH] layer.conf: update LAYERSERIES_COMPAT
 for scarthgap
To: marex@denx.de
Cc: Jose Quaresma <quaresma.jose@gmail.com>, Martin.Jansa@gmail.com, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000009cc290616242bb0"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 15 Apr 2024 15:20:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109964

--00000000000009cc290616242bb0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is a hard no from me.

On Mon, Apr 15, 2024 at 6:59=E2=80=AFAM Marek Vasut via lists.openembedded.=
org
<marex=3Ddenx.de@lists.openembedded.org> wrote:

> On 4/15/24 3:49 PM, Jose Quaresma wrote:
> > Hi Marek,
>
> Hi,
>
> > Last commit on this layer was done 2 years ago and it was at the time t=
o
> > add Kirkstone compatibility, nothing more since then.
> > Python 2 is dead since 1/1/2020. That means that we (python dev) will n=
ot
> > improve it anymore after that day,
> > even if someone finds a security problem in it. You should upgrade to
> > Python 3 as soon as you can.
> >
> > https://www.python.org/doc/sunset-python-2
> >
> > In my opinion the OE community should no longer promote its use.
>
> I am aware of this, for me this is just a band-aid to keep meta-qt5
> building for a while longer. I can work around this in bblayers.conf or
> local.conf too, I would like to avoid that however.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#109963):
> https://lists.openembedded.org/g/openembedded-devel/message/109963
> Mute This Topic: https://lists.openembedded.org/mt/105535514/924729
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> ticotimo@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000009cc290616242bb0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">This is a hard no from me.</div><div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 15, 2024 at 6:=
59=E2=80=AFAM Marek Vasut via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;marex=3D<a href=3D"mailto:denx.de@lists.openemb=
edded.org">denx.de@lists.openembedded.org</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-widt=
h:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(204,20=
4,204)">On 4/15/24 3:49 PM, Jose Quaresma wrote:<br>
&gt; Hi Marek,<br>
<br>
Hi,<br>
<br>
&gt; Last commit on this layer was done 2 years ago and it was at the time =
to<br>
&gt; add Kirkstone compatibility, nothing more since then.<br>
&gt; Python 2 is dead since 1/1/2020. That means that we (python dev) will =
not<br>
&gt; improve it anymore after that day,<br>
&gt; even if someone finds a security problem in it. You should upgrade to<=
br>
&gt; Python 3 as soon as you can.<br>
&gt; <br>
&gt; <a href=3D"https://www.python.org/doc/sunset-python-2" rel=3D"noreferr=
er" target=3D"_blank">https://www.python.org/doc/sunset-python-2</a><br>
&gt; <br>
&gt; In my opinion the OE community should no longer promote its use.<br>
<br>
I am aware of this, for me this is just a band-aid to keep meta-qt5 <br>
building for a while longer. I can work around this in bblayers.conf or <br=
>
local.conf too, I would like to avoid that however.<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#109963): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-devel/message/109963" rel=3D"noreferrer" target=3D"_blank">https=
://lists.openembedded.org/g/openembedded-devel/message/109963</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/105535514/924=
729" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/105535514/924729</a><br>
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

--00000000000009cc290616242bb0--

