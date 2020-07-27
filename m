Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web11.53132.1595848360832197272
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Jul 2020 04:12:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=DqfWXFcl;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: laurent.pinchart@ideasonboard.com)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 584602A9;
	Mon, 27 Jul 2020 13:12:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1595848339;
	bh=BjVXxpDV1trHpgvPPNSgSLPpz2vuKtstsFWzGq8ODBs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DqfWXFclftzZzTvZt1TO80zedg5xnHftaLi6cCqfL4O2NG5XBU0DdbJIsG30xqBCF
	 Eskyf7IuBrkXl5+oL25TroU2zs+uRmiN0Pl4pK2i3D+DcpaAo3a+od2opRrXw7eXc7
	 A4UgJ+W1eYoeFdHR/hqMxBEKuW4LVukU+qKCRQfw=
Date: Mon, 27 Jul 2020 14:11:07 +0300
From: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: kieran.bingham@ideasonboard.com,
	openembedded-devel@lists.openembedded.org,
	libcamera-devel@lists.libcamera.org, raj.khem@gmail.com,
	madhavan.krishnan@linaro.org
Subject: Re: [libcamera-devel] [meta-multimedia][PATCH] libcamera: fix packaging and installation
Message-ID: <20200727111107.GD5925@pendragon.ideasonboard.com>
References: <20200727092108.6209-1-andrey.konovalov@linaro.org>
 <a17180dc-a0ee-80b1-8c55-ee1c42d20e9e@ideasonboard.com>
 <4ba4b745-06b5-c5a9-b046-0357aac9f9bd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <4ba4b745-06b5-c5a9-b046-0357aac9f9bd@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hello,

On Mon, Jul 27, 2020 at 12:58:23PM +0300, Andrey Konovalov wrote:
> On 27.07.2020 12:42, Kieran Bingham wrote:
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

I think that if the problem is caused by a meson patch in openembedded,
then it would make sense to fix it there. We can decide to address the
issue in libcamera itself if it's found to affect other distributions
too, or if meson's behaviour changes in an incompatible way.

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
> > This sounds like an effective solution for openembedded, but it needs to
> > be fixed in libcamera all the same.
> > 
> > I'll try to follow up with the meson guys to see what we can do,.

We re-sign the IPA modules at install time for this very specific
reason. If openembedded modifies the binaries after installing them,
should it re-run the signing script ?

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

-- 
Regards,

Laurent Pinchart
