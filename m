Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1HOJYA-000627-6d
	for openembedded-devel@openembedded.org; Mon, 05 Mar 2007 21:12:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l25KCdS6026198;
	Mon, 5 Mar 2007 20:12:39 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25729-08; Mon,  5 Mar 2007 20:12:36 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l25KCVWX026182
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Mon, 5 Mar 2007 20:12:31 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: Harald Welte <laforge@openmoko.org>
In-Reply-To: <20070305111648.GD25845@prithivi.gnumonks.org>
References: <45E6EA03.8040804@dominion.kabel.utwente.nl>
	<20070304221355.GM25845@prithivi.gnumonks.org>
	<45EBF776.3090505@dominion.kabel.utwente.nl>
	<20070305111648.GD25845@prithivi.gnumonks.org>
Date: Mon, 05 Mar 2007 20:12:32 +0000
Message-Id: <1173125552.5842.119.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@openembedded.org>, distro-devel@lists.openmoko.org
Subject: Re: Merging openmoko into OE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 05 Mar 2007 20:12:57 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, 2007-03-05 at 12:16 +0100, Harald Welte wrote:
> On Mon, Mar 05, 2007 at 11:56:54AM +0100, Koen Kooi wrote:
> > > 3) find a cleaner way for the deploy/images directory.  There need to be
> > >    per-release symlinks so that an automatized flashing tool can always
> > >    assume that the current kernel for one release/snapshot/branch has a
> > >    fixed name (can be symlinks). 
> > 
> > Ok, that's not too hard, I recall Richard making a start with that for the zaurus machines.
> 
> yes.  The question is: should we put this into our kernel/uboot recipes,
> or use some modified kernel.bbclass for it?  or implement it as script
> completely outside OE?

I've added this for images with a small change to image.bbclass. It does
require the image type to be equal to the image filename extension which
sometimes isn't the case but usually isn't a problem to arrange.

For kernels, add something like linux-rp.inc has in do_deploy:

rm -f ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin
ln -s ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}.bin ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin

although experience says a relative link like:

cd ${DEPLOY_DIR_IMAGE}/
rm -f ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin
ln -s ${KERNEL_IMAGETYPE}-${PV}-${MACHINE}-${DATETIME}.bin ${DEPLOY_DIR_IMAGE}/${KERNEL_IMAGETYPE}-${MACHINE}.bin

might be better.

There might be other do_deploy methods you need to tweak too but
hopefully you get the idea.

> > >    Also, the statically linked native
> > >    openocd, dfu-util and sjf2410 binaries need to go to a different
> > >    directory.
> > 
> > Rod is looking into proper statical linking. We probably need a DEPLOY_DIR_TOOLS or
> > something where the tools will live.
> 
> DEPLOY_DIR_TOOLS: good.

I've just committed a definition of DEPLOY_DIR_TOOLS to OE.dev. Simply
update anything you want installed to a tools directory to use this
variable instead of DEPLOY_DIR_IMAGE. 

Anyone who really dislikes this can do 
DEPLOY_DIR_TOOLS = "${DEPLOY_DIR}/images" 
in their distro or local.conf ;-).

Cheers,

Richard



