Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web10.58656.1595864608180214398
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=n/paZKlp;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: laurent.pinchart@ideasonboard.com)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D8604556;
	Mon, 27 Jul 2020 17:43:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1595864598;
	bh=R6dTJkCspTfxP5jWXv1tqJigfmPwvMO7czgdYhlHcrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/paZKlpzXWLZSa1ab+2TGqDJFZyTvaMiJfaIAac5VZMWl1lJ+8qQcEfFfnPglM0k
	 q6wln7eBSBPQ0N+PQX8j5LpLPUXjjDkFJgpLOskqofgLzMgGUbUyLIeLuXimZsAuNG
	 JP2R0Uf2MMqw4qyisy3nRKXIw2LXOUWsA2V+Uil8=
Date: Mon, 27 Jul 2020 18:43:10 +0300
From: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Andrey Konovalov <andrey.konovalov@linaro.org>,
	kieran.bingham@ideasonboard.com,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	libcamera-devel@lists.libcamera.org, madhavan.krishnan@linaro.org
Subject: Re: [oe] [libcamera-devel] [meta-multimedia][PATCH] libcamera: fix packaging and installation
Message-ID: <20200727154310.GA17521@pendragon.ideasonboard.com>
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <a17180dc-a0ee-80b1-8c55-ee1c42d20e9e@ideasonboard.com>
 <4ba4b745-06b5-c5a9-b046-0357aac9f9bd@linaro.org>
 <20200727111107.GD5925@pendragon.ideasonboard.com>
 <CAMKF1spHJ0SaouM0_hSwdG_gNhLDKO1woWS232d6n-vjsVvurg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1spHJ0SaouM0_hSwdG_gNhLDKO1woWS232d6n-vjsVvurg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Khem,

On Mon, Jul 27, 2020 at 08:37:27AM -0700, Khem Raj wrote:
> On Mon, Jul 27, 2020 at 4:12 AM Laurent Pinchart wrote:
> > On Mon, Jul 27, 2020 at 12:58:23PM +0300, Andrey Konovalov wrote:
> > > On 27.07.2020 12:42, Kieran Bingham wrote:
> > > > On 27/07/2020 10:21, Andrey Konovalov wrote:
> > > >> libcamera checks if RPATH or RUNPATH dynamic tag is present in
> > > >> libcamera.so. If it does, it assumes that libcamera binaries are
> > > >> run directly from the build directory without installing them, and
> > > >> tries to use resorces like IPA modules from the build directory.
> > > >> Mainline meson strips RPATH/RUNPATH out at install time (for
> > > >> meson versions up to 0.54; the things are somewhat changed in 0.55).
> > > >> But openembedded-core patches meson to disable RPATH/RUNPATH removal.
> > > >> That's why we need to remove this tag manually in do_install_append().
> > > >
> > > > Uh oh, what's changed... (I'll have to go take a look).
> > > >
> > > >   -
> > > > https://mesonbuild.com/Release-notes-for-0-55-0.html#rpath-removal-now-more-careful
> > > >
> > > > If we're reliant upon meson behaviour which is no longer consistent,
> > > > then we are going to have to do something else in libcamera.
> > >
> > > I haven't tried meson 0.55 yet, but my impression was that 0.55 should work
> > > just as before for "usual" (as per libcamera's README) libcamera build. And
> > > starting from 0.55 the patch in openembedded-core to disable RPATH/RUNPATH removal
> > > *might* be dropped - if all the packages would be able to set RUNPATH to
> > > what they need, and meson would detect that OK in all those cases.
> >
> > I think that if the problem is caused by a meson patch in openembedded,
> > then it would make sense to fix it there. We can decide to address the
> > issue in libcamera itself if it's found to affect other distributions
> > too, or if meson's behaviour changes in an incompatible way.
> 
> As I said in prior email, It causes problems in cross compiling, so
> perhaps it will be
> better to have an option to not specify it or reset it during configure.

That's something we can consider, yes.

> > > > /me sighs ...
> > > >
> > > >> IPA module is signed (with openssl dgst) after it is built. But
> > > >> during packaging the OE build system 1) splits out debugging info,
> > > >> and 2) strips the binaries. So the IPA module *.so file installed
> > > >> isn't the one which the signature was calculated against. Then
> > > >> the signature check fails, and libcamera tries to run the IPA
> > > >> module isolated (in a sandbox), which doesn't work if the IPA
> > > >> module wasn't designed to run isolated. The easiest way to fix that
> > > >> is to disable splitting out debug information and stripping the binaries
> > > >> during packaging with INHIBIT_PACKAGE_DEBUG_SPLIT and
> > > >> INHIBIT_PACKAGE_STRIP.
> > > >
> > > > This sounds like an effective solution for openembedded, but it needs to
> > > > be fixed in libcamera all the same.
> > > >
> > > > I'll try to follow up with the meson guys to see what we can do,.
> >
> > We re-sign the IPA modules at install time for this very specific
> > reason. If openembedded modifies the binaries after installing them,
> > should it re-run the signing script ?
> 
> build systems take on creating debuggable packages and for that
> usually, it builds the package and then
> takes the control of stripping the binaries since it will save the
> symbols and debug info into a separate package
> unlike install -s or explicit strip commands the components build
> system might do, which would discard this
> content unconditionally. Perhaps it would be better for libcamera
> buildsystem to take this into consideration
> in order for distros to be able to package it easily. so we need a way
> to resign it or not sign it at all since strip
> step runs past install during build.

The src/ipa/ipa-sign-install.sh script can be used by the build system
to regenerate signatures. It takes the private key file as the first
parameter, followed by all the modules to be signed. We can improve the
script to facilitate its integration with distribution packaging.

> > > >> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> > > >> ---
> > > >>   .../recipes-multimedia/libcamera/libcamera.bb            | 9 ++++++++-
> > > >>   1 file changed, 8 insertions(+), 1 deletion(-)
> > > >>
> > > >> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > > >> index 00a5c480d..573366f08 100644
> > > >> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > > >> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> > > >> @@ -18,13 +18,20 @@ PV = "202006+git${SRCPV}"
> > > >>
> > > >>   S = "${WORKDIR}/git"
> > > >>
> > > >> -DEPENDS = "python3-pyyaml-native udev gnutls boost"
> > > >> +DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
> > > >>   DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
> > > >>
> > > >>   RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
> > > >>
> > > >>   inherit meson pkgconfig python3native
> > > >>
> > > >> +do_install_append() {
> > > >> +        chrpath -d ${D}${libdir}/libcamera.so
> > > >
> > > > Aha, I didn't know about chrpath, that looks helpful. Perhaps part of
> > > > the solution will be handling our own strip/install actions to do this
> > > > explicitly in the build.
> > > >
> > > > It will be a pain to have to pull in another external dependency though...
> > > >
> > > >> +}
> > > >> +
> > > >>   FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
> > > >>   FILES_${PN} += " ${libdir}/libcamera.so"
> > > >>
> > > >> +INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
> > > >> +INHIBIT_PACKAGE_STRIP = "1"
> > > >> +

-- 
Regards,

Laurent Pinchart
