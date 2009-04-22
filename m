Received: from [68.230.241.45] (helo=fed1rmmtao101.cox.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <trini@kernel.crashing.org>) id 1LwfI8-0006Nq-Bc
	for openembedded-devel@openembedded.org; Wed, 22 Apr 2009 18:27:20 +0200
Received: from fed1rmimpo03.cox.net ([70.169.32.75]) by fed1rmmtao101.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090422162246.BVTX27308.fed1rmmtao101.cox.net@fed1rmimpo03.cox.net>
	for <openembedded-devel@openembedded.org>;
	Wed, 22 Apr 2009 12:22:46 -0400
Received: from localhost ([68.230.63.214]) by fed1rmimpo03.cox.net with bizsmtp
	id igNl1b00C4dMFYL04gNlVy; Wed, 22 Apr 2009 12:22:45 -0400
X-Authority-Analysis: v=1.0 c=1 a=KarrwNW7oqFZcThUPFMA:9
	a=_VnsRa4Z96GrSgHo6HQA:7 a=MaHt1ymSJMkUmSZBozUggwnEtXUA:4
X-CM-Score: 0.00
Date: Wed, 22 Apr 2009 09:22:45 -0700
From: Tom Rini <trini@kernel.crashing.org>
To: openembedded-devel@openembedded.org
Message-ID: <20090422162245.GR17629@smtp.west.cox.net>
References: <69E6C70090A0A14498CC98FAE5E06B6E3CF763@hiob.intern.dresearch.de>
	<d1b08f940904200836k6374f731h83342aea89c1f14@mail.gmail.com>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF76B@hiob.intern.dresearch.de>
	<200904221249.07359.khimov@altell.ru>
MIME-Version: 1.0
In-Reply-To: <200904221249.07359.khimov@altell.ru>
Organization: Embedded Alley Solutions, Inc
User-Agent: Mutt/1.5.18 (2008-05-17)
Subject: Re: initramfs howto?
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
X-List-Received-Date: Wed, 22 Apr 2009 16:27:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 22, 2009 at 12:49:07PM +0400, Roman I Khimov wrote:
> On Wednesday 22 April 2009 11:45:38 Sledz, Steffen wrote:
> > Both kernels do have associated modules.
> >
> > As i understand OE i have to build two images (for Rootfs-A and Rootfs-B).
> > But ...
> >
> > (a) How do i tell those images which kernels (and as a consequence which
> > modules) are associated with it?
> >
> > (b) How do i build Kernel-B with it's initramfs?
> 
> As I understand it's not possible to build multiple kernels currently in OE, 
> as the packages will be named as "kernel-*" and if versions are the same 
> you'll get something completely unusable. Even if not, you'll need to be very 
> careful to get it working right.

The workaround here (and this was OK for our needs) was that the 2nd
kernel doesn't make any packages, just deploys the final kernel.
Indeed what I posted should be good for (b), with the caveat that you
need to either not use kernel.bbclass or hack out a second
kernel.bbclass that doesn't make any packages.  If you need this kernel
to be put automagically inside the rootfs you'll need to do something
like this in rootfs-a.bb:
ROOTFS_POSTPROCESS_COMMAND += "cp ${DEPLOY_IMG_DIR}/kernelB
${IMAGE_ROOTFS}/boot/"

-- 
Tom Rini


