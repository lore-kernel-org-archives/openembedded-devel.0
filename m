Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id C404B71B86
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 08:55:22 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id i124so2942671wmf.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Oct 2017 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K8UNZFGU2wjAD/kgy0BMnCZfcyU6ryPOMZo81y6S36M=;
	b=F3w7dkchF8w1QzKfo8i69yKpNoSoiMhdzjkKPp5IsrQ8F+4Zv7KkyX7W517GBX0Ghe
	4M84cM6unw8+yn/tF4oMs4lyFiOSCncMZMCWvV3Om2jEHOLHL0Z+Eu6ULB6rJPNGB7yM
	JYvwah5Z2eqKPU6rzzVI5NOF07Ef/RPFa+fc+MBT0NTDE2N0PCVoq9i+22RTCudX8eZl
	YrccxfZQ/H0xqfOnu9EHmCVPilA2j6TlkzVhvdZwVhy6gRz8vq8BBnmPOYT0ofTOEBf3
	O2gY4qx9dyYzwFypXByi6Rtskvo6NrjgEMxn4KM1oNBbXoYI0WMEG8t+XnGJXpd4Kyaz
	vsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K8UNZFGU2wjAD/kgy0BMnCZfcyU6ryPOMZo81y6S36M=;
	b=RvyVkStKHWCq9VMHzV4hw0GxhdPABiebIL3hwQCFmJz6bIFSMcj75fcEtnyK1jE7Pm
	Y+IBMc6nW3g1rKUjL92/5QZZkPTeZv1FNSxlApj+PknZjI4rxihG0Om71O8TXW1gAkor
	c3vc854e9GCBVM2p4uRb0JMTEiXwBc0N2gKoSbiXhyojNuPFkoGIDnV4CivBDhIJb09r
	CeiM14c968SIaV4LojrYZe1NvddzR3gTWqMlhSiUffKSgU62CoJULhxU7i3afaW7/NV2
	6xxMVLLLwAhE3lRkWxtyj79COMkIaYA/nvxDIh0C1rjD6Zhl2z16JAxDVDRZIRBBxQwP
	TH5Q==
X-Gm-Message-State: AMCzsaU7kmRm2JxV/XkUeGuUxUcr10fRHuBmsMwt1ZwllhNYOEKosrHV
	2BFF5NG7rUfKTdwqWn2xgoSck5GnYE///nHrdRY=
X-Google-Smtp-Source: AOwi7QA1sQ5QiyXJ/Fe6y0o5AJXvIVPFBSvY9t4hfH6k4MQpYIls/2q8JdjahMrTA82geU2TfbpS9lUm2mHxlxlCk9Y=
X-Received: by 10.223.158.208 with SMTP id b16mr3160731wrf.99.1507625723773;
	Tue, 10 Oct 2017 01:55:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 10 Oct 2017 01:55:23 -0700 (PDT)
In-Reply-To: <20170619010516.11453-3-raj.khem@gmail.com>
References: <20170619010516.11453-1-raj.khem@gmail.com>
	<20170619010516.11453-3-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 10 Oct 2017 10:55:23 +0200
Message-ID: <CA+chaQeq28Y4-ZJOADaXGe6Tdt60pLLqwr7f6NZPy0k0fQf7sQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 3/3] xmlstarlet: Update to 1.6.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 10 Oct 2017 08:55:23 -0000
Content-Type: text/plain; charset="UTF-8"

Looks like this failed again yesterday:
http://errors.yoctoproject.org/Errors/Details/157121/

On Mon, Jun 19, 2017 at 3:05 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Enable PARALLEL_MAKE again
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../xmlstarlet/{xmlstarlet_1.5.0.bb => xmlstarlet_1.6.1.bb}   | 11
> ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>  rename meta-oe/recipes-support/xmlstarlet/{xmlstarlet_1.5.0.bb =>
> xmlstarlet_1.6.1.bb} (69%)
>
> diff --git a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
> b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
> similarity index 69%
> rename from meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
> rename to meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
> index bf99aff43..e3d52e616 100644
> --- a/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.5.0.bb
> +++ b/meta-oe/recipes-support/xmlstarlet/xmlstarlet_1.6.1.bb
> @@ -15,8 +15,8 @@ DEPENDS = "libxml2 libxslt"
>  SRC_URI = "${SOURCEFORGE_MIRROR}/xmlstar/${BP}.tar.gz \
>             file://configure.ac.patch \
>             file://0001-usage2c.awk-fix-wrong-basename-regexp.patch"
> -SRC_URI[md5sum] = "0c6db295d0cf9ff0d439edb755b7e8f6"
> -SRC_URI[sha256sum] = "47b4ed042ea2909257f2a386001af4
> 9fceb303f84da7214779ccf99fffc6bbba"
> +SRC_URI[md5sum] = "f3c5dfa3b1a2ee06cd57c255cc8b70a0"
> +SRC_URI[sha256sum] = "15d838c4f3375332fd95554619179b
> 69e4ec91418a3a5296e7c631b7ed19e7ca"
>
>  inherit autotools
>
> @@ -24,10 +24,3 @@ inherit autotools
>  EXTRA_OECONF="--disable-build-docs \
>    --with-libxml-prefix=${STAGING_LIBDIR}/.. \
>    --with-libxslt-prefix=${STAGING_LIBDIR}/.."
> -
> -#Makefile:2116: recipe for target 'src/elem-usage.c' failed
> -#make[1]: *** [src/elem-usage.c] Error 1
> -#/bin/bash: src/escape-usage.c: No such file or directory
> -#Makefile:2116: recipe for target 'src/escape-usage.c' failed
> -#make[1]: *** [src/escape-usage.c] Error 1
> -PARALLEL_MAKE = ""
> --
> 2.13.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

