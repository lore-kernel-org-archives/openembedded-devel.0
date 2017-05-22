Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id DA8C377F74
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 May 2017 01:48:51 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id b84so13794504wmh.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 May 2017 18:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/4B5JFx312kFjHFvuQjf9YYKnHBgZahYyKkj828Bh0I=;
	b=mOkE6AXAZGmjzUGRgF6QcEMlNVsZrKqxFnOXOVocUrrXlGGVgKZcTQOtbpTv0v0jGR
	tIPM9OLJYbyCMhu4rtZhDdBQF9i81wJjdlVwqoybzuKBqlVr+N0f0lbTqWV1AgIL0Z5s
	KBdaLqOQkwwFYhROcBUbvsbha8tK4/CF8BKlNSpAlI+Ou1ybdwDZhinCjyS0xUzbkjwn
	rVIaLBjENbaAFUzQwqs3eeQ/d7XfsDbPLWav6gziaVM6KId93odHJwELRpyVUzOCHo4g
	Xs9iaThxPYwqdlQGq3PWhrmBLaKchzKwnYFDZ6JFE7K1kNVad3IovrQkaPIMLPTdkBiJ
	DKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/4B5JFx312kFjHFvuQjf9YYKnHBgZahYyKkj828Bh0I=;
	b=b1aU81CzhOVDFzJxpE5lAn90HCl54vjKhcqBjGYaoRPKxZZgMZRk2IITiHHEYky/Vg
	Xs0bOASRPpi5qOXuUk5lyTgvKMu60oHFJUPAA3L/19ffD8Qn0ibcVz+/A0AqAdxPxiDS
	p8wTmRibmpK3sCytR3jXgd7Q1kcY5bZDmrxm9yzWbRpklPbbblCwsxtvcoQF7MtWTMlw
	4YoAUfvlgvlTG/QJpPGAd9aqhyYjYZyGmSBv5yQSQq/mBEqPKrTaIlt4x9/9+CTWt3Ky
	DQ8I9+yPsN6q6fg9+BTMsM7XJqff5j6KfFCKFijpNEJylQCatbx+vfPfCpM+ZD4oFSfl
	Wuvw==
X-Gm-Message-State: AODbwcDvCA1GCmoIVYeiZ5WC1XhWOaacDc6vB12EbKJ/99Gd0t4l7jWr
	IJ6lIuei7ncoOieuFaFrd4X1k4vaKw==
X-Received: by 10.80.147.195 with SMTP id o61mr15337928eda.178.1495417732251; 
	Sun, 21 May 2017 18:48:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Sun, 21 May 2017 18:48:21 -0700 (PDT)
In-Reply-To: <1495390919-25435-1-git-send-email-maryan.pricak@gmail.com>
References: <1495390919-25435-1-git-send-email-maryan.pricak@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 21 May 2017 18:48:21 -0700
Message-ID: <CAMKF1spDgUYVyRGcBKNmJhb35H5_VjGi0JkLyGboKeU8YkPb-g@mail.gmail.com>
To: Marian Pritsak <maryan.pricak@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libteam: Initial support
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
X-List-Received-Date: Mon, 22 May 2017 01:48:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, May 21, 2017 at 11:21 AM, Marian Pritsak
<maryan.pricak@gmail.com> wrote:
> libteam is a library for controlling team network device.
> Provides utils package for network device configuration.
>
> Signed-off-by: Marian Pritsak <maryan.pricak@gmail.com>
> ---
>  meta-oe/recipes-support/libteam/libteam_1.26.bb | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libteam/libteam_1.26.bb
>
> diff --git a/meta-oe/recipes-support/libteam/libteam_1.26.bb b/meta-oe/recipes-support/libteam/libteam_1.26.bb
> new file mode 100644
> index 0000000..db1e4a9
> --- /dev/null
> +++ b/meta-oe/recipes-support/libteam/libteam_1.26.bb
> @@ -0,0 +1,33 @@
> +SUMMARY = "Library for controlling team network device"
> +HOMEPAGE = "http://www.libteam.org/"
> +SECTION = "libs/network"
> +
> +PE = "1"

Drop this if this package is new.

> +
> +LICENSE = "LGPLv2.1"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +
> +DEPENDS = "libnl libdaemon jansson"
> +${PN}-utils_RDEPENDS = "bash"

this looks reversed may be you meant RDEPENDS_${PN}-utils

> +
> +SRC_URI = "git://github.com/jpirko/libteam"
> +SRCREV = "8c1cea00a21950089058e4e33ea1f7bf4deaddeb"
> +
> +SRC_URI[md5sum] = "565114d70c41bff6093d8e57be284e8a"
> +SRC_URI[sha256sum] = "d65286379141db141bea33424ec0507bb0f827a0bf03d9c65004bb593e3d5545"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> +
> +FILES_${PN} = "${libdir}/libteam.so.*"
> +
> +PACKAGES += "${PN}dctl ${PN}-utils"

calling it ${PN}-dctl will make it more readable,

> +FILES_${PN}dctl = "${libdir}/libteamdctl.so.* \
> +"
> +FILES_${PN}-utils = "${bindir}/bond2team \
> +                     ${bindir}/teamd \
> +                     ${bindir}/teamdctl \
> +                     ${bindir}/teamnl \
> +"
> +
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

