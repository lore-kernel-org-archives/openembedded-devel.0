Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 87D0478D48
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Sep 2018 11:22:25 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id y2-v6so4007165wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Sep 2018 04:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RDmImX3GwNeoX0y5GgmFs4DUIlWw2w89zOdwnZ2KQxM=;
	b=BTqTTJOm42Xz7kf0udzcTS8zISME44H67fXrQ03tnfiVgWVHqfSmXb2ZD0Bq+ECM6T
	Oo4Y+eu6FavH/GbMZk+veqW3A5GRD5d/GqsRLhLlczcg4Q6XeAoaMBJ31XQwSZUlJk3r
	5zctvNofsL0IIgSc3g3/Hv3UtuI2mpV784nmLiGvyDV31lVdwc4fxjdPAK1rYpuXQmW+
	qg52bJVjXLx6CCEpaQ6pic4uUrdmI12ovbTUWWnRVZ8AJzeBA0JiubvKBUjotGFSkD3X
	vvz8bvPe0sAvP4b7Bk+eQcMHAk5/NDmR1jNkPqu7tYF8rFA6aUC5xzuG8g47K81SG7zi
	2IHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RDmImX3GwNeoX0y5GgmFs4DUIlWw2w89zOdwnZ2KQxM=;
	b=RpOnVnRnsOrlJV8S9hitmE7CgQl8ZwqgR+GEDaEu6IhGaTm6WQ6z1wLeAlBaTxIm5f
	9GuE2P6i9MEcczocjkRl0Em4C8/emSZIQKvio4RS2nKcCdl2mDL2Adx6tyzwccIoHVzV
	YNVWR8oLhOrcjBhGgbEIHCmP6x+Z20KQdhSIFvameSHXI4cZGK6U6Zf0h+pnJN68z81v
	uvv0ngBtW+7RimBp6EQV4MdjCEurVMyPzi47t1JcEqdrEBdL/AsQxSoLpLGl/2NJydAT
	n26/aGy8cMpD3Hkm++KbCSXYv1lDwwoalDB/LN1WWw8Hdu0K3mwAbuq6S+LgSZ0WoXod
	OAAQ==
X-Gm-Message-State: APzg51D5ugQhrmOKufLe0G1jus5fev0+XJkI7oIPL5OCudR+OchtdyLW
	PotTALlOCRx6EIkMb0dBszVO6VJSLTpBQNKhjq3duDOd
X-Google-Smtp-Source: ANB0Vdb8YghVTp741QE+mmiu0E6EHbi8uhOe4XW9nQrjB1MYfujtKT7ozvtGl9QkYcJ2Ux5v6v0QCWlhLown+4HAHqk=
X-Received: by 2002:a1c:c203:: with SMTP id s3-v6mr2290091wmf.65.1536060146243;
	Tue, 04 Sep 2018 04:22:26 -0700 (PDT)
MIME-Version: 1.0
References: <20180904110908.1105-1-zhe.he@windriver.com>
In-Reply-To: <20180904110908.1105-1-zhe.he@windriver.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 4 Sep 2018 13:22:14 +0200
Message-ID: <CA+chaQf8RHYtDy-hRv0z99EzpaLJBZr-uTNcfQ+kPs8Jsa2wAA@mail.gmail.com>
To: zhe.he@windriver.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking] [PATCH] spice: Upgrade 0.14.0 -> 0.14.1
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
X-List-Received-Date: Tue, 04 Sep 2018 11:22:25 -0000
Content-Type: text/plain; charset="UTF-8"

Wasn't this conflict with jpeglib.h already resolved in:
http://git.openembedded.org/openembedded-core/commit/?id=d1e09cb2521ccb9d02ced2d61abb4034cb04836d
?
it works for me.

On Tue, Sep 4, 2018 at 1:09 PM He Zhe <zhe.he@windriver.com> wrote:

> - Fix the following build error.
>
> ../config.h:65: error: "HAVE_STDLIB_H" redefined [-Werror]
>
> jpeglib.h from libjpeg contains the same definition of HAVE_STDLIB_H
> which is supposed to be overwritten. -Werror changes the warning to
> an error. This patches deletes the definition in jpeglib.h
>
> - Adjust location of spice-common source as new spice asks spice-common
> to be put under "subprojects" directory.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  meta-networking/recipes-support/spice/spice_git.bb | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/meta-networking/recipes-support/spice/spice_git.bb
> b/meta-networking/recipes-support/spice/spice_git.bb
> index 38b8bf306..5c0b2ca2a 100644
> --- a/meta-networking/recipes-support/spice/spice_git.bb
> +++ b/meta-networking/recipes-support/spice/spice_git.bb
> @@ -13,18 +13,19 @@ architectures."
>  LICENSE = "BSD & LGPLv2.1+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
>
> -PV = "0.14.0+git${SRCPV}"
> +PV = "0.14.1+git${SRCPV}"
>
> -SRCREV_spice = "f1050bfc76c9c4146257e087baf74e0b62d7d218"
> -SRCREV_spice-common = "95743f40a2da39e0a19859c305e69e2c99d39e42"
> +SRCREV_spice = "eaa07ef15cfc3bf57a69da2576af66f028787774"
> +SRCREV_spice-common = "6b93b3fce8909b836ef1d1434d191900d8aa00be"
>
>  SRCREV_FORMAT = "spice_spice-common"
>
>  SRC_URI = " \
>      git://anongit.freedesktop.org/spice/spice;name=spice \
> -    git://
> anongit.freedesktop.org/spice/spice-common;destsuffix=git/spice-common;name=spice-common
> \
> +    git://
> anongit.freedesktop.org/spice/spice-common;destsuffix=git/subprojects/spice-common;name=spice-common
> \
>      file://0001-Convert-pthread_t-to-be-numeric.patch \
>  "
> +
>  FOO = "\
>      file://0001-build-allow-separated-src-and-build-dirs.patch \
>  "
> @@ -55,3 +56,7 @@ PACKAGECONFIG[xinerama] =
> "--enable-xinerama,--disable-xinerama,libxinerama,"
>  COMPATIBLE_HOST = '(x86_64|i.86).*-linux'
>
>  BBCLASSEXTEND = "native nativesdk"
> +
> +do_configure_append () {
> +    sed -i -e '/#define HAVE_STDLIB_H/d'
> ${STAGING_DIR_HOST}/usr/include/jconfig.h
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

