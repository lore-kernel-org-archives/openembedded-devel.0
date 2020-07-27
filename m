Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web10.58404.1595863896541777710
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kg1Z042O;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id l23so15633330qkk.0
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OoNxx3sIT6KOefGS5XH5anwqrUG6Z3cG79MmzOhxVZM=;
        b=kg1Z042OX5L0h4jGOSCOn5X1/wAFC4WDTK/ghd7oUvc+JI5ZjhC5CjOr41plqZqnr1
         3aSICrhWHd46UMAccY2eToUnxjpMhoY55I4XhyFQUZ9CFOJIOcXK3ByWXvg70DEK5P3c
         ovSK1DFCQ1X0NYbyFTMSik4HvheCavjlE1XdVxu39UnLNx3hgZccOUzNbr60hBy6lDzo
         9WL+wzOtC73wNrMsaC9jWpfOTs6IV5AgkwRnRBq1ynzpLunslh+zGslEi+DpA3lPHdaI
         27gA0B2GRp+xZ3ibPmLYvrl6Q9s/rEbpe4NsDSnlAdJpC7fhUE/ttxkg3Rq7LhAwOfsJ
         1rKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OoNxx3sIT6KOefGS5XH5anwqrUG6Z3cG79MmzOhxVZM=;
        b=jkoAVuiNcw5L2bo365US/ahDPyi02jjKqeCG0b+LQYxZOmuiKO/49MHQXlA/nJYVKA
         6lJHnGHRTmaahHpihMr8lEFO96XA51nem1R++HvfIB1dZ5x64baDBODmi0U1PZuY19Eq
         FAxrJpJnfp7rcUh4FXm5FL7wMqPLMcpo233eYwZV/5FGTtvqxwPdOALnEEFWHq5+ElNp
         9U21XP/qGMRLd48gPy5QcNsoxVi9c0Y8XyxVeH8CNh28+wk4ha8Zshydl2EtGwQiBDxt
         tsdLjQuJ7HJorNGsTldC9aXWYxGUQXe7U13bLNfigZAQ9DMKlYMEwini0t6AviGmMRkf
         652g==
X-Gm-Message-State: AOAM530TB/W45sYKRukTWvd3KTJvD9/9IRnlM7H0RefaMXr0KsFosNPy
	yql4NtKKGmy+D4veorh/PE40L9EDFnoPZVRjs5Y=
X-Google-Smtp-Source: ABdhPJzJW4RtDdypJsqKWtUdd49EetD1SS0U0sqShu3nKaFE3o4yvEHSNfEZGfeR26FqSUY5Xong2bTdl0WQE5/gA0c=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr24605493qkp.215.1595863895571;
 Mon, 27 Jul 2020 08:31:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <a17180dc-a0ee-80b1-8c55-ee1c42d20e9e@ideasonboard.com> <4ba4b745-06b5-c5a9-b046-0357aac9f9bd@linaro.org>
In-Reply-To: <4ba4b745-06b5-c5a9-b046-0357aac9f9bd@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 27 Jul 2020 08:31:08 -0700
Message-ID: <CAMKF1sqRj4ZtdORS+TvgHqig_NbGbAa_5F3C8uetC4OgiVtxSQ@mail.gmail.com>
Subject: Re: [libcamera-devel] [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: kieran.bingham@ideasonboard.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	libcamera-devel@lists.libcamera.org, madhavan.krishnan@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 27, 2020 at 2:58 AM Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Kieran,
>
> On 27.07.2020 12:42, Kieran Bingham wrote:
> > Hi Andrey,
> >
> > On 27/07/2020 10:21, Andrey Konovalov wrote:
> >> libcamera checks if RPATH or RUNPATH dynamic tag is present in
> >> libcamera.so. If it does, it assumes that libcamera binaries are
> >> run directly from the build directory without installing them, and
> >> tries to use resorces like IPA modules from the build directory.
> >> Mainline meson strips RPATH/RUNPATH out at install time (for
> >> meson versions up to 0.54; the things are somewhat changed in 0.55).
> >> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
> >> That's why we need to remove this tag manually in do_install_append().
> >
> > Uh oh, what's changed... (I'll have to go take a look).
> >
> >   -
> > https://mesonbuild.com/Release-notes-for-0-55-0.html#rpath-removal-now-more-careful
> >
> > If we're reliant upon meson behaviour which is no longer consistent,
> > then we are going to have to do something else in libcamera.
>
> I haven't tried meson 0.55 yet, but my impression was that 0.55 should work
> just as before for "usual" (as per libcamera's README) libcamera build. And
> starting from 0.55 the patch in openembedded-core to disable RPATH/RUNPATH removal
> *might* be dropped - if all the packages would be able to set RUNPATH to
> what they need, and meson would detect that OK in all those cases.

runpath is problem more than solution when cross-compiling for a
system which has normal file hierarchy standard
since it gets absolute values of build time paths embedded into
binaries, which is unwanted, so its stripped
most of the time on OE.

>
> Thanks,
> Andrey
>
> > /me sighs ...
> >
> >> IPA module is signed (with openssl dgst) after it is built. But
> >> during packaging the OE build system 1) splits out debugging info,
> >> and 2) strips the binaries. So the IPA module *.so file installed
> >> isn't the one which the signature was calculated against. Then
> >> the signature check fails, and libcamera tries to run the IPA
> >> module isolated (in a sandbox), which doesn't work if the IPA
> >> module wasn't designed to run isolated. The easiest way to fix that
> >> is to disable splitting out debug information and stripping the binaries
> >> during packaging with INHIBIT_PACKAGE_DEBUG_SPLIT and
> >> INHIBIT_PACKAGE_STRIP.
> >
> >
> > This sounds like an effective solution for openembedded, but it needs to
> > be fixed in libcamera all the same.
> >
> >
> > I'll try to follow up with the meson guys to see what we can do,.
> >
> >
> >> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> >> ---
> >>   .../recipes-multimedia/libcamera/libcamera.bb            | 9 ++++++++-
> >>   1 file changed, 8 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> >> index 00a5c480d..573366f08 100644
> >> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> >> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> >> @@ -18,13 +18,20 @@ PV = "202006+git${SRCPV}"
> >>
> >>   S = "${WORKDIR}/git"
> >>
> >> -DEPENDS = "python3-pyyaml-native udev gnutls boost"
> >> +DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
> >>   DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
> >>
> >>   RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
> >>
> >>   inherit meson pkgconfig python3native
> >>
> >> +do_install_append() {
> >> +        chrpath -d ${D}${libdir}/libcamera.so
> >
> > Aha, I didn't know about chrpath, that looks helpful. Perhaps part of
> > the solution will be handling our own strip/install actions to do this
> > explicitly in the build.
> >
> > It will be a pain to have to pull in another external dependency though...
> >
> >> +}
> >> +
> >>   FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
> >>   FILES_${PN} += " ${libdir}/libcamera.so"
> >>
> >> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >> +INHIBIT_PACKAGE_STRIP = "1"
> >> +
> >>
> >
