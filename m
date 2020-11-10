Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web10.20614.1604966485363723480
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 16:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fbJQnkJw;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id g17so7409022qts.5
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 16:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NC4MgX0AJ3UdwWmFpg4AMDsdp5FbwQG46jLOmrAZ3x0=;
        b=fbJQnkJw79y5f/6nxsOw09uDaxOS/FUgt+tEr0gywWMvraG+pdtzDSvWOYCcoKRj9r
         WmkzrzcrVqYNiomjZSWKBFXEhZC0qOorIW4D4h6r7aFJCWyqPGgVi4f639M+9aVnAeTs
         L/LiUSxwcybcP/OS3ei2NdCBQJMWBP+SzyAhw4cX7llMkRGl9yBK6P16RabjEkQFmwXy
         FmDwX440PbF6fKtAfvWIBoxAeCqq8ThiUv4xTxKV+R9OkTMeJYe1cXzgJfnK+ACmNCwk
         Ka4a+pIUDrBMCSKX9JTvJEG2sUQ3R0UoooJmGOmKxi2BYpMGg5m52tyfO9wUdTmYfuj9
         QWNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NC4MgX0AJ3UdwWmFpg4AMDsdp5FbwQG46jLOmrAZ3x0=;
        b=LHwi7ekJ1aLZXkQIjdNXwt6wg5FqvRRBwZ5tfCqXpoRk+vagV5HO/OK5nGU+Xv7Seo
         +dW98w4k5LbIkS7L3AYLUjB/uzkjVdyU4hZOXiTs9Uova/U1C2qf7MAIQi0uKTZ9JDCp
         5Bhzs4IVrlM6XLTkoxuYNj1ExYVm3W4/K/ujhwSwoX4ORRxv7YrCmKW7KnMlJE5nil3Z
         HXqnO4iRYOOXb60Az9/XZsDSC2rcq2t1D798C8PzZopqtavAK7iRrR9QQH5Sb1GFlV3M
         HvLeeqHaeIGWK1afj9je3wQ63oJpZ+0LGUSkt/px5wXceibIBriJisLbhwtw1BcLkF2E
         BW3g==
X-Gm-Message-State: AOAM531Z7qGTgoEjXWbxGaKMGEVkSZt3xi43Zvw/VQMEc8CVGv96vPTL
	c52NRo6v5ph42cW55Jmo1P7+ZcA6pAMICEqiwoM=
X-Google-Smtp-Source: ABdhPJwVF3G34weAU7+y251gtivsgJgns8MurzNIDDdI49igoyZOOdMWChEEUwKXJO8Fv77K5HfT1QObPcgjv8UC9B8=
X-Received: by 2002:a05:622a:1cb:: with SMTP id t11mr16199716qtw.378.1604966484306;
 Mon, 09 Nov 2020 16:01:24 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604935361.git.rosbrookn@ainfosec.com> <b26c5c7085c0fea710a37de329a8972b66d9f3c8.1604935361.git.rosbrookn@ainfosec.com>
In-Reply-To: <b26c5c7085c0fea710a37de329a8972b66d9f3c8.1604935361.git.rosbrookn@ainfosec.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 16:00:58 -0800
Message-ID: <CAMKF1sriwh8+Z2P6FDd4B_mK8aqAipRffWCUvPmakiaCcR-02g@mail.gmail.com>
Subject: Re: [meta-networking][PATCH v2 1/2] strongswan: do not use deprecated stroke and starter by default
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nick Rosbrook <rosbrookn@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

it seems to fail

https://errors.yoctoproject.org/Errors/Details/537881/

On Mon, Nov 9, 2020 at 7:34 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>
> The swanctl and vici configuration of strongswan is preferred, as the stroke
> plugin used with starter is deprecated. As a reasonable default, add swanctl
> and systemd-charon to PACKAGECONFIG by default, removing charon and stroke.
>
> While here, make sure strongswan-starter.service is only installed when
> charon is enabled. The current unconditional installation of
> strongswan-starter.service can break systems which install strongswan.service
> for use with swanctl.
>
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
>  .../recipes-support/strongswan/strongswan_5.8.4.bb   | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> index ca645ed2c..abba86e39 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> @@ -25,7 +25,8 @@ EXTRA_OECONF = " \
>
>  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
>
> -PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
> +PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl \
> +        ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd-charon', '', d)} \
>          ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \
>  "
>  PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
> @@ -135,4 +136,11 @@ RDEPENDS_${PN} += "\
>  RPROVIDES_${PN} += "${PN}-systemd"
>  RREPLACES_${PN} += "${PN}-systemd"
>  RCONFLICTS_${PN} += "${PN}-systemd"
> -SYSTEMD_SERVICE_${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}.service', '', d)} ${BPN}-starter.service"
> +
> +# The deprecated legacy 'strongswan-starter' service should only be used when charon and
> +# stroke are enabled. When swanctl is in use, 'strongswan.service' is needed.
> +# See: https://wiki.strongswan.org/projects/strongswan/wiki/Charon-systemd
> +SYSTEMD_SERVICE_${PN} = " \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'swanctl', '${BPN}.service', '', d)} \
> +    ${@bb.utils.contains('PACKAGECONFIG', 'charon', '${BPN}-starter.service', '', d)} \
> +"
> --
> 2.17.1
>
