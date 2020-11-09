Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web08.16274.1604948022086127037
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 10:53:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MFvUZnWU;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id p12so6756712qtp.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 10:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tGMb7FXy5i0CtORQU9kS1ULSzkONpmFPVDV+IBPYI/E=;
        b=MFvUZnWU9shrUCwxmsbbVtABjb35e/VYsFWgXMHpAnP25IHDlxVnPNwTOQgjBo66hn
         3AY7NUPjiaC10kE4NWM60EKELK0wjQq00m35Sru3HLrIkyQ0wSGEbBR2wg1OqXSoCq4p
         wlST16Crc/uQixObfmNZ5m2AFhDj49R3+h6zqpKz379XCufPCzIHVpqHdPNrhCTSkzWR
         R6LijYE3sPJ3iX4bF36J3bE5pLd0AEUoj6Z0Qc/il6NeI5rp8N/FJJa9R7ysFZWtLscc
         TIJIoLc+Mx3YxzOOKPuDUfAKb4gNU1pFPJkMCO3Ixsrq7nrjQoImPGx9cPMdPHPFPmup
         Jc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tGMb7FXy5i0CtORQU9kS1ULSzkONpmFPVDV+IBPYI/E=;
        b=kv/iSl6ClU4fkGVqfiSKz+k1youR341Xq1QCUhcqbA9WST+lpNj5tFneWK8qqxgPj2
         LkVOMVfvTiAjmXlv3SRSB5V308zmvrN4rhKr4PJuXB4Ov1nHwMnRINqeMdZgBjZqUS1a
         lNxmTIpDSKcZUTU9p5WXx8th8AdXCivxV6BNuL4Ti8blkp7qoo7fKkfkQ/9cxlhYSrFF
         LKeFUiqClIBsivFTOeUpHVmjWAG4U+J82ogCkp4X88g+cNRnuUet+zkolen4aKcrAZCI
         EsVnkETxr4R+nm8+OdNzSEAH3tXGCKv+46HMTg3e7G9H16G++OhQ+U/dJXwk7DNOgSD/
         UBlw==
X-Gm-Message-State: AOAM533P1qV34q6GtltuDB8PiPMfArnwMNoTYfbD/kpSjc0wB4KsxIez
	ANC9BW5GQQkLj/kvOmQkwp1ccRrC5roizrq7Vog=
X-Google-Smtp-Source: ABdhPJxNvHG87rkcopBm0Gev+QH+3MeAvQPiQDNiLJBIMfwo8mc756NrEoB0sCw/NvjBdXUdEzVfhMGTs+cvhcfN8b8=
X-Received: by 2002:ac8:5844:: with SMTP id h4mr14337907qth.194.1604948021090;
 Mon, 09 Nov 2020 10:53:41 -0800 (PST)
MIME-Version: 1.0
References: <20201109183156.25407-1-greg@gpanders.com>
In-Reply-To: <20201109183156.25407-1-greg@gpanders.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 10:53:15 -0800
Message-ID: <CAMKF1sp0VZHZnQGDTBmX0bNBNQP5cFK_iK0=okTJ-2=N7Ut=vg@mail.gmail.com>
Subject: Re: [oe] [meta-python][PATCH v2] Add python3-cvxopt
To: Gregory Anders <greg@gpanders.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 9, 2020 at 10:32 AM Gregory Anders <greg@gpanders.com> wrote:
>
> ---
> Added python3-cvxopt to meta-python packagegroup
>
>  .../packagegroups/packagegroup-meta-python.bb |  1 +
>  .../python/python3-cvxopt_1.2.5.bb            | 20 +++++++++++++++++++
>  2 files changed, 21 insertions(+)
>  create mode 100644 meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
>
> diff --git a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> index 6a3061986..0120fb873 100644
> --- a/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> +++ b/meta-python/recipes-core/packagegroups/packagegroup-meta-python.bb
> @@ -425,6 +425,7 @@ RDEPENDS_packagegroup-meta-python3 = "\
>      python3-pycurl \
>      gyp \
>      python3-jsonref \
> +    python3-cvxopt \
>  "
>
>  RDEPENDS_packagegroup-meta-python3-extended = "\
> diff --git a/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> new file mode 100644
> index 000000000..7d01b22a1
> --- /dev/null
> +++ b/meta-python/recipes-devtools/python/python3-cvxopt_1.2.5.bb
> @@ -0,0 +1,20 @@
> +SUMMARY = "Convex optimization package"
> +HOMEPAGE = "http://cvxopt.org"
> +LICENSE = "GPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=4905701d14049b3f8e4774c290aeee21"
> +
> +SRC_URI = "git://github.com/cvxopt/cvxopt;protocol=https"
> +
> +SRCREV = "1.2.5"
> +PV = "${SRCREV}"

since you have it in recipe name. setting PV here is not needed.

> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} += "lapack suitesparse"
> +DEPENDS += "lapack suitesparse"
> +
> +inherit setuptools3
> +
> +export CVXOPT_BLAS_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_LIB_DIR = "${STAGING_LIBDIR}"
> +export CVXOPT_SUITESPARSE_INC_DIR = "${STAGING_INCDIR}"
> --
> 2.29.2
>
>
> 
>
