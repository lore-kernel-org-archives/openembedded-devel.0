Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE1DC433F5
	for <webhook@archiver.kernel.org>; Fri,  3 Dec 2021 17:56:33 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web09.14837.1638554193130423376
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 09:56:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jM40DcvX;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id m17so3492660qvx.8
        for <openembedded-devel@lists.openembedded.org>;
 Fri, 03 Dec 2021 09:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zAFpL1UW7CHrIFpT/3geaM2SPsEXkmnfgAAEeKtPDZE=;
        b=jM40DcvXCZglDFebrjpZhrx57eBrZ5CbDxFniYoKV53gzKjmjcBRHusWpHaZQBKrBh
         77boPPKL/Kfhsz4egtCEKMy9psQNlz0p0dv2sXiFPqPT2U+uxbHPmAYAf1jhXUKNxy8A
         rMf5Cyv+JItPijmecAAEWf8AT8dyiLWZHueOWdH5SQJlzw9aXU0CZAeBlIB/LYOaapFJ
         QZqDtgAf7qpP4+pk0azQvb1RjnbEHOj3Sr/DjuI630rRaN+QnucrYYLYbD0G6J1i73st
         FgKj9tTjyVrZcAz1J1G9f/y3J4vCaAOtDm46JaamzIdB3RXAX9JG7Bqkrd85FrkXiKLF
         VFkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zAFpL1UW7CHrIFpT/3geaM2SPsEXkmnfgAAEeKtPDZE=;
        b=5nFu9a9exdL1Fs6NYwBPkhWPeKaUbfiQ6pR2hRpmT3OQQKG6SFk3X7nw2VnwwfFQWF
         Wbnv55b/kjVfjcsOq/QwR2yrddD3KYbOhYTUj1edlGOAwY7TJ0M21eeFv6/ebj5fVZoK
         tJvVqmeMsCMRXX7/+IIsPi4kvUmCZDvy/DrQpyq60CEjPuonhAqr64tC8gza/oyZDJ1T
         FdWD3UD0V2Ng2kgeWcSK+txAnOmG0NORXf8gbmcnC5Mt2NPTCT6XBONWLp9FOc1Maw7N
         6V9YCNw2EgZZIRhUgxl1O556+rcUCW69pdqoHH3xyVZ4YlROErPDYeedd/qXw/Z4tS0R
         67MA==
X-Gm-Message-State: AOAM532wm9MkuRuaGciqZOj/ae/28lWuunrOVNHbxPka6b2qxYDBdCpk
	BQeX2lfb3ySajIe5aKMIV8wtsm7ur5qqOqXI6d4=
X-Google-Smtp-Source: 
 ABdhPJzx4agl41LrIhp86dZ/KqqTxDDn15RABwW9ky7jVsNcAXn1JSTGE7wnjDEvnDgJdmhFT+3vE0IrPTvJH3bmnDo=
X-Received: by 2002:a05:6214:c28:: with SMTP id
 a8mr21666482qvd.24.1638554192055;
 Fri, 03 Dec 2021 09:56:32 -0800 (PST)
MIME-Version: 1.0
References: <20211203172847.26115-1-sakib.sajal@windriver.com>
In-Reply-To: <20211203172847.26115-1-sakib.sajal@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 3 Dec 2021 09:56:05 -0800
Message-ID: 
 <CAMKF1spJOanJjdHh0M4hNiF6UO0BUR18FZyymTDNsR26y2N=gQ@mail.gmail.com>
Subject: Re: [oe] [meta-perl][PATCH] io-compress-lzma-perl: add recipe for
 version 2.096
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 03 Dec 2021 17:56:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94203

On Fri, Dec 3, 2021 at 9:28 AM Sakib Sajal <sakib.sajal@windriver.com> wrote:
>
> Add recipe for io-compress-lzma-perl and its dependencies.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  .../libio/compress-raw-lzma-perl_2.096.bb     | 33 +++++++++++++++++++
>  .../libio/io-compress-lzma-perl_2.096.bb      | 25 ++++++++++++++
>  .../libio/io-compress-perl_2.096.bb           | 25 ++++++++++++++
>  3 files changed, 83 insertions(+)
>  create mode 100644 meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
>  create mode 100644 meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
>  create mode 100644 meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
>
> diff --git a/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
> new file mode 100644
> index 000000000..431a18f0c
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libio/compress-raw-lzma-perl_2.096.bb
> @@ -0,0 +1,33 @@
> +DESCRIPTION = ""Compress::Raw::Lzma" provides an interface to the in-memory \
> +compression/uncompression functions from the lzma compression library."
> +
> +SECTION = "libs"
> +LICENSE = "Artisticv1 | GPLv1+"
> +PR = "r0"

