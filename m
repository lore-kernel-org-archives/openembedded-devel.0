Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web08.5577.1607035680392617274
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Dec 2020 14:48:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=r1lEz1Bl;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id n9so1874981qvp.5
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Dec 2020 14:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=93DfW4AvuFQoNhFlme3UE09Z1of0BB0/KoabHGeWf5k=;
        b=r1lEz1BlRItQh8G7qWWhwnXHaknFkLZRaak9+GXICV8OetTFpwI8h8EyOGZ7Z1s4G5
         X1EJXwdrxmmKnMW+OstnU7oV5YbaoQ7of/coaq/0xpJ46n09FEE0ikeQhGbCnALWqPbo
         W0MovjkXmFqov4+cvw0aT4c72O+zMLC/japkWKcI5CwXDqeRHWvP5E6955QsUtx6HMdI
         GdJpZwBLsi3dFG6IApXmoBPcr7un36VuH0m3oe6i2lz4U6qi2L8BPYnAQuIIymdj34aO
         dWZJZoJLKNX4ofyDE/2OBImzK84QWvfv8kicxV7lfn3mZdjjdgd2lso/DUda0N7ShTEa
         olIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=93DfW4AvuFQoNhFlme3UE09Z1of0BB0/KoabHGeWf5k=;
        b=Nf8WJfpU4wDrPX5te0dz34NwU/UHN/0hHptSi+IK56thUnO5H3X2T2Qdsu5mdqabVG
         5hCPgTq0ZY47d1Jj6wymRqUoXgcY8LbGbF77ojBkT43C+RmCoIszG1i0Y8pd0z4g671U
         M5hYiLez/xpaq3NKPjyuynPkVMmaAO70eYyfpQwJlIRntsLLDob/TSynbKw4yeiayqMB
         L5FRjhiIYvM+1kKsUfFJh5qRhjLTK6up6MO4KValza45izcDytJ3Smhc/X3REnUzE5qj
         mdLJhi64+54Qa0CQdaz4DwHKzSAea1lu4R2doU7CYPQPdwxi7VuPpn11qHwHzKH08GEq
         MZ4A==
X-Gm-Message-State: AOAM530Xp5MAfL54vPVhA263O32XN146QfrOWr8csRPX/7covBUDKqnN
	/GRB2ZZCSl9WcOvB3GaPjThS0ppWnN7ml4/z31s=
X-Google-Smtp-Source: ABdhPJyEN3EUJ/RnkmEkpG32fugYuuKX5ER41KwKI30/oS0mEFm+ctO0Wo0TqgaQsD+dUXPtx8UEeStVz8nmaNvb1gk=
X-Received: by 2002:ad4:4052:: with SMTP id r18mr1543098qvp.38.1607035679440;
 Thu, 03 Dec 2020 14:47:59 -0800 (PST)
MIME-Version: 1.0
References: <20201203142407.4865-1-twoerner@gmail.com> <20201203142407.4865-2-twoerner@gmail.com>
In-Reply-To: <20201203142407.4865-2-twoerner@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 3 Dec 2020 14:47:33 -0800
Message-ID: <CAMKF1so4Kr1v5mXQ0S0JdeX29JNPC2bxvqWQo_h32HbknQnD+g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 2/3] glmark2: update to latest
To: Trevor Woerner <twoerner@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

I am seeing this error

https://errors.yoctoproject.org/Errors/Details/539076/

all across machines. Perhaps it needs to depend on wayland-scanner

On Thu, Dec 3, 2020 at 6:24 AM Trevor Woerner <twoerner@gmail.com> wrote:
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> index 320d07dfc..da8ca9e2b 100644
> --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
> @@ -10,12 +10,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
>
>  DEPENDS = "libpng jpeg udev"
>
> -PV = "20191226+${SRCPV}"
> +PV = "2020.11+${SRCPV}"
>
>  COMPATIBLE_HOST_rpi  = "${@bb.utils.contains('MACHINE_FEATURES', 'vc4graphics', '.*-linux*', 'null', d)}"
>
>  SRC_URI = "git://github.com/glmark2/glmark2.git;protocol=https"
> -SRCREV = "72dabc5d72b49c6d45badeb8a941ba4d829b0bd6"
> +SRCREV = "784aca755a469b144acf3cae180b6e613b7b057a"
>
>  S = "${WORKDIR}/git"
>
> --
> 2.28.0.497.g54e85e7af1
>
>
> 
>
