Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f48.google.com (mail-wm0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 48A557198E
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Nov 2016 06:53:13 +0000 (UTC)
Received: by mail-wm0-f48.google.com with SMTP id t79so16252124wmt.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2016 23:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=fBIDHke8Crs4oCm90O/Yu3UQQhKkznI2jKP36JQg2Lc=;
	b=Z4uhRkiWhcZgOqTOezgm4PhYGPkPQAPbOPym35nEHgb4HpSwevXRqef+cGkOCrfnFE
	D18JznQ+6vyVsJyTr0msht76lTRIx7lQxheqXf3CbXJ5cR0zABBoVFKpGV4HDjWSmBpy
	t4zhzak+MXf3RXwD85tjQxaiaRY34RXJEMuCjG9FCjJ/eOn/GLp8rB/0rOanp0SSBl6a
	eLu5/bS/wVDXaDqpapokG+6h+xG+TnBf/E2QR1crz5LovV44R3SPlUPU6hauZBusiBGz
	FHvBJlFLmySBOJJ1JYHxrDCMbW8gdvDO+oDNpKcnXNdUuRmvhgbBrWucuIxkim4OVtrY
	ewWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=fBIDHke8Crs4oCm90O/Yu3UQQhKkznI2jKP36JQg2Lc=;
	b=eMIHaW/O3sEXP2u1AXHiOlCoY9UyURxFHleFdhSJy+Cljf/Q0l0VqHh4/tdBijPA1a
	mpPu3Rsh5D+LCDgLcK8GhNmsO3FykXB9nZthVk3kRG/sh6sRT1UBOtTB/Vg/dVyY28CH
	TvYCQYx+nx0YEdoq3EDy8rwwbDc1zlNRJ+2tXudGxETDfNEUu4AIBPHBb8xB19CALYn4
	gtKD59CcxvVs+uSbWCaRd8DLHLX50H7gzjK4ynEq3W155P0/bLK1hXP+ymIy9ClS4gKy
	DKFuUlQVzRGAjfFhQEEui84OqfbDGxt0B8/vyphDsl9MdsOdz3JC40pgVvewqxsHqx+Z
	seUA==
X-Gm-Message-State: ABUngvf0axZlBjM/eoeBixslj9KAxC8UxHpMEH/cXHmYbwSUWM1sY77weMsers2XEQJJOHmoVNPA3Q+ZifDfqg==
X-Received: by 10.28.151.17 with SMTP id z17mr1347633wmd.15.1478069594478;
	Tue, 01 Nov 2016 23:53:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.134.144 with HTTP; Tue, 1 Nov 2016 23:53:14 -0700 (PDT)
In-Reply-To: <1478067044-24649-1-git-send-email-gizero@gmail.com>
References: <1478067044-24649-1-git-send-email-gizero@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 2 Nov 2016 07:53:14 +0100
Message-ID: <CA+chaQcVE-eMoqCZaTF-esaHc4+0ZYAeOe7JmQ3UtQDwn32Rrg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] libiio: add recipe
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
X-List-Received-Date: Wed, 02 Nov 2016 06:53:15 -0000
Content-Type: text/plain; charset=UTF-8

Don't use github archives which are regenerated from time to time.

On Wed, Nov 2, 2016 at 7:10 AM, Andrea Galbusera <gizero@gmail.com> wrote:

> libiio is a C library for interfacing with IIO devices. It abstracts
> the low-level details of the hardware, and provides a simple yet complete
> programming interface.
>
> This recipe provides the following packages:
> * libiio: main package with C library
> * libiio-iiod: user space daemon providing network backend to iio devices
> * libiio-tests: user space test applications using libiio
> * libiio-python: python bindings
> ---
>  meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb | 21
> +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb
>
> diff --git a/meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb
> b/meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb
> new file mode 100644
> index 0000000..8c062b6
> --- /dev/null
> +++ b/meta-oe/recipes-support/libiio/libiio_2015.2-r1.bb
> @@ -0,0 +1,21 @@
> +SUMMARY = "Library for interfacing with IIO devices"
> +HOMEPAGE = "https://wiki.analog.com/resources/tools-software/
> linux-software/libiio"
> +SECTION = "libs"
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING.txt;md5=7c13b3376cea0ce68d2d2da0a1b3a7
> 2c"
> +
> +SRC_URI = "https://github.com/analogdevicesinc/${PN}/archive/${PV}.tar.gz
> "
> +SRC_URI[md5sum] = "fbd6faa9c420659023072eb3c74ed037"
> +SRC_URI[sha256sum] = "b230cfd5ef5550cebf485950d8b1f4
> d5cfa7d5f0814aeb7b44e530e9caecb83a"
> +
> +DEPENDS = "avahi libxml2"
> +
> +inherit cmake pythonnative
> +
> +PACKAGES =+ "${PN}-iiod ${PN}-tests ${PN}-python"
> +
> +RDEPENDS_${PN}-python = "${PN} python-ctypes python-stringold"
> +
> +FILES_${PN}-iiod = "${sbindir}/iiod"
> +FILES_${PN}-tests = "${bindir}"
> +FILES_${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

