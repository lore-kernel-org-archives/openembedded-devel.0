Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web12.58515.1595864716149720475
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 08:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=pSDICcxy;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: laurent.pinchart@ideasonboard.com)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C7779556;
	Mon, 27 Jul 2020 17:45:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1595864711;
	bh=7+rjYJViHAv45O3xFRhSAkzd3zPLg2wp+hX497k+wmg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pSDICcxyjFYzs5ByJKFv0clKBXqi903zF7lJkDYFNA44WbPNWlK+KiWN/GKqwdGJd
	 onpSD//gKhAoCxT/bQ4bqLFnXFXb7zVyGzYf9gcp/K7cWSwVzhb5dQ4DVkR++YX72O
	 lMgT+PF+Wr7oCUqc/M+wcRxDQkCheytK/2BxxeFg=
Date: Mon, 27 Jul 2020 18:45:03 +0300
From: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: Khem Raj <raj.khem@gmail.com>, libcamera-devel@lists.libcamera.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	madhavan.krishnan@linaro.org
Subject: Re: [libcamera-devel] [meta-multimedia][PATCH] libcamera: fix packaging and installation
Message-ID: <20200727154503.GB17521@pendragon.ideasonboard.com>
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <CAMKF1sqFr4Tkb_zumT8ida8aPPrcp-aS82xeO=xebeY=B7K=tQ@mail.gmail.com>
 <ad3cb56a-09ad-188c-760e-7365f297c5a9@linaro.org>
MIME-Version: 1.0
In-Reply-To: <ad3cb56a-09ad-188c-760e-7365f297c5a9@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Andrey,

On Mon, Jul 27, 2020 at 06:36:28PM +0300, Andrey Konovalov wrote:
> On 27.07.2020 18:28, Khem Raj wrote:
> > On Mon, Jul 27, 2020 at 2:21 AM Andrey Konovalov wrote:
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

We could calculate the signature on selected sections only, but that
would make the implementation much more complex. Could the
src/ipa/ipa-sign-install.sh resign script could be used by the recipe ?
We can also improve the script to facilitate its usage.

> >> +

-- 
Regards,

Laurent Pinchart
