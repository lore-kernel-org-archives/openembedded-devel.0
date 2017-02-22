Return-Path: <amarnath.valluri@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 70EC573128
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:02:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga104.jf.intel.com with ESMTP; 22 Feb 2017 07:02:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51306919"
Received: from irdmzpr05.ir.intel.com (HELO [163.33.54.155]) ([163.33.54.155])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 07:02:06 -0800
References: <1486559284-23081-1-git-send-email-amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
From: Amarnath Valluri <amarnath.valluri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <eb0664e2-0745-dfa5-7c5d-8ced33e83b46@intel.com>
Date: Wed, 22 Feb 2017 17:02:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486559284-23081-1-git-send-email-amarnath.valluri@intel.com>
Subject: Re: [meta-oe] libgphoto: Replace 'lib' with ${nonarch_base_libdir}
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
X-List-Received-Date: Wed, 22 Feb 2017 15:02:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping - reminder request for feedback

On 08.02.2017 15:08, Amarnath Valluri wrote:
> Make use of bitbake variable for udev ruls folder. This change makes the recipe
> more portable.
>
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>   meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
> index 098da79..fa07cd3 100644
> --- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
> +++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
> @@ -23,7 +23,7 @@ SRC_URI[libgphoto2.sha256sum] = "031a262e342fae43f724afe66787947ce1fb483277dfe5a
>   
>   inherit autotools pkgconfig gettext lib_package
>   
> -EXTRA_OECONF = " --with-drivers=all udevscriptdir=/lib/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
> +EXTRA_OECONF = " --with-drivers=all udevscriptdir=${nonarch_base_libdir}/udev ac_cv_lib_ltdl_lt_dlcaller_register=yes"
>   
>   PACKAGECONFIG ??= ""
>   PACKAGECONFIG[gd] = ",--without-gdlib,gd"