Drop PR

> +
> +MAINTAINER=    "Poky <poky@yoctoproject.org>"
> +HOMEPAGE=      "https://metacpan.org/release/Compress-Raw-Lzma"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/Compress-Raw-Lzma-2.096.tar.gz"
> +
> +SRC_URI[md5sum] = "b5079bb43712fcd1e74b80777fa376ed"
> +SRC_URI[sha256sum] = "f3afb267b1303b0f125976e9e4a70c6a4a205e35e7c99b408911f5e5c6578217"
> +
> +DEPENDS += "xz"
> +
> +S = "${WORKDIR}/Compress-Raw-Lzma-${PV}"
> +
> +inherit cpan
> +
> +export LIBLZMA_INCLUDE="-I${STAGING_DIR_HOST}${includedir}"
> +export LIBLZMA_LIB="-I${STAGING_DIR_HOST}${libdir}"
> +
> +do_compile() {
> +       export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name 'libc-*.so')"

searching for libc-* might not work with musl C library, so either
make it a bit relaxed or some other way
perhaps based on TCLIBC

> +       cpan_do_compile
> +}
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
> new file mode 100644
> index 000000000..27dfe01c2
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libio/io-compress-lzma-perl_2.096.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "This module provides a Perl interface that allows writing lzma compressed \
> +data to files or buffer."
> +
> +SECTION = "libs"
> +LICENSE = "Artisticv1 | GPLv1+"
> +PR = "r0"

Drop it

> +
> +MAINTAINER=    "Poky <poky@yoctoproject.org>"
> +HOMEPAGE=      "https://metacpan.org/release/IO-Compress-Lzma"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-Lzma-2.096.tar.gz"
> +
> +SRC_URI[md5sum] = "6c1b70740605b8073e4fbb5ba1e7bbdb"
> +SRC_URI[sha256sum] = "2f29125f19bb41d29c4b5a2467e3560b7bce5d428176a046b7c8a51609dce6e8"
> +RDEPENDS_${PN} += "compress-raw-lzma-perl"
> +RDEPENDS_${PN} += "io-compress-perl"

the override syntax need fixing perhaps.

> +
> +S = "${WORKDIR}/IO-Compress-Lzma-${PV}"
> +
> +inherit cpan allarch
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> new file mode 100644
> index 000000000..a7c669ff4
> --- /dev/null
> +++ b/meta-perl/recipes-perl/libio/io-compress-perl_2.096.bb
> @@ -0,0 +1,25 @@
> +DESCRIPTION = "This module is not intended for direct use in application code. Its sole \
> +purpose is to be sub-classed by IO::Compress modules."
> +
> +SECTION = "libs"
> +LICENSE = "Artisticv1 | GPLv1+"
> +PR = "r0"

drop

> +
> +MAINTAINER=    "Poky <poky@yoctoproject.org>"
> +HOMEPAGE=      "https://metacpan.org/release/IO-Compress"
> +
> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/Artistic-1.0;md5=cda03bbdc3c1951996392b872397b798 \
> +file://${COMMON_LICENSE_DIR}/GPL-1.0-only;md5=e9e36a9de734199567a4d769498f743d"
> +
> +SRC_URI = "https://cpan.metacpan.org/authors/id/P/PM/PMQS/IO-Compress-2.096.tar.gz"
> +
> +SRC_URI[md5sum] = "18ad197cad5ca87bc3a7d2538998e017"
> +SRC_URI[sha256sum] = "9d219fd5df4b490b5d2f847921e3cb1c3392758fa0bae9b05a8992b3620ba572"
> +RDEPENDS_${PN} += "compress-raw-bzip2-perl"
> +RDEPENDS_${PN} += "compress-raw-zlib-perl"
> +
> +S = "${WORKDIR}/IO-Compress-${PV}"
> +
> +inherit cpan allarch
> +
> +BBCLASSEXTEND = "native"
> --
> 2.33.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#94202): https://lists.openembedded.org/g/openembedded-devel/message/94202
> Mute This Topic: https://lists.openembedded.org/mt/87482027/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

