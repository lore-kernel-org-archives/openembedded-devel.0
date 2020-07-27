Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web12.58361.1595864346695192986
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZYJt4aCo;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id b25so12522210qto.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aAsF1/QiSd/WcqXt3CpOkkeT2tIl8QfV37XhCmFxEnU=;
        b=ZYJt4aCoE4Wl6MsZZOOjjVbrxr22+4s5lEaLddPa5p7xatnmse2YD0cXqUtoAdV52r
         k2n6OHxMQ6kSQ6zj+GFP/8mXQyTuXRU3YvGmxq8Dxjd4NkxRDXWShinhYAz+ZN0fVdlQ
         +ZpXHPzxgks23qJFgfjSPx8gyU0Ly5eX7VrS7gd1VAQVZDhc13EHDOAt3IgNlrXdcygz
         yl/30jXPjtpi8WbLJZHm9mVU54EVA7/wljEUWLJdXiWc6iySR9eQssvzVjQePDYd+JhH
         ddHVLFVev4sD7ONCr0bNdsiqca6fKW2orsMd5PF6ycq+gF0KLDZsBmW1HoL1dsRey/a0
         Z7sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aAsF1/QiSd/WcqXt3CpOkkeT2tIl8QfV37XhCmFxEnU=;
        b=FZB4QEtwLFmTSR2qVIj9GswFA4UzF5Gyj9Gi5dq3cZmySkQq7aB+WFg63Xyn+33k0B
         yubuRSye8Ub3Fh4Qf7Dtc5vVgb5akklqBMqUXCDJCtm+byMHyJy2RErD/xA96nDIIm+3
         LEwYBfxfk/T8PfWNceRk2nqNI0HBUsioOPPLEq5sJwUe5RCDZLE6pjBYplDhF5+l+0tn
         7QDBSZOrEmMW+fAVZ0Dk+FfiN+fXbPjpyQbvGm18svuVqKI2R7Xy5HDQEO5m6c3l5LnV
         KugdPXEJ2IVagbO1myVM2NMRHfOcmcH1+PooSJ0nINiyCl/5W2h7N9bc/KU7hRfdRCt7
         Hlog==
X-Gm-Message-State: AOAM532JrrTnYDDSgPBjT1nrblVkRupM4aWKuY0cJOFc6t+g0iahBe/j
	MUgEW7pmj4ELc9AMXyjQJwdZuB8kSKMO221coFg=
X-Google-Smtp-Source: ABdhPJzuBSfaTeA1RDIwt9mmPe6zIG/hZU7mEg+ykl8c+0Wz/hlczpFWEsBdruvb+y7zzOtLNdhQCpC5FgoygNsOLfg=
X-Received: by 2002:ac8:22ea:: with SMTP id g39mr19667087qta.146.1595864345668;
 Mon, 27 Jul 2020 08:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <CAMKF1sqFr4Tkb_zumT8ida8aPPrcp-aS82xeO=xebeY=B7K=tQ@mail.gmail.com> <ad3cb56a-09ad-188c-760e-7365f297c5a9@linaro.org>
In-Reply-To: <ad3cb56a-09ad-188c-760e-7365f297c5a9@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 27 Jul 2020 08:38:39 -0700
Message-ID: <CAMKF1socZsM2zmAdNjRLsN2Ny3SpRbB=3P2tXsBZciHOVsJ09A@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, madhavan.krishnan@linaro.org, 
	Peter Griffin <peter.griffin@linaro.org>, libcamera-devel@lists.libcamera.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 27, 2020 at 8:36 AM Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
> Hi Khem,
>
> On 27.07.2020 18:28, Khem Raj wrote:
> > On Mon, Jul 27, 2020 at 2:21 AM Andrey Konovalov
> > <andrey.konovalov@linaro.org> wrote:
> >>
> >> libcamera checks if RPATH or RUNPATH dynamic tag is present in
> >> libcamera.so. If it does, it assumes that libcamera binaries are
> >> run directly from the build directory without installing them, and
> >> tries to use resorces like IPA modules from the build directory.
> >> Mainline meson strips RPATH/RUNPATH out at install time (for
> >> meson versions up to 0.54; the things are somewhat changed in 0.55).
> >> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
> >> That's why we need to remove this tag manually in do_install_append().
> >>
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
> >>
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
> >> +}
> >> +
> >>   FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
> >>   FILES_${PN} += " ${libdir}/libcamera.so"
> >>
> >> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> >> +INHIBIT_PACKAGE_STRIP = "1"
> >
> > I think this is sub-optimal, it means we can not have stripped
> > binaries and it will increase the size unnecessarily
>
> Indeed.
>
> But the alternative is to recalculate the signature on the stripped binary in do_install_append(),
> and the drawback of this is moving part of the module signature implementation into the recipe.
>
> Or the libcamera implementation is to be changed to handle stripped binaries.
>

either of these solutions will be better perhaps.

> Thanks,
> Andrey
>
> >> +
> >> --
> >> 2.17.1
> >>
