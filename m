Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P11X0-00046G-Hs
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 20:37:31 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9I003KKUDOXQY2@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Wed,
	29 Sep 2010 13:37:02 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id B258D14AF64; Wed,
	29 Sep 2010 14:37:00 -0400 (EDT)
Date: Wed, 29 Sep 2010 14:37:00 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100929183700.GB27217@denix.org>
References: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] kernel NOTE messages fix
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
X-List-Received-Date: Wed, 29 Sep 2010 18:37:32 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 28, 2010 at 06:39:42PM +0200, Frans Meulenbroeks wrote:
> Dear all,
> 
> 3) copy the files directly from the work area to staging. That way
> there are no unpackaged files in image/ so no NOTE messages.
> Additional advantage is that it is faster as we save the copy to the image dir.
> 
> The following patch makes (3) happen:
> 
> diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
> index 5f8bc8a..05ddcc1 100644
> --- a/classes/kernel.bbclass
> +++ b/classes/kernel.bbclass
> @@ -121,7 +121,12 @@ kernel_do_install() {
>                  oe_runmake SUBDIRS="scripts/genksyms"
>          fi
> 
> -       kerneldir=${D}/kernel/
> +
> +}
> +
> +sysroot_stage_all_append() {
> +
> +        kerneldir=${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
> 
>         if [ -e include/asm ] ; then
>                 # This link is generated only in kernel before
> 2.6.33-rc1, don't stage it for newer kernels
> @@ -197,12 +202,7 @@ kernel_do_install() {
>         install -m 0644 System.map $kerneldir/System.map-${KERNEL_VERSION}
>         [ -e Module.symvers ] && install -m 0644 Module.symvers $kerneldir/
> 
> -       cp -fR scripts $kerneldir/
> -}
> -
> -sysroot_stage_all_append() {
> -       sysroot_stage_dir ${D}/kernel ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}

BTW, won't this patch break packaged-staging? Has anyone tried rebuilding from 
pstage after this fix?

> -       cp -fpPR ${D}/kernel/.config ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
> +       cp -fR scripts $kerneldir/
>  }
> 
>  kernel_do_configure() {

-- 
Denys


