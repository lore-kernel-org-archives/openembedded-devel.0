Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AADC369C9
	for <webhook@archiver.kernel.org>; Sat, 19 Apr 2025 21:33:17 +0000 (UTC)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
 by mx.groups.io with SMTP id smtpd.web11.5203.1745098395559919578
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 19 Apr 2025 14:33:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=K5B2fSdD;
 spf=pass (domain: gmail.com, ip: 209.85.161.42, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-60602272211so453279eaf.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745098395; x=1745703195; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PnDt4RXlnUA+A9syEWG5mHtF395OOhdzEqnqfebAtEQ=;
        b=K5B2fSdD8t5ZOiXq2C0lobn2pBnN8WOFFDmaTJyZZVIGbghiHd4Tmz0qxaJsC/cLJf
         B0v2F1spRarHaQRMTRnWeIOsFEShKXr/9t02kUw7jCwiIJBITQSil7Srs04DlKxCMs90
         OsAmqzaX990YewmABP2VdhJjmBC6vqzavuOzoQuYOpog/FFn3Uqith6h2597MD2awJeO
         fJthSCazcsqO8wpOSNYuKUliZwggLl8mz2Up/5X42u360p3KWKgNrJ171/ZHLwlkOhTO
         IYTE13MMJ2+3HJvpEm4AU8DeGRO8MJBhLPeL7IlPHU1voJ2kn5p/KFCNbjviyscOtOMy
         h4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745098395; x=1745703195;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PnDt4RXlnUA+A9syEWG5mHtF395OOhdzEqnqfebAtEQ=;
        b=eUFS3+R1crZCgwQKL1F/tzajckt6v7hw3kRK4rLaFn4ovUcj3h+6P92Ohb6SMrEysi
         IbAcyX0ECvxjNXWSwN8TUsh2W1whSo+PwBfqaIXgXbK6XZ74bFwg0si6vnY733TfflaA
         D/3cf9+m+S37V1VhmQfWCwGr6O04zBH6RILQoMCVzSK0ukuLQSZeCfnP7q0FEN32K7uP
         f2ImU6N/EkpaUDTvka2umCu15vHAZDcCCD2YUGD7jJPhl/KbRTEnLGpBgCXjsezhQyts
         r80Ooi0QxsuJHWpYNcS4oBm1dxIE/NOg7lkHuFY1uJ6jziBSXMKAQdFn1Hh+BAAorrgC
         U0SA==
X-Gm-Message-State: AOJu0Yz2xlzrCE0yFkePmPH72Qa1TguUBP7A99hi+nmjARae8uzXguR6
	xm8LE8f1dhTqCXZs6vSdlUaDZEoWZUKZRDjinnsoNdIffx+L7BRtmD8KRRbAp+E/7ACqs60rm/k
	sGN/f3EMVL+ZqOP/y//ZAvz4ybmI=
X-Gm-Gg: ASbGncvaYbxxAi4JcREdz/iMpoBpJziX8HzjBLqQoQkcnn3h/+N8oK2ePHm1SmWcFgC
	KQAYbO7EDT9yfWfSWn+ah9mOzp+vt3XuCcFahHLRPkjhBzc0NSR2XsCcjGflkVJ6njWYmHo5rjq
	4riz1z8+cYHqsH4SsCtuSUqA==
X-Google-Smtp-Source: AGHT+IGFtfvn8WBfjSr7qG14ShhuO8v4BKET8Joxox+KvheTADbubYmE1VQSfY2UHGrr8uN4rJrpBrJgxfMoBxTXkUM=
X-Received: by 2002:a05:6820:2295:b0:604:6b0:c259 with SMTP id
 006d021491bc7-6060053e971mr3955185eaf.4.1745098394835; Sat, 19 Apr 2025
 14:33:14 -0700 (PDT)
MIME-Version: 1.0
References: <20250419073327.2468160-1-raj.khem@gmail.com> <29310b77-a1e9-477b-9e29-f56a37a17051@gmail.com>
In-Reply-To: <29310b77-a1e9-477b-9e29-f56a37a17051@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 19 Apr 2025 14:33:04 -0700
X-Gm-Features: ATxdqUFazedXwfjbYKAQpXjRs3-_xBBdnZErM14mLEbt9VvBkjxHargHOVMSDrs
Message-ID: <CAMKF1sqqvF-BNhOkCNdmzmTWCDV7H-WNeFdkSb7jH5r6XHHWGA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/4] gphoto2: Use :space: to identify space characters
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000ec24c306332861b7"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 19 Apr 2025 21:33:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116984

--000000000000ec24c306332861b7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 19, 2025 at 6:24=E2=80=AFAM Gyorgy Sarvari <skandigraun@gmail.c=
om>
wrote:

> >
> >  do_configure:append() {
> > -     sed -i 's/--sysroot[^ "]*//g' ${B}/config.h
> > +     sed -i -E 's/--sysroot=3D[^"'"'"' ]+//g' ${B}/config.h
> >  }
> The summary claims to use :space: characters, but in the change there is
> no [:space:] here.
>
> That regex isn't too easy to parse with those quote-marks. Isn't it
> equivalent to
> sed -i -E "s/--sysroot=3D[^'\" ]+//g" ${B}/config.h
> ?


Seems that way

>
>
>

--000000000000ec24c306332861b7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote gmail_quote_container"><d=
iv dir=3D"ltr" class=3D"gmail_attr">On Sat, Apr 19, 2025 at 6:24=E2=80=AFAM=
 Gyorgy Sarvari &lt;<a href=3D"mailto:skandigraun@gmail.com">skandigraun@gm=
ail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">&gt;=C2=A0 <=
br>
&gt;=C2=A0 do_configure:append() {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0sed -i &#39;s/--sysroot[^ &quot;]*//g&#39; ${B}/c=
onfig.h<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sed -i -E &#39;s/--sysroot=3D[^&quot;&#39;&quot;&=
#39;&quot;&#39; ]+//g&#39; ${B}/config.h<br>
&gt;=C2=A0 }<br>
The summary claims to use :space: characters, but in the change there is<br=
>
no [:space:] here.<br>
<br>
That regex isn&#39;t too easy to parse with those quote-marks. Isn&#39;t it=
<br>
equivalent to<br>
sed -i -E &quot;s/--sysroot=3D[^&#39;\&quot; ]+//g&quot; ${B}/config.h<br>
?</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Seems that way<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex" dir=3D"auto"><br>
<br>
</blockquote></div></div>

--000000000000ec24c306332861b7--

