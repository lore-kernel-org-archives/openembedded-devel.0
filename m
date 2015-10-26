Return-Path: <maxin.john@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E197C60657
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2015 08:59:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 26 Oct 2015 01:59:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,200,1444719600"; d="scan'208";a="803018407"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 26 Oct 2015 01:59:56 -0700
Date: Mon, 26 Oct 2015 11:00:10 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151026090010.GA6012@mbabyjoh-mobl.fi.intel.com>
References: <1445593801-30173-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1445593801-30173-1-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] icedtea7-native: Fix memory leak when compiled with GCC 5.0+
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 26 Oct 2015 08:59:58 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi,

On Fri, Oct 23, 2015 at 12:50:01PM +0300, Erkka K‰‰ri‰ wrote:
> 
> Hotspot compiler has a bug where signed integers could overflow. This is
> undefined behaviour, and causes massive memory leak when compiled with GCC 5.0+,
> causing the build to fail.
> 
> This is fixed by backporting patch from
> https://bugs.openjdk.java.net/browse/JDK-8078666 where it was fixed by
> Severin Gehwolf.
>

Pushed to master, Thanks!


> Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> ---
> diff --git a/recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-fix-undefined-behaviour.patch b/recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-fix-undefined-behaviour.patch
> new file mode 100644
> index 0000000..56513a0
> --- /dev/null
> +++ b/recipes-core/icedtea/openjdk-7-03b147/icedtea-hotspot-fix-undefined-behaviour.patch
> @@ -0,0 +1,49 @@
> +Upstream-Status: Backport
> +
> +Hotspot compiler has a bug where signed integers could overflow. This is 
> +undefined behaviour, and causes massive memory leak when compiled with GCC 5.0+, 
> +causing the build to fail.
> +
> +This is fixed by backporting patch from 
> +https://bugs.openjdk.java.net/browse/JDK-8078666 where it was fixed by 
> +Severin Gehwolf.
> +
> +Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> +
> +--- openjdk/hotspot/src/share/vm/opto/type.cpp
> ++++ openjdk/hotspot/src/share/vm/opto/type.cpp
> +@@ -1077,11 +1077,11 @@ static int normalize_int_widen( jint lo, jint hi, int w ) {
> +   // Certain normalizations keep us sane when comparing types.
> +   // The 'SMALLINT' covers constants and also CC and its relatives.
> +   if (lo <= hi) {
> +-    if ((juint)(hi - lo) <= SMALLINT)  w = Type::WidenMin;
> +-    if ((juint)(hi - lo) >= max_juint) w = Type::WidenMax; // TypeInt::INT
> ++    if (((juint)hi - lo) <= SMALLINT)  w = Type::WidenMin;
> ++    if (((juint)hi - lo) >= max_juint) w = Type::WidenMax; // TypeInt::INT
> +   } else {
> +-    if ((juint)(lo - hi) <= SMALLINT)  w = Type::WidenMin;
> +-    if ((juint)(lo - hi) >= max_juint) w = Type::WidenMin; // dual TypeInt::INT
> ++    if (((juint)lo - hi) <= SMALLINT)  w = Type::WidenMin;
> ++    if (((juint)lo - hi) >= max_juint) w = Type::WidenMin; // dual TypeInt::INT  
> +   }
> +   return w;
> + }
> +@@ -1332,11 +1332,11 @@ static int normalize_long_widen( jlong lo, jlong hi, int w ) {
> +   // Certain normalizations keep us sane when comparing types.
> +   // The 'SMALLINT' covers constants.
> +   if (lo <= hi) {
> +-    if ((julong)(hi - lo) <= SMALLINT)   w = Type::WidenMin;
> +-    if ((julong)(hi - lo) >= max_julong) w = Type::WidenMax; // TypeLong::LONG
> ++    if (((julong)hi - lo) <= SMALLINT)   w = Type::WidenMin;
> ++    if (((julong)hi - lo) >= max_julong) w = Type::WidenMax; // TypeLong::LONG  
> +   } else {
> +-    if ((julong)(lo - hi) <= SMALLINT)   w = Type::WidenMin;
> +-    if ((julong)(lo - hi) >= max_julong) w = Type::WidenMin; // dual TypeLong::LONG
> ++    if (((julong)lo - hi) <= SMALLINT)   w = Type::WidenMin;
> ++    if (((julong)lo - hi) >= max_julong) w = Type::WidenMin; // dual TypeLong::LONG
> +   }
> +   return w;
> + }
> +-- 
> +2.1.4
> +
> diff --git a/recipes-core/icedtea/openjdk-7-release-03b147.inc b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> index 98266f7..b1cf6e9 100644
> --- a/recipes-core/icedtea/openjdk-7-release-03b147.inc
> +++ b/recipes-core/icedtea/openjdk-7-release-03b147.inc
> @@ -84,6 +84,7 @@ OPENJDK_PATCHES = " \
>  	file://icedtea-change-to-gdb-debug-format.patch;apply=no \
>  	file://icedtea-disable-x11-in-headless.patch;apply=no \
>  	file://icedtea-disable-sun.applet-for-tools-in-headless.patch;apply=no \
> +	file://icedtea-hotspot-fix-undefined-behaviour.patch;apply=no \
>          "
>  
>  OPENJDK_HEADLESS_PATCHES = " \
> @@ -102,5 +103,6 @@ export DISTRIBUTION_PATCHES = " \
>  	patches/icedtea-flags.patch \
>  	patches/icedtea-openjdk-remove-currency-data-generation-expi.patch \
>  	patches/icedtea-change-to-gdb-debug-format.patch \
> +	patches/icedtea-hotspot-fix-undefined-behaviour.patch \
>  	${CLEAN_X11_DISTRIBUTION_PATCH} \
>

Best Regards,
Maxin

