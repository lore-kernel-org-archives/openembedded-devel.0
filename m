Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web11.171.1623266828120719693
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 09 Jun 2021 12:27:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=ROBgQ1Qm;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.52, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f52.google.com with SMTP id a11so39410592ejf.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 09 Jun 2021 12:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yKaDXLHjxBSoTF8vpYsP9tpo0OW+Ihdyui0DxUHWvjQ=;
        b=ROBgQ1Qm9wF4cdmTfGVnY6YZ3LHYnYfX7niN42SnB/IsORs7gsW85C50KU3P67jSFa
         DR0wZJylFExxKkTQHhni2NbEcrYCgm38o7A0C1MZo0rIgT8L1BO8wQla+9dzbasLt6cq
         Ooa9eu8nY85XjlBW29cRLiOV/HFrfIZIwvfovWNe01sJE1MP7+BPDBUuAmSmcXCnq9Ho
         3pzSFnITcEb5LnXkZsETXvJSgvPCsQZ3hR8R4tVvkAlkibEjW9mBWWeovcw40hm0Qhkm
         J1LxAiUOV3KNkPAMUTr14IKWwSHRW6aIgSG/M/Y2hyPhxodalZHabOhkTbeWnKLT54sy
         TuRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yKaDXLHjxBSoTF8vpYsP9tpo0OW+Ihdyui0DxUHWvjQ=;
        b=KmJdzbjE/6cLmCLkk3ENjUjgKs9kxvkKy38k7af2dQxUlOnlckz6ZtGDxuBJ+cpNuf
         l3Wq/A6KDsyA6zuhwzQte4L4ebaSy13vppyNVeNlt0qZtZb1Zz7l5atiVqTWtzfP5PFF
         0FEQjHe/LdVhIZcTx3JcCUwxoVN24XKln0Wxk6H4+/5lLasJ+A6EfOzeLDv2aHybjXxa
         nqLiNOiRYg3mLV/VsUr9JndRFKoQK3xE5jSac0WN3dpsn32IsoX1sxtnrDOFPDlMc0Js
         f28jXvnQRTLOI/2Rlq1HKnRbl8Xc+dz2W+tJohfj+TDbJciT0eGOwbpBZyXYyZuFSaVL
         6dww==
X-Gm-Message-State: AOAM533axkDJUqmmzTpEVlsNkTNdqhxPPqHKLiEQBAXrbmvTjXGkmk6o
	XOiG/zj8fnbd8QGwuvyoP0DfZsIIKCUROj/1c3RsuA==
X-Google-Smtp-Source: ABdhPJwP0s9a13K78RwpkAkwjRmFw83tNMA/ounrVp3QEEJkuVKNYY+JkAG89YkKARzVbN/wxuj+XmgXK2/EgZsncaE=
X-Received: by 2002:a17:906:b307:: with SMTP id n7mr1252334ejz.261.1623266826505;
 Wed, 09 Jun 2021 12:27:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <20210602141501.6174-9-brgl@bgdev.pl>
 <CAMKF1spd2yzEBiStsv-+sqaCMe7HG-6iUKXcKkc+4MfZ5waG7Q@mail.gmail.com>
 <CAMRc=McX9H6GxvM9ejxUs4Eet6cSXxf63Ln0CkHO27M6iwRquw@mail.gmail.com>
 <CAMKF1spmuj6ujbKF5JVWeixGmGtiY_zvjE32TVF79+3MKeTpxQ@mail.gmail.com>
 <CAMRc=MddYH52i7LrbJ7P6_UyXyQdB__vf6fEsrBAw2Am5d9gZg@mail.gmail.com>
 <CAMKF1srz76pasLrCu93k3zuqLUJFThuFqgqWKcVg0jLXEMTkSg@mail.gmail.com> <CAMRc=McH+7DZUppWK-TCMBhQk9KZ1Ojnd4t3VwZHdo9ogu0vng@mail.gmail.com>
