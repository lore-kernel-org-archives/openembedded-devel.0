Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79Jd-0004VX-F6
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:41:17 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ600D5CU8AOJA0@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:38:46 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2C1B214AF5B; Tue,
	05 Apr 2011 12:38:34 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:38:34 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405163834.GB7168@denix.org>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 1/5] linux-omap4: Add support for am45x-evm machine
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
X-List-Received-Date: Tue, 05 Apr 2011 16:41:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 10:41:47AM -0500, Chase Maupin wrote:
> * Add the am45x-evm machine type to the COMPATIBLE_MACHINEs
>   for this kernel version.
> * Add the defconfig file for am45x-evm machine type
> 
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Just for prototyping:

Acked-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  .../{omap4430-panda => am45x-evm}/defconfig        |    0
>  recipes/linux/linux-omap4_2.6.35.3.bb              |    2 +-
>  2 files changed, 1 insertions(+), 1 deletions(-)
>  copy recipes/linux/linux-omap4/{omap4430-panda => am45x-evm}/defconfig (100%)
> 
> diff --git a/recipes/linux/linux-omap4/omap4430-panda/defconfig b/recipes/linux/linux-omap4/am45x-evm/defconfig
> similarity index 100%
> copy from recipes/linux/linux-omap4/omap4430-panda/defconfig
> copy to recipes/linux/linux-omap4/am45x-evm/defconfig
> diff --git a/recipes/linux/linux-omap4_2.6.35.3.bb b/recipes/linux/linux-omap4_2.6.35.3.bb
> index 0502554..8c41441 100644
> --- a/recipes/linux/linux-omap4_2.6.35.3.bb
> +++ b/recipes/linux/linux-omap4_2.6.35.3.bb
> @@ -1,4 +1,4 @@
> -COMPATIBLE_MACHINE = "omap4430-panda"
> +COMPATIBLE_MACHINE = "omap4430-panda|am45x-evm"
>  
>  require multi-kernel.inc
>  
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


