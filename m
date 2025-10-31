Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB34CCF9FE
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 15:07:18 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.17626.1761923228583155605
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 31 Oct 2025 08:07:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=KScGzl1x;
 spf=pass (domain: smile.fr, ip: 209.85.128.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso12238735e9.0
        for <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 08:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1761923227; x=1762528027; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2SgBfn1YuULf+/Z8gL1204B0OurwEbXz2ZLc0U0zP3U=;
        b=KScGzl1x82lythXu2T/ph1hzvGixoKgebqGUBl63sVJGfOE/eeCTDTuGPX/7vIGZX8
         55IGxfmbOlvZ02Yz9ijQOUbthMtkJMXTN3/KWRZJnHiaJoOt3+ZNuC1eYNa/3dnka0Ef
         7v565jTahy2nMXN6TM4NmI+xFxBUDPhyeV7b4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761923227; x=1762528027;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SgBfn1YuULf+/Z8gL1204B0OurwEbXz2ZLc0U0zP3U=;
        b=FYylEZ3VdzOGqidKXm6N7pJ3IGTNXMyIc1Q1uOxqbwXGgaXMJ2a09B+g8ImEhsvvtY
         9eHMVoKdnY3Pn6hHOG1IdzDh1/5Q9HKmLtAhvWr1zCcGNfX0+Ojl1/3izWHKUQP2wxS9
         ThNPWWUiO6iLMInZeZ5BvlSHuwFuSGF4ow+K/cmFc8eCUrDW/WZG1JjALNmQtaD3zDMN
         3nHfUTJx7BDGDhS0IxncnTHqVHZBT09CRJSNPLIIcj6yxnQDKRt8x/BJ8+sOOix04dCV
         yUlNQ+slz1FbhM/6aH+qTSzbwLkvPJtJd0LRQqGUIF/G1sTeYNm9rEw2jefxUpitQn8g
         G31w==
X-Forwarded-Encrypted: i=1; AJvYcCVL+QhsxcOlN+gG0pVti27aUym+mOXh3Gj1p0hSExc0h0snfwAfZ3w/tahCBBPou4HZ8AlM82lWeZjhhsHN3/95Kjg=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzjl13cG4GEH8CpHH9p0BzKVJ7vetHesuOJsxBMzmytgyuuWYXc
	vJFVxV8OGjjL/D/Ztk86geD/C0tjZHgXryqYHN9PwU+mbo/qnqEMrNiu5K3ChM4K9MDAWBxCzX9
	btsailevbT85qzZCTWyw4Qhug3YSQmRzymwvNcDo4sg==
X-Gm-Gg: ASbGncsv3HoPI5pmUrBkRqEB8fGDon0wt6A1ciPaz0kEN8XHGKBLosseK89ixHD184i
	oCta8qjwnPONHy1qURnZuCDurZX+h6jzkEgzcEj4q8pvVnRg6ubtdc/jF1BXLfYYAABUUa66C4Y
	Plxh/TEL4BTiWgZxbSxAq6VpGCpTg9cHyYv+38uUMtlNb9NI/wAlChbflsfpdbrK9uF/5qlfOuq
	Oi1ASyOmX6jAXoqKQm7Na42a0PgC0UliqpX3ayjJnmRyEC0F+gsF490w38K66US2fGJ1lj2P0Bq
	NWt2nBrT2IMJGBkxrJjlX50=
X-Google-Smtp-Source: AGHT+IFzKs7Mm9/1qbMbPt/nJHiV39w4Z1nIuRzQpXhgm0/BDafd1MsIPTJQVEIBdcQXmJEL70wl0K+rablCOTHJsHQ=
X-Received: by 2002:a05:600c:1912:b0:477:1622:7f78 with SMTP id
 5b1f17b1804b1-477308a5e56mr35563715e9.40.1761923226774; Fri, 31 Oct 2025
 08:07:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251023144351.264756-1-skandigraun@gmail.com>
 <4248C252-5AC4-4D04-B9D6-B71509890D3A@arm.com> <CAMSfU+5oOg4FyOa6+BEz2ci2+4wVhXXg=9CVB63XQJEN88j2eA@mail.gmail.com>
 <48C3D497-F482-45F5-9A57-919781B6505D@arm.com>
In-Reply-To: <48C3D497-F482-45F5-9A57-919781B6505D@arm.com>
From: Yoann Congal <yoann.congal@smile.fr>
Date: Fri, 31 Oct 2025 16:06:54 +0100
X-Gm-Features: AWmQ_bmThzEipt6vOq-XTVFu_2Fa1bdUFRPyrb4ZilEM5_vBhrBUeZHiMYS76eQ
Message-ID: <CAMSfU+4T4qVOpMHhDcXJ3HYt+UoNGRwanrPZDszKErV9-U9_FQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/2] psqlodbc: upgrade 16.00.0000 -> 17.00.0006
To: Ross Burton <Ross.Burton@arm.com>
Cc: Gyorgy Sarvari <skandigraun@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000dbf83064275b896"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 31 Oct 2025 15:07:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121236

--0000000000000dbf83064275b896
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 31 oct. 2025 =C3=A0 15:20, Ross Burton <Ross.Burton@arm.com> a =C3=
=A9crit :

> On 31 Oct 2025, at 13:45, Yoann Congal <yoann.congal@smile.fr> wrote:
> > Nice catch, this is most likely what did break the meta-oe-mirror test =
:
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494/st=
eps/17/logs/errors
>
> Yes, it would be.
>
> > Maybe we need to add a recipe qa warning about this=E2=80=A6
>
> Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bitbak=
e
> =E2=80=94parse-only=E2=80=9D stage to our CI, because one of our recipes =
was using a named
> tag too.
>

For reference, I created
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051

>
>
>
>
> Ross

--0000000000000dbf83064275b896
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><br><div class=3D"gmail_quote gmail_quote_co=
ntainer"><div dir=3D"ltr" class=3D"gmail_attr">Le ven. 31 oct. 2025 =C3=A0 =
15:20, Ross Burton &lt;<a href=3D"mailto:Ross.Burton@arm.com">Ross.Burton@a=
rm.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 31 Oct 2025, at 13:45, Yoann Congal &lt;<a href=3D"ma=
ilto:yoann.congal@smile.fr" target=3D"_blank" rel=3D"noreferrer">yoann.cong=
al@smile.fr</a>&gt; wrote:<br>
&gt; Nice catch, this is most likely what did break the meta-oe-mirror test=
 : <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/b=
uilds/494/steps/17/logs/errors" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://autobuilder.yoctoproject.org/valkyrie/#/builders/82/builds/494=
/steps/17/logs/errors</a><br>
<br>
Yes, it would be.<br>
<br>
&gt; Maybe we need to add a recipe qa warning about this=E2=80=A6<br>
<br>
Agreed. I discovered this when adding a =E2=80=9CBB_NO_NETWORK=3D1 bitbake =
=E2=80=94parse-only=E2=80=9D stage to our CI, because one of our recipes wa=
s using a named tag too.<br></blockquote></div></div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">For reference, I created=C2=A0</div><div dir=3D"aut=
o"><a href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051">ht=
tps://bugzilla.yoctoproject.org/show_bug.cgi?id=3D16051</a></div><div dir=
=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quote_con=
tainer"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br><br><br><br>
Ross</blockquote></div></div></div>

--0000000000000dbf83064275b896--

