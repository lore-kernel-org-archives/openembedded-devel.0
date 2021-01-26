Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
 by mx.groups.io with SMTP id smtpd.web10.9608.1611649738703669499
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 Jan 2021 00:28:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ueQxIrTM;
 spf=pass (domain: gmail.com, ip: 209.85.219.42, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f42.google.com with SMTP id a1so7471203qvd.13
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 Jan 2021 00:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lHWuOsYRUSxdF61cHfLWkko8XwiYUpeAkhT5dty8Tms=;
        b=ueQxIrTMAmRWKjnCSJ4K8zwPQwySgpLnxYRlm5nBLpwwcctxc4lIiZ7zOrVXdlky8n
         yhxR+hq+XID6A1QjGatF0oPZ2e/iRR4iR0YxuU3dvyrZ6SOYRiR94l66iQ6CP8J+W5Wz
         6VtbzHoZKaIY8pKXIsvcxlJIz0pyv4IkB9Bj00l6zZlkDBoTIVF6Fw1KYalMzQLEsa/v
         kvRyZoYuLpwbj5DvV7bGKwP4RjUUeiCXtwogeDsXAt30MlOtu5NO9UPlo8I+XJgb8r+A
         dTUi/MNprgSvYKdho9WB81JvIi9QUecULgKCBRqSvfniJcOffpSHyaGw/vCkHMi0F81e
         wx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lHWuOsYRUSxdF61cHfLWkko8XwiYUpeAkhT5dty8Tms=;
        b=Lu48QMi4Wzwzgxo4TWLLh1WWTakVM3EGYeLZ8fTCLLD0JEpvSnh78ZYkuQtUTXfoJW
         nbglCCFfmSpQwkZaVjJfUs06zm3FY/bChurPH79u/8UdKBnEOBtjynDx61WD+PxK8hE4
         745KS0a+kI8WAGP7lsBvMU3Dq+MvYbUujY6JBOExYFN9wTiiru7Skx53cS2numEI+Tlf
         nZUPT0axvRKCnJB3NZqWHThzTQKpMRCI424wEkaiPeqMMD/AwcLBENnXt4eaJnoHh+fO
         blff8o4KLlDrfg4pOI8Emu7sSS6nSdP7UStK5V2MNzKx9NKHlu9/45OHPPOpomsmSJZS
         lmhA==
X-Gm-Message-State: AOAM533aBVQa+2bQ0itgiEcNhNtn3TXbMyg3MHihWDjVTEcmdIWG/Cxm
	2nRd0l8izCdvSL0DT+A0kgBz41TGzFljK3FR35M=
X-Google-Smtp-Source: ABdhPJw7kE22nnOdyYGSikLH+bDlpsFSvhIbmbHAHYSC9r7e1pBS7xJoeHqSn2CNQkZA7P29gXns+s2FHAeWYsLyqQw=
X-Received: by 2002:ad4:4e29:: with SMTP id dm9mr4478599qvb.5.1611649737805;
 Tue, 26 Jan 2021 00:28:57 -0800 (PST)
MIME-Version: 1.0
References: <20210126082535.49621-1-n.jeker@gmx.net>
In-Reply-To: <20210126082535.49621-1-n.jeker@gmx.net>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 26 Jan 2021 00:28:31 -0800
Message-ID: <CAMKF1sqf2VzsOy-UgepF_H=j7fuWjF48uqD7W-LCje5p37PEvA@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 1/2] networkmanager: Add PACKAGECONFIG for ovs
To: Nicolas Jeker <n.jeker@gmx.net>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 26, 2021 at 12:25 AM Nicolas Jeker <n.jeker@gmx.net> wrote:
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

jansson was in depends and here its moved to rdepends, don't we need
it during build ?

>
>  PACKAGES =+ " \
>    ${PN}-nmcli ${PN}-nmcli-doc \
> --
> 2.30.0
>
>
> 
>
