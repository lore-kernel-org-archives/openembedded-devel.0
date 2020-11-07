Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web09.446.1604727056597549789
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Nov 2020 21:30:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U9w4p3yP;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id 13so1517181qvr.5
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Nov 2020 21:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zNDi+3qClhMCXeGFl6O60k1gSWHi1c8jxPhjg2nGPOo=;
        b=U9w4p3yPx3nbWA/rDGeQKikMYZNa8vTsmv5kNjErtPU4VphRBMmLWlChTbZeWiBP+J
         SfbFOBfJ9Ctvx+iYdsesx1liy8oIr7bTGj70BvjyMl9nxPboxZAUvTRxUiCanDhsvC5H
         CTQKFCyZk+fsT6cFbP7PXOcexP5jx3pghJG9C/gVNTLJ6aq0yz8pH/aToYqxX+YQEGFd
         E1XB9DZTLcoDqoOxU8PCLItHQXPlfQd7Q2wJ+Dflch1clV+SK+ljGKv4k+Ny5f2Quc7R
         PiMElM3UYCdkvHyR50CpZ4hgg+HRxLOv4/pAd7IqrS6FbpIVy9JJMH2mfurQM62xLKt1
         ovrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zNDi+3qClhMCXeGFl6O60k1gSWHi1c8jxPhjg2nGPOo=;
        b=ZDoQULpEdwFz+bMOGsQuu7QQYxd9gyaVodoHhnVd/Vh9FU2SelFt4WQFAPy+y7NNYS
         KfOYM0oR9RoxZ+CvVj92Lw06E63yWvlbkYFQ8ColgHsSrbgDDlJcgQGX2fdm8zvkEKn8
         Z5z7DQxPtpx4BRy3xnp43tTvlbdWmYHnY4lixEgJQm3eBFanTj8+TkLVhTJcLPHSqYNN
         1ZePSDqt4Zvp8wi2PdSAvH6wHiGDkOGdV4FkPlvwG+MFGKarUWf5obZNB0ZknJNXhjU3
         zd03CrWQph7RkMck809boaF4wj+6n1/PmrR3Axlf67T4kzcSk013xUTK9SsMq1AQzXRO
         kIhg==
X-Gm-Message-State: AOAM533udl/Hmb9h0juNwlB1MPN1D/G/sLo3eQ7roRaUF152LEfkOF9B
	xG9uGUJNwSapA4swZHkdrj9adcq1expaK/Kj5ps=
X-Google-Smtp-Source: ABdhPJzUPr0l3/KCmLmWxEXzBvXpY2DGGXMLXX2Xwdayh1gAG9dK5Den3lKUm6mvX55+IhPdzZliRpwgclaCisdis1s=
X-Received: by 2002:a05:6214:16d0:: with SMTP id d16mr5065185qvz.38.1604727055596;
 Fri, 06 Nov 2020 21:30:55 -0800 (PST)
MIME-Version: 1.0
References: <20201105091825.36257-1-mingli.yu@windriver.com>
In-Reply-To: <20201105091825.36257-1-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 6 Nov 2020 21:30:29 -0800
Message-ID: <CAMKF1soODoBY7DEHa-278zruydncwHuOVroZVFvfyYGURnUZdQ@mail.gmail.com>
Subject: Re: [oe] [PATCH 1/4] libmaxminddb: add new recipe
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 5, 2020 at 1:22 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> The libmaxminddb library provides a C library for reading MaxMind
> DB files, including the GeoIP2 databases from MaxMind.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  .../libmaxminddb/libmaxminddb_1.4.3.bb        | 20 +++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
>
> diff --git a/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
> new file mode 100644
> index 000000000..d5c303861
> --- /dev/null
> +++ b/meta-networking/recipes-support/libmaxminddb/libmaxminddb_1.4.3.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "C library for the MaxMind DB file format"
> +DESCRIPTION = "The libmaxminddb library provides a C library for reading MaxMind DB files, \
> +ncluding the GeoIP2 databases from MaxMind. This is a custom binary \
> +format designed to facilitate fast lookups of IP addresses while allowing \
> +for great flexibility in the type of data associated with an address."
> +
> +HOMEPAGE = "https://github.com/maxmind/libmaxminddb"
> +SECTION = "libdevel"

Call it just libs or devel

> +LICENSE = " Apache-2.0"
> +
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57 \
> +"
> +SRC_URI = "https://github.com/maxmind/libmaxminddb/releases/download/${PV}/${BPN}-${PV}.tar.gz \
> +"
> +SRC_URI[sha256sum] = "a5fdf6c7b4880fdc7620f8ace5bd5cbe9f65650c9493034b5b9fc7d83551a439"
> +
> +S = "${WORKDIR}/${BPN}-${PV}"

This is defaults for S so lets get rid of it here.

> +
> +inherit autotools-brokensep
> +
> --
> 2.26.2
>
>
> 
>
