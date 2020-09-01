Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.9129.1599002202224181932
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 01 Sep 2020 16:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Gbj1FSwW;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id cy2so1391222qvb.0
        for <openembedded-devel@lists.openembedded.org>; Tue, 01 Sep 2020 16:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PvZ/o1tyb6qv12Vz4mfmtNuxWs+tNu+FQ6Uxh6SONNo=;
        b=Gbj1FSwWQZfu13YpCSPX2J86xaJ8AucdkDBqOMZYcs9tLRG+BmA7EcjtFhcg4lsmTV
         z/2WbnPNW/aVBQc96cdvFGUkxpN6finbfdGbM5Ve2GCIuSpx4tVsYmBFNZJJkuIr2dNZ
         0teSxoxKA/9BO7YFEfuyrgIJFnenhOViV7JauJYm78jtuSYVm48LhauJrx6GQRakb04x
         ysTGg0a+Jgq7GEVVROj7yIeOeiP1SG4rqWaOo6kFmPTs1SzGLTSK/HTV9O05v9zxJH50
         TvrTuW4jiSXFQoJxMuqkKxzM6jrVDR1Kdr/Zh7xVzaQB54RK7q6ynb85PaEr86DNRR4i
         mm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PvZ/o1tyb6qv12Vz4mfmtNuxWs+tNu+FQ6Uxh6SONNo=;
        b=OnfnqI/MaznFxotwaDAcYVTyggOUXaKQKwSRQPg+4NsiDPG8ymRlg0hlFuUvt3O6PW
         fAi+tv6Ari9dXmmjT7X88S4nCncIa3z0TgeyLAlfHBygxXJiqsHSTJER/AmZ1XNHLIpr
         XDZz+WT0QHvocz7BCjE1luim0nFZsIR88qWNdxET0XipGU9auDRW7xU+9J4AQmJtD0gx
         0jHYr99MRQJo3flUyLr2JLe1L3jV/6kv81dvfaJYo2Qzpi7S7QtHzdXJs+YbwnsZ+LSE
         QCIVKdCeUKTJM8EY992Zv4hqp0c7A2WDloFt0vJ1uqziup6tnu1t/RNTZ84zMu0gHUXB
         P1SQ==
X-Gm-Message-State: AOAM532V8kq1t48fJ/KyDCMp5kifFErjMMucbIgJ+kpu3wGcTpO2qEtt
	RRR9cUHWSIC87mLObOTfSJQqa+Sn8BrbBHETIWU=
X-Google-Smtp-Source: ABdhPJyyK0WWPyJEZC4oA6Ftzl3eXM1mhqq9GiopgxLQcLON5QynVb5tEzrArVjLYZ3TtCsNQQsSiigU71yHTAW9FRs=
X-Received: by 2002:a0c:b5dd:: with SMTP id o29mr4423241qvf.22.1599002201270;
 Tue, 01 Sep 2020 16:16:41 -0700 (PDT)
