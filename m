Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id D2BC271A6B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 07:37:17 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id n29so2090106uai.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 00:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=KcSXjZkpiPdSGQ4qMbXw/14m5Ava0cb5vXDV51U09kQ=;
	b=kz95VJBvsjXE9Pdj+5EPNVu7klJEYqmaCJRO52FDh5jgqTTQuxAhC0b8YjqYMSVZKj
	jI2rHId8fT9+J2Kr+4H60GVqmE7fNcS3Tll2FAgYTy6BPM38hI/mMwYO4eiKUm6GQtNA
	5NHuX75a2BvPE7F7z6UMOwgQ4pUWQqWju2MGVhB7YHLH6vV8k2uwId9nAlPiVbYgB+2U
	gfCOrthQLud7t6JIaz9I+EKrl5Erl3BKnmHzp0qRKemVoSIDWDSikMzbWUNmku3jXkzw
	SVsDEK/EUpYjEkvbrN4DpBJXbsFp4bnLaJ1SoQWTh6BYbcFvJWmlwCiuzztNcak/rPf1
	LRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=KcSXjZkpiPdSGQ4qMbXw/14m5Ava0cb5vXDV51U09kQ=;
	b=QZt4ckK98Z/ArtrV9seO1f567RzVfhU3UG3OFab0apdxgf6AaF5jsOLHfIFr0nAShH
	fSiEJSizwnfVjo8iLc1SW7D5fPD6uJxX2/GN1kaZ9ffYZtCywunxkLkMaeG3Ilw64XwZ
	25dw90CVwg/URgZUPQ48P9t+MLCH9XKVPdKehOjUHXmQNF5s8kJ5SPGkCoOgBNUeB4v9
	YGdVHy3uUPWYzf3vtkvh15+GT69uQ7l/UtyXsIi4uaVSotJ+xGg32j58LaTDgxwFTjY2
	oKQ/hADcedR3vzvjzjhzEUGBhqG8x0a8KzC/TVOCVGmMIg67Rz04gNuxACSZXezBxqWY
	VBtg==
X-Gm-Message-State: AHYfb5gIQD3cq3Y0WEjS2hrRLoUCBCqzQRtAMwQga4qoic3lpHiC9NV7
	KSCaG28QJKtlZibdjO+O+DkG9/QDOQ==
X-Received: by 10.176.95.85 with SMTP id z21mr4355248uah.183.1503301038995;
	Mon, 21 Aug 2017 00:37:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.122.88 with HTTP; Mon, 21 Aug 2017 00:37:18 -0700 (PDT)
In-Reply-To: <1502809355.28941.41.camel@linux.intel.com>
References: <20170815050221.16408-1-raj.khem@gmail.com>
	<20170815050221.16408-3-raj.khem@gmail.com>
	<1502809355.28941.41.camel@linux.intel.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 21 Aug 2017 09:37:18 +0200
Message-ID: <CA+chaQf_0oppUihhawyAJyhHJVOKhofweKhV3Yj4nM3fKsdYbA@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 3/3] python-m2crypto: Upgrade to 0.26.0
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
X-List-Received-Date: Mon, 21 Aug 2017 07:37:18 -0000
Content-Type: text/plain; charset="UTF-8"

Fails to build here:
http://errors.yoctoproject.org/Errors/Details/152770/

On Tue, Aug 15, 2017 at 5:02 PM, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> On Mon, 2017-08-14 at 22:02 -0700, Khem Raj wrote:
> > Use proper LICENCE file for LIC_FILES_CHKSUM
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  ...{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} | 13
> +++++--------
> >  1 file changed, 5 insertions(+), 8 deletions(-)
> >  rename meta-python/recipes-devtools/python/{python-m2crypto_0.25.1.bb
> => python-m2crypto_0.26.0.bb} (79%)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-
> m2crypto_0.25.1.bb b/meta-python/recipes-devtools/python/python-
> m2crypto_0.26.0.bb
> > similarity index 79%
> > rename from meta-python/recipes-devtools/python/python-m2crypto_0.25.1.
> bb
> > rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> > index 72523bd7f..446f4d80a 100644
> > --- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> > +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> > @@ -2,12 +2,11 @@ SUMMARY = "A Python crypto and SSL toolkit"
> >  HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
>
> Just tried looking into the HOMEPAGE and seems that it has moved to
>
> https://gitlab.com/m2crypto/m2crypto
>
>
> updating this patch with the above would be the fastest path to change
> this var.
>
>
>
> >
> >  LICENSE = "BSD"
> > -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a
> 60"
> > -
> > -SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
> > -SRC_URI[sha256sum] = "ac303a1881307a51c85ee8b1d87844
> d9866ee823b4fdbc52f7e79187c2d9acef"
> > +LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b99180
> 0e"
> >
> >  SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> "
> > +SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
> > +SRC_URI[sha256sum] = "05d94fd9b2dae2fb8e072819a795f0
> e05d3611b09ea185f68e1630530ec09ae8"
> >
> >  PYPI_PACKAGE = "M2Crypto"
> >  inherit pypi setuptools siteinfo
> > @@ -18,10 +17,8 @@ RDEPENDS_${PN} += "python-typing"
> >  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}
> -I${STAGING_INCDIR}"
> >  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
> >
> > -inherit setuptools
> > -
> > -SWIG_FEATURES_x86-64 = "-D__x86_64__"
> > -SWIG_FEATURES ?= ""
> > +SWIG_FEATURES_append_x86-64 = " -D__x86_64__"
> > +SWIG_FEATURES = "-ignoremissing"
> >  export SWIG_FEATURES
> >
> >  # Get around a problem with swig, but only if the
> > --
> > 2.14.1
> >
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

