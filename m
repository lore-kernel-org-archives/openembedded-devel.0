Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.15304.1604944122157606280
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Nov 2020 09:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=L9y8vax5;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id y197so8732047qkb.7
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Nov 2020 09:48:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LZJGY3Hd8/+yyjm6HsiasrZAeFqhd7KWQ+fWaFY2C2o=;
        b=L9y8vax5J30Xrie7hK9bFq3FDhX6gSY0VRVbEITb6bQWKf3pFPm0nCq6hIp7DJeCSc
         pT1eT0nqWymM/fy95q9REkA1gOa9u+o04R1bh/5eEwAO41TyeG1bs8Xtor2um3ELjQ/O
         YI94Ic2BAX1/lBIYwk3RA9MpzyN9xFHkGaAHbcCWiE7wcjIPTH8A2JBJxK9CovRr3dwn
         sH3zBvzKWWWK33lQfsdSSpAreWu/mhq+ZYYKRzXhmz9ztDBvm+1fRsGUm4NQy7a04tKD
         6KTELUhnfj4xY8I02/FXH3moMeuWeDMFk50UxyUdQSd/osFAWEGLGKavah0qFXqHRE/u
         uDHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LZJGY3Hd8/+yyjm6HsiasrZAeFqhd7KWQ+fWaFY2C2o=;
        b=klBxx85Pb6AK3IwL8kWcPKvhjxPf858+G0+H1TWVsw0qZmnu6w49BgE/uIjICmKn65
         gAjNEZ0mEN5jieyayoF4W/MRo7F4Z13FQ0owpJbY5SNNTadhWIWaSakXRyFe+ja1kvRn
         8a4GOL9JU/2dDAuZKDKWQAorHnPXE3VkXAfKIEVYV0KDbn08q/8vKkCNbtkgyGYfXsaI
         4uBexXtePIhxTOmyjyhSUT2nom80NqUcfdisNQItPuKtdIMaopdmor/EneAz5bH3YShY
         KDvYpM3VFEls30QWa02iQcJaYlH+5CqDnHN/u2RgzV2+V6ydmRt7LWH5qSL+7KNCPIBW
         GLzQ==
X-Gm-Message-State: AOAM5310u/0TKpH0lWVrFvqIKNnW6WfbiNh3lUS5Y3sbA9WbEraHxi43
	vsb1fcqLukCQa2XyeuM6CnuQWIvvC4NCCgYeop6tZVQOllD41g==
X-Google-Smtp-Source: ABdhPJym6zZGwfegdeMriuNhOy7ECkPdeSijwTtlkSX7hit5jYDPzGB9uzSAggU8/A8kHaJ+V+/fe+TmNe3on4YWOFU=
X-Received: by 2002:a05:620a:c07:: with SMTP id l7mr15529309qki.9.1604944121189;
 Mon, 09 Nov 2020 09:48:41 -0800 (PST)
MIME-Version: 1.0
References: <20201105093015.36886-1-mingli.yu@windriver.com> <20201105093015.36886-2-mingli.yu@windriver.com>
In-Reply-To: <20201105093015.36886-2-mingli.yu@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Mon, 9 Nov 2020 09:48:14 -0800
Message-ID: <CAMKF1sr3Ntwy_H6QsxVAHJaT2unc=pw9z0z0ecNANP74850j+A@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH 2/4] ndpi: add new recipe
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This needs to go into
meta-networking/recipes-core/packagegroups/packagegroup-meta-networking.bb

On Thu, Nov 5, 2020 at 1:30 AM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <mingli.yu@windriver.com>
>
> nDPI is an open source LGPLv3 library for deep-packet inspection.
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  ...01-autogen.sh-not-generate-configure.patch | 33 +++++++++++++++++++
>  .../recipes-support/ntopng/ndpi_3.4.bb        | 26 +++++++++++++++
>  2 files changed, 59 insertions(+)
>  create mode 100644 meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
>  create mode 100644 meta-networking/recipes-support/ntopng/ndpi_3.4.bb
>
> diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
> new file mode 100644
> index 000000000..ffc6ec1ef
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
> @@ -0,0 +1,33 @@
> +From d482bcc8fca90afc95ac3cbe848a3c9d7ad81ddc Mon Sep 17 00:00:00 2001
> +From: Mingli Yu <mingli.yu@windriver.com>
> +Date: Wed, 4 Nov 2020 23:37:44 -0800
> +Subject: [PATCH] autogen.sh: not generate configure
> +
> +Only use autogen.sh to generate configure.ac.
> +
> +Upstream-Status: Inappropriate [embedded specific]
> +
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +---
> + autogen.sh | 8 --------
> + 1 file changed, 8 deletions(-)
> +
> +diff --git a/autogen.sh b/autogen.sh
> +index df734ce9..d7bbf8cb 100755
> +--- a/autogen.sh
> ++++ b/autogen.sh
> +@@ -52,11 +52,3 @@ cat configure.seed | sed \
> +     -e "s/@NDPI_VERSION_SHORT@/$NDPI_VERSION_SHORT/g" \
> +     -e "s/@FUZZY@/$FUZZY/g" \
> +     > configure.ac
> +-
> +-autoreconf -ivf
> +-cat configure | sed "s/#define PACKAGE/#define NDPI_PACKAGE/g" | sed "s/#define VERSION/#define NDPI_VERSION/g"  > configure.tmp
> +-cat configure.tmp > configure
> +-
> +-chmod +x configure
> +-./configure $@
> +-
> +--
> +2.17.1
> +
> diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
> new file mode 100644
> index 000000000..1e4153779
> --- /dev/null
> +++ b/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "A library for deep-packet inspection."
> +DESCRIPTION = "nDPI is an open source LGPLv3 library for deep-packet \
> +inspection. Based on OpenDPI it includes ntop extensions"
> +
> +SECTION = "libdevel"
> +DEPENDS = "libpcap"
> +RDEPENDS_${PN} += " libpcap"
> +LICENSE = "GPLv3"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
> +
> +SRCREV = "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
> +SRC_URI = "git://github.com/ntop/nDPI.git;branch=3.4-stable \
> +           file://0001-autogen.sh-not-generate-configure.patch \
> +"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools-brokensep pkgconfig
> +
> +do_configure_prepend() {
> +    ${S}/autogen.sh
> +}
> +
> +EXTRA_OEMAKE = " \
> +    libdir=${libdir} \
> +"
> --
> 2.26.2
>
>
> 
>
