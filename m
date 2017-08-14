Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id D103C60670
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Aug 2017 19:03:09 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 14 Aug 2017 12:03:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,374,1498546800"; d="scan'208";a="1162530745"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.134])
	by orsmga001.jf.intel.com with ESMTP; 14 Aug 2017 12:03:10 -0700
Message-ID: <1502737915.28941.16.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Joe Slater <jslater@windriver.com>
Date: Mon, 14 Aug 2017 14:11:55 -0500
In-Reply-To: <20170814185147.236052-1-jslater@windriver.com>
References: <20170814185147.236052-1-jslater@windriver.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-core][PATCH 1/1] php: move to version 7.1.8 from 7.1.7
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
X-List-Received-Date: Mon, 14 Aug 2017 19:03:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-08-14 at 11:51 -0700, Joe Slater wrote:
> Only change is source version.
> 
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  .../{php-7.1.7 => php-7.1.8}/0001-Specify-tag-with-libtool.patch    | 0
>  .../{php-7.1.7 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch | 0
>  meta-oe/recipes-devtools/php/{php_7.1.7.bb => php_7.1.8.bb}         | 6 ++++--
>  3 files changed, 4 insertions(+), 2 deletions(-)
>  rename meta-oe/recipes-devtools/php/{php-7.1.7 => php-7.1.8}/0001-Specify-tag-with-libtool.patch (100%)
>  rename meta-oe/recipes-devtools/php/{php-7.1.7 => php-7.1.8}/change-AC_TRY_RUN-to-AC_TRY_LINK.patch (100%)
>  rename meta-oe/recipes-devtools/php/{php_7.1.7.bb => php_7.1.8.bb} (65%)
> 
> diff --git a/meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch b/meta-oe/recipes-devtools/php/php-7.1.8/0001-Specify-tag-with-libtool.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/php/php-7.1.7/0001-Specify-tag-with-libtool.patch
> rename to meta-oe/recipes-devtools/php/php-7.1.8/0001-Specify-tag-with-libtool.patch
> diff --git a/meta-oe/recipes-devtools/php/php-7.1.7/change-AC_TRY_RUN-to-AC_TRY_LINK.patch b/meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> similarity index 100%
> rename from meta-oe/recipes-devtools/php/php-7.1.7/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> rename to meta-oe/recipes-devtools/php/php-7.1.8/change-AC_TRY_RUN-to-AC_TRY_LINK.patch
> diff --git a/meta-oe/recipes-devtools/php/php_7.1.7.bb b/meta-oe/recipes-devtools/php/php_7.1.8.bb
> similarity index 65%
> rename from meta-oe/recipes-devtools/php/php_7.1.7.bb
> rename to meta-oe/recipes-devtools/php/php_7.1.8.bb
> index ebf9237..fd51dcf 100644
> --- a/meta-oe/recipes-devtools/php/php_7.1.7.bb
> +++ b/meta-oe/recipes-devtools/php/php_7.1.8.bb
> @@ -5,8 +5,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c0af599f66d0461c5837c695fcbc5c1e"
>  SRC_URI += "file://change-AC_TRY_RUN-to-AC_TRY_LINK.patch \
>              file://0001-Specify-tag-with-libtool.patch \
>             "
> -SRC_URI[md5sum] = "22e11a372f99afbbbf3f46a31e8a82ca"
> -SRC_URI[sha256sum] = "079b6792987f38dc485f92258c04f9e02dedd593f9d260ebe725343f812d1ff8"
> +SRC_URI[md5sum] = "d22451dc20bbdf4b8bb656dc787c2a36"
> +SRC_URI[sha256sum] = "7064a00a9450565190890c7a4be04e646e0be73b2e0f8c46ae34419f343ca2f8"
> +#SRC_URI[md5sum] = "22e11a372f99afbbbf3f46a31e8a82ca"
> +#SRC_URI[sha256sum] = "079b6792987f38dc485f92258c04f9e02dedd593f9d260ebe725343f812d1ff8"
>  

I believe the comments were left by mistake....



>  PACKAGECONFIG[mysql] = "--with-mysqli=${STAGING_BINDIR_CROSS}/mysql_config \
>                          --with-pdo-mysql=${STAGING_BINDIR_CROSS}/mysql_config \
> -- 
> 2.7.4
> 



