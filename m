Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.844.1604334401008085920
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 08:26:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=f4b+UYoN;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id i17so4307771qvp.11
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2020 08:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I/9aMQPe+no2ygkIP/xPonAK5QjiPa4bBXn9CG56gJQ=;
        b=f4b+UYoN8SFn1VoI08/U77G86son6G7cQT8v9FjEBaLGbHYEg3ab8YrDizNegDAajO
         yQ8k/5zmaet+ibOWvt2caWscLT7Zkj6M9Vj8PkZxSiuhVEHf9DgCG4z3KW+qHLqkmq13
         bEaEQb4179YiESW9uhCKP+WaRepzhAz+c71m1m1Zr+o5VTIF+VstXHmi9L2Zp/I39cKO
         APYK3a4xxA+fj/8kIJW7FcVeqUkC4mYlSMP1HnbR3xy9YGOl+zgCnocCnuR7F93ueo06
         bxpjnZVu6olbTrrzVGN9w3BfQG1B80vnqXqeoGAzay42iJV5q/XPw6gR9SSmgYtMT0Cj
         4CQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I/9aMQPe+no2ygkIP/xPonAK5QjiPa4bBXn9CG56gJQ=;
        b=sdKhyBiFyMliaYQ/TLXGCRbp4ORDB6JU9lYOlwGfDv/juLLQD8ZBFFYMu/TsvIZrXB
         4BrEykthtm5TePiPXhYeHAKa9qLdmcK68OOYAIyoegJKOZ7bCwi6H2wT66fLbtM2Gka3
         cvRqMj5xfWsfiGzYZQ4Foq9b1QjL0m1mlo6n19FbPMeXHhEjksDNBf/QCLWr8MtqrrKs
         b17kc8dkcYShJqFmjKc5H13XahtbH7RUX36PvzhloZxtfOEUXACNJgjCwL3WpfBAF3z/
         Fsm5FXTMxUt/0L6xhWRB3Z8dE8SVbFLyGI36Q0VnqKCkTKNXQKBKOOP2A7la6LgUNNta
         o8RQ==
X-Gm-Message-State: AOAM531x+q7i3kUCtCDdqhO8DlXmGzFyUPbp0WSre3FdTqrWuOMRx6k+
	xldE2tB53m2PQfN29pscjh4hrBljDmNNBxhBNGM=
X-Google-Smtp-Source: ABdhPJyH/PCFGDPvhb6YB7TfLfZLw2C+DRQoe4z/38iC5L/sIiIce5i/masJjefJideGZOEki8P+lBiM2iE1suaiQIk=
X-Received: by 2002:a05:6214:16d0:: with SMTP id d16mr23060744qvz.38.1604334400065;
 Mon, 02 Nov 2020 08:26:40 -0800 (PST)
MIME-Version: 1.0
References: <20201102091320.15732-1-yi.zhao@windriver.com>
In-Reply-To: <20201102091320.15732-1-yi.zhao@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Nov 2020 08:26:14 -0800
Message-ID: <CAMKF1sr721emgcyE=+GHPPiz1VZThqjWOXe01WQndv4qVMKDPw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] quagga: unify volatiles file name
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2020 at 1:13 AM Yi Zhao <yi.zhao@windriver.com> wrote:
>
> Make the volatiles file name starts with digital.

what does this get us ?

>
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>  meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
> index 11b7d576a..6df72427b 100644
> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> @@ -81,7 +81,7 @@ do_install () {
>      install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/default/watchquagga
>      install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
>      install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
> -    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
> +    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/03_quagga
>
>      # Install sample configurations for the daemons
>      for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
> @@ -106,7 +106,7 @@ do_install () {
>      sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
>      sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/quagga
>      sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
> -    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
> +    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/03_quagga
>      sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
>      sed -i 's!--with-libtool-sysroot=[^ "]*!!' ${D}${includedir}/quagga/version.h
>
> --
> 2.17.1
>
>
> 
>