In-Reply-To: <CAMRc=McH+7DZUppWK-TCMBhQk9KZ1Ojnd4t3VwZHdo9ogu0vng@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Wed, 9 Jun 2021 21:26:55 +0200
Message-ID: <CAMRc=MfTG3ma8jdvKGHOPZ2QjaVLQbp4mLL7-qJLkH=UrTuY3w@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 8/9] libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 10:00 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Jun 8, 2021 at 2:31 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Mon, Jun 7, 2021 at 8:54 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > >
> > > On Mon, Jun 7, 2021 at 5:14 PM Khem Raj <raj.khem@gmail.com> wrote:
> > > >
> > > >
> > > >
> > > > On Mon, Jun 7, 2021 at 1:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >>
> > > >> On Sun, Jun 6, 2021 at 12:17 AM Khem Raj <raj.khem@gmail.com> wrote:
> > > >> >
> > > >> > On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > > >> > >
> > > >> > > libgpiod test-suites work with the gpio-mockup kernel module. When using
> > > >> > > linux-yocto, it's enabled using the gpio/mockup.scc kernel feature. Check
> > > >> > > if this feature is present in KERNEL_FEATURE and warn if not.
> > > >> > >
> > > >> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > >> > > ---
> > > >> > >  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 7 +++++++
> > > >> > >  1 file changed, 7 insertions(+)
> > > >> > >
> > > >> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > > >> > > index 874453fbd..febf625a6 100644
> > > >> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > > >> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
> > > >> > > @@ -52,6 +52,13 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-py
> > > >> > >  PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
> > > >> > >
> > > >> > >  do_install_ptest() {
> > > >> > > +    if [ "${PREFERRED_PROVIDER_virtual/kernel}" = "linux-yocto" ] && \
> > > >> > > +       ${@bb.utils.contains('KERNEL_FEATURES', 'features/gpio/mockup.scc', 'false', 'true',d)}; then
> > > >> > > +        bbwarn "libgpiod test-suites need the gpio-mockup
> > > >> > > +module and will not work without it. Consider adding
> > > >> > > +'features/gpio/mockup.scc' to KERNEL_FEATURES"
> > > >> > > +    fi
> > > >> > > +
> > > >> >
> > > >> > perhaps turn this into a bbnote something like what libbpf is doing see
> > > >> > http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb?h=master
> > > >> >
> > > >>
> > > >> I really think that a warning is in order here. The ptests won't work
> > > >> without this module. At the same time we can't really skip the package
> > > >> altogether because the build may be using a different kernel recipe
> > > >> with its own defconfig - this is why we first check if we're using
> > > >> linux-yocto.
> > > >
> > > >
> > > > It should check for module being built in kernel irrespective of Linux yocto that is right but we perhaps need a logic to consider the case where I might have a kernel without this option and distro is using ptest feature
> > >
> > > No, we should not check for the module if we're not using linux-yocto
> > > because in this case we most likely won't be using yocto-linux-cache.
> > >
> > > For the second part - a warning doesn't really stop the build - do you
> > > really think it's too much? I mean, I can change it into a bbnote but
> > > I don't see why.
> >
> > I don't like warnings they mean same as errors in some ways, So either
> > have linux-yocto enable this module or turn it into a note
> > see AB https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1309
> > it should be green :)
> >
>
> So I went on to add it to OE-core and noticed this:
>
> 4e03f041396121f6143fd81bf5e429015146bfdc
> Author: Sakib Sajal <sakib.sajal@windriver.com>
> Date:   Wed Jan 27 13:03:32 2021 -0500
>
>     linux-yocto*: add features/gpio/mockup.scc to KERNEL_FEATURES
>
>     add features/gpio/mockup.scc to KERNEL_FEATURES when ptest
>     is enabled as it is required for testing libgpiod.
>
>     (From OE-Core rev: 906cde06bee319e788c76abb8f8295ed9921ccb1)
>
>     Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> So I wonder - why do I see my warning if I don't add gpio-mockup to
> kernel features myself? A quick check shows this:
>
> $ bitbake -e core-image-minimal | grep ^DISTRO_FEATURES=
> DISTRO_FEATURES="acl alsa argp bluetooth debuginfod ext2 ipv4 ipv6
> largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g nfc
> x11 vfat seccomp largefile opengl ptest multiarch wayland vulkan
> systemd pam pulseaudio gobject-introspection-data ldconfig"
> $ bitbake -e core-image-minimal | grep ^KERNEL_FEATURES=
> KERNEL_FEATURES=""
>
> I don't have the time to debug this today but it looks like a bug -
> the feature should actually be pulled in automatically.
>
> Bart

Ok I see now. libgpiod recipe sees the global KERNEL_FEATURES as set
in local.conf and distro/machine config files, meanwhile linux-yocto
gets the global value and extends it with ptest features but only
locally, so libgpiod never sees those features even though they are
indeed included. In that case I suppose it's fine to revert this
change, I'll send a patch.

Bartosz
