Received: from vms173011pub.verizon.net ([206.46.173.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79Jl-0004Yf-VI
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:41:26 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ600J34U8YGGQ1@vms173011.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:38:59 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id CB6F314AF5B; Tue,
	05 Apr 2011 12:38:58 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:38:58 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405163858.GC7168@denix.org>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
	<1302018111-20799-2-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1302018111-20799-2-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 2/5] u-boot: Add support for am45x-evm machine
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
X-List-Received-Date: Tue, 05 Apr 2011 16:41:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 10:41:48AM -0500, Chase Maupin wrote:
> * Added support for the am45x-evm machine type
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  recipes/u-boot/u-boot_git.bb |    7 +++++++
>  1 files changed, 7 insertions(+), 0 deletions(-)
> 
> diff --git a/recipes/u-boot/u-boot_git.bb b/recipes/u-boot/u-boot_git.bb
> index 9c5fa13..2cf5b12 100644
> --- a/recipes/u-boot/u-boot_git.bb
> +++ b/recipes/u-boot/u-boot_git.bb
> @@ -209,6 +209,13 @@ SRCREV_omap4430-panda  = "261733408a27d14590cf3ec6b596461808050e32"
>  PV_omap4430-panda      = "2010.12+${PR}+git${SRCREV}"
>  PE_omap4430-panda      = "1"
>  
> +SRC_URI_am45x-evm = "git://www.sakoman.com/git/u-boot.git;branch=omap4-exp;protocol=git \
> +                          file://fix-break-caused-by-new-binutils.patch \
> +                         "
> +SRCREV_am45x-evm  = "261733408a27d14590cf3ec6b596461808050e32"
> +PV_am45x-evm      = "2010.12+${PR}+git${SRCREV}"
> +PE_am45x-evm      = "1"
> +
>  # DaVinci dm355-evm/dm365-evm/dm6446-evm/dm6467-evm/dm6467t-evm - PSP 3.1.0/3.2.0 (build 35)
>  
>  SRC_URI_dm355-evm    = "git://arago-project.org/git/projects/u-boot-davinci.git;protocol=git;branch=u-boot-davinci-2009.06"
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


