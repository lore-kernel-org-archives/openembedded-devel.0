Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2B058605FF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 11:35:51 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 28 Apr 2016 04:35:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="693687063"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 28 Apr 2016 04:35:51 -0700
Date: Thu, 28 Apr 2016 14:35:51 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160428113551.GA28788@mbabyjoh-desk.ger.corp.intel.com>
References: <1461317774-19137-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1461317774-19137-1-git-send-email-jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] icedtea7-native: skip the already-stripped test
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
X-List-Received-Date: Thu, 28 Apr 2016 11:35:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


On Fri, Apr 22, 2016 at 05:36:14PM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> libfreetype.so.6 is copied from STAGING_LIBDIR and
> binaries/libraries in sysroot are already stripped
> since the following commit in oe-core:
> "30f3774 staging: Strip files in sysroot"
> 
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/icedtea/icedtea7-native.inc
> index 0ffe5d5..2dad84d 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -43,6 +43,10 @@ B = "${S}/build"
>  export ALT_FREETYPE_HEADERS_PATH = "${STAGING_INCDIR}/freetype2"
>  export ALT_FREETYPE_LIB_PATH = "${STAGING_LIBDIR}"
>  
> +# libfreetype.so.6 is copied from STAGING_LIBDIR
> +# which is already stripped.
> +INSANE_SKIP_${PN} = "already-stripped"
> +
>  # OpenJDK supports parallel compilation but uses a plain number for this.
>  # In OE we have PARALLEL_MAKE which is the actual option passed to make,
>  # e.g. "-j 4".
> --

Pushed, Thanks!

Best Regards,
Maxin

