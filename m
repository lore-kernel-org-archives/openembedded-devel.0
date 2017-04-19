Return-Path: <maxin.john@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 3A1A171B99
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Apr 2017 12:00:57 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga105.jf.intel.com with ESMTP; 19 Apr 2017 05:00:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,221,1488873600"; d="scan'208";a="250978348"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2017 05:00:57 -0700
Date: Wed, 19 Apr 2017 15:01:15 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: liu.ming50@gmail.com
Message-ID: <20170419120115.GA31735@mbabyjoh-desk.ger.corp.intel.com>
References: <1492574374-9290-1-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1492574374-9290-1-git-send-email-liu.ming50@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] openjdk-8-cross.inc: tweak PACKAGECONFIG default value
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
X-List-Received-Date: Wed, 19 Apr 2017 12:00:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Apr 19, 2017 at 05:59:34AM +0200, liu.ming50@gmail.com wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> When x11, cups, alsa is being set in DISTRO_FEATURES, the users might
> expect openjdk build with the related options as well. For instance,
> they might be confused when the openjdk is still built as headless but
> x11 is actually enabled from system aspect.
> 
> With this patch, the end users still can choose build openjdk without
> these options by overriding PACKAGECONFIG.
>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  recipes-core/openjdk/openjdk-8-cross.inc | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/recipes-core/openjdk/openjdk-8-cross.inc b/recipes-core/openjdk/openjdk-8-cross.inc
> index 47fe35d..34e1de4 100644
> --- a/recipes-core/openjdk/openjdk-8-cross.inc
> +++ b/recipes-core/openjdk/openjdk-8-cross.inc
> @@ -16,6 +16,13 @@ PRIVATE_LIBS = "\
>  "

Please remove this line:

>  PACKAGECONFIG ??= "repack"
> +PACKAGECONFIG ?? = " \
> +    repack \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'cups', 'cups', '', d)} \

Is "cups" a valid distro feature in any reference distributions ? 

> +    ${@bb.utils.contains('DISTRO_FEATURES', 'alsa', 'alsa', '', d)} \
> +"
> +
>  PACKAGECONFIG[x11] = "--with-x,,libx11 xproto libxt libxext libxrender"
>  PACKAGECONFIG[cups] = "--with-cups,,cups"
>  PACKAGECONFIG[alsa] = "--with-alsa,,alsa-lib-native"

Best Regards,
Maxin

