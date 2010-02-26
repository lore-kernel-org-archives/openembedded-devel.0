Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nl45t-00032f-Pk
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Feb 2010 18:35:19 +0100
Received: by fxm20 with SMTP id 20so315133fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Feb 2010 09:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=oBPufYkSNp1Y9iINVMocF3yCmjfY3UavYvFLb54uDfg=;
	b=JJoioEvc+oND20zb3vCaPmlTURsI2R5VTVocIU+fY453RWXyjFPCFQCB1thSOmBvaw
	Cf7sL+tdEw/ikcjAa7o01clneSYPael60pF/Dp79CtRx77g8zeaJv9nobVB4M2Vf3QXt
	t314gD8exsn9cVesRVyQ+048EIv/GmNmpmvnc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=mpc3UAmdQNSgdZisSTIe3Xc4CexTiSiwkoWzriC25SoVuC7GuO38Sws9PGNFSPapYw
	GKAjZfZ8bmhqInLGccgK35FD/Ra8cgJZJsXiuTHleFxLYQWSKF2UsS0/6U0b/La0o3IM
	tCtlUxEU5YjlDnNeRIL8WFE2lRsaJZfhvknA8=
Received: by 10.87.73.15 with SMTP id a15mr1418422fgl.50.1267205550720;
	Fri, 26 Feb 2010 09:32:30 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm278913fxm.12.2010.02.26.09.32.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 26 Feb 2010 09:32:29 -0800 (PST)
Date: Fri, 26 Feb 2010 18:32:34 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100226173234.GD3206@jama>
References: <1267202357-8614-1-git-send-email-Martin.Jansa@gmail.com>
	<201002261754.25997.marcin@juszkiewicz.com.pl>
	<1267204061.18176.561.camel@trini-m4400>
	<20100226171447.GC3206@jama>
	<1267204808.18176.573.camel@trini-m4400>
MIME-Version: 1.0
In-Reply-To: <1267204808.18176.573.camel@trini-m4400>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
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
X-List-Received-Date: Fri, 26 Feb 2010 17:35:19 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Feb 26, 2010 at 10:20:08AM -0700, Tom Rini wrote:
> On Fri, 2010-02-26 at 18:14 +0100, Martin Jansa wrote:
> > On Fri, Feb 26, 2010 at 10:07:41AM -0700, Tom Rini wrote:
> > > On Fri, 2010-02-26 at 17:54 +0100, Marcin Juszkiewicz wrote:
> > > > Dnia piątek, 26 lutego 2010 o 17:39:16 Martin Jansa napisał(a):
> > > > 
> > > > > We're slowly stripping packages not really needed, but it would be
> > > > > nice to remove whole /boot with kernel-image.
> > > > 
> > > > > Is there better way to solve it or should we try harder to save space
> > > > >  somewhere else?
> > > > 
> > > > Learn about ROOTFS_POSTPROCESS_COMMAND variable present in 
> > > > classes/rootfs_*.bbclass files. You can use it to launch your function after 
> > > > rootfs is populated.
> > > > 
> > > > So for example your shr-lite-image has drop_kernel_from_boot function in which 
> > > > you check "MACHINE==om-gta01" and if it is then "rm -rf /boot/uImage". After 
> > > > your function all normal ext2/ubifs/jffs2/tarball images will be created 
> > > > without kernel in them.
> > > 
> > > Or (as there's a number of ways to do this):
> > > PACKAGE_REMOVE = "kernel-image-*"
> > > ROOTFS_POSTPROCESS_COMMAND_om-gta01 += "opkg-cl ${IPKG_ARGS}
> > > -force-depends \
> > >                                 remove ${PACKAGE_REMOVE};"
> > 
> > This removes it from ALL FSTYPEs... not just jffs2/ubi/ubifs
> 
> I would strongly argue (especially after my last email) that you either
> always want a kernel in your rootfs, because it's actually booted from,
> or you never do and it's just wasting space (and just not critically so
> on other devices).

OK so more info:

Qi (alternative bootloader) usually used on om-gta02 (because it safer
to reflash it there with u-boot still as fail-safe in NOR)
looks for kernel on first partitions on uSD in /boot, then it loads
kernel from specified (different than rootfs) partition in nand and pass
right rootfs params. Qi doesn't read jffs2 (because nobody really needed
it so much to implement it).

u-boot env shipped with device by default looks for kernel in nand and
in menu is option to load kernel from first small fat32 partition on uSD
and rootfs in second partition.

I know that I can change flash layout/u-boot env (and I would do it on
my om-gta01 if I had one :)), but I'm trying to make smaller images
without forcing gta users to mess with their bootloader/flash layout.

As I don't even have gta01 (gta02 has bigger flash), than I can say that 
I'll wait for someone else to do it, or someone can sort out which icons 
are not realy needed in image and remove them instead of unused kernel
(which is as useless as not used icons but harder to remove).

Kind regards,

I really appreciate your comments/advise (if it looks different).

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


