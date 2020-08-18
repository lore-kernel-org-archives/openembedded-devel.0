Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web12.75782.1597786328405654300
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 18 Aug 2020 14:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HMhk0SxL;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id i20so5535763qkk.8
        for <openembedded-devel@lists.openembedded.org>; Tue, 18 Aug 2020 14:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z5uqFi9CgMjTbwX0R13RpfQj6EuLbrlnFx4Goht7k8s=;
        b=HMhk0SxLdqyNXDptW4lUO/6TOzteFzmTu2YzoiUvFXS14KHZqDXO8EMZrgXme96+K1
         2cClbmGLZ5u+H8jTRHBd3USopBNwMEuAdRP16YuO8x2M90knvRe3JL4IOAxsuWfIoKEO
         qo9R0ZoKlhysts2woP0PpbsV7AC56octp0OqTSLWZ5P4Z8sKH8euJxSO/ZIhfDZm5IZZ
         sW8RbcdQfSutcsx1eoBkWwtDuAfZF93PZ5+BCb5ORp1tQxhnvBd/WYkR+lzVkuzKA5ok
         RZ6rK7tZ3Lwip4VHi3f1SSawM05Le7UmUc0R6tK22jk7uKtlODWZyYClAOewaE0VIeJU
         /OfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z5uqFi9CgMjTbwX0R13RpfQj6EuLbrlnFx4Goht7k8s=;
        b=OAT4UEXGyoKlXCcfNjfsJu11qED2C+NWbHmrED0aR4EIhp2Ryb5TjEYuOnn+U5S7AV
         abxPqUU8MQJgV8/Aot3IPzEoVZ0y06ERAsuyX2qni9EvHyuk344foZ5drhBxl4JFaTke
         abBTJkcHy8s0S+l62s33J4V66bfohkLyC7yAdw9hTmY1LykqnCB32MLanSDvsAk3mb1u
         d1WGeg3z/gR/9pO9Pr5UY29Rr7rn06wIYo6bTXQ75A009Yac+yWBP1pBTtFHfaN61Oht
         KSgDdDAuNMzVsOTTgd/Hxyp488eHocKUEoAdAzr6KUricwetLgpOEm+INCUC2mvncQls
         dApw==
X-Gm-Message-State: AOAM533nKFJc2skpVyoKc817ZuiwmmMWCBDlZu2r7KCQ8/B6r2XGfAPK
	z0J39/NPbfwvBMtyrQxwXTf5WUcDCFWoDM0hE/4=
X-Google-Smtp-Source: ABdhPJzCwolfx++4h70g6vFoZfFTiUslS6/n9yvgNXhTN3g3S9gT5u/2+XtvCBWeP+LIYIR1QPG2q0GIpEtVvR3p8tI=
X-Received: by 2002:a05:620a:48:: with SMTP id t8mr19464113qkt.474.1597786327426;
 Tue, 18 Aug 2020 14:32:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv36viDXoJC6VQ2asswo=TaDU=0zJftXGSxbhkfDDk13KYg@mail.gmail.com>
In-Reply-To: <CAAfyv36viDXoJC6VQ2asswo=TaDU=0zJftXGSxbhkfDDk13KYg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 18 Aug 2020 14:31:41 -0700
Message-ID: <CAMKF1spo3AzBPAe4bYwm4eCTQ6r1cyfN1cUQgqKuq=S+HFCiMQ@mail.gmail.com>
Subject: Re: [oe] libgpiod using STAGING_KERNEL_DIR
To: Marek Belisko <marek.belisko@gmail.com>
Cc: OpenEmbedded Development mailing list <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 18, 2020 at 1:09 PM Marek Belisko <marek.belisko@gmail.com> wrote:
>
> Hi,
>
> I'm using poky warrion and added meta-openembedded to have libgpiod
> recipe. I'm using a custom 5.6 kernel and I would like to update
> libgpiod to version 1.5.1 but this version needs kernel headers >= 5.g
> (but kernel headers on warrior are 4.x). My idea was to somehow pass
> STAGING_KERNEL_DIR to CFLAGS but this seems it's not the way to go. As
> I understand from the kernel-header recipe I cannot simply bump
> kernel-headers because libc depends on it also. Any ideas how to
> achieve this? Thanks.

if it need UAPI headers from kernel then linux-libc-headers should be
bumped for best results

>
> BR,
>
> marek
>
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
>
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
> 
