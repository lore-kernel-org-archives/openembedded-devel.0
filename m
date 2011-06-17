Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1QXhH3-0005bD-5g
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Jun 2011 00:12:21 +0200
Received: from gandalf.denix.org ([unknown] [108.18.140.4])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LMY00I7YG67CV51@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	17 Jun 2011 17:08:37 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D807014AF5D; Fri,
	17 Jun 2011 18:08:31 -0400 (EDT)
Date: Fri, 17 Jun 2011 18:08:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20110617220831.GG29476@denix.org>
References: <1308252543-24363-1-git-send-email-Chase.Maupin@ti.com>
MIME-version: 1.0
In-reply-to: <1308252543-24363-1-git-send-email-Chase.Maupin@ti.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH] kernel bbclass: add the crypto directory to	staging
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
X-List-Received-Date: Fri, 17 Jun 2011 22:12:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Jun 16, 2011 at 02:29:03PM -0500, Chase Maupin wrote:
> * Add the include/crypto directory from the kernel to the list
>   of directories to be staged.
> * This directory contains the cryptodev.h file required by other
>   drivers and applications.
> * Not including this directory leads to build errors of being
>   unable to find the cryptodev.h file.
> 
> Signed-off-by: Greg Turner <gregturner@ti.com>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>

With my OE hat on:

Acked-by: Denys Dmytriyenko <denys@ti.com>

> ---
>  classes/kernel.bbclass |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 8817186..bd7b23f 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -188,7 +188,7 @@ sysroot_stage_all_append() {
>  	mkdir -p $kerneldir/include/asm-generic
>  	cp -fR include/asm-generic/* $kerneldir/include/asm-generic/
>  
> -	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen crypto/ocf; do
> +	for entry in drivers/crypto drivers/media include/generated include/linux include/net include/pcmcia include/media include/acpi include/sound include/video include/scsi include/trace include/mtd include/rdma include/drm include/xen crypto/ocf include/crypto; do
>  		if [ -d $entry ]; then
>  			mkdir -p $kerneldir/$entry
>  			cp -fR $entry/* $kerneldir/$entry/
> -- 
> 1.7.0.4
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


