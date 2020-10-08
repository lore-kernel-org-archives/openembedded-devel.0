Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.815.1602188460685039188
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 08 Oct 2020 13:21:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=paKIn6wV;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id v123so8377493qkd.9
        for <openembedded-devel@lists.openembedded.org>; Thu, 08 Oct 2020 13:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tpXZ5FPr4brjNp35txGO0jF1euupoD0Q0MQKG/Cxe0o=;
        b=paKIn6wVNocAC8krIGF5A/v3HDCuKxVBLSGC5xKakaWkBw0ZvRuJNS3MxitPK4zJPj
         hfiqsRDkLuyNAR5joZzWViaaHH7EWAsip799J5swka8PG5jr61Ig0kw6RDubh6CkNvPS
         h4hMxHsCheay6pp6ca1tntHgIqH5sN3fpJpMGT2t2D3phdCBHbUm8fAFQSrD5Z5VVCU8
         7ZqllGaynx+s9FrtyhiXNMDcv8TfQNd3L2t5kUCEH87Vu6GvjQGp6eYAXSXdYCUiT7VN
         ZZ5WGrCe+vUbqKMvTNvH25ooZiR5LaGjFEN0Iqjbf8l84awMgl2on2/5aAl7m8rRk1bv
         CmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tpXZ5FPr4brjNp35txGO0jF1euupoD0Q0MQKG/Cxe0o=;
        b=me07VGHDmEvzl/kYjQoA+vG7uj9/4fJTxOQDzGSXTtw54CSwAj2trDSDGE488/pTDA
         1rw5Ofdbr0TLw/UeD/LONCOk42VP2oNOW5h/p8ZbBi8vUugHcOr/8FiZ+LMYXQl315pt
         1Ha/fgpdbrwEDvtBntITxsgPcJf8vtS/VnHymQ0am2a/bSAYoOAQHuEvLhcmJB8NkoyG
         Vv5Ba2CXPgxXQ1286vlmnxR9F9YF1sR3oK/obSOhm0fjWj0CukoDkmSMOzhrOCZ/XoQZ
         wedMBqIu628+72d9iesvbzGqntoLs4evK5ZOUeH54FAahwGFo9BvtjIBN7Ic4BJp5DZJ
         6xNA==
X-Gm-Message-State: AOAM530gm3jq098LT8iyxqEsiimt8V8lXUCHR/8AN6w0+rhGMCqcPvag
	k0VDsQfpYD+sFr5/gAKuHe70OQBBZgRgSdeVoDU=
X-Google-Smtp-Source: ABdhPJyNxOIlgiS1GogD4WLUqai7Vp1YhftRJ1Zph46AOsrbo0BNXUX7KdZeYE6cEgw34h7+agf4S86c50bQpcQXjbo=
X-Received: by 2002:a05:620a:c07:: with SMTP id l7mr10499297qki.9.1602188459792;
 Thu, 08 Oct 2020 13:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20201008194259.19152-1-akuster808@gmail.com>
In-Reply-To: <20201008194259.19152-1-akuster808@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 8 Oct 2020 13:20:33 -0700
Message-ID: <CAMKF1sruO3OfF15ZdsMs4TyON9_RedtN0-a8mCux7z1cPv8t+Q@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] musl-nscd: add package
To: akuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 8, 2020 at 12:43 PM akuster <akuster808@gmail.com> wrote:
>
> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> ---
>  .../recipes-devtools/musl/musl-nscd_git.bb    | 37 +++++++++++++++++++
>  1 file changed, 37 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/musl/musl-nscd_git.bb
>
> diff --git a/meta-oe/recipes-devtools/musl/musl-nscd_git.bb b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> new file mode 100644
> index 0000000000..50df6706fc
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/musl/musl-nscd_git.bb
> @@ -0,0 +1,37 @@
> +# Copyright (C) 2020 Armin Kuster <akuster808@gmail.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "Musl-nscd is an implementation of the NSCD protocol, suitable for use with musl and with standard NSS modules"
> +HOMEPAGE = "https://github.com/pikhq/musl-nscd"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=9bf479a145bcaff8489e743da58afeee"
> +SECTION = "utils"
> +
> +PV = "1.0.2"
> +
> +CFLAGS += "-fcommon"
> +
> +SRCREV = "8f278675e1b6a3a02c8ee1b8ca000f80570dc5d6"
> +SRC_URI = "git://github.com/pikhq/musl-nscd"
> +
> +UPSTREAM_CHECK_COMMITS = "1"
> +
> +inherit autotools-brokensep
> +
> +S = "${WORKDIR}/git"
> +
> +do_configure () {
> +    ${S}/configure ${CONFIGUREOPTS} ${EXTRA_OECONF}
> +}
> +
> +do_compile () {
> +    oe_runmake
> +}
> +
> +do_install () {
> +    make DESTDIR=${D} install
> +}
> +
> +INSANE_SKIP_${PN} = "already-stripped"

If you remove

LDFLAGS = -s
from config.mak.dist then you won't need to skip this error.

> +
> +COMPATIBLE_HOST = ".*-musl.*"
> --
> 2.17.1
>
>
> 
>
