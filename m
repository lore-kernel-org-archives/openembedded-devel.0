Received: from mail-il1-f193.google.com (mail-il1-f193.google.com [209.85.166.193])
 by mx.groups.io with SMTP id smtpd.web12.3230.1596794969775942091
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 07 Aug 2020 03:09:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CxTi2txo;
 spf=pass (domain: gmail.com, ip: 209.85.166.193, mailfrom: schnitzeltony@gmail.com)
Received: by mail-il1-f193.google.com with SMTP id t4so1334895iln.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 07 Aug 2020 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5dbqRTjDHECrSq1v5DCdMCh4rG+Y0qTGbViU0qxi9sc=;
        b=CxTi2txoAJOnTb6+wP5lJPw14bSHRTw6ZDvQIkaUYo7uc5U5zct9Qq4417qeqnZD8k
         rjI/PYWGKMi1Huw/L1E1q4aRFVhj5PTY0W0Sp+HqjvboaCHo+p42qJ0uoleX5xbdNt6Z
         hrTpL74qzUiSrMPF0VTxPY129WNhod27MkMr8J/2RppQ6LuvhStkpJwQ0cZGzoKHt3Fk
         5qQHhVVVVEy85XtUFBbNvWkW3AWagAQm0nV/nnMwHO6mCb1R8qLh2oE0VAq3d4TfwaWe
         rh+bcs3ltdjjMMqlZoNYb1RCouVcCXgyNzSw3deS9Z25/LUVf7yqoPsk1y7zWeYEcn3g
         WlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5dbqRTjDHECrSq1v5DCdMCh4rG+Y0qTGbViU0qxi9sc=;
        b=ZVnJiI+MBW9QnEMsE3JCG/6ohMR1A1mJBF3o+lgywsa8wU5Fg6Mh3PhsBqMD3Vnnk2
         YfT0WDJx5eI2lL8bRkfbGfDBbWjmfbWHQ0OTnxhRltV/Fwm0tbshIhK/DxiM4r8fH6g6
         GYzLKdfyQZ9HTZByMToAm1lAmgQNXLCEbsb7BnqRM/65PDt4i3TEIMoj9vgm13MBrDzN
         a0svbU8DDWdMI4QVcQE9gx0lqb9nH3tYPiq/5T0us4drAdAAlxv5jl2VVqmw1dQdCZXE
         9xPRwpHuLbsolRpBIaMOPqXgU7bUFCHUAUsv8tCJH2s4ZJInzKfRMtKxmZrpOXPipVfr
         RVIg==
X-Gm-Message-State: AOAM530QxXoTcwrqRshBQVBhKHGKjlezS2LVcGW06w6WJ85Fd1XS9+O7
	QQ2Ex0lhSyXIzIBAWW/1IZREzPJmr5Ngu3+nCOw=
X-Google-Smtp-Source: ABdhPJwye79xLs6h8c1MUjXocQtGo9bEkXHmr/OsspznUva84N8I9uNj7iGT98F3ieWKS1L9EBmi4xhaNKrwzJM3iNA=
X-Received: by 2002:a05:6e02:c09:: with SMTP id d9mr3824880ile.289.1596794969123;
 Fri, 07 Aug 2020 03:09:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200807082651.3326045-1-raj.khem@gmail.com>
In-Reply-To: <20200807082651.3326045-1-raj.khem@gmail.com>
From: =?UTF-8?B?QW5kcmVhcyBNw7xsbGVy?= <schnitzeltony@gmail.com>
Date: Fri, 7 Aug 2020 12:09:17 +0200
Message-ID: <CALbNGRTeWP9yXhkdwjp5FRKn74Y1OHMR-MOTTRuL0zcqzjcE3A@mail.gmail.com>
Subject: Re: [oe] [meta-gnome][PATCH] gnome-settings-daemon: Add introspection to UNKNOWN_CONFIGURE_WHITELIST
To: Khem Raj <raj.khem@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 7, 2020 at 10:26 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> gobject-introspection is needed unconditionally therefore add "introspection"
> to unknown configure option whitelist
>
> Fixes
> ERROR: QA Issue: gnome-settings-daemon: configure was passed unrecognised options: introspection [unknown-configure-option]
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb       | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
> index 730ea9ed05..b38ba558c5 100644
> --- a/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
> +++ b/meta-gnome/recipes-gnome/gnome-settings-daemon/gnome-settings-daemon_3.36.1.bb
> @@ -30,6 +30,8 @@ REQUIRED_DISTRO_FEATURES = "x11 polkit pulseaudio systemd gobject-introspection-
>  SRC_URI[archive.md5sum] = "102dc488a6a726e4050cf5ab7e967e8d"
>  SRC_URI[archive.sha256sum] = "3e33dbd319b562a5ab602dcab6de3ca81b85f8346672e90ec632b36bbf15ee4b"
>
> +UNKNOWN_CONFIGURE_WHITELIST = "introspection"
LOL - was just removed and I was wondering but did not find the time
to write... However - have a nice weekend

Andreas
