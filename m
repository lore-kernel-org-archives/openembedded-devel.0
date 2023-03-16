Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BB5C6FD19
	for <webhook@archiver.kernel.org>; Thu, 16 Mar 2023 14:56:17 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web11.14331.1678978574310998418
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Mar 2023 07:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WCVEER1s;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id p4so1799295wre.11
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678978572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ckQ/gNgPHjVqlrZg1+Nhh73vnMpjrefY1DoTDlzpWx8=;
        b=WCVEER1s+sX2+mPV/JKmcoR9E/L3/afNCwmiBuWQ8i9CKp/WTpNzDRC7lawjKSmwp/
         CZwZTlOwUtXOca8IMbKtm9ZGGHQ1hMCPo3CA6DaWpR1Z9iZD8apeYF7z3sThETYVwkcs
         q8Q9fahLr88/sbTOiJVEGvdC+44qfEqvyBJ3xkN8XYdcH+oZQUAKv7essiuUAsh3kVn0
         5/pr+0oLwv6qCIl/I7vuiWxLt/xYe0RLjD/WhPuA16rURUfIt8iZEXo6jD9Y47tjlH08
         Kxn14DHpq0UFcjNygBBnSp2EvCW68YS4hg3NrCwBOasMh43jNeYrEKfPlwxbZovSBC/Y
         IW3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678978572;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ckQ/gNgPHjVqlrZg1+Nhh73vnMpjrefY1DoTDlzpWx8=;
        b=lMYpwEoHAwpeRcoCa3zfqtqc0+nL2hikpbE9Kw6MJt6P8fMzPvp5jpeYUJeCbgux8E
         5rsyUyj/7zZ9HpDqTROrUfxYjRLsc9dUIsKfys142fkyLNad1VeIEJkRPg2Sj+qUNnXM
         jwZlrDmDehCyjknXoaLb3Ls6sY/SG/F7GSXqRnq/yKPvKShsgBsN9yfe2OqxmbPVYRJQ
         0fz43J4lCez+CaZMWnvihBPHhpkO8A+AjS+5XoLN0kuWeaqyI9LN5UvSYKfhUPtwY8k4
         AEU3Oq5J1OCqkd54mlG2prBoAxlTB7OwZT09JCoFL2aGUuTCrYbEnWG6VrPFhQZm1rsA
         SW7A==
X-Gm-Message-State: AO0yUKUYoH6bIu+/dPtGuxT3zHWNR9vsKtn/goN7iRSJqElZjXwamJMN
	UST5/Fn7JongFKWEZKv+a4PGFIF8hrRfSzYlP2g=
X-Google-Smtp-Source: AK7set/bMrr3qbuERQ7qeTcy6j0kwOcMiyv4QaRlWDMTCpt0JfPyii5V2k6CDMn19Q+8C+6qvCOSr/wcErEjTpHReqA=
X-Received: by 2002:adf:ee45:0:b0:2cf:e6e0:70a6 with SMTP id
 w5-20020adfee45000000b002cfe6e070a6mr1389359wro.1.1678978572431; Thu, 16 Mar
 2023 07:56:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230313114130.144008-1-f_l_k@t-online.de>
In-Reply-To: <20230313114130.144008-1-f_l_k@t-online.de>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 16 Mar 2023 15:55:54 +0100
Message-ID: <CA+chaQdB=DO7NRErQXJqiO9oDvyGjh8HJTJoYh7enfsci1-Cfg@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 1/2] pipewire: update 0.3.66 -> 0.3.67
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000006536e405f705a94b"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 16 Mar 2023 14:56:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101577

--0000000000006536e405f705a94b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 13, 2023 at 12:41=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wr=
ote:

> This is a bugfix release that is API and ABI compatible with previous
> 0.3.x releases.
>


I didn't investigate further yet, but today's qemux86-64 build failed in
pipewire with:

| Dependency vulkan skipped: feature vulkan disabled
| Run-time dependency libcamera found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency libcamera
|
| ../git/spa/meson.build:92:2: ERROR: Automatic wrap-based subproject
downloading is disabled

It's reproducible with 0.3.66 as well, 0.2 is fine.

In 0.3.64 the error message is different:
| ../git/spa/meson.build:81:2: ERROR: Dependency "libcamera" not found,
tried pkgconfig

I normally don't use pipewire, I was building it today just because I was
looking into webrtc-audio-processing upgrade and this is one of few users
of it.

Will investigate further, but if it rings any bells to you right away, let
me know.

Regards,

--0000000000006536e405f705a94b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Mar 13, 2023 at 12:41=E2=80=AFPM =
Markus Volk &lt;<a href=3D"mailto:f_l_k@t-online.de" target=3D"_blank">f_l_=
k@t-online.de</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">This is a bugfix release that is AP=
I and ABI compatible with previous<br>
0.3.x releases.<br></blockquote><div><br></div><div><br></div><div>I didn&#=
39;t investigate further yet, but today&#39;s qemux86-64 build failed in pi=
pewire with:</div><div><br></div><div>| Dependency vulkan skipped: feature =
vulkan disabled</div>| Run-time dependency libcamera found: NO (tried pkgco=
nfig and cmake)<br>| Looking for a fallback subproject for the dependency l=
ibcamera<br>|<br>| ../git/spa/meson.build:92:2: ERROR: Automatic wrap-based=
 subproject downloading is disabled</div><div class=3D"gmail_quote"><br></d=
iv><div class=3D"gmail_quote">It&#39;s reproducible with=C2=A00.3.66 as wel=
l, 0.2 is fine.</div><div class=3D"gmail_quote"><br></div><div class=3D"gma=
il_quote">In=C2=A00.3.64 the error message is different:</div><div class=3D=
"gmail_quote">| ../git/spa/meson.build:81:2: ERROR: Dependency &quot;libcam=
era&quot; not found, tried pkgconfig<br></div><div class=3D"gmail_quote"><b=
r></div><div class=3D"gmail_quote">I normally don&#39;t use pipewire, I was=
 building it today just because I was looking into=C2=A0webrtc-audio-proces=
sing upgrade and this is one of few users of it.</div><div class=3D"gmail_q=
uote"><br></div><div class=3D"gmail_quote">Will investigate further, but if=
 it rings any bells to you right away, let me know.</div><div class=3D"gmai=
l_quote"><br></div><div class=3D"gmail_quote">Regards,</div><div class=3D"g=
mail_quote"><br></div></div>

--0000000000006536e405f705a94b--

