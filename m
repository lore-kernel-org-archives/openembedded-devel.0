Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web08.231.1623081286732614075
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 07 Jun 2021 08:54:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bgdev-pl.20150623.gappssmtp.com header.s=20150623 header.b=EEugYJV5;
 spf=none, err=SPF record not found (domain: bgdev.pl, ip: 209.85.218.47, mailfrom: brgl@bgdev.pl)
Received: by mail-ej1-f47.google.com with SMTP id k25so22012051eja.9
        for <openembedded-devel@lists.openembedded.org>; Mon, 07 Jun 2021 08:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DZQ3xVVzlzFRT6hwy0mX3bbRyCiJjKXreriU3nM7I6M=;
        b=EEugYJV5pwwxRHhqHJ6ute3eAP1NGTBWpCKCr89FMfSzbeVx0CaTM/YAPdwj4Z9w+o
         BgJ6Gz+5WPHZwEM0motY4Zlr6wpdcdck3X4QxYKMcurmbxWFP0W2M+8Rbrrxe1Hw+VDQ
         Lv5J8YuyO0EBKfwqIFVld6SpYzRtEpnX1kuW0IQPfCIzvJe4xi6xLMoge3YnK2nLWIoL
         RKd4o0KQdkKIu9E5VEKACuygpkseljuIRJwJdGEbcSQ2gzJwgfsnCFLEX5e+Er+XCGjk
         NlenuCx8i5CuN50t1UUDKsctlmxqJQ/OkTKKltHG1oKG3+YekSRsh8/VpQSev54+Nfly
         crLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DZQ3xVVzlzFRT6hwy0mX3bbRyCiJjKXreriU3nM7I6M=;
        b=iJkVe0YUMqLeA5VgpGy1uDbKAg9AKV3gXNduOim/UPRtN3wzLMWiGFs7cXWefeR0Kn
         nH2n0e8LceQtw2B/ZmnR/ohhswpxr+1FReD3eObhl1BQpe3XKhoVu26LgGaf1hBQcbNO
         y5YjfqbLAaKz2eLrY3xzsqWwMVbkUgGH+1KMVIhCIMwp+RLpwwbbyt9yTjTVNYOFhCFO
         CNhsTM2h1v2WmIImaT+j/IwJtZ81W7RNjNRIH2c4epiks43GX6V017NErC9YT/CYu9MF
         hemWf5HsQuYyyJO3xE8BGaw60Z/1+fNeBaIpra5v3EZPCAF4IlA2blFW5OxFSyv1FHNM
         uO7A==
X-Gm-Message-State: AOAM5337b7rJrEAefglL9ocvcOgVXlo5RhnKmY+WL7YWhFjSPogbuJ4O
	CB4VQVX5e8oa9OEd5pA/s1Yy5y465Kou7uVL7/cCmw==
X-Google-Smtp-Source: ABdhPJymrSCGHbr5q1QoZAaMTHEf4I3Dwk5zGQp3I/MqRq9NmDp25mYxP6clHqKr5y5ipG8WTz14hqo+8JNY8mCAo/g=
X-Received: by 2002:a17:906:488a:: with SMTP id v10mr18043893ejq.383.1623081284863;
 Mon, 07 Jun 2021 08:54:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210602141501.6174-1-brgl@bgdev.pl> <20210602141501.6174-9-brgl@bgdev.pl>
 <CAMKF1spd2yzEBiStsv-+sqaCMe7HG-6iUKXcKkc+4MfZ5waG7Q@mail.gmail.com>
 <CAMRc=McX9H6GxvM9ejxUs4Eet6cSXxf63Ln0CkHO27M6iwRquw@mail.gmail.com> <CAMKF1spmuj6ujbKF5JVWeixGmGtiY_zvjE32TVF79+3MKeTpxQ@mail.gmail.com>
In-Reply-To: <CAMKF1spmuj6ujbKF5JVWeixGmGtiY_zvjE32TVF79+3MKeTpxQ@mail.gmail.com>
From: "Bartosz Golaszewski" <brgl@bgdev.pl>
Date: Mon, 7 Jun 2021 17:54:34 +0200
Message-ID: <CAMRc=MddYH52i7LrbJ7P6_UyXyQdB__vf6fEsrBAw2Am5d9gZg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH 8/9] libgpiod: ptest: warn if the gpio-mockup kernel module is not selected
To: Khem Raj <raj.khem@gmail.com>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 7, 2021 at 5:14 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On Mon, Jun 7, 2021 at 1:55 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>>
>> On Sun, Jun 6, 2021 at 12:17 AM Khem Raj <raj.khem@gmail.com> wrote:
>> >
>> > On Wed, Jun 2, 2021 at 7:15 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>> > >
>> > > libgpiod test-suites work with the gpio-mockup kernel module. When using
>> > > linux-yocto, it's enabled using the gpio/mockup.scc kernel feature. Check
>> > > if this feature is present in KERNEL_FEATURE and warn if not.
>> > >
>> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
>> > > ---
>> > >  meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb | 7 +++++++
>> > >  1 file changed, 7 insertions(+)
>> > >
>> > > diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
>> > > index 874453fbd..febf625a6 100644
>> > > --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
>> > > +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.6.3.bb
>> > > @@ -52,6 +52,13 @@ RRECOMMENDS_${PN} += "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-py
>> > >  PACKAGECONFIG_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'ptest', 'tests', '', d)}"
>> > >
>> > >  do_install_ptest() {
>> > > +    if [ "${PREFERRED_PROVIDER_virtual/kernel}" = "linux-yocto" ] && \
>> > > +       ${@bb.utils.contains('KERNEL_FEATURES', 'features/gpio/mockup.scc', 'false', 'true',d)}; then
>> > > +        bbwarn "libgpiod test-suites need the gpio-mockup
>> > > +module and will not work without it. Consider adding
>> > > +'features/gpio/mockup.scc' to KERNEL_FEATURES"
>> > > +    fi
>> > > +
>> >
>> > perhaps turn this into a bbnote something like what libbpf is doing see
>> > http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-kernel/libbpf/libbpf_0.3.bb?h=master
>> >
>>
>> I really think that a warning is in order here. The ptests won't work
>> without this module. At the same time we can't really skip the package
>> altogether because the build may be using a different kernel recipe
>> with its own defconfig - this is why we first check if we're using
>> linux-yocto.
>
>
> It should check for module being built in kernel irrespective of Linux yocto that is right but we perhaps need a logic to consider the case where I might have a kernel without this option and distro is using ptest feature

No, we should not check for the module if we're not using linux-yocto
because in this case we most likely won't be using yocto-linux-cache.

For the second part - a warning doesn't really stop the build - do you
really think it's too much? I mean, I can change it into a bbnote but
I don't see why.

Bart
