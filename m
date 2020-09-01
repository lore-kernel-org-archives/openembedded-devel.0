Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web12.13480.1598967931289243583
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 06:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=iAKQkSXP;
 spf=pass (domain: gmail.com, ip: 209.85.215.193, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f193.google.com with SMTP id 7so697798pgm.11
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 06:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Sgdd3rOZgDerCBa3sN2AcaUAHyzOuL3rcG9TpAXuZaU=;
        b=iAKQkSXPgw5/CipNvP/hkIFamyM2PHZKN0So+Yvbd14XEjeJzJWZZ+sevFarwvljuH
         KwYfux0npvDrsw5Tfq/UEVIsyjpxl0mh++rWYTf2Rvi1pZ3kNIOZT7XM5DC+Wf55jIF5
         WIZckZEbc5SidRBmlISfYSbfKRF0bY4UigYiTcmnxu1rCkaTJtdMbgKmAY6xISf5yQir
         cBj2+8kOz9NcQFaMIPq08BQjSq0moeD+oyVtnrpDmGxYhMMJKVIvqaRPBOdvEs4MaHjQ
         tVItM26NLmTTG8TExQoAlItH8oxEmoLQPLzEEjyn6URA0ZiRNc+raOT/OzOwGbAQnjUM
         qfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Sgdd3rOZgDerCBa3sN2AcaUAHyzOuL3rcG9TpAXuZaU=;
        b=nW7y9Ro/KuZNLHSIHSn0nIk5WtYddH8Zb/LJ7F7vOwWtCZfRT9M+ovdE6eDNIw+x5R
         dp2yzPrm4v1eim9UXOoyM6XNj1zWDfX/sR+DBNMDprpxWnWNW2Tp1PD+FjiZrM7HMqtw
         BXB/ywxbQ/M7aqME710PW4080fDcLs0utq2GSjJ+uxtjAlEeCuBJNTfRTNKyr/GYUmON
         bVvKqVY5IS7NNwKtH5Rp623k/NW3d1/VpxuNqpBNs1DkYHJzXaUkk/B5PtiQ8v3YydJf
         3Q/iRlOxTyY1RT+wljpbyBn4GTwvswSNW2++BtUheRkD59vlojrlIVCmaes+o6uvPd6U
         2QWg==
X-Gm-Message-State: AOAM5338jq3A69Rc5xQHoyYdZwjywZPNNGiVfO2BDT++ZxdDMPIuKICU
	kgDw0QcZ1QCsWS147FZRq+sMSpjm0yNBhqVoRHc=
X-Google-Smtp-Source: ABdhPJxvCdkwrWJRCKoiu47AJ+QKFoMBJb17EKG1X1LGwcjZ4aqQInPSRZTZ7vCSirr2LPmU/VqxRjGAekORHqe+hug=
X-Received: by 2002:a05:6a00:7ca:: with SMTP id n10mr1970027pfu.129.1598967930716;
 Tue, 01 Sep 2020 06:45:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200831235106.48150-1-raj.khem@gmail.com>
In-Reply-To: <20200831235106.48150-1-raj.khem@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 1 Sep 2020 15:45:19 +0200
Message-ID: <CALbNGRSbBrsWM3Od8SK_pey3a=JhVD0-g3PusCro6fdk03LODw@mail.gmail.com>
Subject: Re: [meta-xfce][PATCH 1/2] layer.conf: fixes icon-theme signature changes
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2020 at 1:51 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> openzone and rodent-icon-theme are allarch but recently
>
> gtk-icon-cache, since commit 31e3d34c8a9c3e8481aa837aa0bf52adf095fe62
> [gtk-icon-cache.bbclass: add runtime dependency], it start depend on
> non-allarch packages gdk-pixbuf and gtk+3, which make it's signature
> changes when machine changed.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Andreas M=C3=BCller <schnitzeltony@gmail.com>
Thanks for fixing

Andreas
