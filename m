Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.4785.1604370820165323212
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Nov 2020 18:33:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Y6FszlHC;
 spf=pass (domain: gmail.com, ip: 209.85.160.169, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id j62so10762077qtd.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Nov 2020 18:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dgRVoKLaJE6/T6tlghTzpUR8f2dtpNyy7YM5Fj/vxq8=;
        b=Y6FszlHCq7JYibaPVv6HRy0/MP9TrU0mxC4fgf0F4GQft+QaxqeMcTfCneiNuUKlNO
         amvzh/AcjllfKSR9DM/ZAkEvzQBfEZALKRbsJuW88nK+HpGBpn+E9l0StZMJeZzUdK+N
         iSTkyx3aYdrW6QaYzqhEdz0I7jKI7JwM78UKUkAUDUvJBSd+hYh0lwI3EKCiRw+J88nB
         A/LXY/DuZHHEiE/5Ogut2loe/FBbo2AM0JUDv59zIRNjI7gbXo/XNTLcTWJMOgrrwsnJ
         wfF69D1wtm+BccekYSLSv0w/6nkI7EMVM+IIVftosKwWRYjsLj5SNbZKK5eh/V0XIdwm
         ZzUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dgRVoKLaJE6/T6tlghTzpUR8f2dtpNyy7YM5Fj/vxq8=;
        b=d0ZZwuzgIeXAmTshED9toLCyEdpOmeNZXk5wTKS5rOKdE9W6n4Ml5jE+xzfJ+ebyUA
         uJXmtX1rPnYiL1gcI9vckN78ykfeDZRS5G1KHvc5jE7aWzZW1KItddjp9VWKOpApkvrd
         rOV/YAl9fq5CjREKWbYdOaEW8Oz81gjw5JyysMXQUR4tXr72B0jP2+UUD4ZDCHdg/9WQ
         eq2l8+LwI0zbWHGsUs7g13uZ9qa3ZCYp++IijPDQ4Xq8rdn8Jpnv/5L3gaOa+cSsG4c9
         MsAxeADHGA1T6OU19spl5VGa8ty22ZLbFo7QuOMVh8bAGMFRl+hmwLJ7Y/IiReOAglpM
         Xs/w==
X-Gm-Message-State: AOAM532AVSb/uxa5dZjgv4nl/zUyceBz88yofISlDyOzqArmLLc/OPrC
	MREThI6ThA60ZZHwkLZpUC/uIe0nOIBkz+1Cq9y1mul+bHs=
X-Google-Smtp-Source: ABdhPJxsBBWko4+q1ELSUSVnwLlVtkCuhNV73sqw5NQ1JEWTQgk1J2l7g9rhnpyujzd4tqUE11Z0IaVNDjAJxXyRB3w=
X-Received: by 2002:a05:622a:1cb:: with SMTP id t11mr17791986qtw.378.1604370819109;
 Mon, 02 Nov 2020 18:33:39 -0800 (PST)
MIME-Version: 1.0
References: <20201102091320.15732-1-yi.zhao@windriver.com> <CAMKF1sr721emgcyE=+GHPPiz1VZThqjWOXe01WQndv4qVMKDPw@mail.gmail.com>
 <ced6967d-c807-4352-1d0f-0e239aa2111f@windriver.com>
In-Reply-To: <ced6967d-c807-4352-1d0f-0e239aa2111f@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 2 Nov 2020 18:33:13 -0800
Message-ID: <CAMKF1sqHR3_UK42eLMxQM2Ue_YHguAaCCHgY__1_9yG7rUMDGw@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] quagga: unify volatiles file name
To: Yi Zhao <yi.zhao@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2020 at 6:31 PM Yi Zhao <yi.zhao@windriver.com> wrote:
>
>
> On 11/3/20 12:26 AM, Khem Raj wrote:
> > On Mon, Nov 2, 2020 at 1:13 AM Yi Zhao <yi.zhao@windriver.com> wrote:
> >> Make the volatiles file name starts with digital.
> > what does this get us ?
>
>
> Just want to make all volatiles file names uniform. I searched oe-core
> and meta-openembedded, only pulseaudio and quagga volatiles file names
> are not start with number value.
> $ ls /etc/default/volatiles
> 00_core  01_bootlogd  99_dbus  99_sshd  99_wpa_supplicant
> volatiles.03_quagga  volatiles.04_pulse

this will change the order of their execution, is the new order still
working without other side effects
>
> //Yi
>
>
> >
> >> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> >> ---
> >>   meta-networking/recipes-protocols/quagga/quagga.inc | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/meta-networking/recipes-protocols/quagga/quagga.inc b/meta-networking/recipes-protocols/quagga/quagga.inc
> >> index 11b7d576a..6df72427b 100644
> >> --- a/meta-networking/recipes-protocols/quagga/quagga.inc
> >> +++ b/meta-networking/recipes-protocols/quagga/quagga.inc
> >> @@ -81,7 +81,7 @@ do_install () {
> >>       install -m 0644 ${WORKDIR}/watchquagga.default ${D}${sysconfdir}/default/watchquagga
> >>       install -m 0755 ${WORKDIR}/quagga.init ${D}${sysconfdir}/init.d/quagga
> >>       install -m 0755 ${WORKDIR}/watchquagga.init ${D}${sysconfdir}/init.d/watchquagga
> >> -    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
> >> +    install -m 0644 ${WORKDIR}/volatiles.03_quagga  ${D}${sysconfdir}/default/volatiles/03_quagga
> >>
> >>       # Install sample configurations for the daemons
> >>       for f in bgpd vtysh isisd ospfd ripngd zebra ripd ospf6d; do
> >> @@ -106,7 +106,7 @@ do_install () {
> >>       sed -i 's!/usr/sbin/!${sbindir}/!g' ${D}${sysconfdir}/init.d/*
> >>       sed -i 's!/usr/bin/!${bindir}/!g' ${D}${sysconfdir}/init.d/quagga
> >>       sed -i 's!/etc/!${sysconfdir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/watchquagga
> >> -    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/volatiles.03_quagga
> >> +    sed -i 's!/var/!${localstatedir}/!g' ${D}${sysconfdir}/init.d/* ${D}${sysconfdir}/default/volatiles/03_quagga
> >>       sed -i 's!^PATH=.*!PATH=${base_sbindir}:${sbindir}:${base_bindir}:${bindir}!' ${D}${sysconfdir}/init.d/*
> >>       sed -i 's!--with-libtool-sysroot=[^ "]*!!' ${D}${includedir}/quagga/version.h
> >>
> >> --
> >> 2.17.1
> >>
> >>
> >> 
> >>
