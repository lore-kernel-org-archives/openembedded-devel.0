Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web11.58309.1595864274645460196
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q3PWSuym;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id h7so15604910qkk.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Jul 2020 08:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BPmx7WwJ1bln0SNV9A4creLgAOhnquUTcUEDAwdqcuY=;
        b=Q3PWSuymOpGsc+5qYuLLk8JMeDO1aXjM4Miy3M+7TS4rQjK8fxSfWhJDjsQTh3XV4j
         wWT0N3Fye5npDYsGWs05vBs3qHmXkbt/bnIBGq94nOTy4rYbTOoPrCzXF38cV63LB90z
         G/mYfDVs5nh1crQqgombabmzoS4aLxFWp9Fb90szYJMCEpXbzn5mR3b9/2Z3GdzyB0tq
         HkhpmXiGRq4T6dcKeVCgUHFh2jxNC/dHh65x7YwOGJzp+HM0IxBeM1TjQYHxhOCQvFHu
         YHI5OSZYUuyShwNnDJg1a1wUlGaBWecM6UKjoY2RdAv9AxDatqaBlYQFEgqYpFXH88uc
         4cPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BPmx7WwJ1bln0SNV9A4creLgAOhnquUTcUEDAwdqcuY=;
        b=Vol0PRQehC7jEFa7PgS3GqK+I7k45hlIr4Pg5Q/8HXYkTwwUkP6DuPk2PzzjDdAyY7
         3y/KOtrYvcc4EArRyTL6aAv/14kEXgBOAhY2S7eNv4VG1ELW8sFAA2ubjOMT0J6jGstI
         zSHptVxicgryUT1/6EpcJbDj3fLRVo7j6CEi0qmlnEhAe78ASQZfwFO77XMznJmpUCRD
         BdlAbVZCFyWp12mCe0vR5XcekWYRq/b92HLui70by5BmHsPaBpTXqbNllAut56QEDABb
         Obf3Vnfqhog5jRPvfn4c/9fdGJa+RGGnkUWoXq0ays6IBn1PJ23Hx5XBlLorTGKI8CQc
         LfHQ==
X-Gm-Message-State: AOAM533YuLU3Dg6ginIRg3tkX+D1xE+9Lhk4qdVzU6HHl68ZBJ/IbNbP
	t1zLfmq1iKb5lD5M4RiLH4uZiYkQMpE/nRrTDh8=
X-Google-Smtp-Source: ABdhPJxmY1NEUgG9JEgnHY8ZiFDNl2WiKj8wdQQn+F6KxDw9hkm6EjTvE08KuUv7VufZZqNA5+8xW+0fh7fdY25jiyQ=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr24634959qkp.215.1595864273640;
 Mon, 27 Jul 2020 08:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <a17180dc-a0ee-80b1-8c55-ee1c42d20e9e@ideasonboard.com> <4ba4b745-06b5-c5a9-b046-0357aac9f9bd@linaro.org>
 <20200727111107.GD5925@pendragon.ideasonboard.com>
