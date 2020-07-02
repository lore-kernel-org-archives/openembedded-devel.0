Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.9723.1593704562312965986
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 02 Jul 2020 08:42:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qd7p5R6x;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id 145so23555946qke.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 02 Jul 2020 08:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mdDEjfikgNWkZ/lops0pDIPPZxcWjFzOz9C8AlmEoLM=;
        b=qd7p5R6x7nxzo/S2NLD8WVCGrhhw6fOTsCV0ZRw5wbA8MKwrtqqzhf4E3vrWHKSjI+
         XfcX1t+z26uZAG75dS0gcGUgjsTGiWbvyknshEUhrafvjxjgJzRq+EtKCoAsQQiZurQo
         nkNXrukN/0SmtNy1D+ySarqKxShaEDsSVSZef8qsKfPOS3Jpaz5PL3n1q1lfUC/wl5zH
         ZpvMAbZFcVxFp7eHX2JFxZmLdMrzsRuDKaCx9wht7RbcCgv3uETA96Ho3ptDXJ6zUxkW
         6uFka9T4PIRY04eH593bo1vRcnH+BGHg3X3yFoNFWjnmSxDY3rWtZ0ym+KDosv3hmjWU
         cSMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mdDEjfikgNWkZ/lops0pDIPPZxcWjFzOz9C8AlmEoLM=;
        b=ZMXVz5XnoprP904u8IHH2nD0HvmNVWRrqxEDEOe0mk69AeGkE36At357dL+hBp37JX
         peTfQDj81t8MpfyadHcCC3SRIg1MfN6PTJNHxazcR0Mzu05O7T65rjQC9Ixj4EschWxE
         LzxId792rkw89wOLv+ZFJCLbSG+pud3VmpFv5of2ORJlmjSKu6SUdiJVtrGk75onlDUj
         6jTKMQxQrBZClrEmzAKSa8p5yLz0sHoUQ3bC5Lltd9iuv1UHnksVg+xRQnetjpSuHbo/
         AEmtK3YMavkV2Yglq4cavHzmrPBq9t8ZgwsSWZHHmnvg9QpOm2/k6AkYA+Jycj0lq8Mt
         0dCA==
X-Gm-Message-State: AOAM532EuCvhmOJ9HlfY3/KRXDFeE7IsP++mKd3WKCL/gI+JwOOFyM8O
	szww4wjRF+t7+/7QeUyvd1o3t6zB/nkHWTgtxbs=
X-Google-Smtp-Source: ABdhPJzPoqTbS0HsjthPbjzz6KnphCNxr3fhsvGp9AnWp/3/OQVtczFBAcIzCyJiVximZfonGcJqYuL66YzFNnENaws=
X-Received: by 2002:a37:46d1:: with SMTP id t200mr10198482qka.17.1593704561184;
 Thu, 02 Jul 2020 08:42:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200701212935.111528-1-joe.slater@windriver.com>
In-Reply-To: <20200701212935.111528-1-joe.slater@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 2 Jul 2020 08:42:15 -0700
Message-ID: <CAMKF1sqUx3FfcCvgrxdX6jms7Zb22SiXSVvLFxMsUtVZKBWd8Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH 1/1] toybox-inittab: unpack to S
To: Joe Slater <joe.slater@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Randy MacLeod <randy.macleod@windriver.com>
Content-Type: text/plain; charset="UTF-8"

I cant apply it without conflicts, can you rebase it on top of
master-next for my sake and resend ?

On Wed, Jul 1, 2020 at 2:29 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> toybox-inittab does not unpack source files into S, so
> the archiver cannot see them.  We copy them to a sub-directory
> in order to keep the originals available if running do_configure()
> (again) without first running do_unpack().
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  .../recipes-core/toybox/toybox-inittab_0.8.2.bb   | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
>
> diff --git a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> index 8d7ff61e8..f82f8e9ce 100644
> --- a/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> +++ b/meta-oe/recipes-core/toybox/toybox-inittab_0.8.2.bb
> @@ -2,10 +2,12 @@ SUMMARY = "Toybox Inittab Configuration"
>  LICENSE = "BSD-0-Clause"
>  LIC_FILES_CHKSUM = "file://${COREBASE}/meta/files/common-licenses/BSD-0-Clause;md5=81eeb0083e31f11ab1e33ded846d521c"
>
> +# Unpack to ${S}/orig
> +#
>  SRC_URI = "\
> -    file://inittab \
> -    file://rcK \
> -    file://rcS \
> +    file://inittab;subdir=${BP}/orig \
> +    file://rcK;subdir=${BP}/orig \
> +    file://rcS;subdir=${BP}/orig \
>  "
>
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
> @@ -15,6 +17,9 @@ RCONFLICTS_${PN} = "\
>      sysvinit-inittab \
>  "
>
> +# Just being sure.
> +B = "${S}"
> +
>  # most users may want to have getty enabled by default
>  PACKAGECONFIG ??= "getty"
>
> @@ -26,9 +31,7 @@ do_patch[noexec] = "1"
>
>  do_configure() {
>         # copy over files now to have a fresh start on each config
> -       for file in ${SRC_URI}; do
> -               cp ${WORKDIR}/${file/file:\/\//} ${S}
> -       done
> +       cp orig/* .
>
>         for config in ${PACKAGECONFIG_CONFARGS}; do
>                 if [[ ${config} == "enable_getty" ]]; then
> --
> 2.17.1
>
> 
