Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A4DAC433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 12:19:24 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com
 [209.85.222.41])
 by mx.groups.io with SMTP id smtpd.web10.43210.1635769163206330356
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 05:19:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=P64J/zv4;
 spf=pass (domain: gmail.com, ip: 209.85.222.41,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f41.google.com with SMTP id e2so31412151uax.7
        for <openembedded-devel@lists.openembedded.org>;
 Mon, 01 Nov 2021 05:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W4cvOPdIvy4FizrlPyGRQLyebHXSOysB0pkr27hSK2U=;
        b=P64J/zv4svSC/ZK3LBSqLAUTr/16cJnNepTbcvZZyTiYrJLfqSzdqfZ1b1znpBGpGu
         95OnPaXu1xf4ZoFJqzMIRFHthd9b3rbUx39noqxhqd8+4Fj2ojRa/7uzeo04p6Ofmk2Q
         ZKcltNSW3iDC+K7t5uPmh7gsPR6yWyILZr/X07rDnFEtNc520k4PGo2r+B1EUrnE+Qcv
         LGB8YBSzML8fSlYCKSfr4InMbKkUPhWzO5fEzgRY/5I9KPk1baKMlIUBvnnDH+feDhW0
         6T5JiNUdmSfcl6hOjIFJmy4QKKungpSqtoe4q4OZvCElJt3WbecUsPcdQa3LiwDpOZMB
         Dt/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4cvOPdIvy4FizrlPyGRQLyebHXSOysB0pkr27hSK2U=;
        b=MiFfDz4a0Z1uI0DdikKym7q4FvjgLKSqd+k6mPni69sGrFCxg9Z55pbXXXVxhlHrto
         2RF1h644RanNPP0QjG1lXymQnMZsAdqrF2NaTvM15KeXSFqW0jmlac6FcwjgoZhGWHXE
         2h3kvDUQD2bGYEWR77fd6mrkGVLPJ1TgC0u/XVddokfzIsrhqFkZnnj5Dm2+NNQ4UeqY
         v7RZHyqD+H1W2HL8q099JpYWl6+viozCmYFF/0pY/Mn4x5oEPEv1xads+W/kOpqUU0sx
         aKinqEtm/H1nUFAS6HuDkiMHp4tZijOZjl3nj9sdVwyv/5XhCuHzvY2+rCXPbgyw8LBL
         aIAA==
X-Gm-Message-State: AOAM532HISWE7y6SWBkH7hVJ7PBk160y3GOuFYXwQeA9/eNqTOZ2cGrA
	/J8tEDpiJsU+JOOyWlA7Dfb2y+wSp53iCeDvaII=
X-Google-Smtp-Source: 
 ABdhPJy33HFiTrCiV1wwvrO7/OQRx4c+PHTt3wJ5eWauaqJjUOdXSxOrWNE1ph2HfQNrfXLydjYvHpCqZ7xYTfBCAL0=
X-Received: by 2002:a67:f48d:: with SMTP id o13mr27439006vsn.18.1635769162294;
 Mon, 01 Nov 2021 05:19:22 -0700 (PDT)
MIME-Version: 1.0
References: <20211101114934.3646836-1-schnitzeltony@gmail.com>
 <20211101114934.3646836-12-schnitzeltony@gmail.com>
 <CANNYZj940v8Kruz72p2oM64A8aqwZGmZ=WBKj9Df6M_i0opG8g@mail.gmail.com>
 <CALbNGRRy3RtxQ7SnoGZKQRe8BPTVkQDDe_ForqkZz_VFObQxtQ@mail.gmail.com>
In-Reply-To: 
 <CALbNGRRy3RtxQ7SnoGZKQRe8BPTVkQDDe_ForqkZz_VFObQxtQ@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 1 Nov 2021 13:19:11 +0100
Message-ID: 
 <CANNYZj8ajZ=ijRGWBPN7fZwZVvgTeTmnuMSJkKE6szdoJYuYnw@mail.gmail.com>
Subject: Re: [oe] [meta-gnome++][PATCH 11/31] gtk4: initial add 4.4.0
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000da67e705cfb92fc1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 12:19:24 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93740

--000000000000da67e705cfb92fc1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

That also depends on whether gtk5 will be better at API compatibility, I
just don't want to carry those awkward version suffixes forever. Python3 is
annoying enough. Upstream dropping the '+' looks like a good chance to drop
the version too.

Perhaps the recipe could be named gtk and have PROVIDES =3D "gtk4" in it.

Alex

On Mon, 1 Nov 2021 at 13:07, Andreas M=C3=BCller <schnitzeltony@gmail.com> =
wrote:

> On Mon, Nov 1, 2021 at 12:51 PM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Can you please name this one simply 'gtk'? There's no reason to append =
4
> in there.
> >
> > Alex
> >
> Did this to make the difference clear and to be prepared once they
> invent gtk5. What do others think?
>
> Andreas
>

--000000000000da67e705cfb92fc1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That also depends on whether gtk5 will be better at A=
PI compatibility, I just don&#39;t want to carry those awkward version suff=
ixes forever. Python3 is annoying enough. Upstream dropping the &#39;+&#39;=
 looks like a good chance to drop the version too.<br></div><div><br></div>=
<div>Perhaps the recipe could be named gtk and have PROVIDES =3D &quot;gtk4=
&quot; in it.<br></div><div><br></div><div>Alex<br></div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, 1 Nov 2021=
 at 13:07, Andreas M=C3=BCller &lt;<a href=3D"mailto:schnitzeltony@gmail.co=
m">schnitzeltony@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">On Mon, Nov 1, 2021 at 12:51 PM Alexander Kanavin=
<br>
&lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavi=
n@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Can you please name this one simply &#39;gtk&#39;? There&#39;s no reas=
on to append 4 in there.<br>
&gt;<br>
&gt; Alex<br>
&gt;<br>
Did this to make the difference clear and to be prepared once they<br>
invent gtk5. What do others think?<br>
<br>
Andreas<br>
</blockquote></div>

--000000000000da67e705cfb92fc1--

