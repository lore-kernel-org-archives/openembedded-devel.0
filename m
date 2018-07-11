Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id D66F5771C4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 16:06:50 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id q12-v6so16537238ual.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Jul 2018 09:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=62grORiCe6YMtyeYfdCb0HwsIQkLkWr6jCCihiXAV1I=;
	b=ZMYfwrmBW+fnw/xaCq9OR9Sgtg+9+GTBo73aH368q9PbFa/AE+oHc/RBGQXvCFXPVF
	ejGSSY9qKrvVNpiuiIDwk0U1M4aGZKjj8T0aDDTnFqJrxNEFkml/zoTh2Zw1/GMxVZJW
	No9e1PSheg+I2EUFGcWTdmdtjBFd0vquQjkcQnk6pwLSeKebMavD+msH/WkaXUgQgoLf
	ud+xWfRzH21ylZGdTFeDCKRF84XkdRsJizXY9S0D8DoQfQQ/loOgv2KJSxWTjsXmFXS9
	73QnnpqSgQn3fAfYUu4xFZ9Mqt/InVbYNNfrqvgFwPBpCTQIqFqc5WeNVBk0O4Fx6HcN
	uucA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=62grORiCe6YMtyeYfdCb0HwsIQkLkWr6jCCihiXAV1I=;
	b=Fbx1Ovhkfpggl3s+3SOsEyXfPFDdSm6NrcaoTO2GoXfDTEsFzjFLGX61xZFuhxFFs9
	yooC1IThmSgP7JcAOu+030E2+O62jI/kOJtFDE3ql0dVxvJ1i9drD6wps903gqfGJcj1
	1H3cRc2uhp8LTuGQmdesH6/Qo09ZwpADPGi2KDu2CVdW/1qQvuvm9nxAPKv8axV4eXv7
	ayoUuWqoFQfVCwHg6iaUkVU3Gwcs66myN5fFCClWGL2d2J9MxlTlb5u39fqrJa5z0VAE
	MHN04wcWUSVow8ndsXPdSkM3m8MrSHsWMmR/32cQmhTygbIcqxuETsOM+2H1NpbpHJ2x
	Dl7Q==
X-Gm-Message-State: APt69E3GlQ+v1JEGntWMd3cBig4JKaFixcQweehVeP8Wli31PtMFQX87
	n4g+Kq0XPxOUQn88U174vwDJU/KspH903V4FmrY=
X-Google-Smtp-Source: AAOMgpddnbDeRNJFVbTOoB/beBk6npRkoU+dvy6LjsqO9YdgXhGurYeAsq8ufB3moS0Fsv0wd1kCJQwA5Rm4vcuw1T8=
X-Received: by 2002:ab0:11dd:: with SMTP id
	q29-v6mr18639454uac.191.1531325211453; 
	Wed, 11 Jul 2018 09:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20180710155532.6127-1-krzk@kernel.org>
In-Reply-To: <20180710155532.6127-1-krzk@kernel.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 11 Jul 2018 10:06:25 -0600
Message-ID: <CAMKF1sq2a_uN6s_P=RXes3PYFx=j+zGSzuruK0Kjbga3ct++AQ@mail.gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libkcapi: Add new recipe for v1.1.1
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
X-List-Received-Date: Wed, 11 Jul 2018 16:06:51 -0000
Content-Type: text/plain; charset="UTF-8"

This fails for mips/musl builds

| ../git/lib/kcapi-kernel-if.c: In function '__kcapi_common_getinfo.isra.2':
| ../git/lib/kcapi-kernel-if.c:632:3: error: 'strncpy' output
truncated before terminating nul copying as many bytes from a string
as its length [-Werror=stringop-truncation]
|    strncpy(req.cru.cru_name, ciphername, strlen(ciphername));
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| ../git/lib/kcapi-kernel-if.c:629:3: error: 'strncpy' output
truncated before terminating nul copying as many bytes from a string
as its length [-Werror=stringop-truncation]
|    strncpy(req.cru.cru_driver_name, ciphername,
|    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|     strlen(ciphername));
|     ~~~~~~~~~~~~~~~~~~~
| cc1: all warnings being treated as errors
| make: *** [lib/libkcapi_la-kcapi-kernel-if.lo] Error 1
On Tue, Jul 10, 2018 at 9:56 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Add new recipe with libkcapi v1.1.1, Linux Kernel Crypto API User Space
> Interface Library.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
>
> diff --git a/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> new file mode 100644
> index 000000000000..be25d6e390ea
> --- /dev/null
> +++ b/meta-oe/recipes-crypto/libkcapi/libkcapi_git.bb
> @@ -0,0 +1,24 @@
> +SUMMARY = "Linux Kernel Crypto API User Space Interface Library"
> +HOMEPAGE = "http://www.chronox.de/libkcapi.html"
> +LICENSE = "BSD | GPL-2.0"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=d0421cf231423bda10cea691b613e866"
> +
> +DEPENDS = "libtool"
> +
> +S = "${WORKDIR}/git"
> +# Use v1.1.1 with changes on top for building in OE
> +SRCREV = "342b50fc9225a991c224126c13c188ad9f1ef9f9"
> +PV = "1.1.1+git${SRCPV}"
> +SRC_URI = "git://github.com/smuellerDD/libkcapi.git"
> +
> +inherit autotools
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[testapp] = "--enable-kcapi-test,,,"
> +PACKAGECONFIG[apps] = "--enable-kcapi-speed --enable-kcapi-hasher --enable-kcapi-rngapp --enable-kcapi-encapp --enable-kcapi-dgstapp,,,"
> +
> +do_install_append() {
> +    # bindir contains testapp and apps.  However it is always created, even
> +    # when no binaries are installed (empty bin_PROGRAMS in Makefile.am),
> +    rmdir --ignore-fail-on-non-empty ${D}${bindir}
> +}
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

