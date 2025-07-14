Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 892AEC83F1B
	for <webhook@archiver.kernel.org>; Mon, 14 Jul 2025 14:00:22 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.78719.1752501619196305845
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Jul 2025 07:00:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IlrLlKvR;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32e14cf205cso37093081fa.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 07:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752501617; x=1753106417; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SDXReEyRHe8kV9WJFNJx2Q8kmJaOSIZROHxJpqpaVZI=;
        b=IlrLlKvR8M5tvF2YDiA/dSgYKgzE6xg1WfEDL984blEzEjf1y8B7PI/n9i8UYKT42A
         rdnC+7HYb8NFTm8v+zZEjZcQciRx8bhSM7kZGLLsY8eBsRmv46jHlTETeIfijaMYCfGy
         zn6csU8xOp0YwB8bZI9mbJTXWuKObLKsUiToufLH+dKh+xVjF1renE3kCNbwadArcIhP
         6iOHLrSANkw6H+Aby7wzJdoTgDR/Hnsx6IuAaLkojzDgqEHWPd+nMyGlj+O8rtcdmRIA
         3MZ7IJtvnvR/gwMJwbKqwbctNN2m7aZhxu57tUq+UeeRwcu3GDT+mKDgY3yy4oMNnmWc
         3hjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752501617; x=1753106417;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SDXReEyRHe8kV9WJFNJx2Q8kmJaOSIZROHxJpqpaVZI=;
        b=SgeHzWLxv1CRQwd339rj/3oyntmNcM4Y3qvSYNz6kUi/KUacZqqPk4l4nW/1ImGql/
         BM2mdXxvFZSjzDrVDrAF8l5GS7QCQ4Fu74A8VJz4H/vrVgTFgsxXrxmf62ClkJdEcMIs
         j4/bTzqWFyPhxnSKkGvEB4NYfuskr/SiocQ8jeUXPhqO4h2KlsC8htMX3T0RDYCFIswA
         2Rr3ypNmCE3Ibu5MV9/jWUwi8GcX2OZsHhT5E17xjXuUPggRNfX5Y02I+ZGghoD42y0m
         wQTw0Y3wqJfB7uaBZ4ho3K4+EUfkcuMcD0nw8X9RjAOIAN0xH2mpHufs+TMoe97QgXVm
         t/CA==
X-Gm-Message-State: AOJu0YwPKw1Wx7aT8bk9MU6lbLMwvtufQmV6iAHF/Xi4VsovNtTgZs6A
	xdmyMSDVrK8KREMrvEkQZAme1JOUzPWYTOeoUxsLy9+/ElVXGSIhwcLi0xvAP71v4++XXUr1702
	D2P8I8JLhbEaBA7k1Flq0Ikkl/cQmIAw=
X-Gm-Gg: ASbGncvrec+K16uvuCiSyatcVDpo9k592EOTEdgUE5R7Ix3PhlfSdceH8lDjytxI6OZ
	/Qb+TxK62s6x+3zveG5SjUDfllIbU2APm1Ta5gYjs+/O629yrPj3NRb51pPt9iw2ODDqLxJuhtF
	XLRJfyAmMVpwlYJSvdzdc8AkPe0Fa7l6/zcNzez/5fKqv5VBJZhk16NFNf4A76aZcIsVRCjgP7V
	lixjIXWDA==
X-Google-Smtp-Source: AGHT+IFXUjTDUAGtwkJyd+lbq87BVOIAYEvCzGFQi9Rva2HTTej4X9xbdp5dDIF0N9JimZ942mjuowODlNNTGPpaooc=
X-Received: by 2002:a05:651c:40d0:b0:32a:7baf:9dcf with SMTP id
 38308e7fff4ca-33053444a16mr28260461fa.28.1752501616890; Mon, 14 Jul 2025
 07:00:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250714134657.1620685-1-martin.jansa@gmail.com> <aHULieE55wXsyrSf@nuoska>
In-Reply-To: <aHULieE55wXsyrSf@nuoska>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 14 Jul 2025 16:00:03 +0200
X-Gm-Features: Ac12FXzDM38-S360F8k9j-0i888FGljnuL0ElR4VBRrePaOhD7MYRg3ymXLtB6g
Message-ID: <CA+chaQc7a9wXuCnF0mrdFbkE_tY+M+1Z44D2qNJzy4VN990ViA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] fwupd: set vendor_ids_dir
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 14 Jul 2025 14:00:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118536

On Mon, Jul 14, 2025 at 3:52=E2=80=AFPM Mikko Rapeli <mikko.rapeli@linaro.o=
rg> wrote:
>
> Hi,
>
> On Mon, Jul 14, 2025 at 03:46:57PM +0200, martin.jansa@gmail.com wrote:
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > * it's in RSS as fwupd/2.0.12/recipe-sysroot/usr/share/hwdata/usb.ids b=
ut
> >   meson is searching the paths on host with:
> >
> >   # look for usb.ids in both of the Debian and Fedora locations,
> >   # and fall back to the system datadir in case we're building in a ven=
v or prefix
> >   vendor_ids_dir =3D get_option('vendor_ids_dir')
> >   if vendor_ids_dir =3D=3D ''
> >     vendor_ids_dir =3D join_paths(datadir, 'misc')
> >     if not fs.is_file(join_paths(vendor_ids_dir, 'usb.ids'))
> >       vendor_ids_dir =3D join_paths(datadir, 'hwdata')
>
> Isn't this the same as ${datadir}/hwdata ?

It is the same value, but on my host, I don't have
/usr/share/hwdata/usb.ids so meson doesn't detect any existing
vendor_ids_dir value and fails.

With this change it accepts passed vendor_ids_dir value without
testing it's existence (neither on host nor in RSS).

Cheers,

