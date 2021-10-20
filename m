Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE01BC433F5
	for <webhook@archiver.kernel.org>; Wed, 20 Oct 2021 17:34:54 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com
 [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.web08.599.1634751294130798947
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:34:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T/Y+M7Ef;
 spf=pass (domain: gmail.com, ip: 209.85.222.54,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id h4so8184340uaw.1
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 20 Oct 2021 10:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OC15nNDsIAEhRXxuGDsPvQHRsYdtOPL9bK6EFLNlH2s=;
        b=T/Y+M7EfiWNHb8F/sBqmSUCHPEziKAuSYhjX++PbGCV1qIMuQGtfmLaaYSJ87cf3Yy
         DCRvNGGZHGelAnnxcUxRztfqO/AgAex06MN6u0rGv26CJH920B4MZEa+EoKyX7yJoemu
         KqbQ9XbkK/ETxBlKEtu0PdFaBpS+lY0ve+df/YANDru+2QvgAVYNG5MIS0bLi3UCTpWl
         2TMEMRPMQMA7Hp/AVvxQQlKslZshVVMRWPXodrhWpR1MAMc9i4n3opCV3riuGdJqxgq/
         +Vb3ruQgjlqNkI0sKYcmSiwWdTHjQqTnwE8Flfhbw8eI4LEx38blU0Eut7hCMD8AeUC0
         rrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OC15nNDsIAEhRXxuGDsPvQHRsYdtOPL9bK6EFLNlH2s=;
        b=JpZ+L1+4A8lNMFyPjW64hzFuWGtgbciG0udcNmwfb63E2OX1qnbrc4TssjmDaAaQ8D
         xTIoG7Krdg2RBcoaVLyrbmnf+6eizdZ2Xo/4w3JjdSehW6SbiGEvofJY8c1jYntPKlu5
         1bpy8K3dLhWZbW3bTxu0+YFEVm3tso4Nw+JLytB86DA+1ZYYa64Us+BWXcue+obMgftC
         htYp99qCjuH5BfcPObXMFDNoTJUgbSb9hRviwYgXLlGIqdABYiRi+UXLgEtYK3S1UtQK
         QodNJ1DdsEI0fQmRHuDJtGMLGhPUDN/FbmqcLQxrMZDWUosKPfKjjB0mAKdKQHZlcTNs
         ZM2g==
X-Gm-Message-State: AOAM533j+BDZHkdXXtgBSV8FvLLttHCzF9IV2Hz2wRvQzuhu6nucFRmj
	bBaGT4qvuo7JKuo4YfJ9JIl+B+qUpXDX0OcrBhI=
X-Google-Smtp-Source: 
 ABdhPJzhke/v9HbbS5BWJUko+QQxNSnyqUYBoPHqjc9lZpd0MnqcaPesSnGVPcyaJMhDFdB/Z/Pt6OKm40qI+jX6qmU=
X-Received: by 2002:a05:6102:951:: with SMTP id
 a17mr351040vsi.18.1634751293300;
 Wed, 20 Oct 2021 10:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20211011184140.653609-1-alex@linutronix.de>
 <20211011184140.653609-23-alex@linutronix.de>
 <CA+chaQeHXgVqBmjRBFNsZGYoz076q4MHwEfMPCzbmO-ScUgsSQ@mail.gmail.com>
 <CAMKF1spoVQEQB9CAs+g0_n6pYx4gJ0kPjuiLTEM6-XMhpqKwNQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1spoVQEQB9CAs+g0_n6pYx4gJ0kPjuiLTEM6-XMhpqKwNQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 20 Oct 2021 19:34:41 +0200
Message-ID: 
 <CANNYZj_ft=0XFD0x3NAxXyg5rBiPXu8HohoXR=NGQcJk1kheGw@mail.gmail.com>
Subject: Re: [oe] [PATCH 23/24] luaposix: update 33.4.0 -> 35.1
To: Khem Raj <raj.khem@gmail.com>, Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000022267805cecc325d"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 20 Oct 2021 17:34:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93499

--00000000000022267805cecc325d
Content-Type: text/plain; charset="UTF-8"

How about we replace Khem's patch with mine then?

Alex

On Wed, 20 Oct 2021 at 19:30, Khem Raj <raj.khem@gmail.com> wrote:

> On Wed, Oct 20, 2021 at 9:47 AM Martin Jansa <Martin.Jansa@gmail.com>
> wrote:
> >
> > On Mon, Oct 11, 2021 at 8:42 PM Alexander Kanavin <
> alex.kanavin@gmail.com> wrote:
> >>
> >> Drop autotools/makefile patch and change the build system to luke,
> >> as upstream uses that now.
> >
> >
> > Any idea why it fails?
> >
> > luaposix/35.1-r0/git$ build-aux/luke
> > luke: fatal: required symbol 'crypt' not found in any of libc, libcrypt
> >
> > I already have a fix from Khem:
> >
> https://git.openembedded.org/meta-openembedded/commit/?id=60d4e95b4ba3c42e70e321af4c30b5767bcf564b
> >
> > but it doesn't seem enough.
>
> yes, its on list of failures still. I can see it happen when building
> for qemuarm, luke is a native tool and its perhaps mixing libcrypt
> coming from libc or libxcrrypt on some hosts.
> and cant find it reliably.
>
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#93483):
> https://lists.openembedded.org/g/openembedded-devel/message/93483
> > Mute This Topic: https://lists.openembedded.org/mt/86244775/1997914
> > Group Owner: openembedded-devel+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [
> raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--00000000000022267805cecc325d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>How about we replace Khem&#39;s patch with mine then?=
</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 20 Oct 2021 at 19:30, Khem =
Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Oct=
 20, 2021 at 9:47 AM Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.=
com" target=3D"_blank">Martin.Jansa@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Oct 11, 2021 at 8:42 PM Alexander Kanavin &lt;<a href=3D"mailt=
o:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; =
wrote:<br>
&gt;&gt;<br>
&gt;&gt; Drop autotools/makefile patch and change the build system to luke,=
<br>
&gt;&gt; as upstream uses that now.<br>
&gt;<br>
&gt;<br>
&gt; Any idea why it fails?<br>
&gt;<br>
&gt; luaposix/35.1-r0/git$ build-aux/luke<br>
&gt; luke: fatal: required symbol &#39;crypt&#39; not found in any of libc,=
 libcrypt<br>
&gt;<br>
&gt; I already have a fix from Khem:<br>
&gt; <a href=3D"https://git.openembedded.org/meta-openembedded/commit/?id=
=3D60d4e95b4ba3c42e70e321af4c30b5767bcf564b" rel=3D"noreferrer" target=3D"_=
blank">https://git.openembedded.org/meta-openembedded/commit/?id=3D60d4e95b=
4ba3c42e70e321af4c30b5767bcf564b</a><br>
&gt;<br>
&gt; but it doesn&#39;t seem enough.<br>
<br>
yes, its on list of failures still. I can see it happen when building<br>
for qemuarm, luke is a native tool and its perhaps mixing libcrypt<br>
coming from libc or libxcrrypt on some hosts.<br>
and cant find it reliably.<br>
<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#93483): <a href=3D"https://lists.openembedded.org/=
g/openembedded-devel/message/93483" rel=3D"noreferrer" target=3D"_blank">ht=
tps://lists.openembedded.org/g/openembedded-devel/message/93483</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86244775=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86244775/1997914</a><br>
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

--00000000000022267805cecc325d--

