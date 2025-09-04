Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89FAFCA1013
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 18:31:10 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.2159.1757010666407303520
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 04 Sep 2025 11:31:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H295Nqt7;
 spf=pass (domain: gmail.com, ip: 209.85.128.182, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71d60528734so12674237b3.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 11:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757010665; x=1757615465; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QBdP67GSKUyueIVavgUkHd8I4Harf52f0f3evmAjz3k=;
        b=H295Nqt7yHEZAm4kINh41vg3IzqxMjffzv+bUFZdphzulv31Fx7cRo/tb1IDHmzseU
         9WU6csy1nk07RjrQM2RXk/juHuG2drrgQ5zwWwGWSJ4gWfePuGiN8DPM0utiqx32+kKV
         X8hyhOoeJG74NAs3sBKQAw0QUSHgKZkkij6HikqBK4zUfW8PcHg7VjFupWPcAqTn+vAR
         1VRb1+0vLoF3AY7aSvh1Y5dd/OeGHuePU9EM7p74hMNoKdB8S/oRYrMEghxGakO/TRZY
         mhA++ZOBfOfBMquFMTEDNj/tw2Kzb0q/epdqhWhVqkW1K7TvsO2/MxnA00w+gcTkyzXC
         //DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757010665; x=1757615465;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QBdP67GSKUyueIVavgUkHd8I4Harf52f0f3evmAjz3k=;
        b=uE54cZe3r//xHXzb78MJLnLn+Dp1BEC0t+lDtZcYiJEATJOHQs5bwMn9mvhVE5Jr13
         Tcj2Jf2JKSF7nOiG1YK2AhF0ZRs8w3Yll2/X5yhLceUsMu7kxc/JyxCcsA8nvbqU/bVq
         p0fcirJkUQT53BgJ1mIL/rUInba35YmML+ocj8hBsL9dSZSCqFnnGc3Kthk+352yNIxZ
         e9gZrYrOQW5zjg7mVI3oRieNTqMnSYVmve6tRum1aHWTiqZnl0lPRTzQJ49ekX2355KP
         7jHkPPSDPPIglTm6PeG38KvWepcJh2q2Q3kwYPic3hvyDcz9OU04ja9FPun5Jc+g5+iS
         3l3A==
X-Gm-Message-State: AOJu0YymtlSPivNMZDnO+ZUAP4UNK0bux0hOXobiWjh5O/YwewGBcNNv
	eP+a/plyavFCKqyLtdSa8rEsdcNVxuzZiMRJq/tL0MrJFh3QLr0zkGqz73kMlDw4Xcg/dOkT7Jv
	J+F75+BU/oVBt6q513+GTsYMHLj4kfDc=
X-Gm-Gg: ASbGnctTcT11y0JKuqbtmpdc2qBTTjbIar03SohUc8eDNvi965AtxVsoyUYywg/kANE
	YdoQJRi5znyN6RXXVvzT9ijmmjZ7s7I2LyvaQ+KSo+drVhS6CGnZQv9WtN9PcILoD24l7tWEA04
	fOC0xynfpnWsypTunWASupLo9MPOZm04X2hVguxbi7qHq0NJUw7icorYL3Z9f0jwoWx9QMkZu/z
	3gVL4HYGBnLf9Q9IOd5DKQ/7mXT5CoCqWVffvq71ldN2QSs6/DulohPKohyi3urE9aq4pvmrQo6
	ZZUvLcfwWt2KPyYp+b+VXLT4CdJ0zHBMmM4ut1hGX83qGS16QiARUw==
X-Google-Smtp-Source: AGHT+IGG2FwgNQQbbGHb81h0p/Fr617huiD6ynC7bRQr0Ot0orEQ9V0+BL+9uYiea8ffzepkpPDXvv7alGwGLSX53gg=
X-Received: by 2002:a05:690c:f07:b0:71a:34f4:7530 with SMTP id
 00721157ae682-7227635bea5mr197203287b3.8.1757010665445; Thu, 04 Sep 2025
 11:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <18620AA9DA393CA3.28859@lists.openembedded.org>
 <QE522T.UEJTRZ12736I1@t-online.de> <CAMKF1soWtutXvORmqQNV-Zqs=+x9uQQj7zsCkebd-g_1NzDyxQ@mail.gmail.com>
 <SST22T.73T1736VODD22@t-online.de>
In-Reply-To: <SST22T.73T1736VODD22@t-online.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 4 Sep 2025 11:30:38 -0700
X-Gm-Features: Ac12FXz59w-2oT_cCA0RgynEdPhEb-eiGhLdjDmL-jXIVARvdYbA1oX7c0P6OQc
Message-ID: <CAMKF1sqoGD65JNMx7jLHy_07qp9cdGFoS2_EKPR-h2qr3Wyh3g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][RFC][PATCHv2] glibmm: update 2.80.0 -> 2.85.0
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 04 Sep 2025 18:31:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119291

On Thu, Sep 4, 2025 at 11:24=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Thu, Sep 4 2025 at 10:52:29 -07:00:00, Khem Raj <raj.khem@gmail.com> w=
rote:
>
> does it have hard dependency upon gtk 4.20.0 or will it work with 4.18 as=
 well.
>
>
> It has a hard dependedcy on glib 2.85

I see. thanks.

>

