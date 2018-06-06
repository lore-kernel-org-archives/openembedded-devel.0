Return-Path: <prvs=688da1830=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id D36FA6212C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Jun 2018 09:57:42 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,482,1520895600"; d="scan'208";a="10703410"
To: <openembedded-devel@lists.openembedded.org>
References: <20180510160956.85938-1-jason.wessel@windriver.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <6bf492f0-0f73-4b58-5eab-70f5213f0963@skidata.com>
Date: Wed, 6 Jun 2018 11:57:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180510160956.85938-1-jason.wessel@windriver.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java][PATCH] icetea7, openjdk-8: Fix depenency to xproto -> xorgproto
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
X-List-Received-Date: Wed, 06 Jun 2018 09:57:43 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Reviewed-by: Richard Leitner <richard.leitner@skidata.com>
and
Tested-by: Richard Leitner <richard.leitner@skidata.com>

Please take this patch as otherwise the build fails with oe-core's
current master.

regards;Richard.L

On 05/10/2018 06:09 PM, Jason Wessel wrote:
> The latest oe-core has changed the X protocol header provider package
> name.
> 
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc  | 2 +-
>  recipes-core/openjdk/openjdk-8-cross.inc  | 2 +-
>  recipes-core/openjdk/openjdk-8-native.inc | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index d4cf7ac..2c9fa92 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -12,7 +12,7 @@ DEPENDS = "virtual/javac-native virtual/java-native classpath-native \
>            "
>  
>  PACKAGECONFIG ??= ""
> -PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xproto-native libxt-native libxext-native libxrender-native"
> +PACKAGECONFIG[x11] = ",--disable-headful,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
>  
>  OEMAKE_BUILD_HEADLESS_ONLY = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', 'BUILD_HEADLESS_ONLY=1', d)}"
>  CFLAGS_append = "${@bb.utils.contains('PACKAGECONFIG', 'x11', '', ' -DHEADLESS=true', d)}"
> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
> index d70c946..46f13fd 100644
> --- a/recipes-core/openjdk/openjdk-8-cross.inc
> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> @@ -21,7 +21,7 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
>      gif jpeg png zlib \
>  "
> -PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender libxtst"
> +PACKAGECONFIG[x11] = "--with-x,,libx11 xorgproto libxt libxext libxrender libxtst"
>  PACKAGECONFIG[cups] = "--with-cups,,cups"
>  PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib"
>  
> diff --git a/recipes-core/openjdk/openjdk-8-native.inc b/recipes-core/openjdk/openjdk-8-native.inc
> index d674474..b782c32 100644
> --- a/recipes-core/openjdk/openjdk-8-native.inc
> +++ b/recipes-core/openjdk/openjdk-8-native.inc
> @@ -10,7 +10,7 @@ DEPENDS = "\
>  SRC_URI_append += "file://handle_extra_output.patch"
>  
>  PACKAGECONFIG ??= "gif jpeg png zlib"
> -PACKAGECONFIG[x11] = "--with-x,,libx11-native xproto-native libxt-native libxext-native libxrender-native"
> +PACKAGECONFIG[x11] = "--with-x,,libx11-native xorgproto-native libxt-native libxext-native libxrender-native"
>  PACKAGECONFIG[cups] = "--with-cups,,cups"
>  PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"
>  PACKAGECONFIG[gif] = "--with-giflib=system,--with-giflib=bundled,giflib-native"
> 

