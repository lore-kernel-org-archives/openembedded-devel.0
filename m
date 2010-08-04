Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1OgRie-0004Od-0j
	for openembedded-devel@lists.openembedded.org;
	Wed, 04 Aug 2010 02:20:31 +0200
Received: from gandalf.denix.org ([unknown] [71.255.225.53])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L6L00MR1Q9BLDT0@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	03 Aug 2010 19:20:01 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 7A68814AF60; Tue,
	03 Aug 2010 20:19:59 -0400 (EDT)
Date: Tue, 03 Aug 2010 20:19:59 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100804001959.GF17391@denix.org>
References: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1280872040-31952-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] base.bbclass: add support for SOC_FAMILY in	COMPATIBLE_MACHINES
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
X-List-Received-Date: Wed, 04 Aug 2010 00:20:31 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Aug 03, 2010 at 04:47:20PM -0500, Chase Maupin wrote:
> * Add support for using SOC_FAMILY in the COMPATIBLE_MACHINES
>   setting for a recipe.
> * This will allow recipes to work for entire families of
>   devices without having to maintain/update the compatible
>   devices as new devices are added into a family
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

While SOC_FAMILY feature is relatively new on its own, it was designed and now 
being extensively used with TI machines and corresponding recipes as an 
effective override - e.g. covering many OMAP3-based machines with a single 
VAR_omap3 = "VAL" expression.

> ---
>  classes/base.bbclass |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/base.bbclass b/classes/base.bbclass
> index 1847491..02c7875 100644
> --- a/classes/base.bbclass
> +++ b/classes/base.bbclass
> @@ -389,7 +389,9 @@ python () {
>              import re
>              this_machine = bb.data.getVar('MACHINE', d, 1)
>              if this_machine and not re.match(need_machine, this_machine):
> -                raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
> +                this_soc_family = bb.data.getVar('SOC_FAMILY', d, 1)
> +                if this_soc_family and not re.match(need_machine, this_soc_family):
> +                    raise bb.parse.SkipPackage("incompatible with machine %s" % this_machine)
>  
>          need_target = bb.data.getVar('COMPATIBLE_TARGET_SYS', d, 1)
>          if need_target:
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


