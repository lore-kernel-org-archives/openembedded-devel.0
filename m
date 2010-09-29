Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P13oO-0004oD-5M
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 23:03:37 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9J007ZG156NU00@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	29 Sep 2010 16:03:12 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id EE0F214AF64; Wed,
	29 Sep 2010 17:03:05 -0400 (EDT)
Date: Wed, 29 Sep 2010 17:03:05 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100929210305.GA28782@denix.org>
References: <1285792798-6529-1-git-send-email-fransmeulenbroeks@gmail.com>
MIME-version: 1.0
In-reply-to: <1285792798-6529-1-git-send-email-fransmeulenbroeks@gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] kernel.bbclass: avoid NOTE messages for files	that are staged but not packaged
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
X-List-Received-Date: Wed, 29 Sep 2010 21:03:37 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Sep 29, 2010 at 10:39:58PM +0200, Frans Meulenbroeks wrote:
> copy the files directly from the work area to staging. That way
> there are no unpackaged files in image/ so no NOTE messages.
> Additional advantage is that it is faster as we save the copy to the image dir.
> 
> See also http://thread.gmane.org/gmane.comp.handhelds.openembedded/37487
> 
> Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> Acked-by: Roman I Khimov <khimov@altell.ru>
> Tested-by: Petr ?tetiar <ynezz@true.cz>
> Acked-by: Eric B?nard <eric@eukrea.com>

Acked-by: Denys Dmytriyenko <denis@denix.org>

> ---
> 
> This is the formal patch, following up the discussion mentioned above
> It really works like a charm. Kernel build time is greatly reduced.
> 
> If there are no objections, and since there are already 2 acks,
> I will push tomorrow my evening (20 hrs or so after posting)
> Feel free to add additional acks.
> 
> Frans
> 
>  classes/kernel.bbclass |   12 ++++++------
>  1 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 5f8bc8a..cfb4ad8 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -121,7 +121,12 @@ kernel_do_install() {
>                  oe_runmake SUBDIRS="scripts/genksyms"
>          fi
>  
> -	kerneldir=${D}/kernel/
> +
> +}
> +
> +sysroot_stage_all_append() {
> +
> +	kerneldir=${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
>  
>  	if [ -e include/asm ] ; then
>  		# This link is generated only in kernel before 2.6.33-rc1, don't stage it for newer kernels
> @@ -200,11 +205,6 @@ kernel_do_install() {
>  	cp -fR scripts $kerneldir/
>  }
>  
> -sysroot_stage_all_append() {
> -	sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
> -	cp -fpPR ${D}/kernel/.config ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
> -}
> -
>  kernel_do_configure() {
>  	yes '' | oe_runmake oldconfig
>  	if [ ! -z "${INITRAMFS_IMAGE}" ]; then
> -- 
> 1.6.4.2
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


