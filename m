Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
 by mx.groups.io with SMTP id smtpd.web12.8635.1606318789805891249
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 25 Nov 2020 07:39:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eROouMc2;
 spf=pass (domain: gmail.com, ip: 209.85.219.68, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f68.google.com with SMTP id y11so1098125qvu.10
        for <openembedded-devel@lists.openembedded.org>; Wed, 25 Nov 2020 07:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3ecPydTADGV4dUX6AkF52MXDtNYWUz4Wrtxsitrq1CI=;
        b=eROouMc2ZcL4mWIVj0MkYrFVNzpHEDhWcN9XJ8j0Yb6FhCKdLN0zzMM/ZvWNXcQC73
         SgfKqfZSh3nzuABZcB8sy2oZznuo1GDOLQC3Ztovd5XtErgTI9TZ4om60e1xyIUZa7d7
         zmAH8tRHQu0P3hhsT5ge4bamDd15wXdbYBQyYJHc1Otx2jxbCzvRcTDmxImm7PWTfr6b
         ChN2M98gGmRVVqN4FThSKNpBBa1Mcv6WOp9vzIiBfr+cTYC9fWescgQJWINdOs0XFcJT
         ELJZeOzj62+dmtXbYEQx54bgJrVZyF84bJrLPIzkUC6+hssy+kIhSmiic0tMTnw98bzz
         SmGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3ecPydTADGV4dUX6AkF52MXDtNYWUz4Wrtxsitrq1CI=;
        b=JokplN28wb6EAYuWBNvV5X8McI0xb0HHb57oyro5KMRjzLruWapdmxeoMJO3Zmur1k
         dGmfHDuQ6njhBgsT6flmd82VFUEkNGtQOk0z3ewHSnEq2kR6Zd178QxqcFXAK+w/8323
         31yDLAYCc2EHnMhckjoHAoheP1pn6lm3Bbf13E0nXIKjMJBP2iQG07Hv1STt18UnBUNb
         2AglLizzCKANxUc1LHxaKft5JQiKwffMJaNmMKGzWf3fF0UlsyLB7ZCSqqhuHPbD90YP
         BTETL6cDW3m1A8Sl9pxKZ4yXJF7VV/HhIX0j1O4HafoRIunmRvvt7RztL3nuo8dENiUc
         hKFA==
X-Gm-Message-State: AOAM532Mq3PSZWyv9O/sV3wfUmN5uev3yfnjD2x8e+00oj0N42ntpXMU
	H/gWUDPHRVeOIDe0vWKVCv/Q8ACY5XRjKQWZmEuURQDQtZM=
X-Google-Smtp-Source: ABdhPJx0RBCJzek/g/+ZVS8hIcDKWIT3LoDz/AYNmCktazX7UDCbJUb+JQhKLTJdNTCc9IAiSTODj5ofixPgVkw8tX0=
X-Received: by 2002:a0c:ee87:: with SMTP id u7mr4029242qvr.21.1606318788788;
 Wed, 25 Nov 2020 07:39:48 -0800 (PST)
MIME-Version: 1.0
References: <20201125143638.36139-1-maciej.pijanowski@3mdeb.com>
In-Reply-To: <20201125143638.36139-1-maciej.pijanowski@3mdeb.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 25 Nov 2020 07:39:21 -0800
Message-ID: <CAMKF1spxmTiNv6Yvm4+1XGobi-845AJ=F+kTTN1cv+oBnWbFwQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] cdrkit: split into more packages
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 6:37 AM Maciej Pijanowski
<maciej.pijanowski@3mdeb.com> wrote:
>
> Mimic the Debian pacaking scheme to allow for more fine-grained
> installation choice (install the binaries we need). Moreover, dirsplit
> was moved to a separate package, as it pulls in perl interpreter.
>
> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  .../cdrkit/cdrkit_1.1.11.bb                   | 32 ++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> index 3b10e978ef79..132e8f26b88c 100644
> --- a/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> +++ b/meta-oe/recipes-multimedia/cdrkit/cdrkit_1.1.11.bb
> @@ -17,7 +17,37 @@ SRC_URI[sha256sum] = "d1c030756ecc182defee9fe885638c1785d35a2c2a297b4604c0e0dcc7
>  inherit cmake
>
>  DEPENDS = "libcap file bzip2"
> -RDEPENDS_${PN} = "perl"
> +RDEPENDS_dirsplit = "perl"
> +
> +PACKAGES =+ "dirsplit genisoimage icedax wodim"
> +

this also should be reflected in packagegroup-meta-oe recipe

> +FILES_dirsplit = " \
> +    ${bindir}/dirsplit \
> +"
> +
> +FILES_genisoimage = " \
> +    ${bindir}/devdump \
> +    ${bindir}/genisoimage \
> +    ${bindir}/isodebug \
> +    ${bindir}/isodump \
> +    ${bindir}/isoinfo \
> +    ${bindir}/isovfy \
> +    ${bindir}/mkisofs \
> +"
> +
> +FILES_icedax = " \
> +    ${bindir}/cdda2mp3 \
> +    ${bindir}/cdda2ogg \
> +    ${bindir}/icedax \
> +    ${bindir}/pitchplay \
> +    ${bindir}/readmult \
> +"
> +
> +FILES_wodim = " \
> +    ${bindir}/readom \
> +    ${bindir}/wodim \
> +    ${sbindir}/netscsid \
> +"
>
>  do_install_append() {
>      ln -sf ${bindir}/genisoimage ${D}${bindir}/mkisofs
> --
> 2.25.1
>
>
> 
>
