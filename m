Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 829EC6EFBE
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 00:07:31 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id as1so919458iec.31
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 16:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=90QXo+c4TaHf+4IJaHNOTznmBFYCsp9JyuL725Xyv0c=;
	b=PVvB1BKZItWNaA1vcuq6ysl4A68t0KXkOOa+5j2/x3cWD7h8wmJ8+vIUj9+k5xl3mQ
	06WZ8PgHVO4el7zQBne3RGw94D8+RiiLbH3NkphEYbghkrQ7T03TdBmarsWHKPmqxSmO
	hkpUNWlDJ1+5E/+4M2Z1mwOjZUAAoZLDay0O3Kxvzc1GZzeRxabLQqokwEjSDm/lUO0M
	JiULfL+uZcQRDiGTk4RvBrAJh7tiIRk7ChIiXl6cAB/sU1ILmr94cEgPd37LFV2l23xO
	+X830K5WLn26QRgj4w7PC60vRqxrYyEGBWX8Kuqq/7sHYEprT/373MUpxTw1rm3N9YrI
	FfBg==
X-Received: by 10.50.20.100 with SMTP id m4mr2596143ige.17.1393459652468; Wed,
	26 Feb 2014 16:07:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.224.137 with HTTP; Wed, 26 Feb 2014 16:07:01 -0800 (PST)
In-Reply-To: <1393456501-30516-2-git-send-email-Martin.Jansa@gmail.com>
References: <1393456501-30516-1-git-send-email-Martin.Jansa@gmail.com>
	<1393456501-30516-2-git-send-email-Martin.Jansa@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Feb 2014 16:07:01 -0800
Message-ID: <CAMKF1spDft7cojVXq0Q7mtmDNTdXTsr-5A1nGVxAYUJVHN6eKw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] ode: upgrade to 0.13
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 27 Feb 2014 00:07:37 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Feb 26, 2014 at 3:15 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  meta-oe/recipes-support/ode/ode_0.13.bb | 27 +++++++++++++++++++++++++++
>  meta-oe/recipes-support/ode/ode_0.9.bb  | 28 ----------------------------
>  2 files changed, 27 insertions(+), 28 deletions(-)
>  create mode 100644 meta-oe/recipes-support/ode/ode_0.13.bb
>  delete mode 100644 meta-oe/recipes-support/ode/ode_0.9.bb
>

git format-patch -M please

> diff --git a/meta-oe/recipes-support/ode/ode_0.13.bb b/meta-oe/recipes-support/ode/ode_0.13.bb
> new file mode 100644
> index 0000000..8e9eb15
> --- /dev/null
> +++ b/meta-oe/recipes-support/ode/ode_0.13.bb
> @@ -0,0 +1,27 @@
> +SUMMARY = "ODE is an Open Source Physics Engine"
> +SECTION = "libs"
> +HOMEPAGE = "http://www.ode.org"
> +LICENSE = "LGPLv2.1 & BSD"
> +LIC_FILES_CHKSUM = " \
> +    file://COPYING;md5=1de906ee96808d9776dd72a5f9a79a22 \
> +    file://LICENSE.TXT;md5=771782cb6245c7fbbe74bc0ec059beff \
> +"
> +# LICENSE-BSD.TXT is missing in 0.13 tarball, but COPYING still says it's dual licensed
> +# and svn repo still contains LICENSE-BSD.TXT so maybe it will return in next tarball

can this be added as a patch ?

> +# file://LICENSE-BSD.TXT;md5=c74e6304a772117e059458fb9763a928
> +
> +
> +SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-${PV}.tar.bz2"
> +SRC_URI[md5sum] = "04b32c9645c147e18caff7a597a19f84"
> +SRC_URI[sha256sum] = "34ce3e236e313bf109a0cb5546d2fca462aed99f29a42e62bc1463b803c31ef9"
> +
> +inherit autotools binconfig
> +
> +EXTRA_OECONF = "--disable-demos --enable-soname"
> +
> +FILES_${PN} = "${libdir}/lib*${SOLIBS}"
> +
> +PACKAGECONFIG ?= ""
> +# if it isn't explicitly selected and "$build_os" == "$target_os", then configure will run
> +# series of AC_TRY_RUN which won't work for cross-compilation and configure fails
> +PACKAGECONFIG[double-precision] = "--enable-double-precision,--disable-double-precision"
> diff --git a/meta-oe/recipes-support/ode/ode_0.9.bb b/meta-oe/recipes-support/ode/ode_0.9.bb
> deleted file mode 100644
> index 8b9955e..0000000
> --- a/meta-oe/recipes-support/ode/ode_0.9.bb
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -SUMMARY = "ODE is an Open Source Physics Engine"
> -SECTION = "libs"
> -HOMEPAGE = "http://www.ode.org"
> -LICENSE = "LGPLv2.1 & BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE-BSD.TXT;md5=c74e6304a772117e059458fb9763a928 \
> -                    file://LICENSE.TXT;md5=771782cb6245c7fbbe74bc0ec059beff"
> -
> -
> -SRC_URI = "${SOURCEFORGE_MIRROR}/opende/ode-src-${PV}.zip \
> -           file://install.patch"
> -
> -SRC_URI[md5sum] = "4c03759b76a0649a6d5108c8e172e1e4"
> -SRC_URI[sha256sum] = "460d0851b743b1f144ef2a8259004d6774504c95d08e9357a96a296111496feb"
> -
> -inherit autotools binconfig
> -
> -EXTRA_OECONF = "--disable-demos --enable-soname"
> -
> -do_configure_append() {
> -    echo "#define dInfinity DBL_MAX" >>include/ode/config.h
> -}
> -
> -FILES_${PN} = "${libdir}/lib*${SOLIBS}"
> -
> -PACKAGECONFIG ?= ""
> -# if it isn't explicitly selected and "$build_os" == "$target_os", then configure will run
> -# series of AC_TRY_RUN which won't work for cross-compilation and configure fails
> -PACKAGECONFIG[double-precision] = "--enable-double-precision,--disable-double-precision"
> --
> 1.9.0
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

