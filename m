Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web12.1869.1632248133309813526
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 21 Sep 2021 11:15:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112 header.b=ORUR4WH8;
 spf=pass (domain: burtonini.com, ip: 209.85.221.47, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f47.google.com with SMTP id t18so41864096wrb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 21 Sep 2021 11:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HeR97jhfi79qEFPfmZDZdPBtgpsRVS9v+TdOb8TScWE=;
        b=ORUR4WH8Kz2edSDJ1D4cmNf1I7ajQkGIpuSrHOX6NHKAI5bb1Mbzx0Xfx6ugoy7ppu
         BzCUH/Nw6fnpagXZaJ1ab2o6GXyA0ARDecTiqveLl2c8RUx3YsnQLg11IVwbw0ol4enE
         NRBO9o6fIQQsszoD0vro0T4KYqMr/g4Rpp9Q+ZJwaioFKN9vVVXXqtfjbJKaxxgOcxyh
         doglkRR9b7NJB6MkKZgNyxaGerfckvWrYJTWG7FquxYYkf6YRNZe4sir4MseZmcseoAi
         YCI2uWVNzz9zX3mv7oJkEGtSLeN1TYSXyyIVkRsYYSYgOsrBl9lUHqT7kN62Hqa+pwmr
         QexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HeR97jhfi79qEFPfmZDZdPBtgpsRVS9v+TdOb8TScWE=;
        b=DdLUPppdVxVM9N/Hb+Cl03fTlWiBlG3x3OQAZp38zLOwLQXTMXmQZejyNGrVp+KwyZ
         B2LAtncywcdKfG4yPiBVWkKokvyXxkI4Ey0nDz+a9sew5j4CP3J46+XKp3WQd03c8SvV
         zY0GkRjm/9tvndq42+M3pVxrd+hTTFPYNExY2ZgbT0NwO7AdYQRBQyXPm3qraqwe1U5X
         WyJyRBlU3rQdbQrKxorTX6wMn3IBOKhuxVBlBp6oystUxQIMoPP+7ViFNt569Yk6dV7E
         hAEGM9ALMJGYBp9MQeV9rHBU1rKXVWc962H8/145ZZs5yu22rbQsAqZ6Dk1ETUr/sJnY
         ACXw==
X-Gm-Message-State: AOAM533Ra7J/xoq8R4DisYlXqYj/V5/9LHPxAcnZWUq7edWe7a040M5e
	zjYoVp6dIMU19ZIXSKvbMb6uJ8CJn4iVt2zvTxBGuA==
X-Google-Smtp-Source: ABdhPJyn4qFdEeKIPLOhNdOXa9SPKFwQhe0G72+226tcef5KfQMRWqmPhw0H2Qr/EeA8PipN9iUb6Xzjs11VRzSS+AY=
X-Received: by 2002:adf:cd92:: with SMTP id q18mr36750799wrj.211.1632248131566;
 Tue, 21 Sep 2021 11:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210921172931.3132388-1-raj.khem@gmail.com>
In-Reply-To: <20210921172931.3132388-1-raj.khem@gmail.com>
From: "Ross Burton" <ross@burtonini.com>
Date: Tue, 21 Sep 2021 19:15:20 +0100
Message-ID: <CAAnfSTsph=Kk8Rqthz07M0D6mu6Os51jxjoWiVS4kw79Z_z5=g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] rp-pppoe: Add configure cached variable via recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 21 Sept 2021 at 18:29, Khem Raj <raj.khem@gmail.com> wrote:
> +EXTRA_OECONF:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', 'rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=normal}', 'rpppoe_cv_pack_bitfields=${rpppoe_cv_pack_bitfields=rev}', d)}"

I think CACHED_CONFIGUREVARS was intended to be used for this, for
what it's worth.

Ross
