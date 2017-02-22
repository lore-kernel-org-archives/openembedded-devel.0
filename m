Return-Path: <amarnath.valluri@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 798E3730F4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Feb 2017 14:50:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP; 22 Feb 2017 06:50:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,194,1484035200"; d="scan'208";a="51301533"
Received: from irdmzpr05.ir.intel.com (HELO [163.33.54.155]) ([163.33.54.155])
	by orsmga002.jf.intel.com with ESMTP; 22 Feb 2017 06:50:01 -0800
References: <1486559235-22891-1-git-send-email-amarnath.valluri@intel.com>
To: openembedded-devel@lists.openembedded.org
From: Amarnath Valluri <amarnath.valluri@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <b907c9eb-e101-bb02-8dc1-1166a9ecd5f8@intel.com>
Date: Wed, 22 Feb 2017 16:50:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <1486559235-22891-1-git-send-email-amarnath.valluri@intel.com>
Subject: Re: [meta-oe] openct: Replace /lib/udev with ${nonarch_base_libdir}/udev.
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
X-List-Received-Date: Wed, 22 Feb 2017 14:50:02 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

ping - reminder request for feedback

On 08.02.2017 15:07, Amarnath Valluri wrote:
> Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
> ---
>   meta-oe/recipes-support/openct/openct_0.6.20.bb | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-oe/recipes-support/openct/openct_0.6.20.bb b/meta-oe/recipes-support/openct/openct_0.6.20.bb
> index d4ad9c1..85ca851 100644
> --- a/meta-oe/recipes-support/openct/openct_0.6.20.bb
> +++ b/meta-oe/recipes-support/openct/openct_0.6.20.bb
> @@ -34,7 +34,7 @@ EXTRA_OECONF=" \
>       --enable-pcsc \
>       --enable-doc \
>       --enable-api-doc \
> -    --with-udev=/lib/udev \
> +    --with-udev=${nonarch_base_libdir}/udev \
>       --with-bundle=${libdir}/pcsc/drivers \
>   "
>   
> @@ -42,7 +42,7 @@ inherit autotools pkgconfig
>   
>   FILES_${PN} += " \
>       ${libdir}/ctapi \
> -    /lib/udev \
> +    ${nonarch_base_libdir}/udev \
>       ${libdir}/openct-ifd.so \
>       ${libdir}/pcsc \
>       /run/openct/status \
> @@ -62,7 +62,7 @@ do_install_append() {
>   do_install () {
>       rm -rf ${D}
>       install -d ${D}/etc
> -    install -dm 755 ${D}/lib/udev
> +    install -dm 755 ${D}${nonarch_base_libdir}/udev
>       # fix up hardcoded paths
>       sed -i -e 's,/etc/,${sysconfdir}/,' -e 's,/usr/sbin/,${sbindir}/,' \
>           ${WORKDIR}/openct.service ${WORKDIR}/openct.init


