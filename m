Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web12.5577.1622793896657329261
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Jun 2021 01:04:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=WyOrQhk+;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.41, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f41.google.com with SMTP id c10so13098150eja.11
        for <openembedded-devel@lists.openembedded.org>; Fri, 04 Jun 2021 01:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jRXY4Pik4FTMG9xnkJoWG4hJ+Z84id5DEtdjc3EsKK8=;
        b=WyOrQhk+GF4HylIaeY9hE9K84Df6APLLPdrIlIvroQLZ9zCO+3Y/pNxTtfn5gurRr3
         eSyP6VhPJ0T0Eg2Em195VPi1KoGNkR+Ys97FMbjmHd3svkAqm4et8kZj0XAVbuGoBvbr
         3AGr5plp0/70Kov6mIRxuT6df3ZhtvpUKDuFwNm9F7cfvl6M9xwyU6A1EO2DGwv+zrbh
         +xc6sABXK+EyoKsNQC0dEUa8B5Bt8yRCMG97/Ri1BNbFgqdt83rZ/UfXR/xUH7Q0g6VV
         7lkq/TVou+hemYK8j/ltwKFkENnsezutd7b6NZJomSQYWl1z/rBLqv7Qf92IF9XBByMk
         dPPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jRXY4Pik4FTMG9xnkJoWG4hJ+Z84id5DEtdjc3EsKK8=;
        b=UHz3LeQUwoYHybBwtVMJR//ECTFPMx390HRYymCUgXxZZnOj8hzYqpe4i+jmgVdugR
         VwLr42zShYSCKpL8saHNAU4P17DBOgO3GgDVxThYSgGxLMC/laqqGMCk5nGZGKgbrs4p
         PXJmTE57ymRxj0YMNi0Kq47SBRNpX4Bfs8/5RG1UKjyLwiXvTc4oHeDjSBd+QoT1glub
         wyjTmBsF9bLDwCdXkEKlgOPaim0Gkx+A51ol+CNFWUPbjQ6PQ66QAbtFJFPu9rNBTvJp
         wdgT2+/Ib8pg7YpeCm0TlG39zoCTZg4sWSqN2KIRxa3gGffkucM/nK4+0+/VmyZtuHwe
         hG1A==
X-Gm-Message-State: AOAM530q+D79M69GQRwNX1XjL8QNgGF4ob1N1oQVMmbfspUUONOvIxbO
	HMgJ+tQBjgwyA62qWYQqYYxDEDIJbiG5U4UiloxI8A==
X-Google-Smtp-Source: ABdhPJxImHRDKvybL/CqlvXB9WP7OK/02RivQdHbDuq4/UjW5XVFRTX/yPo381B/0naQN3iv26PJmKfBsPDBDPf+jhY=
X-Received: by 2002:a17:906:c141:: with SMTP id dp1mr3121508ejc.87.1622793894852;
 Fri, 04 Jun 2021 01:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <20210602141501.6174-10-brgl@bgdev.pl>
 <CAMKF1sqMDM3xW68nGQa3A8NJaSsuvBvVw7GiDkyNWrfC3V=iYw@mail.gmail.com>
In-Reply-To: <CAMKF1sqMDM3xW68nGQa3A8NJaSsuvBvVw7GiDkyNWrfC3V=iYw@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Fri, 4 Jun 2021 10:04:44 +0200
Message-ID: <CAMRc=MdoDoNcDNAMe6KwZE306fVaU=d20gHprxr3ihvHx_xpmA@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 9/9] libgpiod: ptest: add kernel-modules to RRECOMMENDS
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jun 3, 2021 at 6:48 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > libgpiod needs the gpio-mockup kernel module to be loadable (not
> > built-in). Add kernel-modules to RRECOMMENDS.
> >
> > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > ---
> >  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > index febf625a6..8dda8a2a6 100644
> > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > @@ -48,6 +48,7 @@ FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}/*.so"
> >  FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/*.a"
> >
> >  RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '', d)}"
> > +RRECOMMENDS_${PN}-ptest += "kernel-modules"
> >
>
> do we need full swath of modules ? or can we be surgical ?
>

No, we don't - all we need is kernel-module-gpio-mockup. I wasn't
aware that each module is packaged separately. I will send a follow-up
just for this patch.

Bart
