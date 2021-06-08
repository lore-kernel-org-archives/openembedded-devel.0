Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web08.6108.1623112289831809635
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 17:31:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZXj1Uht6;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id u30so18587367qke.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BLg+srfzoRrkMfAxkxgHsd3jXAui3mg1539l29+AWRI=;
        b=ZXj1Uht6Zq5efJhJCXg/aI+GSzQKuWVosvaCM57Y3OsJvMUIRGr2XFKLTrh7TugLo+
         OqnURRF9wy5q54Tw59SL3TEsnMocae2BvM+2ITZaJSryJHDWoycLcS27DCeAjm04Dtcz
         6yQ+JITMKhEcozDoTDe4T67vRkhfROh/jf39hH1gFrzDJcvXpIdNS5t1hKnohVIyPAlh
         iw5hBq6DV04kJhxQd3kIZRfS/jT0Ch48G82slnqHk7Rxo3Tp6hNu5FLjVk77iOwNdN44
         09tDSWX6zFNP7+NpxJ59WVqRP0wuuM1geWB5ZPefm8XMkWlOBTL5+GVOK6ULxPXC3BTU
         kxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BLg+srfzoRrkMfAxkxgHsd3jXAui3mg1539l29+AWRI=;
        b=DEA16G1ZxDB+XOX3I15nQp5tq560EFFoP6FPXxkML+J10xjvzSLCp23g9xeF6F+oZM
         xgRvmonkp+9p5Z6Po6Dj578DrVB1eRGXAFWV9iVDfiOB3Ey5O4rrLvzToKkNKiEPcF6G
         47iVr+TYwG7tz5zI4J3tZT+FFw4EPo2qXOebuE0xh/DhEFbfxZXT02UvhmgvsZ6hTv8N
         7qJbaw8T3n8UcZgjo6GpnkoRVjYhc6AQQlyIpDz7DeKjM2exIetSRFBt9YQMyoSjefkr
         4kEFBWdX6rAwrgdQ+XprSRTCXLXYHvmYmqVisI6BKaMG+k6JUA7g6c+5dOG9ubHdaalA
         msgA==
X-Gm-Message-State: AOAM533pTQydYwtqCovksRCACQOMFRB+chnxin5bRDzyFWkwwbfkKNaP
	vsjWO1HYhGN52Mq28Tf9P+pcMjwfOePS8JKQkF4=
X-Google-Smtp-Source: ABdhPJzhXdn0IJGh2ZwV97nXYKXMNtyQDl1z9uRBSeEs0h6DxpwVRqlYRwMitkP7CwynWFM1yWOAXiEZJ+QiVVONY4E=
X-Received: by 2002:a37:855:: with SMTP id 82mr19721483qki.25.1623112288799;
 Mon, 07 Jun 2021 17:31:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <20210602141501.6174-9-brgl@bgdev.pl>
 <CAMKF1spd2yzEBiStsv-+sqaCMe7HG-6iUKXcKkc+4MfZ5waG7Q@mail.gmail.com>
 <CAMRc=McX9H6GxvM9ejxUs4Eet6cSXxf63Ln0CkHO27M6iwRquw@mail.gmail.com>
 <CAMKF1spmuj6ujbKF5JVWeixGmGtiY_zvjE32TVF79+3MKeTpxQ@mail.gmail.com> <CAMRc=MddYH52i7LrbJ7P6_UyXyQdB__vf6fEsrBAw2Am5d9gZg@mail.gmail.com>
In-Reply-To: <CAMRc=MddYH52i7LrbJ7P6_UyXyQdB__vf6fEsrBAw2Am5d9gZg@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 7 Jun 2021 17:31:02 -0700
Message-ID: <CAMKF1srz76pasLrCu93k3zuqLUJFThuFqgqWKcVg0jLXEMTkSg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 8/9] libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 8:54 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Mon, Jun 7, 2021 at 5:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> >
> >
> > On Mon, Jun 7, 2021 at 1:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >>
> >> On Sun, Jun 6, 2021 at 12:17 AM Khem Raj <raj.khem@gmail.com> wrote:
> >> >
> >> > On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >> > >
> >> > > libgpiod test-suites work with the gpio-mockup kernel module. When using
> >> > > linux-yocto, it's enabled using the gpio/mockup.scc kernel feature. Check
> >> > > if this feature is present in KERNEL_FEATURE and warn if not.
> >> > >
> >> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> >> > > ---
> >> > >  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 7 +++++++
> >> > >  1 file changed, 7 insertions(+)
> >> > >
> >> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> >> > > index 874453fbd..febf625a6 100644
> >> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> >> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> >> > > @@ -52,6 +52,13 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-py
> >> > >  PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
> >> > >
> >> > >  do_install_ptest() {
> >> > > +    if [ "${PREFERRED_PROVIDER_virtual/kernel}" = "linux-yocto" ] && \
> >> > > +       ${@bb.utils.contains('KERNEL_FEATURES', 'features/gpio/mockup.scc', 'false', 'true',d)}; then
> >> > > +        bbwarn "libgpiod test-suites need the gpio-mockup
> >> > > +module and will not work without it. Consider adding
> >> > > +'features/gpio/mockup.scc' to KERNEL_FEATURES"
> >> > > +    fi
> >> > > +
> >> >
> >> > perhaps turn this into a bbnote something like what libbpf is doing see
> >> > http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb?h=master
> >> >
> >>
> >> I really think that a warning is in order here. The ptests won't work
> >> without this module. At the same time we can't really skip the package
> >> altogether because the build may be using a different kernel recipe
> >> with its own defconfig - this is why we first check if we're using
> >> linux-yocto.
> >
> >
> > It should check for module being built in kernel irrespective of Linux yocto that is right but we perhaps need a logic to consider the case where I might have a kernel without this option and distro is using ptest feature
>
> No, we should not check for the module if we're not using linux-yocto
> because in this case we most likely won't be using yocto-linux-cache.
>
> For the second part - a warning doesn't really stop the build - do you
> really think it's too much? I mean, I can change it into a bbnote but
> I don't see why.

I don't like warnings they mean same as errors in some ways, So either
have linux-yocto enable this module or turn it into a note
see AB https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1309
it should be green :)

>
> Bart
