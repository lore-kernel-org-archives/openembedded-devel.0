Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web08.5408.1619435909776242637
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 26 Apr 2021 04:18:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=Ckp0nd7f;
 spf=pass (domain: burtonini.com, ip: 209.85.221.41, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f41.google.com with SMTP id l2so3110861wrm.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 26 Apr 2021 04:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cs4WlaShbxIFWNwjWNbIOr3CB5Z30HO1BHdNkSwn4xk=;
        b=Ckp0nd7fOLmNiKZbnvUhCajsifL2IsxlFp4+kLM5P7yBMK2yQF1yxGNMtsUTcHo2Kt
         5r+9zfv0v+bVADlXtrYt6cX8qfvRmA1qceUxR4voaFNOUwsOisAqHbj/ugHr6CFtWhzP
         fpMoNTaQ4V2++Z/voxUb5qFBz54IcoyigVQnDhYd5EC5wpzXZ+Vgl/lThUCLH6n+y0Jl
         /AYQnoLQDg93XFcrU4ygeIgGtuz+tfxDz7ZBQXLLa9lT/ClOa/MM7e5Lr+pKbPh38wF3
         X19QZoMo62IjERL/AultEIopXWqn9boutxs9dar2eZLHjc43aaHBhgLQV65HWYaVPm1m
         1ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cs4WlaShbxIFWNwjWNbIOr3CB5Z30HO1BHdNkSwn4xk=;
        b=FOBOQfe2s61mIkp2Os6KEZHGYgJV/GHV4csw9QF7QRDHaeyMBV/TKqt6+CbZJcmAbb
         hW+4T/t07wwnvOqwGpSbuCLsc1eIK7Z/HiNkFQu5qBwzB5M5ToEG8UZmEv7nlFjmFykp
         BEWbLn5MxsVloaq7n1AUbeslYr8gh1Ihi5Z+cXqUq+Ymj8PNaBN5qWkTqrVZZbFXAW4H
         gKgoGs6AGKyBJh7faaMzdgUj+L6ULuSjCeSppU/6aq4OP9O3S9lTaCwY48QDOeW03w+M
         lsJgWpaA05lB+Zso3sh7y1R5WljigrSpayj7HzE+LHe7+Lbu7KdIvDGiOqajX2I6p3FJ
         sM1A==
X-Gm-Message-State: AOAM5330mBHCBmVFEyU20X/NDGLeEFDPUC0UWksGbJrRM4v6YWcDG4xe
	pD5E0CIeLr0YBzSE4kAMwW6z3VCaJRR5LMyqoainEw==
X-Google-Smtp-Source: ABdhPJw/vmFqEQzBCQrW8NT/A1NIO9jOU6AZIHZvH8imXo7MEjLD6nUe97dmDjysFloIU/WYZwKpBNDhJR2K9/Jpp8Q=
X-Received: by 2002:a05:6000:1816:: with SMTP id m22mr22552543wrh.260.1619435908322;
 Mon, 26 Apr 2021 04:18:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210424102451.885867-1-peron.clem@gmail.com> <CAJiuCcf7mOszQNA=+mQmrr0ZrFsew+e_N_=316qgLtsoU0j-Cw@mail.gmail.com>
 <CA+chaQekMoLrC0m-gyPC3nAU6JxMOGHwU0J3PNqRiafembWKHw@mail.gmail.com>
 <CAJiuCcew5bi+kR=FEWjYzjSJSHzG_pDyrrGjqEVFNzNRNaQRmQ@mail.gmail.com>
 <CA+chaQcO9cMcP9PxjnAU_SzEt+PJkQKgVhxwjAWAyngapev3Gw@mail.gmail.com>
 <CAAnfSTuBbktC_7x9PhvCwJuLBjAPqi4TRb66yQHRfZc_O+ogHw@mail.gmail.com> <CAMKF1srVXY95O3v6x2KPkmZ79nbaSjHUwfCuMZN3Eq67RX4J2Q@mail.gmail.com>
In-Reply-To: <CAMKF1srVXY95O3v6x2KPkmZ79nbaSjHUwfCuMZN3Eq67RX4J2Q@mail.gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Mon, 26 Apr 2021 12:18:17 +0100
Message-ID: <CAAnfSTvonCSuKcUWamEBx+2SV1vsDuHEVNUx1D=9V3R4Cwe-VA@mail.gmail.com>
Subject: Re: [oe] [PATCH] [RFC] gator: Add new package
To: Khem Raj <raj.khem@gmail.com>
Cc: Martin Jansa <Martin.Jansa@gmail.com>, =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 24 Apr 2021 at 23:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Sat, Apr 24, 2021 at 2:48 PM Ross Burton <ross@burtonini.com> wrote:
> >
> > To be honest, as this is Arm-specific I'd encourage adding it to
> > meta-arm instead of meta-oe.
>
> I would tend to agree, although there is something to consider it also
> means all arm SOCs will have to depend on meta-arm for this recipe
> which may not be a bad thing but some BSP layers for ARM based SOCs
> are independent

The meta-arm layer itself doesn't have any machine-specific recipes
and is simply a repository of common recipes.  There should be no
barriers to an Arm BSP using meta-arm.

Ross
