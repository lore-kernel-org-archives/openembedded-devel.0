Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7576CCAC5A5
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 19:06:20 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
 by mx.groups.io with SMTP id smtpd.web11.22650.1758740770959332734
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Sep 2025 12:06:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=guwM4L7c;
 spf=pass (domain: gmail.com, ip: 209.85.219.177, mailfrom: jan.vermaete@gmail.com)
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-ea3dbcc5410so158707276.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 12:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758740770; x=1759345570; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BvgubJKr3f5cubSXIalyqvUiHbpbbTMP3tyjsld8XjY=;
        b=guwM4L7c3DCRDgvsvGjPqQ3RmDzOpjGsb706gaf09G4POgAVgg1jwFqijAr0yyNsU9
         dBRSja0SiVP5PfT9H0k6xOdE8c+1TWgosNpxuLSXBbfEXw8qLJLUW6roTTf1Lw2sVkNv
         5gRi20zEx4zqs/3B9hULoI+AxlOXMBy2EMVhJjBdziWOlqpmyual0OAgPBFEd0yYQdKc
         j6Xftjpb8Y1IO6NnbKIZVtb+uZkCTa6eBg7WIXObdzLCLNFgqJIvoKie7EYq32BbPhVR
         mkbAF3nU/WHjzQ9WO23Hqgm5nfg7NTDpx2OFr4HGl3xXzMM3+T74KpWf7l3kRzZTePEX
         87vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758740770; x=1759345570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BvgubJKr3f5cubSXIalyqvUiHbpbbTMP3tyjsld8XjY=;
        b=c7F57xImG61+tgc1OVia4wH1FVkVxSBy82pSds32KZhLwGkST5vxINlkz09n/4xB3v
         BNCBae+Ualz/A1/BJh07FoMncRtjTcF8HGn9geHZs4IcdE9HMt63NEGTI/CpFgsVw5PK
         DkbgIQAY6I8YRstCYMQJW5wGV3zwDdvmQRk+K4WRctblc0+t/ZvF+zCtpISl63Ln5iIf
         f5PnlTOUgUlLcIl/wlUQLUpwFv5mReOE0KVNjumrHBMAVkI8HVeEbyqgXfP8nf4Y9Eow
         1OajzXH2mtkQAppZkfA0DOzdQ09tS12eI1/PcjWiN4S7hppyFWCJGyLaeEYut+u57Uv2
         v6/Q==
X-Gm-Message-State: AOJu0YxjyFE+Dk2JuHz/QSy06sfJWoLpVLssnLhm5iUIAK84P3hUfYfW
	C2WzmhQJFBvthckEz4fwhTNZJ/m4+3v4G+x+i2yCC+GNPmvyPgWwgKtxsZUDMypEG9NJ+VXtfR0
	DfqEvg+VQTNJj1EcL7B5W8va4Ba1AtiI=
X-Gm-Gg: ASbGncsqpkW4q2dNoSHkwp5R8uTg0agwymL9n+Af/2LDdvH+ZXNOu1SUu2DAlBXCkjB
	Y3IuElJqrjkHfNmKhgxEo2f6j/y5G4pZO01R7Hp8/lxEB0/w1AHNwzHuO0QmejJe/iyBcVQhTUN
	sKwf7lPQU8Nipa3+TJEP2RxfTUNLQ1HmDHMcQShQreeAbcKbcA/uTj+GAdC2tvWqR+zxeFU0K8K
	UgtFq01mJ3xDWl3O74+YuJNCsCrknwMhovW2c7d5g0jnEgp9P8=
X-Google-Smtp-Source: AGHT+IEkrAWGM+3cl1kfBoqn6ofwrPWBVkc5e4f1q6T/pKsAkq+jW7ceYpIwPILOoP8MRX2/msexbA7Q5IZhTu/R//I=
X-Received: by 2002:a05:6902:120d:b0:eb3:805e:1154 with SMTP id
 3f1490d57ef6-eb3805e18c3mr769468276.20.1758740769955; Wed, 24 Sep 2025
 12:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <20250924185113.40093-1-jan.vermaete@gmail.com> <074adbe8-13f2-4d67-b804-2730da9ebd11@gmail.com>
In-Reply-To: <074adbe8-13f2-4d67-b804-2730da9ebd11@gmail.com>
From: jan vermaete <jan.vermaete@gmail.com>
Date: Wed, 24 Sep 2025 21:05:59 +0200
X-Gm-Features: AS18NWDZ69PWyP4JgaVV0asofwefc2OIJZlOH-2BI7UE3EJdxr5P64tYCiKM6pw
Message-ID: <CABF_=yjAHVnPJyNTxQ82WE8brf3Tsk2zGits2SmTty2K4ty=Ow@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH] python3-pyproj: added native + nativesdk
To: Gyorgy Sarvari <skandigraun@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 24 Sep 2025 19:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119834

Sorry, yy build server isn't connect to the internet. But still my mistake.
I will added it to v2
Thanks

On Wed, Sep 24, 2025 at 9:04=E2=80=AFPM Gyorgy Sarvari <skandigraun@gmail.c=
om> wrote:
>
> On 9/24/25 20:51, Jan Vermaete via lists.openembedded.org wrote:
> > +HOMEPAGE =3D "https://pyproj4.github.io/pyproj/stable/index.htm"
>
> Typo: a lower case "L" is missing from the end - in this state it's 404
>


--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

