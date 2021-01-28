Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web11.672.1611861124722728064
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 28 Jan 2021 11:12:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HJ5XqwLf;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id t14so4898948qto.8
        for <openembedded-devel@lists.openembedded.org>; Thu, 28 Jan 2021 11:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OZnVXQILD3UWfShxPvVbqQTK8cqvQNTk44BuJF3c/LM=;
        b=HJ5XqwLf160c+GMMpfAlVAcGhQHVxd+/BA2o7XJ4F6dbjQKGkFnz9fdLxo6PVrcmDw
         ea4NxHmdnT1I0ibqIK7yA4JRSABBt/fXKsr6AUd7xXGv6AFy6n7mu49vAv/t/CEX0kOP
         KJKK/N6R2UQVGLF0aO7IGsvNxmrWTffjaVMrJ27lxoLX61Gj9VwpzQta+4R8eCjSF0wU
         zOSCzKmbr115/QdS+Vdy9Gzp6pfXhQoqdYeL8Y1h1mgoJaFFWHyL2p2Q+vbKycIRf+BM
         02gFmR79m8U+OtWdyqFKPtRGBCJ02EcYv0fpG8PiHNbU/eN/sszZ1yrEL1zLGQ46d9fk
         UIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OZnVXQILD3UWfShxPvVbqQTK8cqvQNTk44BuJF3c/LM=;
        b=YrTUXDew+WcJguLRVMpOkWuVL7eCekjYCx59ciR18KuV4dO3fHXEXiE0i6ZKGrpOeb
         XtTbr+UYYxyGixfYEpYSqyl6fpfQdl3nA/rSUswIlFGkbN5BxKMVZQnXIBzDWA79Hg58
         W1KcQGyHAwjp8YFiPqGR2tog8e0x0ql9rP8JdxgiwdSs6S5x/UJYLla7JGGdPXF5iapy
         DayxfH+nzcCSSSgxtndYaJYvTDI5q2zt8jmCO+vDwSiCeTQeUzjVSAZ062BX4l3de+hB
         X4UfyJiFtZwl1c2D2X/ysI+ijf8xE5ey1wv6p1dWtdbe2QpINLXC+59nbvtLO9g5RssQ
         /d4w==
X-Gm-Message-State: AOAM531KwejD7xK6RUWzu0S7Q6RytAg88fk5Q2kA/o0l3R5kuM1No6zB
	gZ+9R67OITLp0I6Y/ADA6+B4f627I+DpCybSW8k=
X-Google-Smtp-Source: ABdhPJzePa8tTMwT65T+y4uXQrTiORBxNs/+ANXvT9hDEaWKNAave+hlw3s+mljEHIXT+BUP9KOofwvLPSyvqrusfgs=
X-Received: by 2002:ac8:5bd1:: with SMTP id b17mr940107qtb.53.1611861123780;
 Thu, 28 Jan 2021 11:12:03 -0800 (PST)
MIME-Version: 1.0
References: <20210126072241.43425-1-n.jeker@gmx.net>
In-Reply-To: <20210126072241.43425-1-n.jeker@gmx.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 28 Jan 2021 11:11:37 -0800
Message-ID: <CAMKF1soJ8hAOh0BMg1qZH=nbqjbawLGYNQ0DGHXNmkzO=YFJuA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] networkmanager: Add PACKAGECONFIG for ovs
To: Nicolas Jeker <n.jeker@gmx.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

is this ready now ?

On Thu, Jan 28, 2021 at 9:19 AM Nicolas Jeker <n.jeker@gmx.net> wrote:
>
> Open vSwitch support is enabled by default in NetworkManager, but only
> useful in the context of several virtualisation environments, e.g. Xen,
> KVM, OpenStack and more. Therefore, the ovs PACKAGECONFIG is now disabled by
> default.
>
> The jansson dependency is only required for Open vSwitch and teamsdctl
> support in NetworkManager. As there is no libteamsdctl recipe around
> (and no teamsdctl PACKAGECONFIG), make it dependent on the ovs
> PACKAGECONFIG.
>
> Signed-off-by: Nicolas Jeker <n.jeker@gmx.net>
> ---
>  .../networkmanager/networkmanager_1.28.0.bb                     | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> index 1053bdd42..157a7e7b0 100644
> --- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> +++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.28.0.bb
> @@ -15,7 +15,6 @@ DEPENDS = " \
>      util-linux \
>      libndp \
>      libnewt \
> -    jansson \
>      curl \
>  "
>
> @@ -85,6 +84,7 @@ PACKAGECONFIG[wifi] = "--enable-wifi=yes,--enable-wifi=no,,wpa-supplicant"
>  PACKAGECONFIG[ifupdown] = "--enable-ifupdown,--disable-ifupdown"
>  PACKAGECONFIG[qt4-x11-free] = "--enable-qt,--disable-qt,qt4-x11-free"
>  PACKAGECONFIG[cloud-setup] = "--with-nm-cloud-setup=yes,--with-nm-cloud-setup=no"
> +PACKAGECONFIG[ovs] = "--enable-ovs,--disable-ovs,,jansson"
>
>  PACKAGES =+ " \
>    ${PN}-nmcli ${PN}-nmcli-doc \
> --
> 2.30.0
>
>
> 
>
