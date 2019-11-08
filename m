Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
	[209.85.160.194])
	by mail.openembedded.org (Postfix) with ESMTP id 69B227F9AE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Nov 2019 18:11:01 +0000 (UTC)
Received: by mail-qt1-f194.google.com with SMTP id u22so7415480qtq.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Nov 2019 10:11:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=aw5Oz3WM/VcIvcvBb8RPOLd2EmCmex0RshM6hhJ6YoU=;
	b=rz3ZcAtHCzbi2UTfPJfB6OV8S5++myFEScFCrO3FKZx4xDquQhthXVJjWPqHJSsBf+
	d7id9mN0SXy9reOr+3dq+uiqjJVb4/a92agloFk1yF/ygC5iM+pLsCo3qtPOY2h2OCi2
	JkR6S+S+Rmf+lbPWqDnggUK4uIldxVFTJqf8WkDCZer6zuLh5LrRv6s7j9Jbhq3Nt06h
	W3uiUczHwkw9y+1JK/HS3bH3+znELGPw3aQIdPA5olVslPySgkhZjkK5iHLfJ0h+ODI+
	kZUCMbSsZ8R5IhaR/yyJYkqXQ+TKXL+PQqFjP7WY7fClJRnapAYhCYA2HAXFvO5IWar1
	yRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=aw5Oz3WM/VcIvcvBb8RPOLd2EmCmex0RshM6hhJ6YoU=;
	b=Of4iAh8CskIilx1fwa6iAylKkqsvHTH9bvjcxQEifhpNQdb3U/THmjFZbV2d+vJDE8
	4t6EmXEowO/z6k91QQckSx2T7myqc6MgnigkgVblz488QQF2GYVb/g1IL7BSHQj2l745
	cN4cWe7IIB7GiS0aPJaIiDXfW/raR8kFzmHnrqN1yl4CkqTYiC4qVYMQYP0lh/imRSWs
	T1qxGyH7R308YpKK2rm1N+FMDwDwNPaIqKIoj/WqKCURmFwwI9Z3mrEw2Vl6utmJ7WKk
	AYv2hJlDRQUoLJwINzTqbimb79SVLZl2s7y0mXVYIXUXWMspqCaddtzvuX+IU0hsiee3
	yvaA==
X-Gm-Message-State: APjAAAWKRGENa8bv/WpfkOC7/DWlOHFJQfNttNGN1q1x/efraMnOYwWU
	X6+TVgBIrw55PwXOT+hguIA0aBK0nFROEhIrrI0=
X-Google-Smtp-Source: APXvYqzzEyStbO9RUX463LDYMTvhEBEBCVjvN3W+/qVRv+CgmP+2UfkxsIVe9Ocvn0olT7WKpWvo5TEXqe/6c2pgK5U=
X-Received: by 2002:ac8:1415:: with SMTP id k21mr11661441qtj.80.1573236661870; 
	Fri, 08 Nov 2019 10:11:01 -0800 (PST)
MIME-Version: 1.0
References: <20191108091441.25374-1-stefan@agner.ch>
In-Reply-To: <20191108091441.25374-1-stefan@agner.ch>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 8 Nov 2019 10:10:34 -0800
Message-ID: <CAMKF1spuqH_1dTyRy_gPLTVusyiVkxokDZMmPmDStAR=Db0q7A@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Stefan Agner <stefan.agner@toradex.com>
Subject: Re: [meta-oe][PATCH] zstd: move recipe to oe-core
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
X-List-Received-Date: Fri, 08 Nov 2019 18:11:01 -0000
Content-Type: text/plain; charset="UTF-8"

can you ping me when its merged into oe-core

On Fri, Nov 8, 2019 at 1:14 AM Stefan Agner <stefan@agner.ch> wrote:
>
> From: Stefan Agner <stefan.agner@toradex.com>
>
> Move the zstd recipe to openembedded-core and hence remove it in
> meta-oe.
>
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
> ---
>  meta-oe/recipes-extended/zstd/zstd_1.4.4.bb | 35 ---------------------
>  1 file changed, 35 deletions(-)
>  delete mode 100644 meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
>
> diff --git a/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb b/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
> deleted file mode 100644
> index eb201f413..000000000
> --- a/meta-oe/recipes-extended/zstd/zstd_1.4.4.bb
> +++ /dev/null
> @@ -1,35 +0,0 @@
> -SUMMARY = "Zstandard - Fast real-time compression algorithm"
> -DESCRIPTION = "Zstandard is a fast lossless compression algorithm, targeting \
> -real-time compression scenarios at zlib-level and better compression ratios. \
> -It's backed by a very fast entropy stage, provided by Huff0 and FSE library."
> -HOMEPAGE = "http://www.zstd.net/"
> -SECTION = "console/utils"
> -
> -LICENSE = "BSD-3-Clause & GPLv2"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c7f0b161edbe52f5f345a3d1311d0b32 \
> -                    file://COPYING;md5=39bba7d2cf0ba1036f2a6e2be52fe3f0"
> -
> -SRC_URI = "git://github.com/facebook/zstd.git;nobranch=1"
> -
> -SRCREV = "10f0e6993f9d2f682da6d04aa2385b7d53cbb4ee"
> -UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
> -
> -S = "${WORKDIR}/git"
> -
> -PACKAGECONFIG ??= ""
> -PACKAGECONFIG[lz4] = "HAVE_LZ4=1,HAVE_LZ4=0,lz4"
> -PACKAGECONFIG[lzma] = "HAVE_LZMA=1,HAVE_LZMA=0,xz"
> -PACKAGECONFIG[zlib] = "HAVE_ZLIB=1,HAVE_ZLIB=0,zlib"
> -
> -# See programs/README.md for how to use this
> -ZSTD_LEGACY_SUPPORT ??= "4"
> -
> -do_compile () {
> -    oe_runmake ${PACKAGECONFIG_CONFARGS} ZSTD_LEGACY_SUPPORT=${ZSTD_LEGACY_SUPPORT}
> -}
> -
> -do_install () {
> -    oe_runmake install 'DESTDIR=${D}'
> -}
> -
> -BBCLASSEXTEND = "native nativesdk"
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

