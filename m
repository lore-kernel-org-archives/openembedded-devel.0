Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E88DFD767E4
	for <webhook@archiver.kernel.org>; Thu, 31 Oct 2024 16:46:28 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web10.17202.1730393187894082349
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 31 Oct 2024 09:46:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bW1Fe9ph;
 spf=pass (domain: gmail.com, ip: 209.85.208.181, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2fabb837ddbso16540091fa.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 09:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730393186; x=1730997986; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fl66Jq9c0Jfh/vvYqxjQfhUaayjYjQGrwvSgipo0AW0=;
        b=bW1Fe9phbKvCZsKKVZ5wY/NS0nbVMlJGe3bvkt+w+/Qrm53CipKCS2+ioA1mYhHPye
         2ISvx1bInC5EZqWzVnlq8BKWgOO/dAEqZN8+4L8lUyuUZcHlpiHNa8tYzX7b+DpHv7NM
         hKfDLwu70gOp50pm+fYBZUsGs6GEvP1i3Td3ckVcw145nlju180T6lF6WVIWIfp9FfWK
         v8PTIE4efDFmMfvsNo2rzfDXbVqB3eAX9AArIUcucnxC1x18NeF3wfKzzjWncxlJH3BK
         +sf6awDb8Sj8xTVcSj4PeQEy6lHeAkEr1I9xjfmfnEj16rfb1obJOPrd5awUGoVT6TCY
         2DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730393186; x=1730997986;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fl66Jq9c0Jfh/vvYqxjQfhUaayjYjQGrwvSgipo0AW0=;
        b=XXloUNNbKTiGv+3V4AeLcm6IxD52FRyesAtxXHU5xXGtMQm8jbW/FjTy8gyFw8sU0S
         8yI+sTtflKoyqnUM7G6fvPlGpxbN1VQyAZFzBOkeuXH4LFMZm7w02HTDEqDXfJ8aANdm
         M0GpKOhBh6BF5vY/hUrOr+gMWg09OmCfIfIHa1TSZOrjlUKyJfGbAHhoFP26fUQjLpHX
         Fp55qBRfnQ3Mkjaz13QUFQfRTfH2kxZWgA2FRrhCN6qzsX9CT5xuxAnLKo+mJVKWN7Im
         YcSazbRarm2rmIBEfSLCqz4pSlmmoYvSK19Y5UZBqDUjnGlc164S+PTeKzgKm5GWhk1F
         ZHHw==
X-Forwarded-Encrypted: i=1; AJvYcCVWMg1kr24FFcMPw8U3k30opJGdsJFYEuTvq297xlAOpGf0tMsvL4OtMn3ZE07YbnNYUXok/wGwOOQSnEKKG38AJ3w=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzd44N9f5BcaS9W4Qbd4jiwOb0hLjIlj/6aQmg570WRGQarjh92
	MTXvRvMEJbdCr5VOTG89OJ/waTObPuA5uslAHjrIk/pNFZcg5jDZ4KEq1ISxAhZA1WUV5wAL8u/
	NpM6Z7pCLkvebkh/TwreTTS2p2js=
X-Google-Smtp-Source: AGHT+IFL7KQE9U9Krj0TZt68WIBG7k9texmZnxJeeFC0ZB6efk2Okjc4XmW/Min4wzpgM1ft4uHGbbf+BSluXAcix4A=
X-Received: by 2002:a05:651c:985:b0:2f3:eca4:7c32 with SMTP id
 38308e7fff4ca-2fedb82fd05mr5566011fa.38.1730393185666; Thu, 31 Oct 2024
 09:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20241030205334.10278-1-brgl@bgdev.pl> <CA+chaQcHWBW-Fkzyi6e2hYiJzQx-cXqaLUJ7d6Jvo_aiZG9Hrg@mail.gmail.com>
 <CAMRc=Mf7+6KMs3X59r2ZpLV=SynayTsG7RVh8-FmEhM321PE_A@mail.gmail.com>
In-Reply-To: <CAMRc=Mf7+6KMs3X59r2ZpLV=SynayTsG7RVh8-FmEhM321PE_A@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 31 Oct 2024 17:46:08 +0100
Message-ID: <CA+chaQfgdL-4CaHtJ74fgQTmSC8bnYtOx2cXHwMgnDaNrATM7w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: selectively enable GObject introspection
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Khem Raj <raj.khem@gmail.com>, Max Krummenacher <max.oss.09@gmail.com>, 
	Bruce Ashfield <bruce.ashfield@gmail.com>, openembedded-devel@lists.openembedded.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 31 Oct 2024 16:46:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/113371

I already did few hours ago, see:
https://git.openembedded.org/meta-openembedded/commit/?h=3Dmaster-next&id=
=3D8a676c670c437828f74c552c518f3e0bea624c81

On Thu, Oct 31, 2024 at 5:41=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Wed, Oct 30, 2024 at 10:02=E2=80=AFPM Martin Jansa <martin.jansa@gmail=
.com> wrote:
> >
> > Please use BPN in:
> > FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}-2.x:"
> >
> > I could send another separate fix, but then it would conflict with
> > this one, so probably better if you send v2 with it.
> >
>
> This patch is already in master-next so just go ahead and add your
> change on top.
>
> Bart

