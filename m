Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DE13075CD0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 23 Oct 2015 07:55:09 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Oct 2015 00:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,185,1444719600"; d="scan'208";a="817665327"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga001.fm.intel.com with ESMTP; 23 Oct 2015 00:54:36 -0700
Date: Fri, 23 Oct 2015 10:54:43 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151023075442.GA11357@mbabyjoh-mobl.fi.intel.com>
References: <1445420509-1807-1-git-send-email-erkka.kaaria@intel.com>
MIME-Version: 1.0
In-Reply-To: <1445420509-1807-1-git-send-email-erkka.kaaria@intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] cacao-initial-native: Fix undefined behaviour in gc
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
X-List-Received-Date: Fri, 23 Oct 2015 07:55:11 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Erkka,

On Wed, Oct 21, 2015 at 12:41:49PM +0300, Erkka K‰‰ri‰ wrote:
> Upstream-Status: Backport
> 
> Fixes undefined behaviour in boehm GC used by cacao-initial-native
> as suggested at
> https://github.com/ivmai/bdwgc/commit/16780405c899f01119bc45167122b4242f6b34fb.
> 
> The undefined behaviour at very least causes a segmentation fault during
> classpath-native configure step with Fedora 22.

Thanks for fixing it. Pushed to master.

> Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> ---
>  recipes-core/cacao/cacao-initial-native_0.98.bb    |  1 +
>  ...-0.9.8-initial-fix-gc-undefined-behaviour.patch | 35 ++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
>  create mode 100644 recipes-core/cacao/files/cacao-0.9.8-initial-fix-gc-undefined-behaviour.patch
> 
> diff --git a/recipes-core/cacao/cacao-initial-native_0.98.bb b/recipes-core/cacao/cacao-initial-native_0.98.bb
> index ec7fbdb..2a8ced5 100644
> --- a/recipes-core/cacao/cacao-initial-native_0.98.bb
> +++ b/recipes-core/cacao/cacao-initial-native_0.98.bb
> @@ -14,6 +14,7 @@ SRC_URI = "\
>          http://www.complang.tuwien.ac.at/cacaojvm/download/cacao-${PV}/cacao-${PV}.tar.bz2; \
>          file://cacao-0.98-initial.patch \
>          file://disable_hw_exceptions.patch \
> +        file://cacao-0.9.8-initial-fix-gc-undefined-behaviour.patch \
>          "
>  
>  # libjvm disabled - it would conflict with cacao-native installations
> diff --git a/recipes-core/cacao/files/cacao-0.9.8-initial-fix-gc-undefined-behaviour.patch b/recipes-core/cacao/files/cacao-0.9.8-initial-fix-gc-undefined-behaviour.patch
> new file mode 100644
> index 0000000..ccc35cb
> --- /dev/null
> +++ b/recipes-core/cacao/files/cacao-0.9.8-initial-fix-gc-undefined-behaviour.patch
> @@ -0,0 +1,35 @@
> +Upstream-Status: Backport
> +
> +This fixes undefined behaviour in boehm GC as suggested at
> +https://github.com/ivmai/bdwgc/commit/16780405c899f01119bc45167122b4242f6b34fb.
> +
> +The undefined behaviour at very least causes a segmentation fault during
> +classpath-native configure step.
> +    
> +Signed-off-by: Erkka K‰‰ri‰ <erkka.kaaria@intel.com>
> +
> +--- cacao-0.98/src/mm/boehm-gc/mark_rts.c
> ++++ cacao-0.98/src/mm/boehm-gc/mark_rts.c
> +@@ -371,18 +371,7 @@ ptr_t p;
> + 
> + ptr_t GC_approx_sp()
> + {
> +-    VOLATILE word dummy;
> +-
> +-    dummy = 42;	/* Force stack to grow if necessary.	Otherwise the	*/
> +-    		/* later accesses might cause the kernel to think we're	*/
> +-    		/* doing something wrong.				*/
> +-#   ifdef _MSC_VER
> +-#     pragma warning(disable:4172)
> +-#   endif
> +-    return((ptr_t)(&dummy));
> +-#   ifdef _MSC_VER
> +-#     pragma warning(default:4172)
> +-#   endif
> ++    return __builtin_frame_address(0);
> + }
> + 
> + /*
> +-- 
> +2.1.4
> +
> -- 
> 2.1.4
>

Best Regards,
Maxin

