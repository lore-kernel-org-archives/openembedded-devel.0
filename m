Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
 by mx.groups.io with SMTP id smtpd.web11.10026.1596286910477212385
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Aug 2020 06:01:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ideasonboard.com header.s=mail header.b=UB7S8Ekc;
 spf=pass (domain: ideasonboard.com, ip: 213.167.242.64, mailfrom: laurent.pinchart@ideasonboard.com)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi [81.175.216.236])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 177A255E;
	Sat,  1 Aug 2020 15:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1596286907;
	bh=O8hbxufj5tprlfrvasFVtKt/YXtGKFMBqKmI39zVK7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UB7S8EkcqlLEoDunCNUAux4DyqtTZQpud+pBQZiMHf1ux3I+qZgQ2i00nR0r9UfAQ
	 Lmfsh2YsSjw8Fgo9P/t321KICvLm4VTEmBhJdP/32WFjALNACReGgFbrQa1nCyXAUn
	 i6TOA3fJ7ED3hqp1q5UUbWx0drkcrAuElHeL0Rs0=
Date: Sat, 1 Aug 2020 16:01:37 +0300
From: "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: openembedded-devel@lists.openembedded.org,
	libcamera-devel@lists.libcamera.org, raj.khem@gmail.com,
	madhavan.krishnan@linaro.org
Subject: Re: [libcamera-devel] [meta-multimedia][PATCH v2] libcamera: fix packaging and installation
Message-ID: <20200801130137.GE11820@pendragon.ideasonboard.com>
References: <20200731143919.25825-1-andrey.konovalov@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20200731143919.25825-1-andrey.konovalov@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Andrey,

Thank you for the patch.

On Fri, Jul 31, 2020 at 05:39:19PM +0300, Andrey Konovalov wrote:
> libcamera checks if RPATH or RUNPATH dynamic tag is present in
> libcamera.so. If it does, it assumes that libcamera binaries are
> run directly from the build directory without installing them, and
> tries to use resorces like IPA modules from the build directory.
> Mainline meson strips RPATH/RUNPATH out from libcamera.so file
> at install time. But openembedded-core patches meson to disable
> RPATH/RUNPATH removal. That's why  we need to remove this tag manually
> in do_install_append().
> 
> IPA module is signed (with openssl dgst) after it is built. But
> during packaging the OE build system 1) splits out debugging info,
> and 2) strips the binaries. So the IPA module so file installed
> isn't the one which the signature was calculated against. Then
> the signature check fails, and libcamera tries to run the IPA
> module isolated (in a sandbox), which doesn't work if the IPA
> module wasn't designed to run isolated. The solution is to
> recalculate the IPA modules signatures in ${PKGD} after do_package().
> 
> Signed-off-by: Andrey Konovalov <andrey.konovalov@linaro.org>
> ---
>  Changes in v2:
>   - Recalculate the IPA modules signatures after do_package()
>     instead of disabling stripping and splitting libcamera package
> 
>  .../recipes-multimedia/libcamera/libcamera.bb     | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> index 00a5c480d..30c6600e5 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> @@ -18,13 +18,26 @@ PV = "202006+git${SRCPV}"
>  
>  S = "${WORKDIR}/git"
>  
> -DEPENDS = "python3-pyyaml-native udev gnutls boost"
> +DEPENDS = "python3-pyyaml-native udev gnutls boost chrpath-native"
>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'qt', 'qtbase qtbase-native', '', d)}"
>  
>  RDEPENDS_${PN} = "${@bb.utils.contains('DISTRO_FEATURES', 'wayland qt', 'qtwayland', '', d)}"
>  
>  inherit meson pkgconfig python3native
>  
> +do_install_append() {
> +    chrpath -d ${D}${libdir}/libcamera.so
> +}
> +
> +addtask do_recalculate_ipa_signatures_package after do_package before do_packagedata
> +do_recalculate_ipa_signatures_package() {
> +    for module in $(find "${PKGD}/usr/lib/libcamera" -name "*.so.sign"); do
> +        if [ -f "${module%.sign}" ] ; then
> +            "${S}/src/ipa/ipa-sign.sh" "${B}/src/ipa-priv-key.pem" "${module%.sign}" "${module}"
> +        fi
> +    done

Note that you could also use the src/ipa/ipa-sign-install.sh script,
which takes the key as the first argument followed by the list of .so
files to sign. Something along the lines of (not tested)

    local modules
    for module in $(find "${PKGD}/usr/lib/libcamera" -name "*.so.sign"); do
        module="${module%.sign}"
        if [ -f "${module}" ] ; then
	    modules="${modules} ${module}"
        fi
    done

    "${S}/src/ipa/ipa-sign-install.sh" "${B}/src/ipa-priv-key.pem" ${modules}

I think this will lower the risk of breakage in the future, as
ipa-sign.sh will have a higher chance of being refactored than
ipa-sign-install.sh

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>  FILES_${PN} += " ${libdir}/libcamera.so"

-- 
Regards,

Laurent Pinchart
