Received: from vms173001pub.verizon.net ([206.46.173.1])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P64gz-0001I7-4a
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 19:00:42 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LA800BIIN762561@vms173001.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	13 Oct 2010 11:59:36 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C07A514AF6A; Wed,
	13 Oct 2010 12:59:30 -0400 (EDT)
Date: Wed, 13 Oct 2010 12:59:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101013165930.GC11514@denix.org>
References: <1286978491-13427-1-git-send-email-Chase.Maupin@ti.com>
	<1286978491-13427-3-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1286978491-13427-3-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.1
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 3/5] matrix-gui-e: use INC_PR in versioned recipes
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
X-List-Received-Date: Wed, 13 Oct 2010 17:00:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 13, 2010 at 09:01:29AM -0500, Chase Maupin wrote:
> * Added an INC_PR to the matrix-gui-e.inc file to be used
>   by the individual version recipes.
> * Modified the version recipes to use INC_PR in their PR setting.
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
>  recipes/ti/matrix-gui-e.inc    |    2 ++
>  recipes/ti/matrix-gui-e_1.1.bb |    2 +-
>  recipes/ti/matrix-gui-e_1.2.bb |    2 +-
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/recipes/ti/matrix-gui-e.inc b/recipes/ti/matrix-gui-e.inc
> index 0d0b4bf..86f08b1 100644
> --- a/recipes/ti/matrix-gui-e.inc
> +++ b/recipes/ti/matrix-gui-e.inc
> @@ -4,6 +4,8 @@ LICENSE = "BSD"
>  SECTION = "multimedia"
>  PRIORITY = "optional"
>  
> +INC_PR = "r20"
> +
>  COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
>  
>  PLATFORM_dm365 = "dm365"
> diff --git a/recipes/ti/matrix-gui-e_1.1.bb b/recipes/ti/matrix-gui-e_1.1.bb
> index d6a674f..2b6bd76 100644
> --- a/recipes/ti/matrix-gui-e_1.1.bb
> +++ b/recipes/ti/matrix-gui-e_1.1.bb
> @@ -4,5 +4,5 @@ COMPATIBLE_MACHINE = "(dm365|omapl138|omap3)"
>  
>  SRCREV = "136"
>  PV = "1.1"
> -PR = "r19"
> +PR = "${INC_PR}.0"
>  
> diff --git a/recipes/ti/matrix-gui-e_1.2.bb b/recipes/ti/matrix-gui-e_1.2.bb
> index 461fc7e..5ac2a56 100644
> --- a/recipes/ti/matrix-gui-e_1.2.bb
> +++ b/recipes/ti/matrix-gui-e_1.2.bb
> @@ -2,5 +2,5 @@ require matrix-gui-e.inc
>  
>  SRCREV = "146"
>  PV = "1.2"
> -PR = "r0"
> +PR = "${INC_PR}.0"
>  
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


