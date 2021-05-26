Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.2530.1622059136250537652
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 26 May 2021 12:58:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=t/Pe9oiO;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id t21so1175292plo.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 26 May 2021 12:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+sIFbFxChevMGY26N2ao/oml1LVqnWZOqrMuLb9O4bI=;
        b=t/Pe9oiOzAGu4udF/C3EAt0vUvcjDYPy8jM8U65DSzHjhI3WposVe1ttUwgDTcB7++
         1bZb0GYnj72Zk6mgAznQq9AXIw+fARJohzlbWX+yX2vHjV2pkwvK6QYTCBEt12NVxNOX
         x6NBJLNXt37WAZwtzfv/nGcLU+YqldRlU8vsLpUWTKGVhTIcI10lFhRpS6AlyZOdwdAU
         krNf8N+3/vv9Lyc0QvgISJ+P1jVbiOQVOtLDZPQDA8vJTRHWY57Lauh3eV80tpivKqxG
         vYU4CFxS+AKMQUwT3+Q/BgSo7wU9QnpTAsiXttoEcLHRStn6PJ0MA0i7Gf8UfQ0L/tnQ
         9spw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+sIFbFxChevMGY26N2ao/oml1LVqnWZOqrMuLb9O4bI=;
        b=ZvqhkjEV6YhqLDLmGCXib44l3ECbUXHPKTVPl82YOsZaTuj2IU2DFaAaMM+N/zW99o
         SF6r6Mu6xgDeAWf96Lt3EsfmtAgx5SiwRJv0NI6Cu0LEIqbnZKumaZiDvFa4IuLPCwJb
         w/GQTO/mhj80Frhz1coBB9uHf9sk458yo33mJFElffFdY1JpkmpWyDNiBFb9855+lfRb
         JtygDXgOgC0qTwkvhbJCcw8mu3pgVdzwmELcmVPx9M8cCulJEg8zwJ2TtKQgNrxPhVbm
         UNJg7f/3YDCmBrQYD/bHHBaTmw07CyWybA4pNv/yUI8sV9oCOtZNBQ6wxehG+92+94fC
         7ldg==
X-Gm-Message-State: AOAM5311O9mLs7VednDpZImgpEvsYz+wF3VeWztm5+hIPQ60Io0QR23i
	Eql4VISo9cFlSTl4ElpXoloon5QKotzJnyRtlcY=
X-Google-Smtp-Source: ABdhPJzyPCBddKSVh9zYmR5qkM7dZtfGb8x9h3pJ7nRuyVVlGXFkDlgF2NYya0F0sas9AksXEMOR5R0SqRAVYjgSUMA=
X-Received: by 2002:a17:90b:687:: with SMTP id m7mr36783105pjz.133.1622059135640;
 Wed, 26 May 2021 12:58:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210526143604.3921863-1-ross.burton@arm.com>
In-Reply-To: <20210526143604.3921863-1-ross.burton@arm.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Wed, 26 May 2021 21:58:43 +0200
Message-ID: <CALbNGRTdveaEGBNy+wcVbB-Yr4EJB_pcandXVGazeK3zcdqfQg@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-gnome] meta-gnome: add Cogl/Clutter from oe-core
To: Ross Burton <ross@burtonini.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, May 26, 2021 at 4:36 PM Ross Burton <ross@burtonini.com> wrote:
>
> Nothing in openembedded-core needs Clutter now, and Clutter is abandoned
> upstream.  Move it to meta-gnome as there are still a few users of
> Clutter in Gnome.
Just out of curiosity: What needs cogl & clutter these days? I thought
that both were more or less merged into mutter.

Or in other words: Who/what would miss them?

Cheers

Anreas
