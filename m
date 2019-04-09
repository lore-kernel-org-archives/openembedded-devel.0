Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by mail.openembedded.org (Postfix) with ESMTP id 86BA37D701
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Apr 2019 18:19:17 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id v32so20930133qtc.10
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Apr 2019 11:19:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=d9J9TFl/ghzG2xojfielJ+N9Xs07k+qV/cMe+8DB6uk=;
	b=erNYNeCuWcY5WQr24ziL1C5m9VXEJ/9XooPamSv4X5kTnso7d04NhEpwDJtfBw7hcY
	QZjKkTV/lmzcJ06RyNHpvzuYrdoN+YQS1hSJLdPfpFyenx63ZcciRewQnpUlrCwDoFj8
	uQtuiww24Mcfr1yDxI7bSxc6hw+CVckeeRyhX4X8+9F0miarcIHUv9SVL+NMmPeQDwYV
	PI3pYYoMSQql7BFw0Mtpp3DsVd2U+nwHEB60H5H5Kk3jVOXRsldbNmHMnf7nYiZKwe9y
	Otaap6hTdCTczlgNSNR3U/0psfNQSDgNInBfJjyLKsAfjKDQ09zRtgtxSSAtpxNyPcdA
	8gqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=d9J9TFl/ghzG2xojfielJ+N9Xs07k+qV/cMe+8DB6uk=;
	b=Ed9PiO4G0GpIKqrEnr+2IQLQE0DNeoV6X9aGNyqXSJnOreohrOeDcLVlX5z7n3NvkR
	M1Osc5Zkg8ENKOaFiHSzGmn4FNIcvaA4nfqax7AQ8vnSW4bfKKeSX5VgG2TepS7qmRY7
	wqyiS9k4KBjBhihUpdQOzMWSb6yBJeI1o7JpHAxRMDUfRyyGkD0kkeDIF5Np83/0/NTT
	gLJNVh71lW/hZPzeB+I6Svkce8X5G1bZ6+vhD41M6USJrcLCqaYd41EKkgH+xQ61jx2G
	Rnp8iGJDH4/VMwDF0iboXFgyezGVA0+CA/Uwlj3XSxBAU43FFx0l8+r9LAovCJhUDDLi
	Ayzg==
X-Gm-Message-State: APjAAAViG1KyRB9zGAH1EET+vWgEAfP7gQNv+k7g4MQUEX7sQbMSvKcK
	Fu02mpYrf2tWrzOtPsDPBmM1YcTYOQS61HM1XQLVyiMQ
X-Google-Smtp-Source: APXvYqwnGB3cEEHslyVTgiQCbHRYQMoB6Py0Gw0ld+8aYZVVgSdIP5DquUZuwtbrY3SHMsGmYQFaqIRnrWGzk90Gztg=
X-Received: by 2002:ac8:262c:: with SMTP id u41mr32564424qtu.198.1554833958216;
	Tue, 09 Apr 2019 11:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190409104743.28264-1-open.source@oleksandr-kravchuk.com>
In-Reply-To: <20190409104743.28264-1-open.source@oleksandr-kravchuk.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Apr 2019 11:18:52 -0700
Message-ID: <CAMKF1sqNznQ162JsfKAdtj5+LwrKb92g3dAxZfdoCoPefiiA9Q@mail.gmail.com>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH v2][meta-oe] ell: add recipe
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
X-List-Received-Date: Tue, 09 Apr 2019 18:19:17 -0000
Content-Type: text/plain; charset="UTF-8"

wrong ml

On Tue, Apr 9, 2019 at 3:48 AM Oleksandr Kravchuk
<open.source@oleksandr-kravchuk.com> wrote:
>
> ELL has originally been part of meta-openembedded, but newer versions
> of some of the poky components depend on it, e.g. ofono.
>
> Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
> ---
>  meta/conf/distro/include/maintainers.inc |  1 +
>  meta/recipes-core/ell/ell_0.18.bb        | 22 ++++++++++++++++++++++
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-core/ell/ell_0.18.bb
>
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 950b8e8951..62de7d21bc 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -165,6 +165,7 @@ RECIPE_MAINTAINER_pn-eglinfo-fb = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-eglinfo-x11 = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-eglinfo-wayland = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-elfutils = "Hongxu Jia <hongxu.jia@windriver.com>"
> +RECIPE_MAINTAINER_pn-ell = "Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>"
>  RECIPE_MAINTAINER_pn-enchant = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-encodings = "Armin Kuster <akuster808@gmail.com>"
>  RECIPE_MAINTAINER_pn-epiphany = "Alexander Kanavin <alex.kanavin@gmail.com>"
> diff --git a/meta/recipes-core/ell/ell_0.18.bb b/meta/recipes-core/ell/ell_0.18.bb
> new file mode 100644
> index 0000000000..ca27f4dcda
> --- /dev/null
> +++ b/meta/recipes-core/ell/ell_0.18.bb
> @@ -0,0 +1,22 @@
> +SUMMARY  = "Embedded Linux Library"
> +DESCRIPTION = "The Embedded Linux Library (ELL) provides core, \
> +low-level functionality for system daemons. It typically has no \
> +dependencies other than the Linux kernel, C standard library, and \
> +libdl (for dynamic linking). While ELL is designed to be efficient \
> +and compact enough for use on embedded Linux platforms, it is not \
> +limited to resource-constrained systems."
> +SECTION = "libs"
> +LICENSE  = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=fb504b67c50331fc78734fed90fb0e09"
> +
> +DEPENDS = "dbus"
> +
> +inherit autotools pkgconfig
> +
> +SRC_URI = "https://mirrors.edge.kernel.org/pub/linux/libs/${PN}/${PN}-${PV}.tar.xz"
> +SRC_URI[md5sum] = "18e2be697a54811e49bbe34590a13a42"
> +SRC_URI[sha256sum] = "2c4c1a129f1b697e63ba3f63927dbae1482f6329b48c14a1748d9ab8ac4ee7e3"
> +
> +do_configure_prepend () {
> +    mkdir -p ${S}/build-aux
> +}
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

