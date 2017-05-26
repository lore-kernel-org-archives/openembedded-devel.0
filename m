Return-Path: <gizero@gmail.com>
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by mail.openembedded.org (Postfix) with ESMTP id 9C17D7825A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 May 2017 06:29:41 +0000 (UTC)
Received: by mail-oi0-f68.google.com with SMTP id w10so348183oif.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 May 2017 23:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=BWkIMg7p5qR7qImOmoN08YLqcO64feYcbElCLWWrpGQ=;
	b=t0F/AkznSx55gc8uLMu0WCN1AuBiN97Ky7NrAJochxktQqFiFJStgFytK018U4bfLL
	+uq8BQMee2svmItD3h5QrCwLONQxlcNlWz1pfxhA/aKLVw0PxQuwwuIB8Z0mInqfk/HK
	baievs8FveY+52BXuv/7stQeQ0+onXA8+N4vgUFZesXhBCVaLTtgz9xYYhOha3pBiux/
	jg2MX/dL6L7B8YfE+DPln/SFFYmjDKoh6+Sj5VWjRjdf6A3tgQpkFW1hSthsBc7BxmX5
	BGaINk+2lt4p2NyHnNr7j0gzOAFhJ3pIoeCbAlCIpHjqWja89o+NKnlGW/oPgaWaOhg/
	C3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BWkIMg7p5qR7qImOmoN08YLqcO64feYcbElCLWWrpGQ=;
	b=EqvNUXeG9nUBgbthFuP9eV62AQKk/ysu0qMmIgIXFGWNRAUmuJ0fjztQq1VkoSbTY+
	hH38PiO69O0NBQq54xbOuB6qQP/s32myTofP5tRodlYadino9tEbbttSiwxuUABaHKLV
	1bOLNDKDpOpG2poqCQWQgptxkEn5+4e3d34dBZGc0glstvql3NDImi+FMXtwc7KD+5aV
	2hveSIwR5Kr0htaBfQibUc5zezQh1fQn5d9YrmcbX+KzJmC7ATKYcTf4qfLmLKOAsKAB
	KcegZUjPWy2dy97eigKSSbPHl0Hg2nYIZ8OqBq7n/USlA6sCTWX+CE65s8Ptx9Y1Y0u9
	a6LA==
X-Gm-Message-State: AODbwcB3wNR1m6R3U3irM4QXJj+fkwOIa+H+wuOlWMxhPCACzsE82en4
	9KWf3wzc8IjFM16rDaubmW0wTZjNEEjc75Q=
X-Received: by 10.202.84.86 with SMTP id i83mr168433oib.69.1495780183305; Thu,
	25 May 2017 23:29:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.24.107 with HTTP; Thu, 25 May 2017 23:29:42 -0700 (PDT)
In-Reply-To: <1495779679-26874-1-git-send-email-marek.belisko@open-nandra.com>
References: <1495779679-26874-1-git-send-email-marek.belisko@open-nandra.com>
From: Andrea Galbusera <gizero@gmail.com>
Date: Fri, 26 May 2017 08:29:42 +0200
Message-ID: <CAC+thW0ENBbO+TAG7G5cMLSLryj1V00iU1+bC+zRPbvN0dJpig@mail.gmail.com>
To: Marek Belisko <marek.belisko@open-nandra.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] recipes-support: Move libgpiod to meta-oe directory
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
X-List-Received-Date: Fri, 26 May 2017 06:29:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 26, 2017 at 8:21 AM, Marek Belisko <
marek.belisko@open-nandra.com> wrote:

> Previously it was placed in meta directory which is
> wrong. Move to meta-oe.
>
> Signed-off-by: Marek Belisko <marek.belisko@open-nandra.com>
> ---
>  meta-oe/recipes-support/libgpiod/libgpiod.bb | 30
> ++++++++++++++++++++++++++++
>  meta/recipes-support/libgpiod/libgpiod.bb    | 30
> ----------------------------
>  2 files changed, 30 insertions(+), 30 deletions(-)
>  create mode 100644 meta-oe/recipes-support/libgpiod/libgpiod.bb
>  delete mode 100644 meta/recipes-support/libgpiod/libgpiod.bb
>
> diff --git a/meta-oe/recipes-support/libgpiod/libgpiod.bb
> b/meta-oe/recipes-support/libgpiod/libgpiod.bb
> new file mode 100644
> index 0000000..fe56f7b
> --- /dev/null
> +++ b/meta-oe/recipes-support/libgpiod/libgpiod.bb
> @@ -0,0 +1,30 @@
> +SUMMARY = "C library and tools for interacting with the linux GPIO
> character device"
> +HOMEPAGE = "https://github.com/brgl/libgpiod"
> +
> +LICENSE = "LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
> +
> +UPSTREAM_CHECK_URI = "git://github.com/brgl/libgpiod/releases"
> +
> +SRC_URI = "git://github.com/brgl/libgpiod.git"
> +
> +SRCREV = "7ab5e53b69cce313ba87033a442cabd417f5d895"
> +
> +PV = "0.2+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +SRC_URI[md5sum] = "68f039487e940c15bbfc50a10ab4715b"
> +SRC_URI[sha256sum] = "7d7085d4e9cb811742ca8c5fe03458
> 067efaeaa8abc23968d2e3c56bcc2d2ef8"
> +
> +inherit autotools pkgconfig
> +
> +# enable tools
> +PACKAGECONFIG ?= "tools"
> +
> +PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> +PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
> +
> +PACKAGES += " ${PN}-tools"
> +
> +FILES_${PN}-tools = "${bindir}/*"
> diff --git a/meta/recipes-support/libgpiod/libgpiod.bb
> b/meta/recipes-support/libgpiod/libgpiod.bb
> deleted file mode 100644
> index fe56f7b..0000000
> --- a/meta/recipes-support/libgpiod/libgpiod.bb
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -SUMMARY = "C library and tools for interacting with the linux GPIO
> character device"
> -HOMEPAGE = "https://github.com/brgl/libgpiod"
> -
> -LICENSE = "LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=2caced0b25dfefd4c601d92bd15116de"
> -
> -UPSTREAM_CHECK_URI = "git://github.com/brgl/libgpiod/releases"
> -
> -SRC_URI = "git://github.com/brgl/libgpiod.git"
> -
> -SRCREV = "7ab5e53b69cce313ba87033a442cabd417f5d895"
> -
> -PV = "0.2+git${SRCPV}"
> -
> -S = "${WORKDIR}/git"
> -
> -SRC_URI[md5sum] = "68f039487e940c15bbfc50a10ab4715b"
> -SRC_URI[sha256sum] = "7d7085d4e9cb811742ca8c5fe03458
> 067efaeaa8abc23968d2e3c56bcc2d2ef8"
> -
> -inherit autotools pkgconfig
> -
> -# enable tools
> -PACKAGECONFIG ?= "tools"
> -
> -PACKAGECONFIG[tests] = "--enable-tests,--disable-tests,kmod udev"
> -PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,"
> -
> -PACKAGES += " ${PN}-tools"
> -
> -FILES_${PN}-tools = "${bindir}/*"
> --
> 2.7.4
>
>
I'm not a maintainer here, but you should probably send v2 with -M to
detect renames (see
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/README)

