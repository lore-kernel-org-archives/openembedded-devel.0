Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.1629.1596476961142669511
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 03 Aug 2020 10:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YlOSkzCl;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id m7so3778474qki.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 03 Aug 2020 10:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y8Ja86GMir7ltL6W5gmY1BGylfkj7N+HuAhTwGfDQQQ=;
        b=YlOSkzCliAT31GzHwKE+V4U60Krjz2zDhgmsE2qmao3PJi02KbyAbx4gh+EjF0gIp6
         S/aLLXCX1gXtm7nDxUjqQ3/daV9GSBmc7ytUoc/n44v6jeGoBToZ2c0u0eaNL32SRf9I
         nSIFLqqrJivsA4zV86DVHG5sxISu4ogR4PysjpE9Qlp5fpqtEG0njRUvLXFuDREH697n
         LmGN2xIOEJlDCrSOiUPli2yZx+XUbpr5rX5jHNtmgGvI94ml9sDE7sZ1NzApXVjiC3a1
         Haxsb0IgdQuEI27CI5SOfu89hLle3+ylIV0G1eH1+wsZCLNuhihgSGRXLOhFEDSPBccm
         3EBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y8Ja86GMir7ltL6W5gmY1BGylfkj7N+HuAhTwGfDQQQ=;
        b=KU6sk/ZcfNPDcIABFHLSoQ5lgGdHTdhoZ1kxPPzLOL5nM4hxpR9oH28XnxUPGM3cr2
         jDoYDX8jc0djTqxxPS547WRalaD7WsGNgCL8xKDjm8AQ4wH3zu632DBOORpq6S2ntCOq
         v+4J6Ojy/BtJ+2PIQaF+MYb6636guY+1oC8MIXkXutFOSqmDhANDOQJ6u00O9H+SVuCR
         +SU9avec4SkZoevOaDwzlaP3xPMNMuhCHll1p1AZcntG1xa+/4f453VCmRpNUItI9cBp
         45ydL82h5dMq+026cjvwvgPM7VRD0LOSQrhrEcn3XXLcRN3F+BXxNEWjVCfEWtR4KHdF
         DaNg==
X-Gm-Message-State: AOAM531WBXBRgQpQNoSBXinLQwMi4Em7uINgsGsqEKkpQJpaoRbhN1Yr
	M4g4pIkjCWVa/mHZgHjOCiaPSWFdoABHCMq54/E=
X-Google-Smtp-Source: ABdhPJww1n8KNVH2gBpNDR0e2Pa+k8bCtfXa3eK6gKBpqqVlR/S76cex3f4zNYogMM5ewlKUzhxfJm7iDhfzcQuNTqA=
X-Received: by 2002:a05:620a:565:: with SMTP id p5mr18034450qkp.215.1596476960176;
 Mon, 03 Aug 2020 10:49:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200802190719.9358-1-andrey.konovalov@linaro.org>
In-Reply-To: <20200802190719.9358-1-andrey.konovalov@linaro.org>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 3 Aug 2020 10:48:54 -0700
Message-ID: <CAMKF1srLY6B6dtw3EhBJS30w=YNuigUqNUzJMSov+J0YxdW_eQ@mail.gmail.com>
Subject: Re: [meta-multimedia][PATCH v3] libcamera: fix packaging and installation
To: Andrey Konovalov <andrey.konovalov@linaro.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, madhavan.krishnan@linaro.org, 
	Peter Griffin <peter.griffin@linaro.org>, libcamera-devel@lists.libcamera.org
Content-Type: text/plain; charset="UTF-8"

fails with https://errors.yoctoproject.org/Errors/Details/427980/

On Sun, Aug 2, 2020 at 12:07 PM Andrey Konovalov
<andrey.konovalov@linaro.org> wrote:
>
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
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  Changes in v3:
>   - As suggested by Laurent Pinchart, use ipa-sign-install.sh script
>     to recalculate the signatures instead of ipa-sign.sh.
>
>  Changes in v2:
>   - Recalculate the IPA modules signatures after do_package()
>     instead of disabling stripping and splitting libcamera package
>
>  .../recipes-multimedia/libcamera/libcamera.bb | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> index 00a5c480d..b34d673bd 100644
> --- a/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> +++ b/meta-multimedia/recipes-multimedia/libcamera/libcamera.bb
> @@ -18,13 +18,30 @@ PV = "202006+git${SRCPV}"
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
> +    local modules
> +    for module in $(find "${PKGD}/usr/lib/libcamera" -name "*.so.sign"); do
> +        module="${module%.sign}"
> +        if [ -f "${module}" ] ; then
> +            modules="${modules} ${module}"
> +        fi
> +    done
> +
> +    "${S}/src/ipa/ipa-sign-install.sh" "${B}/src/ipa-priv-key.pem" "${modules}"
> +}
> +
>  FILES_${PN}-dev = "${includedir} ${libdir}/pkgconfig"
>  FILES_${PN} += " ${libdir}/libcamera.so"
>
> --
> 2.17.1
>