In-Reply-To: <20200727111107.GD5925@pendragon.ideasonboard.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 27 Jul 2020 08:37:27 -0700
Message-ID: <CAMKF1spHJ0SaouM0_hSwdG_gNhLDKO1woWS232d6n-vjsVvurg@mail.gmail.com>
Subject: Re: [oe] [libcamera-devel] [meta-multimedia][PATCH] libcamera: fix packaging and installation
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>, kieran.bingham@ideasonboard.com, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	libcamera-devel@lists.libcamera.org, madhavan.krishnan@linaro.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 27, 2020 at 4:12 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> On Mon, Jul 27, 2020 at 12:58:23PM +0300, Andrey Konovalov wrote:
> > On 27.07.2020 12:42, Kieran Bingham wrote:
> > > On 27/07/2020 10:21, Andrey Konovalov wrote:
> > >> libcamera checks if RPATH or RUNPATH dynamic tag is present in
> > >> libcamera.so. If it does, it assumes that libcamera binaries are
> > >> run directly from the build directory without installing them, and
> > >> tries to use resorces like IPA modules from the build directory.
> > >> Mainline meson strips RPATH/RUNPATH out at install time (for
> > >> meson versions up to 0.54; the things are somewhat changed in 0.55).
> > >> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
> > >> That's why we need to remove this tag manually in do_install_append().
> > >
> > > Uh oh, what's changed... (I'll have to go take a look).
> > >
> > >   -
> > > https://mesonbuild.com/Release-notes-for-0-55-0.html#rpath-removal-now-more-careful
> > >
> > > If we're reliant upon meson behaviour which is no longer consistent,
> > > then we are going to have to do something else in libcamera.
> >
> > I haven't tried meson 0.55 yet, but my impression was that 0.55 should work
> > just as before for "usual" (as per libcamera's README) libcamera build. And
> > starting from 0.55 the patch in openembedded-core to disable RPATH/RUNPATH removal
> > *might* be dropped - if all the packages would be able to set RUNPATH to
> > what they need, and meson would detect that OK in all those cases.
>
> I think that if the problem is caused by a meson patch in openembedded,
> then it would make sense to fix it there. We can decide to address the
> issue in libcamera itself if it's found to affect other distributions
> too, or if meson's behaviour changes in an incompatible way.

As I said in prior email, It causes problems in cross compiling, so
perhaps it will be
better to have an option to not specify it or reset it during configure.

>
> > > /me sighs ...
> > >
> > >> IPA module is signed (with openssl dgst) after it is built. But
> > >> during packaging the OE build system 1) splits out debugging info,
> > >> and 2) strips the binaries. So the IPA module *.so file installed
> > >> isn't the one which the signature was calculated against. Then
> > >> the signature check fails, and libcamera tries to run the IPA
> > >> module isolated (in a sandbox), which doesn't work if the IPA
> > >> module wasn't designed to run isolated. The easiest way to fix that
> > >> is to disable splitting out debug information and stripping the binaries
> > >> during packaging with INHIBIT_PACKAGE_DEBUG_SPLIT and
> > >> INHIBIT_PACKAGE_STRIP.
> > >
> > > This sounds like an effective solution for openembedded, but it needs to
> > > be fixed in libcamera all the same.
> > >
> > > I'll try to follow up with the meson guys to see what we can do,.
>
> We re-sign the IPA modules at install time for this very specific
> reason. If openembedded modifies the binaries after installing them,
> should it re-run the signing script ?

build systems take on creating debuggable packages and for that
usually, it builds the package and then
takes the control of stripping the binaries since it will save the
symbols and debug info into a separate package
unlike install -s or explicit strip commands the components build
system might do, which would discard this
content unconditionally. Perhaps it would be better for libcamera
buildsystem to take this into consideration
in order for distros to be able to package it easily. so we need a way
to resign it or not sign it at all since strip
step runs past install during build.

>
> > >> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > >> ---
> > >>   .../recipes-multimedia/libcamera/libcamera.bb            | 9 ++++++++-
> > >>   1 file changed, 8 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > >> index 00a5c480d..573366f08 100644
> > >> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > >> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > >> @@ -18,13 +18,20 @@ PV = "202006+git${SRCPV}"
> > >>
> > >>   S = "${WORKDIR}/git"
> > >>
> > >> -DEPENDS = "python3-pyyaml-native udev gnutls boost"
> > >> +DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
> > >>   DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
> > >>
> > >>   RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
> > >>
> > >>   inherit meson pkgconfig python3native
> > >>
> > >> +do_install_append() {
> > >> +        chrpath -d ${D}${libdir}/libcamera.so
> > >
> > > Aha, I didn't know about chrpath, that looks helpful. Perhaps part of
> > > the solution will be handling our own strip/install actions to do this
> > > explicitly in the build.
> > >
> > > It will be a pain to have to pull in another external dependency though...
> > >
> > >> +}
> > >> +
> > >>   FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
> > >>   FILES_${PN} += " ${libdir}/libcamera.so"
> > >>
> > >> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > >> +INHIBIT_PACKAGE_STRIP = "1"
> > >> +
>
> --
> Regards,
>
> Laurent Pinchart
> 
