Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0265DD0EE0C
	for <webhook@archiver.kernel.org>; Tue, 25 Nov 2025 16:45:19 +0000 (UTC)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1846.1764089112652047066
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Nov 2025 08:45:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eZG4emQ2;
 spf=pass (domain: gmail.com, ip: 209.85.128.177, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-787e35ab178so54808487b3.2
        for <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 08:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764089112; x=1764693912; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Hzf9DhmbsNEgmC8AxeKaHYE/eLXK1XBqFWlw73VsO6o=;
        b=eZG4emQ2b8lwpAw8PmIAjs3cy6Aah5VIH+OFxSip5CY09gMb+ptmYGFW8OMQ/23lr7
         rBKtWDLMaW2g5cqnpBEAqu//Q6Mz+1CTqLUE9zbaEjgIb1VVNwvEG/lzwtmId0O/IXjG
         5TKDLStUmYmIxwyLjpDmGZHICsETZyxKvGR8SHMsRZew0uAI9PyPeo8S5CvaymGiu5sX
         fDxTwToTj+zBwfUHqotCamiG9OH9NA3GMXwPXtWP+UCuK2QsEbAx0GIx0wLeSXReDSPc
         /sUEIRaSiy/8dAzn00caMsjSVUV1B3K6qRhjivz0E7TsFYJCe1HrNJW47fLB5R3+Zuwu
         Sokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764089112; x=1764693912;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hzf9DhmbsNEgmC8AxeKaHYE/eLXK1XBqFWlw73VsO6o=;
        b=YDyBjkxt0vsU2NeQQtGvD5gE1LoHV4AeVhlkBjX7WPt8/Oh1GzexD+7QT+x47fGg9x
         eeePGyoakS+papYv8rYiQKgCQrjLECzjul8Zr1MLwNu9V/RsITaGv556PHan1IbVa9ub
         8LgH1EdkQKURWNfLncNNN5jLRc+tQVKhcIt2JlYuCmLw5wCV/JbLeKs8RkHUv9Rx6kGC
         OhJh4sKv8v0rxVwzENHd6p2XptPdX/1JtZYOxFyGsIJN61vgSqpPfoo8UpYCsSOym9aP
         567kTrHE1FMJIbTCrWBfbqClM8DLBTRubQZSWhb6Twwu59f4BC9KXX77TSC1RxWlJYMR
         BMiQ==
X-Gm-Message-State: AOJu0Yw95NES8ia2ANUXnf6B5nHmwmTxTm2EfIO+4rVhb1PLbSMBDoIF
	zgmM4k0/tSnkPC+SpOmM/vxx96tAhPgw/ONqgl5U4s4t5FztBcOnwSlY4uPS/AEphQ0wuT8kdlS
	gR72zJ1oMaJruJAanbhTCTZoFyLRKU/U=
X-Gm-Gg: ASbGnctAIlpRkU1hDamH6v5pS3kuvvVwpSO/uD3l7V2PAaSyZBADIElti2irw+EV8ze
	HoG+140M/VquN9Xf7FdCYo7aJf/bdcGE3fJa3wewioXhH4ERGHb7MRvePkweXbwKLyf2jytztnl
	a/DSEJako43Z/vavud5bXtMQ4ST92lNRWzy9TfavBuN4SV6RHt4SRqwD2vb72joUOyEzvYtTeJr
	jMb3N7wbAeZRCRBB+9ZYHv2Lp5fIIgIOpeYhuSuSKIhDiaWygwtTqztvhwCHwOETkfEu82ig7ZY
	itB/oMWfyfmh2AJGwF2K/f2C6gWIscJXtA3I5QBvbvdlKstJUvGvkzFVeadSl5afQG9rx102x47
	sHzJ4wB89O5qiHy0HUTiAhMAXDD3I0uLog0jWnLNmHQ==
X-Google-Smtp-Source: AGHT+IFEFYzxL8GyCo4vNnhNHprC9yEsUivtydXwutovpAgXX7qb7QgSa598Xkt1aFdT9W2QfP0PAtTQIPf/hbYqjE0=
X-Received: by 2002:a53:acc1:0:20b0:63f:ab9d:11f3 with SMTP id
 956f58d0204a3-64302ab178cmr10073239d50.33.1764089111655; Tue, 25 Nov 2025
 08:45:11 -0800 (PST)
MIME-Version: 1.0
References: <20251124092909.3234487-1-leon.anavi@konsulko.com>
 <CAMKF1sqOhnb6t9O1HPnYAFpt5JWQ-XbkKzMgGfGX65_LZ+zHoQ@mail.gmail.com> <9e1752f6-85af-4c4f-a215-57b75a3c9449@konsulko.com>
In-Reply-To: <9e1752f6-85af-4c4f-a215-57b75a3c9449@konsulko.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 25 Nov 2025 08:44:44 -0800
X-Gm-Features: AWmQ_bkQSf6fcA-QPtaQU4OWswQ497mJYzZ7dqKVetDoJavQtULZHLSh8csEk9o
Message-ID: <CAMKF1sqwitQj1H_CNMLFwENmpR4Q22Ly2kULaRSoVTzsuL9Vyg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] valkey: Upgrade 8.1.4 -> 9.0.0
To: Leon Anavi <leon.anavi@konsulko.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000da375e06446e005e"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Nov 2025 16:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122057

--000000000000da375e06446e005e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 1:30=E2=80=AFAM Leon Anavi <leon.anavi@konsulko.com=
> wrote:

> Hi Khem,
>
> On 11/25/25 07:59, Khem Raj wrote:
> > Fails on qemuarm -
> https://errors.yoctoproject.org/Errors/Details/889836/
>
> Thank you for informing me.  I was able to reproduce the issue locally,
> submitted an updated version of the patch and opened a GitHub pull
> request with the fix for valkey's upstream:
> https://github.com/valkey-io/valkey/pull/2873
>
>
Thanks for looking into this, the patch limits it to armv8 but there are
armv7 with neon in ABI
as well, I think it will need to take that into account.


> Best regards,
> Leon
>

--000000000000da375e06446e005e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 25,=
 2025 at 1:30=E2=80=AFAM Leon Anavi &lt;<a href=3D"mailto:leon.anavi@konsul=
ko.com">leon.anavi@konsulko.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hi Khem,<br>
<br>
On 11/25/25 07:59, Khem Raj wrote:<br>
&gt; Fails on qemuarm - <a href=3D"https://errors.yoctoproject.org/Errors/D=
etails/889836/" rel=3D"noreferrer" target=3D"_blank">https://errors.yoctopr=
oject.org/Errors/Details/889836/</a><br>
<br>
Thank you for informing me.=C2=A0 I was able to reproduce the issue locally=
, <br>
submitted an updated version of the patch and opened a GitHub pull <br>
request with the fix for valkey&#39;s upstream:<br>
<a href=3D"https://github.com/valkey-io/valkey/pull/2873" rel=3D"noreferrer=
" target=3D"_blank">https://github.com/valkey-io/valkey/pull/2873</a><br>
<br></blockquote><div><br></div><div>Thanks for looking into this, the patc=
h limits it to armv8 but there are armv7 with neon in ABI</div><div>as well=
, I think it will need to take that into account.</div><div>=C2=A0</div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Leon<br>
</blockquote></div></div>

--000000000000da375e06446e005e--

