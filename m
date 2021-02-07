Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
 by mx.groups.io with SMTP id smtpd.web11.17044.1612677106046545170
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 06 Feb 2021 21:51:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pEu6hEcP;
 spf=pass (domain: gmail.com, ip: 209.85.222.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f181.google.com with SMTP id r77so11285143qka.12
        for <openembedded-devel@lists.openembedded.org>; Sat, 06 Feb 2021 21:51:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dbBI7gCjJFgVYemkmf570UC1FggxOBkG6VPGopZ++kE=;
        b=pEu6hEcPPUxwytz3ZsszBO7kJ4HW0zRNtYH0BAuvtB0MPeqIZLU8HCE+2S1FTsFjKq
         Qko5yCrxvF2/3FU0jcfH2Ec4mIXCZFCYWE+naJdd9ekXgNAY5shq+CNd4RbVQFJ9byfi
         O3/tJdaYWEiiPyhB0FgXDOY+E67IJqfr9zX8brh0uwUm6ab0iLVMavs5emIRS3IPw3gf
         XQGeaP3CRJ0YADB1BzZ9EOC4uc+E3vLgJ7Sfe6jV+aacl8/9Dvs3wv9yL8GT62+vZUjB
         BIpwWgSXYS+lMcvz9YGqsm6Yh0WHV9PkgPAkVOPMYoyYyabjj3HwOxIoypia/9m+XOxa
         RCcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dbBI7gCjJFgVYemkmf570UC1FggxOBkG6VPGopZ++kE=;
        b=dB6TUtkfD7dC816FvT5oyTU9JVmVxl4SsBv87ylwI1jGnR21xM1wWuqrg/V0Bdl51G
         /5/O1g8zkKXUzeR8oKeFv83Esj6eeHKeUGAU+0LSXfW6r4cJYwjePQGhpfGJkyYm/7ii
         /VYDPV9SCNidUyZ9fXLZQsNCI/G1Qy+LjLOiDBd+FJsOPzFQ57sqLZfpPiSshDdpHgX4
         PQJo362r7y9qQJKvxYv4i6vuNCM473fFyLAI421ysINAMKrS54Oyk22RGXUico+BfbJI
         l3afbwvy7iMbNXGLE9K+Xy0ARwCUoLosAWe5uwsIWAGA24aaTH+5Q9z2K9r5M+gJyCc0
         7Wfw==
X-Gm-Message-State: AOAM531oDFdSEq/YW00bBThK6Bja6E0TpktEIs+LJqlpua2oMG/+eHlQ
	uISMU+Lc4M8V0LqLTHR5n61ME3ObQQKpi4utJQ9vLnGyqqjMDA==
X-Google-Smtp-Source: ABdhPJwOQ+4ZFiNeaR0BkKM9rx6WyXV5AnTlwxS/5ToHUZMAow9xw4aCAnRwxNbziwU3kop8Rjr7mYxuMLfPdqp2hi4=
X-Received: by 2002:a37:7047:: with SMTP id l68mr11022438qkc.337.1612677105232;
 Sat, 06 Feb 2021 21:51:45 -0800 (PST)
MIME-Version: 1.0
References: <20210203185803.1413539-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20210203185803.1413539-1-open.source@oleksandr-kravchuk.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Sat, 6 Feb 2021 21:51:17 -0800
Message-ID: <CAMKF1soVGECSRd9+x8sZWGq=9Qeoqn6=Zx_sW4yD8dGrOUkqkg@mail.gmail.com>
Subject: Re: [oe] [PATCH][meta-oe] iwd: update to 1.11
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

fails to build

https://errors.yoctoproject.org/Errors/Details/569682/

On Wed, Feb 3, 2021 at 10:58 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> Changelog:
> - Add support for ACD client for static configuration
> - Add support for intelligent scan of all frequencies
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta-oe/recipes-connectivity/iwd/{iwd_1.10.bb => iwd_1.11.bb} | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta-oe/recipes-connectivity/iwd/{iwd_1.10.bb => iwd_1.11.bb} (96%)
>
> diff --git a/meta-oe/recipes-connectivity/iwd/iwd_1.10.bb b/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
> similarity index 96%
> rename from meta-oe/recipes-connectivity/iwd/iwd_1.10.bb
> rename to meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
> index b2495348f..f4a237e03 100644
> --- a/meta-oe/recipes-connectivity/iwd/iwd_1.10.bb
> +++ b/meta-oe/recipes-connectivity/iwd/iwd_1.11.bb
> @@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
>  DEPENDS = "ell"
>
>  SRC_URI = "git://git.kernel.org/pub/scm/network/wireless/iwd.git"
> -SRCREV = "d8dc5a9bd19c5b98d8692801d3cf4e8af495930a"
> +SRCREV = "355c2df97e1adfdaee4a67c1705bd76202384687"
>  S = "${WORKDIR}/git"
>
>  inherit autotools manpages pkgconfig python3native systemd
> --
> 2.25.1
>
>
> 
>
