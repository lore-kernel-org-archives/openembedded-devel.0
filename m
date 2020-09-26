Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web12.3164.1601085898753034118
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 25 Sep 2020 19:04:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RBfeSJny;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id cr8so2438224qvb.10
        for <openembedded-devel@lists.openembedded.org>; Fri, 25 Sep 2020 19:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OOTNKVr4jcvUswzUmmfuaVLuipEWd/dYz8xW9+oPeGQ=;
        b=RBfeSJnynOBdfLHjB/WOS6qvYtAEPkrWxKGyMJRX5iMMARgAI9XfxRQx4/08/rfycV
         ReiLMorKufcw7iOaI3qijz/qpIWLuJqwMmWpfdwVf4PS2Tbl+XfzWug3O6J61UP2GZB6
         kVYDZcjBNVV0mQpJSa2DoFR2k0o5dlpVc61cH4NkesHvcVPWips3ZboMY7mODgPX6HRb
         aV/eTljkzcR2Q/5NqkFNYRr8SqR5qpdTiOezhLK21L1c7O3y248KM2uAs1LNU8BF210F
         QcqwP41c0uDNGYACRcIVFO/fTTcoFxK5UzQN3/BN40uG2EeAEoz8jdxUIOopiBEaAAUC
         xHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OOTNKVr4jcvUswzUmmfuaVLuipEWd/dYz8xW9+oPeGQ=;
        b=g43XjsDDtdY0BYVhe+JwVAchDSRHwkT8q98p8P92FlVv0fH3xCPELOq7x7bRrxpnUR
         1t9aWFkK/msGO4VtgMJBL1cyBBui4Fv461Wb3784CQHMIrPi/stT48o37BnlOAIQOQP8
         eo1LGH17aD9fT2vvYdITq+QWvzcoKZTDHdWxptzNgcsB/GkJLs99GUaZuWMU62DBeP//
         H3RC1QZg85iCaG+eUptynOL4c1Iyqt6ytHCTJW6xDROocV+/unn+WeYtsnH/hvmwCEO0
         ID0QqK8rkj1ZJDm4Lwq2GhAFeIcxIMxTwMdUPuec85Z8eeMsBQYAXG8yNkc7ZLp48Ha2
         2ayg==
X-Gm-Message-State: AOAM530F817zAILJeBA/CrWSM2QpV67bQVAx+Nw1fHb0xhEjaPDC7SeJ
	vghSHVA9fn4cf27dO6O7cxfGpvqUHYrAVwwAShw=
X-Google-Smtp-Source: ABdhPJwX8EBb/+ovUzV9CfGjW/7ttmnYMewbSYGXohNmyWxzUA+VKJiKFDHwi+4UfLHV/nah709kvup9EljKrBFUPjU=
X-Received: by 2002:a0c:b29e:: with SMTP id r30mr1706497qve.38.1601085897757;
 Fri, 25 Sep 2020 19:04:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200925114441.13905-1-brgl@bgdev.pl>
In-Reply-To: <20200925114441.13905-1-brgl@bgdev.pl>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 25 Sep 2020 19:04:31 -0700
Message-ID: <CAMKF1sqd4OscNS9sFLfcaQxoCANdnB1KoEt8s9O0GKcF-m5jDQ@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libgpiod: refactor the recipe
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Armin Kuster <akuster808@gmail.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"

Usually, the recipes are moving otherway. include files are useful
only when there should be multiple recipes sharing common stuff. For a
single recipe it would be an overkill IMO

On Fri, Sep 25, 2020 at 4:44 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> After dropping the support for v0.3.x let's refactor the entire recipe.
> Let's move most definitions into libgpiod.inc and only leave the hashes
> in libgpiod_1.4.4.bb. Let's use ${BPN} in the URL, consolidate certain
> variables and add some explanatory comments.
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod.inc | 21 ++++++++++++++-----
>  .../libgpiod/libgpiod_1.4.4.bb                | 15 -------------
>  2 files changed, 16 insertions(+), 20 deletions(-)
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.inc b/meta-oe/recipes-support/libgpiod/libgpiod.inc
> index cae3145dd..ec81b3bdd 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod.inc
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod.inc
> @@ -3,17 +3,28 @@ SUMMARY = "C library and tools for interacting with the linux GPIO character dev
>  LICENSE = "LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
>
> -SRC_URI = "https://www.kernel.org/pub/software/libs/libgpiod/${BP}.tar.xz"
> +SRC_URI = "https://www.kernel.org/pub/software/libs/${BPN}/${BP}.tar.xz"
>
> -inherit autotools pkgconfig
> +inherit autotools pkgconfig python3native
>
>  PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> +PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
> +PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
>
> +# Enable cxx bindings by default.
> +PACKAGECONFIG ?= "cxx"
> +
> +# Always build tools - they don't have any additional
> +# requirements over the library.
>  EXTRA_OECONF = "--enable-tools"
>
> -PACKAGES =+ " ${PN}-tools"
> +DEPENDS += "autoconf-archive-native"
>
> +PACKAGES =+ "${PN}-tools libgpiodcxx"
>  FILES_${PN}-tools = "${bindir}/*"
> -
> -PACKAGES =+ "libgpiodcxx"
>  FILES_libgpiodcxx = "${libdir}/libgpiodcxx.so.*"
> +
> +PACKAGES =+ "${PN}-python"
> +FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
> +RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
> +RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> index b5a64a554..6cb43f994 100644
> --- a/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod_1.4.4.bb
> @@ -1,19 +1,4 @@
>  require libgpiod.inc
>
> -DEPENDS += "autoconf-archive-native"
> -
>  SRC_URI[md5sum] = "064c2627397e6641c52de09a26951112"
>  SRC_URI[sha256sum] = "f1cda2789e6a13a92aefc012a76e5a7cc57a1b402d66f71df8719ee314b67699"
> -
> -# enable cxx bindings
> -PACKAGECONFIG ?= "cxx"
> -
> -PACKAGECONFIG[cxx] = "--enable-bindings-cxx,--disable-bindings-cxx"
> -PACKAGECONFIG[python3] = "--enable-bindings-python,--disable-bindings-python,python3"
> -
> -inherit python3native
> -
> -PACKAGES =+ "${PN}-python"
> -FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
> -RRECOMMENDS_PYTHON = "${@bb.utils.contains('PACKAGECONFIG', 'python3', '${PN}-python', '',d)}"
> -RRECOMMENDS_${PN}-python += "${RRECOMMENDS_PYTHON}"
> --
> 2.26.1
>
