Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
 by mx.groups.io with SMTP id smtpd.web11.12966.1594393843290263071
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 10 Jul 2020 08:10:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mhnxiqM2;
 spf=pass (domain: gmail.com, ip: 209.85.160.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f195.google.com with SMTP id w34so4678700qte.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 10 Jul 2020 08:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ug3spjyDC5XMfIEvalhUnxfI50y5/7bzZ0G8o/ppV5g=;
        b=mhnxiqM2PXyU0xEfmPTYpvP88WJkWtfTQDUWnwYBDR5UuzXEpvmNjrHNoLM/k6LhaX
         la+nOYSz/K7rRhlDmwtCc+1ZDHzVm4s5Hl/Qvr5v9AU4mepFj/ZxRzuuEpaDIUD+C4TH
         5K12lqPBI1p0FEwpBJAQMcRCdOS2hoq3/4eZxi4NbW0cjgPNfhYuYdbk2vAbnbQEG//3
         VwcZwFiPpGYhOsxPt5JKNOaqEgFVUq6hUKN9v6FYGMQLbVaQIjg5bvP1pujWyZwJWPGp
         xQ5BtPdWnSuTGqGnvMG6HreIKPYKnZrbTbyE7CON6AaiiXoWVCAT+ZgGg5oy1q1B6WMF
         jbsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ug3spjyDC5XMfIEvalhUnxfI50y5/7bzZ0G8o/ppV5g=;
        b=AE5vlPwOO1fJj8TnP50pWLyVmNXNL+DU+N43Da9xPp8zPLmD7ERAkdm6TI9wO8r47A
         /qKkbn+1p20x7NmsTGhr6Yj41RnsfnRe3H0HWnDzGebKVuJesuCE15Fr5UMfKI3vnoUz
         1Yzc+B8OIULdLmnEe3d0IyLestDENS3XB1Bx7bE+Qn/PdA/z1gsQXYNi6DLkiS1Zrb9J
         yPXN4/3vw2pYJlxSowGtXI9wJgmHy+NHy0yUxJmbTt8Qm+Gv99W9DjHaMFOjBhzxMwWw
         h8MKFYv1iobeV9P1VEOZawM3Ldh70d4SYRaBsZ2zMcg918mGBIH4lHoHN1vc+QKi9S28
         DEKw==
X-Gm-Message-State: AOAM531ialMj/NIwPX9DgY6rriwgksfnYcy6zOFRm3QOgSdymNj7astn
	1m+Aize0EqYGOZBDg8tu47G9EaJV/CL2IJZr8zM=
X-Google-Smtp-Source: ABdhPJw7a1Y88Qe99vLu1RLja9MlliCDASp3nVJyIpCfwTg77wiLCAmUmpHMglemNV3+lyKcm2/d+zGdvOWhOJKCVDs=
X-Received: by 2002:ac8:4f13:: with SMTP id b19mr61757476qte.146.1594393842081;
 Fri, 10 Jul 2020 08:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200710015825.64379-1-rgowda.praveen@gmail.com>
In-Reply-To: <20200710015825.64379-1-rgowda.praveen@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 10 Jul 2020 08:10:16 -0700
Message-ID: <CAMKF1sq2RP7aun_N1x+q4XD_3xnV_OU7wPjopRWy2keJXG-ngQ@mail.gmail.com>
Subject: Re: [oe] [PATCH] Update fstools SRC to latest
To: Praveen Gowda <rgowda.praveen@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Praveen Gowda <praveenrgowda@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Can you send it as. pull request against meta-openwrt on github.

On Fri, Jul 10, 2020 at 5:14 AM Praveen Gowda <rgowda.praveen@gmail.com> wrote:
>
> From: Praveen Gowda <praveenrgowda@gmail.com>
>
> Signed-off-by: Praveen Gowda <rgowda.praveen@gmail.com>
> ---
>  recipes-core/fstools/fstools_git.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-core/fstools/fstools_git.bb b/recipes-core/fstools/fstools_git.bb
> index 3bd56f7..8541a62 100644
> --- a/recipes-core/fstools/fstools_git.bb
> +++ b/recipes-core/fstools/fstools_git.bb
> @@ -9,13 +9,13 @@ HOMEPAGE = "https://git.openwrt.org/?p=project/fstools.git;a=summary"
>  LICENSE = "LGPL-2.1 & GPL-2.0 & PD"
>  LIC_FILES_CHKSUM = "file://ubi.c;beginline=1;endline=17;md5=8ccc371d64f0b3a8d91065b678dc7095"
>  SECTION = "base"
> -DEPENDS += "util-linux"
> +DEPENDS += "util-linux ubus"
>
> -SRC_URI = "git://git.openwrt.org/project/fstools.git;branch=lede-17.01 \
> +SRC_URI = "git://git.openwrt.org/project/fstools.git \
>            file://0001-Define-GLOB_ONLYDIR-if-not-available.patch \
>            "
>
> -SRCREV = "37762ff488752c1686b359816aec75831b49c55f"
> +SRCREV = "d34ea8eb1e12259a315cdef7aa0cd3ceaea68e00"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.24.3 (Apple Git-128)
>
> 
