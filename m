Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.2056.1604607663558903706
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 05 Nov 2020 12:21:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GgcQNyfo;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id l2so2482668qkf.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 05 Nov 2020 12:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tfY50ZhoVlsjGR0c9cYHOSzieaPFh3Nk7LAoLWZ+2Eo=;
        b=GgcQNyfox6VuM/RLAac0OFSJzNHI6TkjH1YXdZxygTY/Yfl3S0TqXrAHV7VGuSWht/
         SSjTd1T3HLBdOtF3G9txl6Sxwb2/W5WEBOsN+P3k3XfLjHv/l9TwRcCM71NdqKhKShnM
         OMCOtYLO4/VN02RBhh5t92Sm2QKFMSODQcYjg4X8Ra3V5sDPnXC1bU72KBnQzscPF9U+
         ItazOrIDObVqgxmNgn59f5vDAIqpg94X2HzDy7Q8M4Wmz3YERfRp6Aczr616I27RlxlL
         kbnYp4ujAyXEz93/IPflPCVPZ2VX/6i/FwS8g0wfObkfjtGF1Q4ACEwrSQ1NGaEbfeOP
         757w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tfY50ZhoVlsjGR0c9cYHOSzieaPFh3Nk7LAoLWZ+2Eo=;
        b=lEWwa4oU5Er9AaipCcw7IAgpUU+Dc046QFbclBbS1r4pShGg70wUwBKG6skr1gCfRU
         igzMm/66Krm5/Yo9uASN7WrJpMqwfB4/C6Umbps/0M1QPPZAzMZQbBLyC+9Ii7hn5smQ
         GXv6PQApacC2yr7f1d/NRo+JY0rK8pvAzbEx9o8upmAiLshPbilweQZm0b4QYSXnMAyv
         YV8ItzBn7kdcoMkyJcBeEOMxUJou6ylBnA1SyXP5x16CWzb3PWJUSfrPAPUj0G8Nsr3G
         OAefSATA6UE6A1KzFe8z4EtO65VgMS0n2Hb7dt/cCU1Ihg9AVsg2SBUaf7NlEdOYeMwv
         FFYA==
X-Gm-Message-State: AOAM533fIculuUDe6Vg4R+Hb1f4RYRtdfJOOVuuH+bVLlsXNj7F2blZ2
	nNjQ2BvnvDolX5PucXtGYUqh+Ek8alfZG7XyWuc=
X-Google-Smtp-Source: ABdhPJxZb0lOQeyeEY0bfOq8BT7IuPZMM4z18kgT4GV8C3+HwO8BzKdDLaROiCWZeRtTrg9dMlPeGM9YtsBs1OYA6Gc=
X-Received: by 2002:a05:620a:c07:: with SMTP id l7mr4061707qki.9.1604607662603;
 Thu, 05 Nov 2020 12:21:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1604605168.git.rosbrookn@ainfosec.com> <78fd054347adbdb03d3faaae803d9ab3ad4da060.1604605168.git.rosbrookn@ainfosec.com>
In-Reply-To: <78fd054347adbdb03d3faaae803d9ab3ad4da060.1604605168.git.rosbrookn@ainfosec.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 5 Nov 2020 12:20:36 -0800
Message-ID: <CAMKF1srO7=d+ZWvd-3xYbamddv14=6NYUnmR+_BQgMZEc2XYHw@mail.gmail.com>
Subject: Re: [meta-networking][PATCH 1/2] strongswan: do not use deprecated stroke and starter by default
To: Nick Rosbrook <rosbrookn@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Nick Rosbrook <rosbrookn@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 11:49 AM Nick Rosbrook <rosbrookn@gmail.com> wrote:
>
> The swanctl and vici configuration of strongswan is preferred, as the stroke
> plugin used with starter is deprecated. As a reasonable default, add swanctl
> systemd-charon to PACKAGECONFIG by default, removing charon and stroke.
>
> While here, make sure strongswan-starter.service is only installed when
> charon is enabled. The current unconditional installation of
> strongswan-starter.service can break systems which install strongswan.service
> for use with swanctl.
>
> Signed-off-by: Nick Rosbrook <rosbrookn@ainfosec.com>
> ---
>  .../recipes-support/strongswan/strongswan_5.8.4.bb    | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> index 8a8809243..59641cb83 100644
> --- a/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> +++ b/meta-networking/recipes-support/strongswan/strongswan_5.8.4.bb
> @@ -25,7 +25,7 @@ EXTRA_OECONF = " \
>
>  EXTRA_OECONF += "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
>
> -PACKAGECONFIG ??= "charon curl gmp openssl stroke sqlite3 \
> +PACKAGECONFIG ??= "curl gmp openssl sqlite3 swanctl systemd-charon \
>          ${@bb.utils.filter('DISTRO_FEATURES', 'ldap', d)} \

ldap is not a standard DISTRO_FEATURE so lets keep it disabled by
default. secondly enabling systemd-charon here would mean it wont work
with sysvinit so lets make that
option depend on systemd DISTRO_FEATURE

>  "
>  PACKAGECONFIG[aesni] = "--enable-aesni,--disable-aesni,,${PN}-plugin-aesni"
> @@ -133,4 +133,11 @@ RDEPENDS_${PN} += "\
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
