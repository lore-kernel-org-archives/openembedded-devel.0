Return-Path: <martin.jansa@gmail.com>
Received: from mail-ua0-f172.google.com (mail-ua0-f172.google.com
	[209.85.217.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6626D60616
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 09:05:27 +0000 (UTC)
Received: by mail-ua0-f172.google.com with SMTP id g11so15299551uah.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Aug 2017 02:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GdoSqAVCLLcceljkI6IB8HC6kHMat9EUKVEUpwOXAMA=;
	b=rZfRkA3AEK2Eg+ijLgxw2zIjvo6/DLZ9JG6VRzvYIBDYHGPRsFaYmQ+hN5Jw4e+8AI
	k7GD3kJ98CtWkIGfsVA+siEvOv9Fg+Nftqoweef6B/jYFzM05Gj5wKWHVrG6DUCZfCNq
	tjXb/N0iCj+v0AoxEl5g1/jgE3I0pqKk5eEd2K4yS74jbeoNmKaM0rue3q06mIunGruY
	gWHUendbXTxNOtur6fHK/AYsOCwbzvFQQPGaIr44/pyh1sLaK0fKyGyG0PHF4brUGk5P
	VhAzlpb9qIdsozjp/ORyzyfwMgmsaLgBFXNMQx3hQRjNvaWSKhnC7K7smKLmCo9EhzFU
	JtOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GdoSqAVCLLcceljkI6IB8HC6kHMat9EUKVEUpwOXAMA=;
	b=n0mwnkoDBgdmxWpTSbONsey/e7BXrqisCVwFtu6EkulkKdBXoHbrqu6wxjIxsoWnZL
	GDCR5NpeyNL+NjhAJby7ef/FpwzFeaBrVMDKSo7+W+6RNVJaVELFxNaVPEg3B37GSv4D
	p4LWvzATwzTdvDkb5MBnLUekQyDLJlFKSsOUQiWmk62BX00Lo+/zAN60RwX7JWeR8Gc1
	D2PiCcy7Yn82mwKYqO7pr/SFGrqBFG6OSsFl1qYSefcOFeQLIDsKrBhUeOa0UdkWMwXN
	GVkqAg2MRmUGn4/MwruyMCRbpKcTeIsSbAwUsDgFXxrAVWQ22kSTOIA4bV53pwv5MIIb
	Ajpg==
X-Gm-Message-State: AHYfb5gRSRbOAfWG1eoYPyjH1xYoRiIcrGJRbMC12IMpXQ8pyjAMCzJ6
	vfIiMHi/h1GM4c0GPTbIij0wjtfi0Q==
X-Received: by 10.176.16.227 with SMTP id x35mr3726151uab.191.1503911129378;
	Mon, 28 Aug 2017 02:05:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.50.144 with HTTP; Mon, 28 Aug 2017 02:05:28 -0700 (PDT)
In-Reply-To: <20170823015319.8326-1-raj.khem@gmail.com>
References: <20170823015319.8326-1-raj.khem@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 28 Aug 2017 11:05:28 +0200
Message-ID: <CA+chaQd6sBfeGX-Py8zn1PLNg4HGEdn78=nFRKUFbXpMxcgafw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH V2] python-m2crypto: Upgrade to 0.26.0
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
X-List-Received-Date: Mon, 28 Aug 2017 09:05:28 -0000
Content-Type: text/plain; charset="UTF-8"

Unfortunately still fails to build:

http://errors.yoctoproject.org/Errors/Details/154230/

On Wed, Aug 23, 2017 at 3:53 AM, Khem Raj <raj.khem@gmail.com> wrote:

> Use proper LICENCE file for LIC_FILES_CHKSUM
> Update homepage to point to gitlab
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} | 13
> ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-m2crypto_0.25.1.bb =>
> python-m2crypto_0.26.0.bb} (72%)
>
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> similarity index 72%
> rename from meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> index 72523bd7f..1a5be8e2c 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> @@ -1,13 +1,12 @@
>  SUMMARY = "A Python crypto and SSL toolkit"
> -HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"
> +HOMEPAGE = "https://gitlab.com/m2crypto/m2crypto"
>
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a60"
> -
> -SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
> -SRC_URI[sha256sum] = "ac303a1881307a51c85ee8b1d87844
> d9866ee823b4fdbc52f7e79187c2d9acef"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
>
>  SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch
> "
> +SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
> +SRC_URI[sha256sum] = "05d94fd9b2dae2fb8e072819a795f0
> e05d3611b09ea185f68e1630530ec09ae8"
>
>  PYPI_PACKAGE = "M2Crypto"
>  inherit pypi setuptools siteinfo
> @@ -18,8 +17,6 @@ RDEPENDS_${PN} += "python-typing"
>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}
> -I${STAGING_INCDIR}"
>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
>
> -inherit setuptools
> -
>  SWIG_FEATURES_x86-64 = "-D__x86_64__"
>  SWIG_FEATURES ?= ""
>  export SWIG_FEATURES
> @@ -28,6 +25,8 @@ export SWIG_FEATURES
>  # multilib header file exists.
>  #
>  do_compile_prepend() {
> +    ${CPP} -dM - < /dev/null | grep -v __STDC__ | grep -v
> __REGISTER_PREFIX__ | grep -v __GNUC__ \
> +       | sed 's/^\(#define \([^ ]*\) .*\)$/#undef \2\n\1/' >
> SWIG/gcc_macros.h
>      if [ "${SITEINFO_BITS}" = "64" ];then
>          bit="64"
>      else
> --
> 2.14.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

