Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web10.32778.1601897137263087585
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 05 Oct 2020 04:25:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=Ck85VMlT;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.166.193, mailfrom: brgl@bgdev.pl)
Received: by mail-il1-f193.google.com with SMTP id o18so2539599ill.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 05 Oct 2020 04:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JYPYIdtUJHU6uFbXZOrGgPSjSyvYCPuaXAooo57zfxc=;
        b=Ck85VMlTz52FHq3QUARJbEezuQeB9NGXqTq9rJXDTcphNlNyLfa0/OzluTdERzHvdv
         tSpXVGlK8aV3Ese56HBeb9oNmXT6xZG9bpPcqf45I2jQjs3WE34chIvqYO8lO5UeX8d6
         Ug3ke1cNVbuqr02RINl70sCy4t0+f99nmRSuFrf5ZkDsf5KpQyMnXZtGrdPppwx6Dx6J
         JL3sijpwWn4fgvSNVBofIwyGzIqGB6V7/qMC+kWbKUD9ngAz3g4j/FxTYwcEo5jz6JbH
         4DAH8uUH+GdMfZqPVuV+TCO1w/xgsp/WOEpCmtXf03fNDP5qKq1hGiJhkC0FeOFtH5PI
         Bwdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JYPYIdtUJHU6uFbXZOrGgPSjSyvYCPuaXAooo57zfxc=;
        b=NVjXwiwg5jBi+gFQIXTkzKpx8ZPn9W1Jeuvao3LwpaYJDlhsMLxwPSe5sNCO0vyDJa
         imsSW2p51rOvn8gxVYDm6kaqPN2Sps+nrJEc/IfC4+6AG99Taik/ecAlGPY2yHfW0der
         U4PKh8m3Tz+L0mbbwc1704ZnlxStAsTS55aecgBYHRpbkJKU+VnwpdKxChmKIqZH+gPu
         KT5uuvTdcXyazefQvfLsmJUzv+jt33Wpk34J78H3WzKXuzAJ6t0vl58PmAawhLRStRPz
         JnO2F56Skn/N6L8Pto78ntA3ATJIzMKdTMmOuU/gCB+8r6+Tbm4iKOjz+2zBy98ZCit3
         nkSw==
X-Gm-Message-State: AOAM533nKcvm+Gf3QvQSttMgsCRRrvvga0rOAKKfslK3YB85ZUflcf7N
	wLg+fF9Go4sgE/TFEfv8Ix7BxnU7pI07EoqvViITPw==
X-Google-Smtp-Source: ABdhPJzPRN1KxivLF8fD/zpscpLiE38grVArLk7y+TbcqQxlAzTMtTR0YfK2KKC5J7UvHYN7ek4kAVHQoMRRh1aOLDI=
X-Received: by 2002:a92:1952:: with SMTP id e18mr10796241ilm.189.1601897136477;
 Mon, 05 Oct 2020 04:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200928124526.27734-1-brgl@bgdev.pl>
In-Reply-To: <20200928124526.27734-1-brgl@bgdev.pl>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Mon, 5 Oct 2020 13:25:25 +0200
Message-ID: <CAMRc=McQ99QcMtdOH-2Y17QOrs=RyWMZHQ60aPAaTurR7VC3Fg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: consolidate the recipe files
To: Khem Raj <raj.khem@gmail.com>, Armin Kuster <akuster808@gmail.com>, 
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 28, 2020 at 2:45 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> After dropping the support for v0.3.x, we no longer need the split into
> .bb and .inc files. Let's move the contents of libgpiod.inc into
> libgpiod_1.4.4.bb.
>
> While at it: do some refactoring: let's use ${BPN} in the URL, consolidate
> certain variables and add some explanatory comments.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---

Hi Khem, Armin,

Are you fine with this change? There's been no follow-up on this since
last week.

Bartosz
