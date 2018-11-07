Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id A19DB606D0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 16:39:12 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id d18so6488320qto.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 08:39:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g20SGDhE2Y8eu799QgZPP56gZgXvOC9LXjICa8nhJtg=;
	b=pM2i6Kq6sMz/w2LKIpWvvnvcVb8O8L+KYAiIGy4Ps4efR0N3zXK3q7qOaR5O5CMf1A
	+masVmli0QuJPLPrjQrw7Gshy0lD/1QPbmg1EOWwFXvf/MBzJ+DVNZhzS6fSuTn29Nam
	r5ZKVhlCVA1nkBcMDCZjNtrfhPnzjxQMG/IP/F5tFTwOBaL6lu7eTNXZUVNSVL9ClBG7
	DJ09Ea5A1gJWD1+TWHz5by3A7Hmyd9wsJqaPsHJag2qQiIb2U+GQZnMjfFq3GyAWr4Yc
	cLycmZ4uVqi1DOQYF6LOJzSJBw6yPllqQnGl6/VuqZl2Qq0V3YFgIx/8q3TOMyyoUrHE
	YxVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g20SGDhE2Y8eu799QgZPP56gZgXvOC9LXjICa8nhJtg=;
	b=iCE1M6B2m0Yx0fmpaycDW7JUzGzyhrXwEM7m8gmJsX/PLZBonadFzJV0HYyC2XYvar
	a4fNeqVsDt5JKL1P8T/90vsoW+dBeZ02XveNe8IGAWDc5QvXwDEv2xZX0869RHg8M73T
	OWO+bPbYstdU/r2HHkx5Hmjwq0XU7ex43VKqZUs0GjHdzTHOh99F1WhimxtX6DdvHw4I
	J4szmRzThch7W+Dd457eMpYhfOHCh5iLnUSIZQK2VLvPnkgNr0514aPwKSyWI3DPkcRJ
	mzEWNoealRBePJvKyy2PhNLiOFi11N0YfclfNBETHopw/WL37rlJfDhFnUwOHEn8K2Kx
	rjOQ==
X-Gm-Message-State: AGRZ1gIqjj2Ag++Lp0AowLYCbOfaGO5SVy4HqBs8oxtJo6tMqkEbvUcB
	udIOOyfsSAreT2eqLwr6Lvv6QQOjbc9Ll7T6u9w=
X-Google-Smtp-Source: AJdET5fW5NlRoAB+Kq7XITo2KvmYBjrHj1hrKt1y/PczdPcHSdckrw70og0snwTG97wbYTozauNB26NWkxqgsO72gS4=
X-Received: by 2002:ac8:518d:: with SMTP id c13mr917316qtn.254.1541608753211; 
	Wed, 07 Nov 2018 08:39:13 -0800 (PST)
MIME-Version: 1.0
References: <20181107152652.98604-1-rtie@gmx.de>
In-Reply-To: <20181107152652.98604-1-rtie@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Nov 2018 08:38:46 -0800
Message-ID: <CAMKF1soysT-mzqv3GpSrcwhJFcCkey6xKfVB7cOSqBaa36_oUw@mail.gmail.com>
To: rtie@gmx.de
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] curlpp: Fix packaging and reference to license
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
X-List-Received-Date: Wed, 07 Nov 2018 16:39:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 7, 2018 at 7:32 AM Robert Tiemann <rtie@gmx.de> wrote:
>
> This patch fixes three issues:
>
> 1. The recipe used "libcurlpp" for its package base name. It defined
>   PACKAGES and corresponding package contents manually, but the
>   non-standard naming led to an error message when trying to depend on
>   it (nothing provides curlpp needed by curlpp-dev).
>
>   See also
>   https://lists.yoctoproject.org/pipermail/poky/2018-February/011236.html.
>
>   Fixed by removing PACKAGES and corresponding FILES_*, relying on
>   automatic packaging now.
>
> 2. Upstream ships a license file (MIT), which is referenced by the
>   recipe now (instead of the stock COPYING.MIT file).
>
> 3. There was a do_install_append() function which patched the
>   installed curlpp.pc file. Since it seemed to be of no use, it was
>   removed.
>
> Signed-off-by: Robert Tiemann <rtie@gmx.de>
> ---
>  .../recipes-support/curlpp/curlpp_0.8.1.bb     | 18 ++----------------
>  1 file changed, 2 insertions(+), 16 deletions(-)
>
> diff --git a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> index 340f57dc7..f92cf65cf 100644
> --- a/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> +++ b/meta-networking/recipes-support/curlpp/curlpp_0.8.1.bb
> @@ -2,7 +2,7 @@ SUMMARY = "C++ library for client-side URL transfers"
>  HOMEPAGE = "http://www.curlpp.org/"
>  SECTION = "libdevel"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +LIC_FILES_CHKSUM = "file://doc/LICENSE;md5=fd0c9adf285a69aa3b4faf34384e1029"
>
>  DEPENDS = "curl"
>  DEPENDS_class-native = "curl-native"
> @@ -10,24 +10,10 @@ DEPENDS_class-native = "curl-native"
>  SRC_URI = "git://github.com/jpbarrette/curlpp.git"
>
>  SRCREV = "592552a165cc569dac7674cb7fc9de3dc829906f"
> +PR = "r1"

this is not needed. Please drop it

>
>  S = "${WORKDIR}/git"
>
>  inherit cmake pkgconfig binconfig
>
> -do_install_append () {
> -    sed -i 's,${STAGING_DIR_TARGET},,g' ${D}${libdir}/pkgconfig/curlpp.pc
> -}
> -
> -PACKAGES =+ "libcurlpp libcurlpp-dev libcurlpp-staticdev"
> -
> -FILES_lib${BPN} = "${libdir}/lib*.so.*"
> -
> -FILES_lib${BPN}-dev = "${includedir} \
> -    ${libdir}/pkgconfig \
> -    ${bindir}/*-config \
> -"
> -
> -FILES_lib${BPN}-staticdev = "${libdir}/lib*.a"
> -
>  BBCLASSEXTEND = "native nativesdk"
> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

