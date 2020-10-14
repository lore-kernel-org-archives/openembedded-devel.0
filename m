Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web12.3133.1602702261227096108
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 14 Oct 2020 12:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k4JQO1wo;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id s17so75219qvr.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 14 Oct 2020 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZIZhji2ZO/fmfzJQLh4vD3vTsOudolpALq1Cq3xHaA4=;
        b=k4JQO1wo3ezJV+9KSaWa0p/qfhbE9Pr6+Lgm6DULU0hJoFnOgu1X/dVO92Wm+YnwTb
         oq+QtaWTnyYlPF9e1pJhgy3MLx2/ZMlOxdvEf8YfIQWfedIcpft0cO5Q9fz5a1Xg9HcW
         4hfvf1fl9TRrBzZggwqJm9KokfZUvkqCdRoFlt55R/byG3tbQTkJkZK5HE5C9RM8NqUz
         r4MkgXAeu2wpeiNjLGsc0tRI7JQ7Ettj7cHPorr+n6tKQzg02adN1Q3ylc7FcT4FntuS
         LUItKr8Gr+yb92L6mC1lBKhJmj0MPKHXtAi1IFENJuHwQaANRakChhlre7Lj8MTgeF3f
         +88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZIZhji2ZO/fmfzJQLh4vD3vTsOudolpALq1Cq3xHaA4=;
        b=t2WUAWqfryzvnpIgsg4kFbvC/64gS1GF0m+E48hmJLcHz2i9eOq1d+jbkgqOSP6Mxl
         Qyl3dUQW6KG3wcYFWywYEXL3Zea1OKvHTBGWOX28TNYWdJvX4J/q/keioMjMnJyjMMvc
         PHO1P9dT4Uhez6DEkRD4wFwIOm0Jy2NCkXGdg4Zmpf0WDcny7cvwryrbdsy+/31uH5FE
         GuwG+0ziVAvOihgao8NzoAdK5oLu13E77KaSdrV8Ltyo3NWlDfhHvApyQvadTSZkb9x6
         cxlXHYVPl5yYqhUZBXsX+TCqydAtmcsI2i8TpF0tKCEJQdCMeDgLtRfYw3qFQaTMopb4
         V4ng==
X-Gm-Message-State: AOAM532ffKvYgklWNcvgJvHpyRitf5E/nzDSpp2y2IDPEMCwYM9bR6cU
	74JkKOaRvSXTXTL2xkqO1B6yCONTZXsQZ+6HdyToYPvofydMUw==
X-Google-Smtp-Source: ABdhPJwB3u+/EMssRxDLFa8TDybnYc4BWgIgM/8wWHk/YAJHhlomHkpZpsP+bJwmvmpYmNJ5PfCd6GDWyrsYmlyluq4=
X-Received: by 2002:ad4:4512:: with SMTP id k18mr743930qvu.5.1602702260141;
 Wed, 14 Oct 2020 12:04:20 -0700 (PDT)
MIME-Version: 1.0
References: <CAAwVp3tD9OhFAiEKqYSpUxo9eGMaaUxqzYJ+-ADM+p4U+=-tJg@mail.gmail.com>
In-Reply-To: <CAAwVp3tD9OhFAiEKqYSpUxo9eGMaaUxqzYJ+-ADM+p4U+=-tJg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 14 Oct 2020 12:03:54 -0700
Message-ID: <CAMKF1spPZ5RnxxoEOkwx=4zb24J-bsizn8bkGT5zdwGLf7ZibA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] wireguard-tools: Fix systemd service installation
To: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Stefan Agner <stefan@agner.ch>
Content-Type: text/plain; charset="UTF-8"

Hi Mario

Thanks for addressing this issue

On Wed, Oct 14, 2020 at 9:07 AM Mario Schuknecht
<mario.schuknecht@dresearch-fe.de> wrote:
>
> Systemd configuration file wg-quick@.service is now installed in the
> usual systemd path.
>
> Signed-off-by: Mario Schuknecht <mario.schuknecht@dresearch-fe.de>
> ---
>  .../recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb          | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> index 31b33a045..bd92c5d51 100644
> --- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> +++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200513.bb
> @@ -9,7 +9,7 @@ DEPENDS += "libmnl"
>
>  do_install () {
>      oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
> -        SYSTEMDUNITDIR="${systemd_unitdir}" \
> +        SYSTEMDUNITDIR="${systemd_unitdir}/system" \

Can we use ${systemd_system_unitdir} here

>          WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES',
> 'systemd', 'yes', '', d)} \
>          WITH_BASHCOMPLETION=yes \
>          WITH_WGQUICK=yes \
> @@ -18,7 +18,7 @@ do_install () {
>
>  FILES_${PN} = " \
>      ${sysconfdir} \
> -    ${systemd_unitdir} \
> +    ${systemd_unitdir}/system \

same as above

>      ${bindir} \
>  "
>
> --
> 2.16.4
