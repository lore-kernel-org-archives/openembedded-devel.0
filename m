Received: from mail-qv1-f66.google.com (mail-qv1-f66.google.com [209.85.219.66])
 by mx.groups.io with SMTP id smtpd.web11.13741.1594703098865749457
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Jul 2020 22:04:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OKzqVJs6;
 spf=pass (domain: gmail.com, ip: 209.85.219.66, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f66.google.com with SMTP id t11so6939570qvk.1
        for <openembedded-devel@lists.openembedded.org>; Mon, 13 Jul 2020 22:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jkTxPfVK9MB8tHRl+p/J+vGqcrRPe04EOcQF9rPrVPA=;
        b=OKzqVJs6yc+SZNjdC2K3SiT1TZbFV2YtgmpHS+UDvCHVpCfprY/LRW34pMg8PHSx70
         p7iLV8d9q/s+IBV+GBbE3t2HKaW5ztJFNcnVPhTiBSNhObFTLIaFuSUsXcDOpKg2Kzlp
         k0iWKC/HTNcgjqjHGczAEw2yCOSlM6DZ6My2nr67JSWmjSBH6XYD6YfdSV+dm96qcpHt
         2JnOzY+p/Xs/4YWnbHJQB2CNVRi1i0U7/acKe6GJr/aGSaC99BVyqpWPaPoGM8xsZpwb
         j6GBmzaCsmblTWLytAXpjUvCAJjkkw9YrOmYIFWGLMoUC7DNZmU5DFCYJ2mu1h5lL7S/
         r2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jkTxPfVK9MB8tHRl+p/J+vGqcrRPe04EOcQF9rPrVPA=;
        b=TSFLcdtzsGoft8ABHjeuZmOq0KPG39OK0pk/diXPf1dBOCMN0BldC8MMDWLuOWfFEL
         im3mECUOBTuK6saFR7tm4KxZNrYYHICt6pTrDqgXXxg3Kf16qyhlTqrOdCQTUpAoxJ85
         Z+poYHBTf+aE1BTwPDWGr7uxpB1NpxiWCNif2z7ftWrKSueLbOkL8yxzQUuiMKRdVhx8
         pEhQE/mPQlEKkRIaejvPkHhO1VtGO8BqKrMXoB+tDDo0R7STkkPcAc4rsD9R/B/EiVRl
         ao0OsFagvyFsc0na8B+EinP82T3UZ9ESrX5H+rngS65kYA6STkm0V9kQBlis1+qBNsPV
         o5dA==
X-Gm-Message-State: AOAM533z4x9i+XsA/P/2RzWdzigx99Gmv7QA/vXc0VYxSHbXULpRm0vU
	rKeUjhr73Q/WF3lPoNE6nGoidz3ERDYyi/InzZA=
X-Google-Smtp-Source: ABdhPJzkkbuGg3Upj0IWAWY7sXJdNDfoHLjH9Q7VBghu8IcB6RFjIs67jxXLdham7lr9JxsHKT3ODMxWcJ1n7XEWae8=
X-Received: by 2002:a05:6214:18f:: with SMTP id q15mr2880428qvr.23.1594703097882;
 Mon, 13 Jul 2020 22:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200714050120.17802-1-naveen.kumar.saini@intel.com>
In-Reply-To: <20200714050120.17802-1-naveen.kumar.saini@intel.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 13 Jul 2020 22:04:31 -0700
Message-ID: <CAMKF1srC_87BtgiPMLCE7NUEE4ULGYrGPL3swdL_3EYneXSnFw@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2 1/2] safestringlib: add recipe
To: Naveen Saini <naveen.kumar.saini@intel.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 13, 2020 at 9:53 PM Naveen Saini
<naveen.kumar.saini@intel.com> wrote:
>
> The Secure Development Lifecycle (SDL) recommends banning certain
> C Library functions because they directly contribute to security
> vulnerabilities such as buffer overflows.
>
> However routines for the manipulation of strings and memory buffers
> are common in software and firmware, and are essential to accomplish
> certain programming tasks.
>
> Safer replacements for these functions that avoid or prevent serious
> security vulnerabilities (e.g. buffer overflows, string format attacks,
> conversion overflows/underflows, etc.) are available in the SafeString Library.
>
> Ref:
> https://github.com/intel/safestringlib
>
> Signed-off-by: Naveen Saini <naveen.kumar.saini@intel.com>
> ---
>  .../safestringlib/safestringlib_git.bb        | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 meta-oe/recipes-support/safestringlib/safestringlib_git.bb
>
> diff --git a/meta-oe/recipes-support/safestringlib/safestringlib_git.bb b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
> new file mode 100644
> index 000000000..1ca594412
> --- /dev/null
> +++ b/meta-oe/recipes-support/safestringlib/safestringlib_git.bb
> @@ -0,0 +1,28 @@
> +SUMMARY = "Safe string operations and memory routines"
> +SECTION = "libs"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE&COPYING.txt;md5=edd6f8c4c1072d72645ae28cb04bdbce \
> +                    file://LICENSE;md5=54f68ba2c33474320fcc46b1f2d01249"
> +
> +SRC_URI = "git://github.com/intel/safestringlib.git;protocol=https \
> +        "
> +
> +PV = "1.0.0+git${SRCPV}"
> +SRCREV = "245c4b8cff1d2e7338b7f3a82828fc8e72b29549"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit pkgconfig cmake
> +
> +COMPATIBLE_HOST = '(x86_64.*|i.86.*)-linux'

Since we already have safec in meta-oe which works across more
architectures and has more coverage too
I see less of a point of including this package in meta-oe, perhaps
meta-intel is a better location for this if it
only helps x86

> +
> +do_install() {
> +    install -d ${D}${libdir}
> +    install -d ${D}${includedir}
> +    install -m 0644 ${B}/libsafestring_shared.so ${D}${libdir}
> +    install -m 0644 ${B}/libsafestring_static.a ${D}${libdir}
> +    install -m 0644 ${S}/include/*.h ${D}${includedir}
> +}
> +
> +SOLIBS = ".so"
> +FILES_SOLIBSDEV = ""
> --
> 2.17.1
>
> 
