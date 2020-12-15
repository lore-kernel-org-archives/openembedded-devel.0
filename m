Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
 by mx.groups.io with SMTP id smtpd.web09.7403.1608012966081475262
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 14 Dec 2020 22:16:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qDZPqDks;
 spf=pass (domain: gmail.com, ip: 209.85.215.182, mailfrom: schnitzeltony@gmail.com)
Received: by mail-pg1-f182.google.com with SMTP id i7so2861097pgc.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 14 Dec 2020 22:16:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f68iVoQRihTURWz7G9aXwbQbXPADftwpa60yf+naiTc=;
        b=qDZPqDksWqrqWywwyeocsgCDFC/GhPKe1Mz6Y8MVLO8y9/8OwLmJYrSD7WBeaIb+or
         yBwIrP/HlCtaG6zpcz0h5KNAejjQRyal7HQBXCwO2h+wKYBOJhPTNjAGO5nQ/MVrQh+v
         8C+53Rmb/rk/ITSlsevVqppfd1RhStD0hDYGd1Hi9nq7qTcHDqymR6JzDJpoy/xXLpvr
         5rtB9LllUSD8tz6KeBX8U22s+ocM9HLl1sBpnIP4iMaqUcSnPZDfPAQCghT8B4ZyCuCc
         GzTNIgezTITH//1E6JJY2yQZ0q7d5i3twrMUpkBi1yA9s7N7bWp6VJ6n87bxuvvkHaiW
         0HCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f68iVoQRihTURWz7G9aXwbQbXPADftwpa60yf+naiTc=;
        b=hI64cPQIIIh0Hi+fGkBzPSX5uU2yU41Azp8Su642ZefgN101PumvUy2E/ziHqG2waO
         XrFm8RveBHYd9IJVUHwkklQoPnLVmVXCA4hZjXn4bDKHTQ/jX2MnYQ2h/UpFZhM0DzKm
         ei3k2OFSDx1+mdoyMEwDiJUKk4PO2ES62QW9kThNJN75hmXAwZELjhAZe87qs3FXsryD
         FaVVfv0RW2MvrnqoZx/cF4072leTsimoX7RWlErkO1sn42KwkmLMSxKsodKVUKB/fvOg
         031vaCHePN6JyhtzqcSSYRSuvpjkXFSERVmnE4b4KYeAJUb77jWdlRCsbVKvs6Sz0y4D
         BJ2A==
X-Gm-Message-State: AOAM5311j/SWT9bI4ensxh8eIqn3222sWSqS/O581guUglQoED2TbcQS
	aO9irnrTNVEPzA45Pk8dO0o9iohNlchZsloeZ3w=
X-Google-Smtp-Source: ABdhPJyEqWXDvD8Z/2/3q7mYxJqk+FKDu2+c5tjtHNgCzO9YGS4rePL+SsgYeXHJO0i/Pi7cV0CbTwUbq4hYykkjzj0=
X-Received: by 2002:a63:f857:: with SMTP id v23mr27798740pgj.174.1608012965613;
 Mon, 14 Dec 2020 22:16:05 -0800 (PST)
MIME-Version: 1.0
References: <5674ee97-bd13-1bae-a3f3-83c1c403f20f@windriver.com>
In-Reply-To: <5674ee97-bd13-1bae-a3f3-83c1c403f20f@windriver.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Tue, 15 Dec 2020 07:15:54 +0100
Message-ID: <CALbNGRRrDCExT9PmioSoL=sv+q3yRL+Lz6joW6FH_tp1QaR8Lw@mail.gmail.com>
Subject: Re: Fail to start gdm
To: Kai <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 15, 2020 at 3:58 AM Kai <kai.kang@windriver.com> wrote:
>
> Hi Andreas,
>
> I am trying to use gdm as graphical_init_manager. But it fails to start
> gdm with core-image-minimal-xfce.
>
> My config in local.conf:
>
> IMAGE_INSTALL_append = ' gdm rsyslog'
> VIRTUAL-RUNTIME_graphical_init_manager = "gdm"
> DISTRO_FEATURES_append = ' pam polkit'
>
> #
> # Use systemd for system initialization
> #
> DISTRO_FEATURES_append = " systemd"
> DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
> VIRTUAL-RUNTIME_login_manager = "shadow-base"
> VIRTUAL-RUNTIME_init_manager = "systemd"
> VIRTUAL-RUNTIME_initscripts = "systemd-compat-units"
>
>
> When I boot the image and run gdm, it shows error:
>
> gdm-x-session: X server did not write display string
>
> I have tried to enable configure option '--enable-suid-wrapper' of
> xserver-xorg, it fails with other error looks like:
>
> GdmManager: uid for sender and uid for session don't match
>
>
> Did you meet such error when you upgraded gdm, please? And what's you
> config when you validate it?
>
> Thanks a lot.
>
> Kai
>
Hi Kai,

Ooh - haven't tried this for very long time - am using sddm. When I
last tested it It looked to me that using gdm with something else but
gnome is pain.

As you might have seen my recent Yocto activities were few - am in
release panic on the job.

Plan to do some work on meta-gnome and meta-xfce during x-mas so will
look into that then.

Cheers,

Andreas
