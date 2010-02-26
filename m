Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nl5aC-00063V-IW
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 20:10:40 +0100
Received: by fg-out-1718.google.com with SMTP id e21so86382fga.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 11:07:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=tGicZlB5a8TEkTy1SsW/Md0ldKnNdGnrUgN1cDtCsq0=;
	b=tqZEfJWe+PWF4AvrvcFPdbXYXpYAC9Bz3zn8K/1G7U5g2BYwD0c8tBBr1KXiVRrCwD
	0vHBeRdrXhwspcXzgYcxTKIbvx+HzE7jfZj6zKGr2pSPoVLNs1ZX0aGmlsKYKH1fOTO4
	H7J1JhMHwKc/513gRAz9uFqrQnuic43n9Hdks=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=NYpSL0mFuaAteWcBtfyyGFW1AXAomcElFNJH6RPP08QSpCpiERmBgzbkGizVnJilfh
	McP/In0R93pE1+mdilfGtIRBk/j8lsUuyQXjfFCrW2y7WS/Wng+zI8MDshmhqfOiqXN1
	NoAgDsYQKyOtPyl5aCKjp685Bc1zBLCKgQ3k0=
Received: by 10.87.58.19 with SMTP id l19mr1650632fgk.43.1267211275315;
	Fri, 26 Feb 2010 11:07:55 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm355494fxm.12.2010.02.26.11.07.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 11:07:54 -0800 (PST)
Date: Fri, 26 Feb 2010 20:07:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226190759.GF3206@jama>
References: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
	<201002261754.25997.marcin@juszkiewicz.com.pl>
	<1267204061.18176.561.camel@trini-m4400>
	<20100226184854.GA15391@denix.org>
MIME-Version: 1.0
In-Reply-To: <20100226184854.GA15391@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Generating slightly different images for different IMAGE_FSTYPES
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
X-List-Received-Date: Fri, 26 Feb 2010 19:10:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 26, 2010 at 01:48:54PM -0500, Denys Dmytriyenko wrote:
> On Fri, Feb 26, 2010 at 10:07:41AM -0700, Tom Rini wrote:
> > On Fri, 2010-02-26 at 17:54 +0100, Marcin Juszkiewicz wrote:
> > > Dnia pi??tek, 26 lutego 2010 o 17:39:16 Martin Jansa napisa??(a):
> > > 
> > > > We're slowly stripping packages not really needed, but it would be
> > > > nice to remove whole /boot with kernel-image.
> > > 
> > > > Is there better way to solve it or should we try harder to save space
> > > >  somewhere else?
> > > 
> > > Learn about ROOTFS_POSTPROCESS_COMMAND variable present in 
> > > classes/rootfs_*.bbclass files. You can use it to launch your function after 
> > > rootfs is populated.
> > > 
> > > So for example your shr-lite-image has drop_kernel_from_boot function in which 
> > > you check "MACHINE==om-gta01" and if it is then "rm -rf /boot/uImage". After 
> > > your function all normal ext2/ubifs/jffs2/tarball images will be created 
> > > without kernel in them.
> > 
> > Or (as there's a number of ways to do this):
> > PACKAGE_REMOVE = "kernel-image-*"
> > ROOTFS_POSTPROCESS_COMMAND_om-gta01 += "opkg-cl ${IPKG_ARGS}
> > -force-depends \
> >                                 remove ${PACKAGE_REMOVE};"
> 
> This worked for me:
> 
> RDEPENDS_kernel-base = ""
> 
> 
> As kernel.bbclass suggests the following:
> 
> # Allow machines to override this dependency if kernel image files are
> # not wanted in images as standard
> RDEPENDS_kernel-base ?= "kernel-image"

That's also for ALL fstypes of that image.

> > > > Problem is that when we're booting on gta01, than /boot/uImage is used
> > > > so it should be installed in .tar.gz image.

ahh I'm missing "booting from uSD on gta01".

So once more and hopefully better:

so with rootfs in NAND, kernel from different NAND partition is used
(and is ignored in /boot on its jffs2/ubi/ubifs rootfs).

with rootfs on some uSD partition, then kernel is used from /boot/uImage
on the same partition

User can choose which rootfs is booting with every reboot and I don't
want to force every user to modify/reflash bootloader.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


