Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P12jb-0007om-IX
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 21:54:36 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9I00EIXXXFOVQ4@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	29 Sep 2010 14:53:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C038314AF64; Wed,
	29 Sep 2010 15:53:38 -0400 (EDT)
Date: Wed, 29 Sep 2010 15:53:38 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100929195338.GC27217@denix.org>
References: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1285781858-5299-1-git-send-email-chase.maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCHv2] am-benchmarks: update to latest version
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
X-List-Received-Date: Wed, 29 Sep 2010 19:54:36 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 29, 2010 at 12:37:38PM -0500, Chase Maupin wrote:
> * Updated the SRCREV to the latest version of this project
>   which includes support for multiple platforms.
> * Add COMPATIBLE_MACHINE setting for recipe.
> 
> Signed-off-by: Chase Maupin <chase.maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/ti/am-benchmarks_svn.bb |   13 ++++++++++---
>  1 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_svn.bb
> index 51ac6af..6ab29f5 100644
> --- a/recipes/ti/am-benchmarks_svn.bb
> +++ b/recipes/ti/am-benchmarks_svn.bb
> @@ -4,15 +4,22 @@ LICENSE = "BSD"
>  SECTION = "system"
>  PRIORITY = "optional"
>  
> -SRCREV = "33"
> -PV = "1.0"
> +SRCREV = "56"
> +PV = "1.1"
>  PR = "r1+svnr${SRCPV}"
>  
> +COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
> +
> +ARCHITECTURE_dm365 = "arm9"
> +ARCHITECTURE_omapl138 = "arm9"
> +ARCHITECTURE_omap3 = "cortex-a8"
> +ARCHITECTURE_ti816x = "cortex-a8"
> +
>  INSANE_SKIP_${PN} = "True"
>  
>  SRC_URI = "svn://gforge.ti.com/svn/am_benchmarks/;module=trunk;proto=https;user=anonymous;pswd=''"
>  
> -S = "${WORKDIR}/trunk"
> +S = "${WORKDIR}/trunk/${ARCHITECTURE}"
>  
>  do_compile() {
>  	# don't build debug version
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


