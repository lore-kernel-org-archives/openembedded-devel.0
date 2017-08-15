Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id D89BE78472
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Aug 2017 14:53:47 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 15 Aug 2017 07:53:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,377,1498546800"; d="scan'208";a="139840465"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by fmsmga005.fm.intel.com with ESMTP; 15 Aug 2017 07:53:48 -0700
Message-ID: <1502809355.28941.41.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Khem Raj <raj.khem@gmail.com>
Date: Tue, 15 Aug 2017 10:02:35 -0500
In-Reply-To: <20170815050221.16408-3-raj.khem@gmail.com>
References: <20170815050221.16408-1-raj.khem@gmail.com>
	<20170815050221.16408-3-raj.khem@gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 15 Aug 2017 14:53:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-14 at 22:02 -0700, Khem Raj wrote:
> Use proper LICENCE file for LIC_FILES_CHKSUM
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  ...{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
>  rename meta-python/recipes-devtools/python/{python-m2crypto_0.25.1.bb => python-m2crypto_0.26.0.bb} (79%)
> 
> diff --git a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> similarity index 79%
> rename from meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> rename to meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> index 72523bd7f..446f4d80a 100644
> --- a/meta-python/recipes-devtools/python/python-m2crypto_0.25.1.bb
> +++ b/meta-python/recipes-devtools/python/python-m2crypto_0.26.0.bb
> @@ -2,12 +2,11 @@ SUMMARY = "A Python crypto and SSL toolkit"
>  HOMEPAGE = "http://chandlerproject.org/bin/view/Projects/MeTooCrypto"

Just tried looking into the HOMEPAGE and seems that it has moved to 

https://gitlab.com/m2crypto/m2crypto


updating this patch with the above would be the fastest path to change
this var.



>  
>  LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=95295693f047bb8f76928251a6154a60"
> -
> -SRC_URI[md5sum] = "040234289fbef5bed4029f0f7d1dae35"
> -SRC_URI[sha256sum] = "ac303a1881307a51c85ee8b1d87844d9866ee823b4fdbc52f7e79187c2d9acef"
> +LIC_FILES_CHKSUM = "file://LICENCE;md5=b0e1f0b7d0ce8a62c18b1287b991800e"
>  
>  SRC_URI += "file://0001-setup.py-link-in-sysroot-not-in-host-directories.patch "
> +SRC_URI[md5sum] = "9f02f0b88fbe225cc6ea8680945cafa0"
> +SRC_URI[sha256sum] = "05d94fd9b2dae2fb8e072819a795f0e05d3611b09ea185f68e1630530ec09ae8"
>  
>  PYPI_PACKAGE = "M2Crypto"
>  inherit pypi setuptools siteinfo
> @@ -18,10 +17,8 @@ RDEPENDS_${PN} += "python-typing"
>  DISTUTILS_BUILD_ARGS += "build_ext --openssl=${STAGING_DIR_HOST} -I${STAGING_INCDIR}"
>  DISTUTILS_INSTALL_ARGS += "build_ext --openssl=${STAGING_DIR_HOST}"
>  
> -inherit setuptools
> -
> -SWIG_FEATURES_x86-64 = "-D__x86_64__"
> -SWIG_FEATURES ?= ""
> +SWIG_FEATURES_append_x86-64 = " -D__x86_64__"
> +SWIG_FEATURES = "-ignoremissing"
>  export SWIG_FEATURES
>  
>  # Get around a problem with swig, but only if the
> -- 
> 2.14.1
> 



