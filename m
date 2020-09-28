Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web11.32277.1601282348308652318
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 28 Sep 2020 01:39:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=srNX2x/U;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.196, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f196.google.com with SMTP id t12so399040ilh.3
        for <openembedded-devel@lists.openembedded.org>; Mon, 28 Sep 2020 01:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tTvLlOnZrbf7QhrnwjqcQpcG12VTsYN7Ow+D2CH5JKs=;
        b=srNX2x/UPSvfaisJ0BdhgaSZ2efrfxawqw8qdPYHI0XhiT55xjMu8OzhlU77b6cRU5
         OwxAT01PoGNHXvrsUN3HLYcPMfKzO+Jndh8gfW60mGTKPVEDA8admLml5oFE124QVWJv
         5jYpdKKDConFj794Z1OvbaN8PQdrbTlGf8BXP6Leh4GCA4EpRkZokWquSUYU6Wr78M7m
         6+4fHI4pSKMWywjZJ1ERc74BHYCVZpXJu+tC5jB/tvIE8WxMkej5m5r+W1QpzgfUlInG
         uY5AUmLSlxy5Nb5RV63hr98jTfaDI1qAN2BhRUytLBa+woQc5S6DoyZtKtpenenB1Zme
         7Z+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tTvLlOnZrbf7QhrnwjqcQpcG12VTsYN7Ow+D2CH5JKs=;
        b=QA40BZxPe4BCCI1eBSY4k7/rSwe7TenxsW22jS5CsFQ76MmD3ZO30BFJHE4Z+z4ou5
         CDBk9fRa6t0SmMmBT9QkPQeWn7fZQBDBBuvcKhCMTGlbwJsODdfrjS/ybQs/nYrSImFk
         oKjA27SIZHinHn05+8r5VZYEZDlzWernFV7oTRDYHzVg05rBLby4vqzrZzgwAWyRHplb
         8YxdlmC1+e1q/qecpjdnDP16vuCo38P51YA2Qc23ODcBBntz19a8qYFxzl9Z6jVwmLGw
         xTutOrDXPS3x5nDQn/kL1TK47Oi+Qtga6YBcAIF0GAaDIH98DrwhMsnkCPu29tdkHMAG
         aV5Q==
X-Gm-Message-State: AOAM530bscQWxXMBM1RB9zNdC04caCKmLiwLlrVk2CyUUMMXLJeYDWhG
	94M8PSXgduq4B4ZhhyjtZ8GJXMBaiIBLuKqBRnQVoQ==
X-Google-Smtp-Source: ABdhPJxCMkIeTKsoiREhfYjSF/rs9p1Uf0TPIUhAdVQ3BspOwpAWXa78bd5UwWy0bC51AneBddnPdXUZhNJNQtYYxqE=
X-Received: by 2002:a05:6e02:49:: with SMTP id i9mr279875ilr.40.1601282347581;
 Mon, 28 Sep 2020 01:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200925114441.13905-1-brgl@bgdev.pl> <CAMKF1sqd4OscNS9sFLfcaQxoCANdnB1KoEt8s9O0GKcF-m5jDQ@mail.gmail.com>
In-Reply-To: <CAMKF1sqd4OscNS9sFLfcaQxoCANdnB1KoEt8s9O0GKcF-m5jDQ@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Mon, 28 Sep 2020 10:38:56 +0200
Message-ID: <CAMRc=Mdar_OD-KfeTcU1wEQA4owYChLH1KG9L5Q4R_zgqYtgPw@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: refactor the recipe
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, Sep 26, 2020 at 4:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> Usually, the recipes are moving otherway. include files are useful
> only when there should be multiple recipes sharing common stuff. For a
> single recipe it would be an overkill IMO
>

I considered pulling everything into libgpiod_1.4.4.bb but we're
currently in the process of developing v2 of the GPIO user API in the
kernel and libgpiod will get a new major, non compatible release after
that's upstream. That means: even if we pull everything into .bb now,
we'll revert back to having an .inc later.

What do you think is the best way to go about this?

Bartosz
