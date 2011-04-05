Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1Q79Ia-0004Ps-EU
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 18:40:12 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LJ600KZGU6ZIWB2@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 Apr 2011 11:37:52 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 46F6414AF5B; Tue,
	05 Apr 2011 12:37:47 -0400 (EDT)
Date: Tue, 05 Apr 2011 12:37:47 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110405163747.GA7168@denix.org>
References: <1302018111-20799-1-git-send-email-Chase.Maupin@ti.com>
	<1302018111-20799-5-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1302018111-20799-5-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: Re: [PATCH 5/5] am45x-evm: Add am45x-evm machine configuration
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
X-List-Received-Date: Tue, 05 Apr 2011 16:40:12 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Apr 05, 2011 at 10:41:51AM -0500, Chase Maupin wrote:
> * Added a new machine configuration for the am45x-evm device.
> * This machine currently mimics the omap4430-panda configuration
>   during the prototyping phase but is expected to change as the
>   hardware and software evolves.
> * The am45x-evm machine type is used to allow differentiating
>   software components to be build and packaged (i.e. task lists)
>   as well as to account for differences with the omap4430-panda
>   device in the future.

Chase,

This would have been better explained in a cover letter for all the 5 patches, 
as I was reading through the first 4 and wondering why do you use panda 
remnants, until I got to the 5th one... :)

FYI, there are new repos on arago ready to be populated for linux-am45x and 
u-boot-am45x, so need to switch corresponding recipes in the future...

> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  conf/machine/am45x-evm.conf |   10 ++++++++++
>  1 files changed, 10 insertions(+), 0 deletions(-)
>  create mode 100644 conf/machine/am45x-evm.conf
> 
> diff --git a/conf/machine/am45x-evm.conf b/conf/machine/am45x-evm.conf
> new file mode 100644
> index 0000000..3597d37
> --- /dev/null
> +++ b/conf/machine/am45x-evm.conf
> @@ -0,0 +1,10 @@
> +#@TYPE: Machine
> +#@NAME: AM45X EVM
> +#@DESCRIPTION: Machine configuration for the AM45x EVM
> +
> +# Currently the am45x-evm machine type mimics the panda
> +# machine for its configuration.  This is expected to change
> +# as the hardware and software evolves.  Currently the unique
> +# machine type is used to differentiate software stack being
> +# built for the two devices.
> +require conf/machine/omap4430-panda.conf
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


