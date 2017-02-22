Return-Path: <amarnath.valluri@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2F67C73145
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 15:02:53 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 22 Feb 2017 07:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51307356"
Received: from irdmzpr05.ir.intel.com (HELO [163.33.54.155]) ([163.33.54.155])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 07:02:54 -0800
To: openembedded-devel@lists.openembedded.org
References: <1486559272-23031-1-git-send-email-amarnath.valluri@intel.com>
From: Amarnath Valluri <amarnath.valluri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <3ac9f990-0ffa-83bd-db26-46d3e8fd0dce@intel.com>
Date: Wed, 22 Feb 2017 17:03:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486559272-23031-1-git-send-email-amarnath.valluri@intel.com>
Subject: Re: [meta-oe] xf86-input-tslib: Replace 'lib' with ${nonarch_base_libdir} for placing udev rules.
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
X-List-Received-Date: Wed, 22 Feb 2017 15:02:54 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping - reminder request for feedback

On 08.02.2017 15:07, Amarnath Valluri wrote:
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>   meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
> index 082c771..6a3689a 100644
> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-input-tslib_0.0.6.bb
> @@ -28,8 +28,8 @@ do_configure_prepend() {
>   do_install_append() {
>       install -d ${D}/${datadir}/hal/fdi/policy/20thirdparty
>       install -m 0644 ${WORKDIR}/10-x11-input-tslib.fdi ${D}/${datadir}/hal/fdi/policy/20thirdparty
> -    install -d ${D}/lib/udev/rules.d
> -    install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}/lib/udev/rules.d/
> +    install -d ${D}${nonarch_base_libdir}/udev/rules.d
> +    install -m 0644 ${WORKDIR}/99-xf86-input-tslib.rules ${D}${nonarch_base_libdir}/udev/rules.d/
>   }
>   
> -FILES_${PN} += "${datadir}/hal /lib/udev"
> +FILES_${PN} += "${datadir}/hal ${nonarch_base_libdir}/udev"