MIME-Version: 1.0
References: <162F7E2FF7270601.30808@lists.openembedded.org> <20200901224141.40600-1-Martin.Jansa@gmail.com>
In-Reply-To: <20200901224141.40600-1-Martin.Jansa@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 1 Sep 2020 16:16:15 -0700
Message-ID: <CAMKF1soOvykbhXx=-XbsZ=3Twv5hptwyVejLV-SObYkw1=C+Tg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] nss: remove signlibs.sh
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 1, 2020 at 3:41 PM Martin Jansa <Martin.Jansa@gmail.com> wrote:
>
> Looks like my "solution" also isn't working well at least for images with read-only-rootfs in IMAGE_FEATURES.
>
> pkg_postinst_ontarget_${PN} is always forced to run on the target, which for read-only-rootfs results in:
> log.do_rootfs:
> ...
> NOTE: If an image is being built, the postinstalls for the following packages will be postponed for first boot: nss
> ...
> ERROR: The following packages could not be configured offline and rootfs is read-only: ['nss']
>
> and now looking at the /usr/bin/signlibs.sh and it does pretty much
> the same as the postinst script when D isn't empty.
>
> From oe-core git history it shows that signlibs.sh was added first:
> https://git.openembedded.org/openembedded-core/commit/?id=a4580f967c8064294a06d406acf5deb24aee2acc
> then the offline version of postinst was added to support read-only-rootfs in:
> https://git.openembedded.org/openembedded-core/commit/?id=64e87fc6e99bc1d4807034166735034b1f92bad8
> and nss-native should always provide the shlibsign since:
> https://git.openembedded.org/openembedded-core/commit/?id=88540c5b08dea069660d1a68e506aebdd68e6ae0
> and only after
> https://git.openembedded.org/openembedded-core/commit/?id=8f782f7095e718dd9452055af53363beb6bdbece
> it looked like signlibs.sh was something special only for target.
>
> So it looks to me, that we should just remove signlibs.sh script and let the same postinst be used on target and offline
> (with or without D being empty).
>
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/nss/nss/signlibs.sh | 20 --------------------
>  meta-oe/recipes-support/nss/nss_3.56.bb     |  6 ------
>  2 files changed, 26 deletions(-)
>  delete mode 100644 meta-oe/recipes-support/nss/nss/signlibs.sh
>
> diff --git a/meta-oe/recipes-support/nss/nss/signlibs.sh b/meta-oe/recipes-support/nss/nss/signlibs.sh
> deleted file mode 100644
> index a74e499f8c..0000000000
> --- a/meta-oe/recipes-support/nss/nss/signlibs.sh
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -
> -# signlibs.sh
> -#
> -# (c)2010 Wind River Systems, Inc.
> -#
> -# regenerates the .chk files for the NSS libraries that require it
> -# since the ones that are built have incorrect checksums that were
> -# calculated on the host where they really need to be done on the
> -# target
> -

if we remove this then how do we solve above said issue? is it still an issue ?

> -CHK_FILES=`ls /lib*/*.chk /usr/lib*/*.chk 2>/dev/null`
> -SIGN_BINARY=`which shlibsign`
> -for I in $CHK_FILES
> -do
> -       DN=`dirname $I`
> -       BN=`basename $I .chk`
> -       FN=$DN/$BN.so
> -       $SIGN_BINARY -i $FN
> -done
> diff --git a/meta-oe/recipes-support/nss/nss_3.56.bb b/meta-oe/recipes-support/nss/nss_3.56.bb
> index 107b0a0152..997f8950fd 100644
> --- a/meta-oe/recipes-support/nss/nss_3.56.bb
> +++ b/meta-oe/recipes-support/nss/nss_3.56.bb
> @@ -21,7 +21,6 @@ VERSION_DIR = "${@d.getVar('BP').upper().replace('-', '_').replace('.', '_') + '
>
>  SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSION_DIR}/src/${BP}.tar.gz \
>             file://nss.pc.in \
> -           file://signlibs.sh \
>             file://0001-nss-fix-support-cross-compiling.patch \
>             file://nss-no-rpath-for-cross-compiling.patch \
>             file://nss-fix-incorrect-shebang-of-perl.patch \
> @@ -214,7 +213,6 @@ do_install_append() {
>          touch ${D}/${libdir}/$file
>          chmod 755 ${D}/${libdir}/$file
>      done
> -    install -D -m 755 ${WORKDIR}/signlibs.sh ${D}/${bindir}/signlibs.sh
>
>      install -d ${D}${libdir}/pkgconfig/
>      sed 's/%NSS_VERSION%/${PV}/' ${WORKDIR}/nss.pc.in | sed 's/%NSPR_VERSION%/4.9.2/' > ${D}${libdir}/pkgconfig/nss.pc
> @@ -251,10 +249,6 @@ pkg_postinst_${PN} () {
>      done
>  }
>
> -pkg_postinst_ontarget_${PN} () {
> -    ${bindir}/signlibs.sh
> -}
> -
>  PACKAGES =+ "${PN}-smime"
>  FILES_${PN}-smime = "\
>      ${bindir}/smime \
> --
> 2.25.1
>
> 
