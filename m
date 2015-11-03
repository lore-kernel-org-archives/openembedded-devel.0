Return-Path: <maxin.john@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B35EA770F2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Nov 2015 10:27:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 03 Nov 2015 02:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,238,1444719600"; d="scan'208";a="593106683"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Nov 2015 02:27:14 -0800
Date: Tue, 3 Nov 2015 12:27:44 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151103102744.GA16939@mbabyjoh-mobl.fi.intel.com>
References: <3F727BA6-C621-4D43-877C-2AF940A47CE0@gmail.com>
MIME-Version: 1.0
In-Reply-To: <3F727BA6-C621-4D43-877C-2AF940A47CE0@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH] cacao: fix configure error
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
X-List-Received-Date: Tue, 03 Nov 2015 10:27:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

On Tue, Nov 03, 2015 at 11:15:01AM +0100, Jens Rehsack wrote:
> 
> This patch fixes the nowadays occuring configure error:
>   rm: cannot remove 'src/mm/boehm-gc/ltmain.sh': No such file or directory
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  recipes-core/cacao/cacao_1.6.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/recipes-core/cacao/cacao_1.6.1.bb b/recipes-core/cacao/cacao_1.6.1.bb
> index f88293b..8e212af 100644
> --- a/recipes-core/cacao/cacao_1.6.1.bb
> +++ b/recipes-core/cacao/cacao_1.6.1.bb
> @@ -54,7 +54,7 @@ EXTRA_OECONF = "\
>  do_configure_prepend () {
>      # upgrade m4 macros in source tree
>      libtoolize --force --copy --install
> -    rm  src/mm/boehm-gc/ltmain.sh
> +    rm  -f src/mm/boehm-gc/ltmain.sh
>      mkdir -p src/mm/boehm-gc/m4
>  }
>  
> --

Pushed, Thanks!

Best Regards,
Maxin

