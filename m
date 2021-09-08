Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web11.7545.1631079424223402252
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 07 Sep 2021 22:37:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XxDij5wU;
 spf=pass (domain: gmail.com, ip: 209.85.219.46, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f46.google.com with SMTP id z2so609359qvl.10
        for <openembedded-devel@lists.openembedded.org>; Tue, 07 Sep 2021 22:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NMTsrNueE1NWxJ+/QUlySlVvb8dpfH6uvcWVQHKnDbg=;
        b=XxDij5wUvyeXhilj44F7M0EFdnsMGZnWHRxWHcxct+WyDxyycfCyo2otZ1Kdw/rJHN
         5G3UHNCQPx0VGeqMvsPP5qbeSMYnflB+n60A1KSRMK0qTv9OKpiAvx4U8e66cIc2dqRH
         1RKw3s4zst1oD/5uYtJw/MtKrwpsQoFf8GnWMpwQQNYbZs8204ech8efR7Fwvz1zgk0n
         vBjbBsshuiNgRPyz4Yn1WKuwGnT2g7SukeTkboTx54W57JHEGdEWWtWfoWMR1JoqILRK
         YN6lAftuOXz88qJtzkD3e7xFU+erQlCmIFf8L63UJzaChr0WKAJhVraepqZYJs3QOJfF
         yRZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NMTsrNueE1NWxJ+/QUlySlVvb8dpfH6uvcWVQHKnDbg=;
        b=sFUCogv/8EspVISE7YrACKY9QnyefjteotRYDMWxJgx+BxRWtIHFEG8gNXhgHwtc0K
         e42vpC3MIvohxFyycoa/B9VrfLWMpupL0vXupmLSigNODHjYZKFgFusZX6NtvVPXHDVO
         iE2y/pgpxbkT+JGWvC8c6O78Wjcea1IbBx4rgC/vVQKzzi5AQoRTYDgEy4p0N0pr6M4Z
         VhW957HgHrpbHB1cfQl2P7O3VnL4sZQi0u4sOj4/z7hXh3YavV6KD1zfpKufuEc+ciEN
         rG9w88PbN/AxI5jhZwk14WXoJs5/vyg/Tcd0fBL/pmihF2mo9JquQWr+aLVXxHJBSYnQ
         OroA==
X-Gm-Message-State: AOAM531+cbkp/HTnQ/BN0T77G0zHLt1c6Sfl5YzjmKjqE7VfTyvYeb0w
	a8QQmJ4KIxTT68rB7Y0HC32EHdfvfO9N9dVKMhE=
X-Google-Smtp-Source: ABdhPJxaj7gg+c8JTf95tlTwoAnwhs6o0Rb1qaQUP96yoIWBU8u9oHZIHq/HhZFQgTEFt/YHdJf1Fw2V0i1oMGDuKaw=
X-Received: by 2002:a05:6214:28b:: with SMTP id l11mr2172144qvv.18.1631079423217;
 Tue, 07 Sep 2021 22:37:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210908001540.24948-1-changqing.li@windriver.com>
In-Reply-To: <20210908001540.24948-1-changqing.li@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Tue, 7 Sep 2021 22:36:37 -0700
Message-ID: <CAMKF1srbmqYfZW_22764uyax61r7hv0-_VJe08OBZvGTUbeN3g@mail.gmail.com>
Subject: Re: [oe] [meta-networking][PATCH] ndpi: upgrade 3.4 -> 4.0
To: Changqing Li <changqing.li@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

This update fails ntopng see
https://autobuilder.yoctoproject.org/typhoon/#/builders/88/builds/1516

Can you look into ti ? perhaps this needs to be upgraded too.

On Tue, Sep 7, 2021 at 5:19 PM Changqing Li <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  .../0001-autogen.sh-not-generate-configure.patch     | 12 ++++++++----
>  .../ntopng/{ndpi_3.4.bb => ndpi_4.0.bb}              |  7 +++----
>  2 files changed, 11 insertions(+), 8 deletions(-)
>  rename meta-networking/recipes-support/ntopng/{ndpi_3.4.bb => ndpi_4.0.bb} (76%)
>
> diff --git a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
> index ffc6ec1ef..1cbf059ef 100644
> --- a/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
> +++ b/meta-networking/recipes-support/ntopng/files/0001-autogen.sh-not-generate-configure.patch
> @@ -8,15 +8,18 @@ Only use autogen.sh to generate configure.ac.
>  Upstream-Status: Inappropriate [embedded specific]
>
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +
> +refresh patch to 4.0
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  ---
> - autogen.sh | 8 --------
> - 1 file changed, 8 deletions(-)
> + autogen.sh | 9 ---------
> + 1 file changed, 9 deletions(-)
>
>  diff --git a/autogen.sh b/autogen.sh
> -index df734ce9..d7bbf8cb 100755
> +index cf5d7057..cb73cf9d 100755
>  --- a/autogen.sh
>  +++ b/autogen.sh
> -@@ -52,11 +52,3 @@ cat configure.seed | sed \
> +@@ -52,12 +52,3 @@ cat configure.seed | sed \
>       -e "s/@NDPI_VERSION_SHORT@/$NDPI_VERSION_SHORT/g" \
>       -e "s/@FUZZY@/$FUZZY/g" \
>       > configure.ac
> @@ -25,6 +28,7 @@ index df734ce9..d7bbf8cb 100755
>  -cat configure | sed "s/#define PACKAGE/#define NDPI_PACKAGE/g" | sed "s/#define VERSION/#define NDPI_VERSION/g"  > configure.tmp
>  -cat configure.tmp > configure
>  -
> +-echo "./configure $@"
>  -chmod +x configure
>  -./configure $@
>  -
> diff --git a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb b/meta-networking/recipes-support/ntopng/ndpi_4.0.bb
> similarity index 76%
> rename from meta-networking/recipes-support/ntopng/ndpi_3.4.bb
> rename to meta-networking/recipes-support/ntopng/ndpi_4.0.bb
> index 89450f562..24de044c0 100644
> --- a/meta-networking/recipes-support/ntopng/ndpi_3.4.bb
> +++ b/meta-networking/recipes-support/ntopng/ndpi_4.0.bb
> @@ -3,15 +3,14 @@ DESCRIPTION = "nDPI is an open source LGPLv3 library for deep-packet \
>  inspection. Based on OpenDPI it includes ntop extensions"
>
>  SECTION = "libdevel"
> -DEPENDS = "libpcap"
> +DEPENDS = "libpcap json-c"
>  RDEPENDS:${PN} += " libpcap"
>  LICENSE = "GPLv3"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=b52f2d57d10c4f7ee67a7eb9615d5d24"
>
> -SRCREV = "64929a75e0a7a60d864bd25a9fd97fdf9ac892a2"
> -SRC_URI = "git://github.com/ntop/nDPI.git;branch=3.4-stable \
> +SRCREV = "b8806bd2de7391abee18353e9a99ee4aec13887c"
> +SRC_URI = "git://github.com/ntop/nDPI.git;branch=4.0-stable \
>             file://0001-autogen.sh-not-generate-configure.patch \
> -           file://CVE-2021-36082.patch \
>  "
>
>  S = "${WORKDIR}/git"
> --
> 2.17.1
>
>
> 
>
