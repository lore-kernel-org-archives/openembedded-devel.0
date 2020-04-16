Received: from mail-qv1-f65.google.com (mail-qv1-f65.google.com [209.85.219.65])
 by mx.groups.io with SMTP id smtpd.web10.9366.1587052103249308886
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 16 Apr 2020 08:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ks13WyG/;
 spf=pass (domain: gmail.com, ip: 209.85.219.65, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f65.google.com with SMTP id y19so2038160qvv.4
        for <openembedded-devel@lists.openembedded.org>; Thu, 16 Apr 2020 08:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zxH/zJHximlh2TTjY8qtZiz5227U5UkmvnN4v02h/fE=;
        b=ks13WyG/4QwtJGKPZL+CxFwf4jmDCWmcXaUNiPH8tTYw2gNrnVO01cQRAOFDSJidzg
         dqCu4z0c8p/kLJ1r1qEkP7xRBDQtkyAipMv7KX91Xy9lH0nnm3DL0KR6W73gKLJqddig
         p/x36imowV3C/nGhHAvU0MBg1bgFZtEVmWCwZ0MwrSuGOtEO8BiXb/AxborCYpP9W3tR
         v6D/LJU0qUCHEA1dW/pdK1SAJNDDU4CigEVo6ec809QM3mPQqO66lq6iLbjYTBlKSoph
         fv6RkozvBDFMm4iUi7buA5KEAVHssu584ZoTKzkSpgz2+GpB77dK0FaWbRdw7M0brxpx
         rF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zxH/zJHximlh2TTjY8qtZiz5227U5UkmvnN4v02h/fE=;
        b=ci1SGDjgeF28Z9UEvAav2mWvNTvPcRn8ioB7iPJMHzPXLj+zmrMv8+lTa6oxZGrfTD
         AYuGV+mNsCVfsisuVps8IMrskBtiOE8Sh5UiqV6AITOq3+aKL4i3IRSWN+eurN4jN9rA
         J+NwID92zKayuZi3+rk1FvHedI6jLByi54gZfZdMP4yOkqMRuU0Y1dDbOpCHTaCIHq49
         lrERnhQz4pwcalmWzv8nfh/R4+eatfHnJHpztmDz6sRCThD5nWmTZbHRbXjGU2oAInMr
         8v4vYJwhr4oMI7XaTEYOKvMEYYbHTX7T7QYssSUI7HubXkcRjv45wgiyHkvfuK+XpFmN
         E+FQ==
X-Gm-Message-State: AGi0Pubvzb0jegZ0n5vmaI0Uxhpj7QdRsk7Qso+2f6snEPUQTv7vJ9bE
	wEBn5C48yAs+hLI9ukiSzvn59RcsmEc6hlRPUWE=
X-Google-Smtp-Source: APiQypJhjS5HsrFCpAnHOzglCQ2XdIFWcxtf4Sfl06LweDS1QiISfxJ4Wyj/ZMYecV5opvUzSQI5C5SxLsr22SnI0bY=
X-Received: by 2002:a0c:b78e:: with SMTP id l14mr10882377qve.4.1587052102164;
 Thu, 16 Apr 2020 08:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200413214513.1793854-1-raj.khem@gmail.com> <20200413214513.1793854-3-raj.khem@gmail.com>
 <20200416133806.fo4gq6kmdjzkifeo@jama>
In-Reply-To: <20200416133806.fo4gq6kmdjzkifeo@jama>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 16 Apr 2020 08:47:56 -0700
Message-ID: <CAMKF1srz7rT8GigRcUmVLU-jJufUDPTwBY9pWa-bWdJxL2ehNw@mail.gmail.com>
Subject: Re: [oe] [meta-multimedia][PATCH 3/3] vlc: Add check to require X11
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Apr 16, 2020 at 6:38 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Mon, Apr 13, 2020 at 02:45:13PM -0700, Khem Raj wrote:
> > It needs X11 as of now to build. there is a possiblily to build it
> > without X11, but lets keep this check until that path is fixed
> >
> > Also fixes
> >
> > TOPDIR/build/tmp/work/aarch64-yoe-linux/vlc/3.0.9.2-r0/recipe-sysroot-native/usr/bin/aarch64-yoe-linux/aarch64-yoe-linux-ld: cannot find -lGL
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> > index 9e41512c3e..556e79c7e6 100644
> > --- a/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> > +++ b/meta-multimedia/recipes-multimedia/vlc/vlc_3.0.9.2.bb
> > @@ -25,7 +25,9 @@ SRC_URI = "http://download.videolan.org/pub/videolan/${BPN}/${PV}/${BP}.tar.xz \
> >  "
> >  SRC_URI[sha256sum] = "a9bdad293d81cd48516abad8d490d8ab4012964ae541ff19e00021e071e47601"
> >
> > -inherit autotools gettext pkgconfig features_check mime-xdg
> > +inherit autotools features_check gettext pkgconfig features_check mime-xdg
>
> No big deal, but there already was features_check few words later (left
> over from REQUIRED_DISTRO_FEATURES removal in
> 0f2b3139521570ad494a72399f8a9dae76e69b16 which made x11 optional)
>

OK, I will send a follow up

> > +
> > +REQUIRED_DISTRO_FEATURES = "x11"
> >
> >  ARM_INSTRUCTION_SET = "arm"
> >  export BUILDCC = "${BUILD_CC}"
> > --
> > 2.26.0
> >
>
> > 
>
