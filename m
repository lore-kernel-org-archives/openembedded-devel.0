Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id BEB8173211
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 15:14:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id i5so3429683wmg.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Aug 2016 08:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=4y7XOF6P/qSpQvgbHJ1PhSCAK734qVcpojExI9LZ63I=;
	b=Dutfe5fuUqMWdI4WOhWB5sJH3PHnpiS501RqdAlVwGCpnFWiHQig7Tl+76ecyggxhK
	N/kfuaaB0ZNIR4jSDor5kQEtmrHF9wuTvsjjM8NEhlUFxiQUsz/EVk+i1aP+6DlkTLho
	6tfKuHTewmzn3KxpRPwEFUmliUZmkrU338g/mihne8fTS7OuBSt/41ZhzTe+JSfB4Ds6
	JzFv8B9ApF1gEdXhfau2stE/COjAqV+LfBf22F4EMzArU0x5zxV0GpLLJGlK12OYQ6Fq
	KmuWnXKUR0P7zM311Pxo4/OjByeaK3UXm/bc9zJQD1pEe4T32S63IWYCZ2NZYWKrEqPr
	A2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=4y7XOF6P/qSpQvgbHJ1PhSCAK734qVcpojExI9LZ63I=;
	b=AOkQiwtIyxyjMIpfG89mWBMbyF5oDrjfZLMgkxCSJTFRIi0BNfsw55joBmPvXSzY25
	FUiXupJxy6xh0kJJiLwcxS0Qya9aqGgCqHeiQ9SLrr798fMAgGieztfR3xRGYdo4L23B
	GzuDXMIOb1tPs6OANLUG9RSXjmnkcRHSCOmqS58CR5pPB6oV11itN+lDqLXsKSd0YRiw
	oLOSXp4JHrmdexhmovHulUUU/+FFrj/58PJvRKT5X5qPr1mbmCATHIbZhSbmx3QI0GmK
	TIsYC3QJR3JwhC0Yhxq12qb/P51k/t5FbH0ZXDfeOgwgoSeN2jP3eeEQZlm+dcy1A+84
	ALNw==
X-Gm-Message-State: AEkoousYFYKmH5Fhl8q+Kyzg8yevlmVaCZBYlC+ZhZ5Xd2i3fxAgQzzlnH1i/GhGwsh8UHneIMLACvTzgDRzug==
X-Received: by 10.25.228.205 with SMTP id x74mr2638703lfi.10.1471014899666;
	Fri, 12 Aug 2016 08:14:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.87.12 with HTTP; Fri, 12 Aug 2016 08:14:58 -0700 (PDT)
In-Reply-To: <1471014662-28320-1-git-send-email-derek@asterius.io>
References: <1471014662-28320-1-git-send-email-derek@asterius.io>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Fri, 12 Aug 2016 17:14:58 +0200
Message-ID: <CA+chaQdgy+PsJQ7d=KCvuHP6K3=52DzNN-Jbtz4hPBqLAe6psA@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH] gd: update to version 2.2.3
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
X-List-Received-Date: Fri, 12 Aug 2016 15:15:00 -0000
Content-Type: text/plain; charset=UTF-8

Does it autodetect libvpx now or was vpx removed in upstream version?

On Fri, Aug 12, 2016 at 5:11 PM, Derek Straka <derek@asterius.io> wrote:

> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  .../gd/files/fix-gcc-unused-functions.patch        | 43
> ++++++++++++++++++++++
>  .../gd/{gd_2.1.1.bb => gd_2.2.3.bb}                | 11 +++---
>  2 files changed, 48 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-support/gd/files/fix-gcc-unused-
> functions.patch
>  rename meta-oe/recipes-support/gd/{gd_2.1.1.bb => gd_2.2.3.bb} (82%)
>
> diff --git a/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
> b/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
> new file mode 100644
> index 0000000..02cb5ad
> --- /dev/null
> +++ b/meta-oe/recipes-support/gd/files/fix-gcc-unused-functions.patch
> @@ -0,0 +1,43 @@
> +gdft.c: remove functions that cause warnings about being unused
> +
> +Upstream-Status: Backport (Fixed in master branch)
> +
> +Signed-off-by: Derek Straka <derek@asterius.io>
> +--- git/src/gdft.c.orig        2016-08-12 10:20:41.418440091 -0400
> ++++ git/src/gdft.c     2016-08-12 10:22:34.226442987 -0400
> +@@ -139,16 +139,6 @@
> + }
> + #else
> +
> +-#ifndef HAVE_LIBFONTCONFIG
> +-static char * font_pattern(char **fontpath, char *fontpattern)
> +-{
> +-      (void)fontpath;
> +-      (void)fontpattern;
> +-
> +-      return "libgd was not built with FontConfig support\n";
> +-}
> +-#endif /* HAVE_LIBFONTCONFIG */
> +-
> + #include "gdcache.h"
> + /* 2.0.16 Christophe Thomas: starting with FreeType 2.1.6, this is
> +   mandatory, and it has been supported for a long while. */
> +@@ -446,16 +436,15 @@
> +       return (strcmp (a->fontlist, b->fontlist) == 0 && a->flags ==
> b->flags);
> + }
> +
> ++#ifdef HAVE_LIBFONTCONFIG
> + static int useFontConfig(int flag)
> + {
> +-#ifdef HAVE_LIBFONTCONFIG
> +       if (fontConfigFlag) {
> +               return (!(flag & gdFTEX_FONTPATHNAME));
> +       }
> +-#endif
> +       return flag & gdFTEX_FONTCONFIG;
> + }
> +-
> ++#endif
> + static void *
> + fontFetch (char **error, void *key)
> + {
> diff --git a/meta-oe/recipes-support/gd/gd_2.1.1.bb
> b/meta-oe/recipes-support/gd/gd_2.2.3.bb
> similarity index 82%
> rename from meta-oe/recipes-support/gd/gd_2.1.1.bb
> rename to meta-oe/recipes-support/gd/gd_2.2.3.bb
> index 85c7e6a..74e265e 100644
> --- a/meta-oe/recipes-support/gd/gd_2.1.1.bb
> +++ b/meta-oe/recipes-support/gd/gd_2.2.3.bb
> @@ -12,12 +12,12 @@ LICENSE = "GD"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=c97638cafd3581eb87abd37332137669"
>  DEPENDS = "freetype libpng jpeg zlib tiff"
>
> -SRC_URI = "https://bitbucket.org/libgd/gd-libgd/downloads/libgd-${PV}
> .tar.bz2 \
> -"
> -SRC_URI[md5sum] = "d3f1a992ac9c550ebc6da89c147f89af"
> -SRC_URI[sha256sum] = "895ea9c6fcab187b0a908ae3e9e6b0
> 6423756f8a643d362349b0caab4014bd0d"
> +SRC_URI = "git://github.com/libgd/libgd.git;branch=GD-2.2 \
> +           file://fix-gcc-unused-functions.patch"
>
> -S = "${WORKDIR}/libgd-${PV}"
> +SRCREV = "46ceef5970bf3a847ff61d1bdde7501d66c11d0c"
> +
> +S = "${WORKDIR}/git"
>
>  inherit autotools binconfig gettext pkgconfig
>
> @@ -27,7 +27,6 @@ EXTRA_OECONF += " --disable-rpath \
>                    --without-fontconfig \
>                    --without-xpm \
>                    --without-x \
> -                  --without-vpx \
>                  "
>
>  EXTRA_OEMAKE = 'LDFLAGS="${LDFLAGS}"'
> --
> 1.9.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

