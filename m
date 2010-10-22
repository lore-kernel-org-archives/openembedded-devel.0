Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P9QSM-0000EU-M7
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Oct 2010 00:51:27 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LAP009ZWRFZBGX0@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	22 Oct 2010 17:50:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 04B3D14AF64; Fri,
	22 Oct 2010 18:50:22 -0400 (EDT)
Date: Fri, 22 Oct 2010 18:50:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101022225022.GA11514@denix.org>
References: <1287783567-32647-1-git-send-email-raj.khem@gmail.com>
MIME-version: 1.0
In-reply-to: <1287783567-32647-1-git-send-email-raj.khem@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] bitbake.conf: Add one recipe identifying OVERRIDE	based on recipe type
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 22 Oct 2010 22:51:27 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 22, 2010 at 02:39:27PM -0700, Khem Raj wrote:
> It adds an override based on type of recipe
> e.g. recipes ending with usual suffixes like -native -cross, -sdk
> add the same to overrides with out leading '-'
> It also add the same override for BBCLASSEXTEND
> For normal recipes we add 'target' to overrides
> 
> This will give up better control over defining and combining
> recipes into using BBCLASSEXTEND and still have finer control
> if needed. We wont require to have virtclass-xxx overrides
> anymore
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

As discussed on IRC:

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  classes/utils.bbclass |    3 +++
>  conf/bitbake.conf     |    2 ++
>  lib/oe/utils.py       |    8 ++++++++
>  3 files changed, 13 insertions(+), 0 deletions(-)
> 
> diff --git a/classes/utils.bbclass b/classes/utils.bbclass
> index 10d49ce..7c96509 100644
> --- a/classes/utils.bbclass
> +++ b/classes/utils.bbclass
> @@ -36,6 +36,9 @@ def base_both_contain(variable1, variable2, checkvalue, d):
>  def base_prune_suffix(var, suffixes, d):
>      return oe.utils.prune_suffix(var, suffixes, d)
>  
> +def base_get_suffix(var, suffixes, d):
> +    return oe.utils.get_suffix(var, suffixes, d)
> +
>  def oe_filter(f, str, d):
>      return oe.utils.str_filter(f, str, d)
>  
> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
> index 539ab3d..2f3dd6b 100644
> --- a/conf/bitbake.conf
> +++ b/conf/bitbake.conf
> @@ -195,6 +195,8 @@ MACHINE_KERNEL_PR = ""
>  # otherwise it is the same as PN and P
>  SPECIAL_PKGSUFFIX = "-native -cross -initial -intermediate -nativesdk -crosssdk -cross-canadian -sdk"
>  BPN = "${@base_prune_suffix('${PN}', '${SPECIAL_PKGSUFFIX}'.split(), d)}"
> +# Add a _target override so we can do target specific overrides when using BBCLASSEXTEND
> +OVERRIDES_prepend = "${@base_get_suffix('${PN}', '${SPECIAL_PKGSUFFIX}'.split(), d)}:"
>  BP = "${BPN}-${PV}"
>  
>  # Package info.
> diff --git a/lib/oe/utils.py b/lib/oe/utils.py
> index 2169ed2..4822864 100644
> --- a/lib/oe/utils.py
> +++ b/lib/oe/utils.py
> @@ -67,6 +67,14 @@ def prune_suffix(var, suffixes, d):
>              return var.replace(suffix, "")
>      return var
>  
> +def get_suffix(var, suffixes, d):
> +    # See if var ends with any of the suffixes listed and
> +    # if found return it otherwise return "target'
> +    for suffix in suffixes:
> +        if var.endswith(suffix):
> +	    return suffix[1:]
> +    return "target"
> +
>  def str_filter(f, str, d):
>      from re import match
>      return " ".join(filter(lambda x: match(f, x, 0), str.split()))
> -- 
> 1.7.1
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


