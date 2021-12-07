Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4B2C433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 13:33:33 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.66939.1638884012470262800
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:33:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=oC+IDb3j;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id l24so26612404uak.2
        for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Dec 2021 05:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=znF2v7CPbah8p8OqKWISiaUzI4o6GJneT9AMY1uJx0Y=;
        b=oC+IDb3j4yVbvxBPw/etI5GbX+5N7qz72LEnoJ2ygsy0h+0I5vE/kZpM+itKeZnFBw
         fbedxeu6ASVJ8fSaWrXkhRL6bYPnasmdNF7SPB94VhuwIkaGrDucDpLt9D1zM58Quko+
         yO4AlfmWU/09/BEGPdzuD5ldwl29f+gPOIsdj2/w+xvmxylfaPam32jFvyijVTA4NO8p
         26+FPFr6p0o9R06p0/0IcjenGIuQILO5IYVmYqFSHxwkuXcfva5wozcz4XPeBYa/zELr
         0r5IEJnTjcJ7cKkj4pWcp69IiBzFfaiRJtcjmj7QH0wQu9B7ye8ml/ZTkT5vCepwHHjy
         DVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=znF2v7CPbah8p8OqKWISiaUzI4o6GJneT9AMY1uJx0Y=;
        b=LtDUshL8HHqikww6Kw0O0bHuvQZhMR3qzNGM1IKYtf/ndWp0XxP4NqbhcCkfpkIH+x
         7YmKpBuPHWlEOszbfMcJPHZ2VkMgSVK8CAW3+rZv+OfG/zYzd/kqL988jMJ4Gx12p7tG
         BV+K7ejOldtX1BXK6IwEzX9Yt6zXtOBIzS8yrMeqiqlHWQy+VVFbDPUijwA4m7vu55LC
         sUVcc1JOUCMU2qER+5MRo/K6DzmyhEDU7zhUuJbOoChqK2J7qqTWeGqe6q9UfZ907767
         G+QHcC+8F6NAwJC6YAujqOfYJ5/PWqqksg9VW5xWq6iaHZYXrKfM3OypadARehW1QdRr
         RoeA==
X-Gm-Message-State: AOAM531q3GuP2ynHyHuB4T6cisC0VoTgt7Otk5KEkvf2IjT3AkHCbqs9
	Uzl1DMJaRs8TrgZ0vnPvuvdO8r4BnyIDzu3KQAM=
X-Google-Smtp-Source: 
 ABdhPJy4XqImNJ+zKXKXGlYm+paJFvb1cwr/RKsvoohD4kgvxJuLdQ022sr0mrJulJ+fADumfVuTZERMsKZ+5ek2Cww=
X-Received: by 2002:a67:7105:: with SMTP id m5mr45641320vsc.81.1638884011571;
 Tue, 07 Dec 2021 05:33:31 -0800 (PST)
MIME-Version: 1.0
References: <20211207113954.8959-1-marex@denx.de>
 <CA+chaQdiPbPXXOdw7PBfivuvw-fXZYeBAvDQM2NGL7h_Gr0ULQ@mail.gmail.com>
 <4a4bd8ca-9fae-c03a-acf1-d25fc44a84dd@denx.de>
 <CANNYZj-w7xB2r-FvXKbj88CNO5ibxnF1MfmN2z+p-j+_-HNLvg@mail.gmail.com>
 <d2604e80-3f82-d955-f0d0-620bea1ecbb0@denx.de>
In-Reply-To: <d2604e80-3f82-d955-f0d0-620bea1ecbb0@denx.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 7 Dec 2021 14:33:20 +0100
Message-ID: 
 <CANNYZj95pzj8Q85BfbFim=h+rvPW86-Wm=Bqh=+j+JKBmWnf3g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] freerdp: Use DEPENDS:append
To: Marek Vasut <marex@denx.de>
Cc: Konrad Weihmann <kweihmann@outlook.com>,
 Martin Jansa <martin.jansa@gmail.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
 Khem Raj <raj.khem@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000567bd505d28e6b85"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 07 Dec 2021 13:33:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94234

--000000000000567bd505d28e6b85
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Dec 2021 at 14:27, Marek Vasut <marex@denx.de> wrote:

> >> And as far as I can tell, bitbake can stick something into DEPENDS
> >> before it parses this recipe, so the :append is valid.
> >>
> >> Furthermore, git grep through oe-core already indicates a few recipes
> >> which use DEPENDS:append.
>
> I believe the warning is valid, see above ?
>

The linter is an obsessive pedant, and is not actually always right, that's
why I want its author to comment :)
'DEPENDS = ... ' is used throughout all layers, and doesn't seem to cause
much grief, so why fix it here specifically, is there an actual issue?

Alex

--000000000000567bd505d28e6b85
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Tue, 7 Dec 2021 at 14:27, Marek Vasut &lt;<a href=3D"mailto:marex=
@denx.de">marex@denx.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">&gt;&gt; And as far as I can tell, bitbake can stick=
 something into DEPENDS<br>
&gt;&gt; before it parses this recipe, so the :append is valid.<br>
&gt;&gt;<br>
&gt;&gt; Furthermore, git grep through oe-core already indicates a few reci=
pes<br>
&gt;&gt; which use DEPENDS:append.<br>
<br>
I believe the warning is valid, see above ?<br></blockquote><div><br></div>=
<div>The linter is an obsessive pedant, and is not actually always right, t=
hat&#39;s why I want its author to comment :) <br></div><div>&#39;DEPENDS =
=3D ... &#39; is used throughout all layers, and doesn&#39;t seem to cause =
much grief, so why fix it here specifically, is there an actual issue?</div=
><div><br></div><div>Alex<br></div></div></div>

--000000000000567bd505d28e6b85--

