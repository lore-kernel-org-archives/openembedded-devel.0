Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web10.445.1590534970610467043
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 26 May 2020 16:16:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=PWmQecWU;
 spf=pass (domain: gmail.com, ip: 209.85.222.196, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f196.google.com with SMTP id v79so12520883qkb.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 26 May 2020 16:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AHGlSsHoRApwvuMmAxgWbcIOI0WPV/otorxeCr0hoY4=;
        b=PWmQecWUOp1w7lc8PPEo+3Ohx/yxfOPRgr9L1m2iJ2wrjGKA0J7iQwJ8MnmSVH6vul
         uy0W1XUttl4suEMIBB76V0O15rz23PNoDvLVPsKMFMHy3h4i8O7N2Ob5I7v22742D0a3
         559vIV5p1Gj60P8Un9znJiwleuBAjzgcV8R6P/MAx71RAcWA4QS9tLaDznekNpfpWQiu
         vvuwre0oz4NByfwWstiByrNYfcujyXO9wq1bwTli0pXb+hCIr5E5J7egqZ0a1g60REZs
         IC3YN40Y8LUOP1jc3xieON/RJB5eB0bfRIZEhaSmxizG3zg8ReaWAZQVBgIsSLENH8dy
         xa2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AHGlSsHoRApwvuMmAxgWbcIOI0WPV/otorxeCr0hoY4=;
        b=unD33elHFJvvCGBM2cMQxqOwKlvhjCjiHwp88W4xRnRSaol07nQPtptcu1++4xKqXU
         t3XFmQi79lZwyNEW27mzSTMx1dq1V/FLSAhJoo+2K66/M4GvmViQzXxTbdLEq+tShqr2
         JkUl4dOY5f9VnG2TDKMrql2/3BF9dgAMC2SPGOsoUWNNClfJC6Ryyu8qQ5Px7zCAwjRZ
         4XIVy0RhEva7BelioCAvj6fd0XQdLi93zHPEkz3FxNzWAOaEdURtXtrli1bs8jAgRrTX
         sH8raRQMDDiWUWaJ8W+A8WySqCrKR8pvx8x2jCivKZ+QJD0uUHJLSuj3xMJT9UbnFXVr
         piHw==
X-Gm-Message-State: AOAM530QDH2PWyFrcO3SovglTP05TfTLj9/0XWt4WX3GBxVQHjQFzu69
	/axiSmOZ9XNdF7MLgCthyoj+ooKi748EUvZhkL8=
X-Google-Smtp-Source: ABdhPJxFFzrNaz1vVuHfpo81oRMd5ggmQnKVPMc5sN3F8Sjg+Gem6PWk1r9BrkM5JoV/N0AVRbmVzEyZfalZNA3dApI=
X-Received: by 2002:ae9:dc47:: with SMTP id q68mr1255972qkf.17.1590534969429;
 Tue, 26 May 2020 16:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <20200526131649.6318-1-liu.ming50@gmail.com> <20200526131649.6318-2-liu.ming50@gmail.com>
In-Reply-To: <20200526131649.6318-2-liu.ming50@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 26 May 2020 16:15:43 -0700
Message-ID: <CAMKF1sqOOmEyzYF_P82BJekiCyoLmQDkUu10G1Vd7Trk7dsx7A@mail.gmail.com>
Subject: Re: [oe] [OE-core] [PATCH V2 1/2] u-boot.inc: fix some inconsistent coding style
To: Ming Liu <liu.ming50@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Stefan Agner <stefan.agner@toradex.com>, Max Krummenacher <max.krummenacher@toradex.com>, 
	Ming Liu <ming.liu@toradex.com>
Content-Type: text/plain; charset="UTF-8"

this should go to oe-core ml.

On Tue, May 26, 2020 at 6:16 AM Ming Liu <liu.ming50@gmail.com> wrote:
>
> From: Ming Liu <ming.liu@toradex.com>
>
> Signed-off-by: Ming Liu <ming.liu@toradex.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot.inc | 44 ++++++++++++++----------------
>  1 file changed, 21 insertions(+), 23 deletions(-)
>
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot/u-boot.inc
> index 80f828df52..718435f13f 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -91,19 +91,19 @@ do_configure () {
>  }
>
>  do_compile () {
> -       if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
> -               sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
> -       fi
> +    if [ "${@bb.utils.filter('DISTRO_FEATURES', 'ld-is-gold', d)}" ]; then
> +        sed -i 's/$(CROSS_COMPILE)ld$/$(CROSS_COMPILE)ld.bfd/g' ${S}/config.mk
> +    fi
>
> -       unset LDFLAGS
> -       unset CFLAGS
> -       unset CPPFLAGS
> +    unset LDFLAGS
> +    unset CFLAGS
> +    unset CPPFLAGS
>
> -       if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> -       then
> -               echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
> -               echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
> -       fi
> +    if [ ! -e ${B}/.scmversion -a ! -e ${S}/.scmversion ]
> +    then
> +        echo ${UBOOT_LOCALVERSION} > ${B}/.scmversion
> +        echo ${UBOOT_LOCALVERSION} > ${S}/.scmversion
> +    fi
>
>      if [ -n "${UBOOT_CONFIG}" ]
>      then
> @@ -130,16 +130,15 @@ do_compile () {
>                      unset k
>                  fi
>              done
> -            unset  j
> +            unset j
>          done
> -        unset  i
> +        unset i
>      else
>          oe_runmake -C ${S} O=${B} ${UBOOT_MAKE_TARGET}
>
>          # Generate the uboot-initial-env
>          oe_runmake -C ${S} O=${B} u-boot-initial-env
>      fi
> -
>  }
>
>  do_install () {
> @@ -162,9 +161,9 @@ do_install () {
>                      ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${D}/${sysconfdir}/${PN}-initial-env
>                  fi
>              done
> -            unset  j
> +            unset j
>          done
> -        unset  i
> +        unset i
>      else
>          install -D -m 644 ${B}/${UBOOT_BINARY} ${D}/boot/${UBOOT_IMAGE}
>          ln -sf ${UBOOT_IMAGE} ${D}/boot/${UBOOT_BINARY}
> @@ -219,9 +218,9 @@ do_install () {
>                           ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${D}/boot/${SPL_BINARYNAME}
>                      fi
>                  done
> -                unset  j
> +                unset j
>              done
> -            unset  i
> +            unset i
>          else
>              install -m 644 ${B}/${SPL_BINARY} ${D}/boot/${SPL_IMAGE}
>              ln -sf ${SPL_IMAGE} ${D}/boot/${SPL_BINARYNAME}
> @@ -238,7 +237,6 @@ do_install () {
>      then
>          install -Dm 0644 ${UBOOT_EXTLINUX_CONFIG} ${D}/${UBOOT_EXTLINUX_INSTALL_DIR}/${UBOOT_EXTLINUX_CONF_NAME}
>      fi
> -
>  }
>
>  PACKAGE_BEFORE_PN += "${PN}-env"
> @@ -275,9 +273,9 @@ do_deploy () {
>                      ln -sf ${PN}-initial-env-${MACHINE}-${type}-${PV}-${PR} ${PN}-initial-env-${type}
>                  fi
>              done
> -            unset  j
> +            unset j
>          done
> -        unset  i
> +        unset i
>      else
>          install -D -m 644 ${B}/${UBOOT_BINARY} ${DEPLOYDIR}/${UBOOT_IMAGE}
>
> @@ -346,9 +344,9 @@ do_deploy () {
>                          ln -sf ${SPL_IMAGE}-${type}-${PV}-${PR} ${DEPLOYDIR}/${SPL_SYMLINK}
>                      fi
>                  done
> -                unset  j
> +                unset j
>              done
> -            unset  i
> +            unset i
>          else
>              install -m 644 ${B}/${SPL_BINARY} ${DEPLOYDIR}/${SPL_IMAGE}
>              rm -f ${DEPLOYDIR}/${SPL_BINARYNAME} ${DEPLOYDIR}/${SPL_SYMLINK}
> --
> 2.26.2
>
> 
