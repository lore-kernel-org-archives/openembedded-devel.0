Received: from vms173003pub.verizon.net ([206.46.173.3])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1P0dbl-0007vD-Fw
	for openembedded-devel@lists.openembedded.org;
	Tue, 28 Sep 2010 19:04:50 +0200
Received: from gandalf.denix.org ([unknown] [71.255.228.135])
	by vms173003.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L9G00225VF4HGB0@vms173003.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	28 Sep 2010 12:04:17 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 47DE414AF6A; Tue,
	28 Sep 2010 13:04:16 -0400 (EDT)
Date: Tue, 28 Sep 2010 13:04:16 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20100928170416.GD12985@denix.org>
References: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTinMWT7K-h+hH0LvPD119Nxxpitro=f6igQvL7-K@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.3
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
X-List-Received-Date: Tue, 28 Sep 2010 17:04:50 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Tue, Sep 28, 2010 at 06:39:42PM +0200, Frans Meulenbroeks wrote:
> Dear all,
> 
> Earlier today Henning and I (tirggered by ynezz) had a discussion on
> irc on the loooong list of kernel NOTE messages.
> (things like: NOTE: /kernel/arch/arm/mach-at91/at91x40_time.c)
> This was also discussed earlier with Eric Benard (also on irc).
> I promised Henning that I should write a note (pun intended :-) ) to
> the list, and here it is.
> 
> Basically the issue is that kernel.bbclass in kernel_do_install copies
> a lot of files to ${D} so that eventually they end up in staging (this
> copying is done in sysroot_stage_all_append ). These files are not
> added to any package so insane.bbclass (or is it sane.bbclass
> nowadays) barfs about these files.
> The reason these files end up in staging is for building out-of-tree
> kernel modules.

Frans,

Thank you for taking care of this annoyance! I'm personally fine with 
your solution #3, as the simplest and cleanest one.

-- 
Denys


> As it stands we see 3 solutions:
> 
> 1) rm -rf the files in sysroot_stage_all_append after staging them
> issue is that packaging can run in parallel, so in order to do this
> these these two tasks need to be serialized
> 
> 2) add them to kernel-dev. That way the NOTE disappears. However this
> does increase the kernel-dev package size with 90 MB or so.
> Technically it would allow building out-of-kernel modules on the
> target. Then again currently this is not possible and I have never
> heard complaints about it (actually for embedded systems it is often
> not a good plan to build on the target, although with current high end
> systems this becomes more feasible).
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
> -       cp -fpPR ${D}/kernel/.config ${SYSROOT_DESTDIR}${STAGING_KERNEL_DIR}
> +       cp -fR scripts $kerneldir/
>  }
> 
>  kernel_do_configure() {
> 
> I have tested this patch and for me it works fine and building the
> kernel is greatly improved (mostly due to the NOTE messages that are
> not generated, but also partly due to the copying step that is
> avoided, so personally I am quite happy with this one.
> 
> But before committing this patch I'd like to discuss this on the list.
> Your response is appreciated.
> 
> Frans.
> 
> PS: anyone an idea why these NOTE messages take so long time? I must
> say I never timed it, but I heard people say 2 messages/sec, which
> seems quite slow.
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


